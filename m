Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759176;
	b=s2D0B+PR1Id9kFxyOz9iq9RPP/bR8dPffshBptrpTSCcsGruIE5+hOdR3m+dsQZUQPTu
	 c9nlfDQYoASvsXYcertRuKU6ez450ygEfNpi4bF66ANeAdEa2MwFMayiAijg+rku7q8SC
	 AU4pa8Uqg3XR78n4BUYo7tmjk4fEzyDeEAI68b017/BwH2+7RJgbwQYAqVlRSYMl+vLYk
	 0BR5jnOKZni2Q8IOdyxs4wVXUl9kZcwXrCbZCndhLmnNjTrEmVlNkPni60OuDpVHiB3K8
	 i7d0cereLKoRVP+0KqpGWVOa3tFgAP4g9uru4uJK8D4LFKqRibNTYdQcsY4WyjZ5l3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0kupNfIcP4=;
	b=HdcMc20GMq2ilc7/RMWj0P9fIjnJekI7VBBjuHdDQvt74BTfIF7+WprpJssLq41ltoRp
	 i7TzROegrc0gJp/9EyhQGyr5KUc/sWhyNCcmdZNL5v51JxxxsKAL0Y/4503au5FNf9o3O
	 yoWhSQiMqY9inY3cxzoQ3ONt5yOeo4ri/eTWcgd2nqoxpk0uFr2UluP0YvgkTyXwZyf0n
	 YGK1GVP2our/pVKOIcjfjatj8L86bP14z+Ryk1eu4DuDrwEGC4bNU7jkh+iGeuDL+tsd3
	 ZHCSzp+YJX6m8up4G6hlGzzCc/gItMzZACEUxzXFvMGUt+wIvY2sHM9d7GH+SB7+o7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDjc0So0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fxLtAlfA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27C1606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F27C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDjc0So0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fxLtAlfA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUFa2164238
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0k
	upNfIcP4=; b=NDjc0So0HCHmLJaYIPm1SoH/WFgNf/QUmcVPxY3UTo0VvaKig0x
	ga2w1tqw+0Ei6O7Qx5PYy2dc08fO355CWRRDauyXzE4Esfg3cKGK9IsGcEELINBz
	Nikoobc8DUVGmW45UVA4UeAoI7/QjgwXZ2pdZNz1/jvgFz0kXvqMG+FzxLhP+d77
	qeJXYXmIVqqmOTOYA33EselHlLrW11UbJTkPgDu3op07dWGm+9qXhTAMJLf0co8v
	YyfYUCIo1StPihX2Esfyb81sAhyBuJEGaZvuV+absc/3+PJrKUOXLi3QVI9VeFx6
	Bbm0b0/wzcU9Y7yTtF4rSV2rOul3DWnlPxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahv4cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:39:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so169997885a.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792759174; x=1793363974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0kupNfIcP4=;
        b=fxLtAlfAQEyNh+d9xiC1aD7Tzq69Y6j56cLRquSAeTp3cOaMkRcwseKR2FCqnGSYLa
         Az6cnaeLSy2h1easyLqf+Fjhcpq0WfxxbMuI1u/nnmDZmAayfcTjzdIEmZ6NNtUDK2Wg
         c+w+M1fZjES/EtP+jY5RF2rfqLOSD0F8bFGVV4iEH7VqJMu1fAwnmYn52R5xa+FIpUSB
         clobnwuARTzVEPVciCDc4COIwkKwSsJYgY84TEYCLLjFfsRUcdclcRN/+qzWc3GNXAoM
         GFpJZtdH0iqf1FmGxIWl8U8XK7+hJJVZ7D4jkqrtBFLhK5ZFqiAFFgyrZIjJDk89wVM2
         +T6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759174; x=1793363974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0kupNfIcP4=;
        b=UGr6xaaeVK1PuwousH3uziDpd3QYBxUcnr38ISRFEsNPEQEQ2Ff9iuXDQSLYS2dvUv
         pqvPL5ZiThaTtoIaKT325VIz8HjHTdxxT5DLGmcOcVPmkVaa5M0ddIZLGEZDQ9J87bBi
         dCrgzxQAxjvZgPYY7+I3sFk4gAEAMrKSIMhPswR+qdhjWLT5UtbtN3d87dtjRqL/ny8l
         A1OluGBM+DaCcbxDZO0iOILmiAGVoubqqsU4l/BCt4Hj+SChUzW+8Wgdh+ACHm8SU/BX
         9by3HPtmyggCC0XBVyxd16pTt+R8nXDS4wR7BjYkIe0/OldW9c7GyW3oNT5WjNkPF5h5
         X3Mw==
X-Forwarded-Encrypted: i=1; AKwUvByimDcPqDOq43VXLTstxYGcx1conzs/Bkl4XTVW/vvKvEFV4J3tpkTIWxJU8utaw4FxsPZY1s+EA38L@vger.kernel.org
X-Gm-Message-State: AFq9FYLJtLig6f/vGEXN9t20oVlNIpwYsmKEsI7WBk2vWbbLozxqdWBr
	x5cmIi13XNM0BSxKtU0p0vv1EJminHbIDTlo8MZnCiSAHxNPLWTtTqJWLkDszcUTLImrwiBQjFn
	oSNTJRkxyvFt4Z865wD5XFaQQ9Jbyyf3R+lY78vYPOmN13ApcF58EhslCwta8Zq16
