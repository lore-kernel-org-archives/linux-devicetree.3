Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B23549481B
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637472; cv=none; b=HaGLRpxZXFHLAz63vg9RJU0DoDR303OrIYEfznBsEPdn0NvHPsU6KZhvFtY1Bf+poisMFzpJPFQsEmVBqU1J0sHIJnzx20/dD4t5yf/uy0Wg8+dLWDwFSDRUjyRIDGwcq5DVYxxk0CDpzWi+XrdZnxsqdKvGkUK3msQ12xcbEX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637472; c=relaxed/simple;
	bh=DioRHXkA2ggKz9JpaI+F0DU/1Zgl1/PbwMwiWke/7qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdAWaB2EeCJgMMVQbwzHdwptwPuXbkDRuOPi7M+gf93Um4ogO/sgm9kMGyGyZsZSDzU6zgPXkZQX9tiXhQYPyg1vswiftjt8YNfbd4RjRXgbfYYFwUyvKqSJXWssXSVpqFFY/CLU2FXqoA1r3pPJE49xY1oF3GcYHASQ7vYHDK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOGZnos8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOGZnos8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49802c418b5so922135e9.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637467; x=1787242267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnq03KAWqgH6HH5nirP52bCCrm4Fj5p/TfEHastox6U=;
        b=cOGZnos86dsQl2GAcbYcTKmR/OY6zIPi7SMFzdMNQju3N3EdnivKd7sKCWk3flSUpP
         wRAEG8Wr4YPGNBmkOUgaCHbfXe0gQt9YUVWlHeaAAGIJOXmiVoGcvnTYm58wuuM+RsPq
         W97jiSn7fK9JHy1CZ23OzObe5wYqxgbXLH6BQR9QvagmFs4o1D6lgnXQ30dtB/E+T77N
         WqUeZb+V0Y4kNX0atcDdVqJ15i2bz9vaaM70t1jchHJ5lhhmVOcn1D9EBOLpAp3GoFvK
         6SbaGqR8xLajiKId97BJtiuyCuuashbjDv4NRSV0+Um4Xkv8iTKKDazM0dV4jUY3y0KI
         C+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637467; x=1787242267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnq03KAWqgH6HH5nirP52bCCrm4Fj5p/TfEHastox6U=;
        b=gLOSFyZfL7CYSD+IvZZ5hqgiGBZNRb2A3es2dXxvF3fLixRY/9Da0Ut0Lk/LCj13l0
         yEOkAm+cMk7IuYPDMuYiztZwLkXhTT/kcbfD0YpRD+OoLiCG4XtOk5cFJt47M141XmnS
         hNB/W1wxLVh0KFsiVuFQT0InszCVcihVwfAFtv4ggRc54pskGF3lYfMhfAqBjBvwJMro
         U9+QUCWyQvjKYsql7JOd/9MHYfhCWYN2vsgZMcs7MVkGkiLr/3LMx6xeUcXuZnXITMcp
         sKFXROt/cc8bplvuO3v7rthtMp7VvQPi9eObQaxfDh3HWmF7bckJ8+CGJ/+11LiGeNjL
         h1/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr+GhbX/xztSTFZzJnCbIyXCtR2SFdxO9E7xsJL/6mr/7xI1O/dAws5la8nA4I3Dk0vUvrJtcsfz+8P@vger.kernel.org
X-Gm-Message-State: AOJu0YwFHLT047mi95zYeugbiNBJZanOOgz8468UomQIOR1aZy+reVxK
	BDYedRoSfU8LFdvTtwgaegQ6gi4HOEFwTupCy0O1fP068iJ6uxDf+pqR
X-Gm-Gg: AR+sD10AjsGdAqPBKcenViF04Ndp5yDhyxLVUCc+gOUjK8XdbvEMrDvrvk142CM4Tkh
	1JlY93CFvkbiV+CfyHf7LPa8f2nz2ynSEVP4hljWP8TTmclruZQ6IS284GgF0Zq+MNbzAx9AlnM
	H7f9aZIJP7LOmPT5DgiWZxTrSh2rqO87mccvjwH7DSSQH3wVZCj6GPqecH64rbI1AuR4XVL3dQC
	7uj472gv8RbcNloi4MrI+Y5oI3NC6M7mJJLUjvxyMp2laXdk3uqcM0AVG5zl1AnIrx319rSaGq/
	8w5JTeskCjjOa9T4BDM2fAV5Dsv5xgXkrrYRdiEeKiUTn+F4ChHic4oF5rwIapsQ2S4kKuWzwQM
	ueK3RabRgylZZVsyVNlfY/54TwzeoLwEuBy9gxkDe/PZm2OD7Q/mHQ1rEYrF/UO9RvLhOTFffpi
	4YdtuSqtXc83jv0r039VecDkafKsX3WbEXJH3dhkviXe+KQXjt5BOE/pbe6dYjOBCDndUJIz7hy
	srr
X-Received: by 2002:a05:600c:8b2f:b0:496:c378:6420 with SMTP id 5b1f17b1804b1-499821a2051mr98698775e9.8.1786637467151;
        Thu, 13 Aug 2026 09:11:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:06 -0700 (PDT)
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
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 18:11:01 +0200
Message-ID: <20260813161101.2274327-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
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

Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI
controller registering, both PWM chips registering, the microSD
slot, the EXT_IO pin group still applied next to the carrier hog
group, and both hogs holding their pins.

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

