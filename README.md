# NeoCode
A *very* opinionated NeoVim distribution.
Includes tmux, zsh and kitty setups for a complete integrated development environment.

![Alpha](https://raw.githubusercontent.com/rperre/NeoCode/refs/heads/main/assets/screenshots/furst.png)
## TODO: Keymaps
Define keymaps for all the commands already defined

### File explorer
We have multiple ways of exploring the filesystem, we need to have
a consistent way of mapping all of this.

Maybe Telescope, fzf and the Mini commands could have it's own section

### Git
We also have multiple ways of dealing with the repository. We must be mindful
of what we induce the user to use. We should prioritize the commands that 
interact direcly with the buffer. LazyGit and NeoGit should be available within
the same context in the keymap as much as possible.

### Find and replace tool
We should have a visual tool for this, and facilitate as much as possible using :s/ + quickfix

## Ideas for features
- Having custom menus for the language being used, with all the QOL possible out of the box:
    - Compiling and running
    - Running tests with visual TUI interaction
    - DAP interface
