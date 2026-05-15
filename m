Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A43C0A13
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860904; cv=none; b=UVwX5IP2mdX8qkCLe5vMToh4+91zJtfhe2aoJy3/oT2Wnf2aQCn8b7BYUCJbuT62ayaq6Q+/DtH2i6P6PE5Y4jZQTIC//Vx8Ar7A6S+V3mBGtTQ2F8YDiM4k3ZBSAuFwxppsX9Vfv+BT8X24HG1h9KWaILcT8/NwflYuU3VaS9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860904; c=relaxed/simple;
	bh=mo50hh8ekk/GA1+rTnq+jDE0KQ5C7S41KkzmaSVIl7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQ0bG0p7xHp7wyivDspAtcZ+bxIeYgI6THZJLO3A8g4F4ZruFAqMmRv2CHIiN+LFGhl0pbv64fBi6VTLIRelTR8Vgyxv32lSJwnoDJiz6vB8Vf20VBCrj++iwg7RsN0fbAKzJtk5Wel9+wbV1saTclIqunl3kQPTv8qVQPtGNLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8IguyNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ts1sMb9y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8IguyNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ts1sMb9y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBcT5e3512994
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDM3DdEGG7gNhxF/+RbK4P3w53TaO9p1EEjbgSdQ/m8=; b=p8IguyNyCu5ryUNT
	9pOHGEChdzIFjNcsIbTR97Dfp/QOSXDV4d0RWQ8Y1pSroR+UWVj01paLTeVbK3RP
	ogS/aYl22Zw/0RbDUB1H7VAvuiQXhIIdj1P/nIAR9gjBWe5hR70ujasA4/WqRqDN
	PejcEn1qbCGg5dbRHrqAxQW0ry+I48YStP4nomVghHb2CgVcPdlcj43GIZcdk0Z9
	GPCdl0Y2LKZRu6DyRE7amjtN8cLWHFMJjWl3Zuvzzj+y4L153Pk8wd5anv8O3kz8
	8DcSM3BFOuROqftQgPZ7Hm9pqQhzaOWf0A4vYOKxp6kwPfJR1DZdJNmmaLylBSoJ
	cW9kIQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vbxkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:01:41 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43a4a04f3d7so541624fac.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778860901; x=1779465701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDM3DdEGG7gNhxF/+RbK4P3w53TaO9p1EEjbgSdQ/m8=;
        b=Ts1sMb9y9LdkzXYSrvJHTG724HpKk0TfnirQulfL7Q3XAeqqjy9U12J3H2ivbi9ACP
         0ZWConzUbPMI7O3iT9o4kdxWSDezBVFLypPdmdWSlAv09qqnR+p8Mq0yZd6fkN78zVIA
         a0yEWUUpE2AHNzWGjjCLKyQFJ3TMNIsqHKr+Aqwik/YuVLDfkjJdNzrGGJ0i+kSbs3qC
         LgbCczIKPPceMaTiFM2EzApehD4Pa+axco2QXXxXweNg93MFHMiyDMZD11sskE0mZjgm
         2Gig2t6gpzrdT/acl1I6mXGoXaw6icE8sXSv0RV0KTkhX8rBen3WlfRuT8hJET5rs4rA
         baTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860901; x=1779465701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDM3DdEGG7gNhxF/+RbK4P3w53TaO9p1EEjbgSdQ/m8=;
        b=hwQZqWyrWlWNMMOv3Xg1hn9k7kZFsLYkHS7l65CkKPF8po/7d9kGw9OeIX7rcckdwa
         teSXyAIXSBOo5N/briAWJDv9fNmhdxg7YtM3kUZQzwY0Zouef8VgDzc5W2usqQ0fI8Dd
         O6ZMehbTrDabvT/wqUK6nJDzXaAlrZizINnQFhaVp6qhWPHMda1mV1RFIPLav8az3RxQ
         Lo6uf153sun0vYWabtM0t/eBDNsMBSeZ98e5GTbR67GJQfGIzoxK8IuqogVghm+NNM4u
         iWGXpbaujSwamFaoL3jGNASqv2+6S+j2HIIK5QWUaCD+/Uz2N7y8khdLcVlz8lmO9Io2
         HJOw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZbqcRN/gDKodRdlE+9QaiDNFGOPA66klNACrFTzlm/LNCbqIbzz3e6KltcC3rtJiioPhkWGhHfMHI@vger.kernel.org
