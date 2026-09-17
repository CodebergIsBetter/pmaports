# There is no elogind in this image, and none of the PAM modules that would
# normally provide a runtime directory (pam_rundir, pam_elogind, pam_systemd,
# pam_dumb_runtime_dir) are installed, so nothing else sets this up.
# xdg-runtime-dirs creates the directory at boot; point sessions at it.
#
# Without this, sway aborts with "XDG_RUNTIME_DIR is not set in the
# environment" and PipeWire cannot create its socket. Setting it here rather
# than only in the tinydm session environment means it is also correct for SSH
# and text console logins.
if [ -z "$XDG_RUNTIME_DIR" ]; then
	_xdg_dir="/run/user/$(id -u)"
	if [ -d "$_xdg_dir" ]; then
		export XDG_RUNTIME_DIR="$_xdg_dir"
	fi
	unset _xdg_dir
fi
