Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDFC315785
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955216; cv=none; b=Cezya7Nd90dQy3oaQYkTIKThMZcbFqEH2SOj7NVaHt94epaB6Vob/0Gxcmw8g5iewS1cFs4z8GYas32xxqxbYMBLGNdu388kGUqpElRaGqQAyCNboPMOeRNxKjpCvTJsTgoJXgL8WwlVtp4GWPk3BhhCTWHFkUl+zLJGrDtnC7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955216; c=relaxed/simple;
	bh=Hfic5o/kW6nCUCyJYHH21L1x2+7C5mcS1nYt1D3nZ34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KiYe1iin5m1pLbs63hwUQzoJs567bWatiWnDEu1zlLwgs6va+SSJL59tFd8eDH5W82W7nfkykaGkxKBtlXGh7v0lgwZcVgbGvDt9QFxJ2dUNBLUgHI40GvahUpQtBrffo6kzTjI0JPEUUnlXQ9qI6tbvr/447/UzdHo5fp7Qw4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0HQZeei; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0HQZeei"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47362928f65so3179306f8f.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955213; x=1784560013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTMbh21QXQw/7/D6TKZ7n81vmxGgnjPukreQ8dydJKI=;
        b=C0HQZeei8Ol7ZvS+/CpGN4tkA4xnEjEAw/ely233I5CmQeaSTy4cGza5/IZvKLngw7
         A48oFkpIdeObcD6dTU3MJpXpYgJuiDFcVEbnMRX3G8yL9PlyH0Lo78XucsvvSfC6SGiG
         Xo77S3shFh9kb94VMYVnvALTVon9qKzXnaLTliPu1rsZWt4Xr6BA02Pin/Ei5sfEipzC
         YyV7Lr+paOVCmHEJSfieA+nS+cQGIuSGiDOMubuEX0d+FRWTKb1Te0dXqXN/mXIw2nk2
         ThJLSMYaQ+kzBK2L2wr+UNE6cwoHZLXn9WWA9v/V4gyoazznTkgiBKfPpt2OyufvnNsk
         EcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955213; x=1784560013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTMbh21QXQw/7/D6TKZ7n81vmxGgnjPukreQ8dydJKI=;
        b=JFMR6IwTQelHHd/y85Y8x0LyZ1QfDvlKA0FU6VS+0A/eQD+ksu4J6ZWmT8fHjW4MTZ
         KTi2lsx/fFdWQx6qqeQ0nXUe7WIWC2zhasol8lW1FpWTRsjJbZFjFX5YUuubCK3EpfTc
         0wNiVNcwFzRlzOFZ9NXnVWrjcH+UyZbYBb0EUtfMU477zPog2LLeLJiQbashzZsibK7J
         688EGOnlIZyvA6K3bvqgMrulMYluaOfVDmzr1pr1H96dY1em4LAaBhAw0JdLDE6ASQyI
         nGY8DlEdBI2IfP2DmvKlC3VV/0v/mMMFXozJp46470NHknaD3A70sQdRDMkFq29IFq7Y
         vAvA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9ZEZBMi6as3MvbDDJCqWtAXsMkgf8kzxPc7W1d/wLVPhGsqBv4O0FHOJzTs2r/iz0Y4G1cKmpfDao@vger.kernel.org
X-Gm-Message-State: AOJu0YynQzVXfkWipn1Ea7I3o98dZnpR/Y/RpFkcCgad6C2jlrd8OStB
	bpkY3ZB3O8jmBTjqhKCIVU6OW/AkYA1QDeI6SQfpyrZyMaCVDaC5ertp
X-Gm-Gg: AfdE7ckPwq+TsvYcT9WRirkM+DU8aW6ifd+nux0a+UlGFMER15D8ZvwN6FHZzhPNzjo
	LrFB8oVQN3GStzUC8JGB/+Hb+iRkiaXmw1O/emPw9nnYhaLQlO1EV/p84yNKV6iHyk4EHUPlAW6
	r/eVQLZFW5nubuxtCiaKQuFz/4h0K2XzEX5jI6Nx2DhF3yycedbGlxe30p2N68BDuS2MnXuICiD
	QVU6fBeyzdyBa68mM29FFFrt4PJXbw8QH3sAdMcvIMGMqfu/Wyb6ul6lUZbyamL3nS+MWR2c+l3
	8FVvTQKxXvww7p8GB/aUKQ1BM6CBXzcSRUnY+Y+UwNl+Vl1IGkOJq73jWVK+71/Sn1TeDI8bgqk
	pT0gEdyf3hrlwcdqr6Ic3VkEkT8YFkZ6I6Ol3blEcA+t0N7uiBdCqsTvNbZDBmH+/Ru7X3o046Q
	NIua1UJS7no+CJ7A80Acn5ZrKBGb/8xho08310iuEQpwZ5hwCV1p0LmIfEZXRK+EKaB/VOX6daw
	dV2Opv8Tp9b4ojh
X-Received: by 2002:a05:6000:41dd:b0:475:f0d1:eb69 with SMTP id ffacd0b85a97d-47f2dceeeebmr11163398f8f.54.1783955213443;
        Mon, 13 Jul 2026 08:06:53 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:52 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:23 +0200
Subject: [PATCH 2/8] arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI
 adapter overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-2-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
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
index f833e179ab3c..e8a1e015ca77 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -177,21 +177,34 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
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

