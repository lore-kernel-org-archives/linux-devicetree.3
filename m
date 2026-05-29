Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE433B7751
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052737; cv=none; b=aJEU9Iz79SOAMEpSt25EvLXkwzec1aGE9uwS9JEWM+R48va1w8jVuYX3uP8O7HEx3e9Lb9DDkhMmuPbH8+Gh4gQ7j0vu624TfGuZ0ARLwF1X+UIgcOgxTgQxGkjiRUQbIQ9i5iGHiUBFz7lVqflXSttnVgY9hW3rb19TS+dSLdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052737; c=relaxed/simple;
	bh=3iZwrOcgnJhpVYPTrrM5EHFHEJ9g4wIAQLkZTpsERsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVSjRJPuqu04fHwCEfQv//LaX2rgp0u6FdCvooIdR1bxpHYVo1AIDTb1py1cXN2xsdrOVpdqqjKD9dAXWGAoxgN/Khp16mTw2PCNSe+3FikCuodyeX50YgGajgmQx2o587WDC7s0gfqM6TA+pNe6rhGR1WE2BxNW1rLaxnGSUmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHksx0fm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHksx0fm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef616daf6so27512f8f.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780052734; x=1780657534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clN6wdSkjaXLXwCgf9/FLjly93DEMRnjE35Sh9qesgU=;
        b=GHksx0fmUgTdj3zqp+T4GXuu3a9/794Nnt7bbsTQ5a7t5LyghSOcXRQD0/z+4UVPG1
         +v+rQ9AqaPtTq6VXNB1Un6m+VBWfjQbdLB2TUpGkI4gMoWy5aC+OW7lEAfo63qrs8hqW
         eE4XqlzVtRZCmlqUPKf/3D61CjkqPsh889bYkYvdvOAQ1EVz89C8SBn0uEmmWsMHymEb
         3+fuV8ImQM1i1QvM4lZLdu38tEjU5YDA47mPwpj4TbBfujm+2GL3UsQEknXEH5vNnDT3
         xgDrx31hwnvQ35oSPQ0dudKSF41O5r2rQpnjJLZo8Ma3EvpIE4ZmFAAygrZxcFxTIgoK
         OQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052734; x=1780657534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=clN6wdSkjaXLXwCgf9/FLjly93DEMRnjE35Sh9qesgU=;
        b=jiWhdnz3hLX+X9/WNORFN4rm55NaSXtZuQys9s61UMlbjo0Q41xJ43nXZRARN4EBqg
         w6EPqGzHAmfk1rPnyPzKtDXbv553SQX5OpdPTE4mNl4Ky+VVJa42xje2r/RDVplXRkXF
         hIv/CM0Pb4TkAqFFhY6VQ4hKSbzXFdqqX8ps6catrxtnvcYNSIVc3zBT/AqTyRFe3SXl
         FfNFPlA9ZjoKh+bLY3JedCrJp8Khh19ZX6SL7T2TpC4jXsDCvhpf4Kez8cYxGPqEjbA/
         OuYZuninSpDl6VmD05bQfOwWcSkb7yniRfVx2WsZV31kCgfUafW9NioboUdsrzkn/fLf
         gTxw==
X-Forwarded-Encrypted: i=1; AFNElJ9n8056pMQHurg+Bj//rwo5sZ7zdRO8og5hDYNle24k4dhBJnInetpia3pWnb1ejS6LoeA4FAfB6oJ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ciicLHC8h5YPoJZ6jaEu8sWD24eU57Z/p03OLNN9gWUz4gUN
	feBoOwDaZRAICsN2shp0MilEAhkoqhQt92u5c7QMWa2CiRiKDsy5BmSgIw9nig==
