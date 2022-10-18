#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.252/g' package/base-files/files/bin/config_generate     # 定制默认IP
sed -i 's/PATCHVER:=5.19/PATCHVER:=5.15/g' target/linux/x86/Makefile                   # linux机型,默认内核5.19，修改内核为5.15
