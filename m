Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513973630BA
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584122; cv=none; b=p5uBMUJdLUrHK96znxVD2lnCruPSHTewOwBA3iBYU9Kt/U6qjtIKPnbFylanlsewkQw4vYnZ85UPlZ0/Fu2z8uayUA8ABorSMOhMQfaaFKq2Omc6MJiC+3gt4+w4i2eP0WVZiYGlYD1Cw0vTj4QcJm+QWlg+tQWYxu2qGSj7NaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584122; c=relaxed/simple;
	bh=QVfnzXp3mJ1hu94QeXCBeJl8Jj1ky6nEk9MHssMloEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lz/hmLn9OmqAt5z09rjD+hsrPkdqXlk5eaOQA74lvC4zlE2Fa6Mm5iBXAWoybBTTYqpylZkq9hK/NA56zYCN9c8up6aON9XeUCMLE6mjvLK6KDDqNlgienbHy6Uvl/2EOJL4oQZpV3rJD1S4b+KS0nptE7HmH0ZTYdmkZVGcZvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tI3Xn/CE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tI3Xn/CE"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c214e625259so523158466b.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787584119; x=1788188919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nOah9yaCPBJ9asb8hJhVi9n8xa+eAyGsPGC/JnGbYU=;
        b=tI3Xn/CEn/L9xWD2Q0RFOVM+gFn2Qfp++HywtpswMdl7qlHa3Tf5ZJ9ywtpsEv2E1v
         VNiTY/hsaiop2eQrvpz3gueMZFauivJDUNpfVxKaU0bz296upRFK993jSo2i7L3Mo280
         vXiA+jhT0lM834Rcu9yOGmzGDmk25cMNkDZEjS0/SfqvIeyXt1EMyzattACdNsYQsKw/
         H+sKhqBbUIauVxKyhdCJ1yPB86Yyw2scO1NMc0Bc13kuTzAjo5QfEfiuu1X1KVXnrvD4
         IAliq5raCVs2e8yn/ghEGti0s3+tw74uRa1LqlsCnlp8geYXs4fLDpQgTmXPzBAU5MHZ
         2JKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584119; x=1788188919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nOah9yaCPBJ9asb8hJhVi9n8xa+eAyGsPGC/JnGbYU=;
        b=OBh+nj/zJ+DzE0CJzWaLtYnJfFmrguKCpbvpimiPjVq9y6qMoFDbvxAoF/x0i3suyl
         G7rKyh8QEsJpRO1yWXb/GkxvDmWk0E0K0/TaQrW1WrjcjY7pJlumRRv5deqe75HBQRKd
         cOkU0q9sKTimk6rTEn+KHWbXSSDCqUSp2dEvFSgOvgHfl4AIKzeL/D++xstJQmk+iET4
         ABpOssrgA5//JRBX+OtugLJgdUZ/BgXk2P4Ish7VFE5CNIfNmEiN22xkJ85gL+8q9D6F
         ZigBVY/4+oCtbYtUQPZwtwAsWHjGGrs7D5IiSpApGXCBhYeQYJx29UUoSVRI5AyNunaJ
         SwKg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1B0gOE/QPGlNXMNqbhrfixLEaCTrIWFvF3OL6X9pd8PSs2dq1oxWy+VbPg/9jEPiMWmieDyUq8xNO@vger.kernel.org
X-Gm-Message-State: AFuF++lbeDQDurr2+fPV1V44gISPBipmpS1Fxhffz/hDkn9JrAT5KuiN
	3LTEkTJpB+BYy+0f4GS7pQWiD3mmnkzGoJtU6ifEBBMdE1W2YppWTmqG
X-Gm-Gg: AR+sD10Cbjxl1gGIKxkxnfsWGM69X61hFc7e2krP2kziNVDu39aT1gU/pGPCU4nKdGz
	woFGJRvbGa/T2G8WZTwC67mnW06/t+WsN2P3OfyGcrIhwY75NsmpFrk/rs87IRgVCc1K4LMAvIJ
	A96nz7PdbHglWttXnVoFQBPPp5pycYnxjdBEJtXln7Hk16S/CXRBR5LiPG3dOKfo7cZ9dIKJrV1
	J14aeRKElACPATYy/bSxabJJao7rXDLDBGDsQRwY9zX/OE2pJB/N/xmPcryrO4m6gRZZMbZDK9h
	/907gT6wBlSmyu8KObFSd7FCAjSTO7LtIoxYTsNTym20K91o7ojdaPk2ugvrhDluImlWRhx2AAJ
	mWtq8oHnkwzaFjIEh0kvKXG6xSWM65C/RJ35yHt1lkG5h5CJTFwsRW32ufxH4X5y1Nirin5Iqjz
	j9OBMBoPOtsJOPUvYRm+G1kGRspbWZ48WJLSZrn8xzMOnEdXtWu5fjnqO0yfIwZ/j4RW66UywAm
	80lxdrcGj10nAFPzxETbdUiMA==
X-Received: by 2002:a17:906:2083:b0:c24:b11a:46fc with SMTP id a640c23a62f3a-c24b11a4996mr1066420866b.22.1787584119253;
        Mon, 24 Aug 2026 08:08:39 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297189sm1273530066b.22.2026.08.24.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:08:38 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
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
Subject: [PATCH v3 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 24 Aug 2026 17:08:27 +0200
Message-ID: <cover.1787583584.git.stefano.r@variscite.com>
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
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 382 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 635 ++++++++++++++++++
 14 files changed, 1479 insertions(+)
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
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3

