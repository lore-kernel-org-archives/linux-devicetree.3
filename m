Received: from mail-wr2-f31.google.com (mail-wr2-f31.google.com [74.125.225.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86105328C7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178824; cv=none; b=Z+/WaTsSC59J6El8Vl7yYbvjAlz5971GiCQ1XnqLwVkwyaR5yCuVRkhCUO0NsiS/Le6a5JzIYSwq1MObNBKsapcLHcpHpBDnVkhJ7r9Y5aSjqQmgKqmVYxZlxEgVcxJfKodKa/Op2DwBnpxio7pP8n9p/ipxyXjsC/PLecEPfgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178824; c=relaxed/simple;
	bh=BPXZnHuQvAcbpuPqPEcW37BwqUhd9iWtifkbdPGoVho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJiwNTl1mm2reIOc0C2caE9/P6kleQwDYMzLzI/msBfv/6kPtRvZzzZnem6d1pVEGgY5oiVAUKctjCE8xf8rSH5p4Iskw1kvOUfdgBxc0Kq7a4SljtP5aWyh2pY0hFD1EQ+5nqYtI4iBr0WghxO4RgeT4gE0ZzX0yuWSLR4m6lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FcoLk1NS; arc=none smtp.client-ip=74.125.225.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FcoLk1NS"
Received: by mail-wr2-f31.google.com with SMTP id ffacd0b85a97d-4843c2790ccso774903f8f.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790178820; x=1790783620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RconBTXU9LPf8lTB0K4UrjmNoGQpku4smOvmK7csrbk=;
        b=FcoLk1NS3b+o3852ZcRtvVOIZ0uokcnY1Jq6F2WyD10UoHNdLPT2aCLxdHBUEAdNi5
         QxMc2OQbVkgv72+4RnyLDogZj3HsDFsW4hSa47IDinrkwciC2iADCUqiXzNN8i854aUq
         kY6mkAyOVnVWiTv5bJylH23qTVjBBNgY0waO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178820; x=1790783620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RconBTXU9LPf8lTB0K4UrjmNoGQpku4smOvmK7csrbk=;
        b=WGyxVm6DcSoRy0SQliNXJfiur1KJkHq5KpMAHm9FqAcN+GF17ozxxVq0jXyx/nsR/b
         cDsVLs3w8k/EbJs1giK8JJGOyNHOeghvrmeI0nDNOZI4oTOt9ne2fp+aL05qSPE9xhTD
         hAN3oTroDsfRV1voKCFeCz71axOZtJ8/sqS2B0TY/y+mnf9k3VBNu9sAYYwH0MSLYzLn
         tzcqd756xVvi1wGJ0GvnRSVhivzD9Y/iY1DUyNmpLInJg4p0lY1pRMYa3OhBxkSSRp1f
         tHlhSkOAMnNeaLSetcba6dFZyGMNJt188WdxoxWeDgbz/ZyQ6R7A0ashQHsRfG+EwFTX
         mQOw==
X-Forwarded-Encrypted: i=1; AKwUvByU/83BMZhvc7fPrLNiJw4IeYL4h5Gbx99L6jrLULso+ZgD29PF8EkWk2k3tFApOGM3PA+tqs+tKSEB@vger.kernel.org
X-Gm-Message-State: AFuF++ma3FJFSUCMUcVJBsRwigNoHhPnXKI5QAnL/UGK6PSofmn3/RRA
	qKk6MZXYOxhuClVJ2pYkpOljTtscb1+FLCjbbCKMMD9Hh1LyNIN5p5UDp09jORl+zF0=
X-Gm-Gg: AYBFou24kug2NWK8DDL8av66bRonCm0+mwdgKrAuhErAEqp39jnML71kLp5bmhC7E6p
	4ecLP5BPyXm0CPE5srUSJhRo7gH8CsI9kkq7XuY6VSSqFn4AynQ1qy4pQkG6/XXH+QokxaLwrUv
	Mdv+IesnLSVvQ+qnGn2wS1hYTObM9J9tTw6FqfyH3t/n7P7ECD9fL5UGgZDn2CwlzqXrXpaU6Mb
	8mY/HIfoUeJMUaM1gvah2xSyV0y+KK51s2iRzxqTKuS5suQbhs2F3Y/EwIi9tAjV6qIsLOSysHc
	8gWJTSX6OVbC/PbYMofGxFfdhNnkXNONWWAwfrrz6NJYKB+ceI6ByPRs3Nw+DE8+56WC3bhR2Ze
	Ft/yJt/1vHLo8WQxvAPbgcFgqsBC9dUSRJmoFFOteA4Y4UrvTzPtOMeOBtGyXYYEknsbl2xZt1I
	PdoYpCk2g9Bu8BrCM3bo0dzDfsRdUQuZkHhGRByDd8R5di8TYB6p8+Z/cJzji0YphPrTBx4GG0g
	JaOWBi5iV6TIzrCJ2C2T+jjATCDmmMSphEm4HWIp2vritd1o13rqpjBsqx5Y76qNEXKgPCzT2aw
	Jew=
X-Received: by 2002:a05:600c:1382:b0:49f:ce78:3566 with SMTP id 5b1f17b1804b1-49fdeffd72cmr43711015e9.23.1790178819775;
        Wed, 23 Sep 2026 08:53:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm81858555e9.8.2026.09.23.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:53:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>,
	francesco.utel@engicam.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 2/2] arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display overlay
Date: Wed, 23 Sep 2026 17:53:10 +0200
Message-ID: <20260923155333.610134-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
References: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an overlay for the variant fitted with the AM-1280800W8TZQW-T00H
10.1" 1280x800 LVDS panel. Its touchscreen is connected over USB, so
there is no touchscreen node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 arch/arm64/boot/dts/st/Makefile               |  6 ++
 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   |  2 +-
 3 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 218ff7fdf576..7f657d2bd629 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
+stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h-dtbs := \
+	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtbo
+
 stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a-dtbs := \
 	stm32mp257d-engicam-microgea-rmm.dtb \
 	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo
@@ -7,6 +11,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
 	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtbo \
 	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb \
 	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo \
 	stm32mp257f-dk.dtb \
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
new file mode 100644
index 000000000000..7655c1bf56b1
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Ampire AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel. Its touchscreen
+ * controller is connected over USB.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/st,stm32mp25-rcc.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "ampire,am-1280800w8tzqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds_out>;
+			};
+		};
+	};
+};
+
+&framebuffer {
+	clocks = <&rcc CK_BUS_LTDC>, <&rcc CK_KER_LTDC>,
+		 <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
+};
+
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_out: endpoint {
+			remote-endpoint = <&lvds_in>;
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
+		port@0 {
+			reg = <0>;
+
+			lvds_in: endpoint {
+				remote-endpoint = <&ltdc_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			lvds_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
index faedddc2c914..96b7cb6b5bc1 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
@@ -43,7 +43,7 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		framebuffer {
+		framebuffer: framebuffer {
 			compatible = "simple-framebuffer";
 			clocks = <&rcc CK_BUS_LTDC>, <&rcc CK_KER_LTDC>;
 			lcd-supply = <&reg_3v3>;
-- 
2.43.0

