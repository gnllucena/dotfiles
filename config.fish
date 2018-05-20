# Python
set -gx PYENV_ROOT "$HOME/.pyenv"
test -d "$PYENV_ROOT/bin"; and set PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# OMF Theme
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support yes
set -g theme_display_vagrant no
set -g theme_display_docker_machine no
set -g theme_display_k8s_context yes
set -g theme_display_hg no
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_display_user ssh
set -g theme_display_hostname no
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_title_display_process noe
set -g theme_title_display_path no
set -g theme_title_display_user no
set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%a %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts no
set -g theme_show_exit_status no
set -g theme_color_scheme terminal
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes