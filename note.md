# 临时记录

## 构建日志：

Build ffmpeg (win64, gpl)
Process completed with exit code 128.

## 错误详情

Updating files: 100% (9830/9830)
Updating files: 100% (9830/9830), done.
+ cd ffmpeg
+ git config user.email builder@localhost
+ git config user.name Builder
+ PATCHES=('/patches/master'/*.patch)
+ [[ 2 = 0 ]]
+ for patch in "${PATCHES[@]}"
Applying /patches/master/0001-Enhanced-FLV-HEVC-AV1-support.patch
+ echo 'Applying /patches/master/0001-Enhanced-FLV-HEVC-AV1-support.patch'
+ git apply /patches/master/0001-Enhanced-FLV-HEVC-AV1-support.patch
error: corrupt patch at line 20
+ rm -f -- /tmp/tmp.QjcdVu4855
Error: Process completed with exit code 128.