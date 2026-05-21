Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A80400E02
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368887; cv=none; b=AeuJR4qT3eSom1aHRbYynu8Y3sJ+Uaqi2olIe4bkPsDccQSdFly+QLwZi5x+xO85vs+5MDbkj/+WKg2Cqx5aO4XAaXskJow+vISrKlB2YHJT8nT0rlvO/yvntNuXEqUVR2EKwyXsnyezvcXp0+ubatPsABWwk29dZHWUtlPKxoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368887; c=relaxed/simple;
	bh=FnMF1gdIBBqzcGyw/Qftg/BoiY5xILkioEGvlCuaMr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oeVFmmCRNMJhMUUb/vfKVc7suZi9No9LvoYGOtmRlEvK9UEFFFJxOqptIssQOLHulCVSdUxnu6sbQHCkjCzs04BULV67LXGNHjOac37mxR5uNfBIODetNi9+HTL0aUwuhscBnYFnK+5DMChCdLp3+IbnOZFJwmWtYRQ4LMkwTgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cas4oJEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1faG2Bv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cas4oJEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1faG2Bv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99xoe2632696
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=; b=Cas4oJEi64ic3W4y
	yBpP3SctJcvv0SpbtI1SXUJpYeFS/NNip71tcB/4YMzMe1qn4dKEaWi2u0TcJokC
	7SQ4CyRPcLNV/1XtZay/bElwHD6fbrzoOghYTRDcD1vGiw1WB74xAAl53iNbzMr6
	5I5rJP/hciEb90WtYY9rdvBFX0d5eTGgmVXeHsNgU+X0EZ8pBHyjpZ+jHTdTpywl
	7jej//3zeb1xjTB0LfpEiV8Q5G9z3WB+po4jCDrICR7RbtT5qL8PDkq4ghuE566K
	l5wwfOEA66dvP/3rzhGUEV6iq4IPrM+RcALMtqR6OuWtyMrFDT3cVOCGKvhdr/BS
	ZlzGMg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8d42n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:08:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so6695104a12.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368885; x=1779973685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=;
        b=X1faG2BvebtfEVvXdM2AUCdgcG4ZyA82cK89JWGImeBe7/nog88Z1/O0fbETy8sFv0
         S7VIqBoTPCGF2F+IhZE/D5q+yQ+2tO/B2dQ11ZLNC/zU36g68iEbzrJzcGVsEON8GJt1
         ZRGuxEORGk+CDcEJiHdaWAHB1t7LggDFXWPJtPGUMgCsWG2V+S4SzGRKwbloHPlHpfiL
         I50lMri9ZJ63K0mm0YUNtLdD0fMlXea0brNw3SDhHEA75vvmLtclSF3j3HFA1ucq4BE6
         HXGaF/a+IInakFeP/6YqC+UexkOH8I3IHlxrmB6RXOnuH3z0IEWCvsIxLpigi1r/eQHY
         zCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368885; x=1779973685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=;
        b=ffUsBc+r0lCL69htRFrKzgBayTCfLJJkCSt3TMkCVSTywEeUKDvYWOHRz/syjQZiSJ
         HvkSHH76Dm1v572V3t0DfRkxgAXW3k3JjedZOR0juu72OIC+1KBVRSnvWAumw4OIVcKS
         ATU7ynO1JjCiQI3+holDU5UzrZsTkfGjowznvVMi3VmtcKnEhhfG+axzI4tyZZAjWQ9m
         y8Td3gNJ3O3eCZOtASfuL3V3NC1DSc9A90zs7012kcdXQS1ePVmoflGW8KKmky8JBU+f
         ZQYj8kQQBvTFL8dUpFcJDgW2d4y7Y/z78J5an4pjAU6TBplWLJ7kLR+kTof8HTNOMCRZ
         Ixvw==
X-Forwarded-Encrypted: i=1; AFNElJ8A3u3gIP5qekYztkUhGTxBJzZ9k5hIybj2zQt7xbmVfNWbJGGy+W7E4RaPsXYqCzSzrRT1RRYPNURZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2wv9M69hprjNfEpG5X4L8j1rh8DB2J6H/ZYCmnLgtUN60AfI
	LurtiypKW2wGjV20bCAYotThfX0quLS2cPBb2UQWHAr1FGuTgZx2CZezWKt0d/I0gkvsRXHPpPg
	gbad0fDp/zpMd2D1GlkiPhXmG4Nx15dwx/U77e6a9aO/bNSGxgK47J58GHdP53q0o
