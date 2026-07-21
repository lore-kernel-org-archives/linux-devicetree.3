Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB46A47ECDD
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628679; cv=none; b=RYDYZ5NRM6D2q03iRYHsln2q/2fOH7TWcYSF0LPKLn9L+PJbSqCIvzAmkgLkxyezrU4wBnpqCBdb97JVMN4H0+Xclb18uKc6OcIJBqhNGhRpbxOGHjuUS8euaGv27l6Gi4eH6Dc40S9HVK3TQNfOYIo7pdp7I4rOTFaZAeVIuFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628679; c=relaxed/simple;
	bh=iVZoJ194oEUw2xc4OjPA4NuTSMMc1ZrgAkb07TkG/K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpJcYkJAyGwaxLLmuE+oZZIFJSf/RqnS9YPs5jKh23i4xkP05PrSk3lh5OOi8nhCSXtjBBFw4/GvkgcAktUYbR8H7gmcAWcBl940mqYszq1Hw7z/9fkz74mQ93ldCsT7WRcc9D1MA1b/6PptsGuCAa8QwqJQXJcKsxiboTGmqWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN1ppR9I; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN1ppR9I"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so84924025e9.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628675; x=1785233475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YO6b60GQ3bsYe+qXNMrvYgPe+I4qfLlasxD+4tqSZmI=;
        b=gN1ppR9IPHgtL2McfSJ+3GKE5T7sM6OzatpUvDUYuKVFaOdvVH4Jcy8Jxs76Q1IA8l
         fM6+QipcesWwt2sm98AeJnGNPhulyFb8IpHZFAnt+vDBlU7DleBvvCaZ8nuC82u4s2ei
         6yp6OZwtt9J8TALJeT0DNnFh4smTsAD1EGLrkDXyDqfCYXz5tdAheTqMYbxA2NAqibvb
         Q9tEDb6SJMRvpfpZkuVHJVaL8Kg8eUCX8kP2oKE7cAgvz9AblOMb5fQpqwfAIqZV4i8X
         I6VNVXs4/Pv45sGYXbuXLw/wOEOzw0muXlDO8bTd7myvW0til/aOAsp/M9UiPeTwlGTs
         NxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628675; x=1785233475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YO6b60GQ3bsYe+qXNMrvYgPe+I4qfLlasxD+4tqSZmI=;
        b=pBtD3yN3lXlg88WmMS72U46suMIvAlZUAzQEFtnTscu/DCtNQzlTg56Hr1RfOClDSl
         UNPYfLbaVwy45zr9DCx11chFOomjB7X3nCUp81Vbft0mFH2KTNZkG2AdIPyZvKgmqMdk
         1Zwd4ux0I7EZZmrxsndoDcIzadMBGWTJaSjGPAioNLR+0g8eWhut5jkPyo3ERRA3q8To
         Fj5DKBcJ8V3zYbSyzw386K7HErDYzXrsmso/wfJNgp0DuMlIP9XC5NhrQWbYurNKUC57
         XAvNuM3iwm8ioG9BPtoytiVIelTyeHv4XE+zQYE6sPk8Iech8Ap+6Vvu0lOJF36GKpo7
         hrJQ==
X-Gm-Message-State: AOJu0YzTBI24USImWGbUnnmCJXqUAAInwdyOKPhd+XzvFKpn97m+0rHn
	mJF6i05rMiPrcgU2m7eoB30Bjcx06dKr+RAZAQAIx+LFtryvvXWlRYzp
X-Gm-Gg: AfdE7cl7agyU7kZZvMimwPHzy+bPQQotTr5jN1uA3vHulMmyz8kdcTV6wx3yS63ai6p
	UnZjVrAgdDvpMB9ITumIthXXhAg9lYqplemHmJbLHBVSadwJNLxAkUEJD3+P8tlMMxFhMzDx2+d
	WNoafguGLeA5hD/dv1y+kyq9ZE54/K7jAOFFGRa1ESejL1a37dNAa8hJxaL6E7kNsZ0nbdRgXvc
	7BLTqk7dZ5+GCjmfqkI6jZQrcF29FVvzDOtb9BYAH4Zn4+3kBFMiApwdomCapetlL6A2GpMPwDT
	CARTthEeQWuXhOox6wt2DAEuFjXgSoVaSdMPfzUD3tQWPZpX8rKyDYJHW/uRTN1YgmpAkxJXOel
	kRM7SOcI+ky1ZHhUQGf4hx5OLXkHISX3SPnErCjBB3ontFViTOkNSZrZkkreldr7XGq1U+LaYQh
	6p5gJ9M5JWczv7As8K3ojxL+U=
X-Received: by 2002:a05:600c:4708:b0:495:518a:d95a with SMTP id 5b1f17b1804b1-495518adb95mr164895505e9.29.1784628674630;
        Tue, 21 Jul 2026 03:11:14 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:14 -0700 (PDT)
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
Subject: [PATCH v2 05/10] ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
Date: Tue, 21 Jul 2026 13:10:54 +0300
Message-ID: <20260721101059.451699-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
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
index a27d3c4f2c63c..83f8dd84d28a2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "tegra114.dtsi"
 
@@ -2682,4 +2683,86 @@ vdd_1v8_touch: regulator-touch-vio {
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
+				skin_alert_trip: skin-alert {
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
+				map-skin {
+					trip = <&skin_alert_trip>;
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

