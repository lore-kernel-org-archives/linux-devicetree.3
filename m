Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384789;
	b=j/XFr+PNd0X4HKY2hIYw+FYlmtTwRcrnC9v7ZScvJXlUVfkLc86SD+AaMQCvtcTaVLAR
	 E6OTG2ZuhAQ5Y2ZlIzRVi+cInKYTf0v9rXhTlYmR90EfSARH+OeILPwq3n9xOfQkro0iX
	 nYC9fdFgSSjnmaqxQbfbGF9tdHhf2DZJNK91LQs0gxiGMWQCvm2fAVLEyKHh0+cpc7wpU
	 0sbUfpUNGRHriLjkJT1WrdDBrW9Tww4CduT1dHSgn7Xzc+BLIVFJlR3KA/Wi687p54ePj
	 z4daco4SId0tH0j8sTZ/ENYOH5+qrlCj+zeD5a2DJSHq+VZCMS9gDR/NwANrshkxzVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
	b=F9Tauv3P1q0bsKCpc8CxHsPIOiwv1CvNa/MGnWjqaq2Kj0q8g0pFoWKFqpLj51CddnbR
	 PRAUqZas86n4pD5dGKuk7cQGuGxyiku2SO6obU9/L3tepCnKQzImnd0LmRncg3E1NU2kr
	 cU4WVxUvELJqOnWVXuqRnrjSIYjf2Lx4xcn/Ps0u+G5y3lAeOXavO0CKHkozpsrflCnfS
	 LVMhZNfwc5OfCvM6nLN5s09wfQ30W8dPpUjox1P37efzU9C1G1bMTLp9shRhQb5ehQXHM
	 fDIJnnF/jodLLbZoZS72qs5Mja3RvTN9RaSNO5SXtr0arrT652Pg3cgPb+ecz4qzCsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=W7W7gQZe;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D145606A320
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D145606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=W7W7gQZe
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so30923105e9.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384786; x=1794989586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
        b=W7W7gQZehSxwutldfgIWtGbi91FuCNPbLxVzT8JuXWUrgGR27Tx7jNB+qaa9smDctL
         dwsnNfGMWtnvf3TQ/MWBAkDBWHGC2g1tbHohVXrpxZ92X4xYD1tcTWQfqf4n8l8i4gbc
         LoDr0BCEaJvsS8fkdzjEy07gyEO4KnF7XH36jPLE4Zo16FtU8Od9E0nWTEpxmug2yNmu
         IDR12P4xdA5sHGBbWotJX5+EqH11ojjDR5N+oRG2Du3W2YgjzqV4KzIXR9MEHTfjZ6t0
         hNsCcCXOG8o1IaoM538yBmv8VH0JDKoS8TnmnoutijCFdSxq7wZ6xlFCbAHCRYrwLvJU
         ZfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384786; x=1794989586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
        b=M2g9rUiGjgQdwS6suXFZ5MA0dA63UGGr/vLwSUJIPg7S+uw0myeVg4w2I04N8na4fr
         UEkzqC1ZoPewdhiatBtITfxdq2tpD22owdCOM76j2FsauBaEzgybj2/qgKFdaB/2Wj0S
         z5RrGYc4pUoxg31YJZoD94gDA7TwXZRTi6ryS41cC2AesxnBY/XJCVyuGg7F+wnCnrrZ
         jRihvJYaQJErdevxC3PcPix+AkrUw3yL0DONNlpdqGSDPzN3uJ/d2zWusAh06yMCbcgv
         24NUUsI33Jxwlxx7JduZYw2NnjNfYlKU/Bmm2XtFEzReYgljyoz74xT5C+U8HhZhjkg/
         dU8g==
X-Forwarded-Encrypted: i=1; AL+hErHZgwHOSJ9JKRqH2yydsa63eBBVI2pVjG0VUnYuzfrdXNJju9rD3M2K8pmQgLEA4qmlHg5s6YXWMcBb@vger.kernel.org
X-Gm-Message-State: APuU4Z8ggac9nHJ850grV/Pm3lfYWS5b45HBVP4Ch+jSp+kr8P2dEe5n
	7Bs75sSuE6x73vL0r4eRUX3hyHJeNP98Kn799VX95oHbGYfLntNEYv1Fb75tDm+QYA8=
