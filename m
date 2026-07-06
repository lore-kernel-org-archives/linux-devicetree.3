Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F94DD6FB
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330506; cv=none; b=TxwaU9cl6fAk5FcPqxCIMsltnpyTN2vJYhH0G+06fbtPiCWROAnfqNw3K9mkLqELuC0YKFWnYEaOlIgEd0neMX7r9f6Dpu0fla6bg8DjIlJh3+2+aLHbjkSVHMbXBgJbs1oWsv9qv+oRJnVOMMYDICKzoQw6XKkCeygeX6h5KDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330506; c=relaxed/simple;
	bh=aQa30xpL6q/Y3xnkDPN85xU7y51oa93AO0Kem7bA9GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pciWMLA8Riu8caFm1mFy9NsvJxvDvb2OLlGIeMJGUVYD+kSPOF2QbhQq9HovVLtQ8bWn0UxuZMS2dNelibRlZzSDonIVeDWpNQ40bAFzalrbK4ZMC/4vckvTFNgKpE9w34JjJ2GYxXwaRtY7QC8p22SSvdHwDfulkjppbot1W1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zs+bA14i; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zs+bA14i"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c1950518so18633865e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330498; x=1783935298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbKx4UdJngIHDfVXCfQYXIxFv5ahfIStqyAOLEiYvps=;
        b=Zs+bA14iq8omPyB8IMS8EtMsehgOXpD9EqDwywRZ/3Ng1cES09mo0n57ZxNMyWANdX
         a7mf3ndPoyzgz+AoeG9dBJeAs+HeAUb+nCjYzAfCm8CX9nqgYTcm/uRbDWG//23/vxY2
         +8CRaMzonXDgf6hJVGl22gbTqHwB6CJPlM8HMUHnOZgVG2iPEZ0H7nOteeaPdHL3brji
         v5+q+t7eAS/iIZh/Vio7N0efm6peuuz3Hmft7sJx+3oph38h52aolbtXsr03FPOyK0ZG
         Ghqk+tntKvejB/dGTqmoPJnS5frFzvl8M+zMq4URTdIzZ4NDWZUXZ4lTPAisalKNCC2X
         hlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330498; x=1783935298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LbKx4UdJngIHDfVXCfQYXIxFv5ahfIStqyAOLEiYvps=;
        b=LKdhx/4BTzvDaUF61TWIge2znskvxnBTCkdhFC+m73jTgIq0+z+67Dp8o+xpKme1o4
         wBrWqaHJfcuX+OAjN8khg/wyKKe+Uhcd7UEp9u5wDgPH2Jgu5v9xTRfQSu8CaVf763qK
         fQ+yXdgEWtxdFfw6XRJNzZnp6Bi6TRNd0kDFivGI6QEsZFyofYfCJvTN0/pL+PvOUAdN
         +WlhIn58kagSxP5DjY0ORm4FF6QrqjX5kDVdQ084sLHjLT0xhEyICJq2keRvpA2oHZZz
         2+XiAl1c12fjt08SHMBMz4NAkqmUL9EGcvpItguRVAfW9HrwiSKQktyv/n+la6EwGDWr
         jXcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCbOB3D0gbi9BlY/P22RUjgPbmYl68leuWmV2z1uNULXH9xcIZMK3bxV1A9mdwRGcRaHPU/ppN7vLp@vger.kernel.org
X-Gm-Message-State: AOJu0YyF1N63mNTlUWkQRzHTQ6/bxIczMEykdeFPRk4uvlxBfMqt13Ml
	HPx9IJDc9/qGx3N7ZrpvYyX6Zu0jpbHtEuU0IciCayf848U6jgktSRI/
X-Gm-Gg: AfdE7ckJiMOu0UDQsfVpaTfgtB8MSi/kkqaRGzkqu7CtOpZovCSnFmPQuVQxGzZsoRY
	/7v59pcPoI+Qq0DSslsbQ3NSuwph0eER4sBVryh6ados3i8vFUHr6dtIhxUu2Og4T9I490wjB1z
	FqIanLSXfK+o0PRuxpNsCjnM7qL+gFLUm6dDHh0cm2a2F0NJgBBuAPkQpHsfWL+pStN/AWn8wl1
	JbiGiCsYxcB/u9cUjO879q5ywVmvHKoAQ5Cf1gBBl7c9L8As58SjIySqOcaRNgDXT6Be7saPMwf
	I/NJJ6F/s05HaPK8RgQ/zTFSePTPEWFW66Pkafixv1eUL1iojnQJRc4gaML9QFElTIUR10r+mRh
	WX93p3LrWeIcJ6qg6eyJrSQOyLl+sPqTMrft2FZIWiwQs5u/y7NZVm701AvfaF8a4b35kMKoGBH
	bHuG9ODRDqes2MiAuGkCz0x5jdDCYY/6CFX/5KVLBKr6ztSU5xiC5VY62t3weO5SDx9fFdHrR1V
	0xe0f8XsB4iPQVDVtN080KOyQ==
X-Received: by 2002:a05:600c:8489:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-493d128b664mr87032755e9.5.1783330497687;
        Mon, 06 Jul 2026 02:34:57 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:57 -0700 (PDT)
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
Subject: [PATCH v2 06/15] arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
Date: Mon,  6 Jul 2026 11:34:36 +0200
Message-ID: <ad528d193a9b2eaba700efc7374dd9ea90dd2dbc.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
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
v1->v2:
 - 

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

