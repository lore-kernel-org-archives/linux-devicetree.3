Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8230D3FB
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662009; cv=none; b=QjZAqqaBe5OSBhCsQVZVNEWiHRLONFm4c7BIdA/Et41UCEIcdy/08zDPyFP3/J0yhGwNiDpVraPND6VHE0ffDZo2NZiplgL/2dSnohLWHRQjGc+fcywU1COeChX6yWs+yU4lgrGJpMZnhpgiykCRV+CgBP2KcUsc6kyE+3wung4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662009; c=relaxed/simple;
	bh=OZJ954W5130Mrrzj98QtngtTl9qDOLHLImyuFxF95HE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwJFG8YEz+yx72VGiv6KgUMatb0VKDDdnrC5P5QTlvudB8Rog2Lk87Y/7W3Kc31xPVdvRG0QHfxhnuufhpKdTSUUbS9ccfaZd//MyNSnUFHA763qlHRmFp9XWSwjmNvFOuFnoJELos3Xm3c+TT5Tem0IPLyuGOOTrSfLrqbBBUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=jbe6aSR/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jbe6aSR/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso982007f8f.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662004; x=1781266804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j3xkv0HBViwXM4G89v0xA3hOcnT05xWI/0dQ5Wz6JfU=;
        b=jbe6aSR/fYV0cbFoFlL30J5gz4AceDnEl3UFkr36SOB4muXAVNDz3WCL6got0F5vMN
         AQy9BiPtTAIKde3kv+N+bA8FRV82mX+HlhX7r9V5AAbys0jziTzkHmQFz6+pIL0GDCwf
         WufgRNl6XL3PHwnZzHt1dM6Bl1SCUcEbRvnYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662004; x=1781266804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3xkv0HBViwXM4G89v0xA3hOcnT05xWI/0dQ5Wz6JfU=;
        b=Cg4DOp7R9YJsnzQBBT9kelYA+lNO5gzqJJNHzHA3PhOxv7Yib/7349YGNbRu0LTsdn
         jVOhHcYmryrwthqiSV6aOaq9/yQeV9NT7utEYw665TsryKJopPpm0zqLB83EDtwumHcA
         43C2kwHNQWPNwTLYZst5n6HntqHwa+LOxp83xdehLnUH6rGGas0Pzhb+hAxIqJVtg3BD
         FIAHFOaFOUgKoN0a4CcVE05eglTmxcdXrOeJmJmq7fdjR2iy//aWwirNDzyoTyzN8Oay
         aL8YxLj1GucYJ1uAiNJiwYQx+p8HlKD+Zw0myF4hRaMF2bteZhgFSRAz2ucTtIzVsUsV
         7ang==
X-Forwarded-Encrypted: i=1; AFNElJ8U17LnavLHBvVnO5cwg5CR6WMh9ZBtLCOnZqZ/ONe/MTKLju1YgoukvqnfcKxd1OPy1faqmWOGfeEn@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2OkQ1wwv2KI2opV947zzpyHRE8lJzrKKwS1fyY5trrHO2qCW
	aG70WKv42aWYC34eRaeOqGW2o4lFE8YW2swlWAKtS+xLwmD4IyOnrU/lvC0o/OoFqJI=
X-Gm-Gg: Acq92OGDPVeGiAr4W9EnTdLHa4rGnDqkWRCfd6qYj+MF8xj79WWy7YPJccU8zF9E8QH
	jmKpIqHPddCFlyip/YEHBEctnAHD8WmcpInPAYikRlajVFSxVB1t1hdR1uxhXI4EV21mcmReMce
	sFXu5sGHG1dOYwf5HrJfgOYopVlcQ5aNZgqExzwhzyZPd1dhuB3CyHMgzxNWy+InI6Yw0q+5RVW
	4IS89+lMtc3vuDoQw0dvoJxjaTBEBlgzW2EEyuO8Xb16UHUZF03drtXsXDsGuiKlO8Z0lr5SX31
	AxYc/L+bIjGKeGGjtAuk8x3IUFCTR8nAg4LrF2R1+CrwxAk5RWSyDbHqgXmgLjUorP1P+kyHaC4
	UOAKxPRbds7X8tuRWqVLBkoUE08ZsHXBCcSPskx2fbJW2J5+hqTgVEFip3sA8nj+SrH7nEotef3
	Evc9p3b5O1rugUhUymV0ccHf5NUEso2s7orcWRSkoEnE4ndEcUz+BNLr7or0otRuw+BQyBsKsUB
	/WWzUVibhrSvmBLyYz3QHz3Su/rV5fhCPx8OpVxr+borK61P2tu5eTNSnTgtipbbGWg6E2/05VP
	7H1yBIMegAfui6ygfA4qv1vz7hFhSWTAUQU=
X-Received: by 2002:a05:6000:41d5:b0:460:3210:b6e9 with SMTP id ffacd0b85a97d-4603210b750mr4636959f8f.41.1780662004574;
        Fri, 05 Jun 2026 05:20:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Huang Shijie <shijie@os.amperecomputing.com>,
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
Subject: [PATCH v4 00/14] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  5 Jun 2026 14:18:11 +0200
Message-ID: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
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

Dario Binacchi (14):
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
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
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  16 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  63 ++++
 arch/arm64/configs/defconfig                  |   4 +
 8 files changed, 754 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: ddd664bbff63e09e7a7f9acae9c43605d4cf185f
branch: stm32mp257d-microgea
