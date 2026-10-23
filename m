Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744721;
	b=AsqMJw73QHpO0Kz42LQKjjBBXi7G+vsOEBwltaZH1p4w1IF6dIetKvd/uK/vraXeObVi
	 W0kegATYJCATcdfcUEK3rrWrOtpk6RoLlA8Gjrtt8hZiJz1ADyW5AwptjUbwBM7Pu+zbO
	 UEW5VBpNBiHVukMEUZ56DEtfka2DeyOIij2i6Cjup/loRQwM48z0QVVLMPOxNJXaJ6iin
	 mGM5jya0ASiSB1g/RCOAa5Vi+rODQEnrch+sFYTQ+XpP91iF6qfgYazRW6aqZSkKqZcIX
	 i4O6gobmr0FkTX2x19jS0BcX2muyjXAhq7gF/oNI9oAhV1QbHiROZOtWkpID0UL2Cdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744721;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gY2fRVnI2zhWXKknMYprw1I6Eo3hbc44HoOJowJu3+w=;
	b=sPfnedKOg+9PjqsZY5e+uNfdieHVdICCDHdV/kOGHADzmrojHGM6++QfzKPN5s28Gl4r
	 +BqNj5SCqi61gvkrt5jMo3yQXCcxn1AfyjOIi+kZ4lplJFGVTTnscF4HYk1xFJRrHWBFV
	 HsgcVst9/hr9nkJJj02yUClQwc2Mb2acuF4Hxyn+9HNGh9jdo0n/z4Ko+zMmBQDtG8Yf0
	 Up4mRcE+Y5UHlY//xiuVOTaWRaAyj/z4fESQmX7mBo38hjxTf3e7JV1zPuLOY1ZzBtcou
	 vCGbLgMDBZCzWbhKOfVIPgzD/Fve6tP0pg3PbWHwaqJn256RJb6f2aMYWywqcT+JEZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNMUVd39;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnQYsxxS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0B8606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C0B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNMUVd39;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnQYsxxS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FTQ42650364
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gY2fRVnI2zhWXKknMYprw1I6Eo3hbc44HoO
	JowJu3+w=; b=XNMUVd39JgTR/WLSU8wyeE6hC9ylNlDv+9Q7myaUl5rphEQQopN
	M85dsZI2ZfrjHqzof3HjQE+iOavWjza4zBWPhr6x2R6IzdSptx/n5p4Eiu0o2u6L
	p65BZPpZZlHV8CuHN6dlYn7eiTMBmf8Qiz0l+UfO2rt+MU9sS7vB4UlYoRGqVdx6
	gcGp0Cv5DKCgB/eJ1k/RjGFLrmuWtpVs+Vl0JQjmgTZSwJwGn44zmFrRTFADxFRb
	gqbicXGuBefzRhLnsPn/lHKf8SVk3uNiEq1hLuyA3yayz5mRU8lHMuq4XderpZ8T
	Pi98M4FUTPkFhrfz4Cgv4FZsce0hre0xpJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjat9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:38:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bcd0247edso14279986d6.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792744719; x=1793349519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gY2fRVnI2zhWXKknMYprw1I6Eo3hbc44HoOJowJu3+w=;
        b=YnQYsxxSJRu637uF74ISuQgpeK41kV5xX030D1YTNq666xrk5zEujYHWmMqpBb+4OR
         7LXbHnFvyGKAAlMmixIc+DzXx5lrDVbDyzVshsrx7kq6UTpGPqqGbEFs4/46qJHFBAP7
         ZLtLComNuCCea6L3NS/qqj4NuLrDpyVTLgL7HY218sAQQITRfKnhli/cG2IVUqYapsr8
         mJ+Yh78TiB/5ET4G+RCtlUXIUAQmUG+g02EA6lhuZsbpT/IrBS/BSVNeStHpw1kueEcj
         TQiO+yYZFsOZg3NhkgFOdkXeusWqIGQfz2gXK2CkB0P0I7OSW5MG6kLW3EsqUTYWGwW+
         1htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744719; x=1793349519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gY2fRVnI2zhWXKknMYprw1I6Eo3hbc44HoOJowJu3+w=;
        b=ZEY6PmZ5saYyncao6yHewmGscRlDT51ecYN7L8HZwNeB/cVz89CHvuFVRRaw9FJR6y
         HVqzX4CUViAuN9dmJIIOrWqd8CcTQbRz1C6lL7+lTMkpvb2kIw7H//mGLeEUuvvGsrvu
         MQGM2QS0piosS5kGNbgV/iSvvk35W2UYeZ5Ogzqh1giKEUdAZOAkcD7wWIho7qWCsdUd
         c3PebvuXhVPv1TfwVV9o27zUkxC83dNcF1/GT/UV3GcTOQKTZXQVhwpk21kTzCD9Ryob
         6SCcSrcjbrG0KUm4hLdzbehhvZPOryl1Woy2mkRWPFSJ+KqcEmcF+bgOFXMqHVOlYtyD
         9iOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCerOsZiAVlh0tnx0nD/UbbWxMABx1TRACxTo77aRuuPKO1IO94srFBRXwLikaKn/CeXLz3Nn/d69X@vger.kernel.org
