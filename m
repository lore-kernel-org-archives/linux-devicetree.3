Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728E83C415E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101381; cv=none; b=JZWAHAk2hzLSdgamjOyY0cUepzL33XBclLVl7AC5LIrGfkg2JWoojcnfUry8YpEfVT2Va9paJ4bhol2JNMSh0PfhcrCtCInx5ug3jXFuGdTH5wYH+QdxajBO1ZB3FBMz0PZE9UpMHrqPluY8ubiCG12MaAYgCfAXh7kzBe7kuf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101381; c=relaxed/simple;
	bh=KqYxumK5YGafOBVcgCJcjqQYCmEJidEVjvVUsCwQHtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aO4VkQ8km7LAStZReyKfLg+re2+tCdeFnbsIyudLIQw5XWLiEyxRjjFu4xwso5q1AtyEZZOSrHRfFgMfIMd9Kb3FH7HmOZWioaLzW3QLmy2zHrjiyXSgRFTTdYbTTpjgwU9UPoIG5jZv+v74cXP7WWJn/pnF0pD3MCCHwlsYTXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkVOVTyh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVOC+mT/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkVOVTyh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVOC+mT/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lc7m2374249
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vPRM+tj0riLEpO5hHtQtUWE2/gFMiCOYuNXlVTNR7tA=; b=mkVOVTyhKg/OuAqw
	ULG7EUSk0RP8dcUsycsjvvyRYx4Q0KBz+GzfPFXrRAF7BKkkP4yxmzd9mo8kEe7d
	dF6FHd8ZeDMDufeRQGT5eufOcM+LPpnqhE6zVrz4xFBLJHX6nGHUUicPaQTsMYrt
	Tp5gM1CZHIbulDPDqk3z3+O/f8yLu05zYAaRSSpq/GXZvfRUOTwCRAxwdM4P+xXP
	ey9kV3tdzxiRkQVdNVcRnVGFMP8ad15Dzav6aoMsG5uP0pXwHSaqveWX9DlhOKV4
	LqW7JWV3xOqvrlCu2vbsLB98I+ru5XFdhO4jYsXKRlsL6ZrkbbyDOoSMLDpfxSyg
	pL0fFQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk3w7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84877b362f6so8631568b3a.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101379; x=1784706179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPRM+tj0riLEpO5hHtQtUWE2/gFMiCOYuNXlVTNR7tA=;
        b=YVOC+mT/PsabuNTC3tihwC0R0L4uG80uzbGEbZAnDwsx1GEuH2Zxg4yuL8xW5R4jN5
         2QVBaTafUAR+0dvFtf14FKhcp4FmRSyna3G2NPGkSQRaDEe9qCq/mna8DoA4O0un0uB7
         +FqPKe0S8kqfb87MxHe5O8HDtzbjgRL3HtCeEYvARWqYe2z4zyhLU4o5e42jwsYSylj6
         itQWKQNY+tkkqfnvh1jhhkGf6e9pWEYSYnLXxfftRbMrtkEczLpoR7z6o9c4e3uM2pX0
         b5pid+jYYHSo96umEIvyWoa5pcDcvOkdj7rbNiTfKiBgca8fFbntMjuwH23DBFB4ofhq
         qgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101379; x=1784706179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPRM+tj0riLEpO5hHtQtUWE2/gFMiCOYuNXlVTNR7tA=;
        b=OJArz2HfZViT2sVoPedscDZht8m0fKn2+d/4Y7eVksAKOwCqu2UAGJCYp+XqvR7VvH
         lLUh5p+u9tO9Y+pHCMxq/c0R8En5NxizCYe/7xLO1pBcaKMkGGau0tx0Uy5yctvLiFxp
         RtPdhg4SU40MnDV8Ji0Tla/qJakin68PIZVWvz9pTvdvymKILxcUFCBY1zdaH3B2rzzp
         8voTBIkXelRlvUwgBcDpOVybkrv5aI/3OfA8RI2QX5i92/9Kwf2ScIkAW+8gaZQ3cjuX
         IV2hOWGAJfb5NjL0O7t6jFmWnRXHdmawb9EhKVwRm9mwoMBmosYpFCZtnLE3O0/TyZro
         KIIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rre0pQQ+XkP56D51vYq0xsAMnGmWk0TLbnuFYmevx04fEzjxytYbAw1/ZUD7N4gEeRBuJjRgepRjGHj@vger.kernel.org
X-Gm-Message-State: AOJu0YwQfp7CmLwP4ZEY94dFnHysPSog0r8Z4h3PLS3iM7mbF1c/CKFA
	mFnfl1LGc5K/S8Bv3fyA2OPscIyulBiVH5miTlDYUjVQHx6RSsHB7zTE62aZn4s6s88hsG5ylHH
	Svl4vBfSzEqrHPjFiFsVFDEgg4/HE/OAukDid4YcfLmDlM1dq9qJ/raJsv+cGKiEy
