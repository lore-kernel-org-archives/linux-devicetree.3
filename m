Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8B61F872D
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742954; cv=none; b=nSA32RXvipMDlje7lsLaKDO2NtrddhNR6eGHS2bw59qfxz4C4vytuZmul1KpkQx3BOgYmRICzgmLn4nl9NXe50FXEi+oT01UwLJuYVF1VDSgutPDnsyAB4uT9G69GV/fRKWPF4FAkkE/3TsVgNu0995opxGEZRrQZzyjRphfH9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742954; c=relaxed/simple;
	bh=hGAi0WTRg7EACns+iHYSC0lWuYgsTDQU48jQp6f2DIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DboFZ6IBQiQASKryxvLzEkupLvi8m513CmkOsgb5b7ixb6Vlg3/alNho6w32Qf6zcV4jNM1VtmF8rd6PiRAeMSZGQNk/uqgrQkrRXEUuLd1tc7sWoYSNRUtoMILCnqq6u7yEaosV8kVOPI1vnEFeAuRZAJNmvc4Y02G1Kyl94hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eRbIDn8J; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eRbIDn8J"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so299391f8f.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742951; x=1786347751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNlUdtZv1U92AaYRcfJDdfYbwR3SmucTbtny3HUIZ2o=;
        b=eRbIDn8JbAljBhhf+DS+ntkPGBtYm4ssRxkTukXv3zLUKXzxII7MXZLUjHepSRHCqn
         4U/2+F4W0M+d1aXqyuT8HN4JdeWuXbdTd/7n63W476eEUeRmyAmAKL0rLUJ2+AEAkmeL
         lxYBAmp6cGQhR0Et/kyI1ndfW/IQV4wH99XN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742951; x=1786347751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNlUdtZv1U92AaYRcfJDdfYbwR3SmucTbtny3HUIZ2o=;
        b=LMCCQnceblhsAIDyo0r7zbUSCj7qfdlsGTUvXg6Uuctn1m+VyG1KZt50WCFH/Y+ovN
         OLgeWQVEy6PmE+ECd+2HTi3DDd9C6949nunfGIMe7j8SiHwbhEeoyvYFsb7Ub4OEPIYZ
         ibOKJuFHhCaHbhWAZ4SH686Y9oBrxL1KiZYk+dw791N4R/cXtvqEd4kUTqwS+0vBtMUz
         +YUbO2MoBCvhr4hVvizSAoZlKaAr5xHTNkgKRZ8H688bXfCJzY+ISAGnLVkvhs/Y92di
         pWBYEXX7jxSgxLmFpvHlDfEQa7RWSoZQWRJ2I52NT0+YI5cz+xIoFhBYdl4X4O6RjG9b
         4Y6A==
X-Forwarded-Encrypted: i=1; AHgh+RpswXgvjYinA9abjjG8otoZUFfc+aHVXX2GlOgjBvlvV65/vQhcGokAPduzpf/qB4omTHvgQy6SIzqO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9bVTuRduBnTmLyX+WfYXw3OQgLyvRYMxAfjv2X/xE4UaChUXo
	BHWIE9+Yx8fYYaND/7ebpWJ437t+F0qdzYzPyCCwTMmPX0CFQPc1UbvNFXMPoXFuufs=
X-Gm-Gg: AR+sD13ZqkT3Vbr1tBDieRDw4sdNldo+1GKGVer8V8HvtojP/pnJ0gUkSxQwtjNmH1P
	BrRQ+X+xAwl7kQz1P0m+aydGN4ziMxdPekegiInXCTVbA/y1B7333oX1pmdNTkewnlUCrZMr/NE
	BVduoll2rjS2Zyn6W55STzSmgXHjd2wRmAcvP7tEOO+YUWJTMwZldkph3BP+tW+/18ItLr2dpBC
	IGvIqLvs9+08lCWPR60ulxFEhyReM33GY8hNPmqQ276I5bk/Fj5UVBr+hJ6h0vPI/0KwwY7fzaW
	5BthitIlVXuMzE9eGTmMQa1ao7cdkzgI5fZN3qBBiD38pSxUiLEwpiyV7P1LKgAz2uie802sdR8
	PXF5nvk3SYpaU1D4EQsahBA8NOlhUu3ALT5WIfjdvkBiQWlgSRHJ8AvGfGrY5DrpiY/xgd9Vp+m
	9m2jI//7pLfsVz9Ikyt/7sp6S8zzr+enkU9Xn62XrETK5iSSYpa4pKIBCUwnzUnWgvwk9L2x3J3
	zn+DwExTTh5EEcAM8w4LkbVl5JumsliQOBJyilzEJ+LzTuiMWviLbev75LjAUGSJQSY6AWlr9v1
	02qeBgg1KTNg674nCPpv1sPPrxKzMlLfRktNbLcV5CAgErl6hzOHX7v8ezOPD+wvTh9vaBDRIMG
	Eaj/LGAdWkRw=
X-Received: by 2002:a05:6000:29c2:b0:474:530:9d with SMTP id ffacd0b85a97d-47fd72b03e1mr15197737f8f.13.1785742951187;
        Mon, 03 Aug 2026 00:42:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
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
Date: Mon,  3 Aug 2026 09:25:55 +0200
Message-ID: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
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
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
branch: stm32mp257d-microgea

-- 
2.43.0

