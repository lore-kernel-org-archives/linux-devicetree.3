Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D64A2629
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263767; cv=none; b=iULaRRoNWlLkcmHe16QJBJoJbpCjXgHGXbHV7qZpBv6jRla/SWsOAjIxOAz7IWD3BDPOFKiwaXNb1WxQaU33/+1PmIYjfnnAW9Aaaf2uUOtU5v+ejtodK+kL7droFKyvtohBB3tieCuUlaoy4ESQQLpvXyyVtEMAQ17t9ZwecHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263767; c=relaxed/simple;
	bh=3/3gOrHKXuGnpfR7x5eZBstJ6FQG1wL0skacjrbHMvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0YbU5ded2PgROFumG2p7euIa8xmJq6oDb0Fa4THHFggTXoTe/k78MXB2nY+gT4WCYcY8NtTIApBJcl2jqdeNQZ1EQfQyhyTRDrObEyp/6iaICwWPAh9ym+Cuu5UUCSLx7brvX4qJnzMLmtcWKiT6Oo7a9lS30f7Fpwtj6PauCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=D5NqgcDq; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="D5NqgcDq"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so1555299f8f.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263763; x=1790868563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=D5NqgcDq1wF2uTv9mxb7dSTxS7AVXh4QD5/FDxmPr68jdXWIHKT3yORHv1Pz05cRos
         I9JuywbiO1yExs2rocZZs2xWZNMPjk1VIQF5CuUso1CMW1ng5s8ugq/f+NCPJnBL4q9b
         UWXXgBQe8zpsnF2j8A5yJY2TJ97B3zFXMCFQ3Fbgwlt+O9nZVO+eNjQ7h1DKTtdIjv46
         M9cQLR9SVHQZke2vMf2iuIGokHkzLWhYEjBR3QOFYFbnJGRdqjTqaq+UcZ61/VZoTuCh
         f86gG98GdCOBx99X5xZy0uueaIhqB85LIDNw+fm2yo7WhvV7RSsNqfqaiCdm1cnYUxi3
         yIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263763; x=1790868563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=aHPDdligXdeM5fex3x00M3MCkJuIqCvvaoL3ig3VVDQFTEBNFt9tDzRLKAL6a8YLRY
         gQlywS4uEkpXFXaHiLT/n9zgekHv0HdXdYq8I3hfmXLQUhC7HUcqyD9NfLl0MWVNITaz
         l2dgf+2LE9/KyDox3tomwfK/HVoYX+WFx3+QuzpetFm77IHUfMIplkkzz38hc8xOVOIa
         wqoXqLs5c/flAd1SNqWgQHd2VVGLbWRTinNHyrl0OD3jH31F+N/SYHNjYeFcA9Q6S+uJ
         BFgIv1RUkwfP9xOVM+u7xu6QtrPHBxEhhF9bX2m0TKLXhtFc90irbYVEKDCDIpG4eG02
         VcEw==
X-Gm-Message-State: AFuF++lLrharh8jwWIYO19SLW3tHIMkLRUknKoyiDy7IA7Bqb0WndgRo
	B5qJUKBjxcpJRbBonnpR9YjLA5klOYo43oGFzfgGmcYNJ73CwSP57XIAOpjn3EYcKBU=
X-Gm-Gg: AYBFou1sLLK7LbRd1SnsffWwHydU7ePwJCmh3TSNmw2AMkKpmdnLSVoJPBYgbVxtf6s
	3Uah6+VoD/B/tsHGKiS0qOlcx6+Zw3ynK+KfJ7Oq4aKVJfmXKbpve0ZBa3PwdLnewx9R65Zi18d
	9nUPsW5WHxyoCahFySV1SjSgeogqoxh38AMhdgXaEE8Hakk2GLDASoTnN8o89baolLVpVqgJN8Q
	0gmQ7sjevwTQybtJWRsXCc1pNrtu80NICgvjsnXO+/t9fKromgHMl1URcEiQXMrGh76vxja70gH
	eNj55KyFW1gUfmXkWtYxiRq8UkxrpeA8369i9PQyfSNWBLW79Evk6FTtmr4se4opgWee4+wtY90
	WXQGQrwWTJ//VZn+KprTWrxwf7zQ0WfkfInT5IL7N9/Z5cQN2h5E+HU00jf09Ny0kYDDntIjeHY
	dU8OwLgZ4y/HEAQO1cjzxxrrKMDsimCSWm6AC1W6091lsQsnRqwNy1zcbQaO24k7FgcwLusU9NT
	BkY0u3fCOaSkunt6DaJ03VPWrh8dmB+cDjr
X-Received: by 2002:a05:6000:4711:b0:488:6523:e15c with SMTP id ffacd0b85a97d-48871751996mr4474862f8f.32.1790263763490;
        Thu, 24 Sep 2026 08:29:23 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:22 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 6/6] configs: sp7021: fix defaults and enable existing device drivers
Date: Thu, 24 Sep 2026 17:28:44 +0200
Message-ID: <20260924152844.81705-7-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
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

