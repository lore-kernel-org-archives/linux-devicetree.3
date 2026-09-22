Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E922F3632
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101111; cv=none; b=VoHxknPkYn7QzRDDp5tTFXguP8LFiXsbbA5jPvQQl6tXgHULSvrajAD75fYCy1mgWgjCtvhxLA/pPD91uQ8XhWNUaSC9JlK/yPALSkFMhZxzsPY+7OkSaE+oDifCoYJiabdaEgGCcvrxSz5zOwquXwLxvLsin3bg0xbm+T3keLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101111; c=relaxed/simple;
	bh=ztYPS2e4HVF7IrFJA+qJ5+WnPcPNQ/yUbhXfkJTYQuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lbt2gQZOhoiVN7pmo3uxbV8vkASJyXDWxvi2pr3nTgxVluC75bGNUi11OcO/28P8QLLrbAf+u0vb/3u7dKPbquaAK7xXIUxhb/lSN2Cvux/32svo2hOcLGLi2xBS+q0tfusJmE9MJReWhryMVS06NpSCx2fB3lzupzqe5DHGEFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtWuRbc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itfVVVBj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtWuRbc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itfVVVBj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI76Uo1348909
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NZWs/cR1+r/Ph+YTIm2o3h
	Q3Mrh5ko+vqYUJ7saPrTs=; b=HtWuRbc+biCC1abrBrASql1TdHaz2kqlcxn0wg
	2LxaFFxRb6tknIaKdWbQhXGJQXt+Y4NIKX5TnpoTpyYbrtam9TfYTee15VPooITP
	l0hVLA91/JNdn99vEWInohahS3yCOJ8OpOIYY7Ngd5jhsadvx5QxBIlu19zQi34j
	AC+1WOsmIUnXNFxkrat//yrS6hLRwXnmql6862NDi2pFMm2l4jtc3tIPmzkW0HCe
	6hTePcm06QFYh2nyXX07Zf26jfddiMblZnZ60zSDRDFB+7e1WiY2upqZU+dK+HGt
	tkDe8NE8R2J1D8N4IrXbyWZsU3Xpde2sa8a5jMKuuvxzK8vA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8606rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:18:28 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98331b577e4so69725241.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790101108; x=1790705908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZWs/cR1+r/Ph+YTIm2o3hQ3Mrh5ko+vqYUJ7saPrTs=;
        b=itfVVVBjhOAb49OhGB929xE7sa0Mc1MRU8Zl8QQ7DZjQZbV26/uUyuYtWAfs7m6PK/
         MqIJI0LPIot/m0WBg/XwDRDAmrD8lnfaq63uzFRtpqSPFMBnqxBznQU7ji+fv7mXdLSa
         jYvwZmexF3V4ofY9aGctDeL9XX9ZIhZSzYqZKXmBDLWMHO/QteuSOHKfPtpeS0X2A9q3
         XQEVNUffvL47Pbt1hqxdLA3XCSTc71HWM2jHVwW+9Pg6W3WEGgi6+PH3StMr6IR5YPzR
         8aQcJRTNZYGJ2rHyWmhmrvwrQSGLQk9+QJakjfrWGI7OloPgiq+lG4eJ+M59IXiGwlr7
         0H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101108; x=1790705908;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZWs/cR1+r/Ph+YTIm2o3hQ3Mrh5ko+vqYUJ7saPrTs=;
        b=FZJf1gMByF64izDxFy48814D18zKcjLCSRKf9stBjBAWhZeeZf25bA7806G3oDhdER
         +1vN3+i0dA084W1Pm5jHQns0wZ+vGHaDZCWe+0imbfQBkzIgA5GT3o4ze3lyjEl8r7BD
         jqSe74bSKTtWzwubGtd7xCky47YdPDqH2CgJE0E1IRa5+SPyuJwW3WTtv0JaKQ0RodB8
         BgrqS+AM9QpYF3V0N7KzRkqP/1GBFz9vW3gTS6uT5JATs88Gr8xOBf7sRCqF3ej4y9Kf
         WZU2yxOQb+iN46z0Z1NvuUUAi6UjRQcnJFjZ64mkDrcoOOPbdnvjLuFaBL8ZdIw3TsLl
         CyoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrjCVVmomOOJDsLIV2t5n2AqY0TfUco1IvPUE8AZaQpK+eZjyA5NSrDpp+/bBYgk7oreRNjVAvE80m@vger.kernel.org
