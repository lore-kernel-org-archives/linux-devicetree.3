Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317A245DF43
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766564; cv=none; b=JarV747Jpsd8qetiV32MD2QoPnTz778lW+J+Q3Bqw9XZEozo1teygMWwbVbiQ6aqV541sGUd1UGd1lg0VqXBD/IPgaOgMYTNcePkaZUpkRllXCi58CKxp9hBHe7M+7c1gXPhbxSQtMU2zBHo2wwVvzakvuH7oXvz27KNlzHLv/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766564; c=relaxed/simple;
	bh=p9SswxHbEsu8/KF0kHQvhtWGdr/Nf0H6i8JYgP4NQuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AEEae9e4w3gtO7uoaYCpqE9WswEmZmTMdKDKHL2RZnVFyXAABqu0AgiBF25eJEmMH69oWvVNHvBdyt49fVnlJ7vl0JkEoLv9K2hnMWNB/lFj/LIDk41CuiuTaolhxr56gdTFk44ErTSybwLY8JN2dLzsoiEIVgBGo9KNUjySJYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beI1EfOz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beI1EfOz"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2074710751so195950066b.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766550; x=1788371350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdIXMd3valIFt9nZNwXgENVj3LUWWJ+9bpSH1pG21+M=;
        b=beI1EfOz7lAxQEkhnH9wSEvVNyJXBQXJMXL9FyreZEycHBjd/EELJh7DP5xbC3LkA1
         tOwUNeuYs7rGHgeO9mbU0cc24iYO4cy+QgyqKJ9ZIUmCEZchBqFzSMY5lmSD7paVdj3K
         x1ObyQPPnHrM/mpjY3E54/6evqJZZa/V33eoqFTht0K6blhGTxmPny7H1sV8lvhLeYqp
         zYt9SaaGAlW/mIM6wlqp0+aoQUWp3IcDZtnWIa0K0+M/IuRaQMc+G8HLHHXqqgm/DzzT
         xERplxrAm8yrnYVJ7PQNTg7j+9o+aEomq5gBTYK+/gLM8AfKQRwvBkgWQYcbxY8Yvjbc
         zljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766550; x=1788371350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdIXMd3valIFt9nZNwXgENVj3LUWWJ+9bpSH1pG21+M=;
        b=E25yrXUbaOPnqS6z0m4E9nHL9NCIaocg2zgAb2Sl+SC47rokDk0U8coSgIgN83hQ2M
         ER4fxCfX8Ik8LkZxtLwOB0TKfOQKkHRLLZ5IWiodH1A558s/CakmrzGJxjNsJSgwKuKo
         dAyfSNZ4gEZWaQ3Sl3ayt3QoAAjcmPSy5arbmWyBxxqf54LR7scxSXeO/HINhYEfaD+C
         sBIDPyHJVqOAryQ8mU149ye8x0xr/TS6SMa4N4GJfxPio2XvziO2aTM7j26G1N3gkQ6D
         1E51X4CYNbtTKLgtza7tUB1U2p4kdkCucdN4hr8/rWq2Ecx/awZ0j9ljRVYeBpdvClyB
         dL2w==
X-Forwarded-Encrypted: i=1; AHgh+Rqem2B2ktyxWCMB//f/x+7QQiqvku7ynTZTY1FnyMgyHC5jycNrNo4G7glg7nsDbijpHJVR1T/fJoc/@vger.kernel.org
X-Gm-Message-State: AFuF++kAWvEnxiLpmAYdAlQjbi31OPpJPJ5yIm9R3rdhuf3iZP6qiCi/
	KWqxxV2LVVYZExGLNg+TZlPWdo+3/uP99PGicJeYsJWB1MxXeehOyb7B
X-Gm-Gg: AR+sD121ySvc67P1erABBa+6zB/gB5JmATQZLfdjm+cnbqlo9v85kzf825c2LOboAcD
	c3j/HD/UU4vKFbHCgoHMu03vv9f7rRO33rf7pNP/XCO3vDzx20qSfQxKOamCJWm+mPQUgxJqEah
	+LJfwxB5wNiNfUwaHt46qVhcwU6yX8rFOk54JqS4paRUE9JlHseramTKdo0NsNeVhSa5um1JKE8
	Tfryl2AiDsWo7x8lXWtNms/1affrSmr//bJijT0tJM0UMgCctu4/zKN2VjwfrJ3tfBqU+D/RkIh
	MdrtWZaFYsV2FAmBtPF3pl+T3wfMIC0xG5/IawYMeo7onRPNNy6Su63W25OKv63PBg86P/zADt7
	q7GEyloH//J6n4dccTkFyhSiEPIAKx3vZ1K1ppp7H50gGMHDaPDL2m3e4U0hymjKby/Gv/bDN0o
	MxXP/XZUBIcRZRgZ3U03Mcw6U7U+w/ixZqsshJxVzDo8xQx0Qs7c1PluJ9EjUgPn7vbobSpTG3b
	r0qI9ZFDQbYJg==
X-Received: by 2002:a17:907:728d:b0:c24:87e3:b8b8 with SMTP id a640c23a62f3a-c250c608d0emr1094954566b.17.1787766549920;
        Wed, 26 Aug 2026 10:49:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:09 -0700 (PDT)
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
Subject: [PATCH v3 12/13] arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
Date: Wed, 26 Aug 2026 18:48:46 +0100
Message-ID: <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
Analog Devices ADV7535 HDMI transmitter.

The overlay enables the DSI controller with a 4-lane data path and the
display unit (DU/LCDC), and configures the ADV7535 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       | 95 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..8c6a44890715 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -187,6 +187,9 @@ r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-sma
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
+r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
new file mode 100644
index 000000000000..cede3b4ba318
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/G3L SMARC EVK with ADV7535
+ * connected to DSI and LCDC enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
+
+&{/} {
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_in>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+
+		interrupts-extended = <&pinctrl RZG3L_GPIO(K, 3) IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		a2vdd-supply = <&reg_1p8v>;
+		v3p3-supply = <&reg_3p3v>;
+		v1p2-supply = <&reg_1p8v>;
+
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
-- 
2.43.0