X-Gm-Message-State: AFq9FYKA9jwL5hISBmJyQyrXhmldHgBHL7Vp99JxCESwrr6zCicYpAnS
	AdICIAVPzEJ91CCipK1Mb/aDQrKY/E1UbPM61FD3jlYWRnQMtx3nRg1sCL4FpRV0HckK76cOi14
	aOpG4K7zwopYcKH++fb7euXX+dNfDBbP4askzpUQNf/dNvTIIyXes6SpJqxn9mgBr
X-Gm-Gg: AYBFou0EYl2kCi2YGOCriOP28kIoqhb42N+ElMOluvozghnSnVOHH0YRdfErcSGWv8H
	3IdeZEyTCoFBMez9hgcNBqmVfXob4qIBI8IO/43cVAzTbZdbLmNDudv0Q5AvHeP2wKPMdtt4Vsh
	Cz1bqY11e1yC+xXb+QNWheztuNaCujqHSSuv939qoDU+zlFTT/4y9I2s3CwHlghsxcWMKsO66JP
	D/UjcDqodOkClcjIFQaBjNRSzqaxMcWgO11u3K0+LL95Fu3eoGncgpQbRcBwglnpVOVTh38Sm8f
	CgYGO6jk9LvK+NRp1RbiMtX47mrAiTkICtqe+WpwkhGMYP0ly9Q9556VIu6fjIt8YJIFD4pFvKG
	1YB0HkAGVPYsWVOk2fYLP9fCulKtSoBNI+Q==
X-Received: by 2002:a05:620a:390c:b0:93e:e175:ee92 with SMTP id af79cd13be357-93f6f7d048cmr287079285a.39.1792744719011;
        Fri, 23 Oct 2026 01:38:39 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93e:e175:ee92 with SMTP id af79cd13be357-93f6f7d048cmr287077085a.39.1792744718559;
        Fri, 23 Oct 2026 01:38:38 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b74b:faa1:2e99:5c8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37eded3fsm3587017f8f.7.2026.10.23.01.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:38:37 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        stephan.gerhold@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
Date: Fri, 23 Oct 2026 10:38:27 +0200
Message-ID: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: vJ2DCiyWwfNGcZDUO00rqp_0zxOjB298
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb1d0f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=W5eknlhPjGTqicOx0vkA:9 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfX62wiAt4/q9DQ
 15LHSqdKGvo2rEaPbxKNe6E6fHPwym/ZKOV6VPBennxTjrK6buPLf8w0jF8vgazdt2uUowmG7ib
 +y3XusiQrpUEQLLi51N5T2WRQuDHd58=
X-Proofpoint-ORIG-GUID: vJ2DCiyWwfNGcZDUO00rqp_0zxOjB298
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfX+ivcfzTfSwHZ
 stfvTm93eIy71bhQconDx/Zw6gX63v9ItTF/nxtbv/XyQzbLERSj7iZaZUIP7EhlMynRA4my8aT
 bYutE0ZCcDqKQiOYTQc1G8ouhbn1jiDQ7+05TCqKMkt1x67boXqbfsp6mLXM3yPQWItkITuxdda
 vYzGnl9A7hRBdVqVHMcfcEaUM6ftvb/hhtsVuIOQbxi6ZunnRYsyq0zxTBG+tXSq+KIfMMHlN5X
 b/TGH4HiMHMa2mmsJLutTsloGa+u+UnMjtXSi2g5nFhLHZc4sf4z1BWlC9+SJA2JgrB7oFo0HMI
 aND9EmYDb6UC6a0SF16UJRiiRt05duZnSbXAKzFaXDg8mvj2+LeF7hA787AcCTgi6eprsBxX8CD
 duhEDISTB2FLzg0AiY9MrASZ4KO2qK+SgtPEk0Nx7JsXGglIlh/QjwX4scqOLzG9ThBqReuLcRP
 qsvOj0mQC6+VY3E/6LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230034

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
Link: https://patch.msgid.link/20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..21f4569068e1 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -502,6 +502,88 @@ platform {
 			};
 		};
 	};
+
+	thermal-zones {
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
+		/* Sensor in the WWAN area. */
+		wwan-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
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
+		/* Sensor near the USB-C ports. */
+		typec-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
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

