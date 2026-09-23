Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331795678C3
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177087; cv=none; b=XNWzh+hSVMehtCX4zWA/o9v02Jg12gVvqmor5IP0/DDQ6vcsKBwvTXDQ6xrKQlEm0HBoUCOTXwT80e24bxdt/oKtlNE+J7GwAzjr7x1Q4vP/DMw4PciTcGNzSIvmYzF9QDh8TCfedaq5Ds3AfOOSCvVMr+/REaK/oJh4W+/AR3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177087; c=relaxed/simple;
	bh=L9jJiVOxZyUZuz1cElyCECjsSAjWfF9V54udftkhp64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbyUFsFvvw4XBkPoBV8Kz2B6AzXdJ2vW3Wd4wsNOb8pZDfCjq4LKX14aNsc6E+RHJnSGEq7uUEnIOhgdjXPH3BexkO9ruzMv68/9/aVjbYT28uezfvt7Jvpoc7qAR6aJHwiUvFckOPtUjMEY1P/Q/v7SGVOjxffPjyQALxsNQqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WdojOx60; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WdojOx60"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso462890f8f.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790177083; x=1790781883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qgYEofzcD0eUBX9qHujAnDMeKk0KiqVJqZ/6o5oZEs=;
        b=WdojOx60M1cABF+8zHfnpEiLRzOizhWk9Yvkk/Qbgu1g8Vu59KWMw2Nwza9TfFuRXd
         jMHR2ZDG1ZbFUtqx6bxH71/a5EqdDnm2gZ+pTiTtvB2SS2EIBDS5/fiu05YRhpu2c3ie
         P6VUiKo8dchHhq4WEdCi1MzmX1otH34UPlR2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177083; x=1790781883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+qgYEofzcD0eUBX9qHujAnDMeKk0KiqVJqZ/6o5oZEs=;
        b=ySQwBNuiSX3wsht9YLS3YbutLlXFUKHS6sdyKYbdViPUOlXuPtSU2I69DoIWwp7/Mj
         kmrlSTcbS+YVhTLx0nRh+/0QtWdoccsdDZmsfVYCh8fUEkBlgDCxH4GUeg40TeHQCwnb
         VbtFAtVtiflYEaneNinLhnDsLYeiR63MJ92z51bFTKSkj9l98L1LEUm6D3UzZgeWe6RJ
         +AuJxpYm5IgOFx5wVZtJbOhWkYaqczi9YD7Nq9F86Wu77jGCcI6V4zi8Qeqde8iPtEil
         INai0CGjqVGHK/gNGQ2+b53hJ8qGWtCUPzPcUh8N6jRwI216YQGQXtUYxdUzR9aKux8h
         BRjA==
X-Forwarded-Encrypted: i=1; AKwUvBweGIgSwCFFZE+RT+SZLQesWeGeAY7gIqaXaFWBAVncgIqF3/ytlZq8DJZQtie/tMJupIc9XbMmmkHV@vger.kernel.org
X-Gm-Message-State: AFuF++mFvRCCme/JtTcb/QnjeMQlVdi0QfNHYngZc+F97ToKBDA337HQ
	W3L2ik0Zu5wkxCkGzW15rUJErluGcVBv70JAf/i7NR9aX35Neqw2LogtTuih5F08eyU=
X-Gm-Gg: AYBFou2yMGnp2zajhhzT+nap4Ws+RIBdv05X4UL4gPDjUPLCu9VXgs7m97f1TFFW6Hl
	FLRSYtBEO4mr/M+JbP05L4muSP9YfM+cmRKbZf3ZKdz+eK6w/v2oWsc/YonX6NLIqlF+UMI+iFv
	45X6rlnb5Czm2LBg68hk+Lpu7iCquG3ZbC42rSZ0a4POdKGy2xIsjtnSUusfEC5VZ2eNB7db37e
	Nw5Sf4SQrHJYk+lLJfPX5zKcnLp5C78JXyZ3PXizc+nHcNi3R3eQS2P+Ny5XiyBkDZNQ2ZfZ62p
	u4/l/M4SuaqUYWTKR6y3wa1+vz0l1Sky7Q58a+bd+95geeyChe4Ib3EeHFujAnsng13iTE0Nca+
	8kYpjg3hW95vKlbNoS173p2Oha4N9Zah5kiyVjCgW22wzYG+ikZNFwsZdD2MB+Rd1eumNOEwh3o
	Jv2iIUIKZdrQOWZaZ1wqne3aDnhJapomHZXFyD7dytUjfJEea39MZrQfR2rxADPTAP9cdthGz3d
	K6Q22GvV9iSlC6whbAzvCK+A7m3ptCV4GqrTUwfn2qk1CkwcjK9GBVeaarAESD/r1V/J/c31Ubz
	yR21gPLKWlHW
X-Received: by 2002:a05:600d:8491:10b0:49f:ce79:7a8d with SMTP id 5b1f17b1804b1-49fde4acce8mr34646275e9.17.1790177083240;
        Wed, 23 Sep 2026 08:24:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c446e1sm55582165e9.2.2026.09.23.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:24:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	francesco.utel@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	michael@amarulasolutions.com,
	linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH 2/2] arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display overlay
Date: Wed, 23 Sep 2026 17:23:48 +0200
Message-ID: <20260923152435.563925-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
References: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
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
index 4b39b6c482d6..87d4bac1c89b 100644
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

