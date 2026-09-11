Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F3E412276
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144911; cv=none; b=WLPPHpAR0jY2+qdrD0Cjv1EiB3l4ummV5erYAKP8UgBohneHGKQVzYh6xHqQ1rpkVYuixAnpPOa/drsbUZ86nQfkIYKomPjVpZvTPx3k/yTCIWSd9K7u/NvyYUJkwIfRkL1RLZ3s38ps67QWIzD9cGliy64JhFEmGTiWxA9TrSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144911; c=relaxed/simple;
	bh=6baaU7n+sEVJAj9Wn6bzcJe6h3P3q7EI74l/o02CTPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bbu4NjZPNsn1YhEO5tSNt01sil1DNLH70k9/K4SSvkejNWC/YGYHDKeznItboOqvzu+UMrMEqy/F3HpsLP45Lq7DyJ3jf4ND84cEB4zchvHYAXbAXtjAP3+HVD+XSShhmTB5kZVAlY7m4xv5GAo8AdpfwiEYFx6j6O0uJyefrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5z5x4HG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4T+f/tD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5z5x4HG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4T+f/tD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BElxCV269259
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9LscjuXhxeKqecQX5/VqopeParKN+QGMLg6M/FhLBo=; b=n5z5x4HG2VWdBqfG
	IIEw592z2u1oXeyjttoJZYWdEZwf+EELecz4T2guIG9bWbgKBLSZxVVXv8jOB+uW
	DUQtlXM6H6BnfOi8ed0xwi2gH0caZlWQ8XBIf4sdZZsCZzIBwDuAEMMG9LnJ2rvR
	GDa8IX/WrXIp5c0xdO2AXPq4t4FVQeePT/JC9sfLwDztYzxW/8Mo0bWa0rD3jTrw
	1zGJUtkrJgKfgarHMaqoUsLNFv1z5scvbXbTGudUSd0iJiPkzqjqG5TynkxkiEE0
	SH8P/6jI9gcfh/iykirUcRJVul3UWHv160wrlWH2VYZs3F7FpWjVYR3nvUN9cVwr
	RQygag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd52sp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:41:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2032494a91.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789144898; x=1789749698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9LscjuXhxeKqecQX5/VqopeParKN+QGMLg6M/FhLBo=;
        b=j4T+f/tDfwjLATSBmoNmMKNwoj6jD5QnlCchrgnRLfE8StzX5e/kdzVJJrWv9rGFtr
         eFTm6xJ8RW59dXbgOnTJkhpGMlLF5z+9YYe00JhlPeOVYLN4DuNJAZkgEihQBWVHoQaH
         BmGz305GlzZ8FuqmIV6GUQBrMCJJ2V6kHCnddsfgKNMvqdOIryVy1EZlXkt8vWzaLGGK
         +Cl/9c+iKjYYYs+5Rcu79FMw0k41BwEL9osVtiDkjQNRkd4fsVqlEXkJFHN32PVmbt9l
         Bj8iOrWc9GYoafZSQe7t980PJKIpr1vLzWCRHxhFO8qrZMojCzc87kD7SyLee+UaV1NL
         y+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144898; x=1789749698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9LscjuXhxeKqecQX5/VqopeParKN+QGMLg6M/FhLBo=;
        b=W5Izscwr4y0ioexGKnU0DR52lcWdOaOITqzG1FCRZLXHq+79goEfO8T2rR3kBm0m7/
         TAXWY80wft+ZfJitCTWSme+qOI8Doo48TDPiVPD5PWPUz+YeNhD8KvFXrsXeD3dKVfGI
         KgHDHobDRvXDOGRCvMuubsnlUMW9h6uBG8WGeRCMF7FSEdPdZ3kGCwf9/+yzW3wdxnwH
         OTxNC75yy3V0j25anqBtvZZPIA4fq2EkelqVE2VwkY31VKgOIkNrM4Hs3J0hSP9ITA78
         s/WgJqYvRtUJulAHRonYxyD5swZ/lgOoHWpAbPTN6P7rZF1FVB1eafu0QBF11NUATMFU
         ox+g==
X-Forwarded-Encrypted: i=1; AKwUvBwsBeX08gNO4YBmVoIf9KpldxxNOALpqLc6W3WDlGK7MUbs186qTtlmg0+tJ6C7AeoivoAov8Gr8/41@vger.kernel.org
X-Gm-Message-State: AFuF++k//HhFnmoTlzwJeTc6IIg4TTREC559KD+rkcctZwo4EocbPGQy
	PvCZ6nPsiXor+DDhA7CCiDc8JO2H8n8yNMg7KrLqlwCkZa5e93Khe0t13M1Be8UZsA4PRAnEbtH
	htnGJrSjn//a4q1jMXotiO9maOLDzrQHH2jp7S+9Ka/WIzVfFpUzKRMrqCz+o8nP/
