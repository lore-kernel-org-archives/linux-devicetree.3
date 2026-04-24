Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3193BC687
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030510; cv=none; b=Fn9/nr1gTU6AQfq77JoS12dunSaG+dpobLsGo/CZJTTw+KrR/w2n6eX/+Rb+jVfa9O0iFG/E/JiScSs1hzEEbk1WizopPm6VgfvrtxSF4VW1n3TNSnxG034W8Cwm0OCpxGYw+4JKYlMKuuvvQHOmvkIeYQQE6hHnBhGVvjdq80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030510; c=relaxed/simple;
	bh=9Gkee+QP2+V4ReA/loQuXxXG0CE57ytfvEg2Yf6qXv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mhgf1c859L6WiM6HkqwtjHkQW7G4W/BQvCpU3KzTPWXLT94eGnMudjj7ZBqUko/ysusYAWhmhPT/FPLz84Fa+Wq0D2O7fqF2znhp5VT/GLQz33mbJpz7iBN9ihjmYcllq6ZynPYv7/Nj0Ai6uCZByTP7k1k7dA22rYBbOYUDogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxV9bM07; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwmgZq2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxV9bM07";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwmgZq2G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9Adij1532371
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=; b=FxV9bM07QgXDVZw9
	D0xZG6SfITOrDYHkmAKGf6wbpEhqOxlK3zG3Mto/xVu4Knba8qjbSk4Er323ASsQ
	ZUfJSBA9NUFAlgA/iiFVrUdYtyzBP2kfiqTgSf1p0POPJiCm7WcCFOxgbcCfvgcG
	7b+7HJ7vVL2uaqq6VTPgn0uryfq78+6OPTcmOO8Di6Vz+nld+LXX0vIxblIxIRPC
	POOMMEbohO0PZAVfOHgRW2zKmxO5JTIU2QQWbcGz5k/lcwKWYAuTUp4v0WrS4f03
	64CYRverlYI299rgDjelPjuhxZn8pnA70T7dVmpWKOj0mujfM0O2c50FnUPsW4rU
	rLxgiQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kva7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:35:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so9402358a91.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030501; x=1777635301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=;
        b=ZwmgZq2GOlzXp5Uus2w+VURbQePwC/EJ1kW6HW+y/71+LRVIoSgHDCNFoPp7zowTAF
         FYsePKHpr5Vs2g4OlRHTtu5xwSrOwwmma5dXKE23St+x86rftTHvg/bXUKb5II94uFQ1
         Z2fcl6J28ZSWnL+21uT2NkrglFgXzcVsBKWDuHoqd0z/wlbvX3NzUWgOYwi3krapBcbe
         59vLOsouw750PPf7Rcc3Evv2hoLfqhHwfIHmvHv9O9TbTjQd8xAU1ccjKUwf4Eu468jn
         1mIldjff473kjYmFAZUQh3qy2oeW7L3jzFeXEmBEXwFmCo5jFl/Dvs1/3OjMdWdsg91C
         LkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030501; x=1777635301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=;
        b=N0EBLcM48X4BdOt1KNtTDsVNR9qOkhw5Zjaj7B/zBFVWehbqv3Av+C0ZPhDqh8XZd2
         HEgd5MlnJJ7ik8Oy4Nhm+tQ/BhkkrPROTEcII6AihvXLeQwTV9jmWLhk03SirNqjpvai
         54nKrFpYOVL1vTRkCnZn3mV0ali3SP3CpYl9eP5yqfpFxJEB1fn13H7pndhC4S9MdCrf
         GDz1TEEJ9iFbE4x9+/eaRPDLPofONznCCHmslnQBLHu35KOfmJW0d6X7ZBoTS8ogbRTg
         fDkJde/09OxddWU48P9kDIdoYWJr2yKirz2YZloBdjCdE6FGpXt5xjx7kBLqaFH//NIr
         jGgw==
X-Forwarded-Encrypted: i=1; AFNElJ8749POMkDNBZgbrnsxtPeynGHDmTsPJ7RMAExdDEi+UVl39SR7yprHuBYtjHEAzri9UndVf7m0OSw9@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlIHMt4flvMpSmaRtuwJ7B7uwTDsrXjVRNrSX5anfwDTXG+vs
	pWOc9iDs5/mIYyG1ci3mhpVaffsZanArPlwecJgxEZfVEPgY0B7XG4xmT8fnBieOKR9XuEX1NFp
	KugBtYnz15pxRk8t2tJ2qZ8IeiVx9E+YhWDAniYv12/5X4f3vD3WdYV6/+HsQEyCQULqAjizW
