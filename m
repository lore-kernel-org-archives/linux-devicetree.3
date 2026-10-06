Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF3F356747
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791312979; cv=none; b=Umgb6kdyq6WXU3IZ0nG2crrZYdNwhRIkovAsckmao1hMcj8sk71Qp0w4gp2VFBKvM5mKsLPJEq/bBmTvhb2zRlvkYNh/eBLERUW/uKg8HdhZkTBRc2EAYuki+t0BlFMiVNF819q+9sZsAGFUQ5aQ7r3AohV5zeCyGSYzwucQBHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791312979; c=relaxed/simple;
	bh=j/Mo9ZfZ/mm1NsSFaooFs083eND1GujGHVcTZPforUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cCqSqEp6Rm7iPjtRdYhvgmQX2jHGsY4Dr5ZzGSz0ELuQLI6JPDnwULjSKE4dB4E9zGRcmttzYQ0J63f+bmsL2YEiipuWhfOxxgfSXkldx35FAD+ckqVOEby7jU9RuLvsMb7zMvQasT8HrjHDbCb4KTL/dzUnxR7Vw4p7Ca4Flp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=cdGCssHD; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="cdGCssHD"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917a707f37eso10645516d6.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 11:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1791312976; x=1791917776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5v6jrpPA84kIx6+sRrk89uC8atprDTUiDyZpEvJkSk=;
        b=cdGCssHD2mfXd8oOyKR7wKF8wOS9FytieazdZ7kSpSLCUbyV38Na+P0bc2ukgoqJ/A
         nlyP8+PKNhC2j630cZBGs6rsIDio2OcdhixXrKMiq97xssB3aPJuCj/XXfBTlxKw6scr
         yogt/kI0Nva6G4pRuWUfC6agAB/eXQYIUDAgJ6aedQJFwbX7WzHokFPmDxPb+Ol9n7zv
         JTmhye2WJj4c8jH9OQ/SdjwZA5MYk/dRTo8uy6Pd35ynoyTmC8n9+VO3keCXnUPMmz78
         OWqzX0RZ42efXayQWMuTG3jRLvAUyAmSoTVXcf7byZ7aSEI5g5sNRR7mvCll8xiiyyoR
         Dgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791312976; x=1791917776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5v6jrpPA84kIx6+sRrk89uC8atprDTUiDyZpEvJkSk=;
        b=Ddk8NkdntENHACVrIdSGTEY7jkVm6aWw8Y8CdjuT4E+FHHljMIES9aJ0RfOS/blGzu
         EESynUh/Wg+WGHHBGd2ZIu0s+/eD/gLa5oMf0yB1YHhS/olaZPDUmBe2opxDNl6nhT8F
         r69qRKWeVFp8mZop3F682pxmw1xvfo4q90F4+D+gGu2/tODELAYoJWtdcf/TQyHLxLgC
         tT/7NIBwZeN/YKhLRT3lVpQxXtZut5lmQ8T7+KBc6QbRMa48lZL9GuYQ4pFvfJiMxN2P
         q1/P1ZRbM6NHpyHZTTRnwE3jgbZKD5WpfU3wL4EfCIVEYrT1nIXHa3G+WG/5h1pv7+3k
         qCXw==
X-Forwarded-Encrypted: i=1; AKwUvBxgNea1397xKDY+YRhJwPOqOUzNOqVL4CzUoZHBz9S1CyNsuL3TqF/9eMFxZ7TJzBJLMzN4sedqQpt4@vger.kernel.org
X-Gm-Message-State: AFuF++lWWr+VdBURZNZ5eO6nOjflOma4eahoonnwxCUtnbdr9UumLwR+
	Jr60tbYg0ynT4pd9ORRRB5lXjgqYEy+Q9WDM12DsNuzm4w+lgAY94DEbZIH3Cmr3lE8=
