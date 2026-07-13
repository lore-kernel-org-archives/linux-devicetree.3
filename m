Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06548376A01
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955224; cv=none; b=B4lrWPS+g/vh+HgyKVMW/yYhDonYhnuhescxVnUShfG7Jlo4x9JXO5t63iJH5vkkqqW13iSt+U014cyslL1rnLqHZ4f5aTeLLfOg8qclL7zQ42gMvmbCee/04f2wgkP6CSaK9ah9whiL7wGLvlCBrs2p8YcphXDbrXtON+i2MhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955224; c=relaxed/simple;
	bh=oq1RDQch7XDQCxVytynqdyl257LxBs0wfvfHQxKljrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CpwcdYTDVhIY012uD4Tt9I3/oCJmXqyA4m0KI7Sl8hap15oDTM+L6E+PaYI6Xzq0KyNY8KLHyaSPoY7UDEKjdExy6dqPqPWq8JRSKEkkj8CZya1CV4yAF3CbmGkFb3HlJkoOsepGiXnlN0l2nnDpY2Pil5bYoAI0TViTsVdI+4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgxo0bw2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgxo0bw2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1835251f8f.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955218; x=1784560018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKycMxkJUjKVffGUmXn6hazDZ6CipwefkSIIp/tO8Gc=;
        b=fgxo0bw2y0k4ZhVN5nDyjHtmR3q5zNAgLVAyylfteEs6y9CpO6L0xhhDoh4a3uHTY0
         JG/vy/G4KoE5Pga6tXGgXdxmQe83COwoOScNaV6+4VY1RgtxrD/PTcNUJ64o0KypfL/b
         4adaJkhqnKX0bD2jgIES1mDsTqaSLprqVkszleeXQohMXZ58xULMpkv6xeQ/H/TfrqnZ
         /EEkr8CZ0wNoajb0mUfObqcqPOFAdPpCY2PHvAHOJ5MkrTMH3y9P1aXP8hYAGdzjRmq3
         ymLJU7cbA5Hcz4Z5/Ttl1Jf/0ikwNS4iR/BLDxCIALjostpsg798pJl83yRzAlHSXX9z
         YxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955218; x=1784560018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKycMxkJUjKVffGUmXn6hazDZ6CipwefkSIIp/tO8Gc=;
        b=GS4VeK3tXM6jpsnZTD+3aUcVG1idwHs+QA635VpDkPVq+TV4nrLCMW8TmjGHIrbk97
         miSQQpAbVveWqtWPC7Jkvs6DsyD/Vl7HOzXiHzLY9F422S8SQgCByudqtWYpSU19/Q1Z
         p4Z3f0UqwV/qk3DcvPNumKdrruWnrCJCF+6dql9HlGyhj0eKegYxXsqMcc/WVkZgbTqr
         BxVvG9T3yE08XRWlOYNsKXNmkd0672xI6qLyAKBEVi2z4jHHZSaiCmZPNsumwxVpkNbp
         IigUoaHlwkIMgIy7MN+Os9c2irnR2Ojwx669wDpKVshhWhhaQu9+Vv+sG2ZEwbVFT+9o
         w7ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RougPgwucMGQZdml11TRQm4ZqpSOIj50yWZJ4IyfzyWlGvpl8m7JsQRZY9TckMOolhlnxj3DXeCTbv4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30TyUysI7oP3Q+WAnSInzrZpAHAuc6O9YA0ZclgHgKGlbfoVq
	Iq5ieNWGt5qA/USsW8ze7NdJtxSssgMgKF8i12+JNgjJTJ+//eT2S/ex
X-Gm-Gg: AfdE7cnNzqmX1JT00XLLyb1Kty7qUHdUqVvxVdEI1yKUpKCUKs3Gfy6DCLrCGLaXYJv
	LnQPYJGntT/Gl7oiddgXhE9h6rzpVVoVj8NskI/Pz7FTKDt+CZ582NHlAGYOT0OkFhOZwyYhz8e
	+XdzIGoFIPsFf7eGHvp2wbMoGN9rn63yfxOPZhMAIj+mP7+h3eC816Q7dQwz00m38Q+chMpNxOn
	Wxj9ZzyAHMggqhhfoQ+pEYhIc/1lGUa6iy5HV1wqByoYg2asFYX7M6gI18a0uDeS4TbiekL1OL1
	2/31s6rTvOibzN7Nfg6wSPx7GOfe2y3LRDzpvzvlCKemDcFgA0UR55MRCQV1PfN8//bjBvIvcRs
	V77GOmf5GkvXwpfXHxSJx2vBBmeTvPKnTFvj4Gs7YT/AJ5MS2hmvGoUhU+RMJq9ng1sYVAgxdxm
	Rqii0XottVNjDPlCoCNZK8KqZV6l/ZkwTU29jXcSSvDSnirpfMpLg7+h6B0tw8YMde3187TOV4b
	niDukdXErb3SB+O
X-Received: by 2002:a5d:64cc:0:b0:472:d154:fac6 with SMTP id ffacd0b85a97d-47f2dce975amr10204164f8f.35.1783955218269;
        Mon, 13 Jul 2026 08:06:58 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:56 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:27 +0200
Subject: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
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

Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.

The default overlay describes the current CSI Camera Set 5MP OV5640 with a
27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
camera module.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://www.toradex.com/accessories/csi-camera-ov5640
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  6 ++
 .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
 4 files changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c465aa19e526..ed3d678e7c5e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -189,6 +189,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
@@ -197,6 +199,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -217,6 +221,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640-24mhz.dtbo
+imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..f479b709c151
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..0632bdb1b679
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin CSI_1.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera: clock-camera {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera: regulator-camera {
+		compatible = "regulator-fixed";
+		/* Verdin GPIO_8_CSI (SODIMM 222) - CSI_1_PWR_EN */
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
+		clocks = <&clock_camera>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Verdin GPIO_6_CSI (SODIMM 218) - CSI_1_PWDN */
+		powerdown-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		/* Verdin GPIO_5_CSI (SODIMM 216) - CSI_1_RESET# */
+		reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_mipi_csi2: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx8mm_mipi_csi_in>;
+			};
+		};
+	};
+};
+
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			imx8mm_mipi_csi_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_to_mipi_csi2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso
new file mode 100644
index 000000000000..d56234913b61
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <27000000>;
+};

-- 
2.43.0

