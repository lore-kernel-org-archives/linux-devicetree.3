Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2A23DA7D3
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275364; cv=none; b=nJyXI//MVj5+WPPgUQIVPvxGVZX5jZwRtZsgga0K8U2QNIr+F0ikFgIrtPrFA3D8zFEdQt7WYjFFYtiHsbpNqdmyWbQaVDOecPpgnnpnZeg0DcfH1OwyVDTUCwNSHSUo7WgCw3dC3t2LyCw7NB72VHNfZPTtq+HMhH2Jd3KCMXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275364; c=relaxed/simple;
	bh=oCPQi6pqJjnzYEElWY4uswSYuY/PgQ7qdRL8tbXVe18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bkM/3yX/LLtR0FuVuzhYFRjhKi2wZS56ZnpAEjsSYv1w/HnxLf4j8DFSwftRgQ/cHJYNjQNOr4PrpunaeXvXruBQ7LRSvWXpEW5WGw38bBNN5teXlsl+iiTYtkcYxyr+wYy/rGDdadxW8VKMbph1m17lovoPQHXGJg2iqkG0a1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXByLRgr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQxlkxEb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXByLRgr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQxlkxEb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6igXu2983959
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LSzjyVjG6hrqp81++brPl8d5tvFxkXJ87i4
	EMFI/KTw=; b=KXByLRgrJbKjITkMQNEpX6/TeDLS30yoyDNjFwTM08fdhjJ3aQv
	oFwhGD5N9ogJP1TjxKmxHGIE488U+jjIA/LK4ntwuypi045iO2J62QFiKtnNePQS
	uZD7YbR3jhWG9PPy5zwsiNX70iDnT5oWXqDf5Fn83kGZ9+7+qFnayFW8hzQAPA9y
	DCy/dxLUoysibXScfjOIvjOSjkL+VZI3RfeEes4DIPcWyKmGJO74KEuxm+N16OU5
	uE0SdFPxCa+jBRACKLSeuCQFzxipW8fvZBoWqyLXlE9j5KvPx++BTV/bUuUXYudT
	mU+CbJ9AEwfFvOyu50VbsENpWFJxbaV6TKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4gvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:09:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514d2b22e7fso52546801cf.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779275362; x=1779880162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSzjyVjG6hrqp81++brPl8d5tvFxkXJ87i4EMFI/KTw=;
        b=BQxlkxEbIwDNcMCQnBTVtfwOVzUlLjXtCcB/Ah2RQ9e/1EglbT0JDXbeJMCZoJbsOA
         V0vDtGCvzyZo5cEMPOab95WXZacxGJSrpGNffMG7xnkZEV/DpBm5V3CsrrgOtGfvLvQC
         pz06ufxcldy6dgpdGyJiAK/rJ6wKbgI5TLED4P/yEWoq6MbE5HtLUP2T3IH01FA1P474
         MgZ+skLuYEaqRLVcs7Hwo2fBBS+RFat40HP2G+4emd6GXY0cpdNKc5EV52TnVG59Pt/V
         mYdBQ0K32VG6lFq4vVNJkeRwa9VKQsQNQDXlpFNg8hhKxll7w8ETpDFJPsIYyX544qnE
         8N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275362; x=1779880162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSzjyVjG6hrqp81++brPl8d5tvFxkXJ87i4EMFI/KTw=;
        b=GBj2U3c/IeR+XIV9/FqrxsPNM/968eGz4rsutiGe7TbrNiCtF14g5b59HB/Na6IkXP
         ZXIs4nDRBDUr/F/qXh4th3nSeTkGPnUyqSpuHRy1WFJV6Gf1r9TupAI1I8tZUfc+vP2i
         GfWBsrNTW4u5v41F2kPqVZW5ZN+/MJS63c6UAmDjJYtymJt6KhD84Ohg4qpGajrcWB18
         dsaMCwsJutbpVEOPcU/9bRTdQMTKe5FZ7C8X94UHE+rRS5NHiUQd/7Q7WyWhTU0Sa6nk
         WF2fTBSvNUJhiA8u0oECyR8QUof/mOjFHISzayiDcoRmvbz4uCt17aFmLcdn0AZF6L2D
         cpnA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZA0diXXLKspNpAMHDZogd7B5EmIVj2dL+cFjxSznvbY8VZM+xRINuSN1J6Tz+H8uZtBkNPFXlwEvf@vger.kernel.org
X-Gm-Message-State: AOJu0YxvZP/adL23tfnlNd2t/5k8vxc1LOd+CsXOUzCdZ+clo1spjy+l
	JiVDmGwPOIjZaMxl7qupjZNpfi0cnnYoMO1aUDR4LNlRkflDr38A3PH6xqWZ6grWDUCS8yWWTkj
	7WekCQ6Kh8uGDkfPkNFyc02uq62eJuob6YSDBrXegWG9J8q2oLQafVjZ8IpQs5VMz
X-Gm-Gg: Acq92OGFZlSS2a+RYymQ71PYyx2fWx6BvzDneYpcZdoVPAZOhYPNHx8+7Iu3xXl90Jr
	ud68xHnWmhEjZ/iDbpgFR5btAXLGgIw6BBqpiCE6rvjFCqaAR5s3MA2v0zA8aAmBMB1Zqks+LAU
	EjzTsgfbAYCmcpUbTo7eZhk+LOCVydvPmbLjcy760iXhD+acsob1QSRxrpxZHWIhda0NL4jqT6G
	hSUfMpcziFf1TgKmMOUXPXOztz7YBzATv02qh/gJ8BzBx+n8XN23qL0aCU3UHWA8MfBdUUDDMo4
	rgVzhS+5f4YZQGFVKVUEOtLnEoBWu0eNZBCqFdGyGVgoftPjEtXeKL6xj8O/bdgnrVeSKsf4Pd9
	cs1PD+rR+uD45fXfsjlaEQy+pMmtvtVcBtWcQ
