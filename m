Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAC239A070
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 22:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216938; cv=none; b=AhxWnEIny+avxuA5BTHEbKnl5qPrN/fgCKa+pJY2X17uPIBtnPvQuvpEM/y2BqWtM/TE9uOaeC9BtWpeSMIxnGvx//iof6eMKGChwKtCJQ3+ErWMseK/1nUxZO4cR0ZE2MRErMjJQNqAuov+2Duj9ljZ3E7gzd/oxG171jhMqVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216938; c=relaxed/simple;
	bh=WtJVD2iK5o1Lc1dt5b26jeR027bI01ZPZnTWx/wR+Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M2cPgksMAwrtGyTnChJREEtB7r5vme60CH0qmH8c99jx44zncWyNSm2cP0FPhGgsBfm3EjvbJA+Z2FTDRQ1Dyguw1i1Gev0Yt67//lFwvuXnY3KVep4arLXEpGmD+LH2Km4lO0zbKGMpUcul9jEgFw9EuvhP2j9gZNx3UezuCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzLvqxy9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzLvqxy9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48433fad54aso1352486f8f.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788216935; x=1788821735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+ViYFK6cZ5RDnEJVte/faPIBmDF3fgsQUkS20n29yE=;
        b=PzLvqxy99khyQT8UMXcMxgLjVG0xr/u/97yDxFMLd8dOv3aaFQuFRE+ZBur8zf5RQ/
         7pqodILLRz/bcQ3uzGQ/rEchO7vOV7sswRav5MlBOhXpnh6C/0SrkSQRnOEgYKcP8QQ3
         nnoDo5oA0zxIZSZESCRCbSqQDq9tY+FX2WdaWYx6Y0v3tnEiYNj9OI564kv4dFJevlMF
         7c45znBGsq+dlQ8dpPWkUcx59o52Fcdn40DEb09kcmXel40Xf3miP+zypi188CAnDZ6J
         mVG635/MkQZeTFOJ4GwQ9wTTQKPXD5Z02whPceUhLIqaqyQAuzS8bjIZiHPwODqqg/Bq
         Nh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216935; x=1788821735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+ViYFK6cZ5RDnEJVte/faPIBmDF3fgsQUkS20n29yE=;
        b=Ru/bgo6jfD/VvYxGHdwz/8uggOGcRxIDj3cfOcjsjWhiB1megpOLTG93Ah0b/eoY+v
         LVx2eq+iwWZPmO+TIulCkW+VvIhE6vbGg1IAfbgcYjQ5K6X0qxr4EQFAjVDl6XYVA/EV
         on1UgFNietanJWn5GhisrPF89q32iaqRJ7nLtkK4oTxz5g23n1xS2GheZKOtUpU6M7en
         UqBZPxw4PsTRUdW3IPo8e27WR61Ro/psvYM9x7uvWnYojCp/+mVV/usr/LeG6EPeTfN+
         VXM6ErnfmDrfFSUOSKU4rOcjNGjsg+RkY2kUTmLRDdAuPYaEgmndKxfg034WxuGSxXEl
         a3hA==
X-Forwarded-Encrypted: i=1; AHgh+RpfkrzsPhGkhFcWm+2Gjtr9e1JVqvvCusQsVWD/YwuyhgYlxhvzLbxmOLHgGEPboDh1IX/vNhFsnj7x@vger.kernel.org
X-Gm-Message-State: AFuF++lfTquMjqTrPUBbatKFfJHCSK00XfCtuOmRxKppCgdeHmEIk6PE
	mrOfbJzMvhsR2ztUT88HIdCwy9MqwCwCGmo9BjLNj33wNcgtNaJ4HAWs
X-Gm-Gg: AR+sD10gDetFlOKZSRftWCTrcyOcXbKK6xvcaetB/bdmKnAm1GbK8vi4XOEMoo0O8qg
	Jt6VtOU8AjuIsDoOyl02qmC0X4Ffw3d2BRGuNLeoQbiG7bwB3N6oMsmciedDe6aTRZECmRxpdFH
	lHhY+9Hiciv68GG9cK7m7ty20cUYKuNzkajgxZK3WvIUnuCMpbN0gP0igDN73ozsJfmB9CyxaBc
	jcBvjh3XCNzquKYoObnTHG3efMetDsM0A2Hz0w8V65sFnAkr3O/o1uMU6d1dkQ9/CA3etKqb+eE
	d1qu8YJrHl9Q47LJRM0WkqytzOcfAkvkUXc3xiqXZy3wOlG+Fj0m6+WSGbt5YVBBMvduoAVNpsX
	B584abVMOKLBJYmQPPsnzn0cAqsVVyJBvtD1Y3Aw5/jn/0x4Kk4XrjNUDY7wN64M2BCBRpfrV9V
	B0PYXYxn51cOEqs3xR5evCqI4dcIBGyXvtMNm7VLQ88qcZGaF1A+FrsiTvZtyL67BdKuivdCAGP
	KYaJkx+pl5kM/+PXzbWcx6xdw==
X-Received: by 2002:a05:600c:3b13:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49cdc4332d4mr66819045e9.7.1788216934602;
        Mon, 31 Aug 2026 15:55:34 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm24452615e9.4.2026.08.31.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:55:33 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v8 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Tue,  1 Sep 2026 00:55:17 +0200
Message-ID: <cover.1788184274.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

v7->v8:
 - Fixed commit message adding wm8904

v6->v7:
 - Added common dtsi for wm8904 codec removing it from base dtsi
 - Spacing cleanup

v5->v6:
 - Removed unused 100mhz and 200mhz pinctrl

v4->v5:
 - Removed wrong gpio-hog

v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio property
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  23 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  56 ++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 358 ++++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  23 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 +++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  24 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  24 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 +++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     | 102 ++++
 .../dts/nxp/imx/imx7d-var-som-wm8904.dtsi     | 118 ++++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 533 ++++++++++++++++++
 15 files changed, 1469 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3

