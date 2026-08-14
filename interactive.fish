# disable greeting message
set fish_greeting

# mise
mise activate fish | source

# oh-my-posh
# oh-my-posh init fish --config ~/.config/oh-my-posh.yaml | source

# starship
if not set -q WARP_SESSION_ID
  starship init fish | source
else
    functions -e fish_prompt fish_right_prompt
    function fish_prompt; echo -n '> '; end
end

# terminal-widget
function terminal-widget
  '/Applications/TerminalWidget.app/Contents/MacOS/TerminalWidget' $argv
end

# zoxide
zoxide init fish | source

# bunnylol.rs
bunnylol completion fish | source

# sixkcd as motd
# $HOME/.config/fish/tools/sixkcd

if test $DISABLE_ZELLIJ != true
    set ZELLIJ_AUTO_ATTACH true
    set ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)
end

# krew
set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin

# kubeswitch
switcher init fish | source
switcher completion fish | source

# docker
docker completion fish | source

# 1Password CLI plugins
source ~/.config/op/plugins.sh

# shadowenv
shadowenv init fish | source

# direnv
direnv hook fish | source

# gcloud
complete -c gcloud -f -a '(__fish_argcomplete_complete gcloud)'
complete -c gsutil -f -a '(__fish_argcomplete_complete gsutil)'

# navi
navi widget fish | source

# pieces
pieces completion fish | source

# orb stack
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# atuin (+ question mark AI)
source ~/.config/fish/atuin.fish

# opencode
fish_add_path /Users/dave/.opencode/bin

# homebrew commmand-not-found handler
set HOMEBREW_COMMAND_NOT_FOUND_HANDLER (brew --repository)/Library/Homebrew/command-not-found/handler.fish
if test -f $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
    source $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
end

# fuck
thefuck --alias | source

# warp
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'

# upcloud upctl
upctl completion fish | source

# windsurf
fish_add_path $HOME/.codeium/windsurf/bin

# lmstudio
fish_add_path $HOME/.lmstudio/bin

# >>> otty shell integration >>>
# Added by Otty — toggle in Settings > Shell > Shell Integration.
# Inert unless launched by Otty (it sets $OTTY_SHELL_INTEGRATION).
if test -n "$OTTY_SHELL_INTEGRATION" -a -r "$OTTY_SHELL_INTEGRATION/otty-integration.fish"
    source "$OTTY_SHELL_INTEGRATION/otty-integration.fish"
end
# <<< otty shell integration <<<


# Added by ToolHive UI - do not modify this block
fish_add_path -g $HOME/.toolhive/bin
# End ToolHive UI
