Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378488;
	b=LwyopDBLwizm8TwGPgATgdC2sjuR/qSRaRrzvdsMFBjDmVz+dEM42qrqbidOCZn+OpdY
	 4A2MyunoBm4s9UxmjcjAbAbOQ7AOdvitZLQdAQURyuazIJ7KO87x1sM5mOGYls6l1VB86
	 KAGegP3714BwOxWGy+X5lTNbJYe1BdcKPvJ1tw4oJEXYIpIn6McM7zBVhwcxlM830uavW
	 qqZHYmby+7Ywd/1MqdZUBU2+R5Pg7QSgjzbh6Wgw0N/skxlWMG+e83QlKOakOUeTi/0gF
	 LMLRKf/DHlOHYtf5ItZoP8kFW//Xh2TZCPjI/abxwLL6OEoEA9fWuvQDtDydKRHhASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qzgTBfgxIfUP5W7y/eXEWnvcFhXPlfOZGJqPedmbfKI=;
	b=MPqMZeR5Zt6y/Xy4ByuNioaO1pj4TbOEYNhnLmqmcWO5igORVIX7gykzAm/JJF3oTAQN
	 bmcdPwJJd8DNpuqUnO+v84GiI+Vxyiu7r3CiCEoD+xXyfVGxS0ycbNZ4amAUlsiJNcMj8
	 yVlmb9F3wZp/CDbesLQKqMg9OaN6twWNckdjRYeR49HOptJ2RYoCNN6KZQ4yCIowZdXd4
	 l1rYcOo8/k7xeJ5dX88v81Sz4ouuA/Q9oWtZ/QQMxhe4a7PyE+Q4Z2hwi1jGBLjX6tugA
	 KKCsYLTV/OU8yHZW27bFC6EL5L0RX3wt3GuLk0pQc7q/hGHLFa5K2R3qVRoTyyWRnnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DoI2Aywa;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93169606A681
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93169606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DoI2Aywa
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso3221514a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378487; x=1795983287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzgTBfgxIfUP5W7y/eXEWnvcFhXPlfOZGJqPedmbfKI=;
        b=DoI2AywanOkTCcmIL9RteRdrA8iencCXt5BORqBbjeF/aQe3YOz5KZ+oPsQLZkqhLY
         7jPMKjFOYN39WbScEPYG5GaWztTBBc7qW6RoAOnpFqYFRHgAVR0R8h1BpBWug86oP5AA
         iVXFk00n3wJw+JEn0LMJDYFKCicaTA/eeZTKOtDXLAaA0vvZ78dhTAkSLU86/j5vjq9O
         /NvkJU3dIX4fTb4zGf47qyET+ypuP5MVAVeHcLeExijC87ClmXzuMNRDzUrqlESQ0W0m
         rt3BsUidLg8dXW4tQKzIe98w3vVU5QxAZDOJYUX7NUF+SjQYQqc5Ww6EvNwQNjt0eKkD
         yKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378487; x=1795983287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzgTBfgxIfUP5W7y/eXEWnvcFhXPlfOZGJqPedmbfKI=;
        b=hHtf+3PayIVP9lDK/D+qdmakVzKA5aWZl7dbJjh+e/nhnhJ3XYuzWcrGn400A1WV2U
         PvuTRCS4cZiMuYX3Oh3Evs6Y35RAkWLHqw+3qW0/hxe7fiXIdh+VSiff++ik1Z0ohTda
         f9It7VX7z9HkS2W3TI5LwXMZrD0MdInHWucXKPkStOZpc/QlejtKOGlcQW9+mcA2ZF86
         CwLsl/tHERG7/ztI1naPi4KQCSDjW6AsPH1r+5Sr2lw99Zu8jDox/81CkTnSmxW95YxJ
         VPoT/1HZphiilh3HwquK3B7yxnkAXN/21ThdcWF/S/VmK6MJpPU9bl0pLwvHHg/+iLq7
         deBw==
X-Gm-Message-State: APuU4Z8sIsNOFprN33XI+BKs343F7DMiUbXwawSHMLxrHjc4ldwevoV5
	YFV3VVT9h6hEdyWGe+jZg/vrk2QIq7XmOrFbnNW9TKUT9qrghM2k0nYreouuYw==
