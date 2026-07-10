Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABA61531E8
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666359; cv=none; b=BfekF7BAI9Jp5e8ssordZ0U+Oda3D7+PfKY3Pq3//7j6ashCzgtQbuvl4vQGP/1lXdtBGvd6AOjk3ZJtiqEn3DSVkuzhg9e9g9R7AHgs/iVc30iB0eIFbEBAPgRoPlWReUvzobDGw1CTfhQRriS/ebPXuWb0FfJZKPotdzXRn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666359; c=relaxed/simple;
	bh=VtTxYlg7UUob0/+xAGieea5L5Ps7Z1cL3R/jdrfEhSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3/X1/sYm88fAYBAnH7+CoP6a1YLpgJ415rLMi0bcOTOgzDDrOlDtHOp6pkr2/faP64MkK4TzrBTin/coKaUCYBoPGL6yFnmEwxkds6TLGLDNzUcNYNLwcArzKyTkwgIBNBiS0xiMl/7az0o3TZPVT2wFTEnZ9QC0WsSDhSpd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4dMKNUA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qg0cgSbO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4dMKNUA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qg0cgSbO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3moiq3629759
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3f8LexQAPvyvxbG49wDpRkqIfFfQa3wNEO2hsPP13k=; b=b4dMKNUAAT1mrM97
	HerkiedbhGtMCwG5ilQHMODJuAzTw6UwKnDvzux6enOPqHChDAp2nXJL8lNph8hp
	87nadAM2wkN+aQhUpuwKaQqyNEqAYddBnid2KKEiMg4yV5rhFqnPmC976Cc3NEqr
	5gErO6nGLBLSzRl4++bNOMOCGYAYoaBKZmMaizojooZvOzH9/xpv5mIg2yrTHcNr
	Es83p9MGB2yUxbIOOw3dfvMInPYoKvbyqQErbe1e1lju0K2Xxe4cqIkRck4FMMV8
	6XrY/9A6qPWE+Ut9KB7MgLQ2zb/73dpgSqDaTo0dKF8okrwwhIpQoOGO6wc8+Stg
	16THnA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8j1q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so1323002a91.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666356; x=1784271156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3f8LexQAPvyvxbG49wDpRkqIfFfQa3wNEO2hsPP13k=;
        b=Qg0cgSbOAuBRooGtASHUl03iMXv8o8D3hymeboTBWXkoEZeD+GHE2HjE5pw3AibWlF
         kLESzpR4Y0FvIQxWv5K5j7hdqDL1KL/dMAqQzyUYgHKjhD1IUlUXe/Obtmb8Ol+v0WqI
         dH0xyJZyAM9YdUKfWCu0sNRIEzJ6efzAyiVUVmZtdEou3PPA2gszxrxh52o1K5HCTETU
         qlTaPgDpy9/YjbYVtuRNDuhzZTnrNigEJzepzURzKpvf5aMLSj6refRmqu98cgGOn7eP
         DFJZQl1jIrOvKqDnpP1D71er1e4fbsAkcKT6UYNbqj7Bep7bOqgkhqcqNtt6fhJVlwSl
         qApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666356; x=1784271156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3f8LexQAPvyvxbG49wDpRkqIfFfQa3wNEO2hsPP13k=;
        b=OJWCmBKDyslvgymC9+MIf+3Kt6AjGsp2Pl1smaeMxZ7eBbHP0vQtCK2vuYXwkUXIeI
         UEALHuU/xn8dKlD5QLrQ1Me9hvBDlvbIBuu0XYBupqBxHNKR93PcARjP+Dzb5CPCGgcC
         LWy830LMdFDxJivqSJ0uq4u4FXi2aZeayy5P9eJbk/05Ys00sBAnak+pDxduxGjL4qTL
         bjdOQOS0w35sW3PLqh72tvjldfBElcpGlz8cJFWFtymn40fMY9kbSYcUsWXAVRgqHSdU
         teOUqS+M97xmvDPtOze/JLkoJTQuqOlAX2MLRFrZspsiwc8Sgq9RQQPAnOIr6NuVtNFJ
         NuJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlRvLDptvwmjVXRSSFNkS78CJY1v4UnFa6QKW195yy/H9G0mbNYP6mnrJWjKLzVfUrE+cAk1i5j2Ce@vger.kernel.org
