Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881AA47427A
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628091; cv=none; b=bIjHQsLXepzuHeSyReUU24Z/WRhkq/QoUiKzmIpt0CtfJQVNe15OWWu827oWipK8tXNmJdKfVtf5PnQK2SJmH1mmcTf0HxpFTCRcR6C92v+W5LlZ07Wxgtav0dfiNW5Lw8GjPaA8I2fTkV0wU4GrCIKQhkaUmfMi0/i6ndMbCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628091; c=relaxed/simple;
	bh=VoqeMMcIsWKd8KmvgEjNw4KkgfC+M98Bdu+RywmIT/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUbVKoSMymQFjdiNENDkrtX1DABipvt+IpIA7ZbITi6uFjd/UPsqLnxf7Mqa3yVGzax98dSR7ATXPZgOqCLjfMq2bgyM/eHn7a+fbrOqDIEsi88GX4rBwU/FKm628tNT1wK+J/5L/wV2uNug5LViY2F1U6oxWmB9Wgk2D93PSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3D9ozpO; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3D9ozpO"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedda4c154so1357974a12.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628089; x=1787232889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VTj5OSqqn1KbxjYRZ/gK5NtAndnbAvST9Z9adSq3CM=;
        b=j3D9ozpOhynxof8oE4rxzfrzLRo8Z/2J0+X3tvQYsZM9/8RuFEU2u1Ibj4KMgtZ35H
         QzN1p63MK893a0NialeGWcy8HH/5LSSmptaZIufNiFrwE/qlXupz8wRUu+35q6siMNRf
         a4IId/R9wc1ZNhxuql4KcFfeJC+teyPAmF4qTLYSpNoeUY8fLCVmm1EKu15lRYG/NtPE
         HPt/WkfwtTD4rRJfZbhVNHKe6YX3Z2wptTfn/GcoQVuqeOQyVp8CdxwFiCO+ElfmDEIb
         Lk64t1m+s+rCQOZ6cpTDVxVYoDiG6Wc8Md5/12KpJVqzQ8LbrvN8qUd9Qz1irQTuH5yZ
         usGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628089; x=1787232889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9VTj5OSqqn1KbxjYRZ/gK5NtAndnbAvST9Z9adSq3CM=;
        b=fN3MCuCTu6vhstIOU9NY+zJ/62EpZq4fWDvFqdJWmXBtsWoB7qg3EXHJHl1gqQbnm3
         esDYIEGvIPweF+TiCQ39uLGtLh0bTKJM7fM0l6w3lqTswi6aj5LrXA5mNDZcWnUkNSVw
         afscimBp1JiBMP5oRRGZJqwx5gdFDo2SgU83r0x04zVZF685s0iU38Ky7wOIWPZUDyQb
         2Kr0aBBKnUpOM6vA7vNdy0jI3m3II0LOavfoU1/zJrtXZcRHr9FcJfYi/tvPirT/Fr8l
         JvTN4iaPNDRCXyz5JdTcSz5kns9m01nixh4B6OZnxPPL+BkrNApY0vDy9gLVuQQMNvQX
         ueGA==
X-Forwarded-Encrypted: i=1; AHgh+Rodey6Roith51JS170+u1JCGj8FFmF0iK+HBXL2CfkcGnnV/OU8VTOLAQA/vrCVK13cWjidPTdlj3OO@vger.kernel.org
X-Gm-Message-State: AOJu0YyMpD4KtauvFcNqbaM22bZSF4aZYkWCXWaGKPDotybNlwX4IYeC
	CR+2pcuMmn2cJkl0wiweLKXnV/sPbap6RCW7aN8xaN57aP3+X2z4QLup
X-Gm-Gg: AR+sD12FlIRvsGhZ5Q20e1qzPoCbLMkJaDzrx5Ucx56NmkAI9v1tKbYFwuaDfcZwmaG
	dcPJyrer5DRFLfxQ1eLJdDMoCGNmc1dwh0bby2yaC90db/wbRyTqV/0otXIVC8lew0ZF/QZysNw
	4PREETZFYZ1oxqSIHhNSbHHL+TiPRTagLrlzytPZ1kOQpINgeqvsy3O6YgdC8TCRXH6qwuo/OeI
	0RSXOHQN4v2b0yRxCMY8oWpJciNtBsNYl/AAK3UJG2NGR2r8TTxEY7dd/FMKje/FoCJFdxT1Tsv
	8sni0uAsvmErMwqeDrsI2LxyBgmr1grcH2Fwr6ZfanI21AP07UY0801GiFAQaA+5zqILB+piiVM
	4sXgqRyOuOJBUKsfJmK4v45D6piFfElagVZsXFH5LY87zO6ZAeGT3PpUyWkHpa8oXa3cU8eDgdM
	3O4gz3BNsgq9z5s2XhyWq3be96kacvIXD7OetxqmXuFFJJk3ODuYi+uCLv3BV2fWJO6SY=
X-Received: by 2002:a05:6a20:3d1c:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3cc550cb92amr8355198637.6.1786628088759;
        Thu, 13 Aug 2026 06:34:48 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:48 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 3/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
Date: Thu, 13 Aug 2026 10:33:32 -0300
Message-ID: <20260813133335.1941580-4-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 arch/arm64/boot/dts/freescale/Makefile        |  5 ++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso | 71 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c55269a0532a..37ae0954d02f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -508,6 +508,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -519,6 +520,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
@@ -528,6 +530,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..ce426288081c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
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