X-Gm-Gg: AfdE7clSJoVzhF7lZTSCURaDQA8rhkn1kxzxLOlfjuDRft0De4AF0/zy8uSUWtD5tFC
	JKXArZ0f6VPCJpL9D7cot5iDAjqWALA/nRwwEjgzoYcnltIoPqRzW/f6l1XYC8DDQaPrZDYpq+n
	GQRb/cJORx+Zq5YDGy4k0yOrIKdN4Ogj1i+kzIK3VLHH0BSx0V4gxEvtjUZO7cZTcZd+J2lYTAE
	oe0SJ9DohLXeh7X6W6+jyNZz9E2cqy6gYTDSgAcDLNxoztMG+eKNK9L66qHov2l4hh3VlrGoGXm
	DEnR9O6AL3v6u9Q+WaqgeLzVSOwLYD27KBE23WmsF4bDOTF6mrvj4dTe1WDWkjqTeNJBRiOy53d
	D19270g/5JYW4qL1poMY2Gf8zMZ9Urg==
X-Received: by 2002:a05:6a20:da1a:b0:3bf:7110:9949 with SMTP id adf61e73a8af0-3c35731bc6emr6411189637.6.1784101378984;
        Wed, 15 Jul 2026 00:42:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:da1a:b0:3bf:7110:9949 with SMTP id adf61e73a8af0-3c35731bc6emr6411167637.6.1784101378573;
        Wed, 15 Jul 2026 00:42:58 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:58 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:12:24 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-shikra_adc_support-v4-4-5e07b6d21429@oss.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
In-Reply-To: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=3435;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KqYxumK5YGafOBVcgCJcjqQYCmEJidEVjvVUsCwQHtA=;
 b=qaHqhhl0kXendzT0/9Pq0w+J9nYhhy9k0dGcGsyKSsqWl8szEasmledeqGiHqf5WGykVVunhx
 nAbLXcCPH6VDgjwkbfD2rEnRK90K56N1KP9gIkNUUgsdhtjoasSl+Gv
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: 3sfXDWDbrjt_YrIltlYQ8Q00-l-Ywwvs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MyBTYWx0ZWRfX7Kt8VRl41v1y
 WeKlxRj8POSRg8ree4qFzXSGBB/7yMzkfEXjh6iVpt8O7iWSMQ1Tn2AGULQ4sVHC5Q0l4g7VaXf
 5L/esaVO08XB5hwqu/HTKAIvRW7tCUImQ7oXVlpa59bteIAGrazxwv6kvfxBgwbaqSBKKQFXKQ4
 +l8fWhiEgUilXuH2PEcQJhrlKsuYQAcZJQjJYwWtIkfdF1ze6vtnS6755LaHNtmN7QvdSfALSK0
 7PlJGP9cqv3ZNy0hKjVyZ+uH+HyyH/FJrdd/6zs3jg690FQDs9WYyPxAbJOesHTp7UaQAxKu6Ci
 JOHyMTcfP2aBljPq3rOCforCkNuQHTrzSG9zFaeo6wmFHZjzmkgPW+oi1XlDOhaxB5XWK4Gena2
 k3QI5QxKgRoZqj77T/nUd7ygMiLitgQ4ubQ5nLBtrLAHZfIItKaE6jzhc3m0T1pZuGVIoPhB6p3
 plBP44354DplS9SSZHQ==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a573a03 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 3sfXDWDbrjt_YrIltlYQ8Q00-l-Ywwvs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MyBTYWx0ZWRfX1h5ZLOWUX6Sj
 BR/PviX1hN5NUhOLwDo3m2dMoFD1OmLbwK1aHarEYejylxPKTEJz4NG9kA62aOgXoJCf60Caqwu
 kbnkGU72+Ak2uXv0X7ORkIbPT5bPTGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150073

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
for them.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 73945bf42112..9ab0b44b00be 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -26,9 +27,121 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	thermal-zones {
+		sys-1-thermal {
+			thermal-sensors = <&pm8150_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			thermal-sensors = <&pm8150_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			thermal-sensors = <&pm8150_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
+&pm8150_adc {
+	pinctrl-0 = <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@52 {
+		reg = <ADC5_GPIO1_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
+&pm8150_adc_tm {
+	status = "okay";
+
+	pa-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150_adc ADC5_GPIO4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	msm-therm@2 {
+		reg = <2>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
 };
 
 &pm8150_gpios {
+	pm8150_adc_gpio2_default: pm8150-adc-gpio2-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm8150_adc_gpio3_default: pm8150-adc-gpio3-state {
+		pins = "gpio3";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0

