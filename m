Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308363;
	b=YviG+Jf6/gaMJZ9Hc/LVty5X4vfN66P1wrmnm4g+IF0m16CLIj5Bb1g05wcbw6ctiOTE
	 WKpPAkHhR3evQbsPpttxAsQpf6NKo0JHKZkQxjVsJYqiI7iOuULtQ5LQjwtb4qrFxqbyC
	 vEqj6HEiGwUJ7nk5JCyRmhN4+nypm9gr4AvJSqHUmtItAd8NEqdCRpGQzE//DHToFMJM/
	 Qqr4xg3B/9Qxe95lvtL2fBmoQzcuQeHxnRYnJXxkwQwxIQZA31fsILFzpxNLIKmB5nV0c
	 zizq+iM3ad0Wj1CQm0Wqi9Wzf+K4EhdIVgHmNegDwsBe8Xb6yPyKJWm2d5KMnJNCCuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DGkDAf1iwgLQ/ySGo4CZw9li+oraQecEr79Tmk1GLfo=;
	b=wrUyYtq6ZkNPA7JZ4kQHMJTaeZQWUbnJwpsTDt32+SCmI9Y36Sm8l+aIJ8t+oIYR/Fr3
	 AhHPpuExJUcnlt3wnD6a/rPqCxoOhJBhyv/X+0ODM0Zx5v89YAAllDuel0KFLqoAAemLG
	 1UmM388D0Yxj+znZWHPzR9dv/Xx9L5YvMaKTjNWyTv7oKR8Pt2whwGWaKWV9Q+XirKCAJ
	 3+2FMoY8O2Rzh6tbsdJ73xw5XVaX3DfLdcKb9r6OXQo6eHWhPyNx1BDO6zrFHATxhkcpo
	 jLFVw3iTbQUNIWzwvOPQbQSuU/5nrYZ8Byp0z8wLx6CUSKDz+D58RvhgOwW1sSH1g2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FhkQ69rn;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A060A2623
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 225A060A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FhkQ69rn
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4910b863b84so1139331f8f.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308360; x=1794913160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGkDAf1iwgLQ/ySGo4CZw9li+oraQecEr79Tmk1GLfo=;
        b=FhkQ69rnMGYvFxm1FlDscknXqbGZwUCtX6Oyxj4ckoqssL68KY1DLq/J6TZEssr1IO
         9jG/keoTf0yZlCr5So/mr85rbjyQHA9cHd+ZN11hDYSQo3elIBkna0jqUlOprrDe9MPZ
         qKshkmrlrZTQ0h2CvXz5UcwuQQke0zB6Qmr2wVw46HA6pAHQvaoe8IQbnexfraMU+u6n
         swecQf7bDJRrVBWH3Byo+ZXcJ3fK6BAOKNw9Kqo/RM+MnYWzdaKwB3FzwfFqZEy2cKg8
         kiDfW8l4c4bkVvNu3VWQZOkrEN/0riA/0t+U5eBh1IFJKvbYMCiGfgnLO+/pWXCo7MpA
         uqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308360; x=1794913160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGkDAf1iwgLQ/ySGo4CZw9li+oraQecEr79Tmk1GLfo=;
        b=dRQiuwwd+nZxkZiJF3hfA8ZqeH3iYfxp8Xr8XNI5FCO51LKG450S4869cbrAaWizhD
         ismzYromshYneaMBjdaEKAy3j0X3ayrsbU+7SgZNH7v0M5zbFiHibblBRmpRPBVz87cW
         NrIIAv0Ho05RgpUJzQXrLKJcxqdr4whrIgu0UhuVrBdfvlhD/YukCkutpVf4dmR0o/0l
         M/6anUhnPyKqDX7Ur7cEyXJK9Fl6XvCkjQnyK0g2GAL8QZGApA4Y7u4mMPASODXbs2Uv
         k7eDIjy/w9olkYlCCdpacJFY6KxCYqu7e2mEBnfHOd5HBwLffICCdsT/3eHe71Y1GvPi
         d/Ww==
X-Gm-Message-State: APuU4Z/Rlfh5dQaA3Yjki4mpKxhSllZCpKFvqhAoCWHk3lxn0JHZU+8n
	aYcgQS0SLbhXkPE2jiPXbbKUCSzKhOkV3YhxcGPq+rA/b7cB7H8KPGCy2tyx/2lD
