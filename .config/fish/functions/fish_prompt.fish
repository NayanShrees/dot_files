function fish_prompt
  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color 5fdfff
  set -g __fish_git_prompt_color_flags df5f00
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_showupstream auto
  set -g __fish_git_prompt_show_informative_status true

  printf '╭─'
  set_color red
  printf '%s' (whoami)
  set_color normal
  printf '@'
  set_color green
  printf '%s' (prompt_hostname)
  set_color normal
  printf ' in '
  set_color white
  printf '%s' (prompt_pwd)
  set_color blue
  printf '%s\n' (fish_git_prompt)
  set_color normal
  printf '╰─λ '
end
