Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141983C2BBA
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101377; cv=none; b=F2zRAHft7P4LqYbwtQzckCS71RcvMKVC0PU6mxC9Dnk/Hr6sS2F8TRyI600eHKaFu88WzCoioyCD+wHt8u4LWKm1j8TJITCX4ourGWlrsYuxT4rlIE4zegnXAzXBoYSMyUX5Ie3aqkak46usADeVb20kEPzBit3CoZ6rrUINbS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101377; c=relaxed/simple;
	bh=01X4Vu3JsAxMAkM2zUPyBygNqVIzvXT+LhZN27hO47A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q30rjo+L211HVGI2sNuPRiqvWr40S3ueRCoO4/+lDFYjjG0n2tLSqw9uR3E88YmEQuNbv92O9yj2nQ8yWMvpG70FJeSpxG/9q9YPtxs11oCEuOZ8zrDMxKIQ0E/ulDn5NIZ+TXotCml71GiooNRcaddGIycj5Avs9azjJTnZRh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSJqvioI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGIO7mts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSJqvioI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGIO7mts"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l2rZ2372700
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pd3OE8Pl/PRa/Zoo/BTqxuHeBlpTW6qB0mLEAk4Af4U=; b=WSJqvioIXxIpCnkr
	5Jtz5o7Yb2G0qXc+6N/AnSv4XKI6uE2SecKk2Fc+hnhtaVORs54EjR0TlULACb9n
	0uRjHndTd7wZPW/FNowqT6vDEH6vpzz06jn8LZQq3UFPLuE+tfb54JYwLNii2vfX
	Z6Bjz26RNdBmQaFjhQY5lD1zY48gVcg2KFlfkMLEZawgPlauqHSCUMw5mlIQrH2d
	HamN4qbj2t3XDWSWmBfvbJjLbEzx2JejAk0gtg0f1lxhArq5yYLbb1FWeBbuLRaz
	IcX4conRxQ1i+SzmcB57oMFPCu9qiEfjdF1YJvbxDRLff5SJLuTi2XHILEjZAKl4
	Qoj6mg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk3w70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so6614423a12.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101375; x=1784706175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pd3OE8Pl/PRa/Zoo/BTqxuHeBlpTW6qB0mLEAk4Af4U=;
        b=AGIO7mts1WHJPKJfFC1Ry2r+GIpwJE2TNnFWMbp88jYS7n2rTnVQJm19EWBKmAojc6
         rBwes8DXNyaTGgObZg88IDzooe0xGCmVaX7Gdvy1wTRaWIacXjuh1Lqdbk6uImx2ElEg
         4aem41N6Dp1qE2PMEQRkr/mMMCNNsAHcRp7qgSPLNfNyCW4LCzCtrHayf3JO9uI7R3oe
         TGd95s0yIB+MsBgYY3g1c10tOJzOHJQfJ+IUEwb/RVQGKWUHLnbo37FH/BmvIDJEKaek
         er89X6j1P57vv49x00UO4I/MIeGAGZLoqe/454LHw2QTMQqBKVteqjBKFhRbNpvT4Ve/
         eFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101375; x=1784706175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pd3OE8Pl/PRa/Zoo/BTqxuHeBlpTW6qB0mLEAk4Af4U=;
        b=pr6n66KJ1i0jrZ/XN0WjWtPcI9BxYWiDZj8ZgqDB+/2y1KG2L7XtZgfAZ5V+Tpvk7Y
         VTs15lNC9YITsK+b0De23sZH11POeM20X/teVovuAZWLS8ohqf11MMJdx1ZlCu5C4bbE
         lLtzGIAy1JpL5o+CEAFLJ5W4xhIzNhXR6B4jAwzkbjsJVhlNQwIuAPvFejsixeIFgnWV
         v4R8cFn5Tf0wqDpeUP4ftDhLqsuMwE5b69RPk+gxAKADyKB4yKAmhC4FN11EGIeESH4c
         UbOOMYGaX4VugxYUfTrOCaDw08yaSsbInwUvDR3KHE0L65BhwMvVNYRSCtlA5YMtJzW+
         j8dg==
