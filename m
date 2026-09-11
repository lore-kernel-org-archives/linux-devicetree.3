Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9316E4A5EA6
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144910; cv=none; b=aRih0W8PjBEHeDhnqKRZBJI4xAbqyIZeu5jE4BMOISnpc7L8WD+osxCiypDBMlnHcyQCA3rKrTc4azjvkFkJp1n4Y+qxvrbeOkHsMVQAKYrJmzh7As7vVWH8gqLsyooz3ll9rYuh+c/dGSA0nDXyAJDWVRkUumfflNuY8BKRPws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144910; c=relaxed/simple;
	bh=QCon49Ot8O/e2pM7+8CojRw7D66D4IEK4MsBLQANqrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5+yAprWUaChIAp4YEoBrJbWLAHkqPZ1zlXBUTmYV/hWpyvlnXZIFZcexq8EFgpB79aOWc9cQcHFc6VVaHi6T1nuOdcgOiCSpptiCbA+SiFy9ygS8nMQ8NOUVKe5L/nJ1Sx/gjFqMCddN21fw00va7I7ZAv5PCGsW1GJ4H3NGwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CL96jNwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYoWVH3M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CL96jNwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYoWVH3M"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BG433Z3426933
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbsLMOeJpYAGtp5sTYvCoYNNSc8CfAGSW5oeUPz/10Q=; b=CL96jNwEngNQGV39
	WmtPZjm2Z1Rl5LfhdfaYV1rfU3pdBIzqzl4lZDWxu6WEOKvYdOpihsKAcKmulyGc
	6TJmu73yGyJjsUBnrXjZvJvPAwPaSM/qZynbNKV/kuhJdXI6ayIo+HDDOJSOb1KI
	t3tASXcDLopGba4CULScpT4aWtb0PscBSJijwfO5TdxBEf6U1xcDqzZrjM/tfLSJ
	rvIDCAJT3Sq/VE8MYzTjBIBlmWACD+IRKUJI0TMhK4BFfBIlwbcd8/xTHoygaUq8
	oRj5WpCPXMu9U6gCT8vDU+4VXT3al/h0RSFbVUCRE3GailnOI07oA8wvhbADZsju
	rrPKJg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmubr4tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:41:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso1453882a91.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789144903; x=1789749703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbsLMOeJpYAGtp5sTYvCoYNNSc8CfAGSW5oeUPz/10Q=;
        b=WYoWVH3Mom4rWvJDN1WivedmrMiaE4K68OCvT6hxgimSBL/LCkkdrxgGPDI3MmASan
         2mv9w7AsBzzlm4/aSgOahtW0UfotL/3Gig4eskensZvHkRqvfkhvA2JJfds4RuM9taUs
         tXRAm//RPwNt1Y9lYlDa2L/G773a8CVYgzXeo5m21gIC+nVtZVAH9w6l7s/MmGzd0D8A
         EPpwwZ2zenA6/nKQYGo7SePiA2Zy/g5NvtPu+6XNS3TDSXbid2oR6NHcXYTH9Zkb9+MO
         lP5fO/Ybn1jh5OCXhyw1P8ZjI8rHMSqdeY1XSZDX44/K9z/bwEp8Sj0lTZ+K6TQzzGGw
         DKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144903; x=1789749703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbsLMOeJpYAGtp5sTYvCoYNNSc8CfAGSW5oeUPz/10Q=;
        b=dV7pLXJXfx1Sd8z34q/cz9N/yD+bZocZPAPhshi+F+/xq0NrgnUCvBBVlEBXF7R9li
         JwiPg+zz46Od9sesxffP99hZxTJx7nP2JjGbDToAvxvwvLW9KnSiXhmW+8fw32HuE9Ps
         38V2zK5IqaMus75rS8GKluVbDn7uthJGhn5A+Mzc2R+zRbWRxxOimDAcep1j65T6rEe2
         mOag/JbYQDVuteADazKLE/8MOyETHcXvyOmGW3XjLjPp8jmxJd5W0APbA0nHZvIxceDH
         Va05H+2QURtnsPilLVndj2d/nTMHA1iLmqz+xdKsjfMrE6PjpRzCJOhKYE+MI/KVghml
         wpWg==
