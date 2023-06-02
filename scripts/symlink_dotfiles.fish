# This script symlinks the dotfiles defined in the 'dotfiles' variable to the
# home directory.

# Set the ROOT environment variable, assuming that the directory structure
# mirrors that of the git repository.
set -x ROOT (cd (dirname (status -f) )/../ >/dev/null 2>&1 && pwd)

set FILES_AND_DIRS_TO_SYMLINK ".vimrc"
for f in $FILES_AND_DIRS_TO_SYMLINK
    ln -sf $ROOT/$f ~/$f
end

## We treat fish.config differently since it does not live in the root directory
ln -sf $ROOT/config.fish ~/.config/fish/config.fish
