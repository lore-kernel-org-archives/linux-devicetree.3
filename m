Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B233E5A2C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524508; cv=none; b=CAR+rId9SGpNTfyz/ym4Ig6NbNlmeNyIH+6grFVRZ/d9T2/JlS1YpCJM2QXsXzLlf4XIW/UNv1P/KiSBxoO22U1V4U/YU/fcst7JRQosPH/iS+eO2eME3XOe8cfdfKZdJ3H81l3rd4/DWYwopU8/s9FJRdPl712XFJ174G6aqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524508; c=relaxed/simple;
	bh=XfXZkuAUf4Ix4pJzvlhSfT45QXt2G6McWqAlPM1v1h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tR2/3oJu5xsI09OCIe+igT1kKUSO8Y4dTekLM8hK+6GjR0fjWzOuFENzllR3sUea+aqWxJSk+bp7AAs37xzdrfFrGMN8iedzZId57tNt5Hqq9BpEKWaqFRe9D1de11fA9o2DrQ+16el573/4TLW6VR4CVXGjAMDmeZzgTJfftlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQVycLTy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQVycLTy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so21405475e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524504; x=1782129304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6QIs/iyDkxw/4mUiNrEZcKwtf0SXTUuKL6ddVXg6e8=;
        b=hQVycLTyJqxVbDkr501ONSaNb7k6ZdCUfXgfzh2xQcI9QUuJPMjcpRFP4/ryBcZ1vY
         hSsQFzj1fqsqUffa0hLSX9a9nm9AKaJTpENHYQUbVbXLoO8VtPd4ftyy3fIoDbUY5TyE
         vuITw6juQISdz2ct0nOHnXQTIu2RqaP64Fyv3GgQ4qNxARqPsZnHRklInw8iI7nS1nIe
         NwCT3zLAJuJtFMXVZh/BjttD4g/Gr+7Q1QvM+JD3sNusRqHOKElkrSjLoncA350e+dSL
         xYEnrqeEB4kN0QK5ZYZI6YnMDddHX4UdvXbOXj5btKRwYvJNwJjuChUtb6G2okJSI2Yj
         1Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524504; x=1782129304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6QIs/iyDkxw/4mUiNrEZcKwtf0SXTUuKL6ddVXg6e8=;
        b=Cv7w76tKPF0cHfZluFKM9W0QSFbeXmT3FpsHHL0GMMeAo8NLE6cs/XHGmynl1bpbbE
         ErmZrt0GR/xCe7aKENiDxhM8L9dFI3W14pm4BhcU4OgsInz2zkjMY8G611jA8UinSsDi
         +pbxjf5d8mcIfZkqSYdRs9EfHaPxmUrSnr6RlWH3lIplWhoP0QKzXW7qS9JQj42tA9v0
         1u/fNG/PGUWOJu8bMQckjARAxIN2YkZaFPYIuKRNbXMg5BCFiUMiQxGb51NtVsQ+6lXs
         /3SIQU7xwNCOAc1QxZoSWXDVUp3zUvVCZDrtyJUi0SyXPTfICPhgVWT0Q4ywFKY0v8L0
         1lpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FWxQm5hwa+jg3EikKZN2RzOqT/oQPbLBby4bVZYKJJlLOn8lYwgin4K3Eq/NS5ML13zQsuvu6XFdF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1W7jZ0XwGyGv6yDrVV0vPB5j2YwA2SowtlSI3MNrWHt7tmwUn
	T7SZYmHHXW1fr06UbEAuPMXRrU+fMJI/9EIS01QPrVzrsForw7+Sl2nP0m1EznVI
X-Gm-Gg: Acq92OHfCj3IHonvotkNsPcHAJIf6kCrULkta2RhNZ84J5xQ3m7XJproFS3Aykz+Myc
	VrWrXWkBi0t9tPRuAh9YC9OTd5I0bedkhgMqg4VKc0loxC4oZLEfGQZD4+SgjxTuQ86SHvBdXvm
	XZQrJS+r2HbnbCv1ufucFt/R03AceTsqsccTs+A4yZpUOIHK6wzm0JaqRt3RjJMthcDPBl34aZ3
	Z15sQ4oIyG4mNi427sApIHOsvNBeV2GnCMM3vNfRBFWYl7W2BcnHbeYqDuNSrq0YVhWnhZeHPpu
	HwUUcYnrJHyaOpfj8+qZhlUUnsLNGQUCooOdjRt1535BimKpyvM/YVh6yonUeu3QTBgTI9EXD81
	/7poTH1b0vRjasZgfHafadw3SlPUS1pRx5zOY+70k/QEerRjYymHMM0AyGHUPTAWJhBBb5M0zPJ
	Na4jlsCEygTuoLjb7qO97q8NcCLa5gUfxh6CpKTsOb1rPP8RrMYHfdYu97yf3klIxr66ZoC6ZRz
	Gv5DSWRi6yMlsPsQEJJvDqkWxxls0O+UvBE
