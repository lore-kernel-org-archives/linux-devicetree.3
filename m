Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3073471273
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766569; cv=none; b=mQqYsa0gDHshnfMW3HJRi0uw+BJEMGBtY50+L/jXu7pH9kbVfOMEgr6n2GMVpMetopYpjOXjDV2V7j11hob3pZhaONvNcoG4m+qgAxj8p1LX9J+mGhDYyep0DYHeWsg6K8jHRJYZ0s56Ane/7B7o1mBkokOomOXRT73aP23fn84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766569; c=relaxed/simple;
	bh=NEQELcWLrh6lyQ3u3x7gFjM/nDh5lCBM/682xmbNGeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCSM+eUl3tXIO+x5ae3/0rIXicaW5gl949w+Q1chyRtfrqvkziSkEg+0eSg5ZwXKke4eKoqjH3L6pINvBp2x5bk8gT8ayiPC/U9M1W2S3w9dsbTYIQVGlKTnA4i0KJgFq6dRlwh1QCj2xt/U5Caf5dn2NtvxkkkoAi0yiE9SVkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjTfOaBs; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjTfOaBs"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so1920054a12.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766551; x=1788371351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKiyzRh3KPaW1CCmMsZdFblYmNZk7dBeoJ+HxLixX+M=;
        b=bjTfOaBsB2PJEPKAxKdeiHr+sYHvwdqe1kaxiis2AIw8poJEFAxM5W+94wbf3I75co
         VmhHwwRXU/tQ6u/3TWVXow0Z9o38wld6cZ3yJdN6cwhdx1TDLdrrRxk779YZP0BbcJ9u
         NUNM5A0RJcfHpycGAbQtqQ/nBJd1Y/s1Ya82g1Lknn0d2h2Qi9pnqZ6iIeSyqNrA1c5A
         YOQbqaGirqYU1TMx1z5BBzB2FygNHfDJNCSWTa47leUOzlvpe9cu/gKbTHtjT/TQK+Wb
         HDZh4v3iwQGsVrcR/n3TZqILX19mHJW7AACdtuaJHT0fk9xxf47RfgTLxzttzkQN8oeY
         ncXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766551; x=1788371351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKiyzRh3KPaW1CCmMsZdFblYmNZk7dBeoJ+HxLixX+M=;
        b=aKe3tk5iuIUD5YwalSyMSixSF8SOb6xIQ5AQEaH5a6BcNWi/tOSuBNU3cfEUunVdE9
         MlHmmp1sP5giNYU02ckFs7k815bmlItWsanWPxFn/coA9BOO/abMyXBnAvPdP6Xh/LrM
         qvZK1mZn7SIUQo691oNlrvPt5j0rPpyFcfiIzrsgNLj2EOQFcJxLq5xiHvzTjubLMS1T
         N16boHzZq5FP7zb+sr2HGzkxYyFdZveBAGm2EtisMPOYgsM0PP800Htvtlp7iaSsiI7p
         bG6fpyQsRMx5NaBO3Dy7aToEGGhbqUU5j/ilM3k00kSCGCZUMnub6MalKpbtZ7phuHIu
         eUUw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6M1N5Hfd9ja+4DNdearjZRJSiALoGAoLEYD1JF3jaTJT8uZXofugA6keDBZReV12XwOAXqEPIo0sH@vger.kernel.org
X-Gm-Message-State: AFuF++nFyizm6mHU6aTCaB2lscVzCrSpMUXVk4qFCYhjmQ9YmUhOf7jC
	pee568CXAtBKJBA8F/kZ8T8Cq8PauCHLSz/U2NWE3AwqU5eFAB/1j3Ii
X-Gm-Gg: AR+sD11tNE2bJrxOPe57KeIC22Zl8oX+r1BMgEMIZGR7g3zu0ZxLk61/gL8l8ecP3+V
	6O87g5pSyuJD4cnfUnE1kBvP3FNfPzVnrsrjDyZPw5qedmh7p9r1mds80qEF2e28+gKCIstCehH
	I6ePoR4/eHc9BcKjhMZubwIqAfbSJ811i+v7xbSzn77sbW7DdRAt/mzDV0at6ptD0NL1DUgozws
	GN1Vip70hkm6u3GGRnMw4mP0JTSDoOYwuYx3Zdg57effbf5KAhLBBVmWUVh3XHlVi0eOwz+BXA0
	rWEo0znzzmZ9QXc/UBOW+TtXWGnlqELLxYs7mwF0h7T+bP+IhpC8TBryCpN+rcFvznWaos2/2VI
	qwFGZw8yGHMODiUqdF+/gTeODKrX4ImeC1cPq1V70XTaFsMzCnCnyIuFrDh/1GPpTxIkRiciSIo
	4r53rLxzF6ecERT3mOZ+vi3EHi7IfkqcRuU+4TH9spAftDt3aJ+VlRDb9IZ9siu9J+KzAkiCsXw
	JsB2BrF935t0lA998quMXUrfA==
X-Received: by 2002:a17:907:d642:b0:c20:74db:50c7 with SMTP id a640c23a62f3a-c250c2ef6b0mr1308054266b.13.1787766550737;
        Wed, 26 Aug 2026 10:49:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:10 -0700 (PDT)
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
Subject: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with ITE6263
Date: Wed, 26 Aug 2026 18:48:47 +0100
Message-ID: <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
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

Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output via the
ITE 6263 HDMI transmitter.

The overlay enables the LVDS controller and the display unit (DU/LCDC),
and configures the ITE6263 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      | 104 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8c6a44890715..3cecc40204e9 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -190,6 +190,9 @@ dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
 r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtbo
+r9a08g046l48-smarc-lvds-ite6263-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-lvds-ite6263.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
new file mode 100644
index 000000000000..95e1f411fa04
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/G3L SMARC EVK with ITE6263
+ * connected to LVDS and LCDC enabled.
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
+	lvds-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			lvds_to_hdmi_con_out: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
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
+	it6263: it6263@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "vesa-24";
+		ivdd-supply = <&reg_1v8>;
+		ovdd-supply = <&reg_3v3>;
+		txavcc18-supply = <&reg_1v8>;
+		txavcc33-supply = <&reg_3v3>;
+		pvcc1-supply = <&reg_1v8>;
+		pvcc2-supply = <&reg_1v8>;
+		avcc-supply = <&reg_3v3>;
+		anvdd-supply = <&reg_1v8>;
+		apvdd-supply = <&reg_1v8>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&lvds_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				it6263_out: endpoint {
+					remote-endpoint = <&lvds_to_hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
+
+&lvds {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			lvds_out: endpoint {
+				remote-endpoint = <&bridge_in>;
+			};
+		};
+	};
+};
-- 
2.43.0

