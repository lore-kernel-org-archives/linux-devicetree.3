Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7733D7D76
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512565; cv=none; b=IdSwyMHBZDcplXuPnK1+SElkH3/4K4l9wuiuLVeGSuTuvIme/0kJgw4nkzQr8iJklAgmsar0IIQtSKblmDBPAZ1YgWZCoLIp1Mi5PAADQxlunNJDGhr83Dt5FIlbhQyAdusZfOAFFHb75P1vDeTzXuVfUpLkWrOi6jwyNrRlgFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512565; c=relaxed/simple;
	bh=hBDK+t7sZBnTDtOjkj84KsZOBvFHMonhdCwtWPz4c5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYN0xeHh/N08TumyvpMVn8yOBb2e6A+BKeB6a7ACj3ZK92XtY6MfNeznP3GSvHI7avSMrxWP3kDpX3mi+JCxrh7k/HMBMzgRseQdoyuFlBq35tQPJXJ4AYiXXXDdkDyB61l1WyI+aCBwSSR2yIhK+adY1U4j/tF9gOTcxE/P+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAyL/bzO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDwKELJN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAyL/bzO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDwKELJN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6L1WN3888509
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=; b=AAyL/bzOMh+aA+RS
	Ho51Z4g3xDhJRfaVgx1y96drsYgH6F63x/QiIvWBv6tV4RpUlxDxEGFmD/L9KvP9
	DJLaCAKrQFZQXBllZML2fSxVfELKbMEFazsXnTrAlJZzuujWr3CwFteWVe0sOYNT
	beeMKT/LhGrE+lmrBieu6hOnjeVPi4GHN1Zq3IgxbVqUG7g+qx09vq1xHx/Mn6Ml
	bl4wxXulxs/uxKYpUiBRI0biqQSMWs1GK+CP43r3qZJ4XGzK5a2sYxMVmqCwjKDS
	YjbSso13dZSQMhWRFoCi6y05i8+KxTsT3pZPnG80zNQra0OMaMlGZuTzOqSMfJYG
	FuJTpA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wxeur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:36:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0532a6588so28631505ad.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512560; x=1782117360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=;
        b=RDwKELJN7jIqYmh6NrxjyDvwSGo75W6Fx6AYBAw/vhhBgdPIuo6BkIFfe/WYLZXMGw
         9YMiINZrP/Azbncg7n4IM5tPFPI1BYmtbiHE/on1XUsLgSg7TOv3duWjebj9Xatjqlvl
         DawgMbqy8Tbr2WWNnQNX5aD5fG++TqHYcF85tzM+eRP3mBLAx6HzOWSVizNZ6XfneX8I
         wh9HiIWFrMJsXTiGSi04dGruSsQJqubVqRewDc/pixgpULR8sB2vdQmmj+2Yp/i1PpNE
         VqkyxzBN2Cz1GamfylLT3SaIIsVMzkiA99iF7ByH0g+Jg5izZ0UhMXtbw7zAKKNXKAay
         agMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512560; x=1782117360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=;
        b=Qmt32r95s3rtV3HJcjD9TjU2RAGfTfOYwrvj+m6ubhzs5JkMGDxdiup40SXU2iCmUq
         pghR354RgMNQ7n5Wcdvw/zOj/y6H5y+0uUEFzwduN2oeCl0pbWXHiwMp4xgH4fTQuX/C
         DCtteRj+xRkno/qebPiJbpg2GCzM7waoqMzuaKfHA/cce47c7zOJbtbPdeD1FysTD4jS
         8VegRPjXGDGmYRfDrTIsqn7CbvnAm6TZDvZtl8UCac0Ovj6A/LMLJZEkGnR6soD/gCPy
         YL42nZEA1dSW8a6sGB6UA9QGiyHIZYrN6d+zsFoSr3y4PXVAMMZtKj9DInEG4quwRCQq
         v3rA==
