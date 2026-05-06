Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB022480DF1
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078079; cv=none; b=gIaHkt4QLs2naviCWYhvuwyZx/hWaPGb+O87cfKq+Yl+Er8Kkd9nCG3rrMNJiVGAs02+YL2HIdUo8iSsqgXTQ2OvAA4Q6C9CsEp+8uzUQuSEfMWtN+Cv+umVReXumW+3QiTd9sgUVb+7UM2jwntjezCAYl2ma+kjFGkMVsn9/gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078079; c=relaxed/simple;
	bh=ZtQm1DLPCb49LaYGlv91MpW5MAdX/0m3eqnscUKai5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pLPt2qn+IPoaXgwetI5mpTZglxr2SPZqcrLWvF8d5wOQLJMq3ckiXsLh9TXCWDb6nM8g3hvP1JjYA4HQppHGTJtgaWHsOEIEmL6rEPb4BvBOqw94nSZt0zQ0iHf1dAPiX7osPshgFuEp/KbZWNxxl1zR6DWPRN+bvJ7HW0yH+d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBrxB4IJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBrxB4IJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0046078so57690545e9.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778078076; x=1778682876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqAP6HoJp4PDzUAz6DYhX+6+R5thQEEp6vdxh3M2Ufs=;
        b=gBrxB4IJnNtNMw/0QTxYhg5X/M6wKtHWe+vXvzPEU9FiKZWDhd5GmukQk8B9ZED6LQ
         CbLLuO5Dx8IVfjYlzcX/sFmDAO9TkUothV/wnXmOrgQ/+EMqfhiv1UT0OlS/CDYOLZ30
         IttvhWVg9voJnntiC7mw1dHOZOGMkElKT5r4UcqFMk4We9m7wqUEuCT7B+FNpjfS5DNp
         op9JCSyrsAjeG9iX6FCeKffM4i2F/RKiwCtVJZt+v4+z3SeHGQwT+ZirmX3mg/qQxQyW
         xcJ/W7U2tCBQYnvdKg69LVaAIFzEu4aAub3heXewaSsIz3UCE9j840roUNYXAhkqVZdx
         NxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078076; x=1778682876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqAP6HoJp4PDzUAz6DYhX+6+R5thQEEp6vdxh3M2Ufs=;
        b=ZM87egRn0sXt6TGfIvZLLU1r/J1ZFdMdnEC445/eW18XKio5gCRwvYRiw1GB8wp5Db
         jkV35NJIDHi3liMvz18m3kIn9SuuqzhY2A8bj+Cuk8Gjxgbp2YJY+n4dhyGz4EwSNpjy
         8p00gd2DQr2LuSYXRjIZJcE7PdmU/zs5CO4Fi4TM219TweLDEhBvUw29z1DczboyE1sb
         K0MJq2NVZYXqJypJhnOb0gEUEdq5rITp7VdS+tzvmZYhPw6FbrCmhAoSDyVj+VT2RyVu
         gMwC0I3G3oRQpqh+jGOq2sqCL/PH1/sOZSqN21JyPnDAVjSzwPeZTu/W8/hB5TfRDek4
         meRg==
X-Forwarded-Encrypted: i=1; AFNElJ8brz03oIPiosx36yMkISov0rjRUb/ACgXDs/hRZyUiNXwlHSSIIsK9Ti6KV65A1Jvl+4/GX7Xz2Gs6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhku2DiphEwj2TI82Cs1VZZsIhMkAmyJsCX+SyrFy+sIdRDCI1
	Yg0xj4QVMLwTe+J/ny/Ok6qWWQw2igfR9OipfeqNDSEgmMoOSMic9oGB
X-Gm-Gg: AeBDietjxsFZbW4LnrjDY7YmVEZs+GhstA4H27lSwGQYmO+Fcvob8HZQERWI95ulIQ4
	eh/Wfwswy/xfVn6gh5WIHdP6b/xYYgWP7SSWNZ54oADYmThlcm6t5LRxfKZmG/xommVnuZ/sIy0
	CCQboVlIZ9Yzfoe3CJWHPw7iHAIaLlNxEID3oK53U4pEIXRqcFWEntbq25o8bvCfwD0ogm9ey66
	JslJhLy4C5R9IEa1cb+fI9jx3h9/To5NuQ75kupsTkX8u6ZO5D6NjGa2m6tKsbR4Q5jM3ZXCvdw
	1phCXUHsQLozV2VRUFnVdpIXuiyg4jx7ScDh16bemsT9q3WOUxCWq7bugFF5tFhak1qVdliwZid
	grbJQzm10kbUeS352l34x3SFMixBv4Y26uY89CriDEQF8U9jz2iYTVila0IEHdJW6KmC6FMPftC
	rFQWhk10ktlzJBCGcBVLTZksFm7ziMXx3lOOdrIekYgMFcwqaYcGFn
X-Received: by 2002:a05:600c:1d18:b0:489:1f97:6b1d with SMTP id 5b1f17b1804b1-48e51f4844emr64680535e9.28.1778078075891;
        Wed, 06 May 2026 07:34:35 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530d8691sm42893115e9.2.2026.05.06.07.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 07:34:35 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Add DSI to HDMI adapter overlay
Date: Wed,  6 May 2026 15:34:26 +0100
Message-ID: <20260506143427.348806-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device-tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Verdin DSI_1 interface and provides a
full-size HDMI Type-A output. The adapter is based on the Lontium
LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the Verdin AM62 carrier board device
trees to provide ready-to-use DTBs for the Dahlia and Development Board
carriers, in both WiFi and non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               | 13 +++
 .../dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso   | 94 +++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 7642c06ca834..21db60cd19de 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -9,19 +9,32 @@
 # alphabetically.
 
 # Boards with AM62x SoC
+k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dahlia.dtb \
+	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dev.dtb \
+	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dahlia.dtb \
+	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-wifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-mallow.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..a219faf0dcc6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter on Verdin DSI_1
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
+		ddc-i2c-bus = <&main_i2c2>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		hpd-gpios = <&main_gpio1 17 GPIO_ACTIVE_HIGH>;
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
+&dsi_bridge {
+	status = "okay";
+};
+
+&dsi_bridge_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@1 {
+		reg = <1>;
+
+		dsi_bridge_out: endpoint {
+			remote-endpoint = <&dsi_hdmi_bridge_in>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+/* Verdin PWM_3_DSI (SODIMM 19) repurposed as HDMI HPD GPIO */
+&epwm1 {
+	status = "disabled";
+};
+
+/* Verdin I2C_1 */
+&main_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi1_bkl_en>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) */
+		reset-gpios = <&main_gpio0 30 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_hdmi_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&dsi_bridge_out>;
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
2.53.0

