# Get video length in seconds
ffprobe.exe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 input.mp4
# > 7200.091313

# Get video length in HOURS:MM:SS.MICROSECONDS format
ffprobe.exe -sexagesimal -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 input.mp4
# > 2:00:00.091313
