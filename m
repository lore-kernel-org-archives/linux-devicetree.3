Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DFC2FD69A
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096535; cv=none; b=bPWgoh//+vzqqHe4nxrgPZGDYFmiMwQ9tKZtNxc6dLuDBa/cURwTX3/NPnAmNaXj54GhdOgW4kRbY4wy2g7PaqZcuedHCyWNHzYKR3J/dpypqtvANhV9+K7tKb5juFFBRlu7KeAVJyJtRl7xR+aEuyE8oL+OQZ1JIr1Onkek4JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096535; c=relaxed/simple;
	bh=UF+HdxboCW3rt9Jc7z+f7jXISebzm9WLyd+8gJ3Wa44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ufqaiBeAUUBIuMe2YfYhWJ598J/rtJ5VsE1m5bNBTZ5ncZMNqK7icH94bqEt0+8ZubMy/7J1TQ2snXB/gkATP6qATY+RF7T9+Z+DhkePGPXxSCNrZgWNfR9/sEFcrVIO/GIQc6Vn0DdJT/H9v/DXSdEGLB76wov0NZHIKjxHs6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HQf6WjZB; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HQf6WjZB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso10608769a12.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096531; x=1784701331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7/O6qGB81uqhgF81zXc/vEeCCHddKD/wXemIEHEACg=;
        b=HQf6WjZBugkm/E96bh0Y1LKJWYBUw3Wnh2XUMl9IAtaKs+o0p7uIf2Fy4of3nhugCR
         EsJ54DqaXlC0NQIz7aMWP8KwhA4TpFBQPR5qElCucQuNgj1fEyKBBOjtdg15yHYZ1vzD
         G7dRj9xEIvmnrY4Lir1yLl1cxe1bxcrviKxis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096531; x=1784701331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7/O6qGB81uqhgF81zXc/vEeCCHddKD/wXemIEHEACg=;
        b=jtqCGtdhMksP/ROJQYB0vjRuaehPBBJWvcp7N+FlwoFl+n6bKed6wpmh4PiaVxsU+u
         m5o7My7743SAwHE/uVOYcqEeJDkcsggIX7yJkIo5FcAojjGU10Bg6pJ1uxk01SgE2gYj
         lN+hLJ+oD4mJgAvI3eEwb7espJOvC3V9oMdnIM7ym7zSCMpIepmm0B8niUxmXtmvG5ey
         PmWJTz+83I/bZwsfQbk8tXy8C/bbJVOXo28zm2+NvLHafDKRaruda3L5AD69GOjTQ6c+
         fUTHJAVJ3dP4rPHuf698ydQNsSVnE3USDugF7V8Xcp099+Sg5JE4mj4TZSePVyO7052N
         l7pg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2fExazHf1EMbnxV6QaNGRnr5z3gQ7Ohlm8cdze9M0vfAgHh56CD+BnYx3JKw9/Mh4/l3PUXOReQOp@vger.kernel.org
X-Gm-Message-State: AOJu0YxHj/dqj03/tsi6yP16x1x9W//6yGuNmXR+FE60Le5P5NQUDw3h
	mBZlIBKv9pJvFsdA2mkFNJo2bFfxZ8BLJgj4tYwXmvUdmHA9PxD6LtDrs1Qs+OGOtp96TX9TY30
	H62JnrAg=
X-Gm-Gg: AfdE7cn/UPZhy1RHfHN5MUihEtaw2HEuZRu8+1gtft529b5LkgV3nygLSbV+t1LIMRG
	SsAosAyoTjgH5bxS/AIWbs7S2k5+llQ3wNxbugZ1tUZh05kE9Nvi8+uHSGo9IDuXox0CEQDTaBE
	bBPfEgCAUYYpxRbfKdDo+9WlcLnwEUw4p5x+Oj0WOGHQCNprJXgR2Z79ztGftc+FcrLmPZP1zm5
	uSM6xP3LQuiy5xjPM/XeZyJfovyYPlCWbTuEvN/T+miZJP+5e1jA4vQvhTmrzTmbRhAVFX8K5r4
	AlAHAY1xR4spJMuhLKKZxgCMkD9eHM4QNPWxgr6X9zI7pB1kOBLZyLdk1H/Lyjibycg6IwfsZtj
	fN+aTshf8ZlyVJCjgCuLbSv3DlisH1UHL47dwUCRZvxU5m2l94LjYtF1AFJfFrbgqiFRXERG/Y3
	6bGMtUCSye1s5egboy/zMAEFpIQRTjDnlQLp4SJB3tOgqXPI3CZlm2fEXpohxk8LMjzU7N/Ld78
	22XWaG8G4FT
X-Received: by 2002:a17:907:608f:b0:c12:d42:96b0 with SMTP id a640c23a62f3a-c1667aa9699mr327593566b.47.1784096531463;
        Tue, 14 Jul 2026 23:22:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 00/16] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Wed, 15 Jul 2026 08:20:17 +0200
Message-ID: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Changes in v7:
- Add Reviewed-by tag of Olivier Moysan to patch 10/16 "arm64: dts: st: add
  sai1 pins for stm32mp25"
- Switch CONFIG_I2C_STM32F7 and CONFIG_SPI_STM32 to modules in
  arch/arm64/configs/defconfig.

Changes in v6:
- Update arch/arm64/configs/defconfig to match the current upstream defconfig
  after merge window changes (no functional changes).

Changes in v5:
- Add patch 2/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
- Add patch 3/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
- Increase slew-rate to <1> of ltdc pins to support the 27 MHz pixel clock
  and prevent timing violations.
- Change SDMMC2_CK pin bias from pull-up to bias-disable to avoid signal
  integrity issues on the clock line
- Fix touchscreen resolution to 480x854
- Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW

Changes in v4:
- Drop inclusion of stm32mp25xf.dtsi from stm32mp257-engicam-microgea.dtsi

Changes in v3:
- Add power-domains property in the SDMMC2 node.
- Drop patch "arm64: defconfig: cleanup the defconfig"

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"
- Add resets property to dts CAN node. Suggested by Sashiko.
- Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
  to avoid overriding the peripheral bus clock reference defined in the base
  SoC device tree. Suggested by Sashiko.
- Reference the existing labeled nodes directly at the root level using
  &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
  redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
- Drop the #clock-cells property from sai1a and remove the reference to sai1a from
  the clocks array in sai1b, relying strictly on the st,sync property to handle
  internal synchronization.

Dario Binacchi (16):
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
  arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
  arm64: dts: st: add SDMMC2 support on stm32mp25
  arm64: dts: st: add CAN1 support on stm32mp25
  arm64: dts: st: add i2c1 pins for stm32mp25
  arm64: dts: st: add ltdc pins for stm32mp25
  arm64: dts: st: add can1 pins for stm32mp25
  arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
  arm64: dts: st: add sai1 pins for stm32mp25
  arm64: dts: st: add sdmmc2 pins for stm32mp25
  arm64: dts: st: add spi1 pins for stm32mp25
  arm64: dts: st: add usart1 pins for stm32mp25
  arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
  arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: defconfig: enable configs for Engicam  MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  17 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  63 ++++
 arch/arm64/configs/defconfig                  |   4 +
 9 files changed, 756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

---
base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
branch: stm32mp257d-microgea

-- 
2.43.0