X-Received: by 2002:a05:622a:5e13:b0:50b:487c:f3d1 with SMTP id d75a77b69052e-5165a0703b6mr307282001cf.3.1779275361735;
        Wed, 20 May 2026 04:09:21 -0700 (PDT)
X-Received: by 2002:a05:622a:5e13:b0:50b:487c:f3d1 with SMTP id d75a77b69052e-5165a0703b6mr307281551cf.3.1779275361246;
        Wed, 20 May 2026 04:09:21 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm54498441f8f.34.2026.05.20.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:09:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Correct and add constraints for Hawi, Shikra and Kaanapali
Date: Wed, 20 May 2026 13:09:14 +0200
Message-ID: <20260520110913.87271-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=oCPQi6pqJjnzYEElWY4uswSYuY/PgQ7qdRL8tbXVe18=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDZZZc95YF3PNkoJLMoM0Gi3JS/r6PIDFTl9wM
 0LSdyjF8TKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag2WWQAKCRDBN2bmhouD
 1w9zD/4vDQx7945Ay/ee+ltZNNEk+Qjl5p1UxHJ73ISPPzBJpbg3RF5YGSvGQWk+/KS0nnjzpjf
 gMI4+iLQC3cKX9la2sc4drK2nSpIP4dWS7OiCvpDPWQ3jC5a8sqGp+VT7RMKCdtxs6nMS+HsOmL
 luZb1chLuYTSL0Y8FqN2QyVWUZQCe3ZZNPrZBmu6nsVqvjJGkFA1l/Mkj67Lw/xdegpccqf1uyW
 WF3DTR32yyZJLFmvWyAUHyLBtx50Wi5ENU1yoYV/A6blEXSka7exP/x5mbl+Zws15iqF1Iscn+d
 ClzSWn3pxbLrzqXB+YgoStjQee9kzzfsSF3dzZqcC6iiNSUpfLaP169WMBP47SQ32LKYF0zSGAT
 bDgdS/vYJUxxjS3LQQmTZfGdpVp28xvrobWG79m4dHCE1cQOPA6tm0gILdOLRUX6K6yaFadBaF/
 A1rdPq2CORYpNEgmUBrn6wavKN586NjTnO4CKQ/MKgo8j6tcL8IzV9DmWr5S4O71aqk/P5yQl7o
 EbllfOHpktQHIIpTwVqbcScHjeITL39hDJmoDoU0S3/RlMQxyQbMc8izYQNjt/9zV6UthUBbRQB
 S4eUJyB9DdX1PC81DkzcBFskv/i0zVmEnt4+KoIl4vR202EX//xwNto9LFUmE4u1+IqxXlDo7s7 pPbZCchxmqJzrlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d9662 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=LWJPcmncUgEYCnjaLLAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Bcq8gIJ7CPG15G89W3PfYpes5_O_CebS
X-Proofpoint-GUID: Bcq8gIJ7CPG15G89W3PfYpes5_O_CebS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNyBTYWx0ZWRfX0TIFFCS+tAQ3
 isirIVP0mZe8hwpIGNA1ktSWdNKUmnhwwUvGnRQpP83bHgkV1LDfHyDVpin+484EwXBNeSssbE6
 UTbw2HFPvTsTchtn6vGdnBjTUuADYs56KgkNToavidGC/03amnck+LJbtdhCRPxeVuTfg7lB6X1
 xTqYGYcumsQZ6el/divYcPXY1KrFIgaC1izOBAORKvSOWrleq/Bv9P1GbTmYZ6ZQjOlq14KgbM7
 97aTS5zw5FwLwkeZwkMKPwzjkk6aQ4fFE2aTQrcbFosfwleXZ+NyIwT0OfeUPt06GgGcd+CxoML
 wh6IwBQFfHkD/ANbYM2UkgqrzCDDaJ0Q0cDuwRw8T4BWKldJAxWt4mesG8XdAIBo2O8vH1OLRp5
 r10geVGkk4gmCUYMQeDkMp091ArXHDXSLMoGmub+Y4YygZ9ymMhjC7kdsf2FIhWUk7tHTn8ayup
 3O2e4t60Q9GKBhpqC5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200107

Previous commit 75949eb02653 ("dt-bindings: arm-smmu: Constrain clocks
for newer Qualcomm variants") duplicated constraints for
qcom,sm6350-smmu-500 and qcom,sm6375-smmu-500 - these are already part
of previous "if:" block.

It also missed enforcing one clock for qcom,kaanapali-smmu-500 in GPU
case and missed simultaneously added Shikra and Hawi.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ed0d10157bd6..5103adeee6d4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -568,6 +568,8 @@ allOf:
           items:
             - enum:
                 - qcom,glymur-smmu-500
+                - qcom,hawi-smmu-500
+                - qcom,kaanapali-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
@@ -614,15 +616,15 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
                 - qcom,milos-smmu-500
                 - qcom,qcs615-smmu-500
                 - qcom,qcs8300-smmu-500
                 - qcom,sa8775p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm6115-smmu-500
                 - qcom,sm6125-smmu-500
-                - qcom,sm6350-smmu-500
-                - qcom,sm6375-smmu-500
                 - qcom,sm8150-smmu-500
                 - qcom,sm8250-smmu-500
                 - qcom,sm8350-smmu-500
-- 
2.53.0

