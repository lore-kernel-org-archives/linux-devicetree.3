Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD54B8276
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775204; cv=none; b=K9KDIWP60kZV7yIdh83XGf15c2WfprXs36sqHtAV7DvB4kOHBsJx7E8KswONgfYyMHqE1Fr9vF9OwbBkWK0LflhA8fV5s0LNnWXDFNBTinLjtG2hnYmN0wwKeILaoQu5z/LeZVmiZCo4t/0VVMwJ2/HfvjoZhiOk5JvzwobXAjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775204; c=relaxed/simple;
	bh=f8JkwFAbaud9hbUlejsnLDykrOLkMxXpVYGvN92A8BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpZKWsYOJ4PF3d/R4KhCI850iyRAhap/Ww/FUu/wp2bVtwPz+90cJVf6Ol7sODUe72CNR61quow33U1XDc8tdUUn/qpdDg/hESt74HPXbhv96rSDbY++b5q7araW3UGc5fBNPGoYxQe7pRGvzbORwXU+b4b05ACb3KVOb0/bgIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rl3Y3XmH; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl3Y3XmH"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso2859190f8f.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775196; x=1791379996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M97dVmT/CeKGrW0RKGI0gKFEI3jgGv0NSYskazvF1xc=;
        b=rl3Y3XmHNN8v8E8VDJIX8hAVIlheQ/XoDciG6Om4PbhvLna5wQb1RifdCUmEmCkuAm
         S4f4VlVCl1vGqX4fY71GuPT787DTeFm7ewWxjECkb9BQbmWqJn9gt7PN0gQjXl2HKeeR
         Dai5iogSaS7+H+Xu0SI+mNbRQNpKBofKNsLZpzSo+9G4/U4gNav5k+yyDbRuu8anjEpx
         oOWp83fU38pgNMrRXjCXezqtIUPQ9V2yr3vdH368P9W7EACAS4Us9/pZMh9OPhPSCvbh
         FNkjzSp0jCfrNhzbO37r3iSjBcRWjeAH1eXcLlRxRTC+4t/NpNmzOK90IWHPWzsa1WLt
         Bnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775196; x=1791379996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M97dVmT/CeKGrW0RKGI0gKFEI3jgGv0NSYskazvF1xc=;
        b=knjuSI4FM+lXBDWrxuza7ObAh0C/QfE4Uj/2FJephqCgB7PYHp8YXp/TWYTuY0f4MF
         kTdesiFxEuuc5OPEs2F++sCwWaW1atXOfn7BXovf45uYD6h+HK1gdF2fNI0IFMrTKB0O
         rDru750mjTGsXp6Mc+I04MTex1Q9b4BnEdGLGyWihbvCJbHVGNljIWGKImHPJLZW7C7G
         d6IDR48VxW4s1zWPT28c4mkR9cc/DbsKZCclFnuuiArByaPTCJD4Jwc98UmNNiFzFKLb
         MP+ZMZoLfrtlX8FtM3k0oWOkE9/KsZE9faQecnGWsJ2YVWpIF9Zfkz2YlzZWOxpfwoXb
         c/2A==
X-Forwarded-Encrypted: i=1; AKwUvBwoK4Xwmv1sm8KIhdRoBPAsYFOonI6Ea5oPCBYmlkZQJ23DWyujktywP3HNSS/hvte1JPdmQlSVlzNh@vger.kernel.org
X-Gm-Message-State: AFq9FYKowoSNVMIUJIcglo2VT1K10m/zbO38EHALG65pi8dfF5r8cr/o
	wDUcEoT2PlSKSmz7HCYwAS1LQWjNFI1L7zMbgMCl/h71StvSX6SP3myo
X-Gm-Gg: AYBFou1k3i0RWzUs/F/nMzRR12N1EJNBc1xvyxIQE/a/rC3x2oajP6IJUc52+1yx3Dm
	/TKp7Ha2xNyHyiv3ayqNs99UXmJXUTrpFgDVEgi9uv3c+Bs/ifkFbVKqX3/3ORPVTRBUXDg8tQE
	DUKudzdr0xT+FEwVqwKi2Hb9637EU+WKnyHECsWElx/qySO21agdbGOK/EdYvnMmxmHg5rcmbJb
	sk+bogLY7jg2e7IOFxV4p1tRye9JIxSXoHCgkU9KPSxkV/z9VD/p0fmGf0rTFCHfKC7z6sZXUs4
	Lyt+OroaN8EWHWEPPAwYshdMM2coLPh3bEa0q8SMDTgtJIEyw+E6YgXGR+PhmMmUKk74x3aRteo
	mimvYWYr6QwtR6Vr4B4Al3D+D4sC/2lgXGY+u6jPgXyrindu7OJ5tSLHWOTaSUqv8sXu0jArwW6
	ScNZYSnwkiUHQdTrrCnzW8wq1+8B6XltZ95LwKmVTZeP0mPdzsUvk5sWrR6a5QQ7NRPh00RMZ7G
	E17QHxirrhl/I8XDsAdR6ADnZE6eM0BNQ==
X-Received: by 2002:a05:6000:144e:b0:487:71a:be5e with SMTP id ffacd0b85a97d-48b02525009mr3006986f8f.28.1790775196027;
        Wed, 30 Sep 2026 06:33:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:15 -0700 (PDT)
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
Subject: [PATCH v4 9/9] arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with ITE6263
Date: Wed, 30 Sep 2026 14:32:51 +0100
Message-ID: <20260930133257.23210-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * Updated license header.
 * Dropped reg_1v8 and reg_3v3 nodes as they are redundant.
 * Renamed it6263 node name from it6263 to hdmi.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      | 86 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b9dad3f44ac0..05df4c642e4e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -267,6 +267,9 @@ dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
 r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtbo
+r9a08g046l48-smarc-lvds-ite6263-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-lvds-ite6263.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
new file mode 100644
index 000000000000..3c64db8d22e9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+	it6263: hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "vesa-24";
+		ivdd-supply = <&reg_1p8v>;
+		ovdd-supply = <&reg_3p3v>;
+		txavcc18-supply = <&reg_1p8v>;
+		txavcc33-supply = <&reg_3p3v>;
+		pvcc1-supply = <&reg_1p8v>;
+		pvcc2-supply = <&reg_1p8v>;
+		avcc-supply = <&reg_3p3v>;
+		anvdd-supply = <&reg_1p8v>;
+		apvdd-supply = <&reg_1p8v>;
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

