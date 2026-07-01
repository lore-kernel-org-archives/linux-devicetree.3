Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FB72D0C97
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 20:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937087; cv=none; b=W7paNg2HNOKpchRb0EN4mUoqP1cQqQmzcdO3SPMMf/viInlyCs5LWLl5eCHA86Jq62xVYSwDr2iWtg9yBseREEPPaOWiJdTYZsyh1lz7h35aT7rHEPgUlbuQSDl6pKZOE3mJW6Dm9ErK8RXHMSA7AF0MvXAOIyd6psTumjfd9MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937087; c=relaxed/simple;
	bh=Eze2ioRdq2rIO2XoIkqX6nNtdm7cYbxnuQNbvnOoajE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwwlm8C5oaGrDXcEC4NmZ+kyYFRZJQCbaYDWh4UQmXoxn1NsfGC8WMLKk5POOagF1Epxfb21mqrfe4a0yA3NnYvYWbhMS676ondZqIyt/pWrNDRdrKjVCGeGcD4JQTUx2dx7uGmDTNluRLSDuEwSdWBU6p097brPZHNd6p8jg10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEJPQP4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyZCzMsb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEJPQP4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyZCzMsb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmZei1627034
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 20:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qyrH2W2sfwjDNEPGQYVoT+aVr52hlGBGd2sgUDya5+k=; b=dEJPQP4ITFS8647p
	h1fmsJ6dgeHyDHH0+enPUAWqOCeh1Yr65C8UKnFV8p9o79BhLpbdUvmaurmgO7AY
	DPpkoYFpIF54KImEGqGKZuvM6enoLDQ1kfpnw7mzWtN+1Ts463yYTdLEjGl5SGi0
	bS3bEc0yTsCkStI0rDPtxUm5TLuuv7eGq50XB2VQ4LhtzJzsLtkL/k72Q7PSQgGw
	Fgc54XSFKcWFbeOmMBFbfbcMQzv29pn9KbhCkGOUpRJSJrKUAB6dgRn1h7zBXGMZ
	9wZxbv1C2RX1v10x5uFDO/J/BYWwz0riN6wZY6CFXxdS1gwJmTIfaSTJB5FpxSkz
	sGmYew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563090u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 20:18:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e17ec1940so1138313a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937085; x=1783541885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyrH2W2sfwjDNEPGQYVoT+aVr52hlGBGd2sgUDya5+k=;
        b=DyZCzMsbFma8dqvNj9z6kgZ/tHWOVe+521VBvxU0VKMTAuJFA/94MuNMMznwmqaULP
         16J+nT9AmNr6Iw7rI1d2R8uJxARP3v2QlWzSx32UF6i7fz07YE+ZGqvyVoQ4P/CAN/h4
         kXW8eM293iERZ5y3qaodbNUykufBM5U4beVZR4T4fM+TpCFpkR1paqS2WNGHOFmZtAXu
         DMWEKXvvieYUBQ1SfBjIUsom0f988yvaTk6ZWZc4ctp8XF9+CHveFacEDgWuRAy/4QE+
         /oMklyK60R8LkuueaSggzu8I6D/j00ubvjzesEBQjn7n3kROy5ey1bkq8bk1l98US12D
         YZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937085; x=1783541885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qyrH2W2sfwjDNEPGQYVoT+aVr52hlGBGd2sgUDya5+k=;
        b=CN3OG98kupuF5W32lmd3RXgQS5NSW8h29rNN1k7KMCmq7yX0jbOAcMymhDkM/CYptK
         CkemKWpMaXDpDL7tI3em/k+s5BSitjNtA6Bt+keP4oOOgCabvZsFZOdNzmYVgCrKSg1a
         GUulVdShkvOtISP4XB414HHDIYhc+xhBzRW57HXvOv7XMK8k0L+VxZRO0q7lPLhZoweJ
         IyfJRA2CXLgmlmTT4Ccj9NGjiQdDCtVZ1FPcgL8re6n4eOen9bFJvhEHDAWSWlVwIbm9
         HZKVEBdssYTtApnXLgGYKbDA/BXNFXRCNrT5C4g+Ettjenm61SgQ/X4OOrYes/iYrdIL
         U4iA==
