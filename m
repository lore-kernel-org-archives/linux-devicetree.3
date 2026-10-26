Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009671;
	b=cejl0Ldh+69qc2WB5kwXCEtyvmTlGL+B6W6+CMDJqz/UrCM+Gz1Aq1wp1cQClRBTIpjP
	 1V58JC4/sRHNCieFg7qXlTp0WTaIYtyiYUOD9uGTzZ8MqApHTsPw5Ad0OxOZl65B02iMj
	 KvkN0RGaj5fXNiahfM+1dbpriOXbpPDHhYC/b4dNhmslAI2CM/NWQIJMS10eNIuHGRbgi
	 d/8g19ldBO2inwFBSGZa7RMMPO32uH1oJqAuoG+3J8K6a+ZVv5HsIlKOT2zNLq5kSWNOM
	 MwaaOWjInzU/z74nvpHcxHPXzYE/bWzOcDG6TnQOsBpzFBKVpIvGFQs25v7cBnzOVeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LYT4qnsyxafx/l9LYQg7BsWMfeGrcGwjTkvojDxY8FU=;
	b=GUQJBEPKfUhw5nEPQ7V+6S0DeQsWAVInDTQynZ3vIxM9Styw+ycM6dal+GjNPTrK97mS
	 ljErm40APAKDCr2rY+FIm+KYwpgvdDAwnGwHqauuRu6x4+un9o55vehaw7o370cVVifE/
	 EeT2Q1KEqnhpqV3lKauln8scNFIrcKFpr8TysHKEyehdhff8YhmIhWGwhMmBDzxwWBbpd
	 QsODc4Uecw6FAvCuQO2CrLNIoB53LNgov3vZmxgCoWHwfPJuG3E5BLECx2JcuypuMxmEh
	 KiW2WjfgjgrAM++QzWW07qwZDqKkZZjDBVGE5KpLFcBmVU9qq7xanIzy5cqhRGVNxwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PcrotLfm;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCC9606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECCC9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PcrotLfm
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9907fa1d2d1so465950241.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009670; x=1793614470; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LYT4qnsyxafx/l9LYQg7BsWMfeGrcGwjTkvojDxY8FU=;
        b=PcrotLfmmTQi83Yv+4DhfZaNDxthKJ3KBbDTPCE29JQJmXyuuxwpHHlbgE3/mQBJIn
         lMh7Aoaen0NCYH2LX0l5vheuBxkl6vt88c6iOogyj5+H6B5JnwKqlnaJC2cAsgivASkP
         j7+iJXzGlooYIPmFSk+mRmoiDCsxs4vcgKPQ0DXkId39yc3rvkOX7djQLRRoW2bsGc0V
         GjqDLgCPOeyg2xVxuTp7YW9LOqYOgS2pqasliy5Q07yqjEZTIVwFJh68WbIerCFkBWP8
         QQMj2Foxwu+WVWz35aTtgZ7Y90v+m4yfwVFIKxcUpk59LQ660inTZxaQLF4tfbls34O5
         xCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009670; x=1793614470;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYT4qnsyxafx/l9LYQg7BsWMfeGrcGwjTkvojDxY8FU=;
        b=FsFIbgyImH5M9ylf2mzb82Of1gE0Gm3S04vYiYp0wwzzZpFp5xIb9s7SEWO5sCFc+2
         6ZGDu8d7tEWIh2YMhsgNG98dsp5pZtDpg5TrgDMYQrALUAfZBm8CDUz1hNpi/bVM5ip0
         iHsADxLPm2ima0BmKltyAQqIlL3Y0YXHVg12ERSV7dOm6ff1mM/FFpJMhphztNPYCELT
         cf2TVEy/faGT7w16XEWJrg66ZUzXduEqaSEj7pJ3r0H2WQgXhkSFNqLP/rD+35v4YdC2
         1LEZd6SUwnnQt1PK7KqadrMG1csIyly3Iu9A35wQjmW0OIHW4qJswXu2MoFOGIeZuXaC
         nbCw==
X-Gm-Message-State: AFq9FYLAZ9ZqRPQpZ+FxqO81dM5qx/aXdHxE7airIILT9CxbekMt81lV
	vMJM8DN5QJKGdzKXfKBxb6ldBqNDnOQq4K0Td/aoQ3GtfJyDdHOJbnJK
