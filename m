Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332004BB292
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015216; cv=none; b=jAtBSCJxK9YwRXYTYeAyddWBL7y2iBY1/BASD1cQ21Cm4p+/fATRfucYHgJ7j3Tnb7xdXYl1QORlyLKbj8HGSUpQL8AOO0XeYhevN1Pb0n6Vje1YgZTeHvd1sXawTy+ntcf+j/eamd7fqoGPDo283SazJpx4cDK538wjXN7lOCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015216; c=relaxed/simple;
	bh=3/3gOrHKXuGnpfR7x5eZBstJ6FQG1wL0skacjrbHMvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVI17luue9k5vwjYksdarT+W0WoXQaiUKaYKPqBCEw3IW/ElV8gA/YmtU4Kuw1BkzkY969i6d/1pLkjZ8uLt7c0McLB9NDyBOXUOu/7uTVZHCYD1dJPjBQKkG2+9S5cto4e2M0Z3HHya9oxDMkkQ/p5lnjdTO0crfmOjnJ6QSiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=pQ1XmKPd; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="pQ1XmKPd"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso547431f8f.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015213; x=1790620013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=pQ1XmKPd2SIxA3x1Wh7txGTvLMnNWvr32/m3Uw2Akvoj3kFla+YErr/1giGmrozy56
         3TQe/m28eoHoAXvTWVn3Jx/3x1kcjCYrAn6nBezwBkyBMTyO7tDXfUu7ku7noo2//RmG
         jGYvpdeEGydaU7Ua7ChRpyqp9L/kyUDpcOlhhN8tg/O9lTyZSh6qVFLprtVOTtdYD8ci
         DU4MWEOTInaYGojPh7FbxzOMuGPVHl+ROPL3S2/qeinSSFepgyBHYknotU4orRV75Us6
         XhuYDgCQk2xgM0EfYnS1WMilppkQprlg0iL8wm8Bvr5KX1mTEnjLH6gK3EVBTFjH8Enj
         NIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015213; x=1790620013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=GPxX7kFcxV4m2R52X+89SpTknrZCS0nq4yS5QYXPxIkyL5s8MyDgwwwrXhm/+yz7ai
         DYi/+FrrLuN3CeiBUYbm83/wRwOSttXDSOR23duks9cWqSRpZeAOvJ/Hw9X6xY0pEjaX
         tzY5EsgUMFxhQHj1gMnultT/bVCDIkiVE7Xu+kKmNimzeCGy6BkhK+Hml8+XHbH4OWrP
         8Yss5M3K3P4NPDKY9gLmrOmulAmO4N4rmONar5W1XU3gTYwC6uJ4X+NHNKORVOdGigW6
         wrlwqZ9+GWun8MKWsyCxWUQD6lO1ijESSqXAsSWLFCyAUn/iVUqCQpGdmyqoPK2bzjAE
         X9DA==
X-Gm-Message-State: AFuF++lvMzfsyMWAnlh1uZ4kP6O+IgRGgPTOTpDKPSRrIfdB0G9yFpiQ
	xxq+DDhHwzlWJHoMvebRz1Q3yII86Ylnxcl52MhG/hiU8vqdUndVc0du2BkfBbOXN1I=
X-Gm-Gg: AYBFou04dSkoduG4k6nQfv6oYspjCl98SXAIDXjVB1tggeQy7HS2vdIl+hKyTe/DuWh
	/w0FVY/ZyrHCC4M/83S+X3CobtT7pieDsphGJEQvPQDkbqiB7lhfnjiUkeXs52g/eXFqmXK9DuY
	6X7FST4F4rl9bQRWQgeAU4ilSPlKn4ADYUa5SjDyiCSrhmaLA4rv/PXqxJ33iqu8TUKDFHNToel
	DnQ6OaY4kZ0vNevb5IRV/28vpKgkJ2jka7RR0NzaFgS2OIZqggT3bhtodeBBAM1f/jRyMi+eFhN
	E8O2DIQdQz6sDG0wucghJCR3zT1FOMZBBhhNEX1DT0EL5Lu/JdMD76kD1lcyRh0jXFzW5VHAyxE
	KE6r9UkRJaOzk1MLJ+sYscv1uDr+/T83UCleLDASdil4pNRQKb5vIwlOYz8cTwjLrJfR2BB/I5/
	iHvG1QN6F+aYWHK8kzSADVz61h2qGO62o8NbK/KjAwfk8/yWbjb/RLZa7dMTIanixlC/cLhmaIM
	aJlycfkl/dUDWndYnXR05LNH8vMciCbvObT
X-Received: by 2002:a5d:5f4f:0:b0:486:f4ae:72a2 with SMTP id ffacd0b85a97d-4871e2131a7mr17423344f8f.1.1790015213349;
        Mon, 21 Sep 2026 11:26:53 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:52 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 6/6] configs: sp7021: fix defaults and enable existing device drivers
Date: Mon, 21 Sep 2026 20:26:20 +0200
Message-ID: <20260921182620.17597-7-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
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

