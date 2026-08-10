Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0922B3F6619
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371657; cv=none; b=d2KGG7ig5VPku6YvzCCwwKH+m38LG9qxptGAdpEFjVUqAUISyfklIUPBQYJm5BUp7qYfb56rvSoF66NEaC768thtpLeHD2YpGAGY8E9ZByW8YzwRj2tWfvp8IW426hIKFuzsXqUtguwmUN8gconB9g6dW7XiOG9ZSiS7ROfMa9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371657; c=relaxed/simple;
	bh=XDDiz/yiOtFtArn41FvfVWo2uGNLrJxECtnaVDV1qIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNzOUF8uK6GyH5bLfV/4cS1aH/iRyECp8zZgqQAAQbGoenlZeJkcAjBJVwf0UAPJ00zgvW+CQNuIPFt7nosBMlDKAcslb8ky06mBuDgyGlIatrtcbAuDyYFJTXJdmj20EiAo/7l61Jk1V52pCDItLZrBHrwLIAdRmEoP8qi1vzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8M0TYqc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8M0TYqc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so17427485e9.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371653; x=1786976453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2RxGy/HDr+ZHJEDxF0FWSRtIXjBooh011FJ3fxMxJo=;
        b=j8M0TYqct1K5H97dbnbKzLTeCtXKFa7i8wzjssVbJtIZKGQWB3sMu5EFTqlfd7rhPN
         OOrc6CnrGbF4g3JKVn/2uxuBR13S3AP/3/KjccT++Y2cDjmT9XgjsZJAXpnkzXCKV+ED
         eRkws6sOPXrmPc1dDTa26Aj/diII0M+MhpyGDR3iYNdz23GHXi7af6qI5PKy3CfxAeTT
         qt6U147cXqDKDHh9aKPoG8IcPCyGDX0SeHWo5rpGBAYI/z3W+BMcyDn78tp4zgURkG6L
         73zeA3LGC/wTTBAfp+PZhcYPY9qIMRNA81LKATdgdQ0IsDGDY/WSuBEv7jqh2dvL4DVJ
         ICEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371653; x=1786976453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2RxGy/HDr+ZHJEDxF0FWSRtIXjBooh011FJ3fxMxJo=;
        b=gy1zYZr37vx7UM2ShD+zVy4IYvb4OwbNXwu/l0OaxP9v85+gImrTYfPCVpDWTSvApj
         jgEAlLGl6WYN8ms3hXDrE8uW6AxQ7PbzFOfbqzLuEZ6YEqKKH7goIaLpfSPP5Dg5Gch5
         WISo71pkhzW+yXFlvvw9myr5u1JA5WDKZHCwVhLQqTgp/ucwaJRACrs3CjGsofo9lgmS
         UR54A5R9LDA/lTJTMYzMFXHareteNx+kT9yNM2eJONQEh9LthNBOsWcSPWZK7t4GoPFz
         LdNieyN1b0TlukL4i7RmPYntAceQ5AdIYyaW7YInhnE0USZPqYcFwSYP1vY50/oARvnS
         +Gcg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0+lv8oQmNhtVRTwwZFnJsj7zWuyGiPSvCcs8tSIgsh7ZRNNZF4vV9yk8OoS0yLdjgrARxPGujn8ke@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd4nu2TivMhsf5X+U6JtrXr62k4PCO3SCjMjmCh5PZjFC11Oj7
	tRiOQaoQX4q4SbNYH5du2vnPBp1dFEa7orcxNLRwa0M6XHaIRXZOLn7P
X-Gm-Gg: AR+sD11knriiz78KpmBfqGHVighUgXMsonbml3RPtVlIqqzY3kyCD616NH8RS+PGuOD
	6fbkDpc31GS9o1klcht+wS5x8F3ASt0RiJ6lcbW6N5oIJhqjcnVgao1wg1sWmTzHk2wnu8gFvLE
	BUw15bx0It2FOldJfx5lRTUEJIAfjBnlWMAa1RrnaIk3WZsvMoIViK8A8XRAOHiinXuT47H9RHQ
	eLDzyno2Ye/Nt1xHXoosF7rLO/5wmpq3Fk1+VocE/SOOfAsgjYw8YAV+2RMmlsdFk9ikhLKkphL
	Psdah/gZsjaB3hjd2P2Emd2fX5ODd0+07lywQSKu0kvf10C1/t/g13v2915imk/bMRkgBktJr8j
	+DXJyyBu4wzSluHNPUAorYlCy4OhC1C2lhWel+AZvQ8Jjykn/jdPOgOhwZx4eMyONi0qBit2HI/
	Bh/sSadB9kzYKJ6hJ3XuZwZQdwH/NLZhXI7T8u41jDa8xT12WufDoiAHR1aBI7kwdcTpAqTbLvT
	7otNQ==
X-Received: by 2002:a05:600c:3b04:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-49959e016f2mr400732305e9.3.1786371652873;
        Mon, 10 Aug 2026 07:20:52 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:52 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Mon, 10 Aug 2026 16:20:47 +0200
Message-ID: <20260810142047.2811230-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810142047.2811230-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Mainline carries Iris device trees for every i.MX Colibri but none for the
Vybrid ones, so a VF50 or VF61 on that carrier has nothing to boot with
except the eval board tree, which describes different hardware.

Add the carrier, following the layout of the i.MX Iris trees: a common
dtsi and one dts per module. It enables the microSD slot, the three UARTs,
SPI, Ethernet, USB and the M41T0 clock on the carrier, switches USB host
VBUS through a regulator on SODIMM 129, and hogs the two GPIOs that turn
the RS232 transceivers on, SODIMM 102 and 104. The touchscreen is an
add-on rather than part of the board, so it is left out.

This describes an Iris V1.1. A V2.0 carries the same signals on the same
pins; what it adds, and what this does not describe, is the regulator on
SODIMM 100 that can cut power to the uSD slot.

Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI controller
registering, the microSD slot, and both hogs holding their pins.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 125 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  13 ++
 4 files changed, 154 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
index 0a4a7f9..47be8bc 100644
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
index 0000000..d0fa107
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
@@ -0,0 +1,125 @@
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
+	reg_5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
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
+		vin-supply = <&reg_5v0>;
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
+	pinctrl-0 = <&pinctrl_iris_uart25_tx_on>;
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
index 0000000..53dd252
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
+	compatible = "toradex,vf500-colibri_vf50-on-iris", "toradex,vf500-colibri_vf50", "fsl,vf500";
+};
+
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
new file mode 100644
index 0000000..2882c87
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
@@ -0,0 +1,13 @@
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
+	compatible = "toradex,vf610-colibri_vf61-on-iris", "toradex,vf610-colibri_vf61", "fsl,vf610";
+};
-- 
2.54.0

