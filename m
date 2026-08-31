Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2693B3C10
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180648; cv=none; b=VMgYMb+vfQjwZRiG2dlwh/n+3Wm5Y6Us5/IRZYU14lCXBvnbaoyjpV0XokDOyoGcMJOi5mw7IH8OvDz+8l75L28fQ7PAN9gdDueNQdbkAJxxfjdjVnVBmJ+OJS/OT73jPifrggQbKY14klyycIOaV/iW2bAL3l7glnWnCkpGIxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180648; c=relaxed/simple;
	bh=7ZfnDv/XtekNv1yVLAJXU7rSq3e0UdmAHM7woI/rUoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gnsam3Awuq3oKS0FvoMNB36/9mVhkD6GmufVfbx4g4KNnMmlOHg51Amkcr/Z0QQIX2p9j+bk8eWXdKv5pnfiAwTeO6a9aYlWVjCu+BUKLjBTl9f6PLkbFbiXQ7OakTh9EpBN6HtHawIJ1m/RdIgXrwa3mi/0JzPJ/T7p6oCaEzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4kVJVt/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4kVJVt/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so34541535e9.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180642; x=1788785442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTylV7csYnLWM1x8O3QnuC/IfF/z4HrLSIT7SMiMU7I=;
        b=r4kVJVt/NF7GjvezkY2scURSTxwoftn/LR8GPQqJgmWVtgyUow7DOt+zT2WFWIiE58
         v5zLEAziu8K78fZBwci2JHlTPncqVzqvKp2mOdGaGjW+7OumG5Gjv9rzK4GLelXB8dLN
         7YnZonEQhtcIVlmBt2GLoRwzGUDjR7TSE5Pqtpja8sa+jXdDwXVzSRQG958mv0V/7H+Y
         /9ObCv21MZm8DPPxWJp+w9hj5oGXiDr9o/gLFtbl6kihRNjQgGZsk28z0vZ056yCpn++
         3m6YMSVQL8n9rGseuGkRiIukkmMxO943JOvR6OiaCpcIGo/4w5FA54kZT6mjgOy72Q3z
         YUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180642; x=1788785442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTylV7csYnLWM1x8O3QnuC/IfF/z4HrLSIT7SMiMU7I=;
        b=YQKgGdRc/LBqtcGSq61Texe3sf+FiODeKj0pCSgqoGLiaIFTJ/4U/1I5yLD2QjSI9f
         391FA37H2yuI0h5VXGxHaEfThcTGEUqxKeKD1bv45lQaHFZEca2xjiMpT0Z7M1+hN6xC
         y5IOrJ+C/6/AOmlesMgOG/aRS7cPXzOAqGTHbwoT1m9KpiHTm4kmDTIdwU7qUHCZHU4T
         l+1Ws4mOyRVCiNGabbB1TIHe4I665GIn9moygu7YVqJpsPRdU3v9cCJqcIFZIOrGjdaY
         6F1wp/vJph/0tAJ7V5UMm5ZZlTqlW7f2B/RxZMGQJbYYy3l4BtInCCV6mkhNpqqMtDct
         Jz8g==
X-Forwarded-Encrypted: i=1; AHgh+RqeHJ9F0rXMIIwxP5dlaQbGyAdzj6oh7j7MmcLId3WR8+FWdNRXFl1Lxp305EtZvcjBMi9QS0Je5wOy@vger.kernel.org
X-Gm-Message-State: AFuF++kjDEqeQQDiFQQO3Bn+ngk+iPSafjL84DsGNYz6aPQomqX0xZMB
	XUCoU5uslQhXn0zgEcIixu7A6ZbOfNGDHgvrfD2+k0g1JyQ6sWsamds6
X-Gm-Gg: AR+sD13ND9GxH1Alf15Iz4P/zaW3E4a7UZKLQ1vBY+Co6TKXxAHqNeml4U3ezyU0UwE
	Dlhhi6tsX0Y7ZD5nf3NHlqHCHuCpZbPE3F7u/44GqMy6cfWSU/V2wv4Y0/li6M8zGvAOg05m8Bu
	JBSfWt/Em2azvXUSm6jZj+IFc2fijndNFZNJqLdQ62LgqKT76V41W/bya+79d968hR05hZBg1TN
	O2ESbVuWZiosZ6dSqEfx4EditeNp8cQRsTqLA1/2bK55jhTbitm03W/1BRy01rShahxntU8yLZE
	zsOG9uYJkEHsu40FkdFn0NrTsC7JmZ7/rjtu1QMV59G4QsvmAgp3KXd79+ETeiMuKUCzw33bCB4
	sLOq/uZrRyeoF38dyfMVbvJ+RGJdN6T/FPK7fa5Nho0+UyJScIi/btDs7O4eNnnbterSNJlmOVZ
	3huJP78+5RCzpqWN4CxW5+uWLEskimQiyd1Ov7XynWadfJRn/jpzy+CQCFa558ep3Fuf9mATcLK
	dhi6vkGWC6lnREgma10JASv1Q==
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr452067475e9.5.1788180641698;
        Mon, 31 Aug 2026 05:50:41 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm116571225e9.13.2026.08.31.05.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:50:41 -0700 (PDT)
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
Subject: [PATCH v7 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 31 Aug 2026 14:50:22 +0200
Message-ID: <cover.1788180142.git.stefano.r@variscite.com>
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

