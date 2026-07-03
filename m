Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB437C0EC
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068375; cv=none; b=DL0uHbDjXx4uLy/Lu0YDqcVb14ogjz3ExawPBkt5MHONagsINYGWnE3HkzMxiCgWpnk5/PsVmgIjd073ponMgJCo8ASxpDlUAs4o9gy1GDc9wP7hfpRuH7MhOOT8kAxzlMpPI5hvvexyCFecqtLANRq4oTNLN5qtRNA5Zj0yWAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068375; c=relaxed/simple;
	bh=I1cHu9NSZYBGonBfRtRuTgsmlJqfnA+uMtlThkFiRNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJfV9PcA7crp7p4JkZoBZxoIunCtyaTUc7TR5pck8+2oawOqcQD/uvwk0Jlz3WEZPd63SzbfGXe8mwFbOUyxyPedWaKlC3V3+G8OgzP+YaIMVF2e1qnmAe4g9OhBYkbsKQp29Xs6/B0OD2jVz52W70BjfhPB4BDUX1yy6fcUUWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4zQ//QF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4zQ//QF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so2342325e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068369; x=1783673169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaMysW8ENvaf3rrvLxL52kqIKJ0nwCCn6rGzVpw7LPE=;
        b=e4zQ//QFlw9B9Q2CSfIHdfdwFRQtz6FVZsCkDaVmkMp/umUOgDNzG6D6+lNsF75zds
         j2+Qz8iSyRmi8QyZbKjtbbkKvmdHSeGI2MSvv6XeegN1RzKqzYGhZ7vRVWIgHuldjTHz
         LTBNKvXYEC91kSoEgkskN3k3uQ8LT+Maxab5jnBU0YvkyVnJjPmSPpfV1We84CscY9yI
         xFlMD2B+RBomZYCxPK2jn7K41nJR/Xh+3VQAua/+W0wkv9s4l7cJmiTn2qal+on9qYEg
         f9F/WL/oCWYPy2gOUWrRpR2+awKEPOaUuU9rIV1pr9zNuFefIyXfPw2g+c49ci5Q9gso
         Ezlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068369; x=1783673169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EaMysW8ENvaf3rrvLxL52kqIKJ0nwCCn6rGzVpw7LPE=;
        b=Zl36MIPb4uFuGH37YN3kUnwh01SfDzHap12gxZ5IdHtHl4c/LaoFTkV9q3m1Obk/43
         QzYwM+AIwAybYV3ZPl2x43os7M89ua7xmg1R3bNNMr/49nJwNQblRKNanrTJTz3qL9Vr
         UzSq2ymbMSJwWGy0oS3W6qbdlzE8EzpMxtpPvLC8t4vpuTiRs3X6iwH/KkfMtk5FFPmu
         nL8H8Y3nAHahLpAzinqf7f7QKstBSfcoubd7dlD56LTibNfANRD4GtaidBr37nL6W32I
         dsrZXIMBRyjPKiMW6Tvux/DZ2AMw3h56x0fd7tCXgxn1I+oaVs57xD4DdxVk6I1Tfrfu
         PDuA==
X-Forwarded-Encrypted: i=1; AFNElJ9EE4zKJRfpcH2U8wGUH6K+zyoTa8mnv2VzpFuwLV1o9CDvzuFxhaGagPQul+FA+crggd5THxu4apji@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhr4n2FG4W3Of25nuaeiPaHC1pjFYadrHBK92GE1WDyV8Myu5D
	2PLuyK2VFrYWErI7P403FbKSidMYSxlA9vzlBSYEWCRIGQK4y286vhe7
X-Gm-Gg: AfdE7ckPQqviCMiYP8CTzmCeD+pUJynWW4W47NU9Ftc/vbDad19nK6mq7UMeznE/MJb
	TD0GKjeR/u/bd73T4Sd/pJ51Hka3gDpI4vjC/lJA0Zu4LsgpUTS5p8ClAcE/ggvOUrQbxdip/hp
	lEcAPCVqMMoW0XyMdGFW6PEAHX9KXlLjCwqWU0HDIDginuakVUlnwQ3X/bfSCmLoU7cRbt0m8eZ
	UKHDpfTxIPosoe9JVi6o5ag8N3ZcOTQhQmNatfdmTlF44Q2ApVWP73tGRiTi2ah3lvDWv7zZpT6
	ahadfYHfPxXFdlvmI0fKufe+Z6XskSLVYhJjsH6gudsA9vGjf6/TK8EU9NwuwCQh12io7mPaUu9
	B15f3nn/vIGp2BaRSV/VuudiTLWFc/+fLgMFoKIdOd2MkTBCbva9Fay9bUQGMHjl3gLRBIkcb6p
	rCRhUtQCJYP0A7fwO1x9H1dbU4wb46U3GIdcnq1BN2uR6qNqtIqasHn7/5RfefibefDG/XKef41
	orJWVrUlu2irfBCtJGwbKg8EqvKmEbp+ua2
X-Received: by 2002:a05:600c:a011:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-493c9b0d55dmr39419845e9.0.1783068369380;
        Fri, 03 Jul 2026 01:46:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:08 -0700 (PDT)
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
Subject: [PATCH v1 02/15] arm64: dts: freescale: imx8mn-var-som: move SD card support to Symphony
Date: Fri,  3 Jul 2026 10:45:49 +0200
Message-ID: <87e54dbf65c27944b015335ac699fce7f45369f4.1783067947.git.stefano.r@variscite.com>
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

The VAR-SOM-MX8MN module does not provide an onboard SD card slot.
USDHC2 is routed to the SD card slot on the Symphony carrier board.

Move the USDHC2 node and pinctrl configuration from the SOM device tree
to imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mn-var-som-symphony.dts | 57 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 56 ------------------
 2 files changed, 57 insertions(+), 56 deletions(-)

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

