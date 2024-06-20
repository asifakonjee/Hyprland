 #!/bin/bash
 wlrctl window focus chromium --enable-wayland-ime || exec chromium --enable-wayland-ime & disown