X-Gm-Gg: AYBFou0wsl74OG5F8mrS+/YC541qVcQaa4cyX8NI2e6OvQzV66AIbrx7073UgUT1nSG
	gXA8IiCT44o49fCHcoJuacNi7FLHJvwOtPN0pHJNs0B7RQZ83pmsuxXGYEWOKwRALKhobrmEiHP
	7d7GmZ7yDZ1sXIsBc8Tynji2i6Y/tidmLa2cdNtH0ERGfKpz09oPYAxyd6LRR178P7uJj/Hi9Wa
	IK2pNFXSQTPBk5WdPBOMOKdkZFQbCS4KjNWKykORdk5ZuggC7zrObe0V/yhWYoguLwzBDpZnysz
	kuN6zbc4qYgVZHWyRg1EyN0XqzO/vMKrYlNJkAxiF6860q3yNj6Ujfg8Ok/85oKCEkDJikuekgp
	0QDi3TmZVsZtndFyr6fQoJUUoNwMC3mnTNI9NGfSwjHeQnkqLkTcjh+wQO1MGITtzLeD8a36aK3
	pG8PdwSRXv3SEsXqVFCLhN3zkg2+JVEEYo0CV9OphWZmFeTfGuVmSoULqo/yNojIBFdLwc4AKl6
	9+vaMGdMmHQR74YGWGY9gehPb8N4ITVsDtEbiJihrHFgQMu1zUMGXsZzrS2hG0S67XsAYUHgkHT
	yHTkD7NoL4y89KM0wOZJZv1IzkSCTIcYWQjVJ23Asl6T0Garup0JQE60ucOHbX18tDarLOVj55j
	yNH+/oQ3iz+b6q2hJtSerQPh03DvFtt7sXo/VE8VYzeiocAm6+Fs=
X-Received: by 2002:a05:6000:24c4:b0:492:b1c5:6db6 with SMTP id ffacd0b85a97d-49835e20e10mr4901092f8f.6.1794308360444;
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:16 +0100
Subject: [PATCH v2 4/6] ARM: dts: imx6dl-colibri: Add Toradex Capacitive
 Touch Display 7" Parallel with Touch Adapter
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
Message-Id: <20261110-colibri-imx6-overlays-v2-4-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4596;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=I2N4IIgnqZ9lXk9WuHPxr/mHiETXFvJEgNN5qC1ebNs=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JP5Qq813zeHH+b/w3uTD+h2SX1dV55ZZfJ774QKK
 9niWMHUjlIWBjEuBlkxRZaMJ6qCfAohsh4czckwc1iZQIYwcHEKwEQenGBkOJ4457apv9T05W2T
 9ANuCrDeOTsl7bXc4+aS7zHpZ8/3MDL8L9itFX4o7Ly6p1/cu+PNDJfa+Q94Ze+eV1BzsGnuHd0
 p7AA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex Capacitive Touch
Adapter, the connection to the various carrier boards is documented in
the datasheet [1].

The touch interrupt and reset signals on SODIMM 28 and SODIMM 30 share
their pads with the Colibri PWM<B> and PWM<C> outputs, disable PWM1 and
PWM4 to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Link: https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
Link: https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 7f527e2b9090..02d21d62b370 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -88,6 +88,10 @@ imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx-hdmi.dtbo
@@ -141,11 +145,13 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
+	imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
new file mode 100644
index 000000000000..ffc54438d33b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector and Toradex Capacitive Touch Adapter.
+ *
+ * Toradex Capacitive Touch Adapter connection with the various carrier boards
+ * is documented in the datasheet [1].
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ * https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
+ * https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
+ * https://www.toradex.com/accessories/capacitive-touch-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_adap>;
+	/* Colibri SODIMM 28 - TOUCH_INT# */
+	interrupt-parent = <&gpio1>;
+	interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+	/* Colibri SODIMM 30 - TOUCH_RST# */
+	reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&pwm1 {
+	status = "disabled";
+};
+
+&pwm4 {
+	status = "disabled";
+};

-- 
2.55.0