X-Gm-Gg: AeBDieshNoWgHo3CyufkFh30jhdveFPm1TUZxN2J0JkQLgmvgHc0fmoRHMtpeQu4top
	GMDNXvLWD/kgrmyrLvJsmnIANRnmTpjc3QXwMBTBwCazYQa7eEObQLKz5t5rxb/56+zFyN4wLX8
	7JbjPZm/MJ+9I8kMaZItu2VoS5f8lHSkGmDu27qcN26adFG8gFsjHrTYrnILPHQ4A3w9H4JXQJi
	9pROGo8CnF6IkVjY45/LlAkpDXtEkIneN9q0YYWUjcID9TRqsq65q2QAyBQ1OuXj/EMP25W6M/y
	3wUDpLDeGzviueeCWpok6wZ2BdLuPTfCWfOtwHWQL+JWzaVnCrOLIqVNwtiNTlqt0YfFqqaAcvV
	dJE2hwo50la69rPxSZJMobCFObbXrTF3zKgQEJBzhhnbIyy93PvIAIzyJo6xDX4Qn2Q==
X-Received: by 2002:a17:90b:5890:b0:35e:5723:85e3 with SMTP id 98e67ed59e1d1-361403f12ddmr32763131a91.9.1777030500618;
        Fri, 24 Apr 2026 04:35:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:35e:5723:85e3 with SMTP id 98e67ed59e1d1-361403f12ddmr32763084a91.9.1777030500150;
        Fri, 24 Apr 2026 04:35:00 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614186adddsm24204734a91.2.2026.04.24.04.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:34:59 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 17:04:16 +0530
Subject: [PATCH 2/3] dmaengine: qcom: bam_dma: Add support for BAM v2.0.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-knp_qce-v1-2-813e18f8f355@oss.qualcomm.com>
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
In-Reply-To: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: V9CG0X0L5QzsR2EcuJFMUlc4bEnMvay3
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb5565 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RYeHZzZGa2Tlkre8v9EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: V9CG0X0L5QzsR2EcuJFMUlc4bEnMvay3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX9I+6hxTS4e0u
 kstWTNNx1Mih573d0ycekWmHK7oK1dXk9L7dYl5r3tH/KoTy1H8kzHiZr/dVYz8jttJL8sUvcVZ
 yO9WqG3xHTjymEw7VV0q2vRMegXGq1Ov6D6WIvAaZ5bI3L4XjwgFlHzK1QXu115zNiKLXu3t1K6
 p7+IgdFbAwaqMC6ImhAg/kwdV+vsfB9aLx0du1YsrpF6zs7bu5k13yFIFZHWjc0YEXzyIbuvfpA
 WUBYPANVPiMTc8KEVVe16ZJqXzoJ67hCo5tyfnLHaiWLeAbhlZJYVAJFjrdtUN49BtirK1rdyLB
 rY989p1YUiaQWHU81NtINdLz8xwcAAdoZkga+/r7NcRqUhX+6Hf09N3zSL9iSsLs46ihTHVn3KZ
 IV9dTy04ilww42aZucYtLt/tqnoCmB6/FplF4na9CIQoO3y/MeFMQRF02R5IbALBFNs7PpZOskZ
 08SCDyhVX7QZWqRd1Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240110

Add register offset table entry for bam v2.0.0 version found on
kaanapali.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f832..1bb26af0405f 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -199,6 +199,35 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct reg_offset_data bam_v2_0_reg_info[] = {
+	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
+	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
+	[BAM_NUM_PIPES]		= { 0x1008, 0x00, 0x00, 0x00 },
+	[BAM_DESC_CNT_TRSHLD]	= { 0x0008, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS]		= { 0x3010, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_MSK]	= { 0x3014, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_UNMASKED]	= { 0x3018, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_STTS]		= { 0x0014, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_CLR]		= { 0x0018, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_EN]		= { 0x001C, 0x00, 0x00, 0x00 },
+	[BAM_CNFG_BITS]		= { 0x007C, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_EE]	= { 0x3000, 0x00, 0x00, 0x1000 },
+	[BAM_IRQ_SRCS_MSK_EE]	= { 0x3004, 0x00, 0x00, 0x1000 },
+	[BAM_P_CTRL]		= { 0xC000, 0x1000, 0x00, 0x00 },
+	[BAM_P_RST]		= { 0xC004, 0x1000, 0x00, 0x00 },
+	[BAM_P_HALT]		= { 0xC008, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_STTS]	= { 0xC010, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_CLR]		= { 0xC014, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_EN]		= { 0xC018, 0x1000, 0x00, 0x00 },
+	[BAM_P_EVNT_DEST_ADDR]	= { 0xC82C, 0x00, 0x1000, 0x00 },
+	[BAM_P_EVNT_REG]	= { 0xC818, 0x00, 0x1000, 0x00 },
+	[BAM_P_SW_OFSTS]	= { 0xC800, 0x00, 0x1000, 0x00 },
+	[BAM_P_DATA_FIFO_ADDR]	= { 0xC824, 0x00, 0x1000, 0x00 },
+	[BAM_P_DESC_FIFO_ADDR]	= { 0xC81C, 0x00, 0x1000, 0x00 },
+	[BAM_P_EVNT_GEN_TRSHLD]	= { 0xC828, 0x00, 0x1000, 0x00 },
+	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -1208,6 +1237,7 @@ static const struct of_device_id bam_of_match[] = {
 	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
 	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
 	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
 	{}
 };
 

-- 
2.34.1

