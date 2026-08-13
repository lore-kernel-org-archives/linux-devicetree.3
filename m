Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030F7481FA8
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629969; cv=none; b=nUQMrZNtzhYxwg4OvzunwYgSnOJy7ehRGJJMrMPAf3o/gSCjee2ppOVd1XfI4qb6LCt9Kc1HLzrD7fBjQYRj0RkKmMdWp54fs30avArh6KDhjW5ALZYHrSvx3xsz6a4d0bv1QBPwy2A772X/s8DSK1+mta+3fw3vJmyv0giweok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629969; c=relaxed/simple;
	bh=3P0hTxBPlIVGfm7JhVqutkG6EvodjXP4bnv3k8hoKqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTSzctw2SXEIhOoKCxIFFeR0Qc7Or2xpKNPC+Pni5ucDU1BvvtrYq+JGfEsoircfiMczzJgxMekdqojbNguyfj5HYCr+y1b9kv4sOdLjNg8Ob0xjqpDSXgyzgYnyVZAI2Mosf5QAX26N3LdOP6JK/olrJWUSd/OiK7E5IUjYNl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPG4d8Ef; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPG4d8Ef"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fe377a217so1355461f8f.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629966; x=1787234766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGVXJHdeFlybbXZS8ISeiKQPBePx7KulAfQGxVyoFuI=;
        b=LPG4d8Ef72C8Unz3a0Rzr2IPmElgSvpVUdHHMsskqt5+kh8Z/ABiASJAx77n0XyGW2
         EsfgsbycZEkshzKYCnjgu7+Ed3HAg/LiaYCjTcreb9+qlAJxwqOy1+McA0P+0u5OXGos
         P0hsOSlXOzNr6sAv1S+pFbwhUMI14Z73kxpF3iF/ouYnUak7igV8YJA+wzYcjE/5baCb
         dfL/6D4ZjdPrjaSaPWwE6o9K5QF6vz3zyoiVkw4ENJ1Q4SsBgdGmVV5P1X+y/4sMytNS
         /DR8QDEPowGZtYWNBcrk6jKxUWgr4KtDr+meKs7t2Z7k0MdCl9UrwvUIa0proAOhmOnD
         oQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629966; x=1787234766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGVXJHdeFlybbXZS8ISeiKQPBePx7KulAfQGxVyoFuI=;
        b=FhOMYgd/XI51tnZI6UmuZwp/n2Z1FkrRQtrR7dEvwe8jdvn5gfOL3Wy0SxUA1l3Eqr
         JZb6wzh71A5VAgEdkC6qmpqnnCvwFZKn8ZGqW+dC/NvxQUxGadd6QI6gpK/SDNsqyiWM
         XwII4SZhPoPBupr250bYvEd9AGaYnsO3N3WQSkrUBIdz5OL8hSZI1f7rH3+pS0Zt8LVt
         zlnB03jhKk2ElwQqOZ8RG5i8OxfTTJYJhZg1gjwROVbYGRHYSoz8xcBinyU7V4Lj+vY7
         CQIM8zSlYX9dk+teLRqia96vtAv2ed10lLIQ4RZ36PHnLam4MBg2y7yJhRdxGJ2Y+AnN
         zJCg==
X-Forwarded-Encrypted: i=1; AHgh+RrnHXS9pVbo2Du3Qe+oa6oc1JPoO9OXUYbdHFMtxUJDbgf6Lyouh9HDt7Zct2Vof97PTjHF59t3OrVu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1WXY0q2Z/Ge2VMKLBIwInIq4zWLtgCuBdJ5EPkSzZlwaPaGB8
	JUHVJcMyXXpbJsDKNCk7rBEoMqEK0TkW6GrnAxngds9ut9Wn5k0tsCoq
X-Gm-Gg: AR+sD13lWklFW0abnahoreWdgm8Lz1L4ZZpxEd9ba3aCmI27RimbyUUmTt/ihKhgWt7
	rxkNKasCQV5SVpg6QHC/szbDprOVKuaFSwlhP58yz3oVg7zgD1FVamGhWMfFAL8zp1Nq9at/hAs
	onG3qYAFeH2hnUugQCTGzgc6eg44Frb7fdQQPsnIbPfRTkEMoto4P55f1fZOqhD5+CDz3BVmT6+
	+6DwhRMYyIKOxhkC6rx7/aM1lCwppg7zQl7per0m3XyM6CcEg4M+pP14V52KIGZkufcjAAF1YAA
	6pSk2i/1MbOz+9bCui+UtrWWaT9ve1/OoxGusD3xRnjZ/xvcqNJNGM/X7GUaKxIAUrbbD0A1zdo
	jBL5k4QnOXlsJIZRSbpa5XbuJFJleHO4S4yUPFXKAoA4mRNHjlBXxijJalsgBZ4tIj13EI00ojD
	/91CPdX/Vob/g55YKBWC1WOnPVcQ3vREKr1NUPPgdU/xsrkloAF/XBZkp14YxR1mQ3tFB+G2uJF
	Cc+
X-Received: by 2002:a05:6000:46cf:b0:47f:9447:62bf with SMTP id ffacd0b85a97d-48159c90a2dmr6604624f8f.2.1786629965802;
        Thu, 13 Aug 2026 07:06:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:05 -0700 (PDT)
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
Subject: [PATCH v3 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 16:06:00 +0200
Message-ID: <20260813140600.1824949-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
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
RTC on it, PWM, SPI and the microSD slot. The host port gets its
VBUS through a regulator on SODIMM 129, and the two GPIOs that turn
the RS232 transceivers on, SODIMM 102 and 104, are hogged. The
touchscreen is an add-on rather than part of the board, so it is
left out.

This describes an Iris V1.1. A V2.0 carries the same signals on the
same pins; what it adds, and what this does not describe, is the
regulator on SODIMM 100 that can cut power to the uSD slot.

Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI
controller registering, the microSD slot, and both hogs holding
their pins.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 117 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 +++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 +++
 4 files changed, 147 insertions(+)
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
index 000000000000..bbd0dd76c33c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
@@ -0,0 +1,117 @@
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

