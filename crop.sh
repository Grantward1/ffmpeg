#!/bin/bash

#Provides a simple interface to use FFMPEG to crop a video.
#Copyright (C) 2026 Grant Ward
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as published
#by the Free Software Foundation, version 3 only.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Affero General Public License for more details.
#
#You should have received a copy of the GNU Affero General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

set -euo pipefail

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
ARGPARSE_CONF_FILE="$SCRIPT_DIR/conf/crop.json" \
  ARGPARSE_ARGS="$@" \
  source "$SCRIPT_DIR/getargparse/helpers.sh"

INPUT_FILE="$(argparse 'input_file')"
OUTPUT_FILE="$(argparse 'output_file')"
CROP_FROM_WIDTH="$(argparse 'width')"
CROP_FROM_HEIGHT="$(argparse 'height')"
CROP_START_WIDTH="$(argparse 'start_width')"
CROP_START_HEIGHT="$(argparse 'start_height')"


ffmpeg -i "$INPUT_FILE" -vf "crop=in_w-$CROP_FROM_WIDTH:in_h-$CROP_FROM_HEIGHT:$CROP_START_WIDTH:$CROP_START_HEIGHT" -c:a copy "$OUTPUT_FILE"
