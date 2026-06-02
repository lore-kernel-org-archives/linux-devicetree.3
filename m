Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344EA392C4C
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401103; cv=none; b=ToXk2+//GqO8EejrOzKdIoIn7zIXmMzVdOXbFBC4D58P+Hen8mBRkZbbzRc8J1ga5JoLpQl5ondnJpFVphe8EiECWCJfXfIeu99adKm0Ra6NpN2+UyitbBGCd9b76WqR9wFddTOEySdkyprJYvslX6XJPiRXZJfflDRN6mraYVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401103; c=relaxed/simple;
	bh=OIAKL0DArDeyQDNH8mMGVPy5Gif1KPaX02sUABsVbbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNsk1N0JLKo8OMEruocyjuw4+Q6eW3XSS36K3BeoxAAsVttIArX85GjrsaazfOH7fFXC3tBmri7vMtn6bCyv11v77Yy+RFo832A3cWH4yo3ePBqAKHD4KolkySM1djTSNwwIP2X/qOuzil0JZJoO/KNvPLAR/HRqjNrwi0cF8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=six6pZhu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="six6pZhu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso5707635e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401100; x=1781005900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VnZ67Mn9rpXh6zYkRstzvXdwxleOKYbVtvyQUHqOxM=;
        b=six6pZhui0A9JzGHxnIcPv9q/sfQEy4s0PAqMvhOrkE2D1hI/Pe8K+U9ZLv0TGd4gJ
         TdzcGBgWEQKaudHD4CxxyQvdEe4BRUdu9XeLJgk2DJmLAuDR3uRlewCG5m8WvyaKT2cU
         ZWv/8Wz15IPxyU754/1i6iQLV0VnrhZ1UW5fzFV/bLvBGmtxlok0TMSaYVL3hzf6eycE
         9Vr/QSS2vuH9eCJtOMHSnTyoa14eAjBUtwbvjOHDJUh+OZKOs+DGnTdTOdM9nc8aRAQe
         MjmqdJ2H/aJ8Ncm0skIwHsDF6NQRPTIvEgFXYvfPFlXKVP87WN8VEgXI7RH7wQM0CvXf
         OpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401100; x=1781005900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VnZ67Mn9rpXh6zYkRstzvXdwxleOKYbVtvyQUHqOxM=;
        b=CIgIMsMi/rBlGdsgQmCc2Tq/6tu5PrRcrTBEAtVTiKZS9YF1uuzcsf/Qwxh/eCXGn/
         aOLQIDQFjtR2nw2uOcHyrNnhW1JNVKX0TX5hLoccAum1HP8mfwJnn2CFhau6SXCpkhKP
         MjhJrCjt4AlvW/zUdCU7bPYTGVvfJt12iYQzbpMKB9XoW+OVBmr6XAYe/Vx5O9r0To9+
         dPIlNqXF+Ezbo3gAH4avmm2kWUkldmzus67h8yBNgwu3xddb0rEfzE2OM6MG5BqkXmx2
         czEVpMwLbYngIeTW4frZ1SjOyzQsdxStSZdPSC980XhAEF4+tSLGDIEVgiqdK5cKSaY/
         O2sQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DTx9oc678lCiw9vcIxqYCGfLyytgpvHd+q+XuHoidUWSM0Ny/SNvrF4t1hkwjKvxKJ6nYJVEgj2IW@vger.kernel.org
X-Gm-Message-State: AOJu0YwWiU2zlDd81yjsDURJDfVy2xJUUyog7yNM7CLqt5qY5CVcirIw
	7xISkWxgndKA9OkUYTCbdnfr0ssIsdwmAAA7eea6q+MSs6l3Zphecb/I
X-Gm-Gg: Acq92OEO94rluSQRBtb8ZH///X+M8+vFE4JfG+GGNQSP/FjMrF6T5vijfnKq8stqX3M
	ol/LIhtss+GB3DXF7U4aQt7kJRRvlQJBe5AZhikOlE0eFuTouCpR+3MrWuoKPBmqV9zb6HUcV4h
	6zOVClDjCD5YUSEQNv7atEL/MBITMMV2+v6g7zsq/Zixe58c0Xb+36FTK8zGT3qmwrwfjxWitEd
	jJgFUdl+AvAXkUlMehtJAVo8Z3Fdt/G7ZhXvDrScFdRfCRwFnwUcw3WVVaBbyDLast4zBJE1aWM
	HAF0K9Wwlu4875QKCL8WeKDYgPu5a6PQ+F8MdvJgyEd12DIiQSm9KUWPRIvhYWH5eZ4dFKCBQTa
	bohdFBIcCymEnlFDn8rMogALq3bcu8XsOSTGggPVP70WDKkGyUjeuncOPFDgU/ikkWpLAUJsmKe
	kh82ov4Bvyb13ZPr//ZP2PJCACag==
X-Received: by 2002:a05:600c:2242:b0:490:5321:2466 with SMTP id 5b1f17b1804b1-490a2941ea3mr185811465e9.20.1780401099423;
        Tue, 02 Jun 2026 04:51:39 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:38 -0700 (PDT)
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
Subject: [PATCH v2 1/7] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
Date: Tue,  2 Jun 2026 12:51:24 +0100
Message-ID: <20260602115123.1324474-10-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>
References: <20260602115123.1324474-9-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay for the Toradex DSI to HDMI Adapter on the
Aquila AM69 DSI_1 interface. Used on Aquila Development Board (J44),
where DSI_1 is exposed via a Samtec LSS-130 connector.

The adapter is based on the Lontium LT8912B DSI-to-HDMI bridge.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso    | 115 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..7709bb58d4ca 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -190,8 +190,12 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 
 # Boards with J784s4 SoC
+k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..d8e4dd69599e
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter on Aquila AM69 DSI_1.
+ * Used on Development Board (J44), DSI_1 is exposed via a Samtec LSS-130 connector.
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
+		pinctrl-0 = <&pinctrl_pwm3_dsi_gpio>;
+		ddc-i2c-bus = <&i2c_dsi_1>;
+		/* Aquila PWM_3_DSI (AQUILA B46) */
+		hpd-gpios = <&main_gpio0 33 GPIO_ACTIVE_HIGH>;
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+};
+
+&dsi0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+
+		dsi0_out: endpoint {
+			remote-endpoint = <&dsi_hdmi_bridge_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@2 {
+		reg = <2>;
+
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
+};
+
+/* Aquila PWM_3_DSI (AQUILA B46) repurposed as HDMI HPD GPIO */
+&main_ehrpwm5 {
+	status = "disabled";
+};
+
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_20_dsi_1>;
+		/* Aquila GPIO_20_DSI_1 (AQUILA B45) */
+		reset-gpios = <&main_gpio0 18 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_hdmi_bridge_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dsi_hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
-- 
2.54.0