X-Received: by 2002:a05:600c:8b16:b0:490:ab8b:1bb3 with SMTP id 5b1f17b1804b1-492200db664mr132669585e9.18.1781524504117;
        Mon, 15 Jun 2026 04:55:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:55:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with ADV7513
Date: Mon, 15 Jun 2026 12:54:55 +0100
Message-ID: <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DT overlay support enabling the DU/LCDC pipeline on the RZ/T2H
(r9a09g077) and RZ/N2H (r9a09g087) evaluation kits when fitted with a
CN15/CN20 ADV7513 HDMI transmitter.

Move the LED8 and LED9 preprocessor conditionals inside the node
definitions so that the nodes remain present in the base DTS. This
allows the LCDC overlay to reference and disable them when their pins
are reassigned to display functions.

According to the hardware manual, the LCDC pins should use slew-rate
setting 1 (fast). However, testing on the RZ/T2H and RZ/N2H EVKs with
the ADV7513 HDMI transmitter showed unstable display output with visible
screen flicker when configured for fast slew-rate operation. Configure
the LCDC pins with slew-rate setting 0 (slow) instead, which provides
stable display output on the evaluation platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Fixed typo in makefile for CONFIG_ARCH_R9A09G087
- Explicitly disabled the led7 and key-1 in the overlay
- Dropped comment about DSW5[3]
- Updated commit message
---
 arch/arm64/boot/dts/renesas/Makefile          |  6 +++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 40 +++++++++++++++
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 50 +++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 12 +++--
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 50 +++++++++++++++++++
 5 files changed, 154 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..e4a7d7ab5b0e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -216,8 +216,14 @@ r9a09g057h48-kakip-pixpaper-dtbs := r9a09g057h48-kakip.dtb r9a09g057h48-kakip-pi
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-evk-cn15-lcdc.dtbo
+r9a09g077m44-rzt2h-evk-cn15-lcdc-dtbs := r9a09g077m44-rzt2h-evk.dtb r9a09g077m44-evk-cn15-lcdc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzn2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-evk-cn20-lcdc.dtbo
+r9a09g087m44-rzn2h-evk-cn20-lcdc-dtbs := r9a09g087m44-rzn2h-evk.dtb r9a09g087m44-evk-cn20-lcdc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso b/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
new file mode 100644
index 000000000000..41c695325729
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay for the RZ/T2H EVK with ADV7513 transmitter
+ * connected to DU enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/*
+ * RZ/T2H LCDC configuration:
+ * ----------------------------------------------------------
+ * Function        Pin     SW Setting
+ * ----------------------------------------------------------
+ * LCDC_DATG0     P11_0, SW6[3]: OFF, SW6[4]: ON, SW6[5]: OFF
+ * LCDC_DATB1     P18_0, SW8[3]: OFF, SW8[4]: ON
+ * LCDC_DATB2     P18_1, SW8[1]: OFF, SW8[2]: ON
+ * HEADER_IRQ8    P22_6, SW2[1]: ON, SW2[2]: OFF
+ */
+#include "rzt2h-n2h-evk-du-adv7513.dtsi"
+
+&{/leds/led-4} {
+	/* P18_0 is used for DU function LCDC_DATB1. */
+	status = "disabled";
+};
+
+&{/leds/led-5} {
+	/* P18_1 is used for DU function LCDC_DATB2. */
+	status = "disabled";
+};
+
+/*
+ * Disable SDHI0 as SW2 settings for eMMC/SD card conflict with DU pin
+ * settings.
+ */
+&sdhi0 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
new file mode 100644
index 000000000000..17bc71380860
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay for the RZ/N2H EVK with ADV7513 transmitter
+ * connected to DU enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/*
+ * RZ/N2H LCDC configuration:
+ * ----------------------------------------------------------
+ * Function        Pin     SW Setting
+ * ----------------------------------------------------------
+ * LCDC_DATG0     P11_0, DSW12[3]: ON, DSW12[4]: OFF
+ * LCDC_DATG3     P14_3, DSW18[5]: OFF, DSW18[6]: ON
+ * LCDC_DATG6     P14_6, DSW15[8]: ON, DSW15[9]: OFF, DSW15[10]: OFF
+ * LCDC_DATB2     P18_1, DSW18[9]: OFF, DSW18[10]: ON
+ * I2C_SDA1       P03_3, DSW7[1]: ON, DSW7[2]: OFF
+ * I2C_SCL1       P03_4, DSW7[3]: ON, DSW7[4]: OFF
+ * ------------------------------------------------
+ */
+
+#include "rzt2h-n2h-evk-du-adv7513.dtsi"
+
+&{/keys/key-1} {
+	/* P18_2 is used for DU function LCDC_DATB3. */
+	status = "disabled";
+};
+
+&{/leds/led-4} {
+	/* P18_1 is used for DU function LCDC_DATB2. */
+	status = "disabled";
+};
+
+&{/leds/led-7} {
+	/* P14_3 is used for DU function LCDC_DATG3. */
+	status = "disabled";
+};
+
+&{/leds/led-8} {
+	/* P14_6 is used for DU function LCDC_DATG6. */
+	status = "disabled";
+};
+
+&i2c0 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 4e57d4fe195c..5176e620685a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -162,8 +162,8 @@ led-7 {
 			function-enumerator = <8>;
 		};
 
