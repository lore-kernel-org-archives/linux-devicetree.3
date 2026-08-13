Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8EB47CC8E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628080; cv=none; b=aL+bgNUIaSDcBgSlBSVkKDHeJ6gyuAOzjx0pmkuurLJk/VqYQH5KUQGxH5H6n8aTWRBoYSRzpJUBF5wAGiUKhyIwAp+mi2opMucp33XVJRpzHrMiZffqmvIIL4fjYS/c6a7wDMSTgz7iy/Z+Thi5hIL/BmNBATEO4PJczKZbmj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628080; c=relaxed/simple;
	bh=yXPfYRTq13Z13hnY9M2vWLNPXxCxTlshRWn6pLaBIyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvF4rYyYYGsa2CZm9DIu81KsZHau+x9+7AnElSDwLhKk694UFDacWFR4gagqPNAC5JM8sQtR8UjIaDrqs1Qwk8J6uxrNG6PqaiE20Nhk4LJrZvSDDG8ZNQpHTaxdK1ksjDP4f5Y3deNeNhH0EXf8q/MgbS6sZ8TWguWIza1wfcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5mNOU9H; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5mNOU9H"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so941806a91.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628079; x=1787232879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6StSRmQ3TXpbzmYjkKhFphWCpJTIb1eQDdlKaP58Ns0=;
        b=D5mNOU9HiiLPxDV14YpYWTOGlC/yJ1L0F2nU/BTqEwzh+qkI3ZI0Rx64KbulcMYZpj
         +3eYN8reNSs4sDuqdRl/+XCi8vXPMzgjmAri5WkKG0K7V3OaXNkSSfQYWOlDSSQBMd7y
         5k04OkAnLVpNCny1I0tD2b2X3qIgS81Hi0rKk9VKeCVo/dc0TrTqJX48Vu4X4pqlmHGa
         gm05mc35wKYrQaX/WbbGGX49bpbml+XoPEq+OquXFnPaf8dAmKN+qmVLrKEG9JFYsLBS
         pmE1CvhBOMeteliWig5rWc1NtMsrfgnmJBvpTuvz6YnthibtxvHELpydOsgISvlQzn/Y
         0elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628079; x=1787232879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6StSRmQ3TXpbzmYjkKhFphWCpJTIb1eQDdlKaP58Ns0=;
        b=OWawPbQZghZZkrCimrd4DprP6Cpa/VXkASrD6Aw7B7jaccRsyr6MIA49oOLV+holCp
         cn4Ro5q/k5xsFIbODF9Rm7Ur7sxfU016v9z8WsTE3R1BkwRzK5BRk3RFJysztE1AEuAF
         VIEXH+L+P/uUp8IUfSNLJSjuT94P2XlCupU+JlkL9/UspSytdv5RAtO8Et0YdVCPDMa2
         BA/yD/uYtZfYkWwih7KS4nSl4P59kowmWHMGEZBfGBqyxytShFO90SZsbY5BmApgF5i+
         1UNOYcSGJimH/sE42Glj44+3/mNv5qf2oH3BGiJ2f/Dklxh7+hiI3HkQuoiE/UkFbgEd
         mTJg==
X-Forwarded-Encrypted: i=1; AHgh+RoHZfVGikc1nLa4skV7e948g9NSoRmO0nbt6pmmA1zL/l4Z29InTV5d81+RdYXLIKyMH2mrRU/4FkxP@vger.kernel.org
X-Gm-Message-State: AOJu0YysNt3evROFwHuOGwq7t3cl62bUZvRL7kI1RBrAIsb+I6XLwKrS
	yBgqAIp5vXRuVaEaSNza3ay1ZhA8pHKDyg4sjGGqh+9YMmUldu64+i6z
X-Gm-Gg: AR+sD11V2NoIosBBhZe9mWXNXXvqyDEPnU1LKx24XUgegVV3mvW71m3b2iQUWkMGSaQ
	Ynx8OMNqlnhIB3PvU76gz0aSZGDLRPbCEBG5LOk1x5f9OWECNMHJLu2bOTTr9lyoZ1/7bnbB4cK
	1hxGwu1ePwhA3xdG+Q3HCvjGmVEk5tLXgHhh8rHu5+A8OYfAxzPrCtgG9wJSlEkCxtK9btH/V42
	nOKvbJIpPa64IwYmxjQyOQY1ou01XswH3M3Y1z2zFK6DqpUpXVQ8o5Berxu2EeuqQM8L2c3QM/u
	rWv6WDJliKo3+tp9zhhGLMYxqMMV1DSSBEkBeqRuGUTTMmY7C/nF+UEj4IJFXu3n0xh0qd56l55
	G+pbp88JDpC1MzceOJ0A8NlOqZuZor6xCm7uX7bBpXN8nLazUSKVWsEEtWusSnS5SQjQEP6JR1e
	ptPeX5vp0Puy7WSD0SpwOhB5k1IgKEHM0945+66M9S/F6LpvqXHcF+bGzvtyMg3meCdXKDp+QLT
	vT8D4o=
X-Received: by 2002:a17:90b:4fcd:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3931e23aa93mr6950170a91.11.1786628078271;
        Thu, 13 Aug 2026 06:34:38 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:37 -0700 (PDT)
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
Subject: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Thu, 13 Aug 2026 10:33:30 -0300
Message-ID: <20260813133335.1941580-2-leoreis.costa@gmail.com>
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin iMX8M Plus LCDIF on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  6 ++
 ...mp-verdin-panel-cap-touch-10inch-lvds.dtso | 95 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 201460ee5669..d643f85baa7f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -514,13 +514,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..9079c6284dfa
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin iMX8M Plus LCDIF
+ * on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
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
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;	/* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;	/* SODIMM 44 */
+	};
+};
+
+&atmel_mxt_ts_mezzanine {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+	/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+	interrupt-parent = <&gpio4>;
+	interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+	/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+	reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	vdd-supply = <&reg_3p3v>;
+
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
