Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D829F408612
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498094; cv=none; b=oKp2KYQpkz5wg8BsxekN47lMtgJb82kFMvvr3Y0/zxB3nAMWFxACP0I0exm3wQMbBaGyjl5jBYrCshUFUlNzSwBRU1ZZGULf6cs9VlRGofin3HP+Kj8Rblgp8exwk/1trYJBDbaVrH0JFeMYvhq/bkh4Oa7pt/mGaL2rjeVieFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498094; c=relaxed/simple;
	bh=Z/sCrcKCh/2gU+SYLTOXEEz//XwPExhekseAPMBAlFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIf8LLgLhw3LMLjgD/amlfr+IIh5KRcWaucfl7hkzBpAVNVy0kpKHXkir8P3KS9uQAPzAlBbwxuFaZxAytRtPXBiehbWCNsyJSRDwa0AMsyXPx5l6JC4gXxTDbMbWqRAROAN7lEU2j1mE60CrEdlxjglFJzq0JUd9DNfwGUNNhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edP6n+09; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edP6n+09"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758bd3731bso879332f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498089; x=1786102889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9dkGnY8mc+kYXbPp1uA1khp0mikRrvBv8an20X35B0=;
        b=edP6n+09b6K6rAlnRIvE5dTKYhM5cK2LW06lnqFJaelxRp0QWg4oSwrxZE27pUSQLr
         sIFTkzDJwvRrnd9pIYOs8tGkBMJzw01K3UQcfSct0jiDP7ugbC26mXbhf2Qm+zbOErpr
         SvXA4zD5dLJvi7H0bmRRN+Xbsj0oJVj1cMJr+UHWMEHOeJFR1mi5T97MCCg08N59dxKM
         aG/1vpPd2T3XJALvmCfPUG/ocyJtEgas7YrgHsNwTvp60QShh+Iqj9XT2NDaAuOLFZJf
         8zZG/fmlN9hZgY/wQuIFp4rSy82hI1TtdupMkQ6eLWhwI+U8nbd2o56vbtJ5tvY2XpBJ
         P4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498089; x=1786102889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C9dkGnY8mc+kYXbPp1uA1khp0mikRrvBv8an20X35B0=;
        b=XPLRjaNPAeVh2xeUsZU3Qb35W/+dLTRYOE3CLxbSwLPHZAG11LQYQ9xkiI748aOC1J
         aMcT/f0IUmlUkG3u9nvA4QvqsQOIIzPdJBGRMmou91wJkiGHo1AcFe/7ETeiarc7gVbh
         uxZ9p3uVzDQCfpxzyCnMUmoWTDlBg4nNdDVwuEHGtND1D8KXdDE7cQPg7NOlzRGpo1FQ
         BGZd2EIbQcVnhkeJUb5N1hwHJmUylr26SY9OXbnzgMO4tPbtpIiB1BHMxx9cyMsfMwOY
         17wG3DvUJ/wvHlQz8Uszn/GrPSnFOYh/WtkroAcH2f64V4isebvHIgKDSLFg02vm45Rz
         hhTQ==
X-Gm-Message-State: AOJu0YxFRgxo0Sra2NmFnlocxdrJXqDAg2ABKddVF2Y432UZhu2blRqQ
	kHpCgBXVgN1+2XPR62JqkudVhcMSVcolD3ZclVvMWqUTsbby8RpTUXVm
X-Gm-Gg: AR+sD12A8k5Ss74W04djolkByzyAdB+Nyn8+J6qPjYzXNe9r6yka47M85kARuIMUFqX
	ShKf1ILw6u0wF7iEzUYDlj+qR+L86ZsGJnTSgA/wGnDcaHUDfqlEw6+wUbgbZwVYcWotI+eVlZN
	UNsZrIWryyNtefskj2r1uNxA378hvhZjmUakIGUmFKkr/7uz+XhQ8wwNFkJNXSwfoBaxDkLqdYm
	J55WmF7G9y9EQ+kPgJiHXRclFifNFeFLkx0oDNLJeqygcZPcxK4qjKNjuV2YlU0SvNcUU8N3unf
	Lq/SC4xYcLzBv9NCpny2YHFnYZsVzhmf/1HvId/ftSm5nM4bth9YENBqXLPMHF51lBuEDybPjM2
	nVV45HxLSQlwuXQnp6mOnhTtl3kfHIVoAWt0P44bm0WXoKppcEIg0CN5/1Q6W4O1XTJZZUDwEec
	t100C1FHoT2oPi++FEZpew+rGFnFl1hxtjI6k8A3LY1sVLpUtIIjlU9ZMhuKbMfwQIfwxFD8wPv
	zhZcD4FcvuDXyrfhO1f
X-Received: by 2002:a05:6000:4811:b0:47f:83cb:acfc with SMTP id ffacd0b85a97d-47fd3306867mr3527217f8f.31.1785498089462;
        Fri, 31 Jul 2026 04:41:29 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
Date: Fri, 31 Jul 2026 14:41:01 +0300
Message-ID: <20260731114106.169398-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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

