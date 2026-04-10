Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089AD3E3DB5
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846542; cv=none; b=amRnntqkcibb/VSvQ5rzaSQpVozeZIlfB8qhh2jIkA/DsfWSiOKSJeEnAeWer/R8N+GogtGfHE6Cht1Vy+v2WtgD3Ce1Ut/jflEfszNGCST3yjV3dxKjwFkbQyAiO5wbws/rOmmeua2O4K15a4EYS15t7VldUXOazZ0efNIksbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846542; c=relaxed/simple;
	bh=mw7vvM6+HKApmLxOCYfWgBXtsa0fw0TBlq99ZWtHJL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORvca2deR2JN5oLzQSJI4laD0v3vG01tdEKwLlHwEZmt8FbFYqpdPaVarzg4XhaXOFvDLsBmLSn8i9jWed1D+u5UJZgylNJIwrnlu8vTe72PTgX/haGteylnG/wDn55E4HePPCdQ9CHlUxjCPsuXlf9DnPuD9/B2B2kENpWwE3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ek2r+GWI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlJDvuU/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ek2r+GWI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlJDvuU/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AITJrQ3743154
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DoXxJ8NEvA0
	XYqlc3PfgDIa2+1HCBJnmm1ZFq9D7Jgs=; b=ek2r+GWI9t0jgeW9bexQ158+fsR
	9Zf5k9UlctkM2hywVqZnEe1VoRPNHALGatf97uXpftovkRkg2wPEuSdgrdoWoNdC
	A7Jv+HQoZtgSEk/6OU2wzPFE67XaR0W0hTROIZcd67hqv/HwLggVQPCufKe8Tyiy
	hjHFXP1039DBKaj5bWYkxDfUO5NPAAVNif4/uq+2O5lfdt+SNp0otOdJgP+2TqKa
	QAIVFX3j5X+6Xys9K4RhgRhL41qGYAqz3e4qaKoyXf94ALNiDxQR0O8ELj6bDdiM
	1qeybu6chlfnqirymtsuAiCkjUCWiqM8qOQApEZZK3Yc5MFIIz5j3oN9FPA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytnhdgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c89d4ce16so1634721b3a.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846540; x=1776451340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoXxJ8NEvA0XYqlc3PfgDIa2+1HCBJnmm1ZFq9D7Jgs=;
        b=TlJDvuU/xa7jqQ26ZnbQel18zlW/PUOcTHEDbOEZAkWdoU8ZIPLdpLTP3nBmyfi7hA
         v/2gs1mcOEc5YeeDuqyxHUcB7408TX5e3GB3jxgTvVTPdoVNYN49RGzcG26gf8hVO6rg
         F7OTp6UsEOr5E4jf8oDoKZ4WyY6DrQk2wEbTrjeT1CZGC7tw4XeDhbi5o8SDM3H3f0D0
         lNNuHjyOPjgYFKMDshjUqMLBgNSS1Aj9Y07bPyDUbtbGl/KKdaCazfss3tVmVlFG/aXa
         BAip3DGuPZ0pao4tOUwessU8IhoUyK/uLLnnhVtrj4TqTH4rqOqIjmzToPFrzX2AymWP
         lwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846540; x=1776451340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DoXxJ8NEvA0XYqlc3PfgDIa2+1HCBJnmm1ZFq9D7Jgs=;
        b=IBM5ZwFXAeqxF5QMII+4ru0jeBnOuzx5kjearP2acyQqN7SjLF7b8vo+670OzRwdGn
         +51nO1WDBuJT4VvS+ZUEm9vQV9RcuaOMgqp7Lt+dEJVaRIln8Z/hbD6FiadF8XpSiT2L
         MzpJZ9XLuZlgeXBvEf6nq0axQbKnpB/1St26U0F8ZqfbNAeQlRLUuzIRVAN1kCboznw2
         ubVHg7RiEVP4+SX3EG3zH6OqoDT2yd1/mtn/qTDgvCFrZXx/VnFnf1Lx02vohOuFK6kT
         kzG+xn0sk6Z8gQ503/TLlUUP8X/JDlC247mK7iRSfizVzyuMvDwBhT1hHViHIWdzBo2N
         +CqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwb6E57LR7SaQcPHq0ACg6AfxNlcMiBzAZFGJ5OD7OfPSUyhYNse4D7j4zNxQIeFsdSH032KIgOOZO@vger.kernel.org
X-Gm-Message-State: AOJu0Yybn7a7A6g79zpXRmOZWUqF69d3EfSXcHgKxApqXFQhk0Vk/v8J
	8OuO7fGvPaKEoTRbv5H+Bl37Vhck7wqlh8DivK0zdVs4GQmEWKzUpgeN5RYIGKnqvzVlloQgbEX
	Ot8icfmoFiLwOTAHWEnDOX53VesqY/v5FHmaKfJpNnjEu6UYQYgtOsTNu93yNNyv1
