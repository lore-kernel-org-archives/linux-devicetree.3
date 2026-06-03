Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1DC481237
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492380; cv=none; b=Nb87NavaDD8G2B5DI1vkHm4dMy3hJsw+9KupF8ZnVjPGDOv5PSTZ6KYiCJUhtfq86TEXFAxueMe8vwEww03bf9DuAnTQkBuOqc8TZSZ0MzZ2zRJqRSj79pgesveGXgZZqC3I54l0CMODxQ7h7ye2Bbj6jIE9OugvSN6owbkqJas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492380; c=relaxed/simple;
	bh=WVscJC/fx1xSpj32I+N9plejP2D/twXwc+e6YBbMyOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjqRZhOrXpkko8M/c5I4s5b8ETjG1itwY6rmGAR0zzAlAwRMvNH+prHGp7LpX5CTJ0GexRnbcKgd6fdM5ayx04kyVWLKy2VHvkjwvLqW/MdYJtl/P2LBcyXgTqHjRrMVf7OakU2y6VhtHq1V3Oe1QgGDIK9jJtaMoxk20xVIGRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuCcP9lC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuCcP9lC"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46019edc13dso1060283f8f.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492376; x=1781097176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L+XCOUCzdHOAi6HIhPFjvoFV9l5V9yicUXKuwNTGww=;
        b=ZuCcP9lCYd78u9qQ+sRAhX5v7I7GB19gB6S6TUIgiR7d303UznTsdpG52nx0zxPmZS
         Mb4eVZyRUl1DMa6X74uQvt2Qt4cKRm80lC4Ls3WYOj9i5hSbwRJVUWw4bOkYXGHh7Kg0
         yzqqP0HtDRmLVt4E9A7IDTttIiDAxGiD9L7/TUoebGXYNMnE1HXqjuscUZC+DS/CLy9D
         oRRy0xqayLSgX0t8sRSKoOaF+e65Neae0w3WXpBGbU0tdoxQ67F61sH9vnqqTieBtmhb
         u++TINuTMD5FUZvZ13MTgLeIFTH0xiNz2Nw5a3e5nxgkXeZJj8x0GTuuzXIyb+zBVj7B
         h2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492376; x=1781097176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6L+XCOUCzdHOAi6HIhPFjvoFV9l5V9yicUXKuwNTGww=;
        b=e/sPiGHyYqvbbR6zqumG1pFjv2T7WM5oTw47C0GkrQLpy6UYacNTOYP8trVvNYsrdK
         v0HkPAgUAY3zGcs8sBTH46oVji1u7+TdHGJHs6ZCo3XKrZiE7kn1r2bq8rUM2W5t/THZ
         gkW1K6vZH8XvCd4Xdf16SIEkNy6iBU2wPzFLjtY3Ex+aBrEsK5zctDgEsxIvl6I2tsPE
         vDPqHb9bycxVO0HrHUlFARtEVu52FrpQQf5IGS/t2rvwnxcpchB757qd0tPmWTQuXOav
         TjJXT+AFQdg0HWxZy+zG/QRm+aXaGr76Hah2v2dSG5hSPWT0HIZKhiyC5DUBj8dYqbqS
         BTig==
X-Forwarded-Encrypted: i=1; AFNElJ9e0xG1fLT+aams5Y42QJeSWJZYIULG8ZISSy+VaxNV+lHzFJIA4j92MAVuPBgiZ7dy3F2NzqXN6X59@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw52lW+DBoigSINYljUzM4iUqsbtfkKxw24Zc+z2nTciXQBaml
	PQ4j7mylpzRatR/7FibjFTjr7tOogQrl2KRSLxAle8Q1WoA1B1oEQaVS
X-Gm-Gg: Acq92OEFeCL5xKikX7cXLsD/db3xg9EawkIpKIiuD0L3R1D9o72N5k8pNNSDDFfZBUG
	C0lo35WogmOSYfmDhAakBR+oE7gypo83m7YzvnkashAvW+go2tCmwesLn47QGLoOQepo8H7ad5w
	qKCKfLz3qqGzJo9R1y0kKMV3wLbTwdVdRIrjZ4JEdybRKQbgIfrj5hqVyInl2FLDG2vj3GHfSom
	T/4YGyGPadHIvasY2OfWL3yGO9oYPxs/xFFhaAgz6Xj6zVGyn68l/7SvUw0p0d+5lbUxYVGGTjy
	t/OJNNF1IajCjDAFsYnPl1GAcALmTsOjSt5j3P3f7d/93Qj5iXwjrgRA2wTfDVQ6Ie2brjiypyJ
	cXzjfYZrvuR+OFGPvPVX/tyYzVjlpAdVSngYv+fBiNskTbRm6Luk8FhXhqD1aUxOc+Z+jHWlYTq
	YTXUB0hOzb+P1S5gTx61pnDeemv/1K+pJhhITV4hdwKc8XFESP2NY/0fm8j0djXaimRAxQHGbZF
	dPy89KpAIYZUsD9Qzig8ltnn+57xC0Gvvoh81B5PiRfhPE6
X-Received: by 2002:a05:6000:4b11:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-46021726505mr4743494f8f.20.1780492375917;
        Wed, 03 Jun 2026 06:12:55 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:55 -0700 (PDT)
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
Subject: [PATCH v2 02/12] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Wed,  3 Jun 2026 15:12:40 +0200
Message-ID: <7d8b29b9a29b1976cafc3d279482012efae1a994.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
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

