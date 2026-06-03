Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA347CC86
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497452; cv=none; b=Y5n/djK41BiNZYQOU5SroDQVHfiPftDNQaEexNh4vHxQ0Yb59kvzMNGEIJ2fFSNX6Gpw0czeAK2Dx1IXuu40bvVVzua6HGYBj2qDXYL5S73K08zSpbsBVPplA67/SClbGPoq8RIcn+Y+lulLlu7hPTXvDzGXSuPCWUpeSys0/ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497452; c=relaxed/simple;
	bh=/tuzYSgqP1e1YK4lRH7GySipiUrM231pfnkEZzor0Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X44BAq+ilAP0T9wRbR5EuutF6NcqLnalx6B7c6RnrvxKAJ9zTXKMzSrMrkBUNV+Y1OyeB8hSRYxbpG9DwNRIfvELrYPrYQgH63CM1Wpf9r2uuxMbcMhw30Ivb3LxWVkLJfRA4r2I6VUpY7vqyybqK8cv2HGOVRZc+RdP18/m3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc37T1ve; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc37T1ve"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b3e03939so7468005e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497449; x=1781102249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70uSNHFwKkHfItFomOduAZmxqjyWJiVQ8AWJNM6Iaws=;
        b=Sc37T1veE8deeRLA7Y1xxGZGu85LqHsers9EZr1EwDjM6nOXtgRZDbcaKaemIVPbhL
         8GadtYWYnKq4+JCY0JG55NpZzXvEfP+uurcal95CV2j0CCaVEqlYXpgO78X/PrTih1lV
         bPbZx/4/r/FdtSqP5TRLlKK5q3E8LCrAyTnsPPBpBT8a9LXFKNmW8ocr2cJTfR/IpSIe
         AGtObX4kXX+vYIY4BbwSKdjfdSu2BQta9c5JkAKVf7ZBe7Dv3/T6XNdwruSusLQI4Ix7
         GNwRQu2ueWTSEHB6jJ2BHG4290rsQ41fHMeAh7wlpqM4YZMg1xcNjM91hq9MHF0jlVm4
         mawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497449; x=1781102249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=70uSNHFwKkHfItFomOduAZmxqjyWJiVQ8AWJNM6Iaws=;
        b=RbmIHbLXiEMJzj3QXZODVzwjLmR8vhC8a3vwnmEiuFCMqhe+e+pO2hGZbA0YpjxQAF
         Gzq1rdQSxRwlN/ZP0D5jaDXcdwd/rpWxTjFLV8hWFZy+X2E5UQstYqboYv3sYtqNbH4y
         VeQCkUsfX6kUXOeQwgknL1CVMVANdJCcgdyke+ypLowpzG2xypg/iFHO4MRdRpwcUQBX
         F6oB4gG2R+w9nCG6tdjARSg4Ru+/CdBPutbkEEEhYdL4ThtgZWvfe55O+9ecS3qeUI1W
         RgeIDuR+3vCVXgYrAG1Wu1a5GM90iZDIJ0xc6w6I4QSfT8ORNRNZHeOZQCSffbXlkmx3
         2QhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/grqT0GhMoowEsGvoeoSgvgVq1sVSltPHjynlIGsX3EqyKzPLLiqYSAPQ5sFXb6Lx3s27B4Umbg4Ne@vger.kernel.org
X-Gm-Message-State: AOJu0YzAMXbuxVy/d49bkF47ZtoZ0WId8MSxcrWuSw7BgHESBo73yy0E
	ql30ChztDWMSuzw7OdyJxxKy2Onb0ypu8Sa3/T9K7ASdInxHzpxCGgiP
X-Gm-Gg: Acq92OHQYJ2DTySQULv44tiAP5hMZD+C5/CbRqiI1NQ/nE/NdMyyeQeZMseiMnCkLO0
	ihk/gqAxYMnlTmStxw0iaLbU96yvbFsW3uLNdgxxCbGFoeTleZtv40qJW4FSPmJeWehD2jQT+Hp
	T4UqvJsmkFqYs+fAuDHrM9faBCPZhxLKC/O+3ul9qyXkqLNB7RGHLX9tqS6Qi+4bMC7xxnhAovG
	SOV4p79/KDsTMflXE/OUeca8jtcrpPn8MGmtEtx087ZIWvynYNPKVGv6Ra5sxO+9UAQajaX9EU7
	fHFkYjGGv214ME9mCwmEsA8huHs/BD504rQVv648kOX++k/W3KEIEapVtlW1n0bf+zGvBbO0qy/
	iLUGRwDvEg84LP0UAgVt7DPWTn5QWleurIS71R2hsRYRGUdh9da51T8kPSnTFKeyXXKGqlL8T1M
	i55LTA8PvAluEZvpGyzR3nGJuUNl87kk1Fore0NQVcePlcc/N+K0nqGC7hthjhGhYKh4EvZt4mz
	6v7RiIbS6xk7sLsYRCft/5t015GzJjLhELgjIt5/0/9XO+KMo6cSACzz2M=
X-Received: by 2002:a05:600c:8184:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490b613f158mr44573345e9.9.1780497448722;
        Wed, 03 Jun 2026 07:37:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:28 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 02/14] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Wed,  3 Jun 2026 16:37:09 +0200
Message-ID: <7d8b29b9a29b1976cafc3d279482012efae1a994.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the USB controllers on the Symphony carrier board.

Add the PTN5150 Type-C controller for USB role switching, enable the USB3
PHYs and controllers, configure the I2C bus used by the Type-C
controller, and set the first USB port in OTG mode and the second port
in host mode.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - Update PTN5150 interrupt trigger type

 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..76928b005826 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -72,8 +72,11 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	/* GPIO expander */
@@ -95,6 +98,22 @@ usb3-sata-sel-hog {
 			line-name = "usb3_sata_sel";
 		};
 	};
+
+	/* USB Type-C Controller */
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_NONE>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
 };
 
 &snvs_pwrkey {
@@ -108,6 +127,52 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	srp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <122>;
+	status = "okay";
+};
+
+&usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
+	status = "okay";
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -129,12 +194,25 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x1c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
 		>;
 	};
 
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-- 
2.47.3

