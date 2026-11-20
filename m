Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198707;
	b=x98Pzs4N6l5a0fjyuJ46cGdD9VSMtP19U2wsDnaB2iTUf0NNrLpXibcp/yEG940816Ai
	 i3F6+TJuDPDcCXWQ4NTHgJZaL3JpD6GqLfIF/Cq9ARFi+Gzlq1Vbx5DqCeRks73Pu6uU1
	 Hp6J4O/eP7Lc5fC7lCL1mpsDB41Vv9nAiL9lCBvZQBPjsK7cjRYLiq3W4qkBPmQamYV+8
	 a7Wxb01cltFTd1sWHwf88Eq33clSC1YFRI/oE8j3kGzh2EWixSC2eiWQ/eHlmOQq1DpsI
	 TBpJjvL9WiV/i6yDbnWEeiKEqOxWkoNIQuoz32H22r/IE8M4b6t5PTeBjfPFi0n7MTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F+kfwwjCYMQqRtD6fmxwn5boEWQH1gRaWvH/BgGTxxw=;
	b=gcdCUFXn/2gKKJGjQNiAthUhfzADOfsAzUFbdeW2zfmRVODQV1tJtcoz+fCFjvekDrVW
	 z8YEmGyK81AZoTspBR/0Vu9/+Xxx6LSX6hbEphqhMRkKxSrhLgQSqwcm3ocHhptfxrYUG
	 8xyBrBd1+qqPCaQpd/NoylJZ6vNNZHBCXD8D8Q+5m9a6amZl+MnXbh7VdH+QoYPlJm9q/
	 /s7D9eQcGgDM3dvtGwjbrG5rj4G6NdBTBl7C+mHZBeW/fQ8nsZlZldmJJBRy0AYVYkg7b
	 z5qMwTj3tVycgfUndnKKbvBDzYJ8FuivD8QIhnD9fZLH+ogEwomRLcROiQs1n17InBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBVnh3R;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB20606B9BA
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB20606B9BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBVnh3R
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so7599805e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198702; x=1795803502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+kfwwjCYMQqRtD6fmxwn5boEWQH1gRaWvH/BgGTxxw=;
        b=TzBVnh3RUQiRQGeTLDd1hc3xkppDZkzBbJhETCF3BYEaYC0G/JIcXXJwcg7ZQ6u3pN
         DhJJQmpNMcKGnxR1efw40notwL390xuwa3hYe2qdJIcys9LvNr8bQBTBr5EtiRZPSKrY
         NyYl3hESJYGbRHi9BNwV5vDLBRscNEhhIacIH8n9KcP5hOxCH3qCwWo37jWw3zvse+43
         yoYlBSfLI0LyVFZGRKnt+UZMXbBbL755VX0xhSVmR4AxfzR3WFy4BZ/RLg8QhGBnZb22
         m9IQ8L7t8wtpFNyBm0VD+r2pe3QVHCHzA0Fvcu/mTgmoO+9UOzEjsEuSk1jasqLZ1+vJ
         qRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198702; x=1795803502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+kfwwjCYMQqRtD6fmxwn5boEWQH1gRaWvH/BgGTxxw=;
        b=lhLTkt3jD9izyo/tkIoMSd0MDkBkLYHKh+GZty1vKrWMI1MTrr8sAHH4sfB5CmVjpi
         IIJ4q2bKXT8KN/xOoXUJ1/m3B6/2xZprU9/2TOi6bROjaYUq0cGsy+ZmVXXGSvob5rXq
         6xt044dPGJ3Y5fQ97pXUY2rL8rH5S4iVWTukkiTsm/0IO/IZlqooL+/kJ12oIExL8yy0
         Or72yWR0v8mBYzs0QhKUSiPF7HmN7WFbn6qQrsbWPhWZVyiO3uKI8yZgB47CyeRMJwcx
         bGMfgoesVix2aDu2oNjxuGaoXFnUu9I7JW1n2l6v7VpxONc8HgS6fafm4z5DvuY+Yoie
         lFpg==
X-Forwarded-Encrypted: i=1; AL+hErGyAhJEy+yRrVeL26r2Sfy7QgreJ128Gf50AGdkleVg9rvUmZ8YPbZ9/yPIIraUdSjNbVxguU1h2Q77@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ij+/IZda1AopsZ3qvuE8au2fwDSCIIyNKBhd4UCndHdKLZtMU
	kHg0YmvzN/d2D2QuVceb/6v9ylQTYnHq4SPKZYsTAJVBzSAslujKULdA
X-Gm-Gg: AYBFou1hXkHNi/oTOd101lB6/5p+TyHCCX++MvZMWUFqcJ3hypanzYXXsAPcMlauNWH
	+nIX87xlo7peFatrf3Lv/XJWXtROZ1j9XEnIVVNS6eQdqI9P0ECtLGKJAIjXhpWBlE+sr3Xonfz
	TiR5ghAbp4n/esJJGZTYln9vuuqqfP7Iloqix1EjFQFXuN/nVUTjei4aOMujMxj+UeOkcU59py1
	NZIDyRROl8UFdL7dCegYexO5O227Q4tbveLWn4jtTPx8o7GKwG40THwaFMVUubv1hTEtfzSFR4d
	weHuJ6Xy9iWza3u58uBxr+yLnnTWqCoIbB6uRpQocLRxbsHXXZVCMFiEgOkss+ZufvAxVBGhaqX
	VCaiaIA2gPpQnjez189i3BmJBwtsWNMRO9hZKmmJmgij7wZRykCu9zTf9r8MAGdBW3V47z0HncE
	6IGo7Gg2CD4tfP8ss7LsZtTv39IcwlevfFz116v+D1syrwt6aCR3PbgCzAT5SWw259tDuk0zU13
	PnZ69I3GfvJlzc+qAxndHXWuE1Tdab5SXAgaLby/0v2utFDi//WeGgsjE2+wqltq60cu5u+EjYg
	D8N4yq8f4URKCYiS/gnArvILRcwTzQClPLxrfJdO11/RHEIHNl/2ZKRky/anKwp2tUVcZQVTiaj
	CfNfJwjBvubBclL6prWFzjXvSnRtd1SGEXzDWxRrLvuUxVoqFDgaedW1FwWN351gFZAxa
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr98021205e9.7.1795198701398;
        Fri, 20 Nov 2026 10:18:21 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm34756025e9.2.2026.11.20.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:18:20 -0800 (PST)
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
Subject: [PATCH v4 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Fri, 20 Nov 2026 19:18:16 +0100
Message-ID: <20261120181816.33455-1-stefano.r@variscite.com>
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
v3->v4:
 - Use common node names for memory regions

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
index 000000000000..e2f369e2ef26
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
+		vdev0vring0: memory@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: memory@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@40400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x40400000 0 0x100000>;
+			no-map;
+		};
+
+		m4_reserved: memory@7e000000 {
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

