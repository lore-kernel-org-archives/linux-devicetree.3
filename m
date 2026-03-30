Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE99E3E9F89;
	Mon, 30 Mar 2026 22:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910272; cv=none; b=LN1PyvLww4/17zmwVMsbffpqGIHFVs0I5tQFV/3eakrz+tUXiTrXDzr3K457ZSbpknMMUEYS0SRd5xSO9cTW+81Wqb8VJGQN30kFXwW/AB4O/6+5cLTBj7OOkSX0totH7x8X9s/hVgNLqs0I/t0MCvrfjMsPB1SxXfvlj48HHBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910272; c=relaxed/simple;
	bh=BY/vXYKWXsOYhNXxlYmDYaYO9MVDb3KmDbOj7JUs3mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AlD5szD2fCRy8A9aPzko+RlW6oV0zTq2MHkQmboHzb8oGb1eSPljErcHTfNPekDp2YS8vO+SEayhsUKygFgDVMXPjkrfHj7t2V0Nt0d9QLSKS7L9oUqvIm0gk6+JQkYFaQJPnD0LqliAyLFUJGYxqowoWP6YxrNI22zU7lhG4aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 95CB71F8004D;
	Mon, 30 Mar 2026 22:37:40 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 07B18B2EB88; Mon, 30 Mar 2026 22:37:39 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id B2320B2EB88;
	Mon, 30 Mar 2026 22:37:13 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] arm64: dts: imx8mp-phyboard-pollux: Add HDMI support
Date: Tue, 31 Mar 2026 00:37:12 +0200
Message-ID: <20260330223712.2615273-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PHYTEC phyBOARD Pollux comes with a HDMI port on the base board.
Add the required device-tree nodes to enable support for it.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../freescale/imx8mp-phyboard-pollux-rdk.dts  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 0fe52c73fc8f..0d52f29813f1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -38,6 +38,18 @@ fan0: fan {
 		#cooling-cells = <2>;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	panel_lvds1: panel-lvds1 {
 		/* compatible panel in overlay */
 		backlight = <&backlight_lvds1>;
@@ -201,6 +213,28 @@ &flexcan2 {
 	status = "okay";
 };
 
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
@@ -244,6 +278,10 @@ &i2c3 {
 	scl-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &ldb_lvds_ch1 {
 	remote-endpoint = <&panel1_in>;
 };
@@ -444,6 +482,15 @@ MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x154
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c3
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x19
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x19
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2
-- 
2.53.0

