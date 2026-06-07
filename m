Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F892EEE7D
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780837947; cv=none; b=CpuJmXtTiNBX7qbTTYEqd220NEM8+GoPbPS1j3mcEFHZdEbFjvJEOZBtnIxlKb5g4aKNyYr4HU1qs3o5Z/sYh1uIBiSyKCzuyq76r00Vi57gWEyJxKNVfU6g0YT+tVcksjK1nFdyL9+oWZOTsp7ZWrRpXJ6t9JriVKJXnVLgYF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780837947; c=relaxed/simple;
	bh=7olzZHHpB71MrERaSvQjT5XeeR/NDdooMLayR7fPucY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LgPhj5kMoEaAsbD1RXKZOwdL3YuEioBkgV+RJw/bXBa79C163wg7gBQudX9H2sX+JEa72M6WoYcKHRUvikc0LpGlNLT7lUG71GaZ3xvzlT7Br8BlnpDQ8BykrhfxtSwcEs8qBiIyOe1C+M+9jKARDWlwTC0IqlK9p1nIGgc15Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcOYCRbh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcOYCRbh"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-befee9e5ef7so379736066b.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780837944; x=1781442744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upYkD5TmeVM6Zj2sXRhLZMQLdRWjjRoIFrUgE/4H0kg=;
        b=qcOYCRbhNIx6IB07wiTtdAt9GOwEVZ6/BAR6Gol8GimRnM+v/v0y6uYEl4OPfHtuPI
         /VEyZz+WhxQrwE+v10uuKgokvrGIMzGp6umafTRYK13MI1FaVFm4w8TpvsWRakA7zcu+
         eONPRunZzk60n+3KrL7qo2mKIiC10Zy/cwzwVlCIFcjMjxoVVMXjQOf/2g7g+uynIeHo
         rANSTF9Mqumd0CfVU+pEquvxTnaT8xFAvNvdX9ehzeogUrgli71gvZS1YzvmgvHUxWWy
         OvijL0gX3su5Ojv5lM72BnZD4zRukJnamYaRom9+yJD1QUFmmgK0DFeX6GPe7oJrHU4T
         ExOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780837944; x=1781442744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upYkD5TmeVM6Zj2sXRhLZMQLdRWjjRoIFrUgE/4H0kg=;
        b=VEzIFNcGa6IORQtKYvWQLFEBGjlbGw6kM3p4BE4QdfTnUMN39T/dyDwSTx4mOh5iRy
         QqoXfGO/dKvrN4IAM1sefEiEwK2QbQNVeQGjvCYsl1haHdcoNg7OtRakVdWLmjacRrzJ
         dHIPTF3KaZE/MTKi32iQq0pxXw0s2ViVHBLqDxc9KST+RGFYyTJnV8jdIDdMtZnLJneR
         TtyDKXAELlqDna8j80HHjsGaMPSbfTNnFQ+EjKATkF0Ff0dO1I2ROU2aEqsF+3cPw3T7
         e98wSeTYaCyF3AgD+CRiK0onBGaW5ZbD9+qyBbi6ZVuq4GzO/8YgH4a6d1uoTjoFtgEX
         Lehg==
X-Gm-Message-State: AOJu0YzNr8OjiIExeAyaQARmQCrZiyk53hw8xfTxndG+ZzP9X0P3P1Mf
	yo95SjCQ+rYUY8owTSncHtAWKO9sc8fZDNSFbbPoHerRhpocO+QGuodBh+GquMFC
X-Gm-Gg: Acq92OGtvjgt3RNbhmDuEGv7ivf7HByVOpgJFfE85Pekg1QvlZHmEXELC/9W6tQ9Xk0
	7WgWE6T1pm77yb2SoU9fDu5Q7NH7rZaasK/AArOgxwIgyFTHnVIpToFVEEvF8G8axzlTZ4maIK1
	KXuaLCbmc1bYdl6fpv/pB/T8vhlthx6uv8WKFhLP6FrzL7sVG+1UOI9cnZMmxypzpCRoW+HlboP
	7Lvz2W50ZE6Gfr9Jrs3PeSJZDb/os/n0OYeswuxEE5xeVbZ4sanr5D1LhoXAtDrV28fAec8rN/U
	SYcpQH8Wh/y7Fceks+jAR6g9tb7MWRcQeRiPKOF31qkq3ZPw9X57aD/kXL14/MOQfK/QNDdlbXt
	mJy+VaGlwPaT6lXxbAvcZhG228nUTd9glDUSlSJMjmMkJ9kesRPEdQxPVr8uMC0t2Cn/UfnsRnq
	UB7KKriH85EsrdvwWVxNUCfgsKr2+QAlwxj5Z9hF3adLhwtsw=
X-Received: by 2002:a17:907:2718:b0:bea:f4e0:c7b9 with SMTP id a640c23a62f3a-bf370d638ccmr395176866b.19.1780837944394;
        Sun, 07 Jun 2026 06:12:24 -0700 (PDT)
Received: from gigabyte-b550m.local ([80.68.228.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176e1b5sm719839566b.8.2026.06.07.06.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 06:12:23 -0700 (PDT)
From: Lech Perczak <lech.perczak@gmail.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lech Perczak <lechu@hswro.org>,
	Lech Perczak <lech.perczak@gmail.com>
Subject: [PATCH] ARM: dts: imx7d-pico: describe Bluetooth controller
Date: Sun,  7 Jun 2026 15:12:17 +0200
Message-ID: <20260607131217.6497-1-lech.perczak@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ampak AP6335i Wi-Fi module atop i.MX7D Pico SoM also supports Bluetooth 4.1
via UART attached to "serial6" port. Describe it, so the controller can
probe automatically on boot.

This is based on "Pico i.MMX Development Kit for Android Things Hardware
Manual" rev. B1 [1], Table 6 on page 12.

Link: https://www.nxp.com/docs/en/user-guide/PICO-IMX7UL-USG.pdf [1]

Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
index a1574ccec89c..6d4e8087192c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
@@ -339,6 +339,20 @@ &uart7 { /* Bluetooth */
 	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4329-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_bluetooth>;
+
+		max-speed = <3000000>;
+
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+		device-wakeup-gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "host-wakeup";
+	};
 };
 
 &usbotg1 {
@@ -401,6 +415,15 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX7D_PAD_ECSPI1_MOSI__GPIO4_IO17	0x14
+			MX7D_PAD_ECSPI1_MISO__GPIO4_IO18	0x14
+			MX7D_PAD_SD2_RESET_B__GPIO5_IO11	0x14
+		>;
+
+	};
+
 	pinctrl_ecspi3: ecspi3grp {
 		fsl,pins = <
 			MX7D_PAD_I2C1_SCL__ECSPI3_MISO		0x2

base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
-- 
2.47.3

