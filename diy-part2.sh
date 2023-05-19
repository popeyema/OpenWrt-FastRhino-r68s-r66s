#!/bin/bash
# ==============================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# ===============================================================

# 移除重复软件包
rm -rf feeds/luci/themes/luci-theme-argon

# Themes
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

# 取消bootstrap为默认主题，将默认主题改为 argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile


# 添加额外软件包


# 修改配置
sed -i "s|'enabled'|enabled|g" package/feeds/nas_luci/luci-app-istorex/root/etc/config/istorex
sed -i "s|'model'|model|g" package/feeds/nas_luci/luci-app-istorex/root/etc/config/istorex
sed -i "s|'wizard'|'router'|g" package/feeds/nas_luci/luci-app-istorex/root/etc/config/istorex

# Disable bridge firewalling by default
echo '# Disable bridge firewalling by default' >>package/base-files/files/etc/sysctl.conf
echo 'net.bridge.bridge-nf-call-arptables=0' >>package/base-files/files/etc/sysctl.conf
echo 'net.bridge.bridge-nf-call-ip6tables=0' >>package/base-files/files/etc/sysctl.conf
echo 'net.bridge.bridge-nf-call-iptables=0' >>package/base-files/files/etc/sysctl.conf

# Disable bridge firewalling for docker
sed -i 's/ip6tables=1/ip6tables=0/g' feeds/packages/utils/dockerd/files/etc/sysctl.d/sysctl-br-netfilter-ip.conf
sed -i 's/iptables=1/iptables=0/g' feeds/packages/utils/dockerd/files/etc/sysctl.d/sysctl-br-netfilter-ip.conf


# 科学上网插件


# 科学上网插件依赖

# 删除编译出错的无用补丁

# rm -rf target/linux/generic/backport-5.15/430-v6.3-ubi-Fix-failure-attaching-when-vid_hdr-offset-equals.patch
