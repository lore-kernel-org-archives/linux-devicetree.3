Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FA04B8DCC
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024659; cv=none; b=CzaoDBbZbj0XEBQ9OiB5gEAf81hGvfsfYtVeCTkwK2FOhKML8t/KnKIZ8rJVlm99x8ZL6hQwwlppAVkVRzLPsZsf43bC15wx+zdeUhODLJ35ZM++fvpDZAGuTvUqvcf1/3ZePuuosk+rOx3PfIaES5AOG/aqQLDdWI2uulTyFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024659; c=relaxed/simple;
	bh=5WN8vDInI2jxayVDJlE0sfrxkWEiZBomtOxJjKfy15U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fm8bkuNitPSvJPjib5aF84j9N++wizaAx6UVun/rtR4F3iGnYPJK3Qq3M6EoE6NFdEUuZZxwKMMKwVXCoOlAL3hw5ee8sPFhoMZxu+8fJY/YwLuGlS1cNLUkcZRvkA4BaSPThy7dpaehtSX2WA+TfYfwkglu30JzWCJSAI5AnCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krN5jlEc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgnCVaWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="krN5jlEc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgnCVaWy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GP3aU2685015
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 17:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhnLAmgftv/wvLr3oQmapdaqFa/zahMFPYVgDBVBjDc=; b=krN5jlEcK7pnsq3p
	Vxs6vMu+ov4d0mSmAjU4ufDCzdzXivOyXfMHZcFpmdQ9UeODkSWysRRoDRHHzpEo
	7m3UgRFGc7asxYLza7YSKhClZq3ewOTcJW7RQj/NLXmvKwpyqQq48pM31TgV1OWl
	oZNBISUWTJtxjYS0hz/ZkOLLz4FN1igAK8Ut4uy2wmr4e73YWmW9bivdhg9hvhr/
	eGL+Jw+ufgWQz75D0s8Er8QPLto4s0MkvXzNlip82fGk7sQNqEKGRweb35Xy2+zg
	oA7MLiu37kAHrUw1SNwpeLNUfRdn/ggYni6yrUbv4n19nmGZoKU/khUo+c0ZqCRh
	NNLhdA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenraqmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 17:04:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2c305d0so3370590a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781024656; x=1781629456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhnLAmgftv/wvLr3oQmapdaqFa/zahMFPYVgDBVBjDc=;
        b=ZgnCVaWyyywS/6L6Gk1hH6ZDs4a3mi2Z94vxkHRtLrsJkjnN61GDsmOMq6R/zRFOGM
         DZmKo53J+bDRzVsGcUGiY7GKkNjScXJhi+CmtZfCkPmV2wjqRuTjs4jzb4GRP2RwT3/K
         bpxFs7r5METXmMziwFHAxjLabPNgxTV9iedII4u2KiJpJ6L0GWzebKHtQiuqsoMoe92u
         P4kT5AnYWIEDDRKI8oesuZsBbT8cSJc1g58ivDdMSsPAf8qsDZHRN7d5/kdZk6hn5GYV
         9ilKZjtuCI0oscn4qWcJQhwNrU5BVJnawJMIb1iCA5W+j/l7/HU6n6Rr+QyCmTF5wRL1
         7vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024656; x=1781629456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uhnLAmgftv/wvLr3oQmapdaqFa/zahMFPYVgDBVBjDc=;
        b=L8rGHOojw32hTRpsGrN+LZSgslVhHKGNHnvIEJPR2ha7QsZXl0El3ZSDeebk+EtTjE
         y4o+CgdcJjdHWKbDNwpLciIdQurgn1mTJdC3nG64r1kc3XArQYNfeenxoJGSz0f6b40t
         7tZO8rOBIBq6vwlZqcG4ivXPBj9c+lujf6VxtalziAZ2MoW84wZOTqKIR49U0u9ElE33
         A4JUXXz5u2MGtUfiml3NWt49A4ZqZk7Yft3COKGrUp/Q5s+Y+t93/KRgmjx9YVbrEAP2
         R8pqXUGD/r/JsxW4btfaHTY2S6U/H8OKiVJHhi4y4ygcyhJ+Ni6E7bIx48jyRtD8kkrU
         hj0g==
X-Forwarded-Encrypted: i=1; AFNElJ8Gv/5rlHGrQuitKZU/YjvkoatZk+af6AB/A0S6vcG513G8n5GL9hXehLnW9HOLRGgjBWF4dMciGXr8@vger.kernel.org
X-Gm-Message-State: AOJu0YzNnL53H1k7aZQMAz2rpZDgqqZ1NYCHSWzQNKZR4prHKPMjpQ8A
	xsmQIFyHnRR9fr7yrHq7xaVai5usziOWhSf+CUGxPziJfVwNuNO7Z2JAWYCwogFKli2+SK/y1o9
	jpRtvT3tahztMknZ9LrzHK2JrdY0zokKpTs9oAlCBbXxLE9XJvZ/0xhFoHTIRbgGf
