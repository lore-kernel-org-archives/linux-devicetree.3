Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964543E7BB2
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811600; cv=none; b=U8QtZKKRSBqDxu0XdLnJqHoBUKGEutkYWLngrASp4jTjDRjwaXxWBawbggvkUipL2QOFBqDM+IzzOZ0fteyJo9hTUlm48QF/RVcZIMyOSDitLu/SDMoWSbu7I0q7+ht0USzj+JZI3WWYTwn6tZab4aUut9WtwOhHaakt2sms73A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811600; c=relaxed/simple;
	bh=WMnKVGmIbMnewINmrlX1pWzL7NnrQOqNeEnd6Lv2xZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ccdnYsPfI9WlzI8pQPcQVAifzEromxaNOnE1++r4SVlvPplScFNcIHBZiAkGQ8yBWpROm0Ry2PUYWHzUo1Jx62w+urHCVpJj7GmK6RkzefCxt7vuZP2uFV461070d5Sf3Q6k9FQgYCAgZHKeQrKkADjlIwKvOxw8RnwkGHinibM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iDlUQKJY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iDlUQKJY"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso293561f8f.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811597; x=1783416397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PY4raSb+03Q151+o910Ev5GEEhs0CuyMwWR2MvgczUQ=;
        b=iDlUQKJYcpwJESAOw681tU2/dcTFraIxF4Fu+nEGfIgiZQAELocFGtC5lQKYR6FyRh
         tDHM4M4RsSUaugN7Pp92SSF1jBRVtzZLgzS9CFhFRw8frdo/LR1YGsM/5HEMGBS9VsU6
         NRu5cETqVM86jsyx8YdjbqpnIijlPKGyuapio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811597; x=1783416397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY4raSb+03Q151+o910Ev5GEEhs0CuyMwWR2MvgczUQ=;
        b=GcPUhULtG+UK8V23TnxAlJCFj/IsxULCK5w19ZeUzZJ9NirZWZ7F7zh8x90yD7gSwl
         X/JGtujkjdzDhoib32QdmBx9avHc7WbSu2KiItlWnP994lL22/kLOqUr+5ttvH34Lwix
         Bj/6I4AWGgzpt+3RKVdNLZhfAQqBCEEdDc1xLsG0mNol+Ccp4aIjDginMSMLU/o/WrfD
         bz8o136LdCIgZ0wliP2h5ysahEW5XpjWvpKXZZrCV3LaUHlDkSSmOLGBHys4oRxpKiOS
         0v99qr8zwOP/zbnRClxmNDK74q7aJiKpelkEFdffWtfqI6IKnd6y21cxp1Y/agH7zHVq
         xVrg==
X-Forwarded-Encrypted: i=1; AHgh+Rqj2K6+AnViKeDfInvwAFsxY/nRvTCqnolL/K2XWZd2jhYJCW+ihip4QVPhD/dbDhAOxTC2yK/i/7Hs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi+dEfW0bHLbaQ89BWcyLMHtNntlurecs7oIsefBpXJzNRQCMB
	zPB8XrY6yRlGH+x2Ks3wM19TC/4CIjpF8UwBEl8TY+ngSEPLp3SVY9lAXK+pLx48P1N5GfN7xuF
	/YQ3S/Ak=
X-Gm-Gg: AfdE7cn4tZMBqKJb0YKAsciBSnQrQbh9p/30naufzuWhzmIyxKs6irQHFLcd3Ez+qas
	ljBxg3wbckxaMh3W0T0FhNXjMzEOPt2EaVylPr66T32OCpJYRj/ceVLo2F+si7UJojW0hU31vMC
	nNRgA6/3FGCRwAuDLAoSISe9xxz671plI1vWGVa9ntmrjTSu1MOfh+++iteGDjLUCh8kkMB1279
	lP8K8fFHOjiitY7GQClRoYlNisAF3ClzKsAkv+pO5/iUwoYaaVVKtBJxx7/zpf4jsu3XPJXLVpR
	9FUX7sIo677XOS7WeLk7bgIjMu437tuTI4wFYviiI7udhEe8Ya7MYryg33jUJTbvPCilFgMld0Q
	LVSg/cAtWfyzMuiSiAPwQgZLhwVd0jLJ9yUNw3M1Tf/E+4CW7qJh8JPJuPybiAYBNFEwYbsVff9
	MYJH1bq3OnFEYtv6PPc0a5pt+BO+q1UKg9uZ19Mysm3xSsNbYeBGAiMDlanVYxgrPXcxcCuawRi
	W1ZfVgDWy9I+LM40m96e1AY92SSuHxTeQ0cGywJ3Tw46ZqpzLUdVwCvSd2J6zjUFbE8o/SsHW+m
	neYz4ngDf9py3Q==
X-Received: by 2002:a05:6000:298e:10b0:470:13e1:9904 with SMTP id ffacd0b85a97d-47550ac1013mr2447885f8f.14.1782811597042;
        Tue, 30 Jun 2026 02:26:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v6 00/16] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Tue, 30 Jun 2026 11:24:29 +0200
Message-ID: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
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

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
branch: stm32mp257d-microgea
