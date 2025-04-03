#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

EXPECTED_UID=1000
EXPECTED_GID=1000

dirs=(
  "/media/arr/jellyfin/config"
  "/media/arr/sonarr/tvseries"
  "/media/arr/radarr/movies"
  "/media/arr/bazarr/config"
  "/media/arr/lidarr/config"
  "/media/arr/lidarr/music"
  "/media/arr/readarr/config"
  "/media/arr/readarr/books"
  "/media/arr/radarr/config"
  "/media/arr/sonarr/config"
  "/media/arr/prowlarr/config"
  "/media/arr/qbittorrent/config"
  "/media/arr/qbittorrent/downloads"
)

if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}This script must be run as root${NC}"
   exit 1
fi

echo "=== Checking directories ==="
issues_found=0
fix_all=0

read -p "Do you want to automatically fix all permission issues? (y/n): " auto_fix
if [[ $auto_fix == "y" || $auto_fix == "Y" ]]; then
  fix_all=1
fi

for dir in "${dirs[@]}"; do
  # Check parent directory
  parent_dir=$(dirname "$dir")
  
  if [[ ! -d "$parent_dir" ]]; then
    echo -e "${RED}Parent directory $parent_dir does not exist${NC}"
    if [[ $fix_all -eq 1 ]]; then
      echo -e "Creating parent directory $parent_dir"
      mkdir -p "$parent_dir"
      chown $EXPECTED_UID:$EXPECTED_GID "$parent_dir"
      chmod 775 "$parent_dir"
      echo -e "${GREEN}Created and fixed permissions for $parent_dir${NC}"
    else
      issues_found=$((issues_found+1))
    fi
  fi
  
  # Check if directory exists
  if [[ ! -d "$dir" ]]; then
    echo -e "${YELLOW}Directory $dir does not exist${NC}"
    if [[ $fix_all -eq 1 ]]; then
      echo -e "Creating directory $dir"
      mkdir -p "$dir"
      chown $EXPECTED_UID:$EXPECTED_GID "$dir"
      chmod 775 "$dir"
      echo -e "${GREEN}Created and fixed permissions for $dir${NC}"
    else
      issues_found=$((issues_found+1))
    fi
    continue
  fi
  
  # Get directory owner and group
  dir_info=$(stat -c "%u:%g %a" "$dir")
  dir_uid=$(echo $dir_info | cut -d':' -f1)
  dir_gid=$(echo $dir_info | cut -d':' -f2 | cut -d' ' -f1)
  dir_perms=$(echo $dir_info | cut -d' ' -f2)
  
  # Check ownership
  if [[ $dir_uid -ne $EXPECTED_UID || $dir_gid -ne $EXPECTED_GID ]]; then
    echo -e "${YELLOW}Directory $dir has incorrect ownership: $dir_uid:$dir_gid (expected $EXPECTED_UID:$EXPECTED_GID)${NC}"
    if [[ $fix_all -eq 1 ]]; then
      echo -e "Fixing ownership of $dir"
      chown -R $EXPECTED_UID:$EXPECTED_GID "$dir"
      echo -e "${GREEN}Fixed ownership for $dir${NC}"
    else
      issues_found=$((issues_found+1))
    fi
  fi
  
  # Check permissions (should be at least rwxr-xr-x = 755)
  if [[ $dir_perms != "775" && $dir_perms != "755" && $dir_perms != "777" ]]; then
    echo -e "${YELLOW}Directory $dir has potentially restrictive permissions: $dir_perms${NC}"
    if [[ $fix_all -eq 1 ]]; then
      echo -e "Fixing permissions of $dir"
      chmod -R 775 "$dir"
      echo -e "${GREEN}Fixed permissions for $dir${NC}"
    else
      issues_found=$((issues_found+1))
    fi
  else
    echo -e "${GREEN}Directory $dir has correct permissions: $dir_perms${NC}"
  fi
done

if [[ $issues_found -eq 0 ]]; then
  echo -e "\n${GREEN}All directories have correct permissions!${NC}"
else
  if [[ $fix_all -eq 0 ]]; then
    echo -e "\n${YELLOW}$issues_found issues found. Run the script with 'sudo' and choose 'y' to fix them automatically.${NC}"
  fi
fi

echo -e "\nDo you want to verify parenting directory ownership?"
read -p "(y/n): " check_parents
if [[ $check_parents == "y" || $check_parents == "Y" ]]; then
  echo -e "\n=== Checking parent directories ==="
  find /media/arr -type d -name "arr" -o -path "/media/arr/*" | sort | while read parent; do
    parent_info=$(stat -c "%u:%g %a %n" "$parent")
    echo "$parent_info"
  done
fi