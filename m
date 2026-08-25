Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC1263F5D
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641026; cv=none; b=PLJT53bytfCnhJAFgeeDLS7uTs2Ed3v0ZHXdp2/B5n8/W/czvnE0fTPejNy/n8bx6HDZempySKRCvU/EeUf/8ARXRPYvba6A4tsMEMaNMfX4nfo2mY7mLm2+AUgmBm2dU3e+iY6fGZY+KkAaFYi1qxVbP9jyJnCbmWT+7Ui+Mn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641026; c=relaxed/simple;
	bh=wbNmBa4CxGoqPW7u/POZ82Us+SEBCdANBsIoV2zbOJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dy5a+SMdTSgcRQ30wOwfQ9vrUcO0FWgLUa6d8S7zA6HgD5PhC8QIjW/kUk5E8E/c3ZVOkp6r6nkDiie4bL155ZEbHlrYhAbL8Ne1WDymlR5DkQEEf+Dc0cvdOv+tVRzY4yhM057mt1yvgH/KmcbzSwY0KfKys/lntzHB8RdFHBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prH6TDKP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prH6TDKP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c214321dc32so853365366b.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 23:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641023; x=1788245823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TR6WdwjvSGIyObTPwhxsK9zRSRPeNRhfXdDEqD6Slp0=;
        b=prH6TDKPeSknKX3Z/vdR2wO48VgJtnTuHny0WHxnZrYyBAYdIbplTQqAwtf1d0yERZ
         hdm9vU4C2DLVQUKlqXzt+kAmi/axVza3y2bvWSWpPXbR0NWjk3Zc23g9ZmZK6IURF3aE
         fypv+tsUk9dp8ui3v5nEXXwDT5rLU7nX/LFmevZ6Wo+U4AZ36d5Y9YLqkuaNUd4bU3Ju
         OmDj39ASWS1uHa2aFdTTWMtLR6rIygtPl2PIbdKfvrkx46gTcAETQ4XGh4VzwW5wZ2Ji
         ROcQdNrHJpwa+/ryDaCKNOMIp+lSQmyIkNtWaP/ySivFRaXhh+TGX99+Kb5yfu07KugY
         EfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641023; x=1788245823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TR6WdwjvSGIyObTPwhxsK9zRSRPeNRhfXdDEqD6Slp0=;
        b=RMvBudIdv6CHB/o9LZGQXF20YDzYIcGC2QaJkl6P2N24Fe05QHi5uuDleYtblLyIn2
         1FV4M5WFjBDtfFHPU/3lGyn0i1Z2okRv+F8J3G8H6rh59fRSILCPpFVFbdz0nDQ81Raz
         FVnwseGIb6GrY09kHRD6Ivl+TU81bdaIEwB5u82xH/5bTSdkfBNqjo+fSXPSMe/R+Z3t
         YvnlvU8nCele8T+C4MygmuEqqgY/WT0qPgdBH2uBbEYiN50IAe07fZr15S+oMcwx7hp6
         7DtgEsTLsKS+WCs3TLWFXN+DPUNfSgb9Ml2uZJqIxVVn3U0TAOOUsDjicOty4T7C1QDw
         +6PQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcFVgK+LG6RHTKE6FsJgfMrrTtU25VFUhdW+6zWGL8ZuM9Ou8r7opuksidlUvttu0mVb2Uc5ci1JCm@vger.kernel.org
X-Gm-Message-State: AFuF++kAIdg72um5MDkASoU2vChcqt/Pxw+RB3VdFwTIPuRMss1ZQJIJ
	RPD0p49rlS8lOINgQN5bv5VtO7u9CMS4gC1sHwjCxkztSzVgab1oH0Ta
X-Gm-Gg: AR+sD13fc+fcPc2EC92XaXcARfjDK6EauinRfIfzxm1JVw+sYS2EEY62n78kWjYYFP3
	oMyYBY3n0ITgRXRzc6dWeXCPrkY6x6l94x8vyClIu6ehBsYJk6szVBazSNYqYVgNzCmVwQMAPP6
	o1UhgxGwFoIE49kEPXwpgpk4Ug3aMkJ3jptoPdg1G7mh4Hhwz0lUA1on3oy56C6fDtcmL9ybHNC
	hIVbpJ+ctBv9wpL4RgUorXauNj0Hwk9X3zzWsmNuN3xAyB/3shXXdYpr9z7EADDD9c0Kf+4g1BK
	lajiTiPk7ITx9TEqIXW5Nr/RzG1ZiC5Nc4Evqk9zvW8T+4PglKDULzt7HzAgP0AMjwRT0cx8r+U
	iT7pAW1mfGbRLfzhtWPbYgg97Y55QrgQA6wyPo/RGsGydYVrsua7y8BxS8Q5wKMdcs/HWFGts0Y
	JuHJMEpaj4HBLBkfbpH66bQ60UTR/oI+P25F+B7GKuVW6vDWXyKqjI67pr+VHeHHVgiI4GfvCzR
	qHtA+NrGid/NS2LL8ZoKnpXRWtq2Y0KT1pt80BedkAZw27l3NJy0Vrt
X-Received: by 2002:a17:907:72c5:b0:c24:d6f0:1223 with SMTP id a640c23a62f3a-c24d6f20633mr921594766b.12.1787641022759;
        Mon, 24 Aug 2026 23:57:02 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-70-208.net.vodafone.it. [5.90.70.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm613534266b.24.2026.08.24.23.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:57:02 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Tue, 25 Aug 2026 08:56:52 +0200
Message-ID: <cover.1787586961.git.stefano.r@variscite.com>
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