X-Gm-Gg: AYBFou3ZXz9It2lEQIXXn9oJhN/FUxpq3km/3wQt9hCXuCLgd0fIUkqP5vsz/IXmyAE
	mfuvO0xOLha4DblvOaFjN2u8YiIZr6kUUlt+3Q3EK1fQgsjpDcjYKl7CGPxZ+NXDueUzwSLNcSN
	8mhDbWyJuRdGM+dJBoHvHbpqLAIHm0Y8byCnP+10MdRA7BpMZfGejOBg85dC9K0lMixkE8+fPgZ
	Cmx/WubCR7jqI3taRQmPWvSrLEUu6K2swAfFGsBuoRW2jpaIIQXOshAIT6hHFeuuGM9gcp7AnK2
	uO0vHxE2f8fVNYCN2Q+uaCTmPUu6xGKjVoxxcT0Q9VBywG2oMT0kv0K4yKyJBBSOftOrOP+Pj8g
	bKU1aaP6gSjUMOvNNvg2BZvkzAWzNxcwn4A==
X-Received: by 2002:a05:620a:1786:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f627549fcmr851060785a.24.1792759173924;
        Fri, 23 Oct 2026 05:39:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f627549fcmr851057385a.24.1792759173411;
        Fri, 23 Oct 2026 05:39:33 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b74b:faa1:2e99:5c8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3805761fsm4935816f8f.47.2026.10.23.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:39:32 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        stephan.gerhold@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
Date: Fri, 23 Oct 2026 14:39:14 +0200
Message-ID: <20261023123914.8641-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfX5iL2P+vgFn3S
 QQVQy5u/rgxr6w20AUnugZE/1utBRmZHy1Qk8nIgybtp1z9iXmL4pD1sZBn1IsEeF3W4tzVFY+7
 zgA7y+uZpgtnGEOKWjHDw5QGfRngFIc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfX7SYNWPnVJI5q
 rH3c8QbqZLAbmQno+akO2z3QWEG+DU9DTKiti4Se7bMln9U6KgUG1qrVN76Jr57241QkTHWp0HI
 AR0Q7HvGQqHskSQ8Km+LxMjx8avxHZM0MN04ikk8/txubQbIRTzHON8doa78GHlMG7JSrMZxggF
 eRobnEfRVoGm98Y0CAX1ShBk2JVJsAC53PL4+ceEzy2/35gnAAFl1MuDpyoeFxElMng3hhElzej
 TgCQNPGiCr0mNO3B1PlQI5UXWPlvXZonpWzwa1KHrDW90zGdvrIK4WtlbuH5SoQiVeXyqJ4XzeF
 zbK/FyZuZTcjQ4T46FRBGXppGVwHpQ0MUIOw1+pMN5xJBFgiTEeaQISEb3QPqG5lhHoGNKBzCD3
 e2YSuAMJ8JOc1BInFQTy3XBg/CDenlqBm/kdoSrUjX1lUdtmVNfYRgKP38qBtcCOLkgSvNbULlo
 jOgV8ywA+g6UhrBKYTw==
X-Proofpoint-GUID: B1UYigx7heqDA_RYMD97SOP62NlVSLPK
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb5586 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=W5eknlhPjGTqicOx0vkA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: B1UYigx7heqDA_RYMD97SOP62NlVSLPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230049

The ThinkPad T14s needs thermal mitigation under sustained workloads to
limit temperature rise before thermal shutdown. EC interrupt-driven thermal
monitoring is not yet supported, so use the board temperature sensors
exposed through the PMK8550 VADC to provide mitigation now.

Describe the sensors near DRAM, the fan/heatpipe, the GPU and CPU PMICs,
the charger, the WWAN area and the USB-C ports. The DRAM-area sensor faces
the keyboard, while the fan/heatpipe-area sensor faces the back cover.
These are internal board measurements rather than direct measurements of
the user-contact surfaces.

Use the heatpipe-area sensor for passive mitigation at 57.85 degrees
Celsius, derived from observed platform behaviour with the Windows
balanced power profile. Map the passive trip to all CPUs and the GPU,
with 1 degree Celsius hysteresis and a 500 ms passive polling interval.
Name the trip "backcover-ec-alert" so that the planned EC support can
locate and adjust it.

An earlier approach using staged CPU-cluster throttling did not show a
significant improvement and introduced a latency imbalance between CPU
clusters. Keep a single passive trip to provide timely mitigation.

Add 73 degree Celsius critical shutdown trips for the DRAM-area and
heatpipe-area sensors. Retain these baseline thresholds pending
sensor-specific hardware validation. The reported Windows DRAM threshold
of 115 degrees Celsius has not been established to apply to these VADC
measurements and does not justify changing the shutdown thresholds.

Thermal camera measurements indicate that the readings primarily reflect
internal temperatures rather than chassis surface temperatures. No unsafe
external surface temperature was observed during those tests, but they do
not establish qualified critical limits for the internal sensors.

Expose the remaining sensors as monitoring-only zones and enable ADC
threshold monitoring on the corresponding PMK8550 VADC channels.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..6909458c0996 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -502,6 +502,88 @@ platform {
 			};
 		};
 	};
+
+	thermal-zones {
+		/* Sensor in the charger area. */
+		charger-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		};
+
+		/* Sensor near the CPU PMICs. */
+		cpu-pmic-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		/* Sensor near DRAM, facing the keyboard. */
+		dram-thermal {
+			critical-action = "shutdown";
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				dram-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		/* Sensor near the GPU PMICs. */
+		gpu-pmic-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		/* Sensor near the fan/heatpipe, facing the back cover. */
+		heatpipe-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <500>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				backcover_ec_alert: backcover-ec-alert {
+					temperature = <57850>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				heatpipe-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&backcover_ec_alert>;
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
+		/* Sensor near the USB-C ports. */
+		typec-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+
+		/* Sensor in the WWAN area. */
+		wwan-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+	};
 };
 
 &apps_rsc {
@@ -1285,6 +1367,36 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
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
-- 
2.53.0

