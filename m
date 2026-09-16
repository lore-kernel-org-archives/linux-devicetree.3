Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EC73DD867
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543000; cv=none; b=s3V24eVLoPMnjFgPpw1QhfTVBYhH/5zht5+7E+mk9gBoNZeqNdIrPzoCyxkfA+YZZ1OsecNSyj7+XpVi49nBU3lKueqQPb3GKjyqqLdmj6ybSD0GLYM9PsgV0lxBzhEgbdJmDUoCwRCmSJfpSaRvBoQ+d3rZ3mylWrekPB3RV4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543000; c=relaxed/simple;
	bh=AcX2unbYc6kbxDyYiKyDovsSoMq3KmfEvLdD8/tyzoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQX2fiYRp4JPpugzO1q576xswtCoFa+oCyXDcPjSW2tQ3QxWfVctCWaId0/cPmSa9o21rkjKLbOwIcrY45dk0F+V1dNAUZbuODGOsj0d5oNhyV7kusq20BISgADbgwRVffcH25gyfx5zj52ef4ATeFXjD6w7iLj4KlLzys1P2Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me; spf=none smtp.mailfrom=mswin.me; dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b=WE0ZH/8/; arc=none smtp.client-ip=74.125.230.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b="WE0ZH/8/"
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3a49bfe419aso12833281fa.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1789542996; x=1790147796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLBRU0pIWM5Jci7fKn6jRMpE2Xm2kCD8LRfqh5i4zTE=;
        b=WE0ZH/8/BrEXyd48yOPVyY6tFnGVid2zY3va4rayk03XYH67TbSsszWvoA96NKQ9v5
         PFFejsAnym7w5iIfxEdrnAUmiO21Z+naFOTwcF1wx2ih3CFwoYJyUBMNjLoIqoh4/YbF
         nYh+BdIJAtTqaBZ2o+lWUlY01+QfquIG1ulvxALezt5IEYgkZdKESt2uCrId6HBDY9Pz
         TLgg51N4zOc67gA2qppUyIWZPRAtPJcUNGd7occj+WFrCcUWM66TCuSab9iHTsnQQ8N+
         7lUe6ZlwOzOs8ftG8zVgugqHw4KpHXp/3tlZebvhEFTNfcd6fn+XaZa4tEnlyPkBh2c8
         x78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789542996; x=1790147796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLBRU0pIWM5Jci7fKn6jRMpE2Xm2kCD8LRfqh5i4zTE=;
        b=Lam3NXqqtmA3DPy2VtMU0X1vXxQaM9fa5Ik8+aVkRNJ0TPVt+oZsuHgyPh/Nw6vPIo
         cYZHmxoXrkONgtC0/jy95hwDxeYMLzWTvbUo2IDuAVvOmWDt+5XEr29n+E9K3r7SvlXv
         2tr5oJ57fbZrSf4k3iZ4QeGx4g/2BRAUxGOJHh3uIkGo0m4Btb4btWx+XiUy8J08uvXR
         UNFKbqQR6Ks1EQVmjxLI7ZYCdyDbFw3A3MXv7s1ZZdSSiJhhDKx5Vqk4OhSqheUsDAiu
         1+EVlh+4h4KGl/Vdwozk35TZikEoobbb7xEhkfy2z4Kk6uQyT9f5sZanSTi9hZ52xFA8
         R4rg==
X-Forwarded-Encrypted: i=1; AKwUvBzNn/v+lDVjFGFc8VlyiS7plcuqwRsjatBLP3wI6fpuHMtLY8Ufn8isye5ALSTfaR3FHkksxpSZQfd2@vger.kernel.org
X-Gm-Message-State: AFuF++kVihgzzvgJBr7xpt7izxK7uNRyCuD5o261GTjeAPEYG7QPZQVV
	KifvAdCFluArAgAJcqQRFGy0fbx9EpgEp/Fqay6+AvN2AxxXtq8ZO3r6IbnQjrXQGHg=