X-Gm-Gg: AZFdTZe4Jp/oMM9OKTPxEgpD3n3HUQCq3jA5aR1A/wESX3P2SaoUNYsd4Fc2gzwx19h
	cJTA0NT33JVZisvg2d2yKbDAO6YXgVQZPqJx0B4cuxRThA/SKMqDvWH4yHthiFFAjYt0fbrlkko
	UGmQhcc0Qz8oFV7c5atLqD3dtvchRfpouvofmQSNwjZTMxnfuQVCvblEckkTw7eFojJnM+S1btN
	Gt3FNo/8k4gX95ZUu3NqUJEHGBvFmT14h65keZNvHjMyhrSxbKPKXhNcHKXdbME8vvJcDXwXrU+
	TpP/TabuL89GBNDU7pKGNJgYVMwlLzUlONzgOOIiL7vVqytl3ECVV/WcRcrCuOXkqUCrHCahtPJ
	lAqEGdF2ImxZWlGPhTgV406zT97zwdqgFIiM4unPR+kFeG/SzsVhZWOg7iwQOSo5p+3r1rVEWzV
	x8eyYC2sOX5L9MCSmMPr4YpqNDWUjddyZN+bos+GLhWFXbCKwxRHnPoafgA1VqUTCedFpolS/Oe
	RbsGPPg51mIXWRT1OzMl1FA5wvRoXtoXQU82rXVa+vn/I5LEj40wtLc0WNnBTD8vVYkBMsRPdYl
	VRXxqmFeEEVkyeibk5wNfN3l1cFGzltJ63JeZPfqZDqW0+4eLoKWUuTcPns2E+HGXKZrVKk+X65
	bRVB+gLpNXw==
X-Received: by 2002:a05:6402:23d0:b0:6b7:a2d1:b2e8 with SMTP id 4fb4d7f45d1cf-6ba37e69e00mr5979617a12.17.1795378486939;
        Sun, 22 Nov 2026 12:14:46 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:45 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/18] ARM: tegra: tegratab: Add thermal configuration
Date: Sun, 22 Nov 2026 22:13:58 +0200
Message-ID: <20261122201407.23742-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add thermal monitoring setup based on Palmas GP ADC sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index bb5788b2539cd..cbf9b45284033 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
+
 #include "tegra114.dtsi"
 
 / {
@@ -983,6 +985,9 @@ fuel-gauge@36 {
 			monitored-battery = <&battery>;
 			power-supplies = <&bq24193>;
 
+			io-channels = <&thermistor>;
+			io-channel-names = "temp";
+
 			maxim,alert-low-soc-level = <10>;
 			maxim,double-soc;
 
@@ -1011,6 +1016,21 @@ usb_otg_vbus: usb-otg-vbus {
 		};
 	};
 
+	i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <100000>;
+
+		power-sensor@44 {
+			compatible = "ti,ina230";
+			reg = <0x44>;
+
+			shunt-resistor = <5000>;
+
+			vs-supply = <&vdd_3v3_sys>;
+			#io-channel-cells = <1>;
+		};
+	};
+
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -1025,6 +1045,21 @@ palmas: pmic@58 {
 
 			ti,system-power-controller;
 
+			palmas_gpadc: adc {
+				compatible = "ti,palmas-gpadc";
+
+				interrupt-parent = <&palmas>;
+				interrupts = <18 IRQ_TYPE_NONE>,
+					     <16 IRQ_TYPE_NONE>,
+					     <17 IRQ_TYPE_NONE>;
+
+				ti,channel0-current-microamp = <5>;
+				ti,channel3-current-microamp = <400>;
+				ti,enable-extended-delay;
+
+				#io-channel-cells = <1>;
+			};
+
 			palmas_extcon: extcon {
 				compatible = "ti,palmas-usb-vid";
 
@@ -1546,4 +1581,95 @@ vdd_3v3_com: regulator-com {
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
+
+	thermistor: thermal-sensor-thermistor {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+
+		io-channels = <&palmas_gpadc 1>;
+		io-channel-names = "sensor-channel";
+		#io-channel-cells = <0>;
+
+		temperature-lookup-table = <
+			(-40000) 2726  (-35000) 2708  (-30000) 2683  (-25000) 2649
+			(-20000) 2605  (-15000) 2547  (-10000) 2475   (-5000) 2386
+			       0 2279      5000 2154     10000 2012     15000 1857
+			   20000 1691     25000 1521     30000 1351     35000 1187
+			   40000 1032     45000  889     50000  761     55000  648
+			   60000  549     65000  464     70000  392     75000  330
+			   80000  279     85000  235     90000  199     95000  168
+			  100000  143    105000  121    110000  103    115000   88
+			  120000   76    125000   65 >;
+	};
+
+	tdiode: thermal-sensor-tdiode {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+
+		io-channels = <&palmas_gpadc 3>;
+		io-channel-names = "sensor-channel";
+		#io-channel-cells = <0>;
+
+		// TODO: add a table here -25C to 125C
+	};
+
+	thermal-zones {
+		thermistor-thermal {
+			polling-delay-passive = <1100>; /* milliseconds */
+			polling-delay = <15000>; /* milliseconds */
+
+			thermal-sensors = <&thermistor>;
+
+			trips {
+				thermistor_trip: thermistor-alert {
+					/* throttle at 55C until temperature drops to 53C */
+					temperature = <55000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				thermistor-crit {
+					/* shut down at 60C */
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-thermistor {
+					trip = <&thermistor_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		tdiode-thermal {
+			polling-delay-passive = <1100>; /* milliseconds */
+			polling-delay = <15000>; /* milliseconds */
+
+			thermal-sensors = <&tdiode>;
+
+			trips {
+				tdiode_trip: tdiode-alert {
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map-tdiode {
+					trip = <&tdiode_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
-- 
2.53.0

