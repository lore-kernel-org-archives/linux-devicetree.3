Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F60C30D3F6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321430; cv=none; b=fgnu8YREe9RvuENGSaETbcRc0H3YG+BhRWU8ZRItvTAPXw1Mji2SRfp+EFQH/pTrVgf+qsK0+nw/XJAfxLNdU2Pj5HEaFp12qTgLq8WniHkxMXAA25dH9a+hHe38dq14pVEl01mqa6vHKOgQCC5QxxUr7JZzSy6kjsTp8C9fPDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321430; c=relaxed/simple;
	bh=F6eglyNuwi6Em9lroj9ZIakLYJ37cORrqMFHW96g/e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brHbI8+hawxQsvYdIiGlhdewxO9qX/GLrwNMAP2qHlvj+KbRbC9GGrJX6tfwRiLA25Y1ngJ4gBrq+13+uSTlf2abcPkJuryYvg3GvM0f71htA5rDmXm8RIB1xt1ClQxaG2in/4n03IH00TjB701Is933MDq5GFczVMp8e3VBkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXySjDGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZ8TCyUW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXySjDGa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZ8TCyUW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666420KR3595055
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4h9cznq9VFPrX/DbkSwD0kOjoHyPxTCKUx/cPPfItso=; b=DXySjDGaUcpmgSmh
	7dJCoZ1LBtZi8qYqEKY2/flStTwRfFBJ3+9EbkJwGiiVnQ5Qx+VWm3jquJN+77+i
	AB+hE+IJQdaqN9VUT9bEoKMJ9/Wt7R35f0c3T8Hj1NgzIf5AiJhHWOavsT7exvEk
	1Uf9eRmaKPt6o50t5FCJpflfp5ewiTvmUjzbSS7Rp6HXg1J7R0p1V/2fhA5ZytwS
	TLdTVRn5oGQJDm8R+JLU0LUbvahVoIm40ydW43WTFPbkacyBAASqFpTMhmnaF7UL
	Qf+fgsorkzVoYJazAm/hekppD5ZmE2Qm/3sRBwkkbH7MhxhTrEBFfXYLYMPXgJ4/
	VTJ48w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgw8yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:03:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5740so293421285a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321421; x=1783926221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4h9cznq9VFPrX/DbkSwD0kOjoHyPxTCKUx/cPPfItso=;
        b=NZ8TCyUWUkDBzzqxr6zsMgyioK4qEgyg4JsE3NZt1dTRuJZnEhiDkhlnJkW1ZRjE2v
         uAfNf7InEnPJ5UxstWcyIf1/Lfn5eyUk2JGX//jiCuw93uDSgytWBlgTUQ4W8GMkVJjm
         B01ieACD1pr4ChtLp7NtkK2GkfksG3RCThlGAi9Z0IDc4fRT9ew0hlxITT572/petcn0
         lSKvFHcz25niZ7/vu7xw8vpiqIJUuHdxMo+Z5fuvtaupm9/cNfT1YpcDQi6bvyGSd1Lo
         iYyYdEEsSGFDXgHm7iiwIRQXX5yh/k0967bO39U2VZyatBhngdimYBgWCbRVk0ayKkIS
         Q6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321421; x=1783926221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4h9cznq9VFPrX/DbkSwD0kOjoHyPxTCKUx/cPPfItso=;
        b=pYhSX64hAebmlQtjL/+4LdO5qbiQFQ9z3l7+wQRToZA2CdmllesWRpj0bn+chywTRU
         nTh9T+9vcHGS8DRAPaFnEspsnBMW4OCaH6vTG+yC+Lfu02598UWbBhWU6ry0Y+Rwit/Y
         EM9tcyAe07nN5u3JPVUzX+Le8FxvsyKs9GzuWP4KgI0U+UfQ2qBSoUA+f2wbSNX0VJtD
         jJ+isrVrT6JZ0EcMRbiey+icenbc3kcqaWTh5n4f1Fb97MuafN4K45ypqiFSjzNdLHBy
         fnCyh1gd1XJTTQd40JmOn+A8fiC/f9fsORwinj/DSEKQ5in0mWvBfDJgQpUoMUJZHmm/
         tRDA==
X-Forwarded-Encrypted: i=1; AHgh+RpNIstrF8OVT2+ldPcmA8hy9BONrzFmSlUVKPSDrY73/0lHMLWAD0UROytnAbpkshrIwf9m5IkHYrCH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2DWc8Ozb/or2tVzZbufnXOCqMh7s1s//dh4Q7aDdOtPkrMJ6d
	G+C9xl9H09ctafigzOCO1PCzF1wkRlXqmMtAl0DphglrhkyKUKlcgCMuNSaJRpeTgV5zHmeEd0R
	M56Gjlfg7ivOwvBzFyNdG+egTgjYk8H5QSgV1MNrLkxHzmxbROfzlnAgKYVhk7tcT
