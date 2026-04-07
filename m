Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA36333D4EE
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775593128; cv=none; b=AzDvLH/K2vjeqdGwrz3OO6sME7geVcJFIf26tvspctobdtGoW1dOFd4mXoccOt3lF1xhAC4z9h+ed0ggI4QDb6kDP3ylZ14QzMKnm0tQDbrLAo78Na140DMycT7SKFZnFRxZUydMRhBD054lXRINbfoRBAMU3T+PBe4G4BscgQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775593128; c=relaxed/simple;
	bh=y9A1iXPwWfAQ4YlrA/rAnAwdFvEg+shIsT4BgGUo/nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jYTJQguNYGUeydrwb3XPJFSLynOPeaJAC9v1rDNF7QYV9Lr1p5VE6xbo6iU1Lm5md9h1Vn/BTXxMZWUwV3DdD+oJ9ta+Vjh4EQhB0wz+SB/INRkVGEnFi5UqmgvnBI+IX7gVWRH1YpiQhNdOjDpMD2kkxYdiv4FkTMTqykZ+n30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6d2ao07; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIAFg7vB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6d2ao07";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIAFg7vB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D36Ib3402372
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 20:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3nkqghxTTtNnwMQBrcxxrcjuwaSqqNMWF3n
	1QpKqzn8=; b=M6d2ao07K1fLAALbB03Bv0g8i81JDyuWODiQ7JvhiTcynLX6+ZH
	sS1yt+dvuBoz3QB1i3zwY4WllqDZ75r17tBDlrTgDp4XS6ow8E4WqdUrMQGDCe2N
	4I+BvMZOES4rPeQKU3cUlhKHtk4cviCJNSSsU+fEdNPogtWO7KnsmhU9k5nXGy9+
	tkiOgHnYJXGaO0HBJnf0+yVuzB6z2k4i+/pbo29/+Ma3FZwBwOEbppk3cyvW/e95
	kStoReIhxkv+PKQ+nCB1RIjEVzDuvnBBMTAFIJC7AdE6gfAidzLMi3rsyHx0uJBp
	FrwZ38DwgjK/1gRccHCeofC0IbygHBXjIoA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhvfh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 20:18:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89463017976so146474946d6.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 13:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775593125; x=1776197925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nkqghxTTtNnwMQBrcxxrcjuwaSqqNMWF3n1QpKqzn8=;
        b=KIAFg7vBiP3TeLSl2KkREKu2Rn7fnXfPyhxsjWbsmMu/hMTYVoYQVPW4Iuu/6P4zz5
         f8Qt4Pt4uH8/Vx+EAvx18RdikPrn61750RZmQkk/Cdw9f8A3WHZaGtzGjrzuYrzJ9fBq
         IztnpZxNluxl4ByFIc+yvVgZGGhdAjqO0irGn6HjFvUF4EouJJHfMF2PwzgSYFLp6ebC
         JrcFn3Fwr01op00cr1M+kwCfp0rtl4VjGKPlaaTTIR6GHb98wWvUbW5ZLIAnxN5mq5is
         t32q4+Ps+7y8z4yzMJBsd5yu3qvLHqxMajdDrdAW033ym901iX1uJPm5vvPbbsnMLszF
         xHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775593125; x=1776197925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nkqghxTTtNnwMQBrcxxrcjuwaSqqNMWF3n1QpKqzn8=;
        b=S5W8ZGtsMhXL6C2q9hCKFEn68b36WGUm2aw/+UcFgAnBEko720RvLK8RGGBN4CDH/D
         Vt7O3PY8t+VKYtq4AmVazBKrcTvhwTy2+E5uXfr0V/k+f3arELuZ3rUT/gP1zlnfww0V
         fbhdsNOuGW99JZyCmoJGrJZ3JRXLqcxV89JFpnQuwd2/zhf5qt+ZxXaY2UbtNW1L7R7M
         i7FasEEV4kYSnz5PN9FgvmWA+Yv+e8HEpJ5iMrW7kFOVjrwtHInSvpQ8kZaWOcfoxIdD
         s5l+eiiLFldFIXcAapYKisx2sO6f7qdezHj3YefBhSCTLxPFFwXPaX1f4t8mfoCefCyp
         rSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfCxkIkp6WJevC/Zk7YPyKuVS29/8jQ9uQlkxeAiW1ymhbnpyilJiifcxThQ6qKM/8D37dDtugnLdk@vger.kernel.org
