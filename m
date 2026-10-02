Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFE63890E8
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927811; cv=none; b=Oa5DdI9IbLMCK7mGAUaZgAfKREex/j3kIirL9ze7HeFNBWc7hco0wxOYdJMKezvHneNYvgpD1nJ7C4y7g7T6O7vRhct7uwc0KRliE3Mp7VY7z5IGVgqCOPPLw984jqRpIQdAqPBJv2DE99CrIKvLDKTLrURf2zaM6JUpZH0HDZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927811; c=relaxed/simple;
	bh=Yq2HzGc2LmJ9s4dE3lBg4wkRq0LaKtBwNEYaL6IcMWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCIiKVa7Av5E5AsWWAe5vjsNijhgqpuSYAubUWqEljdUvKd62y7KiBdzH0P7vckrfnjPTTdh/ZzYPyHsH26N9HNmPWyNqYaPk7vEd7FfksYybGK9IyaJYbzjxV6biVy4FRpuUY2RlZMO67Sg5zG583cYo+AKIJD06zRSB+xwHJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEOraGTv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEOraGTv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso23677855e9.2
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927807; x=1791532607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/Cg6o9DtnqlwtjSVeTL4+21Uz6Jsufxp1o0HTptmTg=;
        b=tEOraGTvDH565ezrChZ8v/GuRcdP9Y86oqctdGFoZMexYjb53Y6gfXRtNLSUrkbOom
         Tr9eWfq0y2a8KiHWZrWElhn76YG6gYi56JowGd3UkAgZp1jE0krKuG5PV5VchjNDzyyN
         Cqe0SsTvQLolrOZo7PrPBHGFIQhZpza2JZoV3jeena64TO5GKXS5M/hc0DFqh5LjcGS+
         WyeEEdBPinXs+JHk6EnF+srdy/A67bpAfgEYbsbKTWKP2tWl6BCgPoXerpHuQsKwFVzu
         WyfSdJxdPB4gSxnCl06kYF/S97/1Olvp2nJ+Qe2ZPxisabPcrDVYHN1fRIs2RytnU2e4
         IK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927807; x=1791532607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/Cg6o9DtnqlwtjSVeTL4+21Uz6Jsufxp1o0HTptmTg=;
        b=Z6bju7Dq1hpOvDuwtIp1R+MVjmFy844izPhxAzcboWk8IirHZ6rI+O/FjaOemlA/Ea
         E63Xf6kRgKchNBbousr1y90XUEnFVKGQ9dgSTksb5VdL0Rc0z8kZbLDBwmn2YIV88HJC
         m1SrfC+Mx6t6UzctfmwY6yCxL7s4hswA3m0juLldkVijreQ1lBTfqfdXGdviQmaK8XbE
         quVYpm22TqRaSq3dUwPU0e2zDgO8b85b67t4+SLiTumzZCwFE46++X/GFIIV06r1tADi
         Ael+QKApt95+8oxmq6bQhDiDWdu3CdJ7FxXvMcoWLLLRVpbkUvljNKe9f6HYVz9N7wIb
         dZbg==
X-Forwarded-Encrypted: i=1; AKwUvBzgZxFs/hgozGwTb4vyHsBXqWVWTOkHrwoNXfzZkYjtNlwdZ6BWNeS92fHYeZ5C6ZhnDWIMZXmws0No@vger.kernel.org
X-Gm-Message-State: AFuF++leNuRLnC5jwsOGj+vaYLPjaTGvLc02aBrJpxuhYkOfgfTklOtY
	Of8+0J9NgBELknMrPxk5jQ7QEj7SBsqXkbGPKgcPCB92UfLHJm42iBjM
X-Gm-Gg: AYBFou3H0sYWWfhbLEkoY2Ib4lBaaeF0o1azlXlbvU0TDUvaehSVxq0NSRRo2m1MpPw
	q+Ffh+R9igmc7au0FtR7hJU4OqTQbB/xRUZ/Z5oNf8UKIaBBP6PvvHvhTMsxGYgjBQ0qOl9CPBR
	7T3jrEddDgkFxL/PQ5OYTAeqoFbW9dajF9goWbLPa2kcvkpi//yn8J+YPRo/fv7H5xE7azS0CMP
	37OhrHSL34fXCnC1t6mmvqL6k7T3CSIV4KPAZOTrJEYOsntqvMqsyZuZLePP3v49zKiLT5vwmjj
	49207m8PZ34QE8v8OBvXnoJtMabJbOtFVYNKtEWVNYmUrFhsw0oqhvgEnM5CGtO3J6oPzKjyg6N
	N9QrrWknvd3L02xmlQrj7bcPt+hVmQCRdA/6PGDLuL3vQjih3FEFXUwRVDSLOlviBKrXhysoGYZ
	2BTY6zJ+I6tIdxVZGjjEcIhRtKfsrFse9f8QPRIHlY/n2DccqkHsJoXchIuGOLJ9TsIQ9wRAcFN
	bX63eJldDUMHmIsnHXpV3QApyS+baS6OhiR1WHIb5653KHH/HsBQm0Uv9us+RCYIcsoGfx6Xw==
X-Received: by 2002:a05:600c:1908:b0:49f:fc13:18a5 with SMTP id 5b1f17b1804b1-4a0276a1f07mr31109475e9.6.1790927807514;
        Fri, 02 Oct 2026 00:56:47 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:47 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:40 +0200
Subject: [PATCH 4/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" LVDS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-4-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Toradex SMARC Development Board LVDS0 interface. The panel
is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is
provided by an Atmel maXTouch capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 ...-toradex-smarc-panel-cap-touch-10inch-lvds.dtso | 80 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index df697066e89c..2ec50811ee1a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -712,8 +712,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -721,6 +723,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..a177cf61cc38
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch
+ * controller to J49.
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
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+/* SMARC I2C_LCD */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+		/* SMARC GPIO4 (SMARC P112) - LVDS_RST# */
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_native_in>;
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1 MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
+
+	status = "okay";
+};

-- 
2.43.0

