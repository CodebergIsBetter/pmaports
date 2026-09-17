# Sourced by tinydm-run-session before starting the Wayland session.

# There is no elogind and no pam_rundir in this image, so nothing else sets
# this up. xdg-runtime-dirs created the directory at boot; point the session at
# it. Without this, sway exits immediately with
# "XDG_RUNTIME_DIR is not set in the environment".
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# VideoCore IV has no Vulkan, so don't let wlroots probe for it.
export WLR_RENDERER=gles2
