Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917B3F0A98
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352630; cv=none; b=YZ+ApnmDyWS+WK03LoAJvyTsZtJGgFCL2qnsgQPENtqEUdNGPjUogjGgFIiEFSuz3ZmsLminqDGTb7Xaw3eZNyiGDeViiu5bCZDwUDhUEncnfZBGrVS5b2u6bFbsaMsZR8ZM+UQg5RTer1AoyHjy5HB1h+ibx04PIuvyJ+ziaYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352630; c=relaxed/simple;
	bh=Lnn49v96XY/Hxt3uE4+O+/jQ9EbPWOlwwrgs/kb6AVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUwbDtfKEOymzbE5oms3lhzKz1Bp+DfxKxPbo18a4a+kr9uKeLsuE8LKtsCGZskyZ5ugiNKC6Wp/JhV31Oi+TixKQSysQlPOydXHYIZpBzT6IZMYFfYL/5oBlbZIiCT0CXVKJbS60yEnFxA+upSCvxpca5h9fCHPtjmj5s/AE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqefnJyO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqefnJyO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so13128505e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352621; x=1774957421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VDtEY0KCBGldtzOkCdj9dHnf0Q5b14Fvyj2LQroMxU=;
        b=dqefnJyOyrOWcQ8/4gaGS03nX+pD+YJkyWl0lCw7FF6YaOWqsaz0z9Mfx+dExa1OBK
         ZD8CFcGSZccRNBQHLRyENBbllqsF5Fq+XvChqFAYoYRTwENmG6LtWoLkjFLINTeL4abV
         jtnQ/F51UYAemRH/ITQGAvzJkM24KCpcd4K5MLuOD8kxV3V38jC7ISgr/xuwqa4qPyaW
         +uByH+U1ozMpxANxavN6qShlfDuQr0DYhQJIi6/u4Aji00QJZEH+PRZlccQ/fohTX6tt
         cpodh1Gs6A3pSEoofmvPhu/MpZVgUlo1nvSDNb6Kv2q2jRmK+zo99IbIVqJDK3s+Hqt/
         FPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352621; x=1774957421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6VDtEY0KCBGldtzOkCdj9dHnf0Q5b14Fvyj2LQroMxU=;
        b=gV7IeG/on9z7994cmszCmWtZWr7zHgINKS9qTb/aDvNntr9ljZaNEgjKGspDWEULHt
         ksObUkiWTifI4Ze0iKWGUTR6HDOFSVcAMVccqRs/kjYqD1suqUsgOgGN3fvPbMr8tFsy
         aQLEZCgBVNF7aEMyUfrpyPSg0+wptx1V6sQYT7Ue3Q0fawriq0DxHf9JXlp7BXTMFDsp
         EoC+kBbn1BOFkaZlS8FLmidje0gNxrvmmM3NhJJi1A1QweJwY4usC7OfSrJCRpVH8vEt
         aAHC2qrx6klA7JrVeIwOHIHOwzL9e2G/FJc01ugdhvPAKzXlVofhbFkLH10okjRogWD9
         PB8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNS4ORLjqLBxtUeNn/HKWupIPCl2vLfBJDMYN2CI63rYYe5GYamZ3vo1ZP8rulv8tQ0g/q0819Hc55@vger.kernel.org
X-Gm-Message-State: AOJu0YyQLxwJWf7FfqV1lXMF7uRNsn4osB7luYMjHQ2PE1QgHxyB8HSg
	5gNzuiIvuWXUet/6ASPEQYD91a5J2IxcmD8RdJ/xIR+MNI2p1nZgUNaY
X-Gm-Gg: ATEYQzyCWT8fWSCxc74lmDZCnaJlWo7WobYuhioAx3Tz2oUoa5e/ffp5yAM6ItVF0VY
	Vx8tS3Vx61JHjNqWZa7lzoBxWdAYRzHrC5CpyxTVjCii15x9DI1xIOunaPtnO9Cm7enk7/VHG4W
	f50PVdbV2m77MR8DRViIJ8ulVyFofOw95vsAD7QqKBG0kEiYuTQZttTWVIj1Rpadw+dWetXs++c
	YgU4RpXDMmUsLp6Y15h3kBCSDNhWgHrTOwkgPFlsyEcWbYxvFVVDFYzTY8L89sMgjuJC2NGltcf
	VZgO470OFN5TszjQRA2I8X0SnZJjJt30tVe7nhvcmP/BYel+21KGeGMqeYztl6gSR/AMBiL8EsW
	fEXTmADEOZngYEuhS+j0c1FQQ0BRvU/ZS8CQ1uk8sBLzxhOph0QMe9V1ydWbSGlHsialFA5yKFt
	kI0vhA0d4vK7ymOqYx7b3pTwWZDmb6j7q6M5OP8HKZ9uY5UrzM