X-Gm-Message-State: AFuF++lCaQf/zK0e3KpXO+i1vCcX4XCSl4V4W02tPd/9023il4j5g3mv
	vdy5IiA7QQzG5OnMhuaUeju8Y1ybKnfrfqeYnHXE34zz6G6ybuV1v/cs0bI7D1Z01qypbUUxTDH
	DINPHQCuyXNjP2qJrcatUyGLpJfOHSJY3nGrWPdB/gV7KBOZHZH91D2+VYcsrsKAk
X-Gm-Gg: AYBFou1Mx4gKtOhHKKWKmiMFbzf9C5JJ+ftpavTmooFfX5a1/sT8RUCN+/EVSKCyEC7
	40zpMFtOHrzy/TFw9RTT6YkguTkLIlE2XpnO3HImClFcS4tgiTr5jsNCcYe70n+qNNrySv2xnQ3
	eOMWNbw3jOPaDeZ18BiqnfffovR5rKeWyFsszKWl0Ll5GvTiWo6+o6A8l+aBp+vkQ2KXRmGeYFl
	IA2KOhFVCwrWnaA14V5GfKS0AE9Sgwhah+tZmvcgsKMLp4u/G4TNrXxrjnoiE4SJaLf4nYhnRVG
	mxBrCcuSildRjcVBmfrDbZnNr7eRT3k1eSKcFYh6VWx1wNIQB4NGJooyx9Eb36cGRqoRcdjeXkf
	Z7CWaCwjuHWEMoCF4sarT5/OoYLrzF0Ya
X-Received: by 2002:a05:6122:30e6:b0:5c9:a60b:e59e with SMTP id 71dfb90a1353d-5c9f15d6264mr642692e0c.9.1790101107815;
        Tue, 22 Sep 2026 11:18:27 -0700 (PDT)
X-Received: by 2002:a05:6122:30e6:b0:5c9:a60b:e59e with SMTP id 71dfb90a1353d-5c9f15d6264mr642650e0c.9.1790101107357;
        Tue, 22 Sep 2026 11:18:27 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:741b:508:32d0:659a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668dcsm269237f8f.1.2026.09.22.11.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:18:26 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
Date: Tue, 22 Sep 2026 20:18:18 +0200
Message-ID: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8lnD7Ehc-Q7gm6AHme8QrvCiYgXEeM1H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NyBTYWx0ZWRfX3kTRzUceUlXn
 COH7mHq2jhA82TlNBBAbZ7IteslqSnpEJ/kmbLT64CDyMqN+g2uwXjwOM+QbISOR6V9UYRcxu1I
 sbY4fZA58Y0qVypL0xuS4aoTEyN+byQ=
X-Proofpoint-ORIG-GUID: 8lnD7Ehc-Q7gm6AHme8QrvCiYgXEeM1H
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2c674 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=o9ci_QQK4bv_-0WdHMYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NyBTYWx0ZWRfX65Eb81VOlxim
 q667LLLvOHnbCliYkssS+mvV1+ZzikWpwhcSIhd1oTp+Zc+kFK+waRCDgpm2BD8YvIkOqMzgte0
 0fQdsZwvg41E4986ZJYlNRyl3RmI5B3PDXGu6DE4WgZCF6q9AbVfBqdENYo2MbMBYdwTYmrThZb
 2zm6GHIq1U7F28yOf4n4viXcN0TEGFw8NVjSPgdfayUOuonw0B634lZN3Ue9FKcUVFR97Yg3G97
 yXQ49vcqk4eN/rkOFJsmq42CN8654GGLigjig48y6IxtGmuQFnzniPIQf95hNwrA3MihjqAsRxL
 OmFGNsN8ubrNBd2dwK9C/0xqWsPSA6kgOoSAcio3sl80nayETacgVR3Z9zatbjEKxnH6hvoKUX5
 0osr7/Nd1UqrLUHTix428PPeH7k0KVaHgZEt7Qj5PcNep7kSXtYs1hEvDxRQ2vdcfFQV1Ii7THz
 8JphHH8SnWbJEQiU4lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220267

