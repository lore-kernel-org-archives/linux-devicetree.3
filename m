Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B9D443E4F
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 07:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927810; cv=none; b=FO97YEtoHxkR75iTdnZE6AhXBt8OuH6n2uGNoaJWnFCl0W+lYttAVFrBFg0BAbnc+vsHLZllPn4DCRperIBQcCDdWQNQlsuDVxMrRBiq4B+4HHcAmpc0ddtpBF+bEcC8XQHgAGUYUwH4E5/bO0pMNzcewwcBW57XoY+1LBLPKfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927810; c=relaxed/simple;
	bh=nq3/5MMDBesxCsMXRM6s54uYCvIT0pBpYMQbNHhL0oU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhM78K9s+GOuqfQilGm90joO5v/uefi3MsM2LITwvbCpCBVKLXpcAKA0b5BYsxFxoRp6cPxzn+TDh2rRhg+LveTbUcJu+ggrtZI50htX4gWuS6Gx/ZhTiBAoJrwmybEG118qgE/u0WKJ2ZRYDqcP7FV7YgkxVoixwLpEm5pcRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnkYmsg/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnkYmsg/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso21478575e9.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927806; x=1791532606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hxowliIaXPTVd9WOBncOobu1B0GdfQhuEh2F4J81VA=;
        b=rnkYmsg/lWFucgSw8Blhbbfnm7cG2HGLNyKVYBfzgPIWXhBGVfmAE+5hqqzdQJqKQe
         1hz+UJvvU7QsULxxAsSV//jWc0V9Kpv7iyNphva1//8JJO7roiTmVNmepFJ2Xg1tXiwY
         IcgDWVofivdkHg+aNbu2mLkXqHEZyD2f3RUZqfodcPIZj1ol9vp5lV+WNBzaYv7qh+aF
         dIarAfKoKxhHA6N6oADBAPc/9nutCipQ6nmf5f2Xvl8lUS7Lo7rb1x/+21oD17q/U6R1
         tQckHDdj/INvjwS/1sHo2w5U6TJqAm8fwTaUSl4BdFDAGhAqFtT3m02Z2e5R0eiWAKYs
         NuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927806; x=1791532606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hxowliIaXPTVd9WOBncOobu1B0GdfQhuEh2F4J81VA=;
        b=OkFn8CW1ZIZBrwWhAldGFC07xxrEhFz+PhXrpYRzwyFF4r0xrPXIK/J+NWjUunE+FT
         R6LHqQg6zgFVH6E9WrUYBcvw6EPhiIOZTfkiReSq1XH29p24qcus+PiCP8ggE36gbCFw
         IDyQXSh9dpw0iVc5/nSTl4FI9hsGEqk+c4MKYAKIBgrd3wNXAhsIuEC8Elon33z+xd/m
         A36IHBbvBGmKHaXN1PoMr+kRXVxdvMvCHC8xTdbjBp13OzR87N+wbcsb4hFYYvoOl/Mb
         F3NPUPMNmUd1tCYdPG0JgSehnM9zirvP1Rwu4Me/zKBZL8X6f1bMKw1sSxoeWgVXihNw
         gnzg==
X-Forwarded-Encrypted: i=1; AKwUvBzeWBe8VnbWOmtFouqRDf31uuy8nggILWEo1E0Sa3rHl3h/UW8VqtMN38hPkHtqrmiaDGXYTCcTrwKF@vger.kernel.org
X-Gm-Message-State: AFuF++lr8xwXvNLcG63EEN3ztd7P8JwioU6/IfhvLLQY/YBaFqvsjesL
	/2rfWJbYY6gwvLZxJJ69Qgoz/fyy0921fr2imfjD2etRMEznXIkoFg7Y
X-Gm-Gg: AYBFou3RlNmw2sFwYR86JqYlGi51ls6L4MaERZ4aKmwxmf7JVDCGQ0iYs6w1LHaESDc
	XpKB5xUSZ1bBc0kLOfGjH00UVJFiaO6XIXwSQqNqdF69VIW+S5RsuuyUKYabCGyQLx/xHxRd4zm
	9LJMH/LB+CorlndJZCviJQ6MMt6Ip02J4llst5zg+EL5YOjiSnOArGhUt07v06+Be6036EEao6S
	RhqzDuWZUUM88ZR6jJ5Roihy07vJM+bA/SSwtTZh4eAY5GOuNelCgqgHjsTbXOgfaDpiqDbCC75
	Id87GN1KN4DkUL7wlxbWAse/7My5t7K1Ags7iGtjthizLNcSBKTBFLpzs7WZHCuSpkvYuo55zuN
	sMKYZyeuJ2q7iIavYtu1UUsP4haWLdJnXI0OCVkSMMUV2ZdeNw/UcMCOLQ2JDvn2hLSmp4AZxPF
	y4hfm59H1wYK/jCOJdRHB/9sNCjk6RfY25Ojlh5J+0iRZ/tpYykHl1wj9WLV4Kw9//NAo7tGduD
	vyFWtgTsqsy0BU3KNWh7Rwfo3EtSGy2ZpSPowT1Dh2WUqwfuzBFiLC9CjEwMPIZXzyCH7i1Lg==
X-Received: by 2002:a05:600c:2192:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a027569390mr22771095e9.16.1790927805704;
        Fri, 02 Oct 2026 00:56:45 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:44 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:38 +0200
Subject: [PATCH 2/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" DSI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-2-f578c63fb676@toradex.com>
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
10.1" on the Toradex SMARC Development Board DSI connector. The display
features an internal Texas Instruments SN65DSI83 DSI-to-LVDS bridge
driving a Riverdi RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel. The touch
input is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...x-smarc-adapter-panel-cap-touch-10inch-dsi.dtso | 123 +++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b5519fb36b5b..df697066e89c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -709,6 +709,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
@@ -716,6 +718,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..170411a70523
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" DSI connected via Toradex SMARC
+ * Development Board DSI connector J44 through the Toradex DSI Display
+ * Adapter. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-dsi
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-display-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lcd1: backlight-lcd1 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt101hvlnwc00", "panel-lvds";
+		backlight = <&backlight_lcd1>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 96 pixels. The
+		 * panel data sheet value of 88 pixels results in unstable display
+		 * output with the i.MX8M Plus DSI display pipeline.
+		 */
+		panel-timing {
+			clock-frequency = <69300000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <64 64 64>;
+			hfront-porch = <72 72 72>;
+			hsync-active = <0>;
+			hsync-len = <32 32 32>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <15 15 15>;
+			vfront-porch = <15 15 15>;
+			vsync-active = <0>;
+			vsync-len = <8 8 8>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+/* I2C on DSI Connector Pins 52/54 */
+&i2c_dsi_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		enable-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_carrier_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				dsi_lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_lvds_bridge_in>;
+				};
+			};
+		};
+	};
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2132";
+		reg = <0x41>;
+		/* SMARC GPIO8 (SMARC P116) - DSI_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0

