#!/usr/bin/env bash

# Gource: http://code.google.com/p/gource/
# FFmpeg: http://www.ffmpeg.org/
# 2015-05-28 https://gist.github.com/TheFox/4bc9f3210e75148088a4

$ gource \
	--viewport 1920x1080 \
	--auto-skip-seconds .001 \
	--seconds-per-day .001 \
	--file-idle-time 300 \
	--background-colour 000000 \
	--hide progress,filenames,bloom \
	--font-size 24 \
	--max-files 0 \
	--camera-mode overview \
	--user-image-dir ~/.gource \
	--date-format '%F %H:%M' \
	-r 30 \
	--highlight-users \
	--multi-sampling \
	--stop-at-end \
	--max-user-speed 200 \
	--user-friction 1 \
	-o gource.ppm \
	jquery

ffmpeg -y -r 30 -f image2pipe -vcodec ppm -i gource.ppm -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 gource.mp4
