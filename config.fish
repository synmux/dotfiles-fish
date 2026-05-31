source $HOME/.config/fish/secrets.fish
source $HOME/.config/fish/vars.fish
source $HOME/.config/fish/abbrs.fish
source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/funcs.fish

if status is-interactive
    source $HOME/.config/fish/os.fish
    source $HOME/.config/fish/interactive.fish
    source $HOME/.config/fish/atuin.fish
end

source $HOME/.config/fish/final.fish

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
