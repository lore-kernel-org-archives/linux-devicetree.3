Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672813FADE2
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450004; cv=none; b=bx2yjrRVtnCfLNX5/ORpcY59Stbjo1pk98uKqnto6qVdHo0uBuZjL5mIT93IMlze/mPZn090IP+PY0kDuXx7s3gtUA2V6GqEc6lWbDsQMcKPT7/deSCagOI9NeJphsWxnuIVy8AZYfdyGQVoJ4MCMGK+4/l61okXQHu5tLgTZ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450004; c=relaxed/simple;
	bh=8qB+9iWMmtG/bUdEVnuNISlvjWZxC1V+Y5D8ZDAx+NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDI2rN5vyHWi/t4CO8EGwquiHcix1F35Ei5bsDzT4HXelFNlX7oLDmEmBDp2OKAcu4cl7W/Yvjzt44qCEkvVDpjZFFk20CebUOguv2FZcLxwJzYgi1YutHp2spOq3ql/9Xuq0oinIZ5HHW8wpSAiPZY7eF8a2Q2kGK+1pjGrj5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9RdLn8r; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9RdLn8r"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b48ac2727so1809697f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449997; x=1775054797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrlBOke3UCcCRXGtCiCjDm/vPc8qLCfIRNlITCApmXs=;
        b=o9RdLn8rwTP37Y+J/LikFRV44thRcXgxFpPdLLKnacbhTh83c5sgFvtY6pmz34rJpW
         G7bVyyulo/kIZovXh9Gl/Tjo0b2jFK0gukPfDsrefmwpYiyi4JfoTzuBqar4Bj2tUXaw
         OtNWc2Gh6pG+BpzLSBq7Fbmq8dRPdxLcvi06oxihiOQt6F9XpOnJp8tI0vLpVzVzVsPJ
         po0QPPIdHSrQQrgo3EpfBPFngad7BtD/sffvTE8ea6hNSCB1SkP7eeEFCLteY9p7jkwj
         NQeGWMpTv7EYzNObj8QGclXPXGI2S1eW7izQMA4Ca8lXbB0w2dDprjceDgF7FldcgoVd
         4ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449997; x=1775054797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IrlBOke3UCcCRXGtCiCjDm/vPc8qLCfIRNlITCApmXs=;
        b=pwMTBfPoUe3j3DH1v46Jv+kM+hSKC59+guPzYb7VzjS9WOJgMrbBt6Sh/9K4HfE9A+
         J9MG0UVqfRq+gZgcZKohf6d7NSNBrXEo3+sAlgBWdhTfcOOH9joZ22PfYSA5XRjd0hoy
         0Pfe+dqQ9Th+pibSqJajEEO1JuCj/WVmrBwoEQkmq6OicQTVHJQuQqWSTYynm5sX0pw8
         njmiUXhjef+VCTMIYyn8HCxYY0aCtgn06L9WFpIN4qWYvjYytIN7wcQsbnJR1oK9r/US
         fyZ0up/h36+DMb4l2nGnRJ69Qqi/Ek9z6hRUKSeRiclPKjakmCjF16Id+RjzOmQpa8ct
         /EGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzksYyH8t8WIHV36iPLWuvAN5T1FDbM35sqTG/bplntyLM1LdLqAE/Zglk+W9/fl9XDFZUK3cKN1NR@vger.kernel.org
X-Gm-Message-State: AOJu0YyL92uWbRSeGpuAYzedzm4iYKjSpXToXOUP3nCwTkM6H2FX2uUk
	3Qbe8r+wSaSMXHwJq47LDgn0Dux2qM/NKOq+Rw596MdxCFdB0VEJ46FC
