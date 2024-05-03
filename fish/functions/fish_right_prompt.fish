function fish_right_prompt
  set -l exit_code $status
  set -l cmd_duration $CMD_DURATION
  if test $exit_code -ne 0
    set_color red
  else
    set_color green
  end
  printf '%d' $exit_code
  if test $cmd_duration -ge 5000
    set_color brcyan
  else
    set_color blue
  end
  printf ' = %s' (__print_duration $cmd_duration)
  set_color yellow
  printf ' ⇌ %s' (date +%H:%M:%S)
  set_color normal
end

function __print_duration
  set -l duration $argv[1]
 
  set -l millis  (math $duration % 1000)
  set -l seconds (math -s0 $duration / 1000 % 60)
  set -l minutes (math -s0 $duration / 60000 % 60)
  set -l hours   (math -s0 $duration / 3600000 % 60)
 
  if test $duration -lt 60000;
    # Below a minute
    printf "%d.%03ds\n" $seconds $millis
  else if test $duration -lt 3600000;
    # Below a hour
    printf "%02d:%02d.%03d\n" $minutes $seconds $millis
  else
    # Everything else
    printf "%02d:%02d:%02d.%03d\n" $hours $minutes $seconds $millis
  end
end
