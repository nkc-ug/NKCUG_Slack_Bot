# frozen-string-literal: true

def shell_get(command)
  # Enable `$?` -> $CHILD_STATUS
  require 'English'

  begin
    # runnning shell command
    result = `#{command}` rescue "Error! ReturnCode: #{$CHILD_STATUS.exitstatus}"
  end
  # `$CHILD_STATUS` -> catch returnCode from shell command
  if $CHILD_STATUS.exitstatus.zero?
    result
  else
    "Error! ReturnCode: #{$CHILD_STATUS.exitstatus}"
  end
end
