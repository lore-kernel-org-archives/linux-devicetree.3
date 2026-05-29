Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630B3E00A8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056564; cv=none; b=Nm0oaPcrcggSYrybZLR4L58TE6lmTrxEUQfDu2luO06Ye2OAWAHkuNuJGfJiHP26XTDCn7pfc141K6ou+pCizZvsQK2poCSC6+I8ARzF69cPCU/ikfRqcTz4DdWlhroXoF5tp7p/DLGed85uBA7TIqDfWKpmiGHHBuN4Ib/rMxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056564; c=relaxed/simple;
	bh=P+GdZfL1H6di/d+Gt6SIBs9sx2jlwaCkm4zJ4wglsWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXAEc8TYSlhD+mcFVdDA1PjH/yRiuDH7KXXQsjmtDqsFLUxjg/MEun35qfLenPOdylAZWyEfkYgk0uAi/qw6dD1ce5j4+j/ctJQCT42mOZj5NgkS9sXT0BM/Y8hmFd2uo3s9KkD4rQoR5QE9IjcGQmM37ZDcD8X8KiG473WM0jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrkmPmLk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrkmPmLk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so73295435e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056562; x=1780661362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jXwBJL09ITgBWBM4jQU4+8bhoBzGyCBEiuiVIpIW/s=;
        b=OrkmPmLkVkMuxKWITBFMJ53bN1cXGpAPSQjCluavaisMBwjpJo5au0vNRcb9OJyYOL
         xahvMpYILvS3BHv57pPgbfJgx+Mg6f8m9xWIGnxF656z6vKd9nO6pcEt60Rnl5JC47pP
         KHf8shL7eBAfNF9bl5dg86PlBQOJTKacIavtRLryTjj0vqyQCnBn7WQR5AwTAemQt1R6
         Fl65r+5x9uwR8emJhBGSGLJOhcpbqeseliMcOj+etqdf2y1eq8z+nErq+hSWV17y+mxl
         pla+K5/pp4bevR272uJ5cf6sgmajaA8fwYwkegWNLsdN8p5QZnneMKetlGsBTu4XiNlO
         QV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056562; x=1780661362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1jXwBJL09ITgBWBM4jQU4+8bhoBzGyCBEiuiVIpIW/s=;
        b=RW6/Aaepji4kzGQZJAatyYJ8U1UDD46unU04RAz4rriZIz6RIH+uNSJpdWsHC3+VJW
         QGy+xGEPXs+jSwXDIHotQMbVCEdpIPLDKePyD55c2SUSDyNKu3xH9HF7MnCuxpKMl521
         JpCgZDFMqyNwZDQhwrQpVFix8DuGX8/WVAFlu8Vk+VTtJByGJu8D+9TZ3ZDC5o/lf5rk
         yaUg7GLdD1qZQJTA+0k2++ELMmWF/+fTEBBtLRPegFJ+AgEDQXlQ80TuJJxqvIeg1efV
         DxuOE2s/0DP57lAcvAoql+FUdKNVMgmPL7OPMPdDxSQPaYuLuaoF2dg1H81o9GtMiLma
         ynNA==
X-Forwarded-Encrypted: i=1; AFNElJ9KhRL5gcXXO5CN9vRwp1S5t4BJJ/JtyBmtdPsND8SzZBabXrAJDoScEAqwgWiKRrsFufn5AR1MIoJv@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3O1dPtxjtiqxzEPZBffAZn1IMDIofFHKRMPF69VnAjHLHHkM
	OgbZdKTAc131peWSJRmsLT442Rm4EN+FWbscw5e2gIlP9wlcbio0qaDY
X-Gm-Gg: Acq92OFrDR/BLo84t6ERgQAfgaPe8kRk1hsGk1bZIZAklQU1nbCZP0D1nS30PGswn4V
	eO5uCuonGW7fBnsTnJlO0NdF+pytHULBaUuVbP8lvfIY/Rfrhj5ffmuQxJtgwxyyZcqAIlJ3jBl
	5HrPetSvFlPdr8QX+Vd0x9gSS7s6jkiRT56OiUf7fQPBqBaH4GfdK7N6QSD+u/g6Fw/UKPrFuEZ
	fCJwWe8330gjMubv/z6T3kGg3nOw3mjsBO6XIj1UOMqZR/FC0B2n9Uua7fZSij8Qkem3mIEfOfW
	0F3MNErqtgPqLm4Amuaq6TTSljYPKgEpX3KvfatdlL3aB7D3ydn36x66Li25UpOT8zibTNJjDo6
	tuOshqPzy8hY3IE3X26kqK9ZbADVahwp9+UZZJWxVDNC/JFUSFkOMhmYOzu7H3PYDetSaDZiwew
	FtooTRZVA1hIYqQFrdweSlroEk
X-Received: by 2002:a05:600c:a013:b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-4909c411cecmr33061665e9.4.1780056557146;
        Fri, 29 May 2026 05:09:17 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:16 -0700 (PDT)
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
Subject: [PATCH v1 1/7] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
Date: Fri, 29 May 2026 13:08:53 +0100
Message-ID: <20260529120853.636015-10-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529120853.636015-9-ivitro@gmail.com>
References: <20260529120853.636015-9-ivitro@gmail.com>
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
index 21db60cd19de..c1aa5c1df927 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -172,8 +172,12 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
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

