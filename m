Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA86D378814
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781913; cv=none; b=SO93uST8Seib1iPNt0HIagTez7gRd7zieiQ0zdKtSPJyrOvOSVdaMUgahzCFbg+4VMd/wACPW1VA9cwtKVaSxnWIBWWlJ/NI6U5MBo9p4b9/wnSTP0yNx7e5i0rJbl5Od9cIwojSgMl53WBtlv9aSdydO7OBApp7HGtGzUza4ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781913; c=relaxed/simple;
	bh=XGRj83YxrNm4RwCD2q5W+GyFydoPwPwU9M4GUQfaQfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pPEWoFG+GoHQLFtpe02Mpr8wvzV8Zf1Md9LZS0D4mWtQOY9mjTcto1Uju6uwODI8WYhEhCED0LEPdHXgkNW6/lyffTmey7nC4rq+SdpqWhvZ5J4+aIpNZe/fU4dv7qnY6FoW0tR7v24+KIaFvaTqu1Vb9GbJOR3cEXuQKJA/YRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oij7wTDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eruyQk4V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oij7wTDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eruyQk4V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0XIQC2399010
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fz+QR0/sOdWcbZ+WS9ggauDKFCQ9imB4dhuVqgzis54=; b=oij7wTDXUUhaYHfb
	H15IJq/tYsAsbavn0di6KckzpFR7V0Yoj5n2cpLnSK+z0HiVvGyeaPaszTh1NpKr
	S4fgg3E4wJWXIYmKc6B/mfKxgf7UIB8oHokcAV3MM+c6NL+dsaQ4/bvbaBbg8tdq
	OyehpYawNr6TTLSNoLudExEp+0/xWh1EoeWfm5tc6gRZwbfGI3pexh75mi8GYbpu
	5VrlUv23RVbJma1eIACrdQFalqW9Q8OZV0FY4nJcrh+nike27mN+yd3Gi72Mo4kW
	iNGHrzdhZTBFpJ2JZMYt1W/PvMIuhdEeI2uSDpL8aRVFc2x7vmdAvbIwBVwMJe0S
	hCiryw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm13c5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84240683a82so66401b3a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781894; x=1785386694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz+QR0/sOdWcbZ+WS9ggauDKFCQ9imB4dhuVqgzis54=;
        b=eruyQk4VCJ7ZlxF9x3A7vjKYFWp9WasHEES/np5JRU7QatTocjkez8kJag5HBBngVD
         x/fIc0GfkWIWLgZfh6hKrKCBBPb9AHnLld9BLj3nQbnLn6H06LMFQ4mD7mM1AHDvsmnm
         LU/znNpl9bQBWxRe+//KK0iZvAP/POiwXi5eIrscPjW1ry0Qd6xsWSJJOQSZ9rZGhzeR
         N+G3OuUCGVGnvEXPpTMqnu5rHUNHtuKQ9erNoyJ+WdTZosOq8IrRG7y2Ivo16+Eo2j3S
         UI1OtPyv16ITAw/YvZKcv3UJxI6GgHqCStKOyjs4jEBLnooWKHDz6RE/uVkL6NpTNz7P
         NCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781894; x=1785386694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fz+QR0/sOdWcbZ+WS9ggauDKFCQ9imB4dhuVqgzis54=;
        b=NHVt6ccNcHI7JeonIQIj1xXv85jtzxNi/GInnAJcrC5HusggKS7za4WecU6kYx3AsA
         dfereGeDa6xihiSqHFCiUbLusznuUYPPdaVaqdc2aEvwMkQvbeTzeTzXKDbEMrNBldhH
         pl5uMMmmwprpLVURbcjt6kVqDysF1Xhe8YC5A1pM3uuMXm4XYGfF09BfaAVorSVGgxEj
         QdBAKY4CMN02FVAZZbJWWobjM9WrtgQLrWC7s0NeU23gxsRuw2lFP/Si92aKROJzCN8Y
         FUkMjn5ub/4A1IPY0osKBlkIrGyll9waW66p5xMs/wd6BEagI3QpFSgaIkdd5fIiES2D
         fd8w==
