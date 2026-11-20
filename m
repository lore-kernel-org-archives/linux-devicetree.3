Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167363;
	b=32vzHQYc0LI9+jXE9aXVy6CZJez9sTOw+2+8nLxBegl1q9925VUFEm5QnU0G3/SG1jtK
	 K1aXWttMyl1CA5NzkPq08fyMGdqQxdzqx7h5npR02NS65r0mNJKxEoW0O7+Kwbr2BvFxb
	 R0pO8e/gtg24vdPsi4MjVk5MP0QLh2KdPwXxTDPuANx7RIm+j+TG7u/xCUl2YRUg1hnnm
	 4WkP6OQD+LQnuQNY/v4Dq20xCC7Axgbwr/DfaYydy+fQzoiFDzmR+A2RkoSVwO2TyPeQR
	 WiMDOGdTMfUXBn/i4xr4HRFxQ/doinEOtxuvgUDEsdUE1HMYb5wUUutBFFgIVH0gMYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
	b=skg6HwDn7NWLTBybC9a3wWWta4zhLVnDRJEH5sl/Xt2/2Cr4Ou2ShkBhgD6EoVE10iup
	 dycH7sHl4ISgD66L80H9dDw04yt8Bd6QkdviX6eA6dAFtbCE5AFDg0eek69wreIGAWlZU
	 /jd2WvIDpZo4M4wqIsnYdthKGeaN1qpVVTmJ6h9dOPPFS9wg8Ufn8HWvo9OS6SLqEM013
	 GhuOwrixTgc1rUCPoVxE0DhlbBos5napDV8GQujhZqiBr0kT8AGUQsePs2a9UWQoOHTQU
	 fv9hLHYHUrupOsds5Prad6Spj/q5tjm6G7EmyWkccpC3YqQjHBuYCVubuB0DGfu9B2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8EoJIZF;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58B606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A58B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8EoJIZF
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1218223f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167361; x=1795772161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
        b=o8EoJIZFfNxWUcajM9GTvYDdGwpka09HiGu/uPZ9DKws2+OYs5vw3uyqvWMnB4ZcFm
         5sKFsqdBL9kmgyAuepxJMlAZxmfvSAWPEO6U8Mhz7uopmdX0Le2p3A+8g2eUeT+sXRCi
         +oxZAti8upFqxl5vBGHzpGfmaQjIEU+PLS5V1/xjnpTEYpT6RwKejj0l5vKCdvte/1kv
         jyejNnkxifNx9azamuZfvl4WZ4pN7jq3yROWPAAouQmNkGxSH/ANnAWhB2D/aw4aqEQy
         zMK3rZ/BnzgZuZQg92A2u1RsC9ZFtWQFGw1gxtr5NoN0qVEooQhrrlJ5TRALZa2A50XT
         mPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167361; x=1795772161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
        b=HTTsi09CYzfax2DImT/9MqL7uIwFz4x1S1UUuHpvAw8ajBMNXJmDuYgEDmO7FXEdx/
         wm3AAhaRB+oBgNoWybnMOk4Gu/yOMd4rYfsd9oKToQXe3BwgDLd3kdEoEi5Zs/5e0lBt
         Tiiz2XUy52lEe67Fs50Dw7ZRDfm8PlCLBha1ByFr3bpAxmI9lli+hI72W+Aw/7UocJvO
         xJOX0A7xppZ/qxZMDVV3P++egMarDuzeeiQtyp/U7fKpqU6qeqQgw/7UkoVffsLe7Y1q
         QNUcrTv91Ws1CS5lTuiYB98jrilt5O6FkKeBk4ccgkk33veH1AfS+f+XnFobPkwTsrvH
         vGbQ==
X-Forwarded-Encrypted: i=1; AL+hErGWTATaXF6+oUeN10bunTRuVJg9B34q8XsO35FPgonH/arw77xZrVd/VsA80ndtqO0gi7FnN1G63LRN@vger.kernel.org
X-Gm-Message-State: APuU4Z9h5RJiftrab8JTmuMbujr57kD3NEe3PAz5wL2tGoNcS49Dui9K
	650LgFGIwz1Fny6/K/W2qQfVez1bzsu6h0UnXEwg1LyK3TgOzOfCxPqS
