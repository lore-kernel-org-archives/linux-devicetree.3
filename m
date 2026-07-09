Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37442CB12
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600604; cv=none; b=OLe/12VEDF6Xo1r2xkAHMs4KOzarIq8wDUAIAMx/RyachQogFuEp6Co9HHQ7MPafHuazfr1KBl/lBVLYWy8G4Gzn3RWA/ptqv/snQjZ/cPIdWE6pMFsw3a3bCrFg4rKlXohFsjtz9VEwdusUxgPEY3K4dxKBYdyPHZ88nO6X6xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600604; c=relaxed/simple;
	bh=bjemJptZcEnstSo0pp590/SA6Z/0mPTGwSJBOVPEdY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jowacIFD+Y4TbzHn3ctxEaal+j69Ql2X7H4Q44UChgvirT7f8USXYPFHivajCUFyLMWEL1GeuWV6te+eaHdQMKxa/nJ5ubixsj6N/fnQcMhmd4+asZwcNuvniBtct3u9oCg2Gm66OEiX+qby+JKX36voLVKvg/34H2C/Sq1cJ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6Lpo7fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuT30b1X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6Lpo7fh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuT30b1X"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN2gx1657672
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILosYqx6FKZjf8+14exhzeOaCpHPIZxCE7LstY3E8PQ=; b=M6Lpo7fhcH91/Koa
	7YDpTU5Mv+lW4WsJ8SZD0yUlsePY92ILIjBwPBsF6I/jItybQmxZ50GzuNN+DDH3
	b6smDPueKNdCrDIlr0G/iEA3wtRu1EqSzz8ftL/U9eEyQPiqfZEstFkg+dvbSMnR
	KLoOR5VGj2GrC0kKhBXcLe1PXQWtgd4p0v3JN4bR4uygClmmn26UeE5qbUQtIB6q
	DXBCdefdorPaTyZbN+d3vf66Nzk9MRki+SOm+mMNnatp9gt5NIAHlpFs9VWdXIT/
	p9YtSqB5ZAUeUK8uVS5n8jAGka+whToxAGGG8I8p5Iuqndj6cy5lgkb5K7pa3fYL
	8wQ++g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3sjx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:36:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2094039a12.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600601; x=1784205401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILosYqx6FKZjf8+14exhzeOaCpHPIZxCE7LstY3E8PQ=;
        b=fuT30b1XS3/EBzRGlsuYkR4xkhvmDCNSPM/yqSPl01/4/MF9EBzMDCXvgMPaQfWZ5M
         A610GSq5C/BB3upcwQhXJo1d7Fp8v4fPoC3ucAUBNlFmPFBcC49dqGq0ne4m0/oUhoqP
         DGtEt3fo64/Afku5S5USYHYoLqmFlF79XP2mGCE8xAj+IVIa+zinKdaOuYE5qIgRirgV
         pPqe+7YA3E6OP4i1Gpo3F/FyNpoNq35MXaDcP+q0P6RnUDC350GG5vHX3lyZ7h/ZjUdo
         +kkqOafTKVGrehJxPEXSUSEuDtvVi2rxZepgfyTTyQ1k3Rqdvk0TYO9wTfmM9XHRKmvs
         9SCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600601; x=1784205401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILosYqx6FKZjf8+14exhzeOaCpHPIZxCE7LstY3E8PQ=;
        b=Fre+qYU8/9bK0a9kbp1Pf4F4KE7D5VW/cj5cMnEO7nAJCF8M1RtmRKsogGis4rdZYR
         tiq+whg/QhUPkAh7qxuLI21M8PSsiDjoVDwfCCoj+N3DBWy21hv4OGnM0ZnK95SynpyD
         Y/cNbuIL7ftwZHWKUuvFuE/rTGEJ2oPxtSaLbfZKuH943BlGhz5ZJO5QLCTb2CLOlb1H
         WtLC/EEjrlaHw42YAzlgTQWKbcI93AIsGoQeNsfuBWv+LPCXiXjI5Za8gIa01rmq/8Xg
         LP1+GRlniPs+vYqf4rwDLf70buIqV2MyUYipAARGZceeKXWlAYOHuJEvnMXZNrHGn/Ai
         5zmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrbih7MB56j7LCjf/5m5615kxDRMVjpYoeKV6rzDGYan/yqrtxHThSfoFCg08j+vErRW/DYNKtxIyU0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1JXrUTwhqETYhG7LJ1HYd7ZHXOj8REOKObaBqAseUlAE2Qrp
	tAqztHt07NlA+bHeVpsx8sAPBLHM/TQJDPDH4FGSrswemhOxTiAy2cY2xgoWOzk0s+0p821IRVG
	MhbvwvlLNpS8XWA+bR8A0PYTzRaDmag8nKKM5nCMtaIqT4dXFWRa6LsL7hZIOuteI