X-Gm-Gg: Acq92OHMakIt2J6JyMOE2HWQyqJqdqU5H3N0artmHlrwUQhpJDB8oY+o15cYDp//WKW
	diQm0sY4Aad95fqAdODjfHWW2dBv2f246oH1lrss6vdIO2n8a1hs1bWW+sVWl6qdlKBiYI42x8J
	hp6iZroTh/4K6bwTJUwYJkqtFeSjobRfPXRdg2zLUKRpFkRnRl/n66KqPUzG0TwDx8xFDvrxF5B
	rg524v6ocdL9iDIMeznhpj/h1NMCKVC47JTwTo4vjelMBi6mptYHqT06Da/cksbmBvESLnLlYgR
	nykLoVvSU4KXNhKRRXP47lbGUotyCy7j86VRHSXSiCdnrny1yipGy9YrSOExa4pUHkqc0MQsUzd
	NNc4zvSxW4crAZ4+I20tOqSv4C6/bJ0wcjktUDmrtaWRugYkJfK4sKqmDNEHa/bCjwKk=
X-Received: by 2002:a05:6a20:8ec2:b0:3b3:c28:45b3 with SMTP id adf61e73a8af0-3b30c285046mr2074624637.26.1779368885035;
        Thu, 21 May 2026 06:08:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:8ec2:b0:3b3:c28:45b3 with SMTP id adf61e73a8af0-3b30c285046mr2074570637.26.1779368884462;
        Thu, 21 May 2026 06:08:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:08:04 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:50 +0530
Subject: [PATCH 17/18] arm64: dts: qcom: kodiak: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-17-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=3509;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FnMF1gdIBBqzcGyw/Qftg/BoiY5xILkioEGvlCuaMr4=;
 b=sZH6QR2WouUFjJo1m46Xaxf61/naSCEHKX9WqZNiJpV1nMt0l5X1OGJO2/+0sRTGhgKOp2PhW
 V54AQyoqX6zCqfwnTJkFXsCf6wO/aGDvyZE52VzDwuuOBYYUh5J5id0
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: l3IbHvQCF5PrV9eLo4ItiOWK2L2aB8so
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0f03b5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vzsU3dzRAwCoIzd_qrsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX/vhCwNZtPMw8
 1HyNCt/Lflytcq2lcA8MTZyBovK7H4vapaObI61GYmxxzUobQi8/YOlk+i/bjC9RBZWyYSH/0h+
 TFoyrRm/hnRDpZgfpqu0OfTkiKI1pVXg6lEU3+HLtvavDVxMBj8wMAOo+AZavR5+85Db8jyCeq+
 O0Gf51CtmFshRDZshhBTUSQ6K6FU95xi9uk5r9rO/LxgtHhpu2Ne1CgR9U3y7LeO5bI+CWO/qZw
 hxhTgaiC9cdqwl0+3WcADoTviXf5lbW5CSZ/X4MH347WjS6JRvqST/wMTlCDjdpSwfYiocxR/vX
 WMtg7t7rGth0DdOPiJJPRRE2JzA2GXlZvjQMlEMBzZb9A6/usNljeLExUHduPG4yTZqVli0vNXH
 j3gtQJ7f4emqzIGW62o4fQDHxkHFBMLzTUi1L0PuqwVTXNbwe2dmaeovfFCeoq4Ihx3RbG589SS
 X4S/C986hJAgau/pBFA==
X-Proofpoint-GUID: l3IbHvQCF5PrV9eLo4ItiOWK2L2aB8so
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..b1ad1d7c346a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -546,7 +546,7 @@ &mdss_dp_out {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..3a9fbef89aff 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -523,7 +523,7 @@ &lpass_va_macro {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
@@ -540,7 +540,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..e0275430ef82 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -685,7 +685,7 @@ &mdss_dsi_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
@@ -704,7 +704,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..681a9ff5ef77 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -813,7 +813,7 @@ &mdss_dsi_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,

-- 
2.34.1

