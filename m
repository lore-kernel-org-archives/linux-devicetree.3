Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9F33F5BD7
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590287; cv=none; b=YgqQM67lKy4zzvfr7V3jVE0QtYPu2yHLFLFZtUwKH3XFMcmB4bDk+e4UwiwtD2f3GqknQnAj9kDO1KgqakFBmIGJ2udg0AfB7PJzc738K8TkjpNh4R8L7AR8S+AMaf5O36DH65ro5nQHR9UVLSsucNd7CFW7ybC6hsPeWffC0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590287; c=relaxed/simple;
	bh=eLa2M4dXFNn91pqh1C/4MnN+ZhGgRVYlWmVQL64SPJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mq8AiXasZcqP3pqJGirmweLOJmSPFTf/kivqnjs8H/4FWR0l4cobydV/+nyU67X4aXPBrOCy1xkphaVwlsYe8hQtOX6sbpfzMuGwnCsd7Uffp6ytok8wSbcC2Kp1aAUWlTAE1Lop5cGhQZJI6AYLL0PGfihnO4EiGLhdn8tQOfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmHH/CzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=au4H9m6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmHH/CzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="au4H9m6V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696189s892148
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 09:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0wDUNQH/Nwm0gjeLnYOQPxbyep4gYuxyhSoBpU+SGMw=; b=nmHH/CzEBVjT7Y91
	k6WvZ8k7Ns4PwUxnUnOhRF9s4UzP+vDymX/K5wfc+IKTguReiJAu+grrteHeJgjP
	2+Y2lkMPoq5EZpfACDKQXtFeNpeilf9TjzbFZ2qcY63f75PIbMUpJVGFrVMly9+f
	M7L4iGqwspUGSB6oT23mTBcpVmQB+U2NDv4bCOjmRpCareyYYvJQjaCFApRR+EGE
	+m/OtFhsrsvkpRaGucMkBrTz8XlLE47GtfyxoOhGGz7M+hdnFPvz+UQPg7avtdjY
	noB8bv2AXeI0cSdX77TZeyFkBUAMDmaSWZqq4YXJeJ65Ml8gDTxt89MXiLs1NQKy
	XGtxug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvty2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 09:44:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88fc985a65so2586998a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590281; x=1784195081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wDUNQH/Nwm0gjeLnYOQPxbyep4gYuxyhSoBpU+SGMw=;
        b=au4H9m6VDfncCC1B+jorW6hoJm8/dnuEjCCeSNBU0ko2Ult/eSvVgxq9iOrzM3VG6K
         HZqRgXBB3bVSgd6kaOWaQZUOlRC3El1sSNPgmLOzqKjM7W9/bxeX2629StnH+PXmXiCF
         yPwX310unh/mXYCMrmKKM2E8HQtiZnJaUUR821wD/NmcWS5y7Q1l4D1cgDqiynyXeYpf
         m+zT8qJ3ziAhwQdBWEr8yBUp2Zany+W5Ao/EC5g5K9zRwI2O2xV1S0YJTuAENeOtJCSi
         zXg5k35fN61LbYasQq74Msl/a1AJUmNsRGCmzodIbFlHx0LCGjnw1R6syVSJ0J/xRV9T
         uF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590281; x=1784195081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wDUNQH/Nwm0gjeLnYOQPxbyep4gYuxyhSoBpU+SGMw=;
        b=cI8cUaUcwlFv8lcCUIwQ+08+xNt83WbjzVZMLNapzsuBIrfou1b81xJ24nyrJvllq6
         za4V2EJ09iPwwy2S3mcj7ipGYMW54iFc55NUWVPScxxIRlT1LJHlbsyJ9MIAXmfayQLs
         eXlVfP5uscbUwvROnInprWxJENMXdMm8UD+VrDUGK9HNZN03snOfwLFLcwd9in1NosBT
         qeBJqq5xX80TBw75R5Kqpm7CAH9O8SXSDvBR5f3h3rGZVLXhHA58u/q0wdtISIkjG+Cd
         GyBWS5TJmLVW+QYK9UHYeG2VJgRKVMdLxE1VsCY9MO437h2XU8U2HTsuT1ikZLN98lbd
         ntJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rol3G2Z0IgezOo09hK+Sg94ovqE+0ompjekBQi6To+FjBCc39N6hd4/IjfMWUfRXP7+7QvtZHnw6l3E@vger.kernel.org
