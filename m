Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1333DFC8F
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009699; cv=none; b=UwiX9WkBrjtNx9M/7oleiF8MEwh46se4ruCHgm7K62yFxK+XeCYQv7rlan64XaSkwfVTxh9kSIlFMG4bdzK40wJ94H8sD8t9tWiG0hDtKWB3BphlF0Fap5iU/0Yy8sFzbeWrBKUdh+vKSgt8ZvNPOuLm+QMQL4UnK3QZrNTSNro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009699; c=relaxed/simple;
	bh=iz03Z1NaE44FQhbRLk2qmAuM3AGwtExdDUN1CNs5vEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pP5SS5o20EeyjmosaRlPqMcMR6mgl5K7plEHMGFCgHPmU6OrTPMLrTk7BfiPLRZjnyuAneY5DrfGQTVo7YTD+SS3u4OujdSNBGpudNskroGETpHGps4YMVcfE6KUdNLmG6vfByUDXcQjGdgxsAypNuDMPi41fQsJNd9xl12cUP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPRqVMpi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPRqVMpi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso28879125e9.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009688; x=1781614488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAjB1VHYXFjETydFoOxS7JGYlIYDv3A4wa5H74v2Xx8=;
        b=BPRqVMpiKANUeAZnHNS+bTuwX2GJ6FlRTEEpnUqZxLsQd368J/krTUY6dwc5aiUFOi
         UfivklJ3MdEDORYpmjecFMrrSq9ypoeOEypSnxakPRlZllx+2+SqSuVvsMOZatzNMij5
         pNuss9wGlfenmx/0UvCJx8MaznKVGsdYxz8HZzZiPH43qqzSvWy4ueAkuTeaamfMolbE
         d0QAV6b30DrzPJq22pAYNE4YZRUadBybi07wktq48zdinB04KcKibkyOG1LP4lCjGr8A
         T6aJ3G3VAY/dfkW1ltutnovcHRZce1Jonlba65QFjam0U4ni6Kir11DVLoK0H7WCbqp7
         RdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009688; x=1781614488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jAjB1VHYXFjETydFoOxS7JGYlIYDv3A4wa5H74v2Xx8=;
        b=ELWksX1m5I3XS6mQUiyQSRngT6BmPYHraSRqkvZcZICOqPUZLL9rAG0iZ/KAIEb2cJ
         XucDsAzkkMqZH93kp4DuIvn3OVyeOeuTrxHmQmAdlj24WnwHbm6/mokhuwdqRXPTg5Nq
         Z1vv9+cnSEMp4yalStUCFNQqrZAscDJgQcOqv/VGokLD4xqxDkB9EjhMD98WA5uE+iwR
         WtKpGZGpx4ctJ3catXBS6yPsSPUdrIQzdo8jZfd9RJWfKxmjXvqABtNWojv2SpTo1x45
         i79uzdGX/yLDoSh/v+pyy7pXqISB7njEshzuDCmIx5vcICeguyAixzSnHbiB37T+u/r+
         ev4A==
X-Forwarded-Encrypted: i=1; AFNElJ8xN949K4ZXpVKjoTtdZXeu8Ucerlw0Z/6NEk95/4xH6KXCXW8gb9ZqQOWSpFY7qBGf2c8Euwmg8MOV@vger.kernel.org
X-Gm-Message-State: AOJu0YwJWi2AHRW/I/IfMsgf2HdVidDTZlyScygUuoX2cNs5Ma5OZVcI
	Mr+2l1J4ev6oU/MdmmdN8/t+uOnjHvOe3CJERjtAiMvTzcVNr5KgKHqN
X-Gm-Gg: Acq92OFDc9c3hZiAGU7KVR8A+vQPz1/xUq85yoVz4Q8nza1K4ODLP2VM2/GvsiobMVt
	uKWzDhTZmzJj7EpiS+7dh8vi0e7fDmJwX6URGfobcY9635EuSKj4D0u/mtmONlfK8ijLvZXPjUH
	PAp1dZkgfom/fY1eCPsoRWcWjz/wZMCFvhlK836P3JUbUdwsnq5afGXuX9qBbRqMtK1xdoGdJYF
	qJjRQFh29iPYqaYAgqOeai7GYz/o0JzNbGDP4Q0e1LNtN6OLuRNOscQyZ2KI2mHeTJ2bPtXhCe3
	H28t+HAq6+UoI+XGS6eKfmMxvcvitKREAWd2DpqcJyzNDUnzCwR50UtCbFh0mYahv/lKR/9q91v
	cqVLOiw4H3eUN7xhashLWbDBxRYZ4trxSzMYYcI/BWPZfp4aegLbSEwy3kofVQ54fTQeNhH4VSy
	IheR0+FqPJYDNle/lo+Vyk7lwE+4vLR/1HGWM/Jz18F5aqF3Ijpz939zSKv0FdktPaxCio9Qs7I
	ypEX/av6+2QZm9hni2vUCuEcKoKUonil0QGpZOOdpecUj8njFA4iMgHiA==
X-Received: by 2002:a05:600c:8010:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-490c2cba8e7mr261351355e9.4.1781009688151;
        Tue, 09 Jun 2026 05:54:48 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:47 -0700 (PDT)
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
Subject: [PATCH 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with ADV7513
Date: Tue,  9 Jun 2026 13:53:53 +0100
Message-ID: <20260609125353.401124-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, as per the HW manual the slew rate setting for the LCDC pins should
be 1 (fast), but while testing on the EVKs with ADV7513, the display output
was unstable (flickers were seen) with slew rate 1. Setting the slew rate
to 0 (slow) resolved the issue.
---
 arch/arm64/boot/dts/renesas/Makefile          |  6 +++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 40 +++++++++++++++
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 35 +++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 50 +++++++++++++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..34a4ef0d715a 100644
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
+r9a09g087m44-rzt2h-evk-cn20-lcdc-dtbs := r9a09g087m44-rzn2h-evk.dtb r9a09g087m44-evk-cn20-lcdc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzt2h-evk-cn20-lcdc.dtb
 
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
index 000000000000..bc8a91278920
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
@@ -0,0 +1,35 @@
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
+ * LCDC_DATG3     P14_3, DSW5[3]: OFF, DSW18[5]: OFF, DSW18[6]: ON
+ * LCDC_DATG6     P14_6, DSW15[8]: ON, DSW15[9]: OFF, DSW15[10]: OFF
+ * LCDC_DATB2     P18_1, DSW18[9]: OFF, DSW18[10]: ON
+ * I2C_SDA1       P03_3, DSW7[1]: ON, DSW7[2]: OFF
+ * I2C_SCL1       P03_4, DSW7[3]: ON, DSW7[4]: OFF
+ * ------------------------------------------------
+ */
+
+#include "rzt2h-n2h-evk-du-adv7513.dtsi"
+
+&{/leds/led-4} {
+	/* P18_1 is used for DU function LCDC_DATB2. */
+	status = "disabled";
+};
+
+&i2c0 {
+	status = "disabled";
+};
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