X-Forwarded-Encrypted: i=1; AKwUvBztb0Bp98jvxSViw9d63RzDJI2esHEjNVKNM0whPzIU9txncAtvQ6BuSmZ6IpoDtivLlIMDZTXGPm2e@vger.kernel.org
X-Gm-Message-State: AFuF++mcC62Tum44CbLC+1MNkK2miCYc2t6dewhZdLNrWbmtscTd6NgU
	mHnWcm95Vx7LNhc46C0x51fKSz3NnUK2xXAlZVXokQcAuJyx60qrmEua6ADYEvYm57WRPEaGfWj
	csnjvOn+DlfQRmAUKNlaKW5nJ5lavIoWIT5WPxlkCY2LBUfCN8tjA0YiMoSOLtgku
X-Gm-Gg: AYBFou1NKIV6dBsfwG/EM044twQj69fDzX7oiz/5YUBv8HeSXbkf23BAZ5q53G3rvId
	JSZBfFL9Bs9/kgZX1fLuBse1pqVnNhgw6PO7IRWrT49N+Ub3amgWpCar+rUKwYJkagnet51fAVc
	mnej+fnpakX6TXkC8YvV7I9gp4wpLYgPIx0jB8S94ZjeRR5sG9B3GohTuCfysM1ejtfGgUC8Odo
	55rlCJwdkSjgX+7/oSTXfLPTmYWDdB4xQWVcxl3fDkMePSPxdHoHWi0V4SoEgQFzbU5xeQxv/zt
	jP1OIq9gENa3KiUmx7Ip9sAcTJV5ZhkAkrbXGbCpjlrBVNuGPJ9yxwKrUa9nvhRGI24hjqzJFNS
	PFCRoi7U9U0GEOz38/j8=
X-Received: by 2002:a17:90b:384d:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39d9c1b4a9dmr7808053a91.16.1789144902747;
        Fri, 11 Sep 2026 09:41:42 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39d9c1b4a9dmr7807988a91.16.1789144901838;
        Fri, 11 Sep 2026 09:41:41 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1618171a91.1.2026.09.11.09.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:41:41 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:10:42 +0530
Subject: [PATCH v6 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra_adc_support-v6-4-e4b2da5cd55c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789144881; l=3566;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=QCon49Ot8O/e2pM7+8CojRw7D66D4IEK4MsBLQANqrY=;
 b=uXjRvEzrRS5DLiice8qtLaEkec0RtzA+pW+MuOApF62UkdnaYgIEoS4VI6oDfI0tFu1DUIkk4
 78R1lFCgm1pBYcuroea/OZLGAI10jaxJHPI/aCexywQbaJoYNFIImlU
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: TdP7NTOR5eThjqu1elnDZCuWJXhHW_Ru
X-Proofpoint-ORIG-GUID: TdP7NTOR5eThjqu1elnDZCuWJXhHW_Ru
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6aa42f47 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX/K9TYWxaScd2
 lFy/mc7JcYnmk1Wfp9JVUvhMvUUcp4Fly1Mif//Xayrtc3RwqPVE0g9XaLmc1fkaSkBwqV1IlC0
 AN/RvQ6NhXUNSxJj4mSqtYvaMxnEtw1JM4RpqN02Um3osEiMcJAQ92CYEC7YSHkTGR/VF0NHWL+
 5AkH11SDwGHvln6mAOAZF3eX4zJ82HFuM1ByvDTt4T5xO8QpeWo8j1s+V4tvkqx/wsvc7/bj+SD
 htGN7wPXQHZNzCuvG5Rn5iUU9f6p/oE8B+x4l0ahVnXS75rj4ipfRxTX3kJMyr3aSEVmtV8zXGW
 F/unxXPs/tHwYu1v2XnWMRBHlnTLayUb20Z8VCrs2LKmZz3Ilgb63eawNpKAdDgZUAHdGa7gCA9
 8oITApsSMDf9TU+144JyS/IC0UIFXQ1urJP4VdtYJ2HRczEjHaNdCp54bk4OB/ZrXW2gwa/jpve
 LmT4wrjxPwbMlHOe/Gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX0GiKdhiW6kK0
 34+4D5eLRzykYdxLZjM5s9EXwHNQsw5S5dOvz6rTkHXdA96O/CAF+uIQ9uOObfF4srtSnGXPj9X
 NFibz14gnLAuK9cAfLfHIuI1CgL7A+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110233

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
index e119ace54e58..a6769364c192 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -31,6 +32,44 @@ key-volume-up {
 		};
 	};
 
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
+
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 		regulator-name = "wcn_3p3";
@@ -76,7 +115,81 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
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
+};
+
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