X-Gm-Message-State: AOJu0YzhkfzGhK5w95qWPTuqqOLPMOPctMw0CHG2av4EcC7wBCfRVN7I
	cMAQyzF6mbcyF5TcDRon7BBj+oerCzXkUi4Mz9Bwv/Xgj1w8zhudLLjATTwtJ3Hffn3+R3LTM/s
	0Vfnwugv2OwIWbzY1UcDsc4LK1WMi7Ih2lKp0+lK674XNU6UrDtxl0XHLEeWOzVZeHNg2Sguo
X-Gm-Gg: Acq92OG0QMsMEa/4A+LTskyMbP5heW0YscUvrwcKsBcTr1iVcBiGyDxhkf+RPG4oBxH
	9ALvcR48zWbcZUP+h5fjk34tK2CJ/SA7pL+MwhE7JAEP6MtRyroVFg6exoxMv6FxSDatwifmZcJ
	OLSTiLH8bt+/ImcBz2SlSLtbbHR2My0BJLxEFasmgScMNzJdU6xt3tQg006PFuzf5jQNp8rWnX4
	pDnocsj5BJa1T2sURoCM9KvoQrAP86W9xqKg5Vnm8tDG/nAikqsq3bYUVOUvBnqwX8RUHoEHXzJ
	W9y1N7KHZiLZBbFepfB+M1lRea9+4fQGfE2QimeeMLKdia6n3PE+bcxrygkzwqPX6WAspKpCrB2
	cWq73vtk3SqjA7t6vAwiPHLshNC0x
X-Received: by 2002:a05:6820:198f:b0:69b:d9da:697b with SMTP id 006d021491bc7-69c9bfed6f9mr2731014eaf.56.1778860899321;
        Fri, 15 May 2026 09:01:39 -0700 (PDT)
X-Received: by 2002:a05:6820:198f:b0:69b:d9da:697b with SMTP id 006d021491bc7-69c9bfed6f9mr2730863eaf.56.1778860898227;
        Fri, 15 May 2026 09:01:38 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm15135743f8f.37.2026.05.15.09.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:01:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 19:01:11 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: Add Eliza CQS SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-dts-qcs-evk-v1-1-7169d78a33e1@oss.qualcomm.com>
References: <20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=11344;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mo50hh8ekk/GA1+rTnq+jDE0KQ5C7S41KkzmaSVIl7Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqB0NcR9Fsc/y4bgWALX9VTwnXlm8s11GQ7vQLJ
 9QmrfWopGyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagdDXAAKCRAbX0TJAJUV
 Vjo+D/oDHGo/BGXK3JtzoTi8CG9Ks4k7f8VdNf0pOTlzHwSAe9H5Zj+cDPdEindn++gnKzdP9yV
 /Un8uAg5QLCO00iYcLmj96LYvTrokditLsdD3vOmFOVAuCiSEYOoXsGak0FpVx7MRstJtz+7qOD
 mUEI1wgIgwMHy/3KkW1GiN+6ahBseCkBsYm54oqjmsGvQcGlUGZUfiXtHciEdORpe7naw3W2VwA
 k+QSY65NCir7Fi5tvEshXihRlRWFcU6aiYFojwNGlcTnSK7zgmf4K1xVVZD4k/KPT6xTMOQ0zck
 UiHreZILkXhLYoYoAKrub2AkNqaO/GoZN3BH74xz4PrQAQjqCjYDNg7FoyosK+F7QxlP9Hk8se2
 jiGqyfV1Z95Pzmh0xW0tnItxvWFdF9KjOi1icolA0e7P2HjlCXx+LbClZu2NLVnZP7Rg3wiIC1g
 ecgjYyGSXtBPqF2hpXmDipqkYWCYk/wDpLkojUNc3CndAykCK/djnqiwMOPhDK3W5mNkVKsFR06
 /lFA86cBySoQ932qcn3pxwkhF7rarl4Y8U8Y4tpcLaHpEK3GCPEz4jWg5OSgX7ZUifx2c2E0ooW
 usLUfwWf7sk2lhqIh358qvm01G4W4he88CL+0BOINlXz++AUohqdLsr/ucjHnyIY7S2mmwIIZxc
 ilqfkmpQ2+LBxdg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE2NCBTYWx0ZWRfX31Ujapw2bBaM
 1W/DUAivqnZO1uYSEH95m8K9I2U7KxwqN4cdqa69/ftHsKPmvTcPJb5z5upT5AHm6VBjUa4TWJ2
 OimxSxcgIwc37a9xXHIqEZ9GU8spLLodbOtFn0U71RA25RZhybWcc42g4/dLG9VAzixKmafkx4a
 K3Nf1tPTUouFzGUQ6zwjmFMj4qsmNBm5zsgByp27FbvAERo5Z9cF9TV1SM9a2zJE+vKCW85T8h7
 F+Yem7ln+RacoOyzpK13xeAlY+4iL21F4uz3GftKEkBdnN19f4DLRhxfJYEVyCGz9ueW05n1EAF
 xmyJ4Ze+mN2rBMULkHLpcK8mfQWrZa9pAA5L2POiNMMkDSPak5yiE+T8/zuCGfQV5mf9SiieG10
 6amBBgMCqll3qRxAiqAwtw97o+mjmma5ge6onLRzBVnUmcY0NXStLUde6N8jpW9jhhupIPWEYfZ
 5O3BUtw0jMFuw9+tGkA==
