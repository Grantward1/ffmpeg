#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
ARGPARSE_CONF_FILE="$SCRIPT_DIR/conf/crop.json" \
  ARGPARSE_ARGS="$@" \
  source "$SCRIPT_DIR/getargparse/helpers.sh"

INPUT_FILE="$(argparse 'input_file')"
echo $?
exit 0
OUTPUT_FILE="$(argparse 'output_file')"
CROP_FROM_WIDTH="$(argparse 'width')"
CROP_FROM_HEIGHT="$(argparse 'height')"
CROP_START_WIDTH="$(argparse 'start_width')"
CROP_START_HEIGHT="$(argparse 'start_height')"


ffmpeg -i "$INPUT_FILE" -vf "crop=in_w-$CROP_FROM_WIDTH:in_h-$CROP_FROM_HEIGHT:$CROP_START_WIDTH:$CROP_START_HEIGHT" -c:a copy "$OUTPUT_FILE"
