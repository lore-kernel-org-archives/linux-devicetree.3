Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBCD3370E4
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640948; cv=none; b=h2DrA9FDLriwJIzvYAHWXAbvzbdh6NJlIC6uAHeWrjXlyR4k+EzncBSaLi9Idkw/2uOBuRKq0vD1iPrxKII1aDAdwvSEVpkuDIbbbl4LJ6regVD2PZoIa8J6wRLF9bEkNeCWDAnJIdwWQFE8CbWSQ3JtO/oe7JQf6BUWvKYOAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640948; c=relaxed/simple;
	bh=Cof7aE4eQnsVYjaR0fbi9fOkRC0fRGuk82Gr3nU9rD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=saKQ8tvGgVbBQYrQUF+/iz4nL86NSHZsDjcXc4Cg0Wy9+b8kp35yIp+NHzrhqgBQ2pwj8p+funq5gT4hl4/ag729S4K00Yixpj40/Wi3eJ39QjRxBKI/CoZKx1Mfv5yVUP5fDrHRR5pcK1CSPWpPOKKazurgfvVbT4G/No6YE+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iZiLYzjy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iZiLYzjy"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45fe59255beso719210f8f.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640946; x=1781245746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lejUpnv31Ki2j4Ud4YtaN/+X332KUHa0P0BjhrqFno=;
        b=iZiLYzjyfgXzhuKHvATTKCP+6xa241Vv05xmB1JsLP85FUdhbQJBocUjm0WSrYvfXk
         5M13Z++jNSeEfRAAjHyghk8OKG4n2kMg39NCsAiVknvZt76C3QQxwoYWcijQqZOfIiFM
         xBYg/K3/hYZrpnBJAykBS+Gdf6Pffz6E0KEFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640946; x=1781245746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lejUpnv31Ki2j4Ud4YtaN/+X332KUHa0P0BjhrqFno=;
        b=NEkp/dgnflGPDqRpKKcC/rtH4VoUx3bJn2nR390ekuG5JXmcqQKU2vd1OfC8+87Syu
         6+gj3lZByAhid5aQRSOErc3SNwohpql91FU7Do2kIsROZcMC8lW5hH++bQSSzvSQSzgg
         8mEv4PV1vSZfJA9lZEBtb8e8xUDZ/cs3q9suAWXSgiD+n+aEFrJsIrLQkflPM9FADsFw
         nHS92XX/oMlASjkVQhLv4T6lmlhExMDOfuPOp0LLFeu0bJwxwMirHtSqWf4SK3NWMoc/
         OwpUbei6N0Ef1vrsocAsPo352vuBh3odHhhXa72F2gNgo8HykjvHidfkWbNuLQ1JuAcj
         y3tw==
X-Forwarded-Encrypted: i=1; AFNElJ/ReP9PqNYbqmAGJKvoxei0Tc/Zlhd9p0/Fej4nI/CPpXhlVu28sDH2TjeI1KCBrjvbGj6M8scaH4kc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3lYg+pEEG3dfCSzQxaLmyuchW+gIk10M8GSIAyZSEkzFreUdd
	hlqV1BBOHbiG7kPZ2T4oEfI9MmBIMEeiwKTNEPT2jftc1GXaHXNfAtrWtmUWbKXAiFs=
X-Gm-Gg: Acq92OGx142OzVdkbZFX44p05cC2KMNmjqBGInX2xfnmpBl7Y8OE8n2wlAtKEUMOxlR
	TmFLPgxxJAnWVYYR7gfHgtcZdAuPHQjoWtLMCp9GpJCUz/P9hqcGWBPknBaWkNxuimGqSVioKmw
	5UAecbsRgbxVtia2jvqQQiTncWJrDOb3xlgbiz8Arab1mXiwnypsUTYsmYMHX43qm4Qm+7CUnou
	qmM1cknRt4dNvgtA71ozugOHKAlDAfRWeNHZMbFy1H4J6dMRqUziL2qAKyHUqPSu7VVc5aSm1yn
	ezkszMWOd+UI3Tvq5X+PPd94Qp9DNHgNBhmuDgGTal/m0mPuIT8kZ4byU5D2pZZ91FV4lTPhnLq
	QYfye2rMBjWgy+zGwy1mqQUcHdH7tY4qPUbWkohABHYATeXGfJKOYQyHNQaeQ4UxfzUvqAQz9t/
	znx+9L89bAO0d83WyvLl9+O+aLkvnyKIyBEMVpvYc0JUUUB0IQKkrSwZLmSM3vY09Kx3iDN6Etb
	2zRj94JihR5LjqyIPeRjrbwCFzI8+RBLBCsjigBscLwg7Dy98mODKU35dhVKF5MEXLshQrCmt+j
	6B61AbbKh8q6CyY6vEq0gqEm5P7rzj/lAjk=
X-Received: by 2002:a05:6000:298e:10b0:45e:93ac:769e with SMTP id ffacd0b85a97d-460302dc502mr2224770f8f.6.1780640945279;
        Thu, 04 Jun 2026 23:29:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
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
Subject: [PATCH v3 00/14] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  5 Jun 2026 08:27:28 +0200
Message-ID: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
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
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  64 ++++
 arch/arm64/configs/defconfig                  |   4 +
 8 files changed, 755 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
branch: stm32mp257d-microgea-v3