X-Gm-Message-State: AOJu0YzGAKl31OiiOjq1VPIARPJbODXETiH7nhRqu7xWmjw6GkI3V+sg
	W/s6iJZuiHY5tiG3VaJU8PpMlgJzWojWNhY5HvpOAI+/nkkjvySKjVBdQ3iVNvnwLpSbYrqP+R5
	1BIrlla14BlbUdgYrf9LHjWZq/7uUXz3/KsXrObZRNur1Ds1VK7iyJWJQGmMjv/v6
X-Gm-Gg: AfdE7cleomt6/msxTgimtT0VTJZQU37ewmAgcLWxrBXiYW6UD1AJvF3SEm1MqmjgqXh
	AwsvzRFxQMyDlgcqiC8Yxs/j5IYT6pPzir344wy6AXidZ8f89deVKWGiKJ0z4sbqRnBjTa7/uqo
	etR12kD1IP+/sTzSVIWmzs8dNt9Wu8KzcENzMz7LqTbKtSpDvjvXuutcr42UejBPNBp2gW7rjys
	ALYw3NAsQqzeGOjSNIoTqPYsblvs4BNUYMUpbaQ1715apfwWd34H/UCxUICSWK6VkNkV9Z2xN+z
	jXrT9FVMc9M/phuh/kiMoffqk7ZXtwrcius832Z0Ai41V9XGYsYRBspx42ntAbdnFIDoiPoZV2L
	5KBBR1bw2OL6ko8aBo/Z6bZrS73vdGA==
X-Received: by 2002:a05:6300:141:b0:3bf:a38b:e8ca with SMTP id adf61e73a8af0-3c0bd3118e9mr7684149637.59.1783590280605;
        Thu, 09 Jul 2026 02:44:40 -0700 (PDT)
X-Received: by 2002:a05:6300:141:b0:3bf:a38b:e8ca with SMTP id adf61e73a8af0-3c0bd3118e9mr7684113637.59.1783590280075;
        Thu, 09 Jul 2026 02:44:40 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm3493075a12.14.2026.07.09.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:44:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 15:14:04 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-shikra_adc_support-v2-3-8dda38f7bf3d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783590264; l=3864;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=eLa2M4dXFNn91pqh1C/4MnN+ZhGgRVYlWmVQL64SPJs=;
 b=BLippZErsVx//nsDs8cVfjs6HxaZw+WN9uTzEf/Oe1bMKxLcz50RG614/DV4Duq5mOu55x38J
 QaEcKrJOmflDCpnKbtyb9L1e0NLjr1tccz6+6Q/seLUR5xyZmRTy4+G
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfX9DocSEl1PdUy
 wVzoC9D2CokNA/43O/9BT86PkTg7mPJuyF5teNud8RkvVKCZ6Jl7IZpxgVa3D3VvS3PdfhXDmrp
 pq0Ld+czxTT+RBUz13WYVFqd6dJuvb0=
X-Proofpoint-GUID: -5nTinc6qf_UueMBMaVGApSF79OiSTfD
X-Proofpoint-ORIG-GUID: -5nTinc6qf_UueMBMaVGApSF79OiSTfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfX+C23VzEuKdML
 N+lZlyZczX+H2xsFzfGTqpC5MeiHUUq+/MZZJyk3TBofM0DIje8soMBFNvemW5o4ThMXzpA7SG6
 TNO9hPp5Jr2paB73XA1XyRXhdENVZUSwZDP1Yntet8TEMZyKFPSmc2cuIiqxprTHwGTL7adKDeQ
 pCbJJ6MWD7HBqLiZJYiwoccI3kQ1MnJQoK7Xe6aeMgiUOe5lqygZRoE53ke9twUhMgTey1lZ0sh
 6AyYRdZvkYP+OlnKALLRkCOmDKAFjqtSMIdk/lOviwLyz/1+ANtNVcbFdbYtyekVDELp5Ia6jrr
 THS5EEQvaDrBn/Rl1Quk3bOZ+riRfAqONB14kX3gpcGFu81WFYomLj9V9BlA7N94jQtWLrkoTk3
 pMZm+MfSIkRK3VIX6zDjHvU/1+AA9zg0KTPBKf/nhzaGWUkP0ail2BWPMtPI+g/Gvg9hqswgxnm
 wh1dj1fl+o/IZMXa8Qg==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f6d89 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XPlkfCdyFubSKYJrR1oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090093

Add ADC channels for pa, quiet and msm thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 123 +++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..7ebb206697ec 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -27,9 +28,131 @@ key-volume-up {
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
+			polling-delay = <0>;
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
+			polling-delay = <0>;
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
+			polling-delay = <0>;
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