Add the thermal zones for the ThinkPad T14s and describe the board
temperature sensors exposed through the PMK8550 VADC.

The keyboard area is the main thermal constraint under sustained CPU
load. Add a passive thermal zone for it and progressively throttle the
three CPU groups as the temperature approaches the 53°C limit. The
groups are activated at 49°C, 51°C and 53°C respectively, with a
1000 m°C hysteresis and a 500 ms passive polling interval.

The cooling maps limit each CPU cooling device to state 6, which
corresponds to approximately 1.9 GHz. Testing showed that the system can
sustain the workload with all three CPU clusters capped at this
frequency while maintaining the expected performance, making it a
suitable upper cooling state for thermal regulation.

Several configurations were evaluated while tuning the keyboard zone.
Using a single 53°C trip for all CPUs allowed the temperature to rise
quickly but resulted in a stable operating point around 54.3°C, about
1.3°C above the intended limit. Introducing staged cooling before the
target significantly reduced the thermal overshoot. A 49/51/53°C
configuration kept the steady-state temperature close to 53°C, while a
later 49.5/51.5/53°C configuration improved the heating response but
shifted the equilibrium slightly above the target. Based on these
results, keep the earlier 49/51/53°C staging.

Also add a passive back-cover thermal zone which uses the GPU as a
cooling device at 64°C, together with a 73°C critical shutdown trip.

Describe the remaining SMB, SDX, east and west board temperature
sensors as monitoring-only thermal zones, and enable ADC thermal
monitoring on the corresponding PMK8550 VADC channels.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 5cc6a63d1ef6..9407868864ad 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -10,6 +10,117 @@ / {
 	compatible = "lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
 		     "qcom,x1e78100", "qcom,x1e80100";
 
+	thermal-zones {
+		soc-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		keyboard-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <500>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+
+				keyboard_alert0: trip-point0 {
+					temperature = <49000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				keyboard_alert1: trip-point1 {
+					temperature = <51000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				keyboard_alert2: trip-point2 {
+					temperature = <53000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				keyboard-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&keyboard_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT 6>,
+							 <&cpu1 THERMAL_NO_LIMIT 6>,
+							 <&cpu2 THERMAL_NO_LIMIT 6>,
+							 <&cpu3 THERMAL_NO_LIMIT 6>;
+				};
+
+				map1 {
+					trip = <&keyboard_alert1>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT 6>,
+							 <&cpu5 THERMAL_NO_LIMIT 6>,
+							 <&cpu6 THERMAL_NO_LIMIT 6>,
+							 <&cpu7 THERMAL_NO_LIMIT 6>;
+				};
+
+				map2 {
+					trip = <&keyboard_alert2>;
+					cooling-device = <&cpu8 THERMAL_NO_LIMIT 6>,
+							 <&cpu9 THERMAL_NO_LIMIT 6>,
+							 <&cpu10 THERMAL_NO_LIMIT 6>,
+							 <&cpu11 THERMAL_NO_LIMIT 6>;
+
+				};
+			};
+		};
+
+		backcover-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <400>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				backcover_alert0: trip-point0 {
+					temperature = <64000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				backcover-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&backcover_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		smb-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		};
+
+		sdx-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
+		east-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		west-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pmk8550_pwm 0 4266537>;
@@ -35,6 +146,7 @@ vreg_edp_bl: regulator-edp-bl {
 
 		regulator-boot-on;
 	};
+
 };
 
 &panel {
@@ -58,3 +170,33 @@ edp_bl_pwm: edp-bl-pwm-state {
 &pmk8550_pwm {
 	status = "okay";
 };
+
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
-- 
2.53.0

