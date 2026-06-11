Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC61E37CD47
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154038; cv=none; b=P7JbUGJVTS9yPnwKuzvnWsdS8zvLhjGOVyFlRPu04/6BlGpBC2YlPMMMJU4Z4lzmnj9uod81rzAFVmIHerejIYaDZaIoN5cg4Zi8AlmkOkX9gvtjZqBaPnkZ69CoiuVlps6M6nuQbe2urAUHYAecnm5dMbdPlQ0fPZeNTWQfFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154038; c=relaxed/simple;
	bh=400bzk0D1iSP/BJoYEZl0weep9VQmIgy1oL2FUVxJGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRctmFOOvl7i8A7n5kTH5A7pFwJl1lij5FORoX7EtjlAtaqwRNu0U+jyvrHCB+3OsekzSWmk9sOFnvw8QvWDbGg5Y8xpgBed/KkgaCyqloKh00zdaozeTfnI7vfiYqWmCV24enLRiGOM9oY/FmZR7wnEk0vwEalcK/kWhoSy4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlWrgTvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQ/1YkxE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlWrgTvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQ/1YkxE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0P1mG1617638
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGceFhAxol7QBy3EzN4HqW+SsrBKEgHz1ybQXbHhOrg=; b=jlWrgTvIIYjyCBLA
	k7pj/wOYaDfBSmOXcdiVVtkce9oG+kkHiZrIM982/xRWf2opPWISWFwuH9E0R6XW
	dFQc1lbxSF+JjhXCBzehx56V00yuGO0HYiX/DMKp+FIv94p79dXtVp6BLWXxdif3
	YENzDsrUIgLAzVz5uuKrAFVUehXSLgeQwTYVWArzEWPTlpTzinK03ORifEZ1hNfl
	4EJSJrMh8uDiSYNAhEQYaFtOAoF0c5NBashieozqRPk0CHMhMRIYGTkPbAOXASx3
	dALe19y4J5/1F3kt8KYCk1HqJVy/j15ITagvChDw5i7RhPTgSBph5AtrrokhO/4Y
	Nyeuig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hnd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0a99db8dfso80882165ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154025; x=1781758825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGceFhAxol7QBy3EzN4HqW+SsrBKEgHz1ybQXbHhOrg=;
        b=XQ/1YkxE4Qt1q76HCuBSXq6hwdLDAcW24ccUUy2I9Q8DqBl7ZIYkMX1pV0SsmWu1ns
         HD+TIZvVH/UXy9867/VUc/RMLCL1DAkdrPQAdDzaizztfzEz+vuYays+gU2AiSQdIuSX
         jSXXAq4A6S3e8Ghvo12eSUDiPPcxorEionYxCFbMmYytAcrBMkNpNSGBI+RdTC61iZjC
         pjqsDeVZMRIKthYSjf6HujwxgihSXDMKnNC4jSy443eTqMGv4TRZdM+vH1JJ0oV3xY09
         5/A99M5+MZDz8zYBZTtuK7yaaE68S/BO/0xJr8CAM4+nw/pICbI4dfUwMgDxxc6fTkse
         P0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154025; x=1781758825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZGceFhAxol7QBy3EzN4HqW+SsrBKEgHz1ybQXbHhOrg=;
        b=ZrUyVn7gieVYhTN1bJF8Ha7VbfHvoCT60ilO8Wbx/0yd6noDfQYTn1P03j6ZoHysf1
         914LpjfPlN78FOuaH25lFQUyTHbZouTn4B+FhX/KpNgXXX9WXV+GSSiJIuXID36MIrH8
         J/RuVFq3wir8vcMeQWTZA4c8zR/we3kk+WZt/LwSlxZczM7nC925CK4UR8L9/7I9Xrqz
         Uf+QNt9ES0OFj+rlwhImLGfS3E+AERYgbhwcGi30u19bJIKDFrfgK4NE8+22D3r/pTrl
         p9nwjEIK9E8TLl55JgD1w8CDdkHNYb0VP6E7ShHCLLq60x9nJbpMp5V5DH1O/4SL5fAz
         Iu9g==
X-Forwarded-Encrypted: i=1; AFNElJ9o4FW2TbZtq0LTTLrW90EwsDfuQyVCspKs+5Jo3QcL0ybqrNcXBGF2TenrTzBL0cFu+yDkcOxd/81V@vger.kernel.org
X-Gm-Message-State: AOJu0YwJp+JJ43f92jgdwdWsmzmJsJy1uD5cm/0LyxZIcbPtCGmXYnRA
	5ARjX7FJvpisF9H/xR8n783SnQS8SW42n38WylJtkR7imZ8QA/5x6CEgQzOs/kj3QlTTIVbod6p
	1YABCo+T+jcF5pkSboAEMSwMP0/GEkPWVlmQsbhZwU9TMYgQzR/1eIFIW0Yej3kZp
