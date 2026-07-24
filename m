Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D5D3AA1B8
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879308; cv=none; b=nY/mIhV/hLBTNlmCEupiFfAmt8lGMNf9sH8ZwLk07zB1xdA/DE6yifV19EYccRouE3ZX9IolmWuRykzYLlzBTNRmzIuWsRAGLO+RZcZagidLCezcUMX+rbCY/viLcBq8gOVsvr0WsmWHe9MJwuobzhVUk0VsCRHHjkD73aH4Fo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879308; c=relaxed/simple;
	bh=0Rq8D/NoyC39EmLSzNVbHI8oYiwR5Wkjwf+f9tdSuzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjTaH6nmI7Nrk4btdC3NqPOVh+X3zUVhoLJl+sVD2fXodcJ52xlZl8rByP9oFgP2GEUrg8cIGW3Qz9YuxQEQh8GDKTUGTWGntBWJ+71WtUrjD/qh/kYYF66caJmmgvr3X649lT4EIlmbXzeLnQH/LMpNLU3FO6JDGA4ItoXgsGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOLvKDSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQgEQSGV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOLvKDSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQgEQSGV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lLPd2276413
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=; b=MOLvKDSJDwCdMF7G
	c/hsWbeURg66kQg48xz8qmW0sIIYhdzQw8QneA0LcJffA2IQJ9J2TFKJSdbkPwss
	wghNg7yL2Z6zZ13uYWLBWMpEfyQFqSrGHWL/024wKdCNb5d7KgzljTmgXvP1lHHk
	+G+a6Ot4yY3yKrK/WpiFGunsNaeoG0VNVUNvQOwvQ8scBKjZ5qcQPfECMitFaAAI
	P/L7m/IWmMmZhV/EO+uM4LmDLcGSX58EjlTVvkcWudm9M3+/NYXO4CTc2QOXPB98
	Xhk6tyK68KhoNtFj3IbcCGz1dx2RPkk4aRiXhEbQtnICGEuH5VqJIhMMXDmsBKsb
	9eyecw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0appe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:48:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283fa0656dso25925151cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879305; x=1785484105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=IQgEQSGVr4nx0SV7Gn0fBEA1PLuVEAX+fGISkpZj/5RmTRWpcJsrSKpM/HQalISCRQ
         aW/RvE4kMoFgemnBHxkL01Ilxg2mKLAgvyqjYq2SU3bKZ6H4GfzB5HSFfg/iCaGfhw9L
         8n/xLIZ7ngzN+OYUc5iAbzvYzGtjMFJu5ZRcjA1vXLk1mOi9zDDnOCFkMX4k98BAUGe9
         Zm7++foOdABjzfAeCqo7XOV3V86w4PGiKg9Fh97AHr1ToyQK8ILkiDZvLzIFUyc/HS1V
         tZK/1NkBWtDE+7LG79k1t7Cg8ZC+eZz76wz4hNAUSixqk+IIJOK3knyu0s5cepOV8fNS
         7gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879305; x=1785484105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=rygD9mvifVwNTK91CIB37ZkmHxagvW6wC5k+XzO26df0orgB1/sE0+UUoYuIeS0BwC
         i4NH1YvbsdrB8PgKSf2Gy097XrrLmYeOjD7YUcLp7hjfDQSisUai0vvxSpxsLzVJ5JAB
         Qn+dsvYD4XVW8s85yP7SuIOvMDfly8fhzHUs/nhKqBpdP/IGclbUfTyG90wnLM209A3B
         DqtLPkinylH0vMxRxMetV3wwixSyi6LDYN+3lvy2fiLFGWCTRXdZL13jbbTBWcvCjjeb
         NBqSm/7UzlLrokH1FCGLeYjJVBoAa157f/PnF/kIPrJAhUE2cPSExoKpyadytbMBbC85
         zFEQ==
X-Forwarded-Encrypted: i=1; AHgh+RosvsbzpSMu4DliFNbLS1LTnvkbg080Pl9RDZiAGuLc/p4UtvgHDCH7+ogBPQvD3ZNlke4m4oxdE7y2@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6ccP+MuDlnsSsGYNDLV1voE9vpaNl9UGTOlD7phub5tP8wlM
	s85W16HDLV/ws6e9lr9NAJUoQWIjUQUYhqCSwmMcRhSBLNxwVKDfZmdKyF/6iMpqRgEYVsmZWFN
	FwMcckdf3V26utFjKNWD+L1EZAfMuWlC0WTQmWEHgT7NELbGlgokpkk6OsnpNl13M
