Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCC43CE4BD
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556184; cv=none; b=iyutngUh1quMNwmLA+LPKoKfC6sATk8QNKBpL7NW4K3X6iQ79W5hi/ifw8KTNStCNjwpttw/poD0FAMSixSWMsa3hkcMKuMcn3Eskh94T9+gVpNIm1pBVHxwpHphgmnAQkEthCKKuEeWJWuJVC/F0QaWn0aB8dpjR539VoniO5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556184; c=relaxed/simple;
	bh=4YGmBSqTM5zsEhvc6vv0wd1zMAewuYrpel05jelWnw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cw00crUMc4zKANufvb7oyaOZjfF4l6qysPsZ2DFiyInCI1Y47jAfaa9sXx6sWxa4Kkg8yHnBH4hO2rizAR3D1GbhjjnNnz3eUfRHGaYoGuX2glQWwPQSzoNVBQlAuT8S1RYXFjEBXyxpCQ9Kc/HlkaxXb6Yi64zKMDVYr9GUpxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=saMVeqkx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saMVeqkx"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so48939066b.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556180; x=1781160980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZLYqtbAaFyPxwd8Ei393y0JUubV+/tbLj3BFsSkMf4=;
        b=saMVeqkx243ZUXUYbN32kG6Ch3Axk3P+BwO7upb6lcoKRPcob98EAgdNWPO5NPV9bH
         Tx9Wjh1s9a1ze+mzCoDHFUaqRnv/9seWLH/vJspTuYkW/Ax0HFRbISJYrks0k6Sr09HB
         4ST5MFvoJ5myjs3OQrirvT/XZi5kNVSHp/NB8yQdUPvRcWmnjn/93K2SbOKxwhoX3NfC
         AhU09j+ug2U/syZOXOIK3I4KyhaTCspsWvO+HY1PpfWaXYCglzL9wYcZVHoJdBkHK3FY
         3s4KA1IkaiWDGohFoArl3Esu33iJnjb+wrh5XD63tgupgaSczVASgjvm8fN+jhJseo6/
         oUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556180; x=1781160980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oZLYqtbAaFyPxwd8Ei393y0JUubV+/tbLj3BFsSkMf4=;
        b=SsjAFfwdMkxe1cv9TOsWqUX5Be2LHbsLm+w1eFTeJ8SKRuNKLm8gRgaht6LUGlp5PY
         u3cYZHsXtm7nThMl2UvcYo60DPOMO1CNCccu6QfjJft51U1dvovDqFEsZqx5rsuaFxR7
         ywMp99zpc1IsGYiZ/2FNTIW97RQvYqp8lb9rQyzkxz89G25AiDEyYyBB0H9iHCwPldlD
         anNlynEm3b1WjVwuqfVctnVu+oVvOhszpQgUZ5fXkXPZZ8hBOW+N2KW2IsHWklqeumW7
         aigbv/GRrkkJDUTAqxw9UYsH7ACMjSDGjkAzQeLslM8hoUn1KGLL7VrvwHCmZnze26aZ
         NB4g==
X-Gm-Message-State: AOJu0YziPCzGCbDEchXflCFVHrc8lMioZaMXvXUMUIK3ZjLqNbWy2weA
	x/5zb85LCV8j00wpZ0PgGRrDbUJG+h6MPWeNSxqsNI0iF82RXpRsQDBj
X-Gm-Gg: Acq92OGz5VVmIaFbzscD1j7E4W08+hSPet+F9Izw4NdNZMB3Y7R5tdgCnpqybVIOfZo
	FYdAZn29B/tBS/Qv8EB7LUSrTYdkX/uMiXNdaLd3z9FJfcYnUCDhRvRWpJwbzEri7Y0foD0775g
	VQKeTHJe5kGwKlW18pWrUd5rgjYPVKNPxM7gwtiMe9i5Q0PJrvUGW7TivhcAHThzayWdsrC8axn
	11PoE8jVjUAmvTesWiDYQ7bSHpl4BPHD0jGx7B3uxcPk9eI+l22OKHQgaYMmIPCod27Y1iz0cOd
	pZxIAvSrAjvL3cmUj4LsKKfmm+r/emrT8rPindiMMtecMds4z6R94ukXseBG0uNGpxs2agJ8Jo5
	IcS6V6D/7TmgJatyzyXfF32BlClv7eTt5iZ2prrK16IDopq7Tq9kNug6WSBdm9GPlVVAbDHz1wH
	NsAwTNHo3jvYQXJNw6lO04uBQ=
X-Received: by 2002:a17:907:271a:b0:bec:7185:d3d8 with SMTP id a640c23a62f3a-bf1d1a8c7e4mr83902366b.6.1780556180363;
        Wed, 03 Jun 2026 23:56:20 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/10] ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
Date: Thu,  4 Jun 2026 09:55:51 +0300
Message-ID: <20260604065556.137614-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065556.137614-1-clamor95@gmail.com>
References: <20260604065556.137614-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASUS TF701T has an additional thermal sensor for more accurate readings.
Add thermal zones for this sensor.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 63a37c89771c..3e2bc611e2f7 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "tegra114.dtsi"
 
@@ -2688,4 +2689,86 @@ vdd_1v8_touch: regulator-touch-vio {
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
+
+	thermal-zones {
+		/*
+		 * NCT72 has two sensors:
+		 *
+		 *	0: internal that monitors ambient/skin temperature
+		 *	1: external that is connected to the CPU's diode
+		 *
+		 * Ideally we should use userspace thermal governor,
+		 * but it's a much more complex solution. The "skin"
+		 * zone exists as a simpler solution which prevents
+		 * Transformer from getting too hot from a user's
+		 * tactile perspective. The CPU zone is intended to
+		 * protect silicon from damage.
+		 */
+
+		nct72-skin-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&temp_sensor 0>;
+
+			trips {
+				skip_alert_trip: skin-alert {
+					/* throttle at 57C until temperature drops to 56.5C */
+					temperature = <57000>;
+					hysteresis = <500>;
+					type = "passive";
+				};
+
+				skin-crit {
+					/* shut down at 65C */
+					temperature = <65000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-skip {
+					trip = <&skip_alert_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		nct72-cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&temp_sensor 1>;
+
+			trips {
+				cpu_alert_trip: cpu-alert {
+					/* throttle at 75C until temperature drops to 74.5C */
+					temperature = <75000>;
+					hysteresis = <500>;
+					type = "passive";
+				};
+
+				cpu-crit {
+					/* shut down at 105C */
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-cpu {
+					trip = <&cpu_alert_trip>;
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

