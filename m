Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753004A2073
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263751; cv=none; b=RZMCDVtqFQvbwqZVClB256Z70nMHyDLMd5O7klI1pCi9vY91vW1BZxik/As5AcxBVtgOFHfFGYB9Li+oiaqd0dijuhAdcyqhmzqgqzJeZgQEQ0eHjhZ2wHX4edJPD1agqXUSLinDLL1B06aAFwGCJ2uwCjGrwCz399K4YXEZ414=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263751; c=relaxed/simple;
	bh=eWM5z0LNZ4CnkFZYrUnYoGJ9SasU+PUY/mQvrxzZQAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UePDvaE7rzz+ieO+XGEDqyU+MHwVLox35bznuJa3pYx6rhO5fonBW3YTzYr32qki4VUYgGEwcZ0bKTNAOkmG33Kp9T/MLQsLONKPyEJZJurSnp55wOnQZWROpDpcCyOnmx5nGv8R9YheMbx9dx5U7onW7a1Nt8m5mqeQ6+4n0Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=ii/udOId; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="ii/udOId"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so13640625e9.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263745; x=1790868545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4BJHpUuMHIcGkru8O+ar1GYYsPK8fYRSzg/ibliPX7k=;
        b=ii/udOIdAVxMM4Nig3ay58C87WaElnTrM6iR6MUG016TbsfsN+KJ7NKjkzOyifDurT
         vV2zyL1dQWwcxIl3B3tEhZID0NyOS8CgtuFHMWcaRrsH+H54ieyc3+k6kc64wbCb27uQ
         7Hyje/Rabtg0aEo74IiJoXPYRjuPejbgYx3/ELtGD+NSA3EPifGrrKTh4lWi4OAhaOhk
         kXQ3m8SbnTJYnC9H+9+3hCwGQTrTlMLaVHC+1CadgnS097KiN0TyjqjNnphVBpE3lHxg
         WrVFza9IdjkwOkd0lx7rIyzhUSbm9Y6PO8kE5FrHIC1og5j2BJiiLTEeCtI1ioaaaTeY
         qMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263745; x=1790868545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BJHpUuMHIcGkru8O+ar1GYYsPK8fYRSzg/ibliPX7k=;
        b=h5wc2bdJfHNKKRLhte0tHiFsGi9Xxn6EkD8TR5bLkpnIuuDI0S3Mq4qKUbmU3JLntm
         t4G0ZWMOitz/0dDRv4wpZ1+/FlqiL6Zo4HbfJcJd2SNssOSRs/0zfZqeTm7zJO5OxVMy
         Bygqp25ww8Uf6cWILPc/CJ78MQrB0wlh1KN8PGaIL1VhEsm/xo+gSJysmlqT22mM7sU0
         UsRayJSVOl35gcS/P8hYGuNG4SAshFP6zJ845XdGHxdnBq6GoWrGma9PJ7zU/L3XuGrw
         B+I5sIl9qSybtSJw7BXiGY2o98DfBuQ4Q4BKslHj4H/Z38sFQjvfmxsZTR9ok4ACfQq6
         hbFw==
X-Gm-Message-State: AFuF++khEkvnLoUbGshmhCAi2NRiuZPyNW+ITx8mfSw58qlYdboa1ui8
	SCSSxFrXltoXaVUDX/Yq2yrSd2xA3EeyxEYakRxv5Fqv/0sY8Zmygi5UUjE4j72N8j5Me8aKqDQ
	+tIfE5lE=
X-Gm-Gg: AYBFou2N/uOXdEtRUiMOqwTB0RGY3cVA9gImC1Sb12p4ZzcbnIBjjigNUh4TamWQPK0
	5kHblDC2IZTmYkjrvNcARS3Ms4cG5r2P2uISenKcsUJU2/FEEl80cWfbWz1g3O0lI8UsosNQS9a
	oqBxvaiWeTTGrNtRdArfabboHEPwHhj1J5v65Pg3SVnEGTFvuq/opvXSNO3VEXmi4fR4jD1oMpc
	DBcIHQ35bwSE/grkGV97/sayLlP0ADd0H6uyK9RIjVUilgzGxPkQLH0bG/mFbxMq3WAWSb7Sm0B
	Slo8FK8dh80YQGjvZFBlT+2Ar6C0XL9uhDgPrHgzwFficbaAb4cQh916MY6IzcUNpvXundJ4VGh
	lXJM77LOTHXidoksc7zONmy1t6Xcm5NAQ5LwBvLhgk0SQWa9a7m0QNSbNmiP5v5QcEJnOXxA6Hv
	69nDf3UJk1tzhI1WGxWXmkPv45QgTKBTp2Iwk9smFJD6BK/fwHgXm1UzFPo2nlJ3iOYCYrCS0z8
	Ixs/U109K5Ch3hRuTbbPB4aD2W8V4/oyX/lHpAP+QO3A7ciKnu1HsolMQ==