X-Gm-Gg: AR+sD13k5tC75yAx44oGFcv5pg3I0/OmSqC0+MEvERKw7H6gTOYOUEDG1ZETCFLav2R
	kh4tfKS9E1+/ydb+U2fGECQWHNni+tFJTisOgZpTYHe2f7QCb03ef/4MWKvD1AV4bsrb2GRAgnO
	EmtGehFZmMV9e96EX37oh1QA5J888r7O/5uX0QaPV+cQLKxRQmtdNvmoxJFDbd/bAOIKO4bjG+9
	pA2vdGzEv+DC12m+TxyV+GR/SQ14BXknUQiSLTYuvL0u0u4AxmVtvwjVJYih5VaNDIY2eSeGds0
	8t5MQu+0RYFbPPTia7qAQA/CvRvysBac3jn2qXdmcsEPQf7DesIeDzBawUd30jBzr2Qq0/0DODl
	6sxO4gkeycGHImkuyUY8WK7SMP6qAXmuWVHq0yis1oSef2gUiDsGFy634ipj2pg1FOmiweXsqFB
	v+ObEwkxB6cIrj2XcNsjNuz0wsUoNgrf0OcbffWokK2pNm466ZSQ==
X-Received: by 2002:a05:622a:2c2:b0:51c:98f:f288 with SMTP id d75a77b69052e-5283edce89bmr55302841cf.25.1784879304962;
        Fri, 24 Jul 2026 00:48:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2c2:b0:51c:98f:f288 with SMTP id d75a77b69052e-5283edce89bmr55302711cf.25.1784879304551;
        Fri, 24 Jul 2026 00:48:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:48:18 +0200
Subject: [PATCH v7 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-monza-leds-v7-4-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
In-Reply-To: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: GUwEJcZe8xC7XaQUO8lJSvWXoHZD-u1z
X-Proofpoint-GUID: GUwEJcZe8xC7XaQUO8lJSvWXoHZD-u1z
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a6318c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX8joQy1pFQ9zg
 8x9z5kkcGsP0wF0U47GaDgXKGbPG5IJewVL0AzQkHjWwmobEUhl2aMrIf0zREfisk1mERxeu7UW
 W445BPc46cdU7UgjrYtF6KOZrqo9nHGb+zvPBMvFU2Y23Yumi08aJA+bGF8CXoee4BI+yXbP+K0
 55wM+AwoBsp3LmQLi5k3Lq2qsFz3VqDqpFMbfPDJMj9YHPX3Ab/jdzYik4RSTeHldLVSjktqlM0
 P0wjRygqI2/yNZsia+vnyqFPEuaNq55xh9ZJX2jhd+kAs0QyrXyprq5E6NbS1o/h8lWm2rUHuYM
 eM+ESSpuplgrdStlJ+JGWzhrhI44U1Ypju73KFjLpOZP0B1aIP4SSrzCthi3Rz78ksLvd+SIqXA
 3zQZUiVI/PMsyU5IhQirAly4zsc6PxHdqOjyfhBJqBSy+e7wEiTuFZ4dOxI9+PKYXoa/Z1Z0Kfb
 vcvu+kZlt5Ip8lM3pLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX5E0v1yntHP2M
 xo1wa53gQ+Ly8Z3ez14DE58SFW0pflN62gPlN8feaZUAPtgO5hhKQW8wS+TkvYfUoDjOXN632yC
 xCJEb0ToKDxygiLb64oPhT1odxWPJls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240069

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..21e32df66667eab2f882731f6ef09b7b6e29e61b 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	led-controller@22 {
+		compatible = "nxp,pca9635";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@4 {
+				reg = <4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				reg = <5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@6 {
+				reg = <6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@7 {
+				reg = <7>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@8 {
+				reg = <8>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@9 {
+				reg = <9>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@a {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@b {
+				reg = <11>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;

-- 
2.34.1