X-Proofpoint-GUID: u7M8929d5zuF5sK4qqnjFxpep5Y6gKFI
X-Proofpoint-ORIG-GUID: u7M8929d5zuF5sK4qqnjFxpep5Y6gKFI
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a074365 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zEVepFEk_aNjd-2SQIwA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150164

The Eliza CQS (CQ7790S) System-on-Module is designed to be connected to
an Eliza EVK base board. The SoM provides the SoC, PMICs, LPDDR and eMMC,
while the EVK base board provides connectors for a multitude of
peripherals.

Add the Eliza CQS SoM DTSI so it can be included by the EVK board DTS.
Describe the regulators and board clocks, enable eMMC support through
SDHC1, specify the ADSP firmware and enable the ADSP remoteproc.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 388 ++++++++++++++++++++++++++++
 1 file changed, 388 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
new file mode 100644
index 000000000000..5e0f9c1698f8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "eliza.dtsi"
+#include "pm7550ba-eliza.dtsi"
+
+/ {
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3b>;
+		vdd-l2-l3-supply = <&vreg_s3b>;
+		vdd-l4-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-supply = <&vreg_s1b>;
+		vdd-l8-supply = <&vreg_s1b>;
+		vdd-l9-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s1b>;
+		vdd-l12-l14-supply = <&vreg_bob>;
+		vdd-l13-l16-supply = <&vreg_bob>;
+		vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply = <&vreg_bob>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2b: smps2 {
+			regulator-name = "vreg_s2b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3b: smps3 {
+			regulator-name = "vreg_s3b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4b: smps4 {
+			regulator-name = "vreg_s4b";
+			regulator-min-microvolt = <2156000>;
+			regulator-max-microvolt = <2400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b: ldo10 {
+			regulator-name = "vreg_l10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20b: ldo20 {
+			regulator-name = "vreg_l20b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21b: ldo21 {
+			regulator-name = "vreg_l21b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22b: ldo22 {
+			regulator-name = "vreg_l22b";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23b: ldo23 {
+			regulator-name = "vreg_l23b";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1b>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "vreg_l1d";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+		vdd-l3-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g: ldo1 {
+			regulator-name = "vreg_l1g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g: ldo3 {
+			regulator-name = "vreg_l3g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+
+		vdd-l1-l2-l5-supply = <&vreg_s3b>;
+		vdd-l3-l4-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s1b>;
+		vdd-l7-supply = <&vreg_s3b>;
+
+		qcom,pmic-id = "k";
+
+		vreg_l1k: ldo1 {
+			regulator-name = "vreg_l1k";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k: ldo2 {
+			regulator-name = "vreg_l2k";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <969000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k: ldo3 {
+			regulator-name = "vreg_l3k";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k: ldo4 {
+			regulator-name = "vreg_l4k";
+			regulator-min-microvolt = <960000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k: ldo5 {
+			regulator-name = "vreg_l5k";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <931000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k: ldo6 {
+			regulator-name = "vreg_l6k";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k: ldo7 {
+			regulator-name = "vreg_l7k";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l12b>;
+	vqmmc-supply = <&vreg_l1d>;
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};

-- 
2.54.0

