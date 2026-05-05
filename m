Received: from box.halemmerich.com (box.halemmerich.com [172.104.217.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D24433AD;
	Tue,  5 May 2026 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.104.217.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994219; cv=none; b=r5LgDFXX6HQ6TcFyIF3nHlqxzvTGgiSU+Gz/9gV9UC1c88z/quVjVBOv7P+w2A+mexMJ6oSNOWYUMshJSN9WxBTGLM+kJibwn1ZsfrDuuxON73f4rFjylMiibgskIA5xNuQhqOZjk9MZoG6/86kJvXIh6DREnbhIdOS0/QRueT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994219; c=relaxed/simple;
	bh=q0INGxZ2KZaBX9AUyiCz8IVpmcl83M7qPvZmM/17j4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X1WoHYV1MfFQrPqsvPCsHn/aqcr1s+B6CWxSywVV7wSOI3rHTF1xhzm+zK6tvkwMS3Ow7Sxzi3WHZOyyasHt2ECdoDWSsnisV1Pv4cBgwpjDY3IBOG+Xq9wtewPkVGreroO5fg1zUZp2rizaJk81zslZ9vf5cqZeruZnex4D5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=evaemmerich.com; spf=pass smtp.mailfrom=evaemmerich.com; dkim=pass (2048-bit key) header.d=evaemmerich.com header.i=@evaemmerich.com header.b=UvP70VJw; arc=none smtp.client-ip=172.104.217.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=evaemmerich.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evaemmerich.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=evaemmerich.com header.i=@evaemmerich.com header.b="UvP70VJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=evaemmerich.com;
	s=mail; t=1777993897;
	bh=q0INGxZ2KZaBX9AUyiCz8IVpmcl83M7qPvZmM/17j4o=;
	h=From:To:Cc:Subject:Date:From;
	b=UvP70VJwaOH+zb/AvwFo1nTSLPmzcUvwSG0AdFItgDZj5D8sPvdnCKRBW21EelKDl
	 G+QMQcaoQ3Q5ScEBtc9YHEwmoDy+Yspxt5W7qbBod6mhSeJ+pQT2+Gpgy6BcMW/Z+H
	 L4WqayHNc437xE+MBbnHLZUZjt8mvxyuGxpje2OBazHQc3LAOTzmRtdXa2oKHPWHs2
	 m+VnkWoy2j6NByBRy3BwdOcmjb7wwc27lBAbrDa5zRdAZEXOJn09ANmpwYozknMMsn
	 7iUk+f1mgh+J6f0JZvsOR45pYNt/p8FswA0trZTp8DpxSE2iwsvI5iJURWBo0e+WMc
	 wLhwZdgUVT6jw==
Received: from authenticated-user (box.halemmerich.com [172.104.217.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.halemmerich.com (Postfix) with ESMTPSA id BF3053E9DB;
	Tue,  5 May 2026 08:11:36 -0700 (PDT)
From: Eva Emmerich <eva@evaemmerich.com>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Eva Emmerich <eva@evaemmerich.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: add usbc to rk3588s-roc-pc
Date: Tue,  5 May 2026 17:10:15 +0200
Message-ID: <20260505151015.179413-2-eva@evaemmerich.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Eva Emmerich <eva@evaemmerich.com>
---
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index 7e179862da6e..84ba09528215 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -110,6 +110,7 @@ vcc12v_dcin: regulator-vcc12v-dcin {
 	};
 
 	vbus5v0_typec: regulator-vbus5v0-typec {
+		status = "okay";
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpio = <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
@@ -315,6 +316,72 @@ hym8563: rtc@51 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&hym8563_int>;
 	};
+
+	usbc0: fusb302@22 {
+		status = "okay";
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				usbc0_role_sw: endpoint@0 {
+					remote-endpoint = <&dwc3_0_role_switch>;
+				};
+			};
+		};
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			try-power-role = "sink";
+			op-sink-microwatt = <1000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			altmodes {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				altmode@0 {
+					reg = <0>;
+					svid = <0xff01>;
+					vdo = <0xffffffff>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_orien_sw: endpoint {
+						remote-endpoint = <&usbdp_phy0_orientation_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dp_altmode_mux: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_altmode_mux>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -401,6 +468,10 @@ typec5v_pwren: typec5v-pwren {
 		vcc5v0_host_en: vcc5v0-host-en {
 			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+
+		usbc0_int: usbc0-int {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
 	};
 };
 
@@ -770,6 +841,40 @@ &u2phy0 {
 	status = "okay";
 };
 
+&usbdp_phy0 {
+	status = "okay";
+	orientation-switch;
+	svid = <0xff01>;
+	sbu1-dc-gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		usbdp_phy0_orientation_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_orien_sw>;
+		};
+		usbdp_phy0_dp_altmode_mux: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&dp_altmode_mux>;
+		};
+	};
+};
+&usb_host0_xhci {
+	status = "okay";
+	dr_mode = "otg";
+	usb-role-switch;
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		dwc3_0_role_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_role_sw>;
+		};
+	};
+};
+
+
 &u2phy0_otg {
 	status = "okay";
 };
-- 
2.51.2

