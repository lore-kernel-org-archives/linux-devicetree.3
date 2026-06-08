Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5855D3CFF79
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928548; cv=none; b=BSqAP7OIOLwV83UnowG9EO9+8Eu/4J0URTxhs6/MYgX9UFlJoe+l5f+p05jhKBwZbt15ffj0nvdQH/KSHJyyVK8qjSaMJJJko3/TZpQVd5i3DRd8hmIPVTeB6YcY8boOSmnLfOH2BJ26/W93mb+P57MMNjLSwgspD4TdXmxFAjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928548; c=relaxed/simple;
	bh=wzKX3PZSvEsg1ltSh5uHLZhsRsknb1MpSSDieocByRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AogzhQjdv5ZrQ4a3dWX1LstxOIVGV+iEVNCD5Z486oTNoPCc4sj9+SAzqRS0woEEMXSdWwvdFGTJsboSpKip4HljllwpEZLwtoodfCEC7uVT88+akQtJbOFOfCIIuFPLebrvzDfhvlo0Mgs3DWsO2JvkTA9uwO+GJs4bd3XWbY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JB4Zp65e; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JB4Zp65e"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso678608366b.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928546; x=1781533346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8d17gntFj9cyOcdFrgQoUlzT+noL9BgQQAWn2N+JpH4=;
        b=JB4Zp65ecVLQImDInuRP2oBGGTK1a45Fq0M8IcutDodPqZu2awVEu17Tf/FVr7Ngml
         T/KXrXA2lqTAEax5hGEubWnd7PKHCcNcuewLMgsxP5a8eOEcdATYadtiwhHIWd9ElN5D
         FGnL+eQIMvKZQqBjZYoDpOMdOKbOwVq18PBmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928546; x=1781533346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8d17gntFj9cyOcdFrgQoUlzT+noL9BgQQAWn2N+JpH4=;
        b=EjveIm2UxpZpcCj2R7Y1JDtKEUy2riQs1YUcS80u23ug+/wde1fRfI2A0nANMo76OA
         4fsmHA4aMTeEkROv/d7Z9SBzlz4rO6lP/yNs6z/0caBcgElADmcb53NmaxPkpTZDWb1y
         DDJC3Ke1J7+XqinEe88E+HxmGrb5OA2cNYOcpRzOxGJZRkFdnPgaLx87PXeazKA4P3fm
         IKzO2rUYg+nMGiHsUtKG2X6F/X2aD2d+eTkUVRfNYAtmA3/P7nFSmbch+nUZo2+hpHG8
         Od3mut1NDfrW0fz2Ale2yQQc0TvSCrGY6xgRrKQ+wbpytVGZpcPw8v6yS3rpyOmDTamt
         Loag==
X-Forwarded-Encrypted: i=1; AFNElJ+LduMzh+3PJDznsTMTgO4Lkrc9e4u5NYs+Oep//pXrgDcK7+LhLW09778nQ3uwWzs78zauTzVtA3+r@vger.kernel.org
X-Gm-Message-State: AOJu0YyqQbqonG6sko94tR2VZiB2DZdKbJouRihszcbebD1gZTBZBjdz
	NkJMRtp1JJqqu2e833NjRo5A7kan5YZXQ2SjBFvpzV3K3yVFDglnT3MClQq58It0QQs=
X-Gm-Gg: Acq92OHEe5AUlFIAXqK9byz4sc6ZvTRlEwh2meA87i2Yxo2My2aAMSx30Wxkpk7RMzX
	45j2u5Uqx6VynLLVCVF3RTMDbj7KHQiwfYxuPHKXbKVIsamoyWgkXdoQrEuF/rPZk0Rg/lQW8R9
	+MQwX4dSvvqrbxoXlKbHLPnawY5pILrNwpbScyvE02rprpJSzxojblhQJGQK6dSSo/Gy9L7PZvb
	EZkWW9377aA7LxW91DLtFsyP0vPyJC8Eku2DZ2YHB+PrVMa08Q9LSQMPVI8nL1XV+uE074+SJo4
	so20BvV06yDgIcVhSDezfrMMGYn493sif55URAXSgVZjiAIuqT3mB5P+1t5Y7DchCulW15JxGdd
	5o15QJFkrfrwjun3EPeemexUg3nXrHxBAYw1oCBR9PRy1BfPF4BOd1iA64mAu8FKA+Rnhibs0Ld
	Tncy/FUk9L5JMvkf7koITnumvb1OqUI9cP+Sa9r2jOpvkAtuhJ1CToFbosuWECxDPWfEz5z0Gq6
	/weFterLsuknyBmS8fFRYuDTQCUVYkd+3cjHltkCHBQ5N/6Ts9KA08yFo8=
X-Received: by 2002:a17:907:8b93:b0:bd5:2859:ed0a with SMTP id a640c23a62f3a-bf373306ce1mr774111666b.42.1780928545606;
        Mon, 08 Jun 2026 07:22:25 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v5 00/16] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon,  8 Jun 2026 16:20:17 +0200
Message-ID: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
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

-- 
2.43.0

base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
branch: stm32mp257d-microgea