X-Gm-Gg: AYBFou13em30qS+T9D1ASQes3Tvkwwcz5euhknY7JbZFw0QLFmGfQOBKOm67SVCimeH
	V8bpjvY3RxEKfmM78Sk402bRX17i3Z/8O8sNFRdo2YIbgJeI9CDs+b+3jIvG96m1RygiUSF+m2b
	zuCFoAYdz3prw7hi7YeHgCeqOEdSb+Dcqccf/Ro8m+idN7dSp/IW4ENXYhyxMFJ1Yk2tTGQwipq
	NL/2Jlmfkn22SuKHLsVvkmdkhjjZFyLRPVIeDKjMfhLfwQenHh6jjcplmiNQhvv2TZcAh38SQYM
	EHwng7J3XD33WW3ZbVetayah3D3qSC3nt+bpa12/6FF7/+bNXkyYIYUL0sK4p3+kERJO4W8fUSa
	YFmzSNC0mJAaGbUzh0v0CUb82Mj0WkFPZ2IZBi0wtPLyXIzdSvzWXdNm5YCMM+/uNUQ5yAUSryV
	nYpRwx+vQ4CeimZhyJImS8dUlZNqXn+MIG5uS6fuikhiQMf4E=
X-Received: by 2002:ad4:5fc9:0:b0:917:aad7:56e8 with SMTP id 6a1803df08f44-9198b7a1099mr43113006d6.27.1791312975739;
        Tue, 06 Oct 2026 11:56:15 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996d81bdcsm492676d6.41.2026.10.06.11.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:56:15 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add thermal zones
Date: Tue,  6 Oct 2026 14:55:57 -0400
Message-ID: <20261006185557.23016-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The XPS 13 9345 has seven board thermistors on the PMK8550 VADC: AMUX1
to AMUX5 THM and AMUX1 and AMUX2 GPIO, each with a 100k pull-up. The
ADC configuration in Dell's Windows driver package lists the same seven
channels, SYS_THERM1 to SYS_THERM7.

The ACPI tables define seven ADC thermal zones, TZ31 to TZ37. Three
of them, TZ32 to TZ34, carry passive trips that throttle all CPUs and
the GPU; the other four sit at 100 C. The tables do not name a zone's
channel. Taken in SYS_THERM order, TZ32 to TZ34 are AMUX2 GPIO, AMUX1
THM and AMUX2 THM. Heating the board confirms two of the three: a
charger on the left port warms AMUX2 GPIO, one on the right port warms
AMUX2 THM. Sustained SSD reads, compared against a CPU-only load, warm
AMUX3 THM and AMUX2 GPIO beyond the other channels; the second is the
left charger's, so the first is named for the SSD.

The passive trips follow the thermal mode chosen in the BIOS setup
(Thermal Management: Optimized, Cool, Quiet or Ultra Performance),
which the EC reports and which cannot be read without an EC driver.
Use the values of Optimized, the default: 53.8 C on the left charger,
62.8 C on AMUX1 THM, 61.8 C on the right charger. The critical trips
are the tables' 114.8 C. The other four channels get report-only
zones, as on the CRD, and all seven are put in thermal-monitor mode.

Assisted-by: LLM
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
---

Notes:
    Tested on v7.2.6 with the ADC_TM driver (7.3-rc1) and aac6b2ca472e
    backported: the seven zones read within 0.01 C of their IIO channels.
    With the left charger's passive trip moved just above the zone and a
    single-core load, the crossing throttled all three CPU clusters and the
    GPU through the ADC_TM threshold interrupt, and the throttle released
    at the trip less its hysteresis. Built and checked with dtbs_check on
    qcom arm64-for-7.4; no new warnings.

 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index f48e6bc35006..a3a240b6927c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -326,6 +326,144 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
+	thermal-zones {
+		thm1-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				thm1_alert0: trip-point0 {
+					temperature = <62800>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thm1-critical {
+					temperature = <114800>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&thm1_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		chg-right-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+
+			trips {
+				chg_right_alert0: trip-point0 {
+					temperature = <61800>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				chg-right-critical {
+					temperature = <114800>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&chg_right_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		ssd-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
+		thm4-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		thm5-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+
+		gpio-thm1-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		chg-left-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				chg_left_alert0: trip-point0 {
+					temperature = <53800>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				chg-left-critical {
+					temperature = <114800>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&chg_left_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -1025,6 +1163,36 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
 	};
 };
 
+&pmk8550_vadc {
+	channel@144 {
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		qcom,adc-tm;
+	};
+
+	channel@14a {
+		qcom,adc-tm;
+	};
+
+	channel@14b {
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };

base-commit: 7ee8eb0ebeef2e7bbf2ec8ebc43bf43f2a10a1d7
-- 
2.55.0