X-Gm-Gg: AfdE7ckaizd72N0E5UAwaXGm3J2/n4Sb84p6hKjerW/jFpZVRhsIehhTfgeDnWc1PDD
	+dRkcMwuSzY0+HA7nR48YfUJC+vPWzbezGKixR7253DNOimYRRhQzgoPG3b1TIaUNT7RE6JjEaJ
	FxyTsUT9+/wOj0JJATzQnPwugQgGe731PiaF1Ez2s9FLgRlyPfJzUk/iGUAUci7lxkEf6NSA1DR
	TFpz8DJfN/dZsHjLe3IIaEnlW0Llt2i70fvmd7DEyVxN7CHWAJByZwRCNM6ahygycHzYfdq1Y46
	GVPDNUrEa4JtpGb0463jVBvP2G0BMEQusQNXMY4WZ2RpvhLb8naqBwBetJ+J1hrV6GrzJKB4MWP
	SHKvdbnZr1lfjxnrjUX7WbHjJSznkBmD7jGc=
X-Received: by 2002:a05:620a:2915:b0:92e:6a8d:38aa with SMTP id af79cd13be357-92e9a51a68fmr1291562385a.63.1783321421022;
        Mon, 06 Jul 2026 00:03:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:92e:6a8d:38aa with SMTP id af79cd13be357-92e9a51a68fmr1291558785a.63.1783321420382;
        Mon, 06 Jul 2026 00:03:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 09:03:26 +0200
Subject: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6143;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F6eglyNuwi6Em9lroj9ZIakLYJ37cORrqMFHW96g/e8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NEiRpgCcz9sD8jpITxKGCulSMB+7+hC0PHr
 wVNj4Luv1uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTRAAKCRDBN2bmhouD
 1/Z0EACFZbOJkSOhRxw5aGYcUEdZZFib1gLF3igI7muuNygrWppZp0yWCtx36hXP6ZiWwrCu/e5
 EYjMyshWCLOG0rRkzQqF9EWmQqQKM2u0RgLrazqgLbmDerFqdECRHd40R4azaZxVt9wxIsWY7Yk
 ikmvK/iHZtTGEbIP/TiIOlqVzA3uGTBr9IXah7daPPdv71BWhSxiKZcA3oqz1/mHVFYhehe8xrl
 IwWAX+sWUOa1FV7QKjbcke0wGn8I0D/uGVIvyU19Ev8ZljhBtWh5EQMqlCF0KP3XcVXXVTMMYD9
 ZdyQmnfn0I19XctcvLEM5BQ0odZr9FyV9Kg20hZKPhoe915lJpty+MNQ1zGe0JPQT/hsEhlcdbS
 LjSzS3fVBShvN3RKN+NQsjxslZoYPo/5ebB1BkKue43PFSIQgv8jh0TMjb8xOVFdtlhMA+8mIws
 SgZeBwF/F8AQym+rGLXGBcXiPhMZKjqwSplRMicDl/4UaJ4mqz/IhBGjZS+YOGjY6lGUWj2C7dY
 NVUdppggIdGzXXgo50eblJ/FUX7jkSgHqcPyoqaeoTjIwPk63cvHXJZ/xPBo/8U5Yc27Jxp8oRE
 8iQiWQspwGJm04V1nlhLPALW9iYlhSVSM44wtmuWA2OczGVAJZOboP1G4NVZI1JcfUeyympIAoQ
 mta97eBC80Hc/OA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b534e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PFZe3mRHLNvTyYGQIl0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IXbJiPkiAqks-ucoYK07MFAoQWS2yjK6
X-Proofpoint-GUID: IXbJiPkiAqks-ucoYK07MFAoQWS2yjK6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX2UHLGDKZnC/7
 DnHL9RMJZ/YqcUl6cWTSJa9Isrow/2U+zGJvNN8gLRXf92F4MdwRRNijyoEVMB2rS3NiPF4ukcE
 hTI3mM1CVFqvj96jltPuoxjrLSCMFUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX+ta+ltELDXWr
 4RDTlwuqF3pSa5de/LRRDWuLwMlfrP0eKkS/o1MM96cxdZXQiL5QWRV0SoQanfTkFJ2c3EqNaKb
 +O6HQTXCWFZQ2joorGBcpT8U3ODkCPTOTVpkB4DOqH/T0hP8i/4yaCU2fSbtJqxtqp2ZUko+QI7
 WP42dPZ7UNQlOk+RNtKeHHp/qR6V2UbHmHWgF0fTyjNMbZ92eQl/JxcsO+x/6EIkG7HMemLUR/P
 ar34l5MdhZQ9PY4q7EOprRZxIQrKMWaOmYSRH0DR8gO9xUhx/T4+Vu+FKzCkzN+ednR2olmAr1U
 451qARj6btjRJzPIcxi/ZHDI2Cuua6JMrG/jlikI5hJDFupXObNcvIO2xJDdfFePrEZVPZ/GfNQ
 NSKX9QIBl9M4bquvIAzMItVwKjuEXAxjPlVVF4ejOy3OQCNYQdT7/YRWk6SiY3w9Mku8i76SlZ/
 0jdWAsjEp4Q3jnh7+AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi             | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi                  | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso           | 2 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans.dtsi                      | 2 +-
 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts      | 2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi                      | 2 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 8 ++++----
 9 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
