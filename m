Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F413C7693
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 17:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383474; cv=none; b=Bp+ljSZ0+WS/2pPwG5uN3pXScUEvQEBgpJClihFH5wWDzYTYAApIWG8kKMlcwb9ke9UbfOpXS2PFjRxoBcuPFc3rP/wbPCbBLEc0XgrS+PlIinKKjsQnHFBxJWwcwT8Ty2dkpk05dmyYg4uRCQ+MxhoyLX63ZRIo8spCq7HTKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383474; c=relaxed/simple;
	bh=L9iHLGnoC4t9C9KJsFqs8bWXRuCf5OIyfTXiAPK5O6Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SZS2T7OZnjKXxi632j3JOGIPvblb/oXYM627JRQ3ds7q3IPM1dCAUPSQjkqIzsM431o8ZqYtqaDEtzJKnf372cqw9N5ZGaMMWU9oNOOLZXx91qIxUCfg8PJa+NWnmtwKn+9QKYmtDBeZpRX8U4S6aFzTco2EL3lwLN1xnnvesyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJi4i2Qn; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJi4i2Qn"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44e1860558fso4158611f8f.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779383470; x=1779988270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lj8wo7p1UD9NN5CnfCz6+orZZMLzy36Q+ONgzMn+SaQ=;
        b=TJi4i2QnY7y3rcCHHAtAEQUWOOUeJl6QfBGWGJjugupZrZmrztmoUkcRSLkpyC8P5y
         PNx8qO0XS5T3dD/ddpsNGMCiqVAbAteQSl1/S8R0BMG6/eonCuVUOe4WAI+q4CW0j1MM
         rAb+whJW9WTkvwMzmIZAysVzqskus1rLP56YPXFaqTxZclVo5XCEa4D8HECbDVwI57io
         KYctnlgPJATkOKQlH47mSmK7nTx85HI7G4Ertbv24DQZ/ASbfUH7MiHGcMgqoTXMnM2f
         /bF3H3SlRFatzvvYHCGEAJ4L++gEo5zT+/m1N0LDRvlx1UwPzRNvRmYWfp2vcSKCR0D/
         Zvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383470; x=1779988270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lj8wo7p1UD9NN5CnfCz6+orZZMLzy36Q+ONgzMn+SaQ=;
        b=DG+fVDSDDvdbKj/PFDhgBPkQoTmQXssqMk1j5M+3JgeQW5NXsnLpEwrVm0yXJ1gNFA
         coVaOYKy3gQhTogciP9lwep84K0vdr1z+NgeEDcLtAznLaECjHOD11TFq182xtYaN1kt
         2/8BdI0ExxauvAct5yNARY2n0f0qE+WL9X1c/tRxUW0LEGXF23JoRnkqVjpT0n6s3Dj7
         POEamNoXCqZF3+pDOrC0UQIrHG3nkQHKAsilBzXhCGgqyJW8a+v1479C+atiAVe/+llt
         IZWBXFhmXyfcbL/CJptxyfI8J2eBKz3IEqdVgjgKRUpicJoFVv4ZeBMwT93/t3I9HeT0
         psbw==
X-Gm-Message-State: AOJu0YwrJu6IEEZGdwPx3sYtg/jlfgv5o/Zdc9SBG7Pgshz4seEfKKc8
	25DOXJ0bKOeNEOUZIxoPV//751vgBmpTQDGEBwFkONhuHJPNsuWMx/tf
X-Gm-Gg: Acq92OGJDCyu/JBSL+SHESyTjXrYXyKyFhjPs6KdDZsJabAZm6WuU1NsrftNOwGjniv
	Rr2BjxPbJ8sVCYjForHQR3xmIrijZjOECuUDnGPF2iaq+I/uJDWSxIauXnSMWs2DhFPnfixhhVq
	GFknF0Zm0KhZ3Al3zyV810Kx4J3DUcaueHGmVErXLZTLEiXN/501IyeB9n4PgUGK4I0k8LnGTXP
	FqzFul0ERQTYuO3Wb8XlhGHzkLZVy5PBkmbFm+anbFnzyPLQCUE4pUgloouYAmu7h+EUdJFV3Il
	y7Jym6mny5Nf7REzJ2odIabowAvXyrrDk22eHCkolCx5xRmYoby8wuHyIZ8Nm8/qV7sMrmmR5jr
	sPzMjDE7n2j1lhNAejrd2CdCSDbXvhz8rVYB51fNwLspibBlY34ar1dyZdejUcpFCL28YYTk6yJ
	hWUB3LlurKY7HsXz3Je18iFsapBcemwmk2LW9IKN8CJUcpFx4dNrqKhyTAsR0lHFans6eOwjgzd
	BfaMqExsh/HebhcGHLhdB9iW5Cb/D71qrYvjSKWB/9nUsaJlBnpAMB4KfvftxAxFCYdp+LlEOdm
	5rBWzW+mnrIE
X-Received: by 2002:a5d:598b:0:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-45ea4146976mr6175500f8f.35.1779383470219;
        Thu, 21 May 2026 10:11:10 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm6046116f8f.6.2026.05.21.10.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:11:09 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Thu, 21 May 2026 19:11:03 +0200
Message-Id: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKc8D2oC/23PTQrCMBAF4KtI1kaSyY+tK+8hLkIytQHbaqKhU
 np304JQaZdv4H0zM5CIwWMkp91AAiYffdfmIPc7YmvT3pB6lzMBBpopxqlxjprn298N9U1fKip
 BgNKmEg44ybVHwMr3M3m55lz7+OrCZ96Q+DT9YXqNJU4Z1aUtELlVkotz7hqH/cF2DZm4BAsC2
 AYBmWBagjSKoxBmTYglsfFSEtMVwAspCnZ0WP0T4zh+AaGyVuI4AQAA
X-Change-ID: 20260501-add-aquila-imx95-423256af3d21
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.15.2

This patch series adds support for the Toradex Aquila i.MX95 SoM and its
currently available carrier boards: the Aquila Development Board and the
Clover carrier board.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and 
Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
lane DSI or CSI interface, one LVDS interface (one or two channels), and
some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0, 
and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Changes in v4:
- Removed som_dsi2dp_bridge node from dev and clover board
  since SoC's DSI controller is unsupported
- Link to v3: https://patch.msgid.link/20260521-add-aquila-imx95-v3-0-621843807def@toradex.com

Changes in v3:
- Changed QSPI_1 4bit iomux node name to 'flexspi14bitgrp'
- Deleted the cdns,* properties from flexspi1
- Link to v2: https://patch.msgid.link/20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com

Changes in v2:
- Add 'acked-by' tag from Conor to the bindings patch
- Reordering iomux by node name
- Changed Francesco's tags to have the Toradex mail address
- Link to v1: https://lore.kernel.org/r/20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com

---
Antoine Gouby (1):
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Franz Schnyder (1):
      dt-bindings: arm: fsl: add Aquila iMX95

João Paulo Gonçalves (1):
      arm64: dts: freescale: add Aquila iMX95 support

 Documentation/devicetree/bindings/arm/fsl.yaml     |    8 +
 arch/arm64/boot/dts/freescale/Makefile             |    2 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  285 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  389 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1844 insertions(+)
---
base-commit: 596d0f9f4fefffbf783ab26cfa90cf50f5dd6bb0
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