X-Gm-Gg: AYBFou20rISaj4jvFORZa93aJyWBYV1x2nHZivNkAgGD4US8AocrsN1kG27FMYA04dn
	oxadgP6HjBFzIxXN1j5J7ALX+ZYo5K6cykmDxeXWk9U+abqr4pK8h9pKzaFR4yaG7sn3Wn46bwK
	uTEKT6OU6e8LpUvyuEUoOkmpwC1nAEHxnyK8nHU/9Nv1aBvu+PX9Mad/Ubm0bX4iycCqodxFpk9
	NNOMel0u/77XYwq6TP5HD9/5vcXkhZjD4b2+GDDecC/tfbT0einDMkK4CN2Wc0RIkEpNMi7srDh
	YkEjrl7XxvOpo61AHiJ97c6A9IDMsc1jDsTA4jf6lXzRWO7BexbFLjXxiDojc/IzsH4+7pFEBHO
	SMwD/HCRNpXjzhorBiMqZOyI9CD+nH5VQNN4PpY2hai/EuOwbOqCPLkrFOtrmLa20scZswXHMUT
	RVcRSbu08i2vIwMDO3dge2JZFdk3U97UIAukFycU3wmQ2paQijL2QkB+VbzujabYvKma1AJjsOw
	7X2FQSb807RvXi5A96E1VBa9ovCEu2YbXo1MRHHgHasNYCYhxxsPXE0EHAwQguPCceIu4FVnQUR
	Hesk5DMXYmZmlutJIX3AT+ndA3d0hnqU+2oC5b3Udav2DYbvbLeS6k1/2VyW3hyB0O4r2fpHk5d
	606iFSaERQQ==
X-Received: by 2002:a05:600c:6214:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4ba0939815cmr24681275e9.34.1794384786446;
        Wed, 11 Nov 2026 00:13:06 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:05 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Wed, 11 Nov 2026 09:11:45 +0100
Message-ID: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces support for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the carrier board byteDEVKIT.
It also adds display support for the integrated Youritech et050fw01-kt
MIPI-DSI panel by extending the existing ILI9806E panel driver.

Changes in v2:
- Patch 1:
  - Use specific panel part number (youritech,et050fw01-kt) instead of generic controller name.
  - Elaborate commit message with vendor description, panel resolution and dimensions.
- Patch 2:
  - Update compatible string and function names to match youritech,et050fw01-kt.
  - Fix commit subject formatting and commit message.
- Patch 3:
  - No changes.
- Patch 4:
  - Drop standalone SoM compatible entry from fsl.yaml (only bootable board combinations allowed).
  - Fix typo in commit message ("byteDEVKIT carrier board").
- Patch 5:
  - Update panel compatible string to youritech,et050fw01-kt.
  - Invert GT911 GPIO polarity to GPIO_ACTIVE_HIGH to fix address strapping and reset.
  - Assign pinctrl_usb2 to reg_usb2_vbus and add vbus-supply to usbotg2.
  - Add disable-over-current to usbotg1 and usbotg2.
  - Move panel reset GPIO into dedicated pinctrl_panel_reset group on panel@0.
  - Standardize Ethernet PHY node names to ethernet-phy@... and use tx-fifo-depth.
  - Replace underscores in pinctrl node names with hyphens.
  - Rename tca6418e node to generic gpio@34.
  - Consolidate devkit devicetrees into single imx93-bytedevkit.dts.

Frank Obergfell (5):
  dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
  drm/panel: ilitek-ili9806e: Add support for Youritech et050fw01-kt panel
  arm64: dts: freescale: imx93: Add MIPI DSI controller node
  dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
  arm64: dts: freescale: Add support for bytesatwork i.MX93

 Documentation/devicetree/bindings/arm/fsl.yaml                |   7 +
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |   4 +
 MAINTAINERS                                                   |   7 +
 arch/arm64/boot/dts/freescale/Makefile                        |   1 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts            | 449 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 199 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 10 files changed, 863 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
