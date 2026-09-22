Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45D53977B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075653; cv=none; b=d1mDIHxENPX/qIX3sHKxbVqXJgejjkBzN/vqmSxgCtzg/vNkScxj76uGw3fWMx2X6GUzG1lwzug99tbgIEN3pBI0wRPvtSiufIdxVKT4duwWtlDGctpPY+VLgDHufmPiPSs0i88zVHbhOeymGXt4Ik+7jbpySGvZo9pcINSKm/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075653; c=relaxed/simple;
	bh=g63RNiBsT9mjc4nPvgqOsDpFLtnC3DdfnpOXsIKgIJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a6lP+VvzeQe9NCy/Co/nLbkokTbMjZkfeFRepSDYqqtRO7d5snHprCXu/HHT9aspWQ2tLB3NgJGSI43ssP2pcgNPNLPRb7v0DpKzoL3NuPeGZkqp2GRLdWxaqKznQEzm3r3kpNyf8TeOcO/7QZS0xcehxfYRGTpoSrtC1qwtnXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INRE9oUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4sWU+rp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INRE9oUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4sWU+rp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8dLfT3704534
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oqT9aNjhlVBDfwmzsk9SsMnWdsuXmoZ+bVg
	D5MW7654=; b=INRE9oUHhrzBadHD6WD/7o02gehd1PG/BPxmEruhL4S5jUg4mKY
	DsZzBDP720LzMJ7H/Lvd6rKwbRp74sSg1XjPp93JU7DaMQXhd+NudMRH6wcCvF8i
	wh2oA/LenUw0JR6VxgAdzq0wCxxhifE15QzqFOI6A63mEYhHLXGE6NZjZZv5Ukhw
	9d5bojFL27g4HMdY30xp18ZyilyK20Q4CMVeIEFdg8ZDCif6F7p7NuSqvx2sP96W
	lWnCg2JrmodOXRuOKC+X2w3kuYoTLPNEqAsAm8iO18wkv3qTMsc7KLM/1Oe/jT3e
	J4mg1KLSHa18wGvGCY603tNoD+MWDUKgBVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqgm4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:14:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5140626a91.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790075650; x=1790680450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqT9aNjhlVBDfwmzsk9SsMnWdsuXmoZ+bVgD5MW7654=;
        b=R4sWU+rpEXrNwpe6kQAxvkuztASUdekeBDicc/PK0sK0WkuLPVuq9rdMmlnjRmMQBO
         paan/2llh8qqyIXJ052sTIXW2ZhK9y0vtyhHLrnJbFr7vfpAqMjPC2RV9RpOWyMXXbGO
         zJzfLupllNIUqQ9xg+6yCdjORP46efJFvxgOKxG7rYSSujDPqiXbi8rRFEpQ+Zui0V3v
         dyiegy2zk3gKh9YOhFlE7okjK2dEnqQ41cWM8Lx7SrBIYVxaV4jpPa5VUswxFOWvaeaE
         Ifn9Y+iI2XSotmBvwVzps1kUZfuvd5MHsPLf2Y5x5liCsuLbmqWkVMcakylKafocQZBY
         lczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075650; x=1790680450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqT9aNjhlVBDfwmzsk9SsMnWdsuXmoZ+bVgD5MW7654=;
        b=kD56ux9yODFfSEltFkJC+PoLdkGupWVOfEn+pgIAenOUXHHF9YuCBKk0JUy+uY+MZF
         UCrPUwiF5xroGOD2iwSwOxAuXIBHBirkDt6+k4j0uLza6SnS5I9D5rq6QXybKnArENRy
         UiFl6pRXK8IOotiNkQmmBOr/B/Vp+pIkeRbji83uv7+thJtg1yGAW1uqIQqiwBBrhwvh
         WxkSKSF3DLILPq+ajsqJbn8FYGRpJ8TAHrNHzn8XGyGGFwO7FfXW0uFu1thfuScY9AuQ
         OyNrR6QZGTLBZgCIgOWfU5nKnNu4MCng5QAb3I2aKRl2Ogfevsvpnw77GyGnNkFJ6iak
         di7w==
