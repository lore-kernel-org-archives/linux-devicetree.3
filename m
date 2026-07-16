Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C081942D77C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227402; cv=none; b=aZKDy7kH1or8vcFuhrveG6dW6SLzAcrorrv16Ubt6BfXTZk0UAeQFmhpdvN1gWIT2Uzr/FONvqV6c2kocK6MaJO/rsB3Wh8/cMNUH4rdNBWE4WLJW0wzybz+2Z0/DQQDkJCEEdOGwjEyjnIV5MLUlO8ELA+ZLbszhbYW9QbdPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227402; c=relaxed/simple;
	bh=xza7Wob1GwTtX8Iw/nRFUmGU6MA6E8l7uMmwAShwG+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JiMXR5wNTFUxtQ+ABGH713oTxJkKHrwEelidYyWnK2Ax5giBvLTqycyx1UYNPGYDEKgky+qnueJ8cxG7Tls0UN1vtPqas/PMhoiLr+39xrs3FpXHO5AlWICoi7xKk7lGxAHmcGfwdlt62To3HBBuY9tt15QsC9b0GQSqIgtFpfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7vFT7/H; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7vFT7/H"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f60208a5so57995275e9.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784227397; x=1784832197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67zSFNzLZlVLDtB25uadYMFOipvoKKNbLkgSRU7ta/Q=;
        b=l7vFT7/HySuQZvuiTnIBw+jyqPvf9k42hlzIPRDgtAHQCd5mul9xye3V0pldVeLZKa
         G0+Ladt2YtlQzHwuMZLEPGCy3WQMOorGR66oeutB5ZbGZIrnJ5EkoaNSRoy1GLlH5N92
         PRH/ODvxg8ZJQSJvZxgMeXXDzoopvtiiRnv8mS2dxPyltcOFhAzkuKlx34fim4B1SFBI
         9ZyxNUGTF9G/wl0pQLDW1VA6w/3ugqcI8e4zkD3d3OC0KBAQkdsWRSrnkviZVzFVQCW5
         jBarSkSMRdbkVuQ8HOL/jf+aoqVOZ/XIZ/KhOWGghYTND++mr4s3RMOU5UUQPtlzHTq5
         lFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227397; x=1784832197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=67zSFNzLZlVLDtB25uadYMFOipvoKKNbLkgSRU7ta/Q=;
        b=jg5k75bl1wxLAL2WKqcKyUV0VswyW3Dt8SY8MzORkt9IVEfn49wVfj37uu7529RYRr
         FXSYJeMQdhvfGPZ8YN/fpv63MCOmi9fRm/gHnWg/D9He64kFrAs4ARgrIG7eEFksP2D2
         GBd74AkxRXSgCxfYJbxacg4be1wEtbM3l9RXJstHZQw4NyH8l5TzJbXq6YPPBBpmMCh4
         ntDTER27HSFnGgsVXNhtyWX7KXhddjRZrzBTDuzFvzqO5v6vWQGn7SIS9oG7Q/eVqKLv
         5BFIxvzEQIXQX5ykhLJOhbBhkBqOjbk4pQcaLlTWry4UECxxEhmOmSeZGD3C8cwZhSjn
         yyfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHBHFlWIAuc70McXvYETABh5m0IWrkD0uP1LUYksdz5cPBqOd7TpUDm4tMgOD1c36TityHRK1z40WT@vger.kernel.org
X-Gm-Message-State: AOJu0Yweh5sI/Lllop3t6qDP2mx50UrEpx/sEiQvpwnCr36v6geLqV3b
	xFWtNIWV70tp4Y76Rk92TDF/knDf70PtD2xf/G/xWFEqdqAxRYq+Enh/
X-Gm-Gg: AfdE7cnnYRRRQRQ77kb1pwy2G7giMiDjmjoZ4gFrpd1yQXPmlbHep4iMUlchWG3yrah
	ACIHmY2lEqFtc8I99TPeogGMfig6vhuOtSx1hlyTMqLil2uXHsC2nhsWVG+Zq/PHE1/dyFlVQR5
	iClu7s59Nmrff1lcm4dMFuxbansD+v5lhOaFAklEsOR407slijwQr9ajXcWcqR1dujWvyZb/Jni
	t5zOBISfhgVyELKaJWIAmbdq+F+0b+IN3CcH6imvfV1r86s8SxeFgY4wRqm/PeZb+t31+r40QYn
	V6sN78CyONEcH4O/spqCKWcPFcQmBWLPFpBw+kMf8IaybTMW7peSxLYMGijHKEgrDft7Rw1n84K
	OrxEQQFYCFjkVq1kfeZBRUmR5nXUn2w6LGa1criXcJ1nssuHbn7wYmJMRhn6TkBcBojcu0g==
X-Received: by 2002:a05:600c:4e93:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-4953c286bbemr98229355e9.26.1784227396788;
        Thu, 16 Jul 2026 11:43:16 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:b22c:3845:cef5:c42f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d799sm72404615e9.3.2026.07.16.11.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:43:16 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras
Date: Thu, 16 Jul 2026 19:43:01 +0100
Message-ID: <20260716184300.85413-7-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716184300.85413-5-ivitro@gmail.com>
References: <20260716184300.85413-5-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add device tree overlays for the Toradex OV5640 CSI Cameras on Verdin
AM62P CSI_1. Two variants are supported: the current CSI Camera Set 5MP
OV5640 with a 27 MHz oscillator and the legacy CSI Camera Module 5MP
OV5640 with a 24 MHz oscillator.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  8 +++
 .../dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso | 17 +++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi  | 72 +++++++++++++++++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtso  | 18 +++++
 4 files changed, 115 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f2db3c878993..8541e43d24b7 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -84,6 +84,8 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-ivy.dtb
@@ -277,6 +279,10 @@ k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-dev-nau8822-btl.dtbo
+k3-am62p5-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-ov5640-24mhz.dtbo
+k3-am62p5-verdin-wifi-dev-ov5640-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-ov5640.dtbo
 k3-am642-evm-icssg0-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
@@ -376,6 +382,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
+	k3-am62p5-verdin-wifi-dev-ov5640-24mhz.dtb \
+	k3-am62p5-verdin-wifi-dev-ov5640.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..1da6329065e6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Verdin AM62P CSI_1.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am62p5-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..f0430b1efcf1
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin AM62P CSI_1.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera: clock-camera {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera: regulator-camera {
+		compatible = "regulator-fixed";
+		/* Verdin GPIO_8_CSI (SODIMM 222) - CAM_1_CON_PWRCTRL */
+		gpio = <&main_gpio0 52 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2rx0_in_sensor: endpoint {
+		remote-endpoint = <&csi2_cam0>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2>;
+	};
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&main_i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+
+		clocks = <&clock_camera>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Verdin GPIO_6 (SODIMM 218) - CAM_1_CON_PWRDWN */
+		powerdown-gpios = <&main_gpio0 50 GPIO_ACTIVE_HIGH>;
+		/* Verdin GPIO_5 (SODIMM 216) - CAM_1_CON_RST */
+		reset-gpios = <&main_gpio0 49 GPIO_ACTIVE_LOW>;
+
+		port {
+			csi2_cam0: endpoint {
+				remote-endpoint = <&csi2rx0_in_sensor>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
new file mode 100644
index 000000000000..2e90aeb448b9
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Verdin AM62P CSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am62p5-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <27000000>;
+};
-- 
2.54.0

