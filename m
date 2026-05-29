Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA3A3E1D19
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066038; cv=none; b=McE6pmkm0fcu6EWaNCPkJ8sggay6fuqw44QJpSRPfsdSqu0nPAeMtf5KW1RwdWVjKN8WErsitZXZgYibhvJ4281UJopOSZ78eQU0/EhuUokovkjPOUUPqxzBSP70krn3vJD709sdLtcVsadTCrINiOp3vhQPoW5TZz8irP/TVAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066038; c=relaxed/simple;
	bh=KT7MvjfDTgWyOnGlTYAhb70KiKX0WXu5r48vjPq4Ugo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JNIMvuEGTw7U74wttciyUySaoDQELtAvlu+fSeLOAu8AOZ1J0nqooVhd93yxdLnC4TxvOWktKRpjBJtblul1tl7JD7IEYRVVL4FOwo2EJ2CgTHAZsKOvpl6nKN8ysEisQjc0wYtn24NHL7+PFbDcOvWSdPXFeYsV5w0ZlNaBZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UHh5e78d; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UHh5e78d"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44c350a5b87so8249069f8f.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066035; x=1780670835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXAnr2ji1K1FMxfIa+2dWup2lSJTGHNXhn3K7ZsSAnw=;
        b=UHh5e78dkLsUOXXtKzmaUtemsS3Q3NNZTcUdIluLng72AySsmU+XmXsm//YgTDgFpz
         9uQRcwY3nTsRsWYVl0xTegT6WqgF5TBBzkEMUYZ6IcSkZqHFW80+MPjNdjk/zKIQ9nHq
         h980tYF5k/b6xf37/rh0IihWZDIBaxqkXYLTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066035; x=1780670835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXAnr2ji1K1FMxfIa+2dWup2lSJTGHNXhn3K7ZsSAnw=;
        b=rgVgYfs4U3Ka4rAFAJarQiqtctDRcYAClo7nl0Rjb/YNchYCNsuUjgOhcW2UrxNjke
         NZ1DakqrlJpoDQ9xAsCny4rS37oebobxhHnbxKXnksnynhybTl0j3nuuNz3IWRyIHQiO
         m70F++O+vJbVSGCwmdicmagSxVA1T5B25FTsOg4xHPSSJzHsGil3qLJHHycV3I7tVQV6
         lMGDi8S+BpeX7/uA64RSW+RC/mGE1CjpubWoPC6N5JYkesBz1dRkWvF17rfAlxr5xYZq
         YGgHUCUL9A+W+w4AvNLTpqslVzf9MzkqQkTrowKuXPG2bYWyPXnsJVN0e2XHLU30OwRG
         B3JQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8Isyqn0+1qrJOkDWGtdJ3px9nkHjzaPA35g2hw2ZrrlYgdwpfVwXhKF4H7gUCq6ZRwLfWON2WbNLq@vger.kernel.org
X-Gm-Message-State: AOJu0YyQUH4fg7ITNa9Z9jMwFWi3oMzgiOKUL6pqPfP1XvIBakuyC4Pp
	ufehNM0Aipyeb06INhN7LhC3oJKfnRrN8tDG4yH2M8bsaooCYH6HexI3lzRODYy9wQI=
X-Gm-Gg: Acq92OHsCE4wYPu4os/u0JKQxNaMPQhpcaQyo+8YFYF0xYNu5GdFKdf8BA2VDHDihS3
	8zcRXHlE0Zqy6CHmnCbWwYXJ0tIGOCNX4VydYIVHFdY8/jftiHZDQ5IiqstvRQ5ks+98w7M2qEV
	lqR27F2Ca4W2sAzXcnqxCuN2qAGTGIv2Rx0oE63Rdq8nNgdo+UQYfWVOaLmXIwhICq/MxkcpadH
	8m6zjf/JjYAPMyrp+HOS0W+6sTqd2i/K4OMMdVQM7LGxleedJHxXkaezVpWwt0G39VydZ3ORV4j
	I1MUOybzFUN19IjkxDXNDPvjXveGsM06ECc2OnX0BOLnv41ZV4KW3RmZhulgWvtPMk/z7O0TgEg
	JNRZr9lpsLWnpGyqzbH3BChthh/hszlPfGg1wkEQgsE9lmQyrknUGtulZWNLnXfeYgtjDpqOLLF
	5As9XIuHAZpNQCmDoog9reGj42ElBCT+kB8kevavvS/9WLVxWd7hfyx9xRFH7+oinO95wnC5XsY
	ANEMkAgtJln8C1++mGbCVyQNYiIVeSFParJ9gwUUqbh1209ERqRerym91M=
X-Received: by 2002:a05:600d:848a:b0:490:60cb:55f0 with SMTP id 5b1f17b1804b1-4909c0aa2c7mr40837195e9.21.1780066035193;
        Fri, 29 May 2026 07:47:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v2 00/15] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri, 29 May 2026 16:46:14 +0200
Message-ID: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
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

Notes:
Following Arnd's guidance [1], patch 14/15 "arm64: defconfig: cleanup the
defconfig" is kept in this series purely for review purposes. Since a better
version of this change has already been merged via Krzysztof's cleanups,
this patch will be skipped once the review is complete.

[1] https://lore.kernel.org/all/3e23b0c6-6968-4c87-8d34-f44b8af1df82@app.fastmail.com/

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

Dario Binacchi (15):
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
  arm64: defconfig: cleanup the defconfig
  arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  15 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  64 ++++
 arch/arm64/configs/defconfig                  | 293 ++++++----------
 8 files changed, 861 insertions(+), 182 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
branch: stm32mp257d-microgea
