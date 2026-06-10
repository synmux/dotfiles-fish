# Question mark at start of line - natural language mode
function _atuin_ai_question_mark
    set -l buf (commandline -b)

    # If buffer is empty or just contains '?', trigger natural language mode
    if test -z "$buf" -o "$buf" = "?"
        commandline -r ""

        # Run atuin ai inline, swapping stdout and stderr
        set -l output (atuin ai inline --hook 3>&1 1>&2 2>&3 | string collect)

        if string match --quiet '__atuin_ai_print__:*' "$output"
            echo (string replace "__atuin_ai_print__:" "" -- "$output" | string collect)
            commandline -f repaint
        else if test "$output" = "__atuin_ai_cancel__"
            commandline -f repaint
        else if string match --quiet '__atuin_ai_execute__:*' "$output"
            # Execute the command immediately
            set -l cmd (string replace "__atuin_ai_execute__:" "" -- "$output" | string collect)
            commandline -r "$cmd"
            commandline -f repaint
            commandline -f execute
        else if string match --quiet '__atuin_ai_insert__:*' "$output"
            # Insert the command for editing
            set -l cmd (string replace "__atuin_ai_insert__:" "" -- "$output" | string collect)
            commandline -r "$cmd"
            commandline -f repaint
        else if test -n "$output"
            # Default: insert for editing
            commandline -r "$output"
            commandline -f repaint
        else
            commandline -f repaint
        end
    else if not contains -- "$fish_key_bindings" fish_vi_key_bindings fish_hybrid_key_bindings
        # Not at empty prompt, just insert the question mark
        commandline -i "?"
    end
end

# Set up keybindings
bind "?" _atuin_ai_question_mark
