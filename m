Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002E64266AA
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693650; cv=none; b=Tz5J9NwHbnUbFTcqJS1ypUZARRN5OD5ZliH66olTndky3NArottefwNj8HY9Em+j4/4RsZyF9CG9/4WnuliLglBLI3rzP17Svykbseq58QdmFOCeJ3rDzfYjXdKArD4KMPab5Wfrbtk4KgV3lHawgMbA6aY5jdzl/RXGO8/NlrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693650; c=relaxed/simple;
	bh=f5NnwkOrDRb041V8ftQCBDxTGIfeya7uy4oY6FaKT+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4yJLyYE8ei/54FzEcjkpkEfRPOi3wrxMrrUe3khqNLh/1N+sSUs5Swgjsyw6jpo3i0urupVu368/DgOpoWkW4JMChQnY0zwP0ZPB6VzVrc7Hg8T3ELXZ9OQugEzAzBaE5cE1uDDC3FOfvk5odh1Ax3pmP20UePxqLU8lIZcifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCSq4UGu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCSq4UGu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4957eefd361so5177875e9.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693627; x=1787298427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIqdTr996wJo+UifSFBeRBtaPyx9vS29M6BGDKsTkQw=;
        b=JCSq4UGuVJ78xuklbrkZ2vx2sZWYluTgAzuTffptEuW8Pt1ti6l4Qqsv6Xd5Hr7eEG
         HwK448SwnaxgHOdTm2y/yGQzGBGhHgAV1XyNl+c3+bVwHUdssjaB3y0A+V9UabocL9pe
         jtM1bNF4JajbUaRvHRoqASixPgYxYU8F66J+XYWy2SnVjerVry7ptNFLZKdgnBROjLe0
         9Rnu/mNK+P39tjioSUtOBKpnGexUP3FTMIhFfyewQZTQAdyXyr+WkZ1pJ+OKiA7BO++p
         WuCNgPdbtjIr+vLuuGS5lQMBqUiTKYjYPLkoB0ksZHUO/GJ7HBgEPaAb/rHsDPwgnlPm
         HJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693627; x=1787298427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIqdTr996wJo+UifSFBeRBtaPyx9vS29M6BGDKsTkQw=;
        b=p58QtxjwT+HMrtC+WN8bzZAu7w00D+c9KMTOpKQMukDK3Ot6Jsxhz5+ADKcriirYtj
         V6YIHGK4lydwoXdnTz0ftU+CCgdfZ8VEYoJlzu5S+EonNQWe+i8EFZ3CZ1ltxzYwzz/g
         0HMKb2wLJFv+zwgJh5vFGtMIOe3nLpwJg8NBNJnr4bkuLERp8LV2yBYcG4O/MbhVrvNS
         /ftiT1aiRLEhpsSE09TLdelDwKkWjHmnQCsoKMkW3us3l2OqiWFRYJtTd+/uNtu9F3So
         SUxsBDFtnh2KSD5D7JfZ+7xLTM9ebZqeKj+ZmNvIavBJmSfWQaG0Dr7wTsyKZBk9muvg
         Mm7w==
X-Forwarded-Encrypted: i=1; AHgh+Rpov2ppRj6lH/Jnw5bWCSvpGDcdfIW8bmKH6U/6BUqVI9cvWd6tZcego5e8NTXwYe75ysIR8QsKkqJ2@vger.kernel.org
X-Gm-Message-State: AOJu0YzFGgEyFbq8EdhZnyUZTCgRG+T5jbjcCxkz3VV7qGFVSNBR70ae
	NX0f+oT2bK8gqiJSe8HOZGHgWwfE6TxMx84S8NFtTigFG2Aw/GH3jMlU
X-Gm-Gg: AR+sD10dU43tfIAMLPQgFWtSU2Eg7IpZnSw3/mKYZ4aC/q+lGqtUnZ6VtKlJTeAqQDd
	gHsaWedmpgA8l3/t2qn7c90uO2xQQdiWSngkaTH6gWFc3ADpAAK5KQCb5yH2DlJcT+N5z7aSGKM
	AdNG3VA5am0UHK8HK5LimszOmUJy5JUHw2JZvKqGROXZYtR3hJ4qhDQtwtdbBB/9jW5kuGp6oOG
	6j9GAl+i6lYejr2HX3bfcw28Dsm7K4f2+Mis68JwsOKiFaFsBeuBIKxe8i/uMRQYSeI1gSbF4id
	KNfir12l9yIRtzy31EoEAbPF7t12sZUSUGBi0YBB+n8CPvtdOiSLF4/6Cw82rGkFmBMy+6X4Vq7
	1WQuqC/Fm5k8TG7pDMyMU8b2Auu996thoMOdCQrGPNHKkjS6EYdxLYC3mppxGWBxj5crcBk355N
	1h/oie53xFKINqp15BEMFFCrQk3qeWDP9ymcCuhVrEO6RRLAF3Pf7HWM3E21zeV4SMEw==
X-Received: by 2002:a05:600c:4003:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-4998798db40mr40704255e9.16.1786693627220;
        Fri, 14 Aug 2026 00:47:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:06 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Fri, 14 Aug 2026 09:47:00 +0200
