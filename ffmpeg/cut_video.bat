# Cut a part of the video with a duration of 02:12:07 from the end of videofile using same codecs
# input.mp4: [00:00:00...01:00:00...02:00:00...02:23:26...03:00:00...04:00:00...04:35:33] (04:35:33 duration)
# output.mp4:                                 [02:23:26...03:00:00...04:00:00...04:35:33] (02:12:07 duration)
ffmpeg -sseof -02:12:07 -i input.mp4 -c copy output.mp4


# Cut a part of the video with a duration of 02:00:00 from the begining of videofile using same codecs
# input.mp4:  [00:00:00...01:00:00...02:00:00...03:00:00...04:00:00...04:35:33] (04:35:33 duration)
# output.mp4: [00:00:00...01:00:00...02:00:00]                                  (02:00:00 duration)
ffmpeg -i input.mp4 -ss 00:00:00 -to 02:00:00 -c copy output.mp4


# Cut a part of the video from 00:00:00 to -X seconds from the end (cut away last X seconds of the video)
# Example of usage: ./script.sh input.mp4 5 # 5 seconds from the end will be deleted
# ! ! ! Tested only on Ubuntu ! ! !
input_file=$1
cut_length=$2
duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $input_file)
end_time=$(echo "$duration - $cut_length" | bc)
echo "Duration: " $duration
echo "End time: " $end_time
output_file=$(date +%s%3N)_$input_file
command="ffmpeg -ss 0 -t $end_time -i $input_file -c copy $output_file"
echo "Command: " $command
$($command)