X-Gm-Message-State: AOJu0YyGD+3FhwFid+j39ZEm6nbr68lbJf0rQAOxlmwyzKRBHPACP03J
	/A4/out+Yykqe4de6bW5C/S/iX1imND0X80ZMN0/CM/Qt4P5UBXYpEqjavPqA6bCsHpORZe8UQr
	0MM+0TTCZJnXNZt8m2qbE2OxWDEc87M/YBne/+dN/GCOqikr4tTzd3EiZUaT6+GkJ
X-Gm-Gg: AeBDietVKaDtpP1NVyFafr1tpGshRHlHHLrXYN1GbeIZyMtumyetu/0sXIpiO+fL2E3
	Mh3FZzpH3Ijgrhw1/0RtbA11Y6b9eCpafXU8jP10jls4J66NlKmmjSJ8CF3I8vCRX3fXVz1TPMJ
	ZE3uLsrsAHCAvvlrNcAVx9hYLwnzR00Fjzfn/JQo3uDDvz9mpIYOCU3VsYduBhVFlOA/bng7vBV
	nH2ltZjCb0kqLA2hcF4fgM1c/L+Wz5o6Vu5Nb233MnHbSvFa8CAcZQPU4vwNrKKLlCdQOPxYY7b
	LOLcrAic83sxB/te5oEFe3+I3muZR14tANWF/aEzR4d/o6YvHlU+h57584ChwrGzX3ayrde1o9T
	eDhnjp0DzPyPiGHeUzah4vUYmp+863R7/hwt2
X-Received: by 2002:ac8:584d:0:b0:50d:8db0:7ac0 with SMTP id d75a77b69052e-50d8db08a03mr147511031cf.55.1775593124544;
        Tue, 07 Apr 2026 13:18:44 -0700 (PDT)
X-Received: by 2002:ac8:584d:0:b0:50d:8db0:7ac0 with SMTP id d75a77b69052e-50d8db08a03mr147510741cf.55.1775593124122;
        Tue, 07 Apr 2026 13:18:44 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c527f877sm6095535e9.0.2026.04.07.13.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 13:18:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Use GIC_SPI macro for interrupt-map
