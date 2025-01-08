if status is-interactive
  set NIX_DIR_ALACRITTY_THEME (find /nix/store \
	  -maxdepth 1 \
	  -type d \
	  -name "*alacritty-theme*" \
	  -print -quit)
  set NIX_DIR_TPM (find /nix/store \
	  -maxdepth 1 \
	  -type d \
	  -name "*-tpm" \
	  -print -quit)

  set ALACRITTY_THEME_PATH ~/.config/alacritty/themes
  set ALACRITTY_THEME_SYMLINK (readlink $ALACRITTY_THEME_PATH)

  set TPM_PATH ~/.config/tmux/plugins/tpm
  set TPM_SYMLINK (readlink $TPM_PATH)

  if not test -L $ALACRITTY_THEME_PATH; or [ "$ALACRITTY_THEME_SYMLINK" != $NIX_DIR_ALACRITTY_THEME ]
    ln -sf $NIX_DIR_ALACRITTY_THEME $ALACRITTY_THEME_PATH
  end

  if not test -L $TPM_PATH; or [ "$TPM_SYMLINK" != $NIX_DIR_TPM ]
    ln -sf $NIX_DIR_TPM $TPM_PATH
  end

  zoxide init fish | source
  oh-my-posh init fish --config ~/.config/oh-my-posh/config.toml | source
end
