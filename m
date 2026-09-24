Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A83BE175
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268594; cv=none; b=RvOtqHzyMs+Yv6Mm7vEGR4TDOgjG09gzPRywSbi0Ip/lbO3ZCGhcwiVO3bSNFXHT5ywfGqCJ+QFKUw9WnaRQ5eIRBtCmR+5SDxcmwC5dbtM50wHsuhmd9OKAE8XNsKN5s6QUyT63zYLOmCftJRAqCnIuDpLqBAtLN73jBzWlrgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268594; c=relaxed/simple;
	bh=z3YNcERLXAsu+ydMTGinqWFcJa3xwgBMGi8bloE+LmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+Lajdam01bLGDmmthatj1Mqw1tRMKdgvcXQmdFaRnHmw43fk5m7Gls1khlrl77kubauZSEj6VXg2TJKOvUQBh9q8M6iNdosvHjsvbJjYuxfsnBzPyKSKYZMRrnVxoVtoRihpaOBZBgvqpvu3uhA/qS9M4B7TozlEKnM0vFzHhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=N9aVlybA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="N9aVlybA"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-488615e6cfcso477422f8f.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268591; x=1790873391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hj0UVsfYiWhPlWaYB8MRXXhCW6m4U+4Gy8c6vjRO9Ts=;
        b=N9aVlybAOXPw7p+1KaWt2oDh2d2IUmrFO6A9QoCnQZxjWyVfK/7Jve15Lj7GKdSecB
         A7G+PgnVeHRpKnELKmQIpK38H/mhC91qgDXk3U/Q3TBO8hLg4SiyXR/roosuKyEtTh1C
         dBjyFydyWEergu4+2eP54ZOpRdGyEfhNFpIr8hwNGBZJ3xLT2+rtlp8xRrGUV2yhzhxe
         6xriFREemCQbGGRiWX6ckOuhx1rj/Psi6bJTDIjU7jn+/TnxyEfIKPi4vwZ83mDSqHol
         gySphvTcyq6ajH4WE9qWIERhryxOh6Zr8xm6fB6jBmwTpjhcI0NAK43ZpyBiWuwmA6fF
         ckxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268591; x=1790873391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hj0UVsfYiWhPlWaYB8MRXXhCW6m4U+4Gy8c6vjRO9Ts=;
        b=G1z6CJki3U1JjIB4dbOSsW19ZWQ3e6rWBbjVeCJqUhI5X8+ANlqgZmvWPV42+cj0BW
         Hdi37wI6vZptm+Uj3Po4QtmxoqE3626b1n/or9qKPCJYCnuf1IS1JrwsBT52+m9Eg/5d
         R5e0Umt5jztwCwiuX/8bVo8haNjKf/tRcaWIz06C9X0vjj3Syjpu7QrIqmzDUzRPXMdn
         n1CNzKrpwhNpWWzuhCgjm5e3mR7rpQwE0h/XP/emdlzkMAfQo8FWHX0LkmkMjvK7S9Bb
         wh5+QTfYjodm80+QhCL1gmmZSqn2phJCSO4qixEeOC1lWAqCdbtH6f32Vd+C+4fACZix
         kztg==
X-Gm-Message-State: AFuF++lCgBkahYxSNSlX2CZsqvtmjLuQm4RiExxAr7FOyWVTUi48oXAZ
	S7yxWU1hYPemwhnT3ujX22jvscz8vcOGM8IOfYtltZWZGYNjzDnjQlGX3SqImZ9eHCw=
X-Gm-Gg: AYBFou2iEja1t4lcqONC82Parr/d6k5gEqFkyvPmiDLBrlWM+hdNKr84Wfn0nz0sDPN
	podnbv1Q4ku0PHbaIzeJo7DqXeJseHS5WJJsYgAINJ0fUl79KcPvQKXMmVKuVBqOu+ZREQ/HJEu
	UzY/mCb7S4utrITXDWxkruLz4wAA8IIk+cMwFNvTkINwQwaAfkDgNW+Rkuqw9GmCJygd3ds8vak
	K0z+Q7z3fsfJRHrlL8J9ojhGtmndcawGuOuVx0bwV3W9WLNu2oRhq1xxK+FgCseCdz8FkrpuRiM
	dj/sqfb5ahw/SgPQzo0Fj29uvAWJj8xpmhqgCVdcb+albylftmDxGVMvMd53QMID+seg3TQyucn
	eL1gduFlaelK58aOvhsWS/pgcVihW/DhjWH8inMDvE7SbP2gRdjKSLFSsdiyrTuBHqZMEK7YZH9
	a3vJKwdnV63zgFIO4lNqSP5zuZzyahGTgoKaPp6Ky/2d9/HhQJXQYvapZ30zbAzEIpzQO16Aw9/
	olKLOgFaBVSdL7ni6JGFqDWPkIP7Wq+5Ry8Au9BklesSHY=
X-Received: by 2002:a7b:c314:0:b0:49f:bb49:9cca with SMTP id 5b1f17b1804b1-49fe66cf67amr42471505e9.5.1790268590783;
        Thu, 24 Sep 2026 09:49:50 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:49:44 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 0/6] arm: sunplus: add Tibbo LTPP3G2 board support
Date: Thu, 24 Sep 2026 18:49:16 +0200
Message-ID: <20260924164922.117236-1-ag@ffroot.co.za>
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
 - Patch 4: enable SMP via PSCI 0.2 (SMC) on the SP7021.
 - Patch 5: add the board DTS for the LTPP3G2, covering eMMC, a bit-banged
             I2C bus, PWM, watchdog, and two GPIO LEDs.
 - Patch 6: update sp7021_defconfig to enable the drivers used by the
             LTPP3G2 and correct a few defaults.

Tested on LTPP3G2 hardware on linux-next-20260916.

Changes in v5:
 - fix a problem reported by sashiko-bot:
   - update patch 3's commit message to explain the removal of emac_pins
     and sdcard_pins (unused board-specific nodes not belonging in the
     SoC DTSI) and the move of emmc_pins to the board DTS

Changes in v4:
 - fix problems reported by sashiko-bot
   - fix PSCI method: use smc (confirmed by boot log: "SMC Calling Convention v1.0")
   - move board-specific mmc0 properties (bus-width, non-removable, etc.)
     from the SoC DTSI to the LTPP3G2 board DTS
 - fix similar problems, i.e. nodes that don't belong in the DTSI
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