X-Received: by 2002:a05:600c:8b86:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fe6701ed1mr48662085e9.34.1790263745003;
        Thu, 24 Sep 2026 08:29:05 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:04 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 0/6] arm: sunplus: add Tibbo LTPP3G2 board support
Date: Thu, 24 Sep 2026 17:28:38 +0200
Message-ID: <20260924152844.81705-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tibbo LTPP3G2 is a board based on the Sunplus SP7021 SoC:
https://tibbo.com/store/tps/ltpp3g2.html
It is the platform that underpins Tibbo's industrial IoT products.

This series adds board support to linux-next:

 - Patch 1: vendor prefix for Tibbo Technology.
 - Patch 2: document tibbo,ltpp3g2 compatible string in the SP7021
             board binding.
 - Patch 3: add device tree nodes for SP7021 peripherals that have
             drivers (PWM, watchdog, eMMC), plus a label on the
             gpio-leds node so board DTS files can override it.
             Also: move memory@0 to the DTSI (512MB is fixed in the
             SP7021 package), and remove unused board-specific pinmux
             nodes (emac_pins, sdcard_pins) from the DTSI.
 - Patch 4: enable SMP via PSCI 0.2 (HVC) on the SP7021.
 - Patch 5: add the board DTS for the LTPP3G2, covering eMMC, a bit-banged
             I2C bus, PWM, watchdog, and two GPIO LEDs.
 - Patch 6: update sp7021_defconfig to enable the drivers used by the
             LTPP3G2 and correct a few defaults.

Tested on LTPP3G2 hardware on linux-next-20260916.

Changes in v4:
 - fix problems reported by sashiko-bot
   - fix PSCI method: use smc (confirmed by boot log: "SMC Calling Convention v1.0")
   - move board-specific mmc0 properties (bus-width, non-removable, etc.)
     from the SoC DTSI to the LTPP3G2 board DTS
 - fix similar problems, i.e. nodes that don't belong in the DTSI or DTS
   - move emmc_pins pinmux node from the SoC DTSI to the board DTS
   - remove unused emac_pins and sdcard_pins from the SoC DTSI
   - move memory@0 to the SoC DTSI (512MB is fixed in the SP7021 package)

Changes in v3:
 - fix problems noted by Krzysztof Kozlowski
   - put the Tibbo vendor prefix in correct alphabetical order
   - remove bootargs from chosen
   - name DTS nodes correctly
 - fix problems reported by sashiko-bot
   - add tibbo,ltpp3g2 compatible string to sunplus,sp7021.yaml
   - rename i2c_tps to i2c
   - rename system-led to led-0
   - rename sg-led to led-1
   - add the missing pinmux node: pins_uart3
   - fix pins_i2ctps: use SPPCTL_PCTL_L_OU1|ODR, not L_OUT|ONV|ODR
   - fix pins_btuart: remove SPPCTL_PCTL_L_ONV from BT UART RTS
 - don't disable CONFIG_SMP, instead enable CONFIG_ARM_PSCI
   and add psci to sunplus-sp7021-achip.dtsi
 - increase i2c-gpio,delay-us from 1 to 5

Changes in v2:
 - fix issues spotted by sashiko-bot.

Andrew Gaylard (6):
  dt-bindings: vendor-prefixes: Add Tibbo
  dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
  arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
  arm: sunplus: enable SMP via PSCI on SP7021
  arm: dts: sunplus: add Tibbo LTPP3G2 board
  configs: sp7021: fix defaults and enable existing device drivers

 .../bindings/arm/sunplus,sp7021.yaml          |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-achip.dtsi     |   9 +
 .../dts/sunplus/sunplus-sp7021-demo-v3.dts    |   4 -
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 193 ++++++++++++++++++
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi |  74 +++----
 arch/arm/configs/sp7021_defconfig             |  32 +++
 9 files changed, 278 insertions(+), 49 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

-- 
2.53.0

