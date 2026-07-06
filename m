Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACDC42378C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330496; cv=none; b=fedxzp+Y3DaIYz7He7Zm0Ga71JqBViUMxbBI7aubKFA/sHbbXufDiMtn3411Djh+x0fvcbDkKPxnU/VcBPzkMA+dqJo8WJS7sWO+y20FF7EqMATMse+hTHeC1TrRnVmwefbMQK0X0TMERuClRor0tWSIsNLa/865sUxjT8lHy5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330496; c=relaxed/simple;
	bh=WJ1pUGz3H29NVfnQag+oI3UwtJ1ZnApc7NcU8yMmEaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tIfIkcO8QyVt3UaBWL7K35lnYWRwfAQb2OC/yEKgFxl7JTfghgFkqkxTtveY2baUqguoTZ29av/aUGTA3IT3Zmg0o0YBrby+ZG8x4V9bxknrKEWdbRvcdObrPZBuwKFLo51N2Wm8cj/MozUnVEmIWFguwJt9Xfz1/1pCK/+/Xds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNz0ALRm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNz0ALRm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493d3135e9bso9335335e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330491; x=1783935291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi3SZ++kAacHg+EPWvcKqDFoMdY5BW+h9pJVrkd2Sc8=;
        b=MNz0ALRmjPXxN8FmVEd2El6WzFlvw7NgPFLR7H60tVTUq3hTm6qOF5KOG5eGSRIov8
         fggQOGOhCRSFTYIpcfVbJREB8SC1p2tZU5Fr+/KNs2aopK1M3TePc3Xjn+vhaPsfCvIC
         tUjhtYfMIFKtxFnIBTMExLkxkLpIK0ndJZG3YdlV2m+U7GQHHDjdNzZZ4WnHaFHEXDQu
         yxJuInZp7tLin2BGkkAYMQ4hMqiJ+TF6TIdMAympO0JnxD8eR6C8OBR3al1or7dCK6t9
         4BX4V3pC3LW/IUDwSp+yYOUlzUKoc4/C5S34Z4TRCCtSvarVJpWti1h3HW7QWqscSEFb
         yKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330491; x=1783935291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi3SZ++kAacHg+EPWvcKqDFoMdY5BW+h9pJVrkd2Sc8=;
        b=ZRM909DXS6b09rYE4s+3ex1Ajhvoz6MMMwZpwVTGKOT5o/7H3X5NH7q93GKCaEPGal
         YwHabsIsqoWuC/QBrjqU+MrKEXjiZaodfqQEAMSyEJLPg9DlssA74JWOGmYX17IsXLMY
         2xjWPRpPsfTKe9qevdDKlYfoN1cmW1sfpI0j7ZPduZA6xksLgztvpsHVGNzCryVDc+os
         PMnfRk95V1UK9ZW/SjPagWmZ0ioqYS4bPSeWtQwjXQkvfL2raqEZnjLu4zpPU2nT+7XX
         whe1uNveI4bNiLaj53DruMVDIECZRxw3tMS+Vxic1LSubcY3gRk5LBVyR4gTeeP78HAt
         AHuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4qEnUkw8AwXiMPQEcMbstkKKTnzX+vVko6Upe0xEnfeVknGpoB64Fapd4x9D+BGBHU66thmT1a44/@vger.kernel.org
X-Gm-Message-State: AOJu0YzJMwr617q3iP1vprft4mibqIm+bl3AfSQ5PcZZPFFpRclKrf84
	2w3dl7VODonkRkk6PuxTnMy0Cj8DPpRkEm28+dgLDhHireBB131gyd03
X-Gm-Gg: AfdE7cnsaHcnmsVwoA48HO994PQLQAt+YUaaVbtJzS6g/zpnMcyTqD+mo8G0is8ewl1
	vX23I6TUJeI7+imrB5jq9yj5r+DG8pYUihoICeWF+1vuu2k/AxmqycIMdS1d2n1JYcNFstLMio0
	0dfCFu4vd9t3fKrXasoBPq6zkaEiA8LSmMCVGq3cNvHrdhPaEg/ywv1wILyhsbxnH2xrpvnfhxv
	F1LzeTgNuOovJgvoQgluoM1ozDWq6WfkDPh/vsAI8WxGQsLibPD9yA/asZeab+SScsK+jI9W89A
	vItpRQ2QW1VgEZG6OzJaaEcPcJQlynyAEJN1hHKDhcuglm0p7ZOcBomUtON6JUAagFBY6EFt+pG
	ALk2R2U/K3Lp8vD+kEO8hu8krXySvmPOoJ/i21/kim6mxNTCjQtwsEfX/THm/G+BaH9clJlI7vl
	ZLUwcG1nMS+EHDkg9Clls+6NR88nghvnUIvAQrgfMBqcXVkukE9WpswCT6YunXV3cD75mBQKD+s
	BaMHucZAeY2GwJGu/vYWyvPNw==
X-Received: by 2002:a05:600c:820d:b0:493:a573:179b with SMTP id 5b1f17b1804b1-493d11f5b70mr109796225e9.30.1783330490591;
        Mon, 06 Jul 2026 02:34:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:50 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 00/15] arm64: dts: freescale: imx8mn-var-som: Align SOM and Symphony DTSs
Date: Mon,  6 Jul 2026 11:34:30 +0200
Message-ID: <cover.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aligns the i.MX8MN VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

As the i.MX8MN device tree hierarchy closely mirrors the i.MX8MM one,
this series applies the same alignment already accepted for the i.MX8MM
platform, ensuring a consistent hardware description across both
families.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

v1->v2:
 - Update all the carrier boards and not only the symphony
 - Fixed commit message for eth
 - Fixed I3C to I2C3 in codec commit message

Stefano Radaelli (15):
  arm64: dts: freescale: imx8mn-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mn-var-som: move uSD support to carrier
    boards
  arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mn-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy
    dts
  arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
  arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
  arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
  arm64: dts: imx8mn-var-som-symphony: Enable I2C4
  arm64: dts: imx8mn-var-som-symphony: add wakeup sources
  arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mn-var-som-symphony: enable PWM1
  arm64: dts: imx8mn-var-som-symphony: Disable internal RTC

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mn-rve-gateway.dts |  48 ++-
 .../imx8mn-var-som-symphony-legacy.dts        |  19 +
 .../dts/freescale/imx8mn-var-som-symphony.dts | 162 +++++++-
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      |  19 +
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         |  46 +++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 366 ++++++++++--------
 7 files changed, 500 insertions(+), 161 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
-- 
2.47.3