-#if LED8
 		led-8 {
+#if LED8
 			/*
 			 * USER_LED0
 			 * DSW15-8: OFF, DSW15-9: OFF, DSW15-10: ON
@@ -172,11 +172,13 @@ led-8 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
 			function-enumerator = <0>;
-		};
+#else
+			status = "disabled";
 #endif
+		};
 
-#if LED9
 		led-9 {
+#if LED9
 			/*
 			 * USER_LED1
 			 * DSW15-5: OFF, DSW15-6: ON
@@ -185,8 +187,10 @@ led-9 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
 			function-enumerator = <1>;
-		};
+#else
+			status = "disabled";
 #endif
+		};
 
 		led-10 {
 			/*
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi
new file mode 100644
index 000000000000..c537b2221fdc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay common parts for the RZ/{T2H/N2H} EVKs with ADV7513
+ * transmitter connected to DU enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
+
+#define ADV7513_PARENT_I2C i2c1
+#include "rz-smarc-du-adv7513.dtsi"
+
+&pinctrl {
+	du_pins: du-pins {
+		pinmux = <RZT2H_PORT_PINMUX(9, 4, 0x28)>, /* LCDC_CLK */
+			 <RZT2H_PORT_PINMUX(9, 5, 0x28)>, /* LCDC_HSYNC */
+			 <RZT2H_PORT_PINMUX(9, 6, 0x28)>, /* LCDC_VSYNC */
+			 <RZT2H_PORT_PINMUX(9, 7, 0x28)>, /* LCDC_DE */
+			 <RZT2H_PORT_PINMUX(10, 0, 0x28)>, /* LCDC_DATR0 */
+			 <RZT2H_PORT_PINMUX(10, 1, 0x28)>, /* LCDC_DATR1 */
+			 <RZT2H_PORT_PINMUX(10, 2, 0x28)>, /* LCDC_DATR2 */
+			 <RZT2H_PORT_PINMUX(10, 3, 0x28)>, /* LCDC_DATR3 */
+			 <RZT2H_PORT_PINMUX(10, 4, 0x28)>, /* LCDC_DATR4 */
+			 <RZT2H_PORT_PINMUX(10, 5, 0x28)>, /* LCDC_DATR5 */
+			 <RZT2H_PORT_PINMUX(10, 6, 0x28)>, /* LCDC_DATR6 */
+			 <RZT2H_PORT_PINMUX(10, 7, 0x28)>, /* LCDC_DATR7 */
+			 <RZT2H_PORT_PINMUX(11, 0, 0x28)>, /* LCDC_DATG0 */
+			 <RZT2H_PORT_PINMUX(14, 1, 0x28)>, /* LCDC_DATG1 */
+			 <RZT2H_PORT_PINMUX(14, 2, 0x28)>, /* LCDC_DATG2 */
+			 <RZT2H_PORT_PINMUX(14, 3, 0x28)>, /* LCDC_DATG3 */
+			 <RZT2H_PORT_PINMUX(14, 4, 0x28)>, /* LCDC_DATG4 */
+			 <RZT2H_PORT_PINMUX(14, 5, 0x28)>, /* LCDC_DATG5 */
+			 <RZT2H_PORT_PINMUX(14, 6, 0x28)>, /* LCDC_DATG6 */
+			 <RZT2H_PORT_PINMUX(17, 6, 0x28)>, /* LCDC_DATG7 */
+			 <RZT2H_PORT_PINMUX(17, 7, 0x28)>, /* LCDC_DATB0 */
+			 <RZT2H_PORT_PINMUX(18, 0, 0x28)>, /* LCDC_DATB1 */
+			 <RZT2H_PORT_PINMUX(18, 1, 0x28)>, /* LCDC_DATB2 */
+			 <RZT2H_PORT_PINMUX(18, 2, 0x28)>, /* LCDC_DATB3 */
+			 <RZT2H_PORT_PINMUX(18, 3, 0x28)>, /* LCDC_DATB4 */
+			 <RZT2H_PORT_PINMUX(18, 4, 0x28)>, /* LCDC_DATB5 */
+			 <RZT2H_PORT_PINMUX(18, 5, 0x28)>, /* LCDC_DATB6 */
+			 <RZT2H_PORT_PINMUX(18, 6, 0x28)>; /* LCDC_DATB7 */
+		drive-strength-microamp = <11800>;
+		slew-rate = <0>;
+	};
+};
-- 
2.54.0

