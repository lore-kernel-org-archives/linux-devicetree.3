Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039456;
	b=eTZhoeehBaa+NsFlyEaWU4ajBMQ/jb8iiAdSdiV2mgKlVtEhtgFJnOXM95u2MVaOPIxt
	 xrsq7wnMRIZ63O9utBVRDUHl9Mj/OnZ0jG+vI6JlZDJ/OPWDrk2N+W01DTRgExvh/nByc
	 p3xRZfa3k2NtcORA2AuvIEpmaKTrnNCOCDCSlvwBu4vR+Mvd5X8hxAakdPiz8G7n+AaHc
	 qhYXD5+Lb5C6uP496cmVNSH4qo/INI0TExR3VQ2n/FcOTi1sJWS4jA0id1NXK7JnPMZwZ
	 FnzW7ynZPnd56iu41Kca3wNbWXx67FuyhrDDKAmfi1O5TBbN+VHVQGcOw/cvj60TXBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
	b=IjH00bDGNPAPtBoy4VwJhINaQF23y07joTEbuAXxLu4UsosJpffxfaG/oSdHZPaUlb7G
	 2hWOpiKTT2MNeOvv4+AeXgk9mxhVSF90PanuJB4HSJyb7ABeIxQ2INiphDX6rlxegq4tK
	 vCjEaUD3dCyQPhq2XoWWzYjkjgIw3UFK3NZ9xQNFtpN2rSObdUZouScOVLtF2bRtaAx0u
	 gZFOsg89uYm6xdUvJX65PyE109abwbchAC3NzfRcQNHHy4xzVsyv8kDhl67qPitqdQ4g6
	 /F83nMeiXBlhfkeeNXEh6AroE1bZtmMMx6i40qToqxlbm3rJrwdUao4S18SsFOYm7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hTCoOzv6;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D15C606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D15C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hTCoOzv6
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso22312035e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039454; x=1793644254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
        b=hTCoOzv6rALa3SI75UoIcQNJiDrzj4LU5g1ioOom36WJpb3rXXX30L/+d9k5YUVEvS
         f6UzIIeJoOFxbUKGn7CHBi0QAnYGCu85JJdzxSSGWVhAhrKaGoODydeHG+VE6H31y0ED
         AX9/RPNCGDGW8woOzVjVFtfu85NyNfirf19YNhwciQnIAa7lxnkEbxVrd7JXUkaH1PsW
         L4xS+4lhH1eHu5GUeFSGlR+VxwlxP3xH5y+xu50GMS0sQPUyqMucvN9z7m8vjVaylT0t
         dTQgwioRIveCUytbOt371zDYV0d326BC3e8nMSqgWJ7VgwHpUZ3NyStTYJlwt27+owjh
         V31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039454; x=1793644254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
        b=TxHU5njuG0ViTapY9Lba/SHfwj2HGtpHqYqhsVwgH2kYhsFyNjfwwAhSAnbOrl+Pj7
         denEE4tj0bQrHDUkY4o0SBqq5zVNZW892Hwh9iSWF5ce0ITUBNg7x7KMER3BZomlbQyK
         q92Ykn9VgtHBZPTcgh+5qZvNQ29vTu4amWf1r1Mc0BeDGwt5Ojqwl+akdiaOyScpkbbj
         U996ckb9Kto8/+VM/vfTv+12N/FxlAqsxLlF65FM235MUjjZI/6FTOqGSrLCg5LrB69a
         3pIsEDCs7a4uPQiZ7JL9/l/UkQmzleFmoVwC2eEpR0hYvE9g7M6CoW4efFdIsyAqLhYu
         6EHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyMROEenH8CUmB7bwphCRnTc9+RmGjccfAXRbguHloKg4CcC4vobP78UOYDBK5hKNnKV78ynvdYKkd@vger.kernel.org
X-Gm-Message-State: AFq9FYKlM/QcsQ+nVWjPJaD6a5bvPerLrs9OlD+OC7xLilWxdmd/ebQV
	pixWEcpgDfdRatbKbxXIs5IKVcqdXddxdYCX0Rr0ONNH5e9S3jzHXOOD
X-Gm-Gg: AYBFou2c4GOvUbDyZFsh1Ym7gEijVPH1EOiPYpiM4GigyRPGz3cvpHxZ0ehji/hOAMF
	J317vEeWe96Gw5Yx6jROwCgKYL/ock2AluYxEXoXNQQVXLL2GbgD1Xdv8r6bHUB5FJYWFJ40Ou5
	ZD6HhY2vruq6N61yJZfji/y+SBmJU1q0Gcz8jH3GIoIykZqd7hnc+6SltgN5lFWd4dXyD6KtL0Q
	ttPsjqESlHGhlC3g5bjuyhRIkYfudvnNABaSn9D4OumVVtBb2+2h4Lrxh3ZuC16FLh6lKAm7zOs
	kjsnATwJJerg0UzZecsNMHl9m1ycws1/SMKNpS3DtQtSXtyOSSzG5N8b29jScPgfoKGH2OjAgfx
	eN0lICkLrvIWyB3xBVMEbc/IOqDTmWkn2m/rGApu8Gxi6H/Mir7l5MrmH3KBEvK5DWp7PUENJ9g
	7rQ8AIFziWUsyXTsMZjwudsmd1aYH9VkDajcfmiPNfnLofwDELdoV0XMiwxt+ZkBsddwSIBpKRJ
	eZ8L709OatW4uyJgwckukrUNl8Xk6gP0w8g1oDvvEQaEqQ5FA2YYIgOCqOezJMadEQvAiprkUwa
	S4iW4A==
X-Received: by 2002:a05:600c:3486:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4a35ac95955mr122964795e9.15.1793039453713;
        Mon, 26 Oct 2026 11:30:53 -0700 (PDT)
Received: from SMW032656.wbi.nxp.com ([128.77.15.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm250727985e9.1.2026.10.26.11.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:30:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx95-navq: add USB1/USB2 nodes
Date: Mon, 26 Oct 2026 20:21:50 +0200
Message-ID: <20261026182150.11330-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add and enable the DT nodes for USB1 and USB2.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 121 +++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
index 7860c113e9e0..5fe245b62306 100644
--- a/arch/arm64/boot/dts/freescale/imx95-navq.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
+
 #include "imx95.dtsi"
 
 / {
@@ -80,6 +82,72 @@ i2c3_gpio_expander_21: gpio-expander@21 {
 		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
 		pinctrl-names = "default";
 	};
+
+	ptn5110_usb3: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio4>;
+		/* USB_PTN5110_ALERT_B - shared IRQ line with tcpc@51 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP32) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB1 3.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec1_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec1_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
+
+	ptn5110_usb2: tcpc@51 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x51>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP30) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB2 2.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			port {
+				typec2_con_hs: endpoint {
+					remote-endpoint = <&usb2_data_hs>;
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -145,6 +213,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <IMX95_PAD_ENET2_RD1__GPIO4_IO_BIT25				0x31e>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		bootph-pre-ram;
 		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e>,
@@ -198,6 +270,55 @@ pinctrl_usdhc2: usdhc2grp {
 	};
 };
 
+&usb2 {
+	disable-over-current;
+	dr_mode = "host";
+	usb-role-switch;
+
+	status = "okay";
+
+	port {
+		usb2_data_hs: endpoint {
+			remote-endpoint = <&typec2_con_hs>;
+		};
+	};
+};
+
+&usb3_dwc3 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec1_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	orientation-switch;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
+
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec1_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	bootph-pre-ram;
 	bus-width = <8>;
-- 
2.53.0