X-Gm-Gg: AfdE7cn1h54/WRXnF8CMFPG+gAAnRaU1RJ5Cl8M3McZpvH9XGUa0qAuwFlHdwcTOQ9j
	gTEqbk/puaY7L2hqsRavpxm+S9h6oRk2C+7LLnkRlaL5nCrgSXOsQyNnCtDG+SFGS1vjQNDZNZ9
	n1x/l2ob3EMxnJQQREZ/Uv1PO5guxQxEYjPGFOPK0n38sZBgkYgq+BQEq/BXc7iEf9wAbsOlRgr
	TEvMRx4B1rontr7OIzrjuVwx+muFH74HfMF3EOy0DyOoN9oUugCnDR3v3hojVQZfnjnaUB10SEC
	pehPEEKaWlSTiokawRUwpJx4HHaBQsGME0P/VOnIfYW38kMm/ZpadTTd0HMYajokJLOFzEwRyNe
	xxKB7C0YfewjCAKZ3E3Gs9gyl2UpFhCLdgfuUjUErKGwk8Q==
X-Received: by 2002:a05:6a20:7d9f:b0:3bf:a624:decb with SMTP id adf61e73a8af0-3c0bcfc6ffcmr10152882637.27.1783600600591;
        Thu, 09 Jul 2026 05:36:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9f:b0:3bf:a624:decb with SMTP id adf61e73a8af0-3c0bcfc6ffcmr10152843637.27.1783600600155;
        Thu, 09 Jul 2026 05:36:40 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:39 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:51 +0530
Subject: [RFC PATCH 05/11] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=1530;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bjemJptZcEnstSo0pp590/SA6Z/0mPTGwSJBOVPEdY0=;
 b=LHIv19TaajptnO3jVbU2+fzacNw0Ub1a9cBhEIk6d3BIqMNbVmcDpqgb9xLMkpd1LRV/B6HSk
 eQJ4iOCYAXVDFm4GShgxco/PiXZbXPll5PpBwGK3X2q3MCjWB8Ryyqa
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: rLKKv2EJERbMQF1TEQddYnbsBNjvEaqa
X-Proofpoint-GUID: rLKKv2EJERbMQF1TEQddYnbsBNjvEaqa
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f95d9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2w7d1ukKp82XeiQ8bL8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX2Vdw5Ggn7CwS
 c3zsCD9GhPNnOUaicMTS+vNjvumIXxX/+JWS86hYuKcN/dtO5wMgVrL3wCQOvdczIbW6VmFAZop
 GgNB9eDFXgsm+jgLjf/kpqclU6r2GbI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXyAqnMlFzWiYd
 SOa5fP27hi/T74zRbCwqGPACRIM63vGnlsGtI0c0RRjpVQ4Tsgt8v2k7cLGmYXk9WWOIPwJ+mVr
 ZFOtbr5EFWeuQ2Qhd84w7IeQ8ZC+db68AssdYaIChqh76imkWvUU/mpuN68RgCL6SU9oZSBxP8O
 kK2vj8lRustkIg6goNSFqkY0aV6VJ0t67OKx6/80rXnm6ZKU9weeX2zR0qHRJ6YK9E38y+Gt9je
 VrrYuHBDrLzsRmpDDALpV3SONEwfpRqseR5POkKwguFs+Dz5y5+Cs27/JOf8yirkISinONWVHQY
 My4QKfUkR7t6IOOuurxJo1Z0sVVu/Te5al9kFpT6gC4NEvhj9dnzvmt2pppNuxk9msLv5Qs7CC3
 8HjhBrPCute4yRn8T9sHTYQoz7l07nzuzB0zx3AmZE0RCHxMXegFgjhIdc6EvT23tBQg/lVTJlc
 PTiuJgWxp7hCvP/GhEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122

The non-pixel and pixel subnodes move the IOMMU streams away from the
iris parent device. As a result, the core device may not have an IOMMU
mapping, and setting its DMA mask is unnecessary.
Legacy platforms that have not migrated to subnodes still associate the
streams with the parent device and still need the DMA mask setup. Call
dma_set_mask_and_coherent() only when an IOMMU is mapped to the iris
core device.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 0bce4fb1786bc9371074cb72e082219ded4840e5..828e020fc79a7f9c4e8e11c118996f61bcb7715d 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -309,9 +309,11 @@ static int iris_probe(struct platform_device *pdev)
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	if (device_iommu_mapped(dev)) {
+		ret = dma_set_mask_and_coherent(dev, dma_mask);
+		if (ret)
+			goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

-- 
2.34.1

