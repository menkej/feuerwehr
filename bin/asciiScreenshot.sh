 #!/bin/sh
export DISPLAY=:0
import -window root - | convert - jpg:- | jp2a --colors -
