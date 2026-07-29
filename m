Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048D48876B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329770; cv=none; b=cKB2apaxQ3HImjoQyXuyHDJP2T1O2w1cjzXEjrlaLwtPMlOLBdw1OwKAbmL+N9D4aW5DDAIrb1pTgZPqUffTLPJqEPcJClQOnQkfp8sT+0GJPzdWUcY1//AK5Eaa0jkBQjMtKHB5jB0hGQxAs7jebLolDAklkfcq9iz5fFsosQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329770; c=relaxed/simple;
	bh=bKz32u+YWLUry80LjwIoPwPao7w4t58HMrLjPY1RktM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWlRD1sArC/1E4s2wtEknJGg+ig9J62+fdXn1KTqQrbR7nW07OPXw5BkES0gVnekCb8ncSS5lcfm5HD4LdbTg3Hrt0ZrTav4MSI2XX6nIMZLQpRKNsykJvyuwjelPhkorDSsR8mwlbb1pU/B2ULQIDIyQwxefJ7QKkPf/eA/nwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlDQctQ7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlDQctQ7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so11425125e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329749; x=1785934549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnWzdGYJU4akkgeW94Uw4J7Vuwt1Z+oPdqO1diFcrX0=;
        b=MlDQctQ7tA1+urbYriOAZGGntE/D2iWhMqMnpa1p3HPexwhJdG5gokDJ9N7b7TVHev
         uRnJkQNXtkBwoUTl7mIaebnyLCoA35EfsDUMYYSSOvCCISl4GgIqe4WbQ6TWGeB5OUgm
         85IBZd70cuCw1rymbTyJ9lVFkRuYc9uA1y+YpuhexqARdlIuLLEHdvzKxqE7fe6hgGKL
         PEo0e0s+Aiykt3bH4Nu1fCrRIqLKdbYQpWo9SNi9h7/U1TuARgr+vEjlzsafnMgsbgki
         XrlV25j7evAqANDBj8F79TejmJCLxyqYN27Qaf9u9ctAqOzOXKSJ21KuTFG9pgedywQM
         1HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329749; x=1785934549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnWzdGYJU4akkgeW94Uw4J7Vuwt1Z+oPdqO1diFcrX0=;
        b=T92UO7m3lqe7Qh5JjH5SFoTSQuffoA67ZuMg8Mo7r8i/HgIj5W9Vsj+G3JTWEFb8tR
         +iU2x90IzVUUq6wjb9ri9JR8vb6qplOyPQi4JolQxDnJNxcuWto7mJsRf1XedsJ2DW37
         xm+Jj628ijyS6MOKDUl/VDVcrA5F3QlCLo7bqImlIkgLJQfqFXwpKIpx/T3Bh6i+oDgs
         sODzuv/QoH5nuu29r5JZ6AvK1uilmIGzHUcR5Euyb9cj7wJ94y5SvUTOcnPtgKVE/oXa
         R6q8jVK5hkKdaRfNIZHLAnHUIEyNaSWYMwi+teZzAbKmI8q/4frB2glCFoNmv8vHSHV6
         UFDA==
X-Forwarded-Encrypted: i=1; AHgh+RqDQd5m9KlpbjVUoWALBdWW0S0BcLeLSj+51DulYvoVq9Ai58eeg63NvJUoqmiTqVPbCHB8DYdKYMCi@vger.kernel.org
X-Gm-Message-State: AOJu0YyLKI27QtQ/bLwz12GkT98WNXqzbVxs0RKCj3UwpN/NkaZg9f6L
	XMV7+wiwnEYc4LI/OsswYNOP0gfj3NMhnu76CxOOUP4BRVZnCy0vGeuO
X-Gm-Gg: AR+sD12DJBFtE8zZ5DxN+gtrM2QzLYCmpEzZqIFLzg50kVSOVpHRW77M8yMvpOLY7I3
	/5zlda7LJxaV2vNEF0oW/g+GQsG3mxQl5OsYxUm/wThaXttPC3H3twGcbWTlvZRpSF2KAKcrTPa
	fb5CnQ3XMPK5ZbJHZNtogByav8uUYuBuqGCNGKDEy3vNMeUe/c3hA8xGWQA0RhPeF+93iv0qcfk
	i6I//EInoFR8GsAg3Yaw7pRHiF9QfqozKWBE4SFoGZH7LmTt213+KGJ9Q6X4nKzL1MET0h51WRJ
	1nZK1f+hzU2af5cP5Ybrun0RovcYxhsvKmo74pABxEhlMKBmB+fg0e2B3DuPK/g+1b1rYIg7iDt
	CFKTFEYob76SVXx56mL+QUsWHNaC6oZIF0BWMU89+l7PmIEkyz5wdiHgl5KrrwKSieS/Y3LYQxs
	TM1eEBc4sBVtcj/GLHijkG2jk8BWQnkPfCLPA/DWQ+9bT1RZvn5YlYl4J23k3zv+AlUjL7fWpCM
	Ktcxll6Z3zYmQ==
X-Received: by 2002:a05:600c:b99:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-497fd315023mr26656405e9.16.1785329748820;
        Wed, 29 Jul 2026 05:55:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:47 -0700 (PDT)
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
Subject: [PATCH v2 15/16] arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
Date: Wed, 29 Jul 2026 13:55:07 +0100
Message-ID: <20260729125516.230757-16-biju.das.jz@bp.renesas.com>
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

Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
Analog Devices ADV7535 HDMI transmitter.

The overlay enables the DSI controller with a 4-lane data path and the
display unit (DU/LCDC), and configures the ADV7535 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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

