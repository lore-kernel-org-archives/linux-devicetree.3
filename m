Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D237F742
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068380; cv=none; b=L0zkn2spRvUI1bkbJ+mDg53saSNKZsR5ZvFdi8KdLJlm4TYt4bO2GK5+6qxgrpb87CO4JElg1u/pSZ/UDls0AtNFLn0rRNK2SbMUpZAgGc9idrGDf9vtfmn5sDsSLf9IcOaZMpJ0fhfH5RvLnct2BA4QRbssw/Z/EFhc6CfXP7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068380; c=relaxed/simple;
	bh=R6WSCqLmXaxPLpVCpvgfudODC5iUjpDdZuWT7mx7xcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fjv0c2r9PQvo/Vbkr7ObRvMurRFrvvyB0pWB2wBH3pN6SCjII6dWwPsYumeNwxSrYvUI9UQYvnq2ZCksf7zMmVwhTRheXbtsEqUTcFsslVuyKSVbR42r4bRNo9ST82WvTsr/oB8Omc7abvLsNKQAbTTDSeVNW0NZanG8JY2KN28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAtOTFHF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAtOTFHF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476d8e647e9so292696f8f.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068375; x=1783673175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOzNAmFCng9YoBdaUUvA3gHi0RfJnoeHmgno7+BaQ30=;
        b=tAtOTFHFErxCQN7pbyT9UM7PRB5cBHyTR8GBe+qrShjxlmKaB0J7glKmJTexMXo5GV
         79vFvrOKTKb5MEej77joPmj8n0+zziFCaOq7XRxJ89LncPsX7AZ/LLKD+skVWozB/B49
         FV35cZhIV4gObevs4/rg2XiP66Tk2xM7cpgktxk9bmxOzVVD66tTBP+iIniOY9utBTeC
         9XLeRvUw9Mdwt4mYig9Ffwaj1N5vmwEsJaeqVxD6Ssg4ET+CiLwzsgA4axCriAkV2Kx9
         1B6EBGzUhmgzNK6Z2GbtCfbUskUah1GM6e14vRkJrS3bCOBp64Xlgf+B0dQwu1EsYSzy
         hdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068375; x=1783673175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bOzNAmFCng9YoBdaUUvA3gHi0RfJnoeHmgno7+BaQ30=;
        b=Ysgmrwb58a69/ooRMud3F/aBkYwB+OZ9+WAjHPbbgj3il8rXnsQ1+QZFKYqEZu1MBT
         a54Vpn+FWZESPSfGMgi0TKwUYyYPVIzQC1Iu/hY0hMw6tpCwfv+8W3GNyGkKBewWsChS
         uLQMWHHpb664oEbt2Xhd24++kX6VYvIEGCq2+ck+qiqBcmpWTkm0C5dr2J4MUGFwSNNx
         doA5JgmxtFUMZU5EnqBOHSWtAfmZniIbVmS58xX9vfY+jHrK7sBTJgtIifS1MfdXItuY
         u8Qx8mX7oSXLqn0EJjpyANpM+Z8gaYMU6+piuLJCOsExKZI2Q4h2yxmRcHo5ztpWcxRF
         iiMg==
X-Forwarded-Encrypted: i=1; AFNElJ8NnzoTzj1Q9UpALHW1SNqmKtGSBQfCx2VuO8/Itx8r10z0aYXpFVRLZ1KfwaOm7FuOkfJz+sfQY6WE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9L5TnNNU8P7OjbmcutFBrLyea+daJDb7neWloKlEMWIshT5Ny
	CswKfx+BN1oXrifi6KTP0W+HQSKtoilqFaT4dayhDn+q8rMZaailuzsG
X-Gm-Gg: AfdE7clvFphUdmflKGcH8bWmQFfj2QtEL15SkPEEabNT4qoXRUyCvv18lQ0FvvMAqp+
	Oh8kFBD6TiuQitrR802pvQrm4QNDoYpUji3w/g+58P5pWwW/p+8a+AP16rK6UBys+YFD6cKkWRD
	ukp177SmqjP75azKzcIzF/l8dSibU6thqWS+FYrlP95UuNQz1iScf6/sPJYde46psML1WRLT4r9
	hdHikxvzCq8VwU0O4gTx92acGTpyJmLjbKADpQkIahaSu6sDxI9hhs7f1hlq7ikfQNPsQjA2z2e
	AXi1tEdH+vB3huvVwjV1hYZIjqnX25DhRKsjnUbGY7i1lJuI+kaEA0H2BNkIeRy+N+5fjfO/Wiz
	KXKe5tDy1RYAYPJJbhgOF6z75edmChVwi2r/tm8DGMr+oLGedC+SWXMW8gJz9PRiWXXblzJT2QM
	htxaDD6FKpPQhLoK7t1gXzDfhGbHXfnOXwjR9t44TLIArnkKuMYLdxM+M6q1oNqDX9JxjSSugeb
	i0g0bEAnknqn2TXcAgvV+kpC2uk8GO0yxFR
X-Received: by 2002:a05:600c:8590:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-493c2ba43a2mr115054165e9.33.1783068374165;
        Fri, 03 Jul 2026 01:46:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:13 -0700 (PDT)
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
Subject: [PATCH v1 06/15] arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
Date: Fri,  3 Jul 2026 10:45:53 +0200
Message-ID: <f6e7b5679b0ffd1053b8a5263cd5361d4aa99b8d.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the Microchip MCP251xFD CAN-FD controller connected
to the SPI bus on the i.MX8MN VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

Add the fixed clock, the MCP251xFD device node with the required
properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index e2e04ad2fbb6..ac22dd3e6542 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,6 +11,13 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x40000000>;
@@ -130,6 +137,19 @@ touchscreen@0 {
 		ti,keep-vref-on;
 		wakeup-source;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk40m>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <20000000>;
+		microchip,rx-int-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &fec1 {
@@ -391,6 +411,13 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x1c0
+			MX8MN_IOMUXC_SD2_CD_B_GPIO2_IO12		0x16
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
-- 
2.47.3

