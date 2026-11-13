Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584692;
	b=cNEqkHXzuMD33Kv/lDoyW+BILdzyO9LdXNpT1RxIilDN5Kr9KJ8YelBXwvapv0t3Ms17
	 O2jWo+ra5sSeQ0wQNbaTfVrftOayPEkuRGLhQQd06O966v8OjooZxy4BV0RjRxkiBKaE/
	 hSNlCFsT5jb89cUzAGG1nH8xMYP3wfk+hOpIEvpxHsTiDyTCzgSgJ9EjoPI9PSoawTc2k
	 yXP3Ha7NUcqIoaUPymfLym1Z8Ajkf3ro3dTPNCasoHbMOo8ifsXJz5w2d1WN4z5H+1GPC
	 r+ckt2q1mgPfOhPn3aIcGtUrjLhJXQENP/5Oeerfp1fHXK0CXCCJIyPKwFKUDVK3bCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
	b=jwS1w/793bOj9NDDoswbJgXFBzDvJgznoaKSLceed70G9u90INmS9jmfySQzQ/P3gfHN
	 Cp53D1l7ef2SFtWWz3r1VDXL7EjwmFB5oh5DU/VRgHyS+CsBnHGpi838M89v0dPfQRtCg
	 1FKjHh9/6QVe3jI8FYDEMlXRbFtiD8VCZhl4K8JVcE8iym/6O4hmUk3YtgmhjGeCgRN8X
	 8PR8tFsveUyilxQnvD2/D34bl91UBmPI3g0dJLuoymQj1r3vQgFgQJuygmX0vdeLgwSi4
	 bRQJIvbiSalLN0OvKf5C0hkC0vfv3UIi4NWkw04yCKYuJru6pwjzsqL8Ia6SCm7iEeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E79belzc;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0F8606A886
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A0F8606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E79belzc
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b32bbd39d5so8382047b3.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584691; x=1795189491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
        b=E79belzckzcp6rG3EhOHGtCJlnyOpt49fhRV4rexcUXpMot5duoPGEvOK2cvadQt+e
         Mckk7Eapwq19/VZCo5VHbr5To7PkRpwzESW+vKYXTFZcErIY86Q8Den00lraxwu1Idak
         Oy8NOAG38MZJ/KpD43zQlFUScsqZrCg/Lfw5h1HtO9lsRA4O8qGnBX74hBdig6wImcy1
         gzU/pBoMKUHvuCfOgEGM9lJBQu2wSVfE/OHpprt9N3rdMoHw2Cd1kSlb5pTxakIHBjfW
         DxfuJs+DSlZBD/QpqcHACha0MmS6R1l1V88y4jesrNTcorByNRc7xm2NG0228jd0CBWS
         4oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584691; x=1795189491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
        b=26OwNIrRkcR2MecW+9aQpjE/nC+nuN2JrEJfaPCwNEF7VpmPud4obbNZrCicJ12Epn
         WHatLHGOBvykdWxKFDnEFA6HvzgkuXpL8+RzlNZJ9N9pdveMP3U1bcpHvYwgiTDlZzHi
         9ZIt0M1aQ8vlNVwxacHAdxmbeK44SZHZhA8G60StAUuB2yzGuONSeSy/hUb8h6MBMDpG
         OHg0O5BzV9J5S04uQ8MSS6pblmUXx2tqq9pOjaVHN7J0J7DNvIPmNTh2E2pJvpVM4Yck
         AA9/OgfyssEbocoZ+93b05hHn7XA9bcxnbn5B2YYpC1u7K5T4jYWIOiIkn4rdSGzF6Kr
         HEbA==
X-Forwarded-Encrypted: i=1; AL+hErH5z8EVxmPAcbmkBhlGRSXyh6fPRiwGtIVQWR80sv843XJV7hbqY1uzi2M6Lqf3DB1K7sEb9VN/OImg@vger.kernel.org
X-Gm-Message-State: APuU4Z9xzT8t8V0tomn7piO2+UOjWr7oW0D9P1FaWUqURHaD/AeSZQe0
	tKg32RIGRCBlsZpcfPV4S1besFmZaRQp60BcL220QHYAAC6N28uCxVR/
X-Gm-Gg: AYBFou2AUv6bo0ELWCb+sTnvQPUmxISQEjgxmvUhwcOKQhgqjQeiQlHAtJuwCjyE6oj
	uohfZGHAuqTZHGSAJzWtkGZeiuFwrKWpX8D9ZHUo3s1wrxK8NlCBgdLe2Uql295UOS8ZowYNFYB
	hYys7xz6XPBTjeEIiIW6IL2rooNXrXCGOdZc0AbYKVMI6Ab/RFy+VsAKZ0mSXYfUQIvNyMGXjgw
	hI5YA141CwxBelxACMQZEertvHLnwIDOGNwyBnsH1zYfyHdnx/B2YOqyvMO2viD0a4pLpf0tJrs
	fqjnNALMrDI8zuA42wmTXiqPwzQ3GOgtomPIhyPfQGW9gMJT4D40fovJJUV/H8EEUVUp9Cykq3R
	DkZ9998arZ83x/HIqbIcP+t4m486CJXkh9jv9z435Sfq/Sr1aAKbTl5bXkeRt6Utf5TKr5NuEfV
	r+nELoIO4/lEYp3qRSjU9TMKaNBKzZwaJGB2vpqr9xrody7s8CTHMD2KQAWgO8/Fcrvesft1/Bl
	IaBsIVIBb6sZ2ozBO4WDhtSBGAwud7tPOWe7+rZOwhtxMhgIa++p7dAT3DqqLkWfB8+Om2zEXzd
	mJfRVSVu6ftpVBP5bRbDGdzD6yYZhI4o
X-Received: by 2002:a05:690c:e1c6:10b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b4aa352b0bmr14048677b3.37.1794584690765;
        Fri, 13 Nov 2026 07:44:50 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:50 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:07 -0300
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-1-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5076;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Tz5ERP1gVTN03h114IyqCZCKmbVPmIkPUTjRMol8SJQ=;
 b=wR+GtWb98MCONzVOGNbUDPA93mS4bj4kcZJot5NE7c145bcOglNZ86saT0GQG4JZBxBfB/aPs
 MpDCMjXDL1vDV2oWrh7/oK8mtUXQwPIjueZ32LyQJfdDqf2tNuswd+k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin iMX8M Plus LCDIF on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 95 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..79ba27665f4d2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -738,16 +738,21 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..9079c6284dfae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
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

-- 
2.43.0