X-Gm-Gg: AYBFou1fOpWBRGK16EX60MfSsFO3fYQngdgjZCkTyYyfrfMznl2zUoknOdZZwnqDi5z
	Prz0Tbt0bLjndnXGXLIt7KAiagslcWMzUGSVz23BdavTIpr9MweMf631ybDDXoPCOKaqkMq5esV
	MiFEhZfgo9HkEDs9o82uaClvwSCOOIYraO06uSgUwkn5x4IgPcM/E16fA1yFxB/JOfJuujO+R6J
	cvOkXgtoBRDEYbBciOAYt0xFG9xfFVD3MUyVd8XVczaD89Lq9Oq3l93OnW8Vm9DkU1gJDftzx6d
	OTdWI8SRf9+At5X/RDMZOIs+4s9pJQjOvRR5wlg27Q6HSvltgmYxb62t2oqoaFybBZOdkWkdcW/
	18DpZblfnWTTTAK1XRzDO2VDPVhqPziQqUSq+YLO+/PKx8ZGBqI9kPtULv21kEYTw1oDroe97kP
	D8ymnghqZjtxoFnpLnIKE073OCUg60Y8gyAdAE7g7UBmpeJRqzjDKpvMx7u55NpS/S2DFbpA==
X-Received: by 2002:a2e:a807:0:b0:3a5:db7a:2395 with SMTP id 38308e7fff4ca-3a5dc9cdc4bmr5266171fa.8.1789542996130;
        Wed, 16 Sep 2026 00:16:36 -0700 (PDT)