X-Received: by 2002:a05:600c:3b07:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-486fedab1e5mr211216895e9.5.1774352621254;
        Tue, 24 Mar 2026 04:43:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:40 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 08/11] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
Date: Tue, 24 Mar 2026 11:43:13 +0000
Message-ID: <20260324114329.268249-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the initial DTSI for the RZ/G3L SoC.
The files in this commit have the following meaning:
  - r9a08g046.dtsi:    RZ/G3L family SoC common parts
  - r9a08g046l48.dtsi: RZ/G3L R9A08G046L48 SoC-specific parts

Add placeholders to reuse the code for the Renesas SMARC II carrier
board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Fixed the typo RZ/G3E->RZ/G3L in r9a08g046l48.dtsi
v6->v7:
 * No change
v5->v6:
 * Dropped dma-ranges, bus-range and comment from the pcie device node
v4->v5:
 * No change
v3->v4:
 * Fixed typo R0A08G046L->R9A08G046L in commit description
 * Dropped R9A08G046L46 from commit description
 * Dropped unused audio_clk{1,2} andcan_clk device nodes
 * Reordered i2c device node and updated reg entries by using lower-case
   hexadecimal number
 * Added placeholder in pinctrl node
 * Dropped unused DMAC device node
 * Added pcie node with placeholder
v2->v3:
 * No change.
v1->v2:
 * Added external clocks eth{0,1}_txc_tx_clk and eth{0,1}_rxc_rx_clk
   as it needed for cpg as it is a clock source for mux.
 * Updated cpg node
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 212 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi |  13 ++
 2 files changed, 225 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
new file mode 100644
index 000000000000..e030e785ea2a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G3L SoC
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/r9a08g046-cpg.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r9a08g046";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x80000>;
+			cache-level = <3>;
+		};
+	};
+
+	eth0_txc_tx_clk: eth0-txc-tx-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	eth0_rxc_rx_clk: eth0-rxc-rx-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	eth1_txc_tx_clk: eth1-txc-tx-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	eth1_rxc_rx_clk: eth1-rxc-rx-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	extal_clk: extal-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scif0: serial@100ac000 {
+			compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
+			reg = <0 0x100ac000 0 0x400>;
+			interrupts = <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF0_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF0_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@100ae000 {
+			reg = <0 0x100ae000 0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			/* placeholder */
+		};
+
+		canfd: can@100c0000 {
+			reg = <0 0x100c0000 0 0x20000>;
+			/* placeholder */
+		};
+
+		cpg: clock-controller@11010000 {
+			compatible = "renesas,r9a08g046-cpg";
+			reg = <0 0x11010000 0 0x10000>;
+			clocks = <&extal_clk>,
+				 <&eth0_txc_tx_clk>, <&eth0_rxc_rx_clk>,
+				 <&eth1_txc_tx_clk>, <&eth1_rxc_rx_clk>;
+			clock-names = "extal",
+				      "eth0_txc_tx_clk", "eth0_rxc_rx_clk",
+				      "eth1_txc_tx_clk", "eth1_rxc_rx_clk";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		sysc: system-controller@11020000 {
+			compatible = "renesas,r9a08g046-sysc";
+			reg = <0 0x11020000 0 0x10000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "lpm_int", "ca55stbydone_int",
+					  "cm33stbyr_int", "ca55_deny";
+		};
+
+		pinctrl: pinctrl@11030000 {
+			reg = <0 0x11030000 0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			/* placeholder */
+		};
+
+		sdhi1: mmc@11c10000 {
+			reg = <0x0 0x11c10000 0 0x10000>;
+			/* placeholder */
+		};
+
+		pcie: pcie@11e40000 {
+			reg = <0 0x11e40000 0 0x10000>;
+			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			/* placeholder */
+
+			pcie_port0: pcie@0,0 {
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				ranges;
+				device_type = "pci";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				/* placeholder */
+			};
+		};
+
+		gic: interrupt-controller@12400000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x12400000 0 0x20000>,
+			      <0x0 0x12440000 0 0x80000>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
new file mode 100644
index 000000000000..39b114172af5
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G3L R9A08G046L48 SoC specific parts
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a08g046.dtsi"
+
+/ {
+	compatible = "renesas,r9a08g046l48", "renesas,r9a08g046";
+};
-- 
2.43.0

