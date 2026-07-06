Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F2A423771
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330500; cv=none; b=I17PIKQ/dt6rCh79IKWuAtVQu5jwt1TjK9JPCA7X19ygQhhKYLVmLDX7/XqN8MlTCq0rOaB2bwjuC1GZrfN+DbfK2ufO69/7KE3hRoiG0MhFhz+VpFrSSzzDLKfrzVHzcTBU6xO+1QZGk3026Vidkcnc251OFpP1jypdXqH8s08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330500; c=relaxed/simple;
	bh=s1b85dfFlAL0eE5Yh1EwpDIDzYsRBzlv69PhXJs52NI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=maJsRl180aaBDjIg1JNiurhsWKTPT7W25WUSNYV5IyI4cC4AufA1vOWFiq75zX8eumQhmXeKK8TCcK0Go6D7WO7rESp0vqLJ+/Bgd1cVG/cB807Z0ibtm4etZwJAAb1vSXpw5T/cNgKpgPvcnAt93WIpRxo/70EZc9PgFAxZvCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFwhKPe8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFwhKPe8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so14481295e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330493; x=1783935293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUpg6nprLTQtDmr0JCbtYl25aUYHPLojLHdCAqa+ibw=;
        b=GFwhKPe88Ma1F+oIrU8VRxSr7gYigHo7bp559sgDKfACXYjEblsD9OYNrtLATmYxw4
         ZEQ5IcF4i0gROaktaRztv7FYydFJTiUn5HG31Xw2UDtt5e7HN2GHoYGQ26HhvbuwQ9dn
         Q0McPbH3tRn8WtMAWNGg3bIeb/EeKbIumW9H0ONnOw7UFt1mdFCMWlvuuI0TsnyEijcv
         Gnenzo5JGMpg8lAig8rjV0nD+VSCqGgHpFNdGdhWuEsfO4q8jLmFcfal7obCr/+35i09
         UsVPAYxiSZYnRM26m2xou/4GUSTkLGoXKj/x4FEvtuM/yrKrnzLARXcXsli4kKCX98WC
         /HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330493; x=1783935293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUpg6nprLTQtDmr0JCbtYl25aUYHPLojLHdCAqa+ibw=;
        b=AGV7bWJxpfRBz7q08gv7ldx6SdFPC4ByS3p8AGLyLWkUZOsrKjIX3rGKbPUCMsLcqy
         E6iVLhCpwa2QdSSAIgC9t25GWoRcARh50KyPlHwD48+rAvJUtYsTYW05Nt8FPU/tsKMc
         JuwoklDMDnruCrflXq3FcnWL6LejFMXi1Mcujz/6JcQ+qAAOUj/b6oXkS0Fty2CaY+yT
         yFD9E0KSGRoBavgv1/Hgij2IK2muSPj9sJoV1vbiKCfKJgvG/nxfpbxAoKyp8gppTybW
         DUPZVcYKtk5NGfu4JOZohTAyUxciJ34fp4gdHfZ2V0J9fyJlthQQPMBTr6DXhNN8S9q9
         VPXw==
X-Forwarded-Encrypted: i=1; AHgh+RqtSJYkdKTLSeEEo/1ItpAoKVWfeq3gI2hGifdxrNcmGZMOBhf/t6DoD3oUZqzAuKIoxKVo3DRZNPuq@vger.kernel.org
X-Gm-Message-State: AOJu0YzCr9mc5kbwdoQIfdzc9zT2iPFuR3QYKvQQ1cBMqYbmT89tJVKO
	XzaC0ro5+AN9twXqHo3dep1XSjDt65vVNtJ6WjfLNRV12GiNCmGxCjIX
