Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E7E3ED12B
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409623; cv=none; b=BqE+nJ0LhnPV3/b3s2UcH+U5klkkTMkhZ6yDsOAa60SR3d1mhKQdytfu5oUOojlZKyJJksUItvWG7LEdM6idSDQt+LTTobWNGQiPS9Y+0IgM8R1y1DakYiStAarAVjZL476qroibyJyWVcELiBOeO8KMXO68IxK2segEAIIbg1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409623; c=relaxed/simple;
	bh=kEH6PDbek15rS2LeORRiQN2si7wMGhOMoHQUDgxn8vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faZD3Fe0gt/xhY3B2GdvRC/H8yM9BJoc8qaN29ARbSCI7Pxlt4xtP0/uzmb/gSpSDbU+0YLQcbumSfdw89OxeU4Ng8qXIA2DES1EBddeOAFCay2thJ3NV6fdhVoNfz/s8bITwR3GH6bpd+7WTR+QQYewZNeZN8OWk6BYk9XLPC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L25NdxJC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L25NdxJC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso107754825e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409611; x=1781014411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJTNSvGmNlfWTZXTUtIjd3Sb6+df9HO925pTn2aF+ec=;
        b=L25NdxJCs43HhaF4GSeqDRZZU3sV2D5XaZFu8USQto29jNfpqUmNNh8v/1oFhMOj9Y
         Ay5SYLY195xDMNR/Nt91dNUwnOhRhGfzPsDLxTPvSU825ajGLXmHglK4Q5z/8BUNtayI
         YLtdJnsngHojY6acmazx/LQDi2Cc0ggGIxbmJlT0SgRbdCi8e/JglzaNRV0L0QU+/jMe
         h3ips7//yjjH4HroDKeJ9a55f17UU4dpsdToTZlmQQOzV8BWc68dX8tZmG4NnSFi1ToN
         fxDu39r9sllipfu8WfI2/tnMeBJyNn1Ixdt6kmK1hiuOdXLemo407e6H9Xsri6iwJtjK
         1nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409611; x=1781014411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJTNSvGmNlfWTZXTUtIjd3Sb6+df9HO925pTn2aF+ec=;
        b=X8x6Zpbsv4Weg0Bse0iNFiN6RLFsXmvDpwLZzxRZofofPptjH7JhgGMfvGNpyMqHD3
         Vu+DPIDlg9SNF2vcg4XGNVlGFMPprSLggiC9H/hjVb2PuWRA7YBa+Q4MREWii1vUiTvq
         9HmFGYU7QGxAC0qhpsN4GoK2q/4doPJ+9Qm5HzEt0sSn0FY49rshBL4EVZbUt7P6deTC
         pbi/h2xlq+QO0MLn2ae/nsZse5vpuk9jMM61tFY0g8kcvRLR2nCroPNliUPLXbwdQj/J
         nujH+p18eoplZvHFuK6AwVY2cSs4xQRA6BOGJkc3a2U/WP3iztwKxa37ReYu7se06wHc
         TE2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Z3cd9L0kL6Q/EkhsyZUZ31PI+x5Xw24aV3QY7FlMxzmPtG4xHolC7/dEfPbpp08EWT11zVhLrAD0Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yye5mJx7EIurdmzqCu/zUM8hcJYUR3fB2hmfRK45UmpjsrrNxDt
	yxGc8H4r9SqY+EOgK+2iwqr1MOcN4dV51loNpDka3ASk58B3j5xZ4Luy
X-Gm-Gg: Acq92OFTP1jhG07yE32WhXJIty+2KxwpzhH0kldg/JSwk6Jklpn9E+mJhkQIYQQj+LA
	4FaWGo5Nbo/0x6HrxwNXZ8dD9O1+6/cG0a3k5GO66ssgCOOzMyd8TsnivySzxi+R2lXrozfXgxa
	k05rukZgIbVpeRCl7Ydb0kHoiM14+MuFGykgtkgDJzFbDs7fHZkgA/MKfRoqO9GNj+oW9lAMIej
	S1ggSsguYsCnPfzas84tlDLIAHBbhFqeizzQoE2dWwbPbjMFkKBZh3oxVmrBTt7Mq12hs4J/EYu
	vXjFd25nsAa3WJNnXoMW/eO5LJF7bFSNtIkGCDGSwh1b8REIjaEmIeeaivA6t+kZxI7j7Vu3SmZ
	IxRYChTQtUQ1qxvN9uV4f4Fz8STgTbaK78EUqhpXdt7k5l81Ya0cbr5Zf+jvRvtrCqsyy5I9axz
	lyB6biOkGs17NR/UgRNvXXh1z1Qg==
X-Received: by 2002:a05:600c:8b77:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490a293a0b1mr331988825e9.16.1780409611329;
        Tue, 02 Jun 2026 07:13:31 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e0de7bsm60816345e9.3.2026.06.02.07.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:13:30 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras
Date: Tue,  2 Jun 2026 15:13:13 +0100
Message-ID: <20260602141311.1366818-8-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602141311.1366818-5-ivitro@gmail.com>
References: <20260602141311.1366818-5-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add device tree overlays for the Toradex OV5640 CSI Cameras on Verdin
AM62P CSI_1. Two variants are supported: the current CSI Camera Set 5MP
OV5640 with a 27 MHz oscillator and the legacy CSI Camera Module 5MP
OV5640 with a 24 MHz oscillator.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  8 +++
 .../dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso | 17 +++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi  | 72 +++++++++++++++++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtso  | 18 +++++
 4 files changed, 115 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 27a56abb1d7f..9fdf4f1452c4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -84,6 +84,8 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
@@ -278,6 +280,10 @@ k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-dev-nau8822-btl.dtbo
+k3-am62p5-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-ov5640-24mhz.dtbo
+k3-am62p5-verdin-wifi-dev-ov5640-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-ov5640.dtbo
 k3-am62p5-verdin-wifi-dev-uart4-mcu-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-uart4-mcu.dtbo
 k3-am642-evm-icssg0-dtbs := \
@@ -379,6 +385,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
+	k3-am62p5-verdin-wifi-dev-ov5640-24mhz.dtb \
+	k3-am62p5-verdin-wifi-dev-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..1da6329065e6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Verdin AM62P CSI_1.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am62p5-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..f0430b1efcf1
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin AM62P CSI_1.
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
+		/* Verdin GPIO_8_CSI (SODIMM 222) - CAM_1_CON_PWRCTRL */
+		gpio = <&main_gpio0 52 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2rx0_in_sensor: endpoint {
+		remote-endpoint = <&csi2_cam0>;
+		bus-type = <4>; /* CSI2 DPHY. */
+		clock-lanes = <0>;
+		data-lanes = <1 2>;
+	};
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&main_i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+
+		clocks = <&clock_camera>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Verdin GPIO_6 (SODIMM 218) - CAM_1_CON_PWRDWN */
+		powerdown-gpios = <&main_gpio0 50 GPIO_ACTIVE_HIGH>;
+		/* Verdin GPIO_5 (SODIMM 216) - CAM_1_CON_RST */
+		reset-gpios = <&main_gpio0 49 GPIO_ACTIVE_LOW>;
+
+		port {
+			csi2_cam0: endpoint {
+				remote-endpoint = <&csi2rx0_in_sensor>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
new file mode 100644
index 000000000000..2e90aeb448b9
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Verdin AM62P CSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am62p5-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <27000000>;
+};
-- 
2.54.0

