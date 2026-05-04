Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A828A257824
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 05:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777871066; cv=none; b=fMvEAxL5YB0k1o58G5rEv2WLX5wVbm2a2Y+vcDCLAdVjk08xPa66ISmmyfM8v3hvLjRxpZXky0N8D2qJV4WDHJEcbv51O0YYyFbZ9vOv6R2rA3pywJ6h7H73VC5bKl/GJsdCOiScTYCIXNEXNXmMHiEUrYzTd97PDl3vu1xquyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777871066; c=relaxed/simple;
	bh=+AfMOyYfNSai/vzHaaojDNYbQlGipPu5vQcMVMO/QuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9hhNLfepffVmiAXit2lN+tbjKPQjpcqdlS1LwyCOuduY6J1XyVCN/zctjBUxHtg+5kVmgI8Jme8QNIV3tWDzH0TbgWyQqPuNmgxJByQ7ahdjl+bmptW7MtXrQCSc4n5Clh8lqxIBh1E8A32+Xo3fg+CZM+tT79UQ3ifg9eoh3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFTTDpdh; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFTTDpdh"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-364ef7a759bso1443470a91.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 22:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777871063; x=1778475863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Zx5JZiDM7P1W4ijYGbXe8KVsddltmoo33akfRDuMeY=;
        b=QFTTDpdh6uV0ywKQpwihWGLymYwcci3jkbDVCkPvU0ezxBoFu11JOsd7F2Dqk+lWrm
         w/GfR2fGYewpQyjZCTJdV811NHknQJro3obZ5Y3zWu7gPZBD3d3y+lWj52SiTq538c3h
         tshF7+s/ymtdN8cL71U4oH2z2+/vjsZCxZSwUVbXjmE/kkjuAiuhKKkXAqrRoU668CTv
         zZmrh2AGD+zV1Ism/57WhPB5a6IbYMHSpqgZ2E6RX8hnOjZKaITBIOZqftLWqV7XvkGI
         1ryR72fPSHpWwemKC04v8U2Lyebq72fKeQzsn28OT6K3tHBmmT4SlcYTQhEBw4ELZjtZ
         ZBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871063; x=1778475863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Zx5JZiDM7P1W4ijYGbXe8KVsddltmoo33akfRDuMeY=;
        b=jBXi/u7IKpi5Zu9diD66H2TAey3JH/3dUmBV7UwICPvOANody1SeBL3y1Wss2w3T/Z
         sZwtvA8SvBPyrw2l9uM/i1LdL1u8bwWBVWQ3pZ1Eg3tHgzgD0qzHmYhf/F6YPjsuRF63
         rshatBKJv9OxArt7eo38/BdmrRjDBWibbxRhp26sag2OJ264F0EARz53AdPaF2/TAXbm
         2mSK64Aa/Ab80opHksriEUNM/AU7IwA1FI/g02Ajp4Bdxt9Rsz1eRDHYl0PbhKnlEZa1
         SZk9xrhHOwgq5L3X+OyOfP4BAa1fZ00QipAq/1ZzkoX/SXwrqy9UcmkTMiQyUR1/hOJ9
         JPuA==
X-Forwarded-Encrypted: i=1; AFNElJ9lkp2wUwLJH8wZUyBoU9vCxmwVGIhDyz1VyGzAmtntUCMJS0k1zCYIBsE2tNU+CJ++DO4+MR1EAz0C@vger.kernel.org
X-Gm-Message-State: AOJu0YyExvvyDwM5odDcBMgNIe9nR6OdGcpcwMrCMT5jgqZ1o71vl9qe
	MPoV3iOs1gV4o6y0LdSTmBx4OoJ2DHl91Waynwe4DP4L9fDC01mFUpJz