X-Gm-Gg: AfdE7ckAZH24zQTdsDbZO5OkTPsNPAlInms4VeKG5z76I2vewzSvXzzfIXI5I3OaXIh
	h0qulCaPCOEabaV/TM1l+gfkvAxTlOL/SJrfriYVlJ9hSO2R2C/4RjZGvVYe+p882szo7B1rReU
	E1mGfEvs76Y+kGWesbRTv/t1vatMlWgqQjzVTBCIHa4hdxd43XpXqyVdwrh/AFrIkYiUS8qqQGF
	nIQNEfnnc7DjLRAJ3hnZB4szin+uoZVMv5uGjaXHWKZ+s5iZhW4Io0GzpWRS8AGQ8pg1/DAmXpe
	Vf+tHfcKr2qxfudutLd15UkfPtj9I22EekG4OwbO9dbunsJt3CvWweib/Y8iCJfLiaYu+DLvUN/
	DbfycNy/5oJp1AmbQjVXnhBCx6BC3AaxLgjeCCGNhLhMqhLKD4rnvF/rvrH3BXwHwZze/HdDtWc
	iN1BpVE9poTbKtxcffHqsc9yggFsO4ZkDgoGqUgorzd3ODO9uATgQgN2Q030bMoFSzBRpKPFsVP
	EdhXVDjI8T0DjOhFeIt6Y10rA==
X-Received: by 2002:a05:600c:8411:b0:493:a976:5c6e with SMTP id 5b1f17b1804b1-493d11def4cmr100457575e9.16.1783330492952;
        Mon, 06 Jul 2026 02:34:52 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:52 -0700 (PDT)
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
Subject: [PATCH v2 02/15] arm64: dts: freescale: imx8mn-var-som: move uSD support to carrier boards
Date: Mon,  6 Jul 2026 11:34:32 +0200
Message-ID: <40a2d0d32bf3447f833149eb4e71365c4515743c.1783330236.git.stefano.r@variscite.com>
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

The VAR-SOM-MX8MN module does not provide an onboard SD card slot.
USDHC2 is routed to the SD card slot on the carrier boards.

Move the USDHC2 node and pinctrl configuration from the SOM device tree
to imx8mn-var-som-symphony.dts and imx8mn-rve-gateway.dts, keeping the
SOM dtsi limited to hardware present on the module itself.

Add the required off-on-delay-us property for the USDHC2 regulator on
the Symphony carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Update all the carrier boards and not only the symphony

 .../boot/dts/freescale/imx8mn-rve-gateway.dts | 47 ++++++++++++++-
 .../dts/freescale/imx8mn-var-som-symphony.dts | 57 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 56 ------------------
 3 files changed, 102 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts b/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
index ea1855171fb0..056ea2f9e963 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts
@@ -207,8 +207,16 @@ &usbotg1 {
 
 /* SD interface on expansion connector. */
 &usdhc2 {
-	vmmc-supply = <&reg_3p3v>;
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_3p3v>;
+	status = "okay";
 };
 
 &iomuxc {
@@ -276,10 +284,45 @@ MX8MN_IOMUXC_SAI5_RXD0_GPIO3_IO21	0x00000156 /* B */
 		>;
 	};
 
-	/* Override Card Detect function GPIO value (GPIO1_IO10) from SOM: */
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x41
 		>;
 	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index b07e71d3adee..7308613a48b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -28,6 +28,7 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		off-on-delay-us = <20000>;
 	};
 
 	gpio-keys {
@@ -200,6 +201,20 @@ usb1_drd_sw: endpoint {
 	};
 };
 
+/* SD */
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_captouch: captouchgrp {
 		fsl,pins = <
@@ -252,4 +267,46 @@ MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
 			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x41
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 32f101ef2850..e1d2e2a72e1f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -295,20 +295,6 @@ brcmf: wifi@1 {
 	};
 };
 
-/* SD */
-&usdhc2 {
-	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
-	assigned-clock-rates = <200000000>;
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
-	bus-width = <4>;
-	vmmc-supply = <&reg_usdhc2_vmmc>;
-	status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MN_CLK_USDHC3_ROOT>;
@@ -454,48 +440,6 @@ MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x41
-		>;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-		fsl,pins = <
-			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
-			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
-			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
-			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
-			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
-			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
-			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-- 
2.47.3

