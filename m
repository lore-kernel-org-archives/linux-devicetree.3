Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FED53A7F64
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706819; cv=none; b=cyUR+euFFtvpqubtOKRm6lxPCCR6lesV5PNzeFMVSXDSYtPhPN/N3RWvPRcvy3z+SWtmj8FZiKn8YQypIdlVBqgMOo6eI01adxW+VOcLbGAYRcm8Sqf4RkAtSpK2TS35+f1YHqvHQoxgxqm5NQV1MsVF1nK8hQlQoqfKyDJ0/9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706819; c=relaxed/simple;
	bh=9sh57TDQqH/7ssKytowavLn5M99k4zWI7dQ0wDDuyzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctCkDBBUDF0R1ZaCYLjhqAG6JgQvnhhOL7dkVW/nQO5e5DyelfD0sHNodCT+J8XQ5+pwWcAsjxwFuwxNjkhicz9ywW2sfpBwXLg/kn/yCmo92/c182AysVMzECBxu+Wku2nSZlWZM3QCtsZ+sINugFqqea+IG34Jq4qQkHeshCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qR/MHyzr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qR/MHyzr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48896199cbaso35034625e9.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706812; x=1777311612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28TcC2oMsGASecDBxaw71rZOaAWWIWdCO8FEc/B3qrw=;
        b=qR/MHyzr6V0XelXxMiwaThO6KgTwSMHKWXzvwYD2ccjrxiiyUcbF2NsCxdNGoBLfgR
         Knk3cDWQgrOhQlcHXiwlsaUg7d4RlL521ESvZ7ys+QberAdiGiVPj5Li49WjauaPGCXu
         6NIrQxF0hFdDCPL6T6yeuGlIlIY/igxJPUPMXPALNMZhUCRQYP/hLbyTIG59vK7O03Sk
         3k4ZwMty8kuPUGIGhyGLs7w1GAz3jp3r/+EanXdpMqSotcWhF6fK9vNOyTd4tecFiBSS
         RgIIOlZytHA7Pk0H9w69RWrHRWIE5ACCKZI6pf3V+ys2Sk4dOn2BhLi9iMN7BNlU3IOm
         z+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706812; x=1777311612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=28TcC2oMsGASecDBxaw71rZOaAWWIWdCO8FEc/B3qrw=;
        b=Egj6e8MYkAsqJtwXUBUiI8E8L0CIy3f5ebPa3rjY/qg9zGixQm3AQYGFyMfEPRou8c
         7bIkQzuEqbC0JHsA4zxbLd/smqm9vXQlXmOe0CYjvuOI7WAEI3tWxos73djRTS6layVU
         3reIHb0nsveNmrX73zOlQgdWTtbDc/ozuiEAahE9HsQxCwhcxQH67UEZdBucLmr+T3Rn
         IhloI16D+dE5Z1Aeqb+Vg4h3WfwUfctkM18I7qCA01glrO5pEGxNELPBO5PvFKE1lRBm
         BMu4Y0jPEEw3bMqZex1Slee5OUQL7IMNxbtxz/iGKVmwEt8q9LUU57GLVm0zHq6+6VV8
         R5tQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fAsqQf3VbQQn7e1FfPQFBTwIk3ruDZBQhQzClS15NDe/U+cMpFr+L3EfxfaXVTcPvcT2FcmM6y8R/@vger.kernel.org
X-Gm-Message-State: AOJu0YzEi9uuccv/ZY85xYyIl0KsCB3BhowsWJYpQt5Xmu2fDWGLly1B
	e7VQW6QbmRMplXSm7eyTG4QStO9PZ+na5l2aYyGU+GYWNTbcFPykwXEUn2gv2rpXX1M=
