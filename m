Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9B2485CDE
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329761; cv=none; b=uCNpaXtt+62Mz7K98SSRh448JvcCz38bJy5boAXF12GoorJ+UQ9SiYyNS80obnY1sLiFaLAQz6nUKAE5qoOx4jSdQcjOHphHTn5hdYHQ8JHVIiTh3Sg31RWpDEKS9/TPc0FT9BSOj5b3U/DjA80PKjEBKfdZd0/woMZtaw9xkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329761; c=relaxed/simple;
	bh=VkvGp/rTRuPjIx2ipVtb5348qNMxB6ZgaiUGVEKCpMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=My/iv+4KXWccuJUkGo2N8rpUyn6+hoktsb+qrk0uC39ShqzvIgyfUIDhGESlclBwQnJxzrIx+dtJ8HhIog5jtaMfoRgKYqwo+rgw8CcGp6XSVWoaPh7RIX9yvWuVfb2JEG5mtDUScGtnpZnudYWAn78+hUI6zQWrHZzSc+jHXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGZksjUJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGZksjUJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f84023916so904416f8f.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329752; x=1785934552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pinADpOKzHPTga4WMKKeUJ9erRfZf6ZG2bVQBoFuWYQ=;
        b=pGZksjUJIiup+vFj9e3fHAeIiaeJrKkzj3dDgC786yQOcgXQOeUt3fSF6fCFYEs7BY
         JVrdGpkiIaJo8E4xYNYLJPbvOtx5EYR4pGn8V6DZLLiw5KW8WTmh8JGnrFP6oyfgeHkf
         qioMFTk9LupDVgOcLA6VazWt4DLwqAw6NmoNMbDDbg2J2lm8eajNwjEgiKHsnsKCsc+V
         DuzEQclhWJc5oGgneLHwzaB67ArlTRJ/PN0ZO+mY5lj6DLffJ0LmW5WjUEXYnMBoBa+3
         AW16TMjFYIFHk1c4gEhjOkejLWH9ldIMjuhhpO4P4T5/UOGi9SxRdvuXaU28rSpW+EDS
         kT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329752; x=1785934552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pinADpOKzHPTga4WMKKeUJ9erRfZf6ZG2bVQBoFuWYQ=;
        b=qJnzpDMqNH4MGcqUDwvwnLERRZ5TN1hczSPwQkL+WKDLr67Y0TNHsFMQDYd1Rc3cnx
         OSn44jn/DkHtnXYCYSJm6cz2bkixNqdggXES8I0/++YOUMRrJc4vXjh3kIUhDqlB95rj
         tPGz4pCT5g1VbWbIAp8GmNmm91B2AYmuNoCWUxOMbshhCEOA0bur7qIxLbLvRl9wiW00
         ED/mGSA5VZPMfXhgdqO1Tk30cQT+7/MNyKhjyCzdUAQfKXcNvXpuObZ9/rlOpttG9yRW
         YXwk8Mb0g3sjMLm/lDRu0+P4n5VTX8DijrTDE83SR6nesXiy0WrVoQW3uLjtsVSDUQKF
         j8Kg==
X-Forwarded-Encrypted: i=1; AHgh+RpR+dpurz7Nbj2FdsFdSy+eNyaZ3bQs7sjSRoEpTWI/sVCipk2hXRATFLYLTgev0zgK7abzPs7PPtFu@vger.kernel.org
X-Gm-Message-State: AOJu0YxHGWMLGVjpb0xRtuOiAt0N47FfMcSC0cORLr2r9LHNbQ4oz6lE
	/0PIqN7SoW/+iH8f23sE+mCoZfGTHwcH0XUZ4z3McVOJgK+h3BRn/nQj
X-Gm-Gg: AR+sD13NuHYvzRxIpdI2rFKdY8LstFPhrwO7Jrt2EEXXlbeJa7Ij7aRrxqTtcXbiA2U
	nhle7Al9I3y/bvghvX5F4MP6KRjCQivnYQnnnV2Wad1SUV3yzbarDLZZwdsStupFGMHlEyl1K5n
	+IqIgmQuCeUt8ZsnJELxMs5skiBsa2FWKFkGne2Z+cl+VAItL1oZp5z+kWqA23yrD8fdJGbzk6W
	2A5+zwl6lkTxXXMIofuBxTTlp3VDTkKnGEYp7K/E+bv9nseqVW3K2dPlyApNa8kJu0DuVvgk56q
	kCfdWJGLEGtoEqfQa51qrFUXW9ERFTBxNrqsMgFjkByfsK2Bogl5bfCapccO4t3rZ3htBvs+e9p
	eFEnJWlmseIyBFqpwpWvMxm8D8cyUwFvP069bnTc3uGDVlALKY3+iUj1ZW8F8751zD5ag6rfs3e
	tJZFHRsi5p0IntbUU31kbs2jnhpzaBfqPn+telBPYH9UTXvFk5o3xz25vAxLGLwYX3vXVQHmYHA
	nF2Q1uUeJFV9tD9S347PRiP
X-Received: by 2002:a05:6000:310f:b0:47f:776f:3845 with SMTP id ffacd0b85a97d-47fb1ec814bmr7941751f8f.7.1785329751598;
        Wed, 29 Jul 2026 05:55:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:49 -0700 (PDT)
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
Subject: [PATCH v2 16/16] arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with ITE6263
Date: Wed, 29 Jul 2026 13:55:08 +0100
Message-ID: <20260729125516.230757-17-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
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