X-Gm-Gg: Acq92OEf0SZcGs9SyWBwujxcJvPR4mcB540sOzz6OStIX2GGsVUVFfONH2JFNsv0obl
	5GLw8qSprC9PYa029+gjQE068wqPI+TN+D+Q51dAgoluXFFzmdUq0l5RW4PUDozR6RQtpYkr4Xt
	2GStS07NTaeU23d0HS6hDnhZk7S3vrsycbSrQetaecUGQNPsPyqH5LTdprIFgJW+IcxU8IpI13+
	v8CkqEn4um7AZrDpKQWFafJ0UxcaFkbmm+Hos1shV9Fg8BlqrdjViHPbVrXqhHVjSEI0/jgmygu
	VJGSXxIiwlHb8hxDLbHr3gbavWkapgj6+g/Ti4xk+oDwSORt8kieAf+H1ZbL++p+A7wO5N77btu
	izVD4wwRQ8ZX0gsUEF63MzIKHEIw7s8E2JyKtPHH5ToqlFGdrjfxNWjPk/o6LWw1sB6EAVMQIYn
	KDmkyfIJ+FuyN3lHeJzbH1LnJ+Dg==
X-Received: by 2002:a05:6000:220c:b0:45e:f2bd:2b17 with SMTP id ffacd0b85a97d-45ef2bd2d85mr3402627f8f.21.1780052733486;
        Fri, 29 May 2026 04:05:33 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:7677:753b:2cb5:7f25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm3033663f8f.15.2026.05.29.04.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:05:33 -0700 (PDT)
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
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS panel
Date: Fri, 29 May 2026 12:05:20 +0100
Message-ID: <20260529110518.624454-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529110518.624454-4-ivitro@gmail.com>
References: <20260529110518.624454-4-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling the LG LP156WF1 15.6" FHD (1920x1080)
dual-channel LVDS panel on the Verdin Development Board with Verdin AM62
Mezzanine expansion board. The panel connects via the AM62 OLDI0 and
OLDI1 in dual-channel mode on the Mezzanine LVDS interface (J10).

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 131 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..e9951b5d2e0b 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
@@ -232,6 +233,9 @@ k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am625-verdin-wifi-dev-mezzanine-can-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-mezzanine-can.dtbo
+k3-am625-verdin-wifi-dev-mezzanine-lvds-lg-lp156wf1-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtbo
 k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
@@ -352,6 +356,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
+	k3-am625-verdin-wifi-dev-mezzanine-lvds-lg-lp156wf1.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso
new file mode 100644
index 000000000000..bb4acc1edf35
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * LG LP156WF1 dual-channel LVDS panel on Verdin AM62 Mezzanine
+ * LVDS interface (J10), used with the Verdin Development Board.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm2: backlight-pwm2 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin GPIO_4 (SODIMM 212) - LVDS_BKL_EN */
+		enable-gpios = <&mcu_gpio0 4 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) - LVDS_PWM */
+		pwms = <&epwm0 1 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "lg,lp156wf1", "panel-lvds";
+		backlight = <&backlight_pwm2>;
+		data-mapping = "jeida-24";
+		height-mm = <194>;
+		width-mm = <345>;
+
+		panel-timing {
+			clock-frequency = <138500000>;
+			hactive = <1920>;
+			hback-porch = <40>;
+			hfront-porch = <24>;
+			hsync-len = <16>;
+			pixelclk-active = <0>;
+			vactive = <1080>;
+			vback-porch = <23>;
+			vfront-porch = <3>;
+			vsync-len = <5>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_lvds_native_in0: endpoint {
+					remote-endpoint = <&oldi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_lvds_native_in1: endpoint {
+					remote-endpoint = <&oldi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* DSS VP1: internal DPI output to OLDIx */
+	port@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dss0_out0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&oldi0_in>;
+		};
+
+		dss0_out1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&oldi1_in>;
+		};
+	};
+};
+
+&oldi0 {
+	ti,companion-oldi = <&oldi1>;
+
+	status = "okay";
+};
+
+&oldi0_port0 {
+	oldi0_in: endpoint {
+		remote-endpoint = <&dss0_out0>;
+	};
+};
+
+&oldi0_port1 {
+	oldi0_out: endpoint {
+		remote-endpoint = <&panel_lvds_native_in0>;
+	};
+};
+
+&oldi1 {
+	ti,secondary-oldi;
+
+	status = "okay";
+};
+
+&oldi1_port0 {
+	oldi1_in: endpoint {
+		remote-endpoint = <&dss0_out1>;
+	};
+};
+
+&oldi1_port1 {
+	oldi1_out: endpoint {
+		remote-endpoint = <&panel_lvds_native_in1>;
+	};
+};
-- 
2.54.0