X-Forwarded-Encrypted: i=1; AHgh+RrXjerrRl88Bl/xk213/b5wi+hlxxTaY3GBT6bYI69G3434Rb7mepKmP6IYkLS8+aCFkuyZwztVOWEB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7oyJ9ncbXmlW1EXSYBh+jWR8neZqqg0BpLNnZHIYDi3K+zpOE
	ixWom9J1Vbhww5HJtk8Y7hD/iycWNIspFPcs0z8KsaN8T5tffR8kYyw4GNMt7ICSDMNs1did9Fg
	qZlXtJze6zwJGwoyg4V90O5RZ0jZlkEBweL8Og0/1BV7M9LLypmG0omGYt6cUNyzY
X-Gm-Gg: AR+sD1022F3OM9FxNp3JfQwHkU8VYTOEX7c7wd0d9o5ZnQmilEN5nbfxscWOOjs3rgi
	+v+Sbu5mKci25BoeEcdwXwxWNWvNbFg4zh1TZpyVuN7IkonMX/gKBbiYQ1u9QURhQq6fw0C2blx
	irIRM1xfVASiofuHFkV4FNET9gAfOoQoWwcQXyWIpRoC4fPqLhdKAlAxsW7CWpgtf7r+bGFZ9/E
	mwXRG9lflGvWWbNgk6eun4WqURWC5C9KmNCEvt7UeoLnCjluuj762SnhE30mLnNnGy3AAUtrlgA
	+3GHoikMFt2KMm7RCzHk4wHCplgeZMVfLxDOkwTYz9PlPJD23QYUZSRzZoMH9FBfxCu7sbqgRZR
	tMdxucGTPXlFnegNVuHMR5fBTfFwMXBY=
X-Received: by 2002:a05:6a00:368b:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84e2e83fac3mr1234970b3a.9.1784781893778;
        Wed, 22 Jul 2026 21:44:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:368b:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84e2e83fac3mr1234932b3a.9.1784781893301;
        Wed, 22 Jul 2026 21:44:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:14:00 +0530
Subject: [PATCH v6 6/6] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-6-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=XGRj83YxrNm4RwCD2q5W+GyFydoPwPwU9M4GUQfaQfM=;
 b=fMswVXZVWu+X8e0RzElVI1YmxLwGjzwPScT/+lzI1TWUHkZ7tABYZXBOnMt6rQDFkHJ7vO6is
 xp/6UUy0PpECajuY3mU/y8NQikKVnk+UPp9yz4uy6SA3htMpZXRkFAa
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXzEPBAixmv0bS
 3kL8okf9it4PwVVo4LqhLTnHTEh7l6HSmd4crH/AaaWZLirjBrEQeYXgGHaGA868kf6ef9x3odT
 kOTFR6VkVd3NUrTdAqAJ13friMUv1WM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXy29/tMfKV5b9
 B0HaHeaLX57Me8PQDzZx7708WBVyFh4nZejcHeT1zSSF3gB4R/Vy4n6OZFGCc2ffPf7SwZiuCvU
 f3QATJMTIn/a0HmlFPUCJq6hkKCduu9DqRe1p1a/B/1Tito4703RePt0siR3Yf63lx1eR3A0dyV
 vFWpgTuwywyYZY9UB+upalhUFS8B2zaKR5xRfbDOarlMGww/c8i/7CiPslIowHEDrbyH2GqiFKb
 rLP72tYrAG5/k/CuRwpq9cP6Fo4qudGv99pzDnK6AOPp9zYvk+R554+8aXrYkhSEIqYq1F6DbEm
 PDbcRLVHdzACtAomKBEruaNPsqVwCSFZszNCNys/3fZuQAr85zewkTiS8HR2JgcL+CkJo4a2sH+
 a/vrfsg18hpnBv50R1om/DfaYzXpbi0DdVycGT17Shm5Xp10559Z4g+/dalJ5dzc72SyvvveV9m
 O7eZzk3qJhHeofqHo9w==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a619c46 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 781ItUYi6w_i52r3kvjPcePxf5nCWOVX
X-Proofpoint-ORIG-GUID: 781ItUYi6w_i52r3kvjPcePxf5nCWOVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index c75e0ae736a96b047c04305bb109cacf06d06f07..a1e1daee6a84471f2e793618afe21528576a8cea 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -341,9 +341,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