X-Forwarded-Encrypted: i=1; AHgh+RpIkMph1df1V0Urn0jiP+n/d4oehdVMFQDCI28yEGtdtSsqBVel5e4U/KGkAyrTwLffiwYokJrhsgaS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9E/5b0HAQ3tb4sR4WlKDkHeL0/skX4rI3BtUxgxNBgIs6YZ8W
	5gh5KNsHtBv9G1gvnVfH0qy9VmP59snqJ5VRZU06uBopM/c5QamvYWTJbUkZH49wNj99SNjhkPR
	imq4QsUyL1EcgdgcwxW/0VuH5Ff9djG2V/l/bkDaP6omujXG2OJqvf5B41esvt12f
X-Gm-Gg: AfdE7cm7CHGOS8oqhUp6Oj3goXsV+p8LxZhTGBZ6E9QCovGTr9/VgMMdBuf5Wu+r5SZ
	AVxH/fnVtIhrk4+OiuNYvNVi+yASRUfKgQtM2S6n6Wx0fN/bXFQs2g6aNEVNJ9Wl131uaM7N9V8
	dNL4SLAJ9Qt2njZLEeSb7SY5xj1Z3Yd+Z9M6Zpb317vbEdg2Gdie8zlF0BPEKZG2GGnXjtsiJ4f
	UdZuXZBEzWyU8pRORcfCr8PMw+ALup2N/yzuqPH2WWW9Ek0outjFAfuynwIdBNtreAT/KHc8LpR
	zvnfqzwwFZuGzSyCM5YOHkuZTawqWGUez45O1tDQbbnCv34D7U0P0NP2Z3fjfD5Ux2B3O5a3iNV
	orsdy+J8a8vtv76yP7wgZH685FuyEEg==
X-Received: by 2002:a05:6a21:6817:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c36c0f869amr1986799637.9.1784101374825;
        Wed, 15 Jul 2026 00:42:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:6817:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c36c0f869amr1986781637.9.1784101374380;
        Wed, 15 Jul 2026 00:42:54 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:54 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:12:23 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-shikra_adc_support-v4-3-5e07b6d21429@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=3847;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=01X4Vu3JsAxMAkM2zUPyBygNqVIzvXT+LhZN27hO47A=;
 b=GPulIx2QfScKK0dGTY0iQPEbHlawYEDcnSenyEBVRu+fKk03yY2FGj5wEANQnxTZSLUO48/hy
 DdBMb2tvdawCrDKJSTqWIHyeqdH/KGXtCujH0RQaDfFUxyKWCwDYdEL
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: qO0UGYuu51Vnn580ZFtV1tIFf50o7P3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfXzr8XI84qRGeP
 jjS5VWXN9/NZFwtx0IJbqwxSeH3BXQQI9ZGBfXjYlQLxd4xXp5k9z1qfIC6rmUROWnZo8YjPtL2
 nKlxCt6E7rRmRe1Jq8+iqi47+ZWedOk1T1Rtoa8g10yWIsoWBwc1dfLfp2mBwn/GIkSFzY+aZmK
 kQizm2frkmATbrwr5651LkAvLWZj1DqViSROTdKtyZJktU/3I44VWC8Pi97peqQBPe+/t/XTxR/
 iG7pvnqdljZnGiC0D/IZIbS3Eh+Ng0ZR8cXbJsl1alYDooYz2+MpYR2pEH4kGEPgFnA7nLel9bf
 jmex/XmsdbVuJfa+gw3Mj/FsJgZlHIFvfcn0lG0sqH4yTb87efigS2Uk2vx/hgO51zRXzv/WIB8
 DHp0nvzOF+ezJnmoOzuM1+XUvaOOUm00q1uSh3BQllniz8rYa4ODhhkkQBbSt1SQ3YVDz0g7PBG
 HPkJbQqgtZYuPC4jKXA==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a5739ff cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XPlkfCdyFubSKYJrR1oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: qO0UGYuu51Vnn580ZFtV1tIFf50o7P3G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX7S3bBqoVVFAl
 UjesyhNZLhYWCoimq4x1FRlJR6s//nsXNnxzaNxQJkV8lMATzleIBYKFOw74GJdzYB+SHng5Vdi
 LBu4LMRYhzxIVhnzQO1pnqktafVoPVI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150072

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
index dc3861489f64..139d0ad0b1ab 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -27,9 +28,128 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
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
+};
+
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
 };
 
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