index e53de709e9d1..e95da761234b 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
@@ -87,7 +87,7 @@ gsbi7_uart_2pins: gsbi7-uart-2pins-state {
 		function = "gsbi7";
 	};
 
-	gsbi7_uart_4pins: gsbi7_uart_4pins-state {
+	gsbi7_uart_4pins: gsbi7-uart-4pins-state {
 		pins = "gpio82", "gpio83", "gpio84", "gpio85";
 		function = "gsbi7";
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 95be1d2e214f..06c0af0aa317 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -1866,7 +1866,7 @@ cci_i2c1_sleep: cci-i2c1-sleep-pins {
 				};
 			};
 
-			spi8_default: spi8_default-state {
+			spi8_default: spi8-default-state {
 				mosi-pins {
 					pins = "gpio45";
 					function = "blsp_spi8";
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
index 07c10c84eefa..2c0590617ac4 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
@@ -55,7 +55,7 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
-	vreg_bob_3p3: pmx65_bob {
+	vreg_bob_3p3: pmx65-bob-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_bob_3p3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
index 4600d5441cce..a4c6d39cf777 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
@@ -14,7 +14,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 &{/} {
-	vreg_cam1_1p8: vreg_cam1_1p8 {
+	vreg_cam1_1p8: cam1-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_cam1_1p8";
 		startup-delay-us = <10000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 40f88498999b..cefb8ff00806 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -63,7 +63,7 @@ vreg_3p3: vreg-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vreg_conn_1p8: vreg_conn_1p8 {
+	vreg_conn_1p8: vreg-conn-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
 		startup-delay-us = <4000>;
@@ -71,7 +71,7 @@ vreg_conn_1p8: vreg_conn_1p8 {
 		gpio = <&pmm8654au_1_gpios 4 GPIO_ACTIVE_HIGH>;
 	};
 
-	vreg_conn_pa: vreg_conn_pa {
+	vreg_conn_pa: vreg-conn-pa-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_pa";
 		startup-delay-us = <4000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..e5a57a340cd8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1041,7 +1041,7 @@ qfprom: efuse@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speed_bin: gpu_speed_bin@240c {
+			gpu_speed_bin: gpu-speed-bin@240c {
 				reg = <0x240c 0x1>;
 				bits = <0 8>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
index 7393978926e4..0796d9dbe158 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -136,7 +136,7 @@ ramoops@81f20000 {
 		 * ABL is powering down display and controller if this node is
 		 * not named exactly "splash_region".
 		 */
-		splash_region@e3940000 {
+		splash@e3940000 {
 			reg = <0x0 0xe3940000 0x0 0x2b00000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index a350a8ba48fa..c50ce1843703 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2927,7 +2927,7 @@ ws-pins {
 				};
 			};
 
-			lpi_i2s4_active: lpi_i2s4-active-state {
+			lpi_i2s4_active: lpi-i2s4-active-state {
 				data0-pins {
 					pins = "gpio17";
 					function = "i2s4_data";
diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc3028..70c130c5426c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -46,22 +46,22 @@ framebuffer {
 	};
 
 	reserved-memory {
-		adsp_pil_mem: adsp_pil_mem@55300000 {
+		adsp_pil_mem: adsp-pil-mem@55300000 {
 			reg = <0x0 0x55300000 0x0 0x2200000>;
 			no-map;
 		};
 
-		ipa_fw_mem: ipa_fw_mem@57500000 {
+		ipa_fw_mem: ipa-fw-mem@57500000 {
 			reg = <0x0 0x57500000 0x0 0x10000>;
 			no-map;
 		};
 
-		ipa_gsi_mem: ipa_gsi_mem@57510000 {
+		ipa_gsi_mem: ipa-gsi-mem@57510000 {
 			reg = <0x0 0x57510000 0x0 0x5000>;
 			no-map;
 		};
 
-		gpu_mem: gpu_mem@57515000 {
+		gpu_mem: gpu-mem@57515000 {
 			reg = <0x0 0x57515000 0x0 0x2000>;
 			no-map;
 		};

-- 
2.53.0

