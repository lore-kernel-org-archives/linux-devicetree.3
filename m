Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AE52D77F5
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217429; cv=none; b=qqQtTLHnXGxvODItzCdms/QY2BfCieIT2J4M/H7sDW5LOqlIqmPrbdFet7rOlmdR8Db7jQI+41lr6LIDW9IjBkjG67bgGh1XVMmUgoGiemptcGj5jabNsip+nOe5n+L/l9GJKJtYnUSF+gYuvLOeS5MxRtLyz8QIudsr/JnXDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217429; c=relaxed/simple;
	bh=exFcWhT/jqnJZ2QjS1SFomYMjSBypEr0QIyyzFA6Pck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BkeP68gNrzHLZIkfXsHYzl2CZNuKl+oaf2auXX6YO3wS3bDtAvvFSbJ3Q0apt8GXp7jMb75ujTojg65E75IG+jESHLXHzn9y70lBI4Y8Quu9RHUDVIqmC4pRsA8o25WWZRFyit72zUVWBaJzlBmmHuu12wttFa3KwthlAivzoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KldiYwoO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KldiYwoO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1277128f8f.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217426; x=1787822226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QAAVwKn0uZ96Zg6BVsqfTiffVReTiQDqzxexuCpBls=;
        b=KldiYwoOcbKyKcOXR9VfLG6Z4IsG2Pk0zNIF6SEtcevfKsfnQaEVqvyzSeK5GjeCoW
         A4BrPRp7EgnxzB7SuWbGbWaOr5CAD76P5q18mEKVo8vEB5a9FFxSRJhcOviJzyVa0maP
         8Bn+e7n4AmO/kXzCgVDsfXrSM8bhK73DXi5tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217426; x=1787822226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QAAVwKn0uZ96Zg6BVsqfTiffVReTiQDqzxexuCpBls=;
        b=llMk5/rAqtt7bur/TuJCsReRehDvV4xfSv0b8yC8HoNQnl8b9SMHzGf4Eyo7P4MK2n
         Gv1aCr14N+sNwEDbKr8VTiL2K5q1E1lJxOedv6xwHAiJEZxHYEj9qkILIJOrq+aS/fbZ
         fCw5q9kGgT617/PJARoZc8j33krbMh6fNMrgbOokv3LGwP390xALcRl8wJLLkMR0LCTl
         A1uCsu8LCy/ssyh+zKpcYcSJYSoxiljP/7VgI++jx48DIqfMXzJln3g56iKCbgJHLO8w
         N523RJF506qV264skM5Qex3ks7e3Ar4C6eLfe26g3fTI7CX+l+/1Zuy7sAUsOyz35egM
         SLvA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3J80PQV7D/+hmVz/zdfgwF9q1zhoAscLEAG+zTlX9isNzUlKD0lhlMuaijr/+2IvuGtuHN5g6WyWV@vger.kernel.org
X-Gm-Message-State: AFuF++nZLuO7JzTbNKw5XpKHJeNN3xmokRt6+kXMNdZz6JK0rjVy9vgh
	xpTsL6K3mncF1l/JMgzukO1BNTfy+IbZ7+0h8ioBCQTNIxdtBJUXabjY341/WbjlLuBtU8A1GqK
	JdaEFD6s=
X-Gm-Gg: AR+sD12dHEuS1ULk/aW9SaT6pV0xNqau+w+5tRP96TCMo0GwwVphKY7wPbmdhs20+2u
	r3AMfNX04xp/d9duRUOw3666nWJayZeKl7HsUiZSLQMq271OgVuNiSLydJ3t0EaTAFkrUWX1tQU
	CKMkuLJG/b3dnaNzUPdF0e36aX41Di/CibkcHOsp6dVUzSNVmYibR+HJr7Xn7npK2FSKPx5iBmD
	Qq78HlGCwdwyyvtLEMebMfkZFn3uQQ6aaXr18gNZrt1IFuE7FeTWYRVEAwuCptrLG7LjKsjMENQ
	tf/SybpQq8vQ86v4BbIjK9G8Irr38q10ZhzjqTCuN1YnHFpDxMDS9pzLjfzBoKRgw/cKoCqMixQ
	E5zPSvSbSG3SkLSdgkGG/05Zw7uSjb4FoOPPUiOII22Gb3S+NOIrUrXdh5Z2ldCTt+yoq6PHqag
	g6olS/7ZlOj4ao4lizKjJ606xS/m5h2JKO+sqOFvwcFivf2xKi86OjGcwjO3DNapGwosWAuhHHk
	cnKEJvhNnA0+nEDvQoiNyWjEZ81L+uLfCZJkfwEB0BMjxsfOOiDUuZxV3ZGgVKV8zj1XDQhXkEW
	Lg/cHhJFX6kRhKd1Tp0Vw9Jo/gslkkanBy8ch5wkIbMX+114vFfo+BeCI4jFvQ==
X-Received: by 2002:a05:6000:2c10:b0:47f:cb39:10c4 with SMTP id ffacd0b85a97d-482b1fd9f1emr18196475f8f.12.1787217426164;
        Thu, 20 Aug 2026 02:17:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
	devicetree@vger.kernel.org
Subject: [PATCH v8 00/16] arm64: support Engicam MicroGEA-STM32MP257D-RMM board
Date: Thu, 20 Aug 2026 11:12:08 +0200
Message-ID: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Engicam MicroGEA-STM32MP257D-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Changes in v8:
- Add the "d" letter to the board name (DT file name, model and
  compatible) as done for the other STM32 boards.

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
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257D-RMM
    board
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
  arm64: dts: st: support Engicam MicroGEA-STM32MP257D-RMM board
  arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257D-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  17 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  63 ++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 319 +++++++++++++++++
 arch/arm64/configs/defconfig                  |   4 +
 9 files changed, 756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts

---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
branch: stm32mp257d-microgea

-- 
2.43.0

