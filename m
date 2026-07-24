Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688F3B47DE
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910286; cv=none; b=JJ8FWh7qN4rmXSFSPq8CyUumKahDwmh7wo8Ogv/1jZcrM4wxjS3MWxSOqbCRwyRUXXRbIixEfne22SFWT7FJFDhr0irrjf2VbMnZSqb870UwTliowBhcPERQdb4LnNDqkwBc6CSe8kST4YkUP+uPspXtWFUyM6V+j+XKjti6SuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910286; c=relaxed/simple;
	bh=6ir+lnAO3bNg1lXKqI2vz7x7sgZJDcYXYNMnbh+AQFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvDWU1cbj0ofSZxTfYJ7zfaphcgV/u4yQ7PJ9zvVQ6Zls/X/4c87l/vE1hOcnvqIWIi7WGY7SEOj6iPUCe+gTWjHJc7u2u0V2XglQw0J1QNgT5Zimk9llG+klI891v9SdOxXyHiBH4C83Brr2uVH0KyNzXzWY/J68fujEqgrFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0VCXY7l; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0VCXY7l"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954afac04bso7170135e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910282; x=1785515082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4GlmrO2wvSEO/h8L9kCT2VN9gDvXyxGV+hLNuzvXEk=;
        b=A0VCXY7l80GFJZE1bKeAzyH2zDZKDAOE8pyKB+/8XhSWooILotFWAUJWCvHkPWx/dR
         yMJjTizfJ3sG6zGlhZ7IN2Dv7A6t1HRA8IBWkhQCar4HkY5vkupqeYOppDSgZ6Pv9xrw
         GJJgsNvaRnq7+8jA3qLtmmQC8SoCyBKD2jIusEEN6wltz+sdV3tY6Uv+A4P2nbcCGWgs
         5gOWCru4DtPGbTD095QWHxzyDZj9jCv/qDz+0IKUaDtoHw9Uii0emdftlzqdeC2W6/up
         tb6256nsMDAH7v6SFAfT+fRv8fsiRKOEGX6DjhBLYr5vK3jxSr5iN6N5OMlifj9sBbNd
         u/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910282; x=1785515082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4GlmrO2wvSEO/h8L9kCT2VN9gDvXyxGV+hLNuzvXEk=;
        b=Ue6UE3AtqAEEiUf+3dB3tWixYKpv2O6l0uC17fCuGbgfYTL3JE+P393AvEBB4j5uKc
         4jIyltigxMkpaCpbPldBb96Mk0r4cxu4rtTErQeBsHb8ud/G14mxl06Q7UCbecXk64GK
         RLboSDGYshbAUvBQ2Dai34sTDT7je/pOdT/WnyhKbRLfRjCYh7ntmJw9oN5d34t1ZCcr
         bHbujQBQq1wajKR4kwW5qvLea1gW9g+RV4kYEfYEFdQwwQOsfCRas4W3ibvUnoYUZ8j/
         PcIg6FImkepn+wj31HIR6vx8jDBJITtEA7gTS4/F+8IH5xWxQgcl5Aw0bElgq8NI0e6d
         kqbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrvkzF1wBl1ooDFJDAslM+Vi6h9zMbRFjqHax1k8OXL/JF5vCVuUVrrkzUfaUybTgQisrF/LN8eJ8O@vger.kernel.org
X-Gm-Message-State: AOJu0YxaVSjyFSaARPqRM5i6OKm9L9jx5mM6+aJLpBVS9CTb8mJOZmRr
	E1XC0s3al3fbR72krXWMOllpPsy1/+XWbdOA1UrJHBGKM+OnXNS/BYOf
X-Gm-Gg: AR+sD12AKVrFtUHpTJG3/dJfYW4LIVPu9q3uyFtm/M4sJpm4ze2rM9NcJpJQjKZV/y+
	nVyG1ayIS619JJkPAfNqXphUrgfikp8uNoNOa3rx8hMj2ZBoa5cgAJUdnmGr5ybytB6bFeIcKS6
	6FtfVEyOZHtq8uH/qL3iwcoAzrdU85XgQgZK9JO0MguTLexILOwdzQRJqWhx++dq7fzf/N1iEk2
	+F4qk9rDwISTSqXCcdpjEEcWf7Zg1+5bRsFQH9xU6U38s5Bl26/R31mSqQL6v3+f7iv3m9U10J4
	/DJRjyCuSf23i8WVxZimwXRn4eg3GX79kRy8w582TFwzoFm155y7+aYEE1Z4nU/T99N+F37IpDk
	7/dbaRfmMOC5khHqK+g/z8hf8WbyF5xbhPPNm9GToZunRL7ph/1ssyibIGo/5RjaCnVkECgD7h1
	BRVN3acATFv9c06ipSg4mq6azAk/nGxwrL6vrorj2FFZ9wyH5asvyn8G2+JG/3UuxwJRZypc/NN
	zF8h4rx8vdWkOj5
X-Received: by 2002:a05:6000:4305:b0:47f:93e1:e7d0 with SMTP id ffacd0b85a97d-47f93e1ee92mr7483001f8f.36.1784910281885;
        Fri, 24 Jul 2026 09:24:41 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:41 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:28 +0200
Subject: [PATCH v2 2/7] arm64: dts: freescale: imx8mm-verdin: Add DSI to
 HDMI adapter overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-2-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Verdin DSI_1 interface and provides a
full-size HDMI Type-A output. The adapter is based on the Lontium
LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the Verdin iMX8M Mini carrier board
device trees to provide ready-to-use DTBs for the Dahlia, Yavia and
Development Board carriers, in both WiFi and non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 13 ++++
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   | 88 ++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index dcc0464b4e80..f55c570cb3e3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -178,21 +178,34 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
+imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..507d0bbb5935
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+	reg_dsi_hdmi: regulator-dsi-hdmi {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&hdmi_connector {
+	status = "okay";
+
+	port {
+		hdmi_connector_in: endpoint {
+			remote-endpoint = <&dsi_hdmi_bridge_out>;
+		};
+	};
+};
+
+&hdmi_lontium_lt8912 {
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
+&lcdif {
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
+&pwm1 {
+	status = "disabled";
+};

-- 
2.43.0