X-Forwarded-Encrypted: i=1; AKwUvBw6Kp7Sy38fk2wCKJYcbQknl5BNR5mvl9j0cW5MjFPAfmFczC8YrxE3lB74sOzFdzone9XAFsrDMchS@vger.kernel.org
X-Gm-Message-State: AFuF++nF7eqkMWU6bL/Q4fvRHjeri7De3YZ/kBHrF24e3rj0kLe2E4/z
	NuKTm8AfoBbI39lFsI0/rDAKq7WQTWqHLJNUg7790UDOBc/OFIYJWrkJJuEJPkM0+2gUPmkACSS
	DZpMfiMaLVfZaz760dYw2yHucTdEA6hI9AHAxXmLOsnb6s/MVP7qTnwB0Ov8adL/x
X-Gm-Gg: AYBFou2t8+YIJwjcTafUyn2rdC1a1+4Hiw7GC8XUKwbtxb3SwnbdxyzvtVJl65T8LQp
	1WlAjHk833NpUcxmg4GK1U15Wcv01q3TcbDoJVAAY44ArH2C054/oTZG7bKwSDta5A0FD1AmfQz
	rHsG3daMzzqL24c8EzhP/ss75UDQ02+P36lFwznfy+Zv60uGCyo3XGNJ3KCK6dSzsVoy7XR5sPR
	af2xjhPNxTdnj2yfc+C1gUo7cjPa5Fb6LbZ8byuJn/MtzAjzaMg9hhp252KxEfwRFlpwma8JYGX
	NJM7TGdJbBQPGlD2/0YSaPk/+a1we/v/aQzDom5IvqBEYXfhspa0uBjyMHx7rMeimFrIOjctj51
	Aczmhub6zAOSYyHISsDHgY2xoh0kYuxGnMXFGZfC7ZjnIKX8BmaSDQTf1gDE=
X-Received: by 2002:a17:90a:d60e:b0:39e:6a7e:ee1d with SMTP id 98e67ed59e1d1-3a07320243amr883616a91.41.1790075649519;
        Tue, 22 Sep 2026 04:14:09 -0700 (PDT)
X-Received: by 2002:a17:90a:d60e:b0:39e:6a7e:ee1d with SMTP id 98e67ed59e1d1-3a07320243amr883589a91.41.1790075649066;
        Tue, 22 Sep 2026 04:14:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm4459372c88.13.2026.09.22.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:14:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Add adreno SMMU nodes
Date: Tue, 22 Sep 2026 19:13:54 +0800
Message-ID: <20260922111354.533902-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE2MSBTYWx0ZWRfX3UEPfCa083XY
 riAPCyFbghLqRDqhnJHDxLTs8pJaavBVAmVAujNkdUCkzEHiIsnAYr6qsAHq2EUBVgitdEEOO0N
 ljpRXAh0wvUK659+43hukyPLIrAsJcw5LIVZzfhPyfvdIPpaMzx46tG0Te50ZvEYXrWefnsdheB
 SflgTahaldYSsgBF2H4YqcbrQF0ZQN0w8ynxHKt/j45z96HwvZ3+uojS+tuGnomuX5GMJPyLRnd
 d1FNDcpGr5c8G9fMzNuHhzbjnHHZOe6RV0YDPw9GH9Nliz9jqjUoMCCqlht0oWiob0inGXvYHzo
 yaqa+T8nSqaagdzWwtxlzg+b0UcpkosCHE6hpcKZIZqQ8rDFmNmK71NiKbZ5ANhq011wKdT+t9f
 6WF1sc3n1QyqUCTozaxUYZ0OLEjoVm8ViJnsjVTgjUcpHnPMkH6npT0KR+UE2GFieyG+uVuTqAb
 GFspK6M82MRpCCnhqog==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab26302 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HF3Ml0YJHsfIH0VxRAAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: -QyCDc3j5A_jivpRHmXLMjFKlvwA_8dM
X-Proofpoint-GUID: -QyCDc3j5A_jivpRHmXLMjFKlvwA_8dM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE2MSBTYWx0ZWRfX5vijZA+eiAz/
 LL7hk3dvtjcFUsW/EAvLsk3N+YDyFnkzr1am5nrMrdo/ivGwez/ghOcN5qKEuJmmrqPf4fmqfWF
 KZUaUsl1NBa/x83iPDo/vm8JezaayHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220161

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.

Wire up the gpucc clock and power domain on both adreno SMMU nodes in
nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Dependencies:
- SMMU binding: https://lore.kernel.org/all/20260902013858.130887-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord.dtsi | 74 ++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..6c53246d5ad0 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1518,6 +1518,80 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		adreno_smmu_0: iommu@3da0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
+		adreno_smmu_1: iommu@98a0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x098a0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 932 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 936 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 937 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 938 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 939 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 940 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 941 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 942 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 924 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 925 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