X-Gm-Gg: AeBDiettauneTh8pMzQoqeUcbDdpUmbSmMRHI/JyYiM3a2LiZnhasBSdP3FuZzRTAp/
	nmyrMVRDW6YV0Jr3+9dX0qQimWU34+VbGdljgeFg+96a3W8uhDscX0kNb2xWwQ1npd2jo8vJFS7
	BFkckIjYuHqfC7PPah195t2KZXzKvWqPOSQ73KvT/8C/ozBZDAmgjmIlPaLBkaentqfNRUmAo0x
	9NjghAzoDW04OHKZYZjebo9qV10H3k5dYg7YG7si0Rcs1OfDsu63YgzWqP3fpj/quB+RTfQbvtx
	GoEq+4T/AtTbnVJgKRxL2zKE6ZK0Nq/1JHO4tO2bw8nyYKuaxAEkYZWiPK1ewPiRYFTh0D/COF/
	YVmD6+tQlwJ4NccLVo5KVvv7OvfPlDNYlYpkaOk0uAGaRsr1f
X-Received: by 2002:a05:6a00:ab85:b0:827:3ff6:fb72 with SMTP id d2e1a72fcca58-82f0c35e51dmr5159258b3a.51.1775846539397;
        Fri, 10 Apr 2026 11:42:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab85:b0:827:3ff6:fb72 with SMTP id d2e1a72fcca58-82f0c35e51dmr5159207b3a.51.1775846538859;
        Fri, 10 Apr 2026 11:42:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 04/35] irqchip/qcom-pdc: Replace pdc_version global with a function pointer
Date: Sat, 11 Apr 2026 00:10:41 +0530
Message-ID: <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WKrRxR0T_91i1ctaV3Vz2rvsGik2JNYa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX9cnjQY1Hjfzv
 GMdHE4JVRWXcHpjX8231bh9likZj9y+YUqzCln1kSWsaEvilxeDhg8jhvDgUN1PT7AJQMrNHKoT
 r0Tc5GWh6alf8zR7gQiJw5B/46Y5YLFBAdb65Q0ReJg7A0TntGdg5KCWiaufXU1yllzutQ4w2X2
 3yGYlnq799Ezd5C6sL8n5IEtuhMqUF+AqN1x7DrzW0Mq5JH2mT9BmJm6TQzeugXMu9wMDrvSZuv
 dwdVHbXS52f+d3Eo8oUo7U7ftrVkF99gozqBaRAcRrL98CDlzbP6yqfhEQORFaEb/NYr3uXgBZS
 0i9LSgklSnSN3rKKYhSXcAs3W5L7WwQ6uTX2p4aTAzjCZTSgWWxjgaQdpN0WbgQJWhgQU9S+OHO
 TzhkWO7/TZUZGDo/wOn8hDSkrbnQS5rcA4g3Pw1BNtRaXCuDiYs4+4RvDVjPhHfaxeZfetTe6z7
 XHhv6xQGJNM9/vSd2ig==
X-Proofpoint-GUID: WKrRxR0T_91i1ctaV3Vz2rvsGik2JNYa
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d9448c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VJwwGsi7nLGkcN4Jv9sA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

Now that the two enable paths are separate functions, replace the
pdc_version global with a __pdc_enable_intr function pointer. The
pointer is assigned once at probe time based on the version register,
moving the version comparison out of the interrupt enable/disable hot
path entirely.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 21e2b4b884ee..734576cdce0c 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -51,7 +51,7 @@ static void __iomem *pdc_base;
 static void __iomem *pdc_prev_base;
 static struct pdc_pin_region *pdc_region;
 static int pdc_region_cnt;
-static unsigned int pdc_version;
+static void (*__pdc_enable_intr)(int pin_out, bool on);
 static bool pdc_x1e_quirk;
 
 static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
@@ -123,14 +123,6 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
 }
 
-static void __pdc_enable_intr(int pin_out, bool on)
-{
-	if (pdc_version < PDC_VERSION_3_2)
-		pdc_enable_intr_bank(pin_out, on);
-	else
-		pdc_enable_intr_cfg(pin_out, on);
-}
-
 static void pdc_enable_intr(struct irq_data *d, bool on)
 {
 	unsigned long flags;
@@ -400,7 +392,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		goto fail;
 	}
 
-	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
+	__pdc_enable_intr = (pdc_reg_read(PDC_VERSION_REG, 0) < PDC_VERSION_3_2) ?
+			pdc_enable_intr_bank : pdc_enable_intr_cfg;
 
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
-- 
2.53.0

