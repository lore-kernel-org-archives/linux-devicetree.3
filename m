Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6E31E822
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717941; cv=none; b=Ob+kv6yW2uWldSiYiqzpNdkqxQm75FGv3AScJZQiE9+rC/6gW2q837LVq7w3+2eX/7LE5woswvbeDK87lrzQf94MjlzwyaE1N0n+yQm6dGcRycMCZosMZ9raNWTyLEGD2YPeoWEnSYyidbLE0+0M4X+OMpYx4qebdh54oTtj0LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717941; c=relaxed/simple;
	bh=hBDK+t7sZBnTDtOjkj84KsZOBvFHMonhdCwtWPz4c5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6oepFwzYczranqFqkBtrMI6F3VkjsmrKiYSrjSHPyT7RiHFHLyGrKYrXgBOo34ZyYKEXxAqWJtB/DGtr4rdtYZg9046YIjOfi1cRiCGqaW+C/yNCn08prxJ+MnGN9lk0qEW43UaZp/qi/7iv8DZR4omADgprp616Pz4tgNdKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqF0m1iS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8kAmCgk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqF0m1iS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8kAmCgk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFogDh2649284
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=; b=XqF0m1iS9OKyQs/s
	WqknmmB7Crgy76gSDBTL/Tjaqzn/BWNN6ccvZ1bgQs8KiAIArnkZZZt8mEayu5us
	XI6MBrzjtn2l4LMQGmSYrrfE1c75v9WG7HEumjIkG3cCHDDG5zLhMckIrHFh361w
	ntumBI+K0yJCAGeMiwObd4c/71YvlYaTmD4cnwBqPwkWFczHwex4HH2QgfH3zsfA
	63TY1uCaK6IecUOEwQeu3hgBzjb3XMD3xaOxeI/TFjwVKAqrd1LLCCD30RQ/BMCT
	PXrhSjp55F3TmyAQ/UtMzDAOdjAzNMv4BlIIhTA1QoEsdzRo5N9f/sV8p+Z9+TU8
	KJQRdA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer4mcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:38:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6b7c75550so656455ad.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781717938; x=1782322738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=;
        b=T8kAmCgkaG9Aa3EKuhrjG/s3+Agbfalqcxe/l8u9K46BaoxMKjSZxbnE4ilsaTAokj
         uGatXLt6y80nsdr50zzjVWj/9wJIJ/trvKEkotCCMx7UXD4y6gJPWFczCkvra5vBfbNg
         FJlZeTRqrYaHUz+GHMXSMyAN5ylkDfn7EBGOfcPmlOD8BapcQDMZKZC2bfw507fu3TJl
         VMaqbmpexVfDqGX7dziq/tz/9lNiJUGO/xb8ztx4NEOQh+FQ9Nmf7udCsn+RRlouUa3s
         +DOxpUntJoBcXa1uaY4wWRyQcIB1cCRiDvHLydWhTgqoreONBKp13mQxxeG9O3rHGvDO
         xESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781717938; x=1782322738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=;
        b=dxXxRn+mhLEdft9Pie0fF7I8g8Xjmkc1bA7ZKnLbLcGqU3mXMpfq61+j3uyfMX6D1g
         pwnO4HN1S3pFM9ulphZkixCThXybz+hTsfwhoJesw6ytRpCn33xO84+Fm4C+VLvXkdpv
         z8wkNWnY7c/rsKNTRnq4v8QtIy45Ph8UIMgxag0arAkieEREiYXMS86yO32qq6PPJyeB
         Np2KHD/f7oPTsNGcuJewjKtlKMMMh1Mj0tTd4tJTWIDY6vsnJmnBUuPDeVN51l1JXlmO
         diQBN64J/85Nw2GnD/JQOw2HXESuW70hFPgEjvHEw8vFYyDsfEr082qMMXd1vLmHY6qM
         ki7g==
X-Forwarded-Encrypted: i=1; AFNElJ9IoAu1POMSh6PYAAnOvYb9ytlVpTtwerH5zOKu0yrLmf2wjYKrqRMwNMWB/+tMvI2BH9o0Vwlp7j2e@vger.kernel.org
X-Gm-Message-State: AOJu0YzTNKtkwzknxlgajd9BLk2npP2cVLRIlhkdEHmxiP8S1V349x9B
	hYK5RGAZNBNVOzlxIleGVHJgKKZWs5USOY+U/e0FDH6uzi1mwP1YRf08bJw0fscDUwzQOsIrIYW
	y1/8As3LHw3tXtpl9DHzEu+suw8NrJtlg1IvTRKzWND4Gb6BRcHAdj/Y99AacgTDF
