Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7ED3F1AC4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590287; cv=none; b=NLww2tifItzwpFrX8XvjM26+OW+Z4Q3P/AT2KTKf2JAwaznPBZRMY6x5xAkJI1xxftp+0t7jd/LpNpHGHFSYWl/b9DRLn7BOEIkJJqIkaLLWyaOQS0dqTuND5KepfCRfNsBdQ8FiBz5n5yEFzV+NTV5RW4yK+Jaa/tncLf0tFQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590287; c=relaxed/simple;
	bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0cLTCtY33qGzKBZuJ5y8XWICslhjd1Gyh1KoSv4CT8wq3XRLqJRJcC7cLHoStbJ0KPX2RzFQLiCMVfatlxvu+YHt0HG/uvi0Ofy423FA/+JaaPdiEwEGbdiZAMLM/ih7H/zLKUIzAt9GWTOFMJwS/r0Xg8DcEuiLi4ghvUTL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMFEpaCA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gzyb7clA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMFEpaCA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gzyb7clA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960PZp784608
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 09:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=; b=AMFEpaCAHh++yUUf
	reRRZ2kGg2FLu0GjC3zzGBXKoxRT5zTuGlNFSNxvhqLNNYy3pa9g17KHRThE/jXV
	U1Zgy6ygAIe8Exi1eGsZsdzV6jLmqP3r1OY7Uiw90Ko/PQQYtC903sQdcg6lO5Nc
	WTAZS9I4PLiofOisw+xEwH0fvdTUhDWb1v5e7UK3wty4m26yyMrXQ7u87aeWBfU6
	DZE7rJ3CDc0j2FHWvz8N4tDPs/u6Hn7DplfY1sCj6622OYR/o9gaSwx/9VzEj2Z/
	TIBH2+/jqQori9bhOvbI1OywgCfRW2K9zpkfDFQAxQx/TOOSVVccjlfeOc1cRvKK
	tHm34Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u32hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 09:44:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so1234234a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 02:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590284; x=1784195084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=Gzyb7clAGWZLSIyaN7TDRaWCOGHCVTERPleZ0gpYlPuVA6Su7iPpE3MfEXTc7q0pPy
         yRMXUmmedy3bH/bQ+jU3CKEuL9h4AtqSU7WbUz04gyLd6MHWeoRseiacx/z8nTiRN5OJ
         EV+EzIfsXOc+F8nprCSSnKe6WeWkO7S9d4F8bSbSQceRLRo0/+bCfv4honqA0KWVUbig
         K2spfMyNLWCvoFBAHjtlQwk2JeKhgh8UDo1RILtlXGg6QobPc2IDSWk4VNEXM8QU7qhc
         QViuSsNRoUpzlJXTjt1gzMugGBcRD8+QpXX/NaWzvUUGviZHY8k3ad85QThWDCrceU5O
         VVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590284; x=1784195084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=GD88RY+DCfcBW4Ebw4EYerM7mSVbZkbPbOPz6NDnb5xgii8RgNlwXK++WfwrqSQcZs
         n+sl6VXkP/VCKX2aWSqBs2rEKVS1LkdrVvQLkJCMExedXxX9CjB/RKEHmkQBel6SuLkW
         xYkn9MaL+83HbBe21rPOZV5vHn7VDo4rAWhKuzy555hxwHgvWK85P5LlmcunYqn5cac7
         hT1RnKJwatr6cNKfm1y6asG/QggsQ9FdllU3FC2L00o4J8hiwOG8IunhAJjDT79FjRKW
         VIJtjcs1WPcipu1tkdOjFvAUzWrLnAJoe05OleOemzSoJM1BT5apTEBBR6cvIAxxpDhq
         BNpg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7ib7GWTk4CQ+De7Ae7zGuxHcu57bL4G+OIKtb1FyzR4OJVNllunon2u08uDGp7STzL9dpwKAO5HXS@vger.kernel.org
