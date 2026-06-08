Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBB83CD8C1
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929689; cv=none; b=bLZdaGN3UQUenZGf0qBnzRPPLPsW6kcDjfP02XeG3X6Xbr8/VCm+L4UtFFCnUQYSKH9gy+LeXalp3vVpqmxVJ67evkNe5+Dr90kWLx8cGuSaBQLJ2UPvEKzZlIGLRg7ocs1ydwgBZJu0guoTS0S6CVbSMdsdsFv2Meq7QFJpD9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929689; c=relaxed/simple;
	bh=3OR75mM00ga78bJJ5INn61HGws3S4oSk9aXzdQei9eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdG33v5Pk05NkZSiYc5+X0nBLnL/qKJwUg077u6nFmvr0B2dabUY+uWJC2TYKLLzHmOgQJd6uTARjspj96TtSj4THPbd3Dr/DfG73VXPtt4IGMTHgzfzvAgKULn/K3iUI5ZipuYX9DteSZhZtJ7Qsr+5YdFpka5HDGD4W8be/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIpmtECz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIpmtECz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso6258365e9.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929686; x=1781534486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZtDd2dpRTbBih32m/3kw3VCO4DN79CIvfv0d4AZ5vY=;
        b=IIpmtECzMVqYQc1GTsr7pJRrHyhUpfl1wdwcGQEig+wduaavhToEtj0IYvQcTx9kbU
         ztiXYWwMJ+Q0w2v9k0gF0W9HT+97pdTKnmsaPhQTNcZ3sHR2iLdHtuXMDgjBUnOsTdRV
         4vdVZZiEv9pzneL9blaNHzHYn1Fo0ewoUyQpReF05/RZSLeHYURuH+UHhtw4Fab+bNOd
         EqhatlfATzQ8LXsjKU5uFbYQ1AO9asaAPcO24yVYkxXirdV/S9wDujRR27Q/Oc6sadJX
         Yq8yf+Qv9MZPOn1uB3eXdnt47oGlPYw9zxhwtv04xumpqqpOeuWbL5OIyyoqKSLV8QRA
         ZqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929686; x=1781534486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZtDd2dpRTbBih32m/3kw3VCO4DN79CIvfv0d4AZ5vY=;
        b=Iy36aHtKLssBJt2sooFkQ+S/BwpBmyPZCbQ3SszIaZreP95UgXTl5I0J7Ua1u3WYU4
         Wj8cNDlIlpoWHVURdAepm55XccytrGc3igD3uDvgQbgXaKMi1ixpjMB4Gi6Zab/vESHQ
         YhjPktkSiab0TlOci6vjmpM9SCr9Clehwmw1INq99FAcQfpbFZcy7Dl9I6/U33ULc/yU
         Ue3z5iI2QP/r+v46yYK8Z7GAjjJOErEW9nYufCKuX327q/BO33qrF4MiBy45pcoopVjJ
         s3sgovGdaWiDH9AMnUd3TKg+w2TrOBf7CrmiI8sDFKXL8Mdj0qQAizHMsuSELie2ZKth
         Yb/g==
X-Forwarded-Encrypted: i=1; AFNElJ+kzJSt3Nc+cxw+gZiUr7Kc/kr7rGKgMbv6VcfV+mZePhtSxWeEFx2KNwhU3k1hH+6sYkvZGetEZL1e@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDgZTpllY1ahWuURxS+rKoNOs6lRAawW9LcTB11QVHIXCe3XU
	uSISryTmjR2xx41DgAqFoAg+TP0ohnCj3gwdoCcJpaxk8ccykaUqxq3E
X-Gm-Gg: Acq92OGeHXivIjJmi0DHXvswe6zZ/jyegax9UydguhD0b+Om9dEh2cKg9sj1wujmcCh
	WZx3xqEa/Er12DT14Gc8KI5S79UQ/PGY88AZhniUgZd0tJHhVDZYp/oie9Y1I6yLkfoP7yAovIE
	Hws3iAAWG02j5fMqHeKS/9LWfRTkdVEgpvdDb/qknDcXeJO83iVpDamTDeBjTE59h5ozUGveZUW
	HwNVzwBXQbcYV6b5Jc9Nuda2pkKvF+DRzKDJpg3sJTKMe7ukwcCGVslBx/kS4C1uyQmUwn0smiU
	sOdaSkWB8w8jGfpC8lz2S1nvf9ncXyJxlAazBksc+CbGyXJrAj+V4MrXJs1jAKyO5G83+CmGbuI
	UW9iD74ofh9odCL8Lla24o14+2Oh2nQFr8zv4aXbrMiF6t1xK11xQrBEF1sQNanq+4unfktirGo
	r9tlakbdJ2tM0maLmh7FfSSDUfoD+TcPVVO5MzzZhmkkdkOYnONqnzbFSwMyYZb/+XbqjQKJgoY
	XhxeOV1/f7pXbXwAC2i4IpB0CffO4VbjmEIcN2CEYb4zj26
X-Received: by 2002:a05:600c:528a:b0:490:7136:ad05 with SMTP id 5b1f17b1804b1-490c25d5d3amr273239015e9.31.1780929685726;
        Mon, 08 Jun 2026 07:41:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:25 -0700 (PDT)
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
Subject: [PATCH v5 02/14] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Mon,  8 Jun 2026 16:41:03 +0200
Message-ID: <5646fd0a05093822d25bc358c53a08735b16a300.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
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
v4->v5:
 - Add the SION (Software Input On) bit for the I2C recovery pins

v3->v4:
 - Fixed USB irq edge type

v2->v3:
 - 

v1->v2:
 - Update PTN5150 interrupt trigger type

 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..cb27853ba281 100644
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
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
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
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x400001c2
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

