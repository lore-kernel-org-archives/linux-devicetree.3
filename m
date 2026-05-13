Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E13AC0C3
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697633; cv=none; b=mXaVytwBdzBdap95ezgsJXCqI9tR1fkMwX3RnXmTR2K6npO62iCeUFbWyUUmTTGnyXOhIW0D83SnAT8zKUSnJ4j5HUsXAJ2/UB1k8PKVIMqqWytZHZwx92UnbhCL6waedRGBtgiMBQf321SyhsnK/Lvz5LDyDzdjZnTmfqyhxok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697633; c=relaxed/simple;
	bh=9Gkee+QP2+V4ReA/loQuXxXG0CE57ytfvEg2Yf6qXv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzvcZ2dVzQuODaCDln3HJjEC7iYD0dJlYxcUELB78FiV6Rv2wgMEBSbHWMWxn51/VegYDfvFc2o6BMg4tKgmi9PHI/e5BgRL6fiEWmeFIJXn1BxymZMfMoNLAuz4wCqdAGuQWlnPuvsK2DXgE1y6pFdYUced5KB/kDEhRHR1PZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WoXSvpLi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkrJjwCs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WoXSvpLi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkrJjwCs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGwUbx3430147
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=; b=WoXSvpLie+rdms6A
	0VpLLmFqs7mvX7yt9chtzKIQu7i4kg8CFzdCkIIFI2UwwRlP4puzL65A52tBfyIE
	2vBEh77TJIH+b/4Eg5EWaGaxJIw77V+JLo7xj3e5OhU43cc2Zz1wOlbcnQQpygXO
	MxzWk1k5tfr0qqw9ZKIsCoNnE9vnRMVK96q3kmh14kF8ZI+Jz6Z2ENreCdt3pYWT
	olTfZuW4SACGEn+uVygOhkS4GP0IBz9GsPSAeNviQ3KJYiHH/p0lRN2LYEHATH3j
	QyunJUtKCiMcs4hPPAKsbkSGH2dOdBRhwyoBq2mb3CPHX702nC6TFAUWaLaIetTJ
	IQsd2g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmchyu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c802545ae0eso4208005a12.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778697631; x=1779302431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=;
        b=NkrJjwCsvjKKekmeXRQfdxqpyFfNfEIbWjKo3+198109EX83c0tj/VlotDezqJi28w
         lHu0L2WTKlawwN0DqDXJwkv/UJhjcNQkCgW2AUKVZhtmNVmn/xR7+ue4wZUNqq4v9U6A
         dBE7WvDsyUwRgTvxMqEnKfnUd9IeNk0O2V5Y2fyk7TgZ3RjTRsWWiDuD2c0JG7zbWWoU
         HCDTTsrgFIjvE7WK8Xsggq3XcpDz9qoGnqvUKNElLvCrNEdCQMf2Yv/TCbhvvIbngBLV
         WgLqrg8r6cFBYPpX/HZW4dP5/jKjRkoKTrktpOZL5Ee5wOWJd0ioix42+ZRQMV31Jx+Z
         nHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697631; x=1779302431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=;
        b=MZvYlavvyM6VUL1Q69NjhvBPfh90t+VPWRnCS7ZbpXMpB7U4u+51nXOZ2wPb8bM462
         1+72i3pga3hJh/YYgUgxLqO5T2RONrJ+/7y8Zh9n9fFKy4aNcDWT9Ud5vuWuQcDoDhYW
         chq/H7xEFOmHcN+d+lV/oL8uX2oByb2MZNSAwre0DZVvhpfCu7REOgKS0iPZ3R+I0U3g
         rph62f1bOZ1Fm3mxeecmQir1SPBT6nGj8TUvfID8APmxjA0gCO9CAfKjlRrvFpSDwbui
         zdU3z0GNYFENSp1l0xwjNPjsT+iXZdo8Qz5Ro0nXWjQXx/kAW8RUciH4dx1LqaD7GO7Y
         dK7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ckf8jr0xG/iwLgpFQLQrDIIACBKLIzstjxlUl9yAnmmmM6DQU9PUSw6QzL9b8kQU7Xpd0kVNNyQf4@vger.kernel.org
