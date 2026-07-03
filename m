Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE835282F18
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061492; cv=none; b=amrV2tvQB3Sly26pt+faOwEyLEbrPn3uDl4FJEdWMG5Fhe/JTqmsRNbAI/MYNEKJK3ZCPHu+j79UFXqNu63tShHFCHICkNL8xOFq0Fo1QY03FfttZPaiqLu4Qd4Jyb+W+fseOGFus/Xkx6MADC8E4LdHZ0OEwpj56MX5irH9v0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061492; c=relaxed/simple;
	bh=TirkQq/rnRyIGz8VgarLUnMG2dvwBl1ewWUGxy7NQg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFp+lV0+Py1cbhWRP0Nh/pPBk3hLO6cJm26UICZaZ0fagW4PpRgjcFaLpEG6aD9zbLYXnt6FzNISOrR0NNnFzglRs8rSciQd7w/7j5j6Po1cvbrR7OoUbJl3w19ZHC3GrVInxIQy31U2z6aD7IHDr8Y6/kdher/rXVYUovhiDpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Eskm3dMg; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Eskm3dMg"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1268f71572so196482566b.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061489; x=1783666289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NwD4Nh6jVsTYRhYeDtluByQtXRpd4fuJ0RlrPGu+G7Y=;
        b=Eskm3dMgzIK0dmGZpa6QANuOCxIcTSYoH1XBckP9g4AojIA4SaWf87fh8FV3gPFsR5
         YYFdw2o8mx2mOUNgXYpPSTMw/B3p0y6J0eKNnxCad4SEeCTLSWI1S3sz4QP2624Dv/bB
         ho7g1kNmo2IP8VWnd1tH/jWtlDwiGIss9MlU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061489; x=1783666289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwD4Nh6jVsTYRhYeDtluByQtXRpd4fuJ0RlrPGu+G7Y=;
        b=VyXZudcn3SM5aQdzlnH6s0PjzO12930iF27Sc7ULiIjVG1Z5TpBUJOReJ/RTtURsJ+
         +t4sUnKRphasfcFhzdS3865axcNk+ejvlIu73r4ibnNz3DIuOq/jtM2IPsM8ugQ7en1g
         /N2eB5vwsFAGb+Uet2QTNqstOZeGXRTU3fNL3g4SmEgrQ9kjdJ8WEzaxHsnnzp6KRxMn
         jhurl+nC7nKl5VNFxl/cgKU1gFqfPFSOz0i4+M7zuWnDbDBpzNMT8CqaGgj5Xr7RuEV7
         8JLSQBLir13D8BEhwX762lIzTU+zScAJZTz9NsObwdPBnuaC81tN8WKD5IwjhXEyuQWb
         MfRg==
X-Forwarded-Encrypted: i=1; AHgh+RrW16PoysYhZeJLnxRv/L89RM9nyOmk/CBu9xyubsFWBdIn3CrSzZcWOfRubj6BZh/WxxI/FBOSJogK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PnlExyKHLDzFI6BaaokPBt6iFi9rYi/HCvbjwDN5WixgbEww
	8kR10zM7Er7i5IIi1sligx6MJz2AcHZg7DiD9veqeRXdZpFsO0BpPHjV4Cxeih4RIm0=
X-Gm-Gg: AfdE7cnYMRkrso5Uo6KOZ1Wp6VvEx30aG0VFkUlHV2WlILYxTaDNYOkSA5ETcRkHPec
	4eQ3ZPsK+DCDW0cre2b4AXx91KpVFqJtYPVpgKPKz9tcVyIOfUNkiHXl49nWXfZRc7S+GZFCdYU
	k2eC0E3RvBopFoP87z+eQdK7fuIexJZOOyOez/oNoUkYusmEDuVqwTbzIRQHFWkEQB326+8Akoo
	6vU2wkjjdwT6XoYxSTvzZK1BuY+aLwtNydth3DrwUjaZZiuE3BiDmD2wri/VINYZDZsSGU3WoS1
	JIr0r62jGqsteI7xCOVMvUq1waDdajj5Ij25b31/7kmVo0vSzyxUUq1tAVDwkyRdFm6UZAO8PHq
	ZeF4CSfgfqbVt7FB2lEyCfW3Vik82S3BSb61svI7NfQKgr8sG1+0S3zLIy5Hto34HmYBqsbf3ZD
	YQS+UqTdYAeTwzps6dQHTr5B5WEJpxVhZSr8ag9j21lKOFEp1vB0yvuEAKtwTmwFgxenwsiQWYP
	rDS+uHgn8Q=
X-Received: by 2002:a17:907:c518:b0:c12:b0b7:def with SMTP id a640c23a62f3a-c12c9d6bae4mr133100966b.14.1783061489011;
        Thu, 02 Jul 2026 23:51:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
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
Subject: [PATCH v7 00/16] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  3 Jul 2026 08:48:50 +0200
Message-ID: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
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

-- 
2.43.0

base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
branch: stm32mp257d-microgea
