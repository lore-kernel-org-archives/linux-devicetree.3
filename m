Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F2D471435
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268620; cv=none; b=AT2BwGPNYSNtu6M08c2PJnmgjlKlDRKHrktH06RCUS+lkU8oMfzXdp+5SGN/lzEwHY0ZCpN7B4bTL0n5nRU1ZM6ROMjsP9DpZZocuGlljl/GRmFm2DhRt2pUwYW1SiZS84WxL16vsr4zX4zdnLXMdkSzhCPCfp8QQ7YeYFziKX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268620; c=relaxed/simple;
	bh=3/3gOrHKXuGnpfR7x5eZBstJ6FQG1wL0skacjrbHMvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKjajCIGNqx9IIAdRf56cZ8gQyVWO68FjzH46gxRnsvVM2eAJxlckMJn9Nkez/fnHunKakFs+S1QKPMmwIwcPgarNgkkMohghlcOfgommnZJhLVID5UGJNXGQ8mVpL8mX5gXTc5aQioC5UOGqU21rv3kef8LZrwg3sJEtQkmYyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=JOiBGRRu; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="JOiBGRRu"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488780459e2so12230f8f.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268617; x=1790873417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=JOiBGRRuXDnVo0Awrxbh/iEGYO0HjvqCEXd3guo6cfDL5f7QdtX8CvjCrFsv0C7ZoQ
         pxCkfVBULDIGcQoYzbCaxuKObxoEBwiXrjPYYDnJFeUF6H+zLUO9dIGPS7DOOHgRRG9V
         I3plZsoSNZaoN6oJ9wvI13E0f5WdGrLtDJ33Tsym8yTr9D3s8t78a9k3WfZIhLUSBfYt
         3K4zWNo+AyLnMOQUY2gz87rAjflkGMv+4GXDnuu8WbZJh+EDhAhEgbPTKfi8IUZhHmmx
         GbWpORRqdarlSyxbrJSx5EhZWPa1gUeSv9/Fgk+x4L4M+r0Lpc+xl7z7lPTsfrS0KA/Q
         /yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268617; x=1790873417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=WFppYE7y1TNY2Ch/phRtYgDjSreVmanLl0qaw4MQ79SNfuASBbomt6KsvFvjpe8OJ6
         nBxe06FzpEofxhzrGhmO9Y2TPkVhX024tXys5gbcstmRyAdrTjc3Qk5lt4Chd7RVZVYa
         AHw+zN8mB7u1y8au5Wg46q+xwtALqsI6T4Bc4rkQ47lSMGxOc8XK8UekVdPsEqXNR6Ma
         3/kM0EFDnKfS7DgYUbvoAVVv6m+SpC+ksmiPzWcngVsg3wZiUyz9LO3T4OLxP3EX2i0P
         gyrBj5J9lY9FBBOfYiDAK4s8+cMjvO+EWoRwSJkBs6zV4RuIGqAyKwo+YMN+iAMvM4OZ
         WOuQ==
X-Gm-Message-State: AFuF++nGyElIyxQ7dHgjL/XcYJk3TymafVPehguN/uSPUQJUVCQir1b1
	p4tU76DRVGGWDXciROab+bCcLxNbCv+k5gRomu+Pu7FmbSkXPkweE+KfPtxpTd74ljQ=
X-Gm-Gg: AYBFou01Mey3m8dnmJFvBYLLI0SvduGyuXAYTZZIUr5cAqvhlGRTBHO2TvjurnXTGiI
	WVYnd0Hw8SHbUjmsATeo6PB8Ilye4zmtFuBPhXnvrz7L3ucgUdCiN1fpvm3JmJ8HqAcNgV2y/5G
	EwfbF/BXN22nqzCRM6Uj6JxZz5sJx/s8b92dzoCxvjb9t0Aqlb4NVMJnTXky20S+MiP2AUkXzO0
	NZFfhy6m+OH3/9BV/lxeqloQbeOtrH8vPVkSBN4dwm4ZG1cAW54y1NWt44ca6fXR3rJvob4R6zU
	3BELil42RNDPjs/wY3F/qgMy6fFiqwEvOtXlYrMofRpyWiiLmc7gZO+T5WvGC+nytkPVqc4TWPE
	3jB6uh+EBO5dHRRMqzVOXCLZBxry0ljLoCo1q3JJYYcYBqti7SjljTCXjn112L+hzYAoDDYAXJl
	qZCwTqfud6avYG+EUs0vrPGDFKIAtP4uHBlYxwFMTdxYNm8zqkGNNO6A9e3OfXez9ErXYqyPEbO
	qO8N9Of4buxdhLX91bsz7UYrchfEClMExFH
X-Received: by 2002:a05:6000:4282:b0:487:64c:240f with SMTP id ffacd0b85a97d-488717699edmr5374197f8f.28.1790268616757;
        Thu, 24 Sep 2026 09:50:16 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:50:16 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 6/6] configs: sp7021: fix defaults and enable existing device drivers
Date: Thu, 24 Sep 2026 18:49:22 +0200
Message-ID: <20260924164922.117236-7-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LTPP3G2 is based on a SP7021 and has a Cortex-A7 CPU, Ethernet,
eMMC, SPI, EEPROM via I2C via GPIO, watchdog, RTC, NVMEM, and LEDs.

Apply these settings:
- ARM_ERRATA_814220=y   # needed for Cortex-A7
- ARM_PSCI=y            # needed to boot SMP
- CGROUPS=y
  CGROUP_SCHED=y
  MEMCG=y
  NET=y
  UNIX=y
  INET=y
  NETDEVICES=y
  SECURITY=y
  SECURITY_NETWORK=y    # needed to boot the shipped rootfs

Enable these drivers:
- SP7021_EMAC
- SPI_SUNPLUS_SP7021
- I2C_GPIO
- EEPROM_AT24
- MMC_SUNPLUS
- SUNPLUS_WATCHDOG
- RTC_DRV_SUNPLUS
- NVMEM_SUNPLUS_OCOTP
- LEDS_GPIO

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/configs/sp7021_defconfig | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index ec723401b440..29c200d2bdb7 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -1,4 +1,7 @@
 CONFIG_SYSVIPC=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_MEMCG=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -16,6 +19,8 @@ CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_SUNPLUS=y
 # CONFIG_VDSO is not set
 CONFIG_SMP=y
+CONFIG_ARM_PSCI=y
+CONFIG_ARM_ERRATA_814220=y
 CONFIG_THUMB2_KERNEL=y
 CONFIG_ARCH_FORCE_MAX_ORDER=11
 CONFIG_VFP=y
@@ -24,11 +29,16 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
+CONFIG_NETDEVICES=y
+CONFIG_SP7021_EMAC=y
 CONFIG_INPUT_SPARSEKMAP=y
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
@@ -36,6 +46,26 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
+CONFIG_SPI=y
+CONFIG_SPI_SUNPLUS_SP7021=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_GPIO=y
+CONFIG_EEPROM_AT24=y
+CONFIG_MMC=y
+CONFIG_MMC_SUNPLUS=y
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_SYSFS=y
+CONFIG_SUNPLUS_WATCHDOG=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SUNPLUS=y
+CONFIG_NVMEM=y
+CONFIG_NVMEM_SUNPLUS_OCOTP=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_RESET_CONTROLLER=y
 CONFIG_EXT4_FS=y
@@ -51,6 +81,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_NETWORK=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_MAGIC_SYSRQ=y
-- 
2.53.0

