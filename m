Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651082C11CA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691396; cv=none; b=dqFw0F23JjOqN/wMBKpeP8jsuwDTb1nr3w5fcSMG7ajVxyP0QoyFYy5GwnRjIWQ+6XlKD/IfbZtg9Or55hkl/2mK1ZFE7hujOsAyM229NDV8YryJIVG8afUcM25CwIXKgr+HVQKY9Yh5cLwj4tdPrDv/Kul0YJzBcWM5iCFIOKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691396; c=relaxed/simple;
	bh=+NBAVrPIo7sHJ7MgnZXaHhnNEpFD2cpSnzyBi8ZsiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaVW9UeZBv4KNaBcEC+Rw2BpSDBExgU5YmHaScvizGBOoLVsEu4IEfn9PMAHJoDCVJiJpTjRfnf0IXBBFGivfkXUeF+0q/PPSN1EUyZOjnjGdNSrAdyWMaoHNchCj8iB/Mgw6k3/imd2QDB3T4Y8q19Zm8divqr+rjOtgZYoU6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBYrZ9Do; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwbmvNyc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBYrZ9Do";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwbmvNyc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6M29871506
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=; b=kBYrZ9Do3IDDr6Pl
	+j/6KaqbqWIUgiE4L77bTqgfe4l6rd0JHfP8vpKJj2rfSZ8dV2tDVKXJzm5EsLu8
	BZolFgLCBomZtvUZaysvd7mgBFWmZoMeAz31yzVX5M4Y2HcFP4/d6e3NHrz2vw/I
	B5s6TAEwKOhpFQtPGnTVnss48B2xgSQXEbQxMIn20iqha8+TBW3WF4Q4f1EQ/NTR
	fiN+WVBy+HYY02ZK+rCOKQtRzbISnDdt2MNxFQ5T6zYa32nZSs9iQnTonCIPRTAR
	QMcrYsUNVfxd1uMKZS+TMQvfluaE+VuqQx6YHg7YLInwP9nhy8CCeOairQJYJbGr
	C0w0Rw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8pm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0ab07320so9618771cf.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691393; x=1784296193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=HwbmvNycnBRMywAqUv9rwQCGHO1FrK/WImR2rhl4Ad1MgiBmneBqYZofq03gbZtb6r
         tuoY0vKQRSGAmGMfad7DmtwvqjvT7zU7xRFEKUu5aEIg7HwWub2CqWjQmEpx+2CI8yJj
         YbqixFQgWJ3Y4AkOXPIlYnsIPhXASfc5S3NEZERRsa3/KT8szW2wA8zvPWuwf/0KQLzt
         7Ca9LZdaIJabLR9hE58csT9VwPy7ldPrqpwKr5QRydyiNLTy2KUviY4EbfLcZP5Onw1M
         8Vn3KQQ1z4zOTFjlggFZ5fzL2WUlVhx+2vUXCg1JrG/tSKsvmnT9MXJGjrh+qv1fyAdV
         WS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691393; x=1784296193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=AWgLcF/ghSHFjXynzNO0DnsbyGR/NoxpQVfCNGCc9e+kKw3PM+1NjqjNV0nJYItc66
         dLH5w5ObludQvGyV7d3MuqRCvtI88/UeRHzBmoh3vErVOYOt1D7+D24rg0p0r68i2+A4
         Ekp74y/a43Awir8PGKJY9lGwGnTaV+yIqMWIt4QfcNkcqIEvvJ8nsBrslKJsBSYj81wn
         w2/CBLkJxoDi+D9OctrmSlQ2IsDxcGxQ/4gJ3KEAKh0yeq9bUHqM6s6PJMHHmGPoc4Xv
         tBs4gID4wkYv3Hh+lzPWfJqrVb0winPOXpcmLy0JT1aPWIkhyg966YIJ00rOhCZyu1+0
         EXkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRTt+Qz65FwZ3M3IzSLJKTs4u9+ohJ26JTuK/9m0opuha5/tvU5+ykdx+UcQzqFkle6FPGpGUxvigu@vger.kernel.org
