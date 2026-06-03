Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8FA46AF32
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488005; cv=none; b=csfGfxfmpwMKn/7KxLn9U7cFSMdbtwKGDWcJB/zCinDIrTfmI13I8pA4CFaBXeipZ4+KtIkrLynzFNkyi3XXPPoz4zqnqudfYdDFI5rckPwE4h8amjk+pH8RQ9Cs9thajiI0rifRpOTS5GQkIfcWljrKsi9dzLIH7qYOiOWPywc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488005; c=relaxed/simple;
	bh=KKXR58sn63bRTQCGBqv54xyTr+snqZL+yHVCEQsoGrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxZJtIlUd0S+P3+jtMsGyl3IIEDOrPOoZL5u2RRwBuyoyYDSEDHrBtjecThBsY+/hQSpWNqqUx/F5FAPTa/FDZ4oweri00ZdHD0X4m5dQ1+Ip7swxXU/itedg32xup+v+Fsplxvv1EYXMKInNDHvtcTf3iPtx9qCAzChP2QeRBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W63937nf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W63937nf"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5158090f8f.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488002; x=1781092802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOAXMQJRInvRkdYBQodwzb/O3fe/WllfMF2583czUuU=;
        b=W63937nfTza/En5o6UG58e0d5TyAVCoipxJrkzBTsptP21okSzR7UdNAEXGwmJI3nC
         iTr1uj8CqwlyBFwZKkNCB/S2zbXhUzGwT8nS730J5oezRXy0iJBN9lCjDPt4OPiB8xbT
         s62IMH51rsjG+JXjDCAwz1KA5+YdPnK9D/1oxuSxHjJFyx4/yzUvLujDXUwB9WrWPN7I
         B7UqPzWDpIp7uQ+eVb+vRoSsv0A1hD2rx1gcqWbRNteP2VCu79NBM0BClTx8MBYbAm+E
         XZoRPVmNH3z+jGqH3UjfmUPk3vIqq27WsTQ0G4GK85DZkAB1FoivSCRzLvTy70TjV18J
         zxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488002; x=1781092802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BOAXMQJRInvRkdYBQodwzb/O3fe/WllfMF2583czUuU=;
        b=pBK5rSfrBfnFvGxpre/P4Xcaa2mHcnhMmUp5RRLE9J7GN/XyTg00i4uattOdA9TY5y
         1j+7wkUsmw02NTzwojsnTM1GHyT2priDIdxEtifg/omv17vP5EEulhr55/5T+y9dByCg
         SJwG0DuCbYsQr3As79O0dWNVg4Hs9qdTGmli2iTMNL3URUNc7Fvi6UqUiPt46Xde/Y/J
         0KUeSVlWy5ceFf7vireCNgNPSmXGFOkZ/6uUOMlTmTMcig9FkhulMTmNGcwy6yBLn1Yl
         azAoS4ZlEkB88Z7bcL6TGJUdWAp2FqfZK6/EPrXnD+O3yunHpzVSjZMbw3E71mfgdJqD
         VB3g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZBVVKqmc9ZPIq84z5uOf/NpjcAK5FCosE290l9ixCuXxb0quVMUNrvCbR2F9TagQvTnyLpeL58QsS@vger.kernel.org
X-Gm-Message-State: AOJu0YxeLTRLslEN07VTvBw9MsOv73tl1Y3Czb4bFn3PkRW+sWYHgdb5
	H+lXTjecP6qUNe2KbjC2Vc1ZTMRfKclfj9Yi1WViRfFJzPZDgzDLMwOH
X-Gm-Gg: Acq92OGzyDPwKsTkX0ZR9B+Ri6dngmIM5Qc4yrO/FLkwIjLyb6XoRakhmdljt+IfZk5
	SEVHPARl+YDIGvTngAcJu/17wHRu5w9HNq2h1QJs4fbqCySQS5WRU7PknRneG/XFpFoS39TjT0A
	2JwY6QxQ5k3fNZLpzzEKgrSGR23MCfUySJz68vk/QPaSCq35vDcz7uOnZmhU18gLZ35MT9om3sj
	0G7V8sCMu8YVKeFq9VZLwqkZZ8V8RtZIJNz8Dz8y7TCJWJ886Gb1bq1F6fBpNukxn0GWk49cQ0P
	LaK8gnlUfy6tXF/c2urgvHOMpOyjTY0hn12pxacjDDEYNk92epfxi65lKiqYNcLc4F9Y4GcIaqK
	jRvw4ytn4T6CBxKF/O5WBnZYiQI2BJ5j7jINcH26EI7LI+aZucVSr5piT6xTmWc87huBbMCP3UF
	a2ZkXd/IF1rby4hzE8zVAiedaqnm8HooExcO4+LhVx0tdZWtYJCZe1rxPW+1eSdsvEizahUzz7E
	Sngkp86Y6eQY7ds0zsiJ4YVZRWHWV8Ej/OLsICofHVPlp2/
X-Received: by 2002:a05:6000:18ab:b0:45e:a0ab:8bcb with SMTP id ffacd0b85a97d-460217de189mr4934181f8f.15.1780488002109;
        Wed, 03 Jun 2026 05:00:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:01 -0700 (PDT)
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
Subject: [PATCH v1 02/12] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Wed,  3 Jun 2026 13:55:40 +0200
Message-ID: <36b7fad5b7cc932f502449cf4082e57f732e8bb2.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
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
 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..de1b8b842848 100644
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
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
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