X-Gm-Gg: AeBDietQnFLikly6eu8QnpadiWwN1o85MeMFkmL6XK1LoOfCQhwN3CYWOAYn7U9uZW5
	TGBqAjgP3awH8h3JeYhvackt4qfxX/St6RQtJCLdjh6QiO/MWYUhAdZdBJrG7IRIUtMKg+CfAg7
	y2jDP3Vpg9R64uhcF6R50Q9U9Uva//J73Ey6HKZsQ106IEE51wsXx+vjosy5D8xcmbU1gjb1MoF
	+x9wUgybTYfTVRyGMm6gGxRQ4V4JQnR1l8Huqsw/KDWyOWEw86v00V4oKM0hbt4V+PrrvAGJQtP
	D3x6WzRXdPqK02Uxzq+8KAo+Quap46scZxKumRt3uXMCt7BVC3OzwVbhGp2JSncSKqjTCqNKiyp
	zO1g0fk6/qZ0Ijyr8z1ZKkO2C8NjzvjoIU7L/F4B7iVQzEdLIKiDzqrtsEJKEDOB7sOxYpLq1ZO
	9wgA==
X-Received: by 2002:a17:90b:2586:b0:35f:c258:a9a2 with SMTP id 98e67ed59e1d1-364c49fc890mr13397626a91.17.1777871062958;
        Sun, 03 May 2026 22:04:22 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:04:22 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Mon,  4 May 2026 13:02:45 +0800
Message-ID: <20260504050245.646078-6-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504050245.646078-1-iuncuim@gmail.com>
References: <20260504050245.646078-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 processor has two temperature controllers, THS0 and THS1.
THS0 has only one temperature sensor, which is located in the DRAM.

THS1 does have 3 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu

Add the thermal sensor configuration and the thermal zones.
Trips temperature, polling-delay and sustainable-power parameters are
derived from the manufacturer's BSP.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 5afa8d92a..288a4710b 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -26,6 +27,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0x000>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@100 {
@@ -33,6 +35,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -40,6 +43,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -47,6 +51,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			reg = <0x300>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@400 {
@@ -54,6 +59,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			reg = <0x400>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@500 {
@@ -61,6 +67,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			reg = <0x500>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@600 {
@@ -68,6 +75,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			reg = <0x600>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@700 {
@@ -75,6 +83,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			reg = <0x700>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -565,12 +574,46 @@ dma: dma-controller@3002000 {
 			#dma-cells = <1>;
 		};
 
+		ths1: thermal-sensor@2009400 {
+			compatible = "allwinner,sun55i-a523-ths1";
+			reg = <0x02009400 0x400>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+			nvmem-cell-names = "calibration",
+				     "calibration-second-part";
+			#thermal-sensor-cells = <1>;
+		};
+
+		ths0: thermal-sensor@200a000 {
+			compatible = "allwinner,sun55i-a523-ths0";
+			reg = <0x0200a000 0x400>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC0>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+			nvmem-cell-names = "calibration",
+				     "calibration-second-part";
+			#thermal-sensor-cells = <0>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
 			reg = <0x03006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration0: ths-calibration0@38 {
+				reg = <0x38 0x8>;
+			};
+
+			ths_calibration1: ths-calibration1@44 {
+				reg = <0x44 0x8>;
+			};
 		};
 
 		gic: interrupt-controller@3400000 {
@@ -1087,4 +1130,115 @@ npu: npu@7122000 {
 			power-domains = <&ppu PD_NPU>;
 		};
 	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 1>;
+			sustainable-power = <1200>;
+
+			trips {
+				cpu0_threshold: cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu0_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu0_critical: cpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_target>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu4_thermal: cpu4-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 0>;
+			sustainable-power = <1600>;
+
+			trips {
+				cpu4_threshold: cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu4_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu4_critical: cpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu4_target>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 2>;
+			sustainable-power = <2400>;
+
+			gpu-trips {
+				gpu_temp_threshold: gpu-trip-0 {
+					temperature = <60000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				gpu_temp_target: gpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				gpu_temp_critical: gpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+
+		ddr-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths0>;
+
+			trips {
+				ddr_temp_critical: ddr-trip-0 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+	};
 };
-- 
2.54.0

