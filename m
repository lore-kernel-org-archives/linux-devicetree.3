Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98784F55A9
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455306; cv=none; b=jQk79Ttp41tWEK+sdb9rtKVBh3S701vCD16E6B+gzbluHO9xbHMzlXw2SMLO02mS6a+qvuY1GzasP2UkjrVK3942fSkMK+PmkeKxD2gUX98E/S1HhLKFE9AVF0zZjO+MLWER971GR4MiIsuoIHpx9SQxW/QDxGRSl+Ux7L2BRLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455306; c=relaxed/simple;
	bh=sdQHH69f077aoixYw2GEaFiPjMO2xKr62tsBGVZ1LIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaMxULU4qz6d14a+WZ5jqL4sZklcnoSfzHPum8mGMXGaoe0kZ3GFvVSzAnT8FHegjLMBj2G/HHgldp1MjHFTkgonx3OM+oWnHqAOD05VHyPCo7qrhIAUyj/f5IQbaTjomGvcN4mW3onnZg0KvQTyhjwNNfojuTDxWtV9loucDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pN6u+dIF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pN6u+dIF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4957eefd361so943955e9.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 10:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455302; x=1789060102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PNOmjiL8zGC/XcXuOVjFCBPvUZNDZ0am9nzcG73XPo=;
        b=pN6u+dIFCLXsn5cWvp8mBCcSrwUWat76Ft2UE9LJZ/D2pk2ZiFTdKaIbmxG64KhJ4G
         xKr1tR1fbbD1LIyMLS2K8OeqJqbtVQ5QV5X0mN6PPulKCrc8aRkJd/PtJARwhv5fyYiv
         kQ2YwmZLyQ+B1XeKA/wnIwplPaIhNEOAn1Ok4v2nUSXDH+0o6c5+PvQ8qEb4g3+klpTk
         a9+4Fp+UmOf9EVj6TrtnMaqagrQB5eimp4y1UuhFpEOrjIQoA9UiLR2drmCd8gGBna40
         XJoK2s5XfU+2DcjVnH7zjK7h5njdVBBUbe0y6rtlvRr3GfoDHrEiveOfe3EE/TH1x9X+
         fuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455302; x=1789060102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PNOmjiL8zGC/XcXuOVjFCBPvUZNDZ0am9nzcG73XPo=;
        b=pesSj4BNayt9lcMYQK24r+LeOtIMcSYKVkPEIH1CajYYH9qjAB5teWs+o/CcIZnACT
         UFKzMLcyGNBNjPEKpGWZCQ5J06JeUN90ES6/cmORPeWKncEu9Ipf3tRQnayePFs8yVOr
         3yYjX5Y2qK1SkOkU7w/YGtAyq7AnBbbxUgxEV2gZXHDxbSnba18L+VVwgBLb1dfSnyas
         59T4EmnyZLH59CKnw9pKy8zuKQZXM/q+uEMLRICka0Tgdo5Ibvyzi6HlxbFmKxzWgCv5
         ARKUJBHigvHfoWkb0gnvOs/hQ4edXuUtvY+JoeJaqcb87SEJph31XBX+FRcZdTjCE5ft
         hh7g==
X-Gm-Message-State: AFuF++nLWxKYTyaNFhTX7Oh3F1pLyVL0bUE+pc8ZP0nyzS5CZXeHIY0/
	TSMM5wDQ+vbltpdMWJi/3MogVHXWomlGX1oX2YEci49lferGJNETHVP0
X-Gm-Gg: AYBFou0D6hr8mH4DHkrwoy+e39GeQpAAjJrRm6Sa/J94C1cn6FQgYRCTGkKxUN1FJIi
	HV/VwZm63UgtfwkUg6riuU0SOQaC6T99pdArz5VSPhv1BjEMPaP2uUxFGNvYueJCDooQiUYRl8a
	JZXpf2AJH/T560XsHg9xxfRdXHp248AzUaesvJ3o1PT2tK24F4TFPlEvulgHlxpi1qPWiObDiuR
	t8nh9ktBxgMjF4HL+Dyr4Rm3uKvbgMQP/M18JesRTQO6WHDY+Z/MAxsg0ZkSYHHia5uhvkDo0cy
	9fXploPTKG9RQbBWu+Vdz6HxLPnfQaVMVccRtza8r6LjiWuNYyJ6+5JmGeBsrCAjNu6BFCh1sd7
	cRBWvirEz+eeUDzzvNgj9GiP6+NftBrNDArzpHgzQzFRNFUinilyx8SYdiG56E3M8drHviFGtWo
	8KGGOAeJNt8NQBQe1N1afCKz/sUf3/qt5KnC7jc2YdJCv+7u8ISvHbrErQRn2T2Ks/RouDmd44g
	UM8DYq9uf4FHj+2kPtlUi/AsFqpyFkXNWtn/igtardAj3arPk+qCm1ECVpOgTAy7Kf5fhjSJcQe
	Gw3Utggyym5IZyBl7CKikwbQZmkt7T8SRXaBeg==
X-Received: by 2002:a05:600c:c168:b0:49c:cb6a:1687 with SMTP id 5b1f17b1804b1-49cf5bc7608mr35422415e9.4.1788455301357;
        Thu, 03 Sep 2026 10:08:21 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:20 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 03 Sep 2026 19:08:02 +0200
Subject: [PATCH 2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port 2
 in SGMII mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com>
References: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
In-Reply-To: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The Aquila ETH_2 uses the ENETC port 2 as a SGMII Ethernet interface
on the Development and Clover carrier board.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi       |  7 +++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index fd93043314466..365bce73eddd3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -67,6 +67,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -227,6 +236,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
index 3df17700b632f..2ff7bb8d6ac43 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
@@ -99,11 +99,29 @@ &dsi2dp_out {
 	remote-endpoint = <&dp_1_connector_in>;
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila ETH_1 */
 &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index 69dc962a24a1d..f930965cb341f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -16,6 +16,7 @@ aliases {
 		can3 = &flexcan4;
 		eeprom0 = &som_eeprom;
 		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port2;
 		i2c0 = &lpi2c3;
 		i2c1 = &lpi2c2;
 		i2c2 = &i3c2;
@@ -209,6 +210,12 @@ &enetc_port0 {
 	phy-mode = "rgmii-id";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