X-Gm-Gg: AZFdTZcJPkSnfppAB0pPrG4aAnyNOeR7UW6uIRcm1PznvSF9YXHy25u4ei3H0510fJv
	jaMDBfdS3dlKc5IGh/xEijpyL1adfcqARPNC5llqMuvjEgBsJBxm4OWFQglZzxRtQJfsECJVpM2
	gJ+BBJpNSWLuEX5EkDiGny5TeJwPeYX63lc9b78FHjhnGf1Wo42sNxyncZpK/bV1aex44CLELAQ
	VGohr4VSODu2Hs951yu1XIp1TSN1dtTkNfabPUL0HaB2PBvq2sPxHsv0TO7l2+CAIHlmfZCO+a/
	UxT2HHe+Za2xjzNUG+LdcEjDN8k96rg4oSgHED+xxZldc08P21ex1V/G5hCZPm+Dd8kNlrEHGnY
	OapdLSPKPm+S6RnqJlrN0fvsuT/p8Z47CsZCjaOmrm7iizr/WweU6gHKgIFo0aSyIta1/QoUBie
	jYo+Dq0OpMkehanmwBUG/FfFdWLAEcDISSnxbfpQpaJN1jO8o0xUWT2eunBb4abgO7cCJNxd3da
	K4/x4TLQ+Opqe5LgosmcOBGccESLd5MFEI9r3KoOsI2wJK+nAi3/j+eN67OZY6ZVBdsUoJBP3i4
	txUbG2GXu7TcVww8mPf0VYycGPxs0WQ52ZHGPCWG71te4Ca+G5EsmXoRDTMOAMUE3sh+jtPJ3hS
	0injQ35SWE+6gI4LrBOTtVMzec2tqN6hZ52oSR9cIBoqBUgw=
X-Received: by 2002:a05:6000:184b:b0:4a7:9630:7b36 with SMTP id ffacd0b85a97d-4abb3f15ddbmr5085151f8f.21.1795167361168;
        Fri, 20 Nov 2026 01:36:01 -0800 (PST)
Received: from GLaDOS.station ([193.207.34.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm4664645f8f.57.2026.11.20.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:36:00 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Fri, 20 Nov 2026 10:35:57 +0100
Message-ID: <20261120093557.4513-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add Cortex-M4 configurations for DART-MX8M-MINI on Sonata and
VAR-SOM-MX8M-MINI on Symphony.

Share the reserved memory and remoteproc configuration through a common
include, and add overlays and combined -m4 DTBs for remoteproc and RPMsg
support.

Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
also disable the buttons and PCIe, which depend on GPIO expanders on
I2C4.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Change disabled status for peripherals reserved to m4

This patch depends on commit ebb21cc5d1c0
("dt-bindings: remoteproc: imx_rproc: Document memory-region-names to avoid implicit ABI")
for validation of the new memory-region-names property:
https://lore.kernel.org/r/20261023-memory-region-name-v9-1-ad597887dfe9@nxp.com

v1->v2:
 - Add memory-region-names as requested by Frank Li.
 - Convert the Sonata M4 configuration to an overlay, so both boards use
   the same approach and the overlays can be reused across board variants.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx8mm-var-common-m4.dtsi   | 62 +++++++++++++++++++
 .../freescale/imx8mm-var-dart-sonata-m4.dtso  | 49 +++++++++++++++
 .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..c542613ed3ea 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,9 +245,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+
+imx8mm-var-dart-sonata-m4-dtbs := imx8mm-var-dart-sonata.dtb imx8mm-var-dart-sonata-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtbo
+
+imx8mm-var-som-symphony-m4-dtbs := imx8mm-var-som-symphony.dtb imx8mm-var-som-symphony-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw73xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
new file mode 100644
index 000000000000..ba2457d0ec91
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M4 configuration for Variscite i.MX8M Mini modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: vdev0vring0@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@40400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x40400000 0 0x100000>;
+			no-map;
+		};
+
+		m4_reserved: m4@7e000000 {
+			reg = <0 0x7e000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m4_reserved>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m4-reserved-ddr", "rsc-table";
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
new file mode 100644
index 000000000000..2f290c3ae467
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite DART-MX8M-MINI on Sonata-Board
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-var-common-m4.dtsi"
+
+/* The buttons use a GPIO expander on I2C4. */
+&{/gpio-keys} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+/*
+ * Keep the touchscreen enabled without its optional reset GPIO, since the
+ * GPIO expander on I2C4 is unavailable to Linux.
+ */
+&ft5x06_ts {
+	reset-gpios = <0>;
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+/* The PCIe reset uses a GPIO expander on I2C4. */
+&pcie0 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
new file mode 100644
index 000000000000..ff5675cfc191
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite VAR-SOM-MX8M-MINI on Symphony-Board
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-var-common-m4.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+&pwm3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
-- 
2.47.3