X-Gm-Message-State: AOJu0YwLtOf7A+WXsd9m/AZEVDcRQ1u6jRLmJqEc3zz+FL9ruRUHg95H
	OqaM4LlP1fKHXWVMA41gFm9tpI22SvD+aB+iQSNy/Vd4i+c5iUa74TZhq1/qSihOzWD0DBAwN1y
	4LfbX7mzXcGRqfcMJMoSs8jmKcoyhdWV7Pr6I838cS5gNb9asA2fi26biGkpA6J7F
X-Gm-Gg: AfdE7cm8rekackXMsJtBUcQ0hrPz4clfzd3Cy9v/DYzy8MgYi3iGj40J/Wi+85jfMbJ
	OdEPFhUGxrPmTA/QANk29wgzfYDzFl94Vau59LUoI15iwclEQQSaN/G652SUFcDKWXMEFWAsXLT
	5fDf82Zqz1Lzk9jT2tc2HeFQpVrnv67eqtljRU8vb9d0yARGIiFHvDF+PvminbzAs+fDcnsYUve
	aLRdBhAoXjptBe2zoY4vyRsVBHGG6f5V8n14iLLtw0qYNx69d14dvTgpBqvQnzwdNbvgeOh4U2U
	v+29TS8fzuIggl+CpwuJD/4MemV+/WxQ/zV/mhp34Vcd+M3EG7rVu/Zb44sjkzpyKMbkEOm7mSg
	3w3fqzqTQMjjsNaJKGpcLtkmnbBWivA==
X-Received: by 2002:a05:6a20:5483:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3c0bce1c053mr8808038637.6.1783590284436;
        Thu, 09 Jul 2026 02:44:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:5483:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3c0bce1c053mr8808008637.6.1783590284007;
        Thu, 09 Jul 2026 02:44:44 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm3493075a12.14.2026.07.09.02.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:44:43 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 15:14:05 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-shikra_adc_support-v2-4-8dda38f7bf3d@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783590264; l=3374;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
 b=QVtnk2j5CEKjTHIOr5npu+92k0IlICiO5rQGOuwKPH0SdIcB/QUysWo0lx5DpKXxMr7y+egYU
 mRDzyWFvWkyDIdvEKL5NSo7wfaa52LAiCbcY8Tm7ChHfNthF9o2gIEq
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfX0uzaeziO96Jw
 2Ch2ALVCoHDU3OjyE/9kYzZ3H3HJdsJU4IwgZllGJHoGZKH4psEWEIybM0yGvQizC0RfCUr/CQC
 TRYgxX/8APP0a9dZX7zCWeI7bv+nbX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfX58KdnosanWdY
 IlxpA8mfMVFOUo1FlI4rxDkTYrw6hp+gaSCYh6/KJ/Enyp+9DYVf7C7Ji8yRMZS//gzfnKQ7snx
 B4ZZiTQDG+d+gh+rtN3m8kVX4SkxTglySOY10u1++hIXqHouVGWyz8vVxD3wVNTW3PwIpAWoRaL
 JuWeAbxzgbl0HnDDizOt+vVqcf68eWPUZAH6fQtnM5XY1tmq9iUPeXy7W25xljey5TP4x2CkRO2
 vCWP/C5tpcMOZuKVwmLq5i4TR9+H+NAUuTEAL2JtGKsS6SPep26fUiLNyLaV+cIZnQWIJkkqFE4
 0L0WDLrM5+DxTD8ln3eDu3hoyTJLAN1EHOg42+wiC8cqdSw1m7l0x5xVHz/TRpZiLI11E7033p5
 CjAaYos3c8/FUzzdG7GjMw9eJSZ+COjR2IgQRBrAZlASt6OW9mjj43GCvLAvswUmcKfg+AysuCF
 ItiOHc5JV3cVgURAFgQ==
X-Proofpoint-GUID: be4hd0GTaULuUQ8-BBDSQHKMhnNhQLoT
X-Proofpoint-ORIG-GUID: be4hd0GTaULuUQ8-BBDSQHKMhnNhQLoT
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f6d8d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090093

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
for them.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
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