X-Gm-Gg: AfdE7cloG7yIm+XYWjQx7bP3XXmCPH4z2Ejdp5136BI1j+vJj/J/0CmydvIu4PUu0pY
	cLdFPZhGmh7Kud8zbkJPVMEop9RfyjFEIIYaSUMWNYHNhg7hmoes3a1PwCZebkD8NBL0MJLlSEe
	8EzIjcAfWeUfzqo/VMBIT6BX2tV1M/F7InJUY9aiC7gZhIj87OCiOr4hImqlWcLkDh6G3NmlVUR
	KOjP4RTtQCZZtAgRUrZq4Lf6NnoU54ioniLcwTHnHY/IolxCtQOCZVUUoFD2+rBiuxyLm2msOU9
	y76ZgB8OBGfAl28xO9s7a7a1HrKQ9rQ+XkzcFJLLlGGfzByQ2Ni+9/VL8kkFgT+oyhTdrQis1+0
	cSdf3cL2B52vu54jF+TaN8V19UqPBdZPYbECro7Sjy1cYp/BQMkxZz6mejfTbn8dbbmQWZiugqb
	hjoUFI/eHnB0mQvWKU3YIAA7L4x6CPPN8yUyx12+bkam3P7w==
X-Received: by 2002:a17:903:2306:b0:2c2:75c4:4b0f with SMTP id d9443c01a7336-2c6bbf99275mr59061735ad.2.1781717938517;
        Wed, 17 Jun 2026 10:38:58 -0700 (PDT)
X-Received: by 2002:a17:903:2306:b0:2c2:75c4:4b0f with SMTP id d9443c01a7336-2c6bbf99275mr59061565ad.2.1781717938092;
        Wed, 17 Jun 2026 10:38:58 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm173973215ad.73.2026.06.17.10.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:38:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 23:08:43 +0530
Subject: [PATCH v4 1/3] regulator: qcom-refgen: correct the regulator type
 to CURRENT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ipq9650_refgen-v4-1-c505ea6c6661@oss.qualcomm.com>
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
In-Reply-To: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: ku2qZZDfXEzK6LJoL98UL_8xB4uOjSJK
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a32dbb3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VkQhxhI6jZxeKeB4iE0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ku2qZZDfXEzK6LJoL98UL_8xB4uOjSJK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE2OSBTYWx0ZWRfX/W3r5C8WG4ZK
 1FKAWt2ofvnvlSw8YQCMmGngdiL5f0EUwQ9Xx5RtBsD/grHAySaKCAir6TK6W552N/d38gnT2Tj
 Eqyl8nbNdTIKA/j8UALmhlQZ2c2BUtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE2OSBTYWx0ZWRfX7LIx+0K5G8FG
 FwuPtRYoPgUQ/CdBhyB9NRnAnQNu7o13q6pybivfp3/TxTu8/ZVZ5d6atGuhndMoDraM1nOQOm7
 13os6Wo/sTk/KO1AyDB2YXBX8bhU0LizU9dLCoKB+e0oR6dmu8+XkSdKTQdHHIfD+HBNPgytWsk
 L559UBH6QgGpRVHzO28iLMhwK4KfDC4yjSMNm4TqMF3dxbHiql7ptOi+uQFJDGODU4HRizyFabx
 5RGIek0yRDX/fGX/wcjkmINsNUlZmUU/sAWB8XOjVf2Zy9aBYkMz82M39ifB/VAwZz/BOHlX6gY
 WrI6UUthGm3aD+B96FZb9H5ElzxkECTGAHSlozO9IwOKR+2iBL6fGK4XoNeZAWyAiJOPJwYkGdx
 6+QJ32vMqAz4fzXkvLIH5KXJy8PvCAJgk6uLWIrEvcMudsyZjrxm4RRACfLVCfYRFwVylVxohNy
 icXQKa+9Fi8q0P6WrOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170169

As per the REFGEN IP team, this block supplies the reference current to
the PHYs in the SoC. So, correct the regulator type to REGULATOR_CURRENT
to match with the HW behavior.

Fixes: 7cbfbe237960 ("regulator: Introduce Qualcomm REFGEN regulator driver")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 299ac3c8c3bc..6a3795469927 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -66,7 +66,7 @@ static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= qcom_sdm845_refgen_enable,
 		.disable	= qcom_sdm845_refgen_disable,
@@ -82,7 +82,7 @@ static const struct regulator_desc sm8250_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= regulator_enable_regmap,
 		.disable	= regulator_disable_regmap,

-- 
2.34.1

