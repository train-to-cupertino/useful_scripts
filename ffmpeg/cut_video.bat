# Cut a part of the video with a duration of 02:12:07 from the end of videofile using same codecs
# input.mp4: [00:00:00...01:00:00...02:00:00...02:23:26...03:00:00...04:00:00...04:35:33] (04:35:33 duration)
# output.mp4:                                 [02:23:26...03:00:00...04:00:00...04:35:33] (02:12:07 duration)
ffmpeg -sseof -02:12:07 -i input.mp4 -c copy output.mp4


# Cut a part of the video with a duration of 02:00:00 from the begining of videofile using same codecs
# input.mp4:  [00:00:00...01:00:00...02:00:00...03:00:00...04:00:00...04:35:33] (04:35:33 duration)
# output.mp4: [00:00:00...01:00:00...02:00:00]                                  (02:00:00 duration)
ffmpeg -i input.mp4 -ss 00:00:00 -to 02:00:00 -c copy output.mp4
