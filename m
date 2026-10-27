Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107266;
	b=SPeuSgqJR//zrEQTUK0Aa3QgNkWXyiIw1LgMXNSnObWUfPQSlprkThqK/jhTOGL2obGu
	 WdS8dL1NR+JsWh8tJKb9SD4zuE2w/qGUm0e/9sFzhlJHRZYwna3zs99LERz4+QglVVyV+
	 QJNGc37oCAdfa+I4+a6d2F2vNiWU+LmAuM26rAo3LgNjJzSNUlUSbJ26uyuRLgyJ9H9vh
	 J3DlcLJ91YGVQ1vKKoBIg4isVZ9jjf08AQjws6fb9rfxeVETwrYe0y43G0+xr8+0tkGIn
	 5yQNfsPbCT+J0ygd2p2tlhlFPmYJy4HqrxlbO9uEnbIrXIE1552XxLIlU3H5PwL3t/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PI+wWLA/0HjZUtFhvg6XuCK4doWx6E1ESuzMR7f3jIc=;
	b=OxQQeZfuvQVfKk3CcJ/gVbZ54WEET7XpnV8mJl0BmO9TQtmEEKP0s0CPBtuLnhHFLlND
	 C1ULBux4xv10O9psJlHIOdXGF+mPMzhmFp1LbTpPKgQlgp7axWwcerq2/dV76nkwbONnE
	 vX9Y7IyP3nI67hw7jjdaAIHBs5kCHvtSVw9SRf9y7bLegg7LH8TKrh/10SOD7BNNRVv2I
	 K712APHK8kFTjNytjnAeTMRscXCW39G3P00/cb25+IkGoeTPAwM7arJeS3Oj4Vs3QZdvf
	 TZOzxR43wEqL5qt66egIA7N7ZOji8aIko0prIw3ztE4c1expkBtp8CPmuSmKSuHYDcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BaocJlYI;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F70606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F70606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BaocJlYI
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso658215f8f.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107265; x=1793712065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PI+wWLA/0HjZUtFhvg6XuCK4doWx6E1ESuzMR7f3jIc=;
        b=BaocJlYIeF9ZRARkR6ynrd1QOKCYuOoWf8Gmuj5lAirRTwZ/eNoavKffyeFkQOXEbn
         hnbWy06wYprxhR5eRWJj+3J4WLMrasebSSKDvta/v6OUc5EtOQh+MdAVhoKDFn0/huCI
         psmahx1QMZNaUENbHNdu2rXzI9ScnC/siCSyMgv4rWMPnhD9NQKyyOya202b8rXzT2rI
         rSASWoT6IInbMppZikFWQ1h1V1MeDR9f9K/mV33dwP/K0YdPLY5AW1uPb5Ccn6NOzjsd
         rDfWfK8fgsyvggXjBrlCh+MtP6teDoFBRqrCgcV+M2/10Z8cRpnGXUU9mZfV2FWZiSDE
         puuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107265; x=1793712065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PI+wWLA/0HjZUtFhvg6XuCK4doWx6E1ESuzMR7f3jIc=;
        b=ePuT4VMvbCkL9bpRD1/LmE1p4F3V2clTVkXOUdc9FVjA/IS6Amlabu7uMC9/wWPecf
         bhkw7AejaTOYmxHufGancyWdEUfjbRIIKdGYDGeXEwKXTOFi9qUM6fe0JBTxnDhoKpGz
         UDgCyPZD2khu/VZZjkrFedM0lXoV0+0NMixyV9qhkYZISq7iVIX7JHmFfw3hEeImugjh
         pK7s0GQJk6ashUdaNlhD4AW00SQJcDtsPN/Qx4tfQp38KytUZrUzt4IYSXRt4Jg1Llch
         +/QpEKyHqTiTuSqxy11sMu7S/LHTxf5QvE9H9g2Zv3I277JaCi6ywInEcfCl0Xm5sFbP
         EZaw==
X-Forwarded-Encrypted: i=1; AKwUvBxJuLOFcoKOg/9bZ4GDmbjmUn6V9ner7gmNoQMm7tYjGfZeKgvZiGAduMEH5qmpP4KQmr1s9dUZi7wb@vger.kernel.org
X-Gm-Message-State: AFq9FYJCSU9bEBCoiZu7fLBO1sJAIoSeI4+Odgvko/W3WQjZ9l4FFvuY
	qoU6irVuSxWULwP5f7q7pPM/NPQyta8LEbZoR+TkSxFv73dYqulelZKX
X-Gm-Gg: AYBFou1NpgHm5CqK/nw4H9iH7HmagvVcpfTWZF6zT+ujbP61op7Cfc4luchawoNtahn
	mo2pxcinCqGO6Iwccx8CUHSnayKP6PHnPFcErc+as1D5rlV4g+FokJScqUW9rbjNVhkT9MzkabW
	xbmLhsnwP8x1hhPvYCUYUtGgyj0uKsppon67XYmfsmgr8cL+x0N7IKySj9i2M8QItCfjG6FIU1I
	Pf46tZaT2fLKduCzxsfoy6VaDa2pP6sE6Nmk3lPvpuKEftmhP+0eWTdnRaEvU0G0BW/AlzfyoTZ
	21gNvx7HqUCRh/92+JyfYI9oXAemoS/d5MRJjymrZfrlffIutuS1EDv9oAOvgS/7BGCYiu8Su5Q
	tihJE5KS65Je+ny1G/MVK+mvSykiLGkgrHpUHuQmdig32WKjGOUNdArjINAz+tKGP5BfSpwgYeU
	iVRe4q4h774Hop/2WIccBINs+OYkIwEhCsqXL3cAssQao7HOiK8bbHBMdNMlnqGwZwIDoajDszr
	Pe/7chyX8Sh1HDL6nSv/pE4eBclqxXdmhtCNfcMhfzLgru2A+lXiqomtCWd01RekX+eWPFDY5t3
	YXI8f/d4LF7+uDflCOZaCaqWpK+mKA==
X-Received: by 2002:a05:600c:3c98:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a7c1c845a2mr58333335e9.16.1793107264222;
        Tue, 27 Oct 2026 06:21:04 -0700 (PDT)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08dcbfsm177568315e9.2.2026.10.27.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:21:02 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: imx95-navq: add USB1/USB2 nodes
Date: Tue, 27 Oct 2026 15:16:30 +0200
Message-ID: <20261027131630.575-1-laurentiumihalcea111@gmail.com>
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
v1 -> v2:

* change USB2 DR mode to OTG to match TypeC connector configuration. The
controller should actually support the software-based host <-> device
switch.

---
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 121 +++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
index 7860c113e9e0..b668c752905b 100644
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
+	dr_mode = "otg";
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