Date: Tue,  7 Apr 2026 22:18:40 +0200
Message-ID: <20260407201839.25759-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6205; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=y9A1iXPwWfAQ4YlrA/rAnAwdFvEg+shIsT4BgGUo/nc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp1Wafgyb6zMxEzwXYIKtDmP3Dxgf2h2lOToA8K
 xxEJifT92mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadVmnwAKCRDBN2bmhouD
 16MrD/9Qai+QcuNka8ctthKuJEQuXPj4o+gQW6pIhCN/5SvGnw8D8PybopI3jcWjO2yhzyShKMu
 bPA4+w79mMCpQJccsGAWud9+ygeikpZx4iceM/vlGr2UAMC8buUY9rMlDoJmfsJPMJaHyqq7Kaf
 +GE7Fco7kZd1X2sKhmflGkWU2UsizCzO+/BiGt4Viu2i9CDfTrHVxs4Mw7uF7iurhyoEyTe1zV8
 4SYJ1PeUqucBp3nsn/92uADzghdogznTTEU5jMy9nubyKcqjyfDOxHhEtKzOQpbGZq9rzbdZP1s
 DZj+B0EQmIZ+jFrvXcbwLo1mmvrQj3GIZkmS3v5dhzPNsqNZ66jAIyIF6oHS2FKYCF0VpimWdF2
 L2lFhSuFAFA7gJE/4UxvaNrUZGAYpuV+soWCJ75X+U2HZMVDmq1N24WwCBxgHML1Z997iuErLLD
 oom50Ya7d6tuELJ92oAHEVD/uIXm/ZXp+MPHqXKTLTSK9uRitAu8e8Z3x/vNJQ8XqfIuHJtM7FQ
 w8YPL//duyAgi0blC4c6li6+CZQl7kztPC9Wd/mr9n75K+lwh1lzpG6WeGQ8m4vP1nu2VaQEfUF
 4EWYCLSoTNqf5AqHQDHPxQRJOGzGVCvgLxQ96FK/2x9+blfbwrP33TtplzEXKTY0OgsZ6BmSfWX Atzevl5P6HUVS9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE4NCBTYWx0ZWRfX+wd8ZymqHh6C
 Wdgo/eQmo5ZK7m7UhCF1Pz5wCXUt+MESV1d632Fs5uT3ZIxgVUyQWnlQZFBLVl/oBQLVCGLibws
 G5URgkn2Fv81UL8WP1PCtq1sVTJqkvNkzPq4Nm7wuCPbWmJWoL2kseTorMbhRY0HrYRbFoN7jEm
 IDFPE7RFDxR/I6e4UPG5JQauFmtRvg4hccIs2A3/gQ7s6TBFykDZuqeNDiIevsN3AlK1KIsmErL
 NpObNu7kFJEVFISAwaFE6JyUsYH2LEV4rbarjxkhYA8Bln08Zgz/S21+rfLNGAm4gfNk7jP8w6z
 UjJ6JTJcsgUqc+6PasKbnE4wIKnqMiQa9YXi/+FKATgJjN2f1PKaYyijt13ClmTwt5PhFeZSwaz
 qpIuQOfJAwDtvdsVOMskTYNfXqaIyMVB71i4xj88WRRHs8iIbhnyXn0+bi6wUTL8/jTb0WydHlB
 o7Qpu0+E5Nf8gueNsNA==
X-Proofpoint-GUID: ZCjqed9fQ6v8STrhYasTyM-FZ4LN8neY
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d566a5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qSeiopsPS7ICN_Qpzu4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: ZCjqed9fQ6v8STrhYasTyM-FZ4LN8neY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070184

Make the complicated interrupt-map property (with multiple '0' entries)
a bit more readable by using known define for GIC_SPI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 32 ++++++++++++-------------
 arch/arm64/boot/dts/qcom/kaanapali.dtsi |  8 +++----
 arch/arm64/boot/dts/qcom/msm8998.dtsi   |  8 +++----
 arch/arm64/boot/dts/qcom/sm8750.dtsi    |  8 +++----
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..0a3cf2c62c3e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2776,10 +2776,10 @@ pcie4: pci@1bf0000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 513 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 514 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 515 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 516 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
 				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
@@ -2986,10 +2986,10 @@ pcie5: pci@1b40000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 526 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 428 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 429 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
 				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
@@ -3252,10 +3252,10 @@ pcie6: pci@1c00000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 472 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 473 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 474 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 475 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_6_AUX_CLK>,
 				 <&gcc GCC_PCIE_6_CFG_AHB_CLK>,
@@ -3462,10 +3462,10 @@ pcie3b: pci@1b80000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 831 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 832 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 833 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 834 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_3B_AUX_CLK>,
 				 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..322ebfad6bf7 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2313,10 +2313,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommu-map = <0 &apps_smmu 0x1400 0x1>,
 				    <0x100 &apps_smmu 0x1401 0x1>;
 
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			#interrupt-cells = <1>;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index d41b5c470c48..347706011637 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -955,10 +955,10 @@ pcie0: pcie@1c00000 {
 					  "msi7",
 					  "global";
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 135 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 136 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 138 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_AUX_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..ae7891c0eddc 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5202,10 +5202,10 @@ pcie0: pcie@1c00000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-- 
2.51.0