X-Forwarded-Encrypted: i=1; AHgh+RpcYe2sJU66wllpRo1UzoVVtJGHxs4BFtG9GEc10iVz81Zr3dg7RdwfM9COgKFWcoZ62N+AqOpLfMon@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMVrhb7CQe0a5jkq7uqWelACeUhjQF9di1Qw5jLYDvlqpMgos
	Buaf09VNk1b47v4nswT/MmaanGS3+P42Td5xQIRRA8Nux/2KCV2OBrkj+RGzXUS7/8o2Jl6/d8U
	fjve9QGdqCmDuk2QslVc+5BD7P3CWMacJnpm4EXNGLTKG1AWNxSewn/+5A+k+ng1m
X-Gm-Gg: AfdE7clc+HVpLM+zj2+98kfjb1lLVe4vQMl6tgMN00zOApTxlX2DJkmWek1DwvFPhIS
	pOWZdvj81OSrxcGJV06NInW2HB9HyFeJWLK4/vcgnHjPVwyG5o7eo87XTEyPgtqcHioCOuhC8/2
	P6GtIyPFPo0iGsR4d5+YnhJx1pf67dkaqtEp3Ou9V6G9Vn+h2MohzB4rsaUtdox2f3Mtfvtawpa
	YcBSXBNYyiYUFJHugwk6vk0TkJj31E3ygFb7XEaGW8pSPuIvC2XBY5EKQw42vJXgoOzVn/R5SXX
	Vj+xEdsa2YPmVQlWMOMUQRAGLVomkk8Fp3n7YsXeF8TgaLpn4/zdTCS59wUzoV3RuyLFJD/RqIo
	E28Dkl1XQsIIYp5ci4We79Qm3VJ/DseHujPA1RMRgG/1H
X-Received: by 2002:a17:90b:1fc5:b0:380:a5a9:7586 with SMTP id 98e67ed59e1d1-380aa09529emr3081013a91.6.1782937084688;
        Wed, 01 Jul 2026 13:18:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc5:b0:380:a5a9:7586 with SMTP id 98e67ed59e1d1-380aa09529emr3080968a91.6.1782937084168;
        Wed, 01 Jul 2026 13:18:04 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:18:02 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 01:47:15 +0530
Subject: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a4575fd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=SaiSOrgfs3erbmmhS0kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfX6qR8QKSzeQfx
 BZR0j7JJLQj40KyX+vXMWr5a5V3rdO2sTSMlwY6esHl3WYNj8+ZQ/HoWgjonccCkfwKb4/8S+z3
 Hhq7IoxSe3Uiyw16g7r64UHx4LYFavs=
X-Proofpoint-ORIG-GUID: RR3GTQNSwZ-41tZLbmP2EZ-Hny4QhkR2
X-Proofpoint-GUID: RR3GTQNSwZ-41tZLbmP2EZ-Hny4QhkR2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfXy33CZxhItOUv
 5speV/jRBXDuuyJ76rZlRJqe3a4jd9PPQu7JW3zLwD/hj6B9GkrMQRA3aXwfFya7JlXg8+qWzUQ
 E4jUp0GfayIKWvOMihiqO8YpCv5D9FfAsYqG3vBmjq4px1X3odH2spBbkhS6Os/NhfVFphFmcOr
 MAwqwrFtfKe33I6pr8t+G007O4yyFmPycN2Q7lv4QgcZI6Qh65dnkGN3BGI9JmDKhz1s62eF7h+
 xstK+vNylWMTJHNIHmRAfX0STOR1v2suUgnDB8U2OLqpawMKNN5NFAObAhXxnHUxbRA3XD9teRk
 /KFb2dYk/pmkUNpyyCyLj56pteqjImKu6bjbdWT/R9UQNNObaclDd0vwtJW/SuWBkTSIDukuUAe
 7yzW3RRJDS2JuobgwIBkrgtnAH9kvYNGiECVCg44ycKO3at4oJX2YDhek1x29wKfGvm7XYSE2Y8
 kqpu2RpFvPAX8OKoFrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010217

Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
`iommus` maxItems constraint.

Fix below error:
dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[25, 132, 17], [25,
134, 17], [25, 146, 0], [25, 148, 17], [25, 150, 17], [25, 152, 1], [25,
159, 0]] is too long
      from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 0923fb189ada..e72adc172af1 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -48,7 +48,7 @@ properties:
 
   iommus:
     minItems: 1
-    maxItems: 6
+    maxItems: 7
 
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32

-- 
2.34.1

