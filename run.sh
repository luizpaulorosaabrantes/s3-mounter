#!/bin/sh

set -e

echo "$S3_ACCESS:$S3_SECRET" > passwd && chmod 600 passwd
s3fs "$S3_BUCKET" "$MNT_POINT" -o passwd_file=passwd -o url=$S3_URL -o use_path_request_style  && tail -f /dev/null