X-Gm-Gg: AeBDietNcVOau+bCXLrC6VbwaEL1M6mJLHWIy9DASVuNH/k5UxJl2iNgyvT5Ke+ZyA8
	szEE3bmlfyhdn7P/UUQKr6H85zh/vZFNSLw9lF/A63pmSqodMFxcuSNbm3tTfVISG5YbBA1LNWo
	yR4ERSUTmCFYoVvHZWKXVN6rgscu1x6bqh187K+UOR95KYM6XvsMA0W21tQ6CsMOxK+RvM9RYwL
	+ANHv57gtdkCRaNZD9n/OCV0U9Av65P82tFsEhqO8k7alZ9EAvoJdOD15lKzljunXrGHnh+4z+X
	jhZ43Tu2i/a18X6YcgcsQ2Lj5SN0wddd+MVNRll6IF/V09q2F4T4RUx9SaHysOpBNbJ093p8Ehn
	y1v8tkAzcxQpEIzNr8t5wkeVtMHb1qzM7tOBefghysYOGuXR3GBUxCzhkzrv8UTWow9szT3M1ra
	krNFyJy/XEJuAPqburvFQMYRMfZ7kBBAR6fxObbVi4dv+fMr+ENH55ThRO5z49i5sEsB+7EDK2s
	EtG7kfeanuJPezMlg==
X-Received: by 2002:a05:600c:8901:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-488fb778117mr153521775e9.17.1776706811718;
        Mon, 20 Apr 2026 10:40:11 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:55 +0000
Subject: [PATCH v3 09/10] arm64: dts: exynos: gs101: Add thermal management
 unit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-9-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=7069;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=9sh57TDQqH/7ssKytowavLn5M99k4zWI7dQ0wDDuyzs=;
 b=ybbkW7PAs2lzi9awopvn2/X2xHSJ6YJT1i3T0gkdLZZ+pvHOa8zy1doChcGdyRHJtX4WYwGID
 J5+CdT4WPqnB1flSAgTxcc6QZWjZ15yHZmK4HXe+Vcge6sApgsbgRZS
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the Thermal Management Unit (TMU) support for the Google GS101 SoC.

Describe the TMU using a consolidated SoC node that includes memory
resources for interrupt identification and a phandle to the ACPM IPC
interface for functional control.

Define thermal zones for the little, mid, and big CPU clusters, including
associated trip points and cooling-device maps to enable thermal
mitigation.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi | 136 +++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi     |  18 +++
 2 files changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
new file mode 100644
index 000000000000..b27d1a539ec2
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Google GS101 TMU configurations device tree source
+ *
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	thermal-zones {
+		cpucl2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 0>;
+
+			trips {
+				big_switch_on: big-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				big_mitigate: big-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				big_hot: big-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				big_critical: big-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&big_mitigate>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpucl1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 1>;
+
+			trips {
+				mid_switch_on: mid-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				mid_mitigate: mid-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				mid_hot: mid-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mid_critical: mid-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+				     trip = <&mid_mitigate>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			       };
+			};
+		};
+
+		cpucl0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 2>;
+
+			trips {
+				little_switch_on: little-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				little_mitigate: little-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				little_hot: little-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				little_critical: little-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&little_mitigate>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d085f9fb0f62..4b8c7edaddb6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -74,6 +74,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -86,6 +87,7 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -98,6 +100,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -110,6 +113,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -122,6 +126,7 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -134,6 +139,7 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -146,6 +152,7 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -158,6 +165,7 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -639,6 +647,15 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		tmu_top: thermal-sensor@100a0000 {
+			compatible = "google,gs101-tmu-top";
+			reg = <0x100a0000 0x800>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+			interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+			samsung,acpm-ipc = <&acpm_ipc>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		trng: rng@10141400 {
 			compatible = "google,gs101-trng",
 				     "samsung,exynos850-trng";
@@ -1861,3 +1878,4 @@ timer {
 };
 
 #include "gs101-pinctrl.dtsi"
+#include "gs101-tmu.dtsi"

-- 
2.54.0.rc1.555.g9c883467ad-goog