Message-ID: <20260814074700.2491256-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Describe what the board itself provides: Ethernet, one USB
host and one OTG port, the pin header UARTs, i2c with the carrier
RTC on it, the PWM pins on the X16 header, SPI and the microSD slot.
The host port gets its VBUS through a regulator on SODIMM 129, and
the two GPIOs that turn the RS232 transceivers on, SODIMM 102 and
104, are hogged. The touchscreen is an add-on rather than part of
the board, so it is left out.

This describes an Iris V1.1. A V2.0 carries the same signals on the
same pins; what it adds, and what this does not describe, is the
regulator on SODIMM 100 that can cut power to the uSD slot.

Tested on a Colibri VF50 on an Iris V1.1: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI
controller registering, both PWM chips registering, the microSD
slot, the EXT_IO pin group still applied next to the carrier hog
group, and both hogs holding their pins.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 4 files changed, 156 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
index 0a4a7f9dd43e..47be8bc318e2 100644
--- a/arch/arm/boot/dts/nxp/vf/Makefile
+++ b/arch/arm/boot/dts/nxp/vf/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_SOC_VF610) += \
 	vf500-colibri-eval-v3.dtb \
+	vf500-colibri-iris.dtb \
 	vf610-bk4.dtb \
 	vf610-colibri-eval-v3.dtb \
+	vf610-colibri-iris.dtb \
 	vf610m4-colibri.dtb \
 	vf610-cosmic.dtb \
 	vf610m4-cosmic.dtb \
diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
new file mode 100644
index 000000000000..36e34dd766ae
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ *
+ * Toradex Iris carrier board V1.1, common part for Colibri VF50 and VF61.
+ *
+ * The Colibri modules are pin compatible, so the carrier signals sit on the
+ * same SODIMM pins as they do for the i.MX modules, whose Iris device trees
+ * are already upstream. The two SODIMM pins below are taken from the Colibri
+ * VFxx datasheet (102 -> PTA12 -> PORT0[5], 104 -> PTD28 -> PORT2[2]).
+ *
+ * An Iris V2.0 carries the same signals on the same pins, so everything here
+ * works on it as well. What it adds is a regulator on SODIMM 100 that can cut
+ * power to the uSD slot, which this file does not describe.
+ */
+
+/ {
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_usbh_vbus: regulator-usbh-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbh1_reg>;
+		regulator-name = "VCC_USB[1-4]";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;	/* SODIMM 129, USBH_PEN */
+	};
+};
+
+&gpio0 {
+	/*
+	 * The RS232 transceivers on the carrier are switched on by these two
+	 * lines. Delete the hog to turn a transceiver off from userspace.
+	 * The pin group belongs to the gpio controller rather than to iomuxc,
+	 * which would depend on its own child and log a dependency cycle.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_iris_uart1_tx_on>;
+
+	uart1-tx-on-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;	/* SODIMM 102 */
+		output-high;
+	};
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	/* keep the EXT_IO group from vf-colibri.dtsi alongside ours */
+	pinctrl-0 = <&pinctrl_gpio_ext>, <&pinctrl_iris_uart25_tx_on>;
+
+	uart25-tx-on-hog {
+		gpio-hog;
+		gpios = <2 GPIO_ACTIVE_HIGH>;	/* SODIMM 104 */
+		output-high;
+	};
+};
+
+&iomuxc {
+	pinctrl_iris_uart1_tx_on: irisuart1txongrp {
+		fsl,pins = <
+			VF610_PAD_PTA12__GPIO_5		0x22ef
+		>;
+	};
+
+	pinctrl_iris_uart25_tx_on: irisuart25txongrp {
+		fsl,pins = <
+			VF610_PAD_PTD28__GPIO_66	0x22ef
+		>;
+	};
+};
+
+/* Colibri SSP, on the extension connector */
+&dspi1 {
+	status = "okay";
+};
+
+&esdhc1 {
+	status = "okay";
+};
+
+&fec1 {
+	status = "okay";
+};
+
+&pwm0 {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	/* M41T0M6 real time clock on the carrier */
+	rtc@68 {
+		compatible = "st,m41t0";
+		reg = <0x68>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usbdev0 {
+	status = "okay";
+};
+
+&usbh1 {
+	vbus-supply = <&reg_usbh_vbus>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
new file mode 100644
index 000000000000..aa91537cab37
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ */
+
+/dts-v1/;
+#include "vf500-colibri.dtsi"
+#include "vf-colibri-iris.dtsi"
+
+/ {
+	model = "Toradex Colibri VF50 on Iris Carrier Board";
+	compatible = "toradex,vf500-colibri-vf50-on-iris", "toradex,vf500-colibri_vf50",
+		     "fsl,vf500";
+};
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
new file mode 100644
index 000000000000..7db5aa490966
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ */
+
+/dts-v1/;
+#include "vf610-colibri.dtsi"
+#include "vf-colibri-iris.dtsi"
+
+/ {
+	model = "Toradex Colibri VF61 on Iris Carrier Board";
+	compatible = "toradex,vf610-colibri-vf61-on-iris", "toradex,vf610-colibri_vf61",
+		     "fsl,vf610";
+};
-- 
2.54.0