X-Gm-Gg: AYBFou00quKoNNaMtjXjXcFo7ycMhgWlJpVJ+tTgeZAKovx/Npj9id7IKKBmUhjcCOO
	RhU1yE1RS/VgDvgTBYzVfdZUmQpusR+OlQocibwDDYbP83dJcDmIPzfnHgP573geD89nPB34mz7
	0FAhAWQhlOGXkjWTSELiuk1InImJV25cUWaNLKMcrIuJRifeyL4BVefF3uCSIfy4TT+i6MlZrT2
	ogEEDMXZqPQ45bEPDZOpgwOtK2jwdkBoMjYbp3zzLA4szeH74nSNoambsnJGdXsjg9fNjVAgSBb
	tPHxvhxaOxkmWqJzas+ymbLVrTsPS9wABO+pEiydXjU51nJACRK8EIeYm4e0jSqOFJUjOAXBQ0m
	AicheQCCc/fz87ADt/FM=
X-Received: by 2002:a17:90b:518d:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39d9c3b6bd0mr9545449a91.25.1789144898147;
        Fri, 11 Sep 2026 09:41:38 -0700 (PDT)
X-Received: by 2002:a17:90b:518d:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39d9c3b6bd0mr9545394a91.25.1789144897673;
        Fri, 11 Sep 2026 09:41:37 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1618171a91.1.2026.09.11.09.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:41:37 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:10:41 +0530
Subject: [PATCH v6 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra_adc_support-v6-3-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789144881; l=3930;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=6baaU7n+sEVJAj9Wn6bzcJe6h3P3q7EI74l/o02CTPM=;
 b=fX5FpuO+/mIPXRZhJcwb0ffe1TXhRyvHrj+kY6Z1ekg88CGYOz9RJ3AS5nsKFKljhhljiM61G
 BcGzDCm27ygBiu3CbGHhfSvcTxwpXSu/ZZ1z76CjKfeKcOodUT2o/RM
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: QTMSoqAwhmT3dIPAN-fza5W1iQPOQpY8
X-Proofpoint-ORIG-GUID: QTMSoqAwhmT3dIPAN-fza5W1iQPOQpY8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX1CN5CtqZEhCu
 IsfLC+ER77j/awELoS6ZDrlRgys6CEqeONU9W1qrnRtzC/NajujJj+yP8aS4KAfiBwBMAzyRoy4
 pAQZnrxP0j9L40sTWYJIZvIRCG9nZ84=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX4HwiBlhRzBsg
 hhKyreGmjKLJ/DbxQikPb+4lwIoHO19BNScte8oHWh60unfaG4x/wR5a7RWgrFHzeqWPBIFeVGV
 tpQ+PZuRQ6sLaAIP/5mYebIYWsuCWdMOsYA8LfXWgWejPBbme0RoWRuLSd8xhd3HS6gBc2IjTb1
 tcnem+oxNR48wxe5nLWtAJ0ymPnP/XMXnaoSYIO19lJa1tpuF68Ibdu7QdJK6K73YhCOZB+MEgF
 Oq2qzvgMJJapRrVV0tggv4Pn3gXPeJi+2iY0zA3H5EIWUPN0TkhdjhWeueC/VhvZ2vcOzmgq5Y2
 iLyzC9PK3tMiES1oP3YcIyqoRyIK9rWgvzZ+vuF7j9pxB/bwf8+Q61ZSc6xo1KrUpu39o2zUWxO
 J/hr4RrPxawKtPPgh01kIXXtMlPZR493aZgrbA+PVo8pRXcR8hdr/4885bGmE+7XTmKrVRRip1u
 yLIgroCJzgfvVfzpCRA==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa42f42 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XPlkfCdyFubSKYJrR1oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110233

Add ADC channels for pa, quiet and msm thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index fde7fc035bf5..c7fb71675b79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -32,6 +33,68 @@ key-volume-up {
 		};
 	};
 
+	msm_therm_bridge: msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pa_therm_bridge: pa-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	quiet_therm_bridge: quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		sys-1-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&pa_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&quiet_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -69,7 +132,64 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&pm4125_adc {
+	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "pa_therm";
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
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@54 {
+		reg = <ADC5_GPIO3_100K_PU>;
+		label = "chgr_skin";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
 &pm4125_gpios {
+	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio9";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0

