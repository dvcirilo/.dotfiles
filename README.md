# my dotfiles

Use GNU Stow, and it will symlink the files to $HOME.

```
stow <directory-name>
```

If files already exist, it will fail, but can be solved using `--adopt`. Example:

```
stow zsh --adopt
```

The `--adopt` option will replace the contents of this repository with the "adopted" files content. Just use `git checkout .` to revert back to the repo content.

There is no guarantee any of this will work.