Received: from [10.122.136.195] ([84.47.187.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dafee2e9sm4462391fa.40.2026.09.16.00.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 00:16:35 -0700 (PDT)
Message-ID: <a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me>
Date: Wed, 16 Sep 2026 10:16:34 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm6125: add TSENS die temperature
 sensing
To: Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821030325.1823829-1-admin@mswin.me>
Content-Language: en-US, ru-RU
From: Roman Linev <admin@mswin.me>
In-Reply-To: <20260821030325.1823829-1-admin@mswin.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Arm64 DT patches, against torvalds/master.

Changes in v2:
 - wire CPU cooling: #cooling-cells on all eight CPUs and per-CPU
   passive cooling maps for the cluster-1 CPUs, cpu4..cpu7 [Konrad]
 - make the TM/SROT register regions 0x1000 long and drop the inline
   comments [Konrad]
 - drop the sensor-mapping comment from the DTS; the provenance now
   lives in the commit message [Konrad]

Patch 1/2 is unchanged and carries Krzysztof's Acked-by. Abel's
Reviewed-by was given on the v1 content of 2/2; it is not carried onto
the reworked patch.

v1: https://lore.kernel.org/r/20260821030325.1823829-1-admin@mswin.me/

Patches inlined below (also against torvalds/master).


[PATCH v2 1/2] dt-bindings: thermal: qcom-tsens: add qcom,sm6125-tsens

SM6125 has a TSENS v2 block with 16 sensors. Its register and interrupt
layout is identical to SM6115's, and it needs no calibration cells
because v2 self-calibrates, so it is generic apart from the SoC-specific
compatible.

Document it in the v2 list, bound by the qcom,tsens-v2 fallback.

Signed-off-by: Roman Linev <admin@mswin.me>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 5a8f767..0ac3fdf 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -79,6 +79,7 @@ properties:
               - qcom,sdm845-tsens
               - qcom,shikra-tsens
               - qcom,sm6115-tsens
+              - qcom,sm6125-tsens
               - qcom,sm6350-tsens
               - qcom,sm6375-tsens
               - qcom,sm8150-tsens
-- 
2.55.0



[PATCH v2 2/2] arm64: dts: qcom: sm6125: add TSENS and thermal zones

SM6125 has a TSENS v2 controller with 16 sensors, at 0x04411000 (TM) and
0x04410000 (SROT), with SPI 275 as "uplow" and SPI 190 as "critical".
The register and interrupt layout is identical to SM6115's, and being v2
the block self-calibrates, so it needs no qfprom nvmem cells and no new
driver code: it binds through the existing qcom,tsens-v2 fallback.

Add the controller and thermal zones for the 15 sensors that are used.
The sensor-to-zone mapping comes from the downstream device tree for
Xiaomi Mi A3 (laurel_sprout); the binding documents sensor 5 as unused,
and it is left out. cpu4..cpu7 are the downstream cpu-1-{0..3} cluster
sensors: they get #cooling-cells and per-CPU passive cooling maps, which
stay inert until a cpufreq driver registers cooling devices. The other
zones report temperature and carry passive and critical trips; GPU
cooling can be mapped alongside the GPU node when it lands.

Tested on Xiaomi Mi A3 (sm6125): tsens0 binds at 4411000.thermal-sensor
with no dmesg output, the thermal zone count goes from 5 to 20, and the
15 new die zones read 37.7-39.6 degrees Celsius at idle. Under a 660 s
glmark2-es2-drm soak the hottest zone reached 52.2 degrees Celsius, well
below its 85 degrees Celsius passive trip.

Both SM6125 boards still build with no new dtc warnings.

Signed-off-by: Roman Linev <admin@mswin.me>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 336 +++++++++++++++++++++++++++
 1 file changed, 336 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 86de156..4eda56c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -45,6 +46,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -59,6 +61,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -68,6 +71,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -77,6 +81,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@100 {
@@ -86,6 +91,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 			l2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -100,6 +106,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@102 {
@@ -109,6 +116,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@103 {
@@ -118,6 +126,7 @@
 			enable-method = "psci";
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
 		};
 
 		cpu-map {
@@ -719,6 +728,17 @@
 			#interrupt-cells = <4>;
 		};
 
+		tsens0: thermal-sensor@4411000 {
+			compatible = "qcom,sm6125-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x04411000 0x0 0x1000>,
+			      <0x0 0x04410000 0x0 0x1000>;
+			#qcom,sensors = <16>;
+			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
@@ -1634,6 +1654,322 @@
 		};
 	};
 
+	thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cdsp-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		wlan-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss2-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 9>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu4_alert0>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu4_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 10>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu5_alert0>;
+					cooling-device = <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu5_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 11>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu6_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu6_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 12>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu7_alert0>;
+					cooling-device = <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu7_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem0-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		display-thermal {
+			thermal-sensors = <&tsens0 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point2 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
-- 
2.55.0



On 21.08.2026 06:03, Roman Linev wrote:
> SM6125 has a TSENS v2 block that mainline does not describe, so the SoC
> has no die temperature sensing: on a stock kernel the only thermal zones
> on an SM6125 board are the handful backed by PMIC ADC channels.
> 
> The block needs no new driver code. Its register and interrupt layout is
> identical to SM6115's and, being v2, it self-calibrates and needs no
> qfprom nvmem cells, so it binds through the existing qcom,tsens-v2
> fallback. Patch 1 documents the SoC-specific compatible; patch 2 adds the
> controller and the thermal zones.
> 
> Sensor-to-zone mapping was taken from the downstream device tree for the
> Xiaomi Mi A3 (laurel_sprout) and cross-checked against sm6115.dtsi, which
> agrees on every sensor the two have in common (2, 3, 4, 13, 14 and 15).
> Sensor 5 is not referenced downstream and is left out, so 15 of the 16
> sensors get zones.
> 
> No cooling devices are referenced, since SM6125 has no GPU node upstream
> yet. The zones report temperature and carry passive and critical trips;
> a cooling map for gpu-thermal can follow alongside the GPU node.
> 
> Tested on a Xiaomi Mi A3: tsens0 binds at 4411000.thermal-sensor with no
> dmesg output, the thermal zone count goes from 5 to 20, and the 15 new
> die zones read 37.7-39.6 degrees Celsius at idle. Under a 660 s
> glmark2-es2-drm soak the hottest zone reached 52.2 degrees Celsius
> against its 85 degrees Celsius passive trip.
> 
> Both SM6125 boards (laurel-sprout and ginkgo) compile with no new dtc
> warnings: pristine master emits 7 unique_unit_address warnings on the
> geniqup nodes, and the series emits the same 7.
> 
> I have no other SM6125 board to test on, so the zone naming beyond the
> sensors shared with SM6115 rests on the downstream device tree.
> 
> Roman Linev (2):
>   dt-bindings: thermal: qcom-tsens: add qcom,sm6125-tsens
>   arm64: dts: qcom: sm6125: add TSENS and thermal zones
> 
>  .../bindings/thermal/qcom-tsens.yaml          |   1 +
>  arch/arm64/boot/dts/qcom/sm6125.dtsi          | 299 ++++++++++++++++++
>  2 files changed, 300 insertions(+)
> 