X-Gm-Message-State: AOJu0YxejK82kX0nzZg9G+So8eCLNy9efrb2OVj0SflYXRm4p1c7P6cg
	pER1fPRQfdTsPPJwQYCAJ1Bh/knznQxrCiJrOgkFWGNUCvoaFRacmY/CMcb4DuG6PqSDIJ5L+zd
	Lm+1EdYyO12AHNwP2BGMhk/0zjSwgLal9ZuJIdXQTFteyYV1zj0hMOXBXuLsqLbTH
X-Gm-Gg: AfdE7clrH480Gpe5grJ6+Hky4UqR4Qe+xALMijPUQA88Q5USpXEoO67Gv5IsSh0F6SJ
	ZpBTEDkedUiMm0BepGXCBlXBqUFC2XjGkUT7Cu/HwCtpr7yjmFMm9EyrcUQDLTEdvz+hzR6z9Jz
	yCzMT4VIwX6Zj2rlZox6Vp+tBaxmDphRp58rGAXoTsCYUUDJVa4i0QKZ93anplNUFNhBvr59HUY
	oH7HFLyxQvlJRHfd6Ia9yfa/lcaNJS0PTuVQxwamdzOQlX8z+rUCOh0WbNRyvLZVrTi71UwWhn4
	sM4VobYQQSkPk3pgtkuZROG+JCiP2UQ6SZ1WG4iQBg66/28t9ovCq1wEJ3B7Gaotaq6ywCYwule
	hEfjTlHM08YyOdvoFscWbhDtq27Qi97fe2tSETDGdvTSLgEYDMH0h7JhZAdCeAd655QFTfV02Ui
	ZXX7ApU3bzKLtLj+ltRs6I0y6gtrjIU+A8xigtpWwuvTcM1XnAjx1Io/fNTaoJSWz4GHjEl49Wu
	5xWfswjf8w3YCNBBuRT
X-Received: by 2002:ac8:5d05:0:b0:51a:8c9b:64a2 with SMTP id d75a77b69052e-51c8b40e741mr120111181cf.70.1783691392583;
        Fri, 10 Jul 2026 06:49:52 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:51a:8c9b:64a2 with SMTP id d75a77b69052e-51c8b40e741mr120110541cf.70.1783691391753;
        Fri, 10 Jul 2026 06:49:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:44 +0200
Subject: [PATCH v5 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-4-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
In-Reply-To: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: c-kQP1-6wToeD210cLy1yLF2o_oxMTpx
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50f881 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfXwIji3+120dLm
 FpuSzRlXPeKydGCXUSI/bCPluThiIrZmHvNJXGRWJaGZxySnZiaOUVxy5fIT072fTbwJn6mvGix
 1LGerIbK9UaShSMkXH7/kNZPQMRRdq0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX/M6gvjYult/s
 UqlvoDFWjz06cOfNYsYJRBM8v7c/6cqZosOkLgQoMAikdFbap/A6BL1MGIknpzhOUqhyiul/NIQ
 ug+Ub6Sno+cDQBOpCngUCqGRyHbDM+uo2ZAvLFieOSTRvCugc7yWUdco7hqzju7LlZmkKNDOIRS
 EgeKNoT4B89LUor6pzIN4CI3BgdP+zhhp/vMVC1m2vEyolsXlHqYXCg/0vEha5JFKIZ7V3c8beu
 xcNtL9PEaenSL6QDPn8JWy+DlSUT5oRJuD4qa88LsbQqhAKdK8YJhzCvClGLY61B0oBqXOXl9cz
 40O3Rx2KO22UQ7dv2SKyZ30gA2MnMsHV9GfREyvOar5oZqaShh8tXqPgKMSC//UCTFYxcsWFqWE
 dW4gaEXVG+4fpuRaLY84cb7cdB8unIIkCCEhWS+xtdRxjJpgydIc/MyuTuL5AdPtOk0nm3ruycQ
 gkVmSpPDEV8y0AdQJjg==
X-Proofpoint-GUID: c-kQP1-6wToeD210cLy1yLF2o_oxMTpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100137

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..83ccc4eec342328c78be37d4642b772d74a8ed37 100644
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
+			label = "stm-led-1";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
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
+			label = "stm-led-2";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
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
+			label = "stm-led-3";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
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
+			label = "stm-led-4";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
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