X-Gm-Gg: Acq92OEMZg8Kk1BKw+SeXWopYsv8YOEU/0r37SEgRoCcd1FyeouCm6DMMJiE50/rBX1
	asjn/DqslDogsvZjn0QoKY3KLNYrn4eT92B4ry5AZlazj0jT3a0fDf0/YmLb4LqjqsyaAF/a5py
	VKBjQGXIBmmLDnWCXlqroxv3O3DU+sKgjqRPOrKoBW86UN5bw6YIFDU6KiVOlt5bJFUz0JtFHyx
	V2NDvz6QtvxARdqfN7M3wHglqDfNuPBpKKw6qHk4tJrSble0fVUFjK99gKAYrOD6WrvIn7sCpYs
	T1IbFDG4ZxoTDrdckBT506nkkSxV2ZN6qY/RGvauIL6vL9X8q91P00Lhy/Lf/oI5Lc+qI7kf6Ei
	Cd9qgOeehsVGrcO8i4DpNLxrZw2FMbyOfpktnOy5dqESMhb4YWbMciQMzUhWRZC7qixV4JWkqMD
	dsUg7rX2V5ScAhpqCKXLCinO+k0DHrdJw139OCvwUNJoSt5zfLCspljJdH9fLtB17g1pE=
X-Received: by 2002:a05:6a21:a38b:b0:3a2:c683:fa84 with SMTP id adf61e73a8af0-3b4ccf4a503mr26047900637.27.1781024655984;
        Tue, 09 Jun 2026 10:04:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:a38b:b0:3a2:c683:fa84 with SMTP id adf61e73a8af0-3b4ccf4a503mr26047805637.27.1781024655245;
        Tue, 09 Jun 2026 10:04:15 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b9b3fsm17739119a12.28.2026.06.09.10.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:04:14 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 22:34:05 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-move_perst_to_rp-v2-1-6c731523d08c@oss.qualcomm.com>
References: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
In-Reply-To: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: F2N1AjkL3Z75fQ3GR59ePuTRDlw08f95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE2MCBTYWx0ZWRfXzfyqHKOyBqgG
 Cf3mddNLMSCH3wnMc0XUgYiMok+t6AhUn7QqMvXYWQ4yY6rqqSgaKG9VVirwIRtef+Rzoi8yTV7
 JiWJBlpdUwgSYtzhD1dZCau+uvfhmk+d0WE002dEmoJbFf7VVjec5XCB/d84TEtqK0cx8Zj6UFi
 HpCqihzJwssx2dkOh+BmIE5wKk3rJNXgZTTKOEbJiU/va057AJQDt2dAj+hyYanadYZ/jplS5Nm
 Xyz1OBzzMMdgDBQetTqL4vm8+Cg5dtWpIiUvi1VVNQZplI9mpDuG0geoZ8J0zmJ2Xg7sHZE5Ze+
 GE/YYHk+MTqfgVN0DvY19JxTxsECxExcCkzEHR0Qa2WlEcVn7Ga43Am6U0HT8r5HRE6Q0oh4Txk
 qOHlv9gYS+BCimb4cL0h1a7o/M02154Fi8kelS7nk85RK18USDZ34HZlk1UZCJ05WCpAemnZkMt
 ghdL+GV39EVgLusp5aA==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a284790 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=85xu7NCFztRxkIpi9pUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: F2N1AjkL3Z75fQ3GR59ePuTRDlw08f95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090160

Follow the new binding style by defining PHYs and PERST# (now RESET#)
under the Root Port node. Avoid mixing styles and move these properties
to the RP node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 14 ++++++--------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
index 79ec77cfe552..7fcf632e289f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
@@ -36,9 +36,6 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -46,13 +43,15 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	pinctrl-0 = <&pcie1_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -60,6 +59,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
+};
+
 &tlmm {
 	i2c_1_pins: i2c-1-state {
 		pins = "gpio29", "gpio30";
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index e227730d99a6..a1bdec941d44 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -704,19 +704,18 @@ pcie1: pcie@18000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			interconnects = <&gcc MASTER_SNOC_PCIE3_2_M &gcc SLAVE_SNOC_PCIE3_2_M>,
 					<&gcc MASTER_ANOC_PCIE3_2_S &gcc SLAVE_ANOC_PCIE3_2_S>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -808,19 +807,18 @@ pcie0: pcie@20000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			interconnects = <&gcc MASTER_SNOC_PCIE3_1_M &gcc SLAVE_SNOC_PCIE3_1_M>,
 					<&gcc MASTER_ANOC_PCIE3_1_S &gcc SLAVE_ANOC_PCIE3_1_S>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

