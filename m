Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841E047D460
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781302; cv=none; b=WcLA6Ej2cD7zf9owbkcZxe+I3CjbbItcUR3jCBhou08ClWwuwJrHsm+MQag/TmQLGvW6bVqv/resb/oH8ED7QMi+OjUPOQ88Km77BphqA+GoMi2KIyn3HPDvO9TlLU3y0x8Pm9YhqrTDhMRXyCC322aQG23lF8T9eGUFL5xz6S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781302; c=relaxed/simple;
	bh=DdYdnfYjL95zd3sgkQfUooOUtR5+8RhDSdYsvzR++NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmyvZ+F7lYmukxaAmeZcn0jOlD9wiIHiVJdruazRXwfSfgRemuazssmoXPefsP8bXga6ywKuKt0XPly7o9at+7DxLXFeFsEOGfv3KANYK+ShIEJWTntHp1ndqQxuvFAmqAAA/eYaJjpAlRNyYDeNsTFfSNVwoJEIFWSiTIPtQJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1wGesu5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1wGesu5"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2171331f8f.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781299; x=1789386099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eV9sk5hU0/u8qwTJY/3H34b1rkL69Lya+pyG85fXSY0=;
        b=J1wGesu5qpt1SZn1KLuxOfZ0GMiG966PTxKUMbhEleEUGXVjZu/hcDO05e5meGsYJf
         VYQiKULIazEt/xGqe5F1lrbVAMf4u8EVGP8QC9645aCZgWZhuqmV3/KKp1dond3ilah5
         IljgOzzWcNfa5VJaggcltgV4QLhmhKCcD2jYN8X4y51Ayho6RHmd3qMVVenjMRVmqUyh
         MIlnVFPklV5lornp396gdVYrk+rCBMIyfv42+UcgAZIwHX9rfQHuazEVyTI1BjAVnwRh
         Liwr/H7z/Ru2FzD9nZW8IPhn8yMuP3oyJ0Rt3bzY/7PM2Yx6tZX5bdlQInBzlMmqvN8f
         bi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781299; x=1789386099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eV9sk5hU0/u8qwTJY/3H34b1rkL69Lya+pyG85fXSY0=;
        b=GBmtCtgeg23oFuno9EDM6NfgUHqz/JWm8Q/Dug3XCWdeahNcCYfksVt2TzF5iQf5GA
         +ZsFMx1u5bldP9e7uHXEFAB3U2VUuagA4Ox2tgovfnSH7jKoqWceB4USvyxtyttRbfAQ
         tgcXW8DTD/40pcaVK8Yg/qI3h0EwTL646EbDGMKv5NWm6ZlSyK5CadIEKf/uTHfCG2ZX
         X+aIK4bIBsqW1KlrQt/lSztdM77x9ybBrU3+9PQWXHexm/bf34Iyv1h/xnAPO3W2H/JD
         srYlVkFfOfungnDkMGikMPrXagmv4d8OAdRqP2dPtrwhY9uRdcBY7iTxqbkE/EAx7c24
         49aw==
X-Forwarded-Encrypted: i=1; AKwUvBzKvayRhsTMdU6BqOSoVn6EsKR0OglvZ97tOEFkbia2VOXlOTYCeFOM40xMI62J5Pc2EchNGUgZDv7v@vger.kernel.org
X-Gm-Message-State: AFuF++n0gP0yRjBXPsJ0+QiPsdsEt7a1ohyCqliHI1bdXFmvqtc2URkN
	j2BPB9XdMUzCiHHwDMK/0ZeG1KVa5Uml95FsZm73nzRXRWD98n1IY8lR
X-Gm-Gg: AYBFou16Wj1k0iFbY5hmZFB3qv1N1DTgvfZmxxhWxNq9MOXZJpwYHSk+GRZ0RHFFmp/
	+hEYI2rD+d284QynJDHagVWt4CD8U25WJS9lmS+GnUhaa+ICvfi5KbZZOeW+akMqdUGwsrhb8SY
	+4lqopdgx+aqIo58inv6PWkrFH7p/oEh1M8AR1Aqv11I78nd6h7SSkBoSOAtwPsYBnH7Cxpui1P
	rmkDltRSx7hOkMv0SRuebweC3ML2qZNdT84zx+ajLqxUM9lDGDvZTLeRY119A+6BVzFqEhXyT1P
	nMLyRCb1+ixvrvCvUAFF1OpbwRf035LMwLui7dA7EybFwp8jUt587SfWIntfIztoopEzHyQJg5E
	dYeA2Pn4CjBQv2IEiOYi58aCap85XqvhzMyxseIpPGGbbKmeLTZcMhJa8RHlHwptmtyXX654hWQ
	U+Ir+/whpXPPpwc1KXK2KRTRG8PSITet7Cp7iKXvfeLidp5ANJF3gmLYyEqsZHICv0XcV++Qntm
	Pbb/0qVxGvvayUOX/nI+7wGuNdUDvTHj4lnso45r3cn0QdbJLx6rUHMf5PIUgo=
X-Received: by 2002:a05:6000:240b:b0:485:8a47:5b8b with SMTP id ffacd0b85a97d-4858a475d06mr19956526f8f.40.1788781298671;
        Mon, 07 Sep 2026 04:41:38 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:31 +0200
Subject: [PATCH 2/4] arm64: dts: freescale: imx8mp-verdin: Add DSI to HDMI
 adapter overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-2-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Verdin DSI_1 interface and provides a
full-size HDMI Type-A output. The adapter is based on the Lontium
LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the Verdin iMX8M Plus carrier board
device trees to provide ready-to-use DTBs for the Dahlia, Yavia and
Development Board carriers, in both WiFi and non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  13 +++
 .../dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso   | 102 +++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8c6fdeaf12af..715235b62912 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -729,21 +729,34 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+imx8mp-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..e572fd13b987
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter on Verdin DSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm_3_dsi_hpd_gpio>;
+		ddc-i2c-bus = <&i2c2>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - HPD */
+		hpd-gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_hdmi: regulator-dsi-hdmi {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&hdmi_lontium_lt8912 {
+	pinctrl-0 = <&pinctrl_gpio_10_dsi>;
+	vcchdmipll-supply = <&reg_dsi_hdmi>;
+	vcchdmitx-supply = <&reg_dsi_hdmi>;
+	vcclvdspll-supply = <&reg_dsi_hdmi>;
+	vcclvdstx-supply = <&reg_dsi_hdmi>;
+	vccmipirx-supply = <&reg_dsi_hdmi>;
+	vccsysclk-supply = <&reg_dsi_hdmi>;
+	vdd-supply = <&reg_dsi_hdmi>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_hdmi_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			dsi_hdmi_bridge_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	clock-frequency = <10000>;
+
+	status = "okay";
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_hdmi_bridge_in>;
+};
+
+/* Verdin PWM_3_DSI (SODIMM 19) repurposed as HDMI HPD GPIO */
+&pwm3 {
+	status = "disabled";
+};

-- 
2.43.0

