#!/bin/bash
# Simple script to speed up a video while keeping the pitch - Haoran Zhang 20190519
# Example: ./speedup.sh in.mp4 1.1
# Suggest using 1.1 for my videos

INPUT=$1
MULTI=$2

OUTPUT="../03-ToOVERLAY/$INPUT"
ffmpeg -i "$INPUT" -filter_complex "[0:v]setpts=1/$MULTI*PTS[v];[0:a]atempo=$MULTI[a]" -map "[v]" -map "[a]" "$OUTPUT"
echo "Done. The file is saved to $OUTPUT."
