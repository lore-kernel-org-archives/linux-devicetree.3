Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F35A3A8759
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628085; cv=none; b=KsVSSfxTItfnKv7rUpU3q5b7dxoFLMhrf4sisdsKVUoGYrWOSvnRtXz8ac6Bj4FsA3wcYn3UIXD6a9B6lR5yY2OnVCEVqyAdDXCZyMCs6EcCo6ANjVwvE24FnFZKTiHJCYdqfq8Nnl9Zf+ZxlbfMg+gfTcyKdDtERBBssBYlhow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628085; c=relaxed/simple;
	bh=Zmo7S6bpxRsPyMkFnvRz5xeNTlw3cAjr0pSXsb5n+QI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAYA5qCZF3kCGOGdNkhXr+37nucsR3LBH3SjLG0TsdHH3ovQjX2HQQB/iA+pdZ0Hn/74YkUBxLNIDWGCGQCpntQTQmVjAh6x/ITeiR4cJ+ZrGnpJPYM320DTI1ohoGW/f5E/stB2SykdztSSdsPZvCLAJcp+NZDzzoAODL6tPkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOmH/mut; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOmH/mut"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cab973140bso12206905ad.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628084; x=1787232884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=089KQAiVoNPGKgHJpaInzv/69PucbNyqkb0494Vo8Ak=;
        b=sOmH/mutdJVdHplfO0RQp+dpMgMaM+PjjgYMIyhTWDwLFwzOc2N0B83VCgsYPFhHpT
         yIiz1ri1iOxy7NEDak1IkedzjEE28PmgjJwc8kFyUAMfr6Ng8rkQrnP6lYL/IOyOpoVQ
         kEarxOgRV1cffqfsh+m0cTS15zbrygTXz5ZxCPSo7xBZlVp5awJNalsn7Fsm/5dUFER4
         uaRZXCucHWiGp5gzJRXXU0RW4exJYEeer43gbDnEEZP87eRJXRPElkpe99IkWf7kdR6E
         USFuq+Aav5XK2QywgYX009DuTuznPCW8rcuPNejq8lKBKhJ5UlBuNphOfrfcuDvrhZcE
         Dcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628084; x=1787232884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=089KQAiVoNPGKgHJpaInzv/69PucbNyqkb0494Vo8Ak=;
        b=fmHKCrOxDWmpIIo98IDfnuPwUAtkPbpGRe6VY8Vzc6d8Q6Lo5DmJ/3GtZYcKy0YrOE
         ZcSl5cr4w9Dx1F6B3bhbEi1TTTST9EVx8JJhHFb4pL+yGF58AejgenWFzVeyBCx5JE/R
         lV+9FPbtl2Gp+n7kIwveYXFGIsPGiHr7HMq1Kq1dSjjHqva89lXgLo4KkLtzD2dDIuZg
         8ZKF/X6+38E9i+J/jPa+2WTKQ4jBogv6sR9e3MWGviuZniBKfsYhOy09t5e1ZT22f5RF
         3P2yrZhY/kYbBxRs8qbm979k5LGXjAcKZPZkRJBGmAyPQnOY7vxssQMZZWIHGRroM/Kl
         mn4w==
X-Forwarded-Encrypted: i=1; AHgh+RpuRB48rWeIwzZoUFuSCcCu/89+xx7SDpH+RUNoTWfeCxO58aGYIXWMvL46djF+Zmxj2zk/DBB3sTE2@vger.kernel.org
X-Gm-Message-State: AOJu0YwBHi/9dOiWYn6WpjyTfjHcIjivrcPyrOwX60k11mHyQnnY+HmQ
	LXyKIRQ5Oxr+mFZJhjhhHpQt/+bn+hPLVCKjH7czdkMWuk/Z7hykn/At
X-Gm-Gg: AR+sD10v+HRQiUxlAaeceWh7PQASAH76hC4mDXt0LYTKItMr2/ZIfcge+r+CubbsPMV
	gx+2FJYhYHrz1unw5ubVRwEn6JswLDfNq70QBIvmLlWjREfGC6J21AchuAqVUZCmMSd95jYoR9I
	nb0jbx7JN6H9bRCntWvSxvA1XvZkJayNs2p4hh68wUJvk2mxJ04Z+1643E+BhX7nDDTeYThlgcP
	5P1CTOHEhGIgnMaOxc0VhIhRuEDNnEuxMM/Opl/OX9ca0XVan49lvoGejjZGrvCEZ9j6bBhDa3X
	i7tSs1W+dYiwhYdOsF2a0xvaErphyqw7oMdHgg+9+ije/DSfRV2AvkTF12CtJKbSaFiDbV4fVMa
	T6QVwTrjK5kG6t9hq3bG9+x8vbmwt/uHBduo7dG0gE2DhCgypGlRQ9PED5pPOmeUkxXLNoOPf46
	LBb0tROzADOUFeFZgm5B5tRN+tvKtIZAFexiOX2oF5fjLhJa6z0xpovfc6mhb5Qjfr14Q=
X-Received: by 2002:a17:90b:5310:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3931e0fcad7mr6769440a91.10.1786628083440;
        Thu, 13 Aug 2026 06:34:43 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:43 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 2/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
Date: Thu, 13 Aug 2026 10:33:31 -0300
Message-ID: <20260813133335.1941580-3-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS
panel. Touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  5 +
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 94 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d643f85baa7f..c55269a0532a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -508,6 +508,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -517,12 +518,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..da05a0256889
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1", used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-lvds-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_dsi_lvds>;
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&atmel_mxt_ts {
+	vdd-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};
