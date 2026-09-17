Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F5E43E486
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633632; cv=none; b=p76uhbaodlFj67vOe+sB7nnkCsnh0X7knChYfRbTIqs3JWymwb8EmZQXFEw5MdCs0SjJsq4Ns12e2/ERzUVjduuMZWHgQa3jWtO8GlWDAKSN7rtwaTkuYN9Wy0wo1v/kqD3hWBSCms2K1xO8oxTINRqkwCMxlPuFheL93whSI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633632; c=relaxed/simple;
	bh=reYmZn6g37x5F5xQdzOt9gcftnkp8Rmaq4aPQ+ap6JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZigkl+awA+RAX5h0qcQqZkq/A/XGOlTbjihIqaclv5rivvfAVUcLjrqB/vlk/5hjgwDSkDFGFMOn/A3XFxDAgGSTjcOLPFCBzqRK+caouM6dyhwNyj65nHhkG81qWNRPLoKBS0sthlPE+b9iQxf8gyzepnaG2ivUXV8X0Mc5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=f8Dp/4jd; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="f8Dp/4jd"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48437356d60so279682f8f.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789633620; x=1790238420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsKXjxj5TCnOfXiRILa1fjUfcKm3nh3qcaT1EI0Ql1I=;
        b=f8Dp/4jdH6nrRri5TkR9qzNOWfqNFFIgibfYJshBi4a4fvAEssseeUmhNw9GpJhYPV
         GJzy7gKOoPAWOHZ4dsige/eTFFFBk2ewV8cFungIhdFchDEyTDI9/TB3pjcA8jSw3QoL
         SeRcs7kuaOzCNgilHkJ7qGmVhilh9uqAmykD+KsrIFpM3ikQ0jfuxOHmn4egnnGaLqWt
         uKaTE7CaV7fTnb0iyx6GgEuQKWY/2qalKKVQiRjWWlAHk8LmNNv6AZR94Jw33nyvuhzI
         59HRROtZbutM7yAff7hkVBI4wU0dUqKYIwcdPIRNCf/PnxAq3NXMgZLWiTNBawkNrZ18
         uRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633620; x=1790238420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GsKXjxj5TCnOfXiRILa1fjUfcKm3nh3qcaT1EI0Ql1I=;
        b=h6Mij+GlNs9gObrUu7H5VRAFZJS5tHuWp8NYOistPn5GH8Atu8iWRzoidRKmf/UXCV
         A0L5UTsXkD8cFR0YP8gUEOANFz9xU1UhJFcjqXyldF9y71ZOa7P+wtsj+Ypfnomk2klA
         ZTW4zRkoHOGwDBoF6yD18/jgI8WLS275zvicMnJoeb+OD3aARjvLHpjeHj49wJOrq0kY
         sqVo7nGvF1Faot02kRtYW+9gvROY1Yu2uQofE1IqYCKwvlvXOQVcferaO/ANFA5mQZv3
         McYVY8SOL7sASXAgIVV6fybCPLYQi5L0Tx16l4Ss2+m3C4neJk5NXS+hqCvuVUJIGTL4
         DboQ==
X-Gm-Message-State: AFuF++kqcITXo69AFdVcWY+xwqRPqd+WIYiCFXQ7bafrTJ/RKEgq9LM9
	l3ROxOyvXSMznRikFHVqlB22MpLFh23FPZRBBrtfHLVdDl7w35jXjn1uziQcckT7Dhk=
X-Gm-Gg: AYBFou1UZaLiA3peyP1iwjsQnSLfDUbyYUOUNC4MucDoVAZ0rijlI9sFRZZ9mUJ42J2
	2jFJeX67ZFVP0rcg28mLgl/USD/rFF+tRMEHVqOAcMPy7DzOOqQ9nTqSxDoUJMTet9w5qE3JB0T
	Wrl8w8bJfPdmt0/CqsNjcVbgw45EndMrRRIThUq0k2zRUNHMrdvaBEDDWjykpQ2RYU9SFTM7Vdv
	JXMM544o+d2WXxfu2xi0wJVl64uQDEc2BUu7IC9uF+Zjc5hG5RBAa9h4E/KbQKUm3lwm1ZhY1Bs
	YPKaZ+WuhM1js9u1wtJx2BZ54IugeIww8z5qALlR+2lfCYW7Yqaw4iqDjkzxIyGzNPSX9w0DbYc
	dQP7G6BWtZKfNrJHdeCfomxKjbfplMsjc4HcdG2zaX2P3fF3U88sKcTu9H5QtiNv9t1T6OqVuUX
	wLZCdJ2O5H5/YBsql9wRayecyr/EtswZ6Gnyelzx3CLS85YZM6SNcagDIPjMvf0XCKxauE79r2v
	KEOcpoarXIc5Mm06EZGp4SYxqsN4+kYq5MCVYWSxTIizR0=
X-Received: by 2002:a05:6000:22ca:b0:487:35f:f0f0 with SMTP id ffacd0b85a97d-4870cf3934emr7333896f8f.14.1789633620247;
        Thu, 17 Sep 2026 01:27:00 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm13420395f8f.24.2026.09.17.01.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:59 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 4/4] configs: sp7021: fix defaults and enable existing device drivers
Date: Thu, 17 Sep 2026 10:26:32 +0200
Message-ID: <20260917082632.626614-5-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917082632.626614-1-ag@ffroot.co.za>
References: <20260917082632.626614-1-ag@ffroot.co.za>
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
- ARM_ERRATA_814220=y	# needed for Cortex-A7
- SMP is not set        # SMP is not yet implemented for this SoC
- CGROUP=y
  SECURITY=y
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
 arch/arm/configs/sp7021_defconfig | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index ec723401b440..e6a2debab8d4 100644
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
@@ -15,7 +18,8 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_SUNPLUS=y
 # CONFIG_VDSO is not set
-CONFIG_SMP=y
+# CONFIG_SMP is not set
+CONFIG_ARM_ERRATA_814220=y
 CONFIG_THUMB2_KERNEL=y
 CONFIG_ARCH_FORCE_MAX_ORDER=11
 CONFIG_VFP=y
@@ -24,11 +28,16 @@ CONFIG_MODULES=y
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
@@ -36,6 +45,26 @@ CONFIG_INPUT_EVDEV=y
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
@@ -51,6 +80,8 @@ CONFIG_NLS_CODEPAGE_437=y
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