X-Gm-Message-State: AOJu0YyFzYJ5PA74a3MkU+gxcz4eniFKfG8Mcn2HADOyPFpUfn1ZhBQX
	gfQazh+I1778X0rm22Wr1MXKC+b2CyGlzVaP4IZf9fyY+umPqe+M71TpHKKEG7Pp7Q7M+f/yYdB
	tGtc/xJAW73qAEObilsFdNOtDQv8AtlXvOOc38ccArK0dYly9u+OmC8Zng5fqb66x
X-Gm-Gg: Acq92OES8LiLhfVVHau1ethbpg0i3RJr0F2Ne8S5J7jVLd2bf0DWMZxpD2TRPccTxka
	eBrA7nmtE7EIgX5ubgLGPoTrnCNwO/o23XqO02Mt9ss8Fw9YpPCY8sWbSx1tyaveQH74eGGj7oI
	S5KJMYRWjDMJZV+xkaNsqriSk9cn9l/wSCd8XgwJUFTp+CNeJtOiSgNeSoYB7944Epe8P66iDYQ
	pDJMVjNZVfrNBpa4a8StZ48307jk/p5k1Y+3vbdg8n4d4m8bVg0gGFSAT2yUqM7u6Ey1jQn/cHY
	pNaTPhLyzVQ/C/+QpMTg6cWuhGvQSzWWmTZus6nuiLC4dm13UTqv+qs2w9Moca8EqCRQ7FMYQ4a
	qPHJCKPKBybvVA+aISWjhhkNiwweR3sMWpwlhGN4R9kWe+oF9itMgGjWK1iTK1ypHUw==
X-Received: by 2002:a05:6a20:7f98:b0:39b:e321:67ea with SMTP id adf61e73a8af0-3af83380189mr5293480637.45.1778697630538;
        Wed, 13 May 2026 11:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f98:b0:39b:e321:67ea with SMTP id adf61e73a8af0-3af83380189mr5293440637.45.1778697630054;
        Wed, 13 May 2026 11:40:30 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm15271009a12.24.2026.05.13.11.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:40:29 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:10:04 +0530
Subject: [PATCH 2/3] dmaengine: qcom: bam_dma: Add support for BAM v2.0.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-knp_qce-v1-2-0ebdac98e50c@oss.qualcomm.com>
References: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: mRAD7iLiLMEU7xyedJdyNhGu_JZHahl8
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04c59f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RYeHZzZGa2Tlkre8v9EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NSBTYWx0ZWRfX9tQdT2EUvwDc
 FJsH9SGJJOcRAJu0ZeapgDmj8bHY9H5Terd6r5vyxAvFN/4VY9SxdCYizQxgyqvaKMfV9yvvPjH
 E/sDcBC7ZXo8jwpgdCRELK6HhE1D8bghczBdhGsPhc7y+Lw/xHfWvlkE/Gm+dbtZx98+JASxgDE
 hd95EMu6PbkR/gzU5diRdx14RlKoMf0CTzx9hEXP1n3L6YXpbLHuFHHRZLP68X+bGBqgigYNdiJ
 4MlC2aavtQ1jeDI6duJbBPEQm1DxeFa9+8eaEAOlBtWWqVB29qzFYLE0qnfnfV2b3h86a0wovDa
 aJBuvwyGDUEfMsKWXG2AS7ADnJtygPPamWup+p5QhvgZdKJpPIJ0BCUJslindr7uwEFWaq9liDR
 MPfqWJnMwQ3jVKsfw9WZcWTHxWeFVQGFuloa/bkz7YM43PhwP4f92BppvmuwSFcCFV0a2NHz7qQ
 YE88CfX0G7BXdUQ4Taw==
X-Proofpoint-ORIG-GUID: mRAD7iLiLMEU7xyedJdyNhGu_JZHahl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130185

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