X-Gm-Gg: AYBFou2C+VJ4TLizTt0e7YxG2kKP0N+C1dz18XVvVZGOb2kZ3jQVkq4bFyX4pkjmqC/
	jfsqReQgko6wkbO3Gi6Btm9HxXe4Ggs02TwZNZYtzZnQkfUxkLWGVOBYm3id1GAlCXFbmSeSF4x
	zaG1EvPJULwClSfRl04tnR+7P9JsKGjR+UX6pohz1A/yLrsvW5/rW/hVCP0tdSXVnYTBfFXhSHZ
	5Mlyrkxmv2vJG9xcqbAniQqAHVkO7UXR2dg+FMQmhcXSRevzE8JDSvONXr3xzwqBDBb9LO/TBsW
	ymKxMW2MzaTdlk7QjAGieImXWOjVwFR1qCV1UGTg0KNUz50EYzG+kVcyVF3YY1vcqH33zvkimMY
	SSz7yLWn8+nVXiWz3J9HEU03HyceUgKuunYqqcfPbdHQCuas4VEtofnrJZQnJFMUfspu9QDC4Mf
	ZdPBcOXyRejS8+LmODfmytUZZYTj3VKNixSr51qLWCW6cmY0GaULGS5DUjmyAS0kpkZefDPqZd4
	pL2YIxRFKDkIlwhp3cFBh2X2EukgU357Syn/EZGhik1bRppZwuryklfBy0r
X-Received: by 2002:a05:6102:14a3:b0:7cc:28a6:ee1c with SMTP id ada2fe7eead31-7ce5ca1e4bbmr1849285137.2.1793009669485;
        Mon, 26 Oct 2026 03:14:29 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234a940bsm7549112e0c.15.2026.10.26.03.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:14:28 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 26 Oct 2026 07:13:26 -0300
Subject: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex
 Capacitive Touch Display 10.1" LVDS V2
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
Message-Id: <20261026-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v1-1-9e8bef9b13ba@toradex.com>
X-B4-Tracking: v=1; b=H4sIAMYn32oC/x2OywrDIBBFfyW47oBa6OtXSheDM7aCxjATxBDy7
 5XszoED9+5GWRKreU27EW5JU52HuMtkwg/nL0Oi4cZbf3PWO2gOUArQqhCFWQPm0ZT+KAusVZC
 4gxaUAEgEuZECJV0ybgq1sZyA/n7lp+UYiMyYWoRj6ueN9+c4/vIXLsyWAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793009661; l=6126;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=u/Bc4IIPj0XbmMSFY+ai/Y9DOy3qq0yjkSExtBotmVo=;
 b=ngMwqUQ/9OTzcsZpCu5XUiDjMR13gCY0595b6OwqVq/NkcYBWAZmNTzQanHzpmbIfM0DI6wPU
 IKQK1q/A2iYC9tHaZUn4HP43EazzxqVp322urQ7zglp1IkpShilGAym
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
V2 on the Toradex SMARC Development Board LVDS0 interface. The panel is
an Opto Logic SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is
provided by an ILITEK ILI251x capacitive touch controller.

The overlay is also combined with the Toradex SMARC Development Board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
This change depends on other patch series, and should be applied after
it:

- https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com/T/#u

  Adds the other overlays for SMARC iMX8M Plus. This series is required
  because it adds the 3.3V power regulator used in the panel node. It's
  also needed for the patches to apply cleanly.
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 +
 ...radex-smarc-panel-cap-touch-10inch-lvds-v2.dtso | 98 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 1310b34178e5..94d39af8b8c9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -715,9 +715,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inc
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -729,6 +731,8 @@ imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := imx8mp-torade
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
+imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-v2-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 000000000000..0235aa1acbac
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch controller
+ * to J49.
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
+
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 0>;
+	};
+
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <64500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <20>;
+			hsync-len = <2>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
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
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_RISING>;
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
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+};

---
base-commit: 4aeb54e451181c68bb1135f761281b6391fcb5a5
change-id: 20261021-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-a273e90efcdd

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