X-Forwarded-Encrypted: i=1; AFNElJ+0TmTeSk1vYRA4iAoGZ2Tcu7pUi34VosdFo+5C1CEn8/XjWOPDePiNX2Y41/FgJFuKZKRgOqHJslQb@vger.kernel.org
X-Gm-Message-State: AOJu0YyYm/xx+u1L0PeYoNms1P2nOU89fUIloXwRAcYR9+kRQ5Cmov6g
	D5xoV/f0sHt/F9i2AYCKsZRXyVtXq1nytOMxhl4eMWn3udD5r6kRt0aejFQooZcysRgHrC4Kr/B
	0gH6tiMtklDhsBuN5W6ra8ZPBmG64t11mCvCyyGhOLmjqhee4t7VBlNDEQ3Dl5+zE
X-Gm-Gg: Acq92OFF4t0V6pZfgAYBkvNp3tTacV8z4ncz1O3qksYjwx9mtfZpzqjQS+LlKqMxw+5
	CNcq1/QZjLkPcXxx4uuzGRGNtqdKk6SdMhFUUtcueNos3Tzbvavy+Nvib3WtcKaL/DYaB59AiyT
	JY/dQ2cj36gURHyw5s/nakVOA0EFtU3BGO8wN8ihCezvgbqKdcKxhe4uh5u1hzRA/hq2nzMNX5F
	hIMjjUUdWdmjx+9Ha7XdOXIjUa4Xfoi04U87DVwVP/muQU1+/cjDFDJQuu50F5XosNZ1gZ5J+to
	zUBn9sUKHP8v7HfTV4OTV5OfBM7ZxzpdkixUKhl1qnHfaZPY6AvHvuEbLiZ9Muj1huEZNCWniDE
	4IDQq7d0KWzzCrRFk5pVy7dRJVOEgZYjq1lMxVXiUZucRTYmm3UNtTi2tqIHZ22GjlhuBwxITqw
	5QcvsXEiBcH6lcqS87Tl9x/L0Xjw+bHqpRvSp4hcG/AN9gnmIorsu6wo4c
X-Received: by 2002:a17:90b:55c7:b0:36d:b680:3036 with SMTP id 98e67ed59e1d1-37c2bc42809mr9306046a91.4.1781512560483;
        Mon, 15 Jun 2026 01:36:00 -0700 (PDT)
X-Received: by 2002:a17:90b:55c7:b0:36d:b680:3036 with SMTP id 98e67ed59e1d1-37c2bc42809mr9306018a91.4.1781512560005;
        Mon, 15 Jun 2026 01:36:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm9558974a91.0.2026.06.15.01.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:35:59 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:05:47 +0530
Subject: [PATCH v3 1/3] regulator: qcom-refgen: correct the regulator type
 to CURRENT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-ipq9650_refgen-v3-1-5f611623629c@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
In-Reply-To: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Or_XKig7w92WSIM-f1LJaVhGKk4vR1dN
X-Proofpoint-GUID: Or_XKig7w92WSIM-f1LJaVhGKk4vR1dN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX6Nq983vOqh49
 50BL2GFlvkZcFZuPP2Ot59Bu3jyfHPCJTbh+8XSI08QcSrOA7Q8vBPZvmCthBVdZyMqj0bPa6tn
 OLBXVlHL2AlUw6kRFfV8ZCy6HpgsusA=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fb971 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VkQhxhI6jZxeKeB4iE0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXxzUqtPKbY3fM
 8UOd+gbVq4shVnqVmYmAkMI51P41vU1nDmQS41dZrxR9paE7AlKRx2nvA2kuGP5eeFTSPVQqkvL
 XEw+yXb3tIFqUkxLMILPlL0UMNaVUqCffrJ3mRBreipsS9QmDshfKy8cEe+Tbm7Vfmk71unDj6G
 BM6ME3jD+cRy7UOibXFS2LWCbbE6zgZ3gDWFCdV2zKcxWajwnFCn8tc0Bv3EXHlhcjU/1jzdwvF
 IeL+9oFwRGjozKFxIghRn33KRhHz1Ha/zF7DW9/+vS4dfmtv0czbHej8h0cVISBxjn/B1KLxolr
 Vr1TRPF7LntROXtW+d57h8iBYvoKE/T1n9gyjxVUgJKEOLYlJvrwdUSgA+NuiALomWGYMI0lIpa
 JUas3iD8vZkL5NfVOQejmIHyt25rf6VHS8Y348Vc3LoeLkeH9wbs7/DniyKT8tF5BikvAoxHRUA
 Yid6vQ3nE01rZ+vllAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

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

