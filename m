Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584701;
	b=yXqyrBuInNJkEpuwMSRGj3byw9J5Y5pKXtF5u+YmQxksX5z9IQd4v2NL7GRf28fkRFkO
	 27Vg5RN9WeCGTILz4GGpsSYf74ib1PTdIpiyjg+h7c6iQWz/rxV2bDd40wNBEZ3ARbyqN
	 2LdCJ9n3FPWpqb3nupxlWLZUQU+/cn8VqySAKB/++kVjGDryS3sgMe7TPby7N8nURMoB6
	 HmvbuzL51L/+pw+olSJg74GCGTabotBAO3jOgkwP7sTzxigZZHHvzLYK4nZIa9lz4R8XN
	 6s6YJ9kV+osN594Tl0i5dRwDTYMT1wjyZxZq7DzHbz3i7jNi26GBp+j5rJvCX3or1kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
	b=j7XCReEvHKKhxHaYnyzchkXcqdEdNM963VFPUP+W7XJurBHB+bdAoT2mTP+qphXEjvI8
	 ThLNDMpaBMRGri3t/wOmNw5b6KopZXLb3X94hgEV0DeiQJuQFNhvXK/WPBSCbSXS5V1f1
	 SE14jfuYCHg5DO0dDHcPNx52xQzpQSY5lC2rmBkDyvUKOJjyUg/+CtW2KBygedqERUn6o
	 LdaNcvPlg67Ye+9atNmgW7xVuXfZnPYGRXATzF7ItGFhOqK2yDSMspUFaA+OUjAUn1qJ8
	 otm8APeFzH5+pd9aiGN30Gnc+OPASRAzIMaULYyHxA0yUWA9PrZWI1tUuBrJq6X8SAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKPT02lv;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40560606A332
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40560606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKPT02lv
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b335eeb340so10502477b3.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584700; x=1795189500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
        b=JKPT02lvht4LsCjSgtzRHWYmqTYNGv0xOhBaAxSY643IfoM4BH6N4smG9Pt+miwGlf
         ttbuuDRJFJGua83iGLjWTbvBplX67xAWrOcBBVtfZz8NMsp6ti6CnxNmM6n6zuJ/i4vx
         m/DSpZQvjvmUQgl46Gp239qDkzbt0bjrO0pL4o/JayZ7HRCRbk5rOiH2hau9nnRJv6Df
         1qXHFEP+Dapzp52SZxPldFLXNhIOpbyj2pDNyObBxkulbDEP2W/eI9o7dR/Si/9U10nT
         7PosU+3rB4fTnTYyNWVUdCOHXKUayM0ewwNPuk762R3E1k/FQbjQSW/H8y0lM7u8T6gk
         dL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584700; x=1795189500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
        b=0P0p8aRy5cfvNBerwAi1/+KbrGfLoe05vzwUA+LeDl1wsywMj8ortjJpWCdpN8SBG6
         3oxr6+xgtIeratXkDhM2qjluzQ+JNS+5YgxQ4Uj47MfxzyuCcYqCBbL4yhlW4ZP0V5at
         C8i/180+kljO2DW4sE17UNcZHEDKe7hbI5i66VsA4rIqqQayePR4YsIfJqBejckxS0QH
         6VXh4EIhvGSuNt7/ux53244YT1eDTypPhwHNme+mvCX7ULqjilyxdAlg47pE3AKl1qN+
         RkstDbXHz787LLGdQfx/DSY8pJ4icn4r8fWDsUP3NqqJvrDCUwARML8wosxHcSpC/QIE
         PmOQ==
X-Forwarded-Encrypted: i=1; AL+hErETlFwyVvhOguzs6CJok6opSvSwt+bxlRw3jZRBWiCp2zO2ANdQ1qSfXFJPJHGB35li8p0tCtbhPSHv@vger.kernel.org
X-Gm-Message-State: APuU4Z9NiO9aGTd+iXlYyEMLeRtZivXyBLD5jzc0j3yfv83uFjIcbNzW
	awW7TZK85YjfdQuWtd3w+faXfryx21uN8fITs0E7W6EVKWoqdm/XCdDm
X-Gm-Gg: AYBFou3MTAXYxlRqyLio7HXYUqiMGKVWTMDBS5dPxyvaPTJwstUxTbGt4QIIIu7v4Bp
	hd+wwC938hQAB89OVSa1c3jvaBZKe4eBnYXVj3MWGohRwoG87eW11JV0mnNWKBwx82kGTObS7La
	WKYnZCFJKU4Y+I42C+SA2SIJhLqRzf2n/LjWaWjQfufJaK/pZvigwtxwEkXqnM9tK9qFodM+g9G
	1N3h5TZCykLHZ/4ApKIWqjrQw5Zjh24dJdpcxFiBR0IA3xVGIGEq+uqJCsffN9XvRJjdwXpCO4F
	T7zk3YqfRb9xVqCESXvhPUTAAxlSOxonCQ+uRo7ynsdnfsdhjoI8OHwWRQmTKG7mos9TvbjUIgt
	qJRcBhKBDbeSiL3PhB+lj0PDt+b1LYk2U5UlOQWwT15SWeJC9LfO+DrZ8JYj+Gg6IVsWl+dnhfr
	UGm9JdMH7VJB+42qNgwmJOgnoiMOnI+ai6LAobrnt2Xwt75ZneSfUs30VhEKT0kjKl7/oIks/QZ
	9fC2qqsKlPd+l/kqy0GHlZSaxa6xhw/VyNRWDbp9Na0IFqLcTiicZK4aXJBgpYwp/e20AOHvYhD
	SYmIqrAAjz82n/oXFnBzS6aE2EZpBOwM
X-Received: by 2002:a05:690c:386:b0:8b0:b1dd:c09a with SMTP id 00721157ae682-8b4aa29f563mr16924097b3.64.1794584699912;
        Fri, 13 Nov 2026 07:44:59 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:59 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:09 -0300
Subject: [PATCH v2 3/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-3-59c45f0a0d8e@toradex.com>
References: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
In-Reply-To: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5024;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=wd7JjVXjadga4ELg+VIdxEXEfAr2w33RKXLjgv7ivC4=;
 b=CqHxEnZYhjZDB9Wuj005NZAt0tE3LkmC2TXKbUNRJIFlIkB0k7ZbxzCsVtfUjv+USdQuubvQx
 EuoP9sp1y3HC6AUu/J0/9s1LVOIm2+2g/qB5IzVpXd8aw3Y5a/Qi/D6
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is a LogicTechno
LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is provided by an
Atmel MaxTouch capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 71 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4cd72926b80e0..915507fe936de 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
@@ -742,6 +743,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -754,6 +756,9 @@ imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-td
 imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..ce426288081c8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS on the Verdin iMX8M Plus
+ * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
+ * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_mezzanine>;
+		power-supply = <&reg_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts_mezzanine {
+	status = "okay";
+};
+
+&backlight_mezzanine {
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};

-- 
2.43.0