X-Gm-Gg: Acq92OGFumA+OCe9wrmUPwZPhqpBL5YaFtty+NeigisivvVnVQ2q8zPf61lgN4iu9W2
	jqRjYsdJKR0PZ8Ozf2+kUVNXFa9jcV0NdwB1JjQZROiB4PZHdChYsWBD2Ng4Vdu7GWP4ih90Qur
	MAYQl6xttNCa1700+zNhCMQSNh7i4GlmzMx1oomHrM/79Vbq2/HnsC0BUtwKFDD4QTPh9hcj/DW
	sTTjbnbEtmTRSy1iuogKBgTAoaqjEKqwbEXtmjlAsZLuxAcgXEtzZfyaRTyyL14sWdzgl+Loi5j
	N9vgEEK6+V6wxN6NLJhFOFOplQod+ZiaWvDaCQbI7djBENVPOndSykTILM1rytX/hLQT4D7Elzv
	uXk5z75u+FBjZkEoPK/bZwfX/QEv+Ls/yMhpen1Lt4QKf/cJWzJ8/nTBhzb+ibMFnoGw=
X-Received: by 2002:a17:902:cec5:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c2f005e44bmr13373975ad.7.1781154019981;
        Wed, 10 Jun 2026 22:00:19 -0700 (PDT)
X-Received: by 2002:a17:902:cec5:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c2f005e44bmr13368885ad.7.1781154014627;
        Wed, 10 Jun 2026 22:00:14 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:14 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:56 +0530
Subject: [PATCH v2 20/37] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-20-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1587;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=400bzk0D1iSP/BJoYEZl0weep9VQmIgy1oL2FUVxJGo=;
 b=nZmPd4dZyg7DtClHayJpkkig3rV6BVsKwTQyoD672u7U0ZVxhKir4lSvnM+526RqIPX1yeduQ
 2JvZH0l2EAMC8rzRjWbjNGn/8eXM79lbMvSSqoQwK9MxYewumvqZjGu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: nlz-XKOed9nU9gUkMetl8Qot4LV7mw4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX34vMM2ls0QRA
 ZPtgpjbhwm00EfB/cFbYWHVghMFINBnuzrS2w/rUtX5jhSNUstBSTNpfkGhPOUy+Buv+UpZkzCQ
 gq8cQyNmw5E3H3FKH0p7Yw+c7KgSOFDH0wD/Rc03qT6rs+fVSxGAHu3gVUQ918eLUQ+7PEyc07i
 H+cz/q1k0aALWijIPK02QPo7nQvt7W9fHXPLgrvVikPk8Cjt3/5eZquvL3NBmdZ6hatlOJOAXrG
 2R1Qu1co+qRWL7M8TYurcsSFHV6kEjD11VW0K00faFnF9fLdwwTYGgKRNg6HcTUt8Nki4FIrmb3
 sSeKZEzhhJf8P3lVh10n7OAIvgfJ9flTBDK6Cr+KRElCDHnYRvpWHA5D0vvPQilDQefnkdxkEWx
 TH9vNGsZqjA5yHMtCm9cHYfXqmeSARCG3EE0VlDKBpVMHGxHI2kLleATyLZbk2p8nKVne2bwwge
 pxFtyCRPNSEisDoPe4A==
X-Proofpoint-GUID: nlz-XKOed9nU9gUkMetl8Qot4LV7mw4o
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a40e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w5YLtpWUZy_VJOv5-54A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX552G0lRlehSo
 ZpahlZK74QX8NjGb6KO3lsEtDDjdANlH4TLwFfMcqJrvVb8LEA0R9TJxiHPIxnqLAfjK4LBmx29
 z1Y+Lf3cIwSKNtvkQBzC6KS+Zfd+m1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys, phy-names, and perst-gpios from the controller to
pcie0_port0, adding a label to this node to allow board-level
overrides, and renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index d41b5c470c48..53e718474db6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -928,8 +928,6 @@ pcie0: pcie@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
 			status = "disabled";
 
 			ranges = <0x01000000 0x0 0x00000000 0x1b200000 0x0 0x100000>,
@@ -969,9 +967,8 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 			iommu-map = <0x100 &anoc1_smmu 0x1480 1>;
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -979,6 +976,9 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 			};
 		};
 

-- 
2.34.1