X-Gm-Message-State: AOJu0YyeqVpb68aJMKtwUDGzwGoRCshyfxAXaNmGZYIvPGj6piBcks8n
	QRLohyWfb/s4G0L/JadY2tsgarXW7QSQjJdvlsIGCCZWjjMF70EltOMQrUa7ymxdRqiL9DaqMwO
	rTOn79bFHSLpISQd6jszr5iNhDtO4i1Ht2Hx/VWmVU/4weIgV8xNbxgTVVoSCiYSe
X-Gm-Gg: AfdE7cn+1vAShtHGFIgoGU5oonO8rVv3J/kFoH7sPGDBB+wj1tiPOtgX5scdyQr87RY
	39lz+U0FQCIVidYdsIRPmPt8sYn0QGtvY3H4bH721c/4tY1qABZtC8GsclSBT4A5u9icQjcWfY7
	RdyMYAkY1LJKgEOJYrTcwOJh3qEEn7uT3QLLfRy6nVxNN2YJayxX11PoP+HW1KzQnAUW694PVYV
	7qoGXj39ULfEosdljBxt0w3yxgHZZjJr6l5tjpqWnK45kdqEkPVB+b3mpx31fk0OIKGePc8dv2A
	l8sRwWwl8GL1Sl5LMYgAdxVR7/8pf4pEaZqcLlb+cmk4zEWO3yEMdHqGC03yUzxKZRR7tsJvw7m
	gh/5o1EKPski/631MgTYJQkb5kjoTTw==
X-Received: by 2002:a17:90b:57c3:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-389415eeb1amr10233912a91.14.1783666356208;
        Thu, 09 Jul 2026 23:52:36 -0700 (PDT)
X-Received: by 2002:a17:90b:57c3:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-389415eeb1amr10233867a91.14.1783666355719;
        Thu, 09 Jul 2026 23:52:35 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm31618301eec.21.2026.07.09.23.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:52:35 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:22:10 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_adc_support-v3-3-ddc840fca0a0@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783666340; l=3786;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=VtTxYlg7UUob0/+xAGieea5L5Ps7Z1cL3R/jdrfEhSY=;
 b=7GAaRujqDPNgG7lIgfFtCCfDYIma8CzByEw6FeFGv8jqXRhKXapP99SH9nARhXuMdQY8TkEdY
 XnvWmw3mXZVARiafCheFl0HNF2A/2vquWahXj+Ly9AxeDhBgNtEWJb6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: oVZ9LEH7CUQy9CIsxejV1ayeOZAAA0Js
X-Proofpoint-ORIG-GUID: oVZ9LEH7CUQy9CIsxejV1ayeOZAAA0Js
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX+9grXNcr+0Fp
 rrbp/TxeJR1/V2gN8JS4EOD1YntYv1ki9DlATQoSQKdivId+tmiCezZtk99gTu0tnbTaDCQZJRc
 /IJmh6pJxtgkllhXH/OtaXT1cCFvYL8=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a5096b4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XPlkfCdyFubSKYJrR1oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfXzyfMuFvqye1Y
 tDAt2a/RhOdCTYrIyeg6ka/RZTnSircK0w+dLYs0/5vjosqY8xEg/soRlaL/KlKmnooA1NvZePT
 8g1JVEDf2N9hZ+zoStgvbQ6qGFJxr1HwrEj9PioqlJ7O9l1kBpLcpNjbuIFn0up2MnAPE6x8VOh
 eA2Czek3FOzk03ZBWMP/BMqtErDWuWL9LjMfrXZASqvGGz04B85LWyvF27GX/eDej4+wzRhq8R8
 V6Rj3ncIzHM1Z2bvE1hnv8t7zFOZz4pGlfmeURnMv6qNnBTFMdWvKhmDoEHjB3xUt4WuVYfSXHs
 QAI40Hi3JN+aPr1N0cYaB6vGa1sXzM4RKEofsUDCg5ROFUaeQwJcHKNfIpBJTlKB2ty280koJyP
 dO0nWubfD+tBfNVkXDd+mdOtCVO4ev7V7rlps6Bk1hMtZjCnKGfHE3M0ou0WsVqKJumePum9zYE
 dYsAXPbru1lT7S0gPzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100063

Add ADC channels for pa, quiet and msm thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
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

