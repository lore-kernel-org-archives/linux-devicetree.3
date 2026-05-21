Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DC1371D1F
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375695; cv=none; b=hQZd3/gepzQiCaFxETIvoV7mQoItSG/i24qzezw+z0JWl0OmAGAktWC+DtbZJJyw7N/k7zvOClXG2ni7rvaRnZhUTE+gsuQAHuhrVIuOHjB0atYdYyrfp/yPzVgkGcOVio7BsalEhKf1Gd2n8jbj4M8ilP7oUNau4pjTXWiDAO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375695; c=relaxed/simple;
	bh=5CAbBqp+8ZV7JG3ztlbYffqFj/5512HGviGA+7UcN34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDMQhs5G20ClYzX7CZNeF46tOlohEGXALh0EsLoDmjB/y9HmPb0zmktcPluqWbFOXBVJIXV6Yj3NQFcdkNQ5mFPYR7nS9fXCZQURuWfCgjYrjGEed1V1Rg4zw22jFRQ2Fki4sGPNX0jplWSTEIKXez4dSMcW51aNJtdAkoBWUOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqeDNTV2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqeDNTV2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903fd19957so1384495e9.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375692; x=1779980492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWDvvZpW/sE15P0paVY2aruhyEKLAjYbjEimD4YPxkE=;
        b=JqeDNTV2vCWVUHqttppqW5facTseXxeFNaJq13VXWnk10ngEPyMzotaZ6ALvvwknt2
         Wiabz5rSEUy+/B+zgtG5JOyNmuFzyyWi6dBprBF3nTZ3LVGHmORreWNb1u6gexaviPoD
         YB6qnuZ32u1CyevGg7Ubp0ViUpt8GMQJdNk8vIefhOWoxbyXYz9UL25cdn+CZppgza5n
         I5wOjzQ9tOApPndcPM1Dv0d1gdqiT7AIs3voVpkxgrU5k3J76OdVHP3YlfpR3mH02pkf
         Hh4Ls0djR/6TDOH/skinvP4Rtr930ppsqNefRNjN2wd6/7+lcS0dtKMZiCqm9JrprIs8
         uazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375692; x=1779980492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HWDvvZpW/sE15P0paVY2aruhyEKLAjYbjEimD4YPxkE=;
        b=eM05A9wW18Sq1bCOCZSmx9obRViHMT1KavxxqzXa/hhrghH4AuUsHOwID/d2LHC0Ej
         iY9cWeHeqIp5ZfzRfZIzxshwm1AmssxA7tbGb8+3AIEOqhPSR21Rcj2Cpk5pTVoK9pQm
         ySBZ+LW/HJWwj9XNqj1uRu7k20Q+Z1SSw4/mLMuks+nSC8XqjkV4651LGuw4fbouOwBl
         0L2p0Q+6aLlHJiclHxgct2/1+fnts9ZOG+BXY7kAn96iFeWJCob/Z3CtMjZDnspCe3yl
         hSf3VislgmefYjO9jRDUcU215StY1mVfTD5KiEAVYUKx7QE2D1KHBd58r7Moxv9C3rrr
         reig==
X-Forwarded-Encrypted: i=1; AFNElJ/87M8jGWElaOOuBFCv4oIw6Oto5bXmjR9luyCIAi6eAP2kgELcA5bWq4yLvYJ+APQo65sr+4JKa+O5@vger.kernel.org
X-Gm-Message-State: AOJu0YwvO8NNgv1t704amP8VdSnQ7IlHGaPw3hwpg3NRKRcE5u9u+P5+
	rWYfSRlOGR9xPkF89Q4Yt/ANUwDrmUBH8yrGCggnBiHxU1QIbVJ9aEVJ
X-Gm-Gg: Acq92OGTG12dVo6CjC63IEfoJJSdMVdtAuoQzuADKwI4HPYgsVITZ1BcB84eK0v8Jj8
	FqMQcTsOYRKW/R9fLPI+Ei0m8U+nFgv1aJ0UJO0HasZwXDKCPenqpr6U2xAD4CxZXho3S15HRQ8
	9s2BqoxHjIDBNS5bWf/2Zuz7SxHOSVHA217ar1Voz1pIJlyWcZwu6sWfzO7GvTRqrqeaU+tIWc2
	AaM++JiZnE/MkL/HDd9yoCFLwE+Gi5I9BBQAccqce7gwEr+21t9Mt2TbYLzKLztnvjlOzUl1Fxz
	n8vDkayuoWufR4yhvuWdEhcy59QdFtPbK2mrqEwA0HVG2IfSikAEWjhPW1BLk4UJXChbxNWYNzb
	GEj5/AEwHx+Zgq9/2uwKaQQuLZWKYxTCG8/w3QWoj0H309rVLWeEI/PF1sFDoyfrUhVz7tKXT7M
	VVcWzfmyHAhVeojkhIn3u39mfPpStd5xz9pVR2c/Z35w==
X-Received: by 2002:a05:600d:10:b0:48e:526e:101a with SMTP id 5b1f17b1804b1-4903606b81emr41807905e9.12.1779375691986;
        Thu, 21 May 2026 08:01:31 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:31 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 15/15] arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS panel
Date: Thu, 21 May 2026 16:00:51 +0100
Message-ID: <20260521150038.103538-32-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
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
 ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 129 ++++++++++++++++++
 2 files changed, 134 insertions(+)
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
index 000000000000..a4d6cbe9ff3b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso
@@ -0,0 +1,129 @@
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

