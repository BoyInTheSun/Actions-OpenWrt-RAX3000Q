#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Fix warnings about missing optional NSS dependency packages that are not
# present in this build tree. These are all optional/advanced features
# (IPsec, DTLS, CAPWAP, OVS, crypto offload, HyFi, Shortcut-FE, MCS, RFS)
# and their absence does not affect core NSS routing/bridging/WiFi acceleration.
for pkg in \
    kmod-qca-nss-drv-ipsecmgr \
    kmod-qca-nss-drv-dtlsmgr \
    kmod-qca-nss-drv-capwapmgr \
    kmod-qca-ovsmgr \
    kmod-qca-nss-cfi-cryptoapi \
    kmod-qca-nss-crypto \
    kmod-qca-nss-gmac \
    kmod-shortcut-fe-drv \
    kmod-qca-mcs \
    kmod-qca-hyfi-bridge \
    kmod-emesh-sp \
    kmod-qca-rfs; do
    find package/kernel/qca -name Makefile | xargs sed -i "s/ +${pkg}//g; s/ ${pkg}//g"
done