X-Gm-Gg: ATEYQzxTUIArbsArHKKM/O0YccW2b3shdUWkvugDK110LzpjfrUPkpvwH+CCxyTHS4h
	zdznCqgGdgysPthsDBc3xh5OhlHh/rRjpGPdATkVwgWkws5mj9neDC9VbcXoFMWfxgRUr8rw9QA
	svhSBKSYRjh+4VqQmlZjNJXOuPImMVF9JWSO/du9LOrMhO4bxhr56WY4NhCrwg0dHnspHiBtyGZ
	lkKuD/408vbmUfoXPgpLNXqMbZ9vDtyRD/A249C6nAmBWvJlL3Ph7rP3PQR+/YKNDHB4BhQY2Fd
	sVx/YXlmwT1W6UIF6P3RA7I7PiAyUPY7WnjDUgmQ1BldfAMeien0NM25nVe6MJG7pg1UoAAU56v
	kO6HxmKVG0/sA0CRlmH683Gx7xGzzZ2jXV1JUd69PwMX0XB5NlYfH4YS6kiYtS4bYq2Via45Sv/
	WA+IqcCavxC+2ggEohBSHcdg+V5DucNW5wiPWjjzvGJieC9QNcCTW8713+/Wu6p+j7GsZ7dutqk
	5FCJqDs8ZSTurMCNon8t3uqeqo=
X-Received: by 2002:a05:6000:288c:b0:43b:3be3:9a16 with SMTP id ffacd0b85a97d-43b88a29212mr6080023f8f.38.1774449997217;
        Wed, 25 Mar 2026 07:46:37 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:36 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 25 Mar 2026 15:46:07 +0100
Subject: [PATCH v3 6/6] arm64: dts: freescale: imx95-verdin: Add Yavia
 carrier board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-6-b2b5221a8077@toradex.com>
References: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
In-Reply-To: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add support for the Verdin i.MX95 SoM mated with the Yavia carrier
board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/yavia
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: no changes
v2: no changes
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-6-823fad02def9@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |  21 ++
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |  21 ++
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     | 217 +++++++++++++++++++++
 4 files changed, 261 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 10417fc895de..5bee7c83a724 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -501,10 +501,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts
new file mode 100644
index 000000000000..4f7b4e3a518b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-yavia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Yavia Board";
+	compatible = "toradex,verdin-imx95-nonwifi-yavia",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts
new file mode 100644
index 000000000000..43d35b770db2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-yavia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Yavia Board";
+	compatible = "toradex,verdin-imx95-wifi-yavia",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi
new file mode 100644
index 000000000000..6403ae584e70
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Yavia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_qspi1_clk_gpio>,
+			    <&pinctrl_qspi1_cs_gpio>,
+			    <&pinctrl_qspi1_io0_gpio>,
+			    <&pinctrl_qspi1_io1_gpio>,
+			    <&pinctrl_qspi1_io2_gpio>,
+			    <&pinctrl_qspi1_io3_gpio>;
+
+		/* SODIMM 52 - LD1_RED */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 54 - LD1_GREEN */
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 56 - LD1_BLUE */
+		led-2 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&gpio5 0 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 58 - LD2_RED */
+		led-3 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 60 - LD2_GREEN */
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		};
+		/* SODIMM 62 - LD2_BLUE */
+		led-5 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+/* Verdin ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	status = "okay";
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Verdin CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>,
+		    <&pinctrl_gpio2>,
+		    <&pinctrl_gpio3>;
+};
+
+&gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio6>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>;
+};
+
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio4>,
+		    <&pinctrl_qspi1_cs2_gpio>,
+		    <&pinctrl_qspi1_dqs_gpio>;
+};
+
+/* Verdin I2C_3_HDMI */
+&i3c2 {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&lpi2c3 {
+	status = "okay";
+};
+
+/* Verdin I2C_1 */
+&lpi2c4 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75c";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin I2C_4_CSI */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Verdin UART_3, used as the Linux console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Verdin UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&lpuart8 {
+	status = "okay";
+};
+
+/* Verdin PCIE_1 */
+&pcie0 {
+	status = "okay";
+};
+
+/* Verdin PWM_1 */
+&tpm4 {
+	status = "okay";
+};
+
+/* Verdin PWM_2 */
+&tpm5 {
+	status = "okay";
+};
+
+/* Verdin PWM_3_DSI */
+&tpm6 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usb2 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb3 {
+	fsl,permanently-attached;
+
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+/* Verdin CTRL_WAKE1_MICO# */
+&verdin_gpio_keys {
+	status = "okay";
+};

-- 
2.43.0

