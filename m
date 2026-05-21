Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3523A6416
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369511; cv=none; b=O73qITRV+HDfnIAVkWJ/XhURPLvgmBarVtJVDZl0rwQ5zTiLB9cYGxHV0kqOQkgGzaoai9g3XcEh14YM6SKCcegh2Tig2WwLcAp/chXs0aIhsRej2PRgN9bl+sZS4Mu4j1baKM56t04dkqVHf/6+976etdRi1Zs1mywlhXlOW14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369511; c=relaxed/simple;
	bh=9DP4WFKs+knnsj8ZwN72mVO6jMAGtfHXV3DJ3PDB7UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POBbDRaPK3Ky/IKXCl+lk0RJCVfsHERe+FBhF6ytSw4dygZNjfGhs5Vaql4arofTVGGhThxs0pe44BRQZ6YkdUP8+2o8zYISHE5mRoD+6nvjI4FePMbR4IRCHLth//yHGW9sT1huPTrwuGnS7bsYldDk5Ov38EeVJTk2eGqS7qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iiytZrnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jred1Qy/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iiytZrnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jred1Qy/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAY35a818999
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qft0FFiZAPIrfw/5RUm0iFHVPnU1lPS4nRA9O8uAxwk=; b=iiytZrnVOPfSTJQd
	PDAaog2NriTLs9XGkmIrDfo6YuTislvWrv7S2lzZ0N2kGCoGyDlyE0jjy1wd5dMM
	KDOegblQw1R4jSmTBidtUd6E1tn/4/IrN+72c5/hQJacT7d6OLITCW7t666Q1mby
	Q54RANrcDKSLJ5S4Nh9s+xdEDKbGeBYfO1f8YEShPYR8o16FRDqKoCuNBWzg1rq8
	YekZvsMEt3+Q09ES3sT78g2hbzwgAVfYFeAc+i8pbDVOD02lNSXseN2v0poF+fGD
	hfHbQS/vpFt2F6uf02k0Pq7+/TAXmTqBdGhStViSHykAm2niS3IyOq4KPkObYCrT
	pz00iA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkgjqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82ac893940so3025869a12.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369508; x=1779974308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qft0FFiZAPIrfw/5RUm0iFHVPnU1lPS4nRA9O8uAxwk=;
        b=Jred1Qy/Tc8FApe3ZHcOwJYrXSsKIe2vIfUAwohskHXE4uyhIf/mPUsr0HhN/Gg/Ro
         fCVPEs/8WJstzaJDQkm0XRw9hcSzDWYJi9Rv6c+EAdUWtM+z9iWUPUtekJcogKnsc49S
         WSQeEldI8r4hGz6NNknvJ0MfGufPmryY+GLRziTf4QAgy2X28dsIdEbXgCdZeOxiR/TA
         LqQ9g1Dm5DWIR9mreJjfKJvjmGip1l7ROfS/FMiqx89tcQFXUfWCdM7j5w0R2iI+hCx6
         hROzXaHnBzOiC/tlNP6KMsBKZfvakubsyCZc4kBxwhSkAb71eTL7bfxSq+D8Q9hTxWvo
         54Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369508; x=1779974308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qft0FFiZAPIrfw/5RUm0iFHVPnU1lPS4nRA9O8uAxwk=;
        b=BrCRGMO4yQs4Jw1lIxopiObr+32ncFMr+vtYax6gSgf/zXDSw2UeTaaEzEBnM4F34p
         OqWBX/YkJywhs1xaQ44xCyHVz/3UE4AJKxBpnPl15kTzwlbxePj+xsRtgM+oiyokaCG+
         KoTd6NUMQUBEF5YQLz+uZj++RhzcEshXPng1dTsAbhEtL977MoKlmA4cE8xHVB+Ci972
         mcgYVUF34Caxper0R9hsjKsy6ANebcbVoFAm63AcsBzQGokzqvkdm61gnMeqgLcGVPWn
         vbpHeIhhC8G98ylBWVLvaPjCwynfDTtjadWG5YsoBx0arm+oi58fuU4PfZs02v5J5mvZ
         FXuw==
X-Forwarded-Encrypted: i=1; AFNElJ+FZWnfyaJcQAW3uVDAql3KuhDkPjrQcla1dnDzfJlnRXPq10nlEA5rSJr51U+ZSdHsf85iMoxPvhNi@vger.kernel.org
X-Gm-Message-State: AOJu0YyZCRuHS31Gz7VHybcv1kVj4u/eolfxmp6IHtUW7R530O/6tb2T
	5mnyx0VLeRB7heDViif+NAZmYFV0moQ/xdrrBujo8QgrT90teZJX1Z4fLn2qwveuoTCYFDKXV6N
	fKwIrpjhvl4FZyfZ1kQ5+L0cf2vPOswj7kQSkZWIl+vSMteqW5bcNKzEr2k30Dws7
X-Gm-Gg: Acq92OEUMtdukgW8i8snj4BjV7MBuBHnMmSQ9lxGoaF6yTeLDkjz4NDjKXrVxqcOBWP
	xmwzTKdFl99riTdRIWkpjOZTdcAEaPrqXrEw9peu6ife3kW/ekRmzNPYLXAlMkhen6XC3Eo+CzB
	U12upKFPDT4hMCXH2cGUvYpdwEe9pTyUGzbj5Zg/pAvDG+gKIDm/LxoVeM+65avDV7gkPyro+l8
	MNCy7hK4J/pLd/9ODXKxOU3zGFh24LrMhqfzreVQTbHEilOC2QQYgvO+TiQUd79C/5fQBwjeOa3
	tceHhnVlFvFkAcwhsVBK51eh9+9i9NJseADBJMkcCseoZ7LNKKMqi9mJWcNSvcgLpL+m8slIvgh
	xfr+MtYHF0aUKcddTwuOUuFRrqFoYSmnCyKQgXChWC68H1M/gK7ell6I=
X-Received: by 2002:a05:6a20:4307:b0:3a2:d79c:416c with SMTP id adf61e73a8af0-3b30874bfcamr3376066637.32.1779369508320;
        Thu, 21 May 2026 06:18:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:4307:b0:3a2:d79c:416c with SMTP id adf61e73a8af0-3b30874bfcamr3376003637.32.1779369507771;
        Thu, 21 May 2026 06:18:27 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm1687731b3a.47.2026.05.21.06.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:18:27 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:47:11 +0530
Subject: [PATCH 4/5] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra_crypto_changse-v1-4-0154cc9cc0de@oss.qualcomm.com>
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
In-Reply-To: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMyBTYWx0ZWRfXwBdcEaeKjYCk
 x6fMQrlg68oCOHu8rr+2ExJVYrjEbSWsfzySXu9AbXkOknW/QM0r8ukChFzhR1ZWKQjtQKq2tDb
 eoXJdMCG0zCILo8JzeFC9E7dxYvNNcd+iCeE7nUXH1N3nFF7k2TfU87MciFxHV7Wur0ZFKk01lE
 A99Lt/kCOo+42g2yCKkxJrDF8KxzsuQdNavUpAB3nUd93JO7jVOvLZoj4I0o14X/dqq+/Mt+Ari
 nggF1NIDidJt4Z1cZrW+3+vYIcqU1ZH11xUJFUlHxkfB5Z1q4dvgAisND5tk1+MilGN+zN8vLqV
 Y7OTfmZWlXtkOuZDCCWZgLEBkTzGqCEloUAwMXHCYLkMe+OL7wpggYX7RgYD4x1pn9ybmHpqRXT
 4DPR14cjT3PS3VcxS2iWcci2JPMMqFXVV2rM8mqUkofDSvdcVoe09+r/jKpbkZ5N4AHUtN8i0Cx
 OV4kNDmCmm9YflVTw2g==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0f0625 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Pn01LGb3GYlZyOwDGgsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: bCKevdA_6J_2gQQtXC4VqOQJqqE1goh-
X-Proofpoint-ORIG-GUID: bCKevdA_6J_2gQQtXC4VqOQJqqE1goh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210133

Shikra bam dma engine support 7 iommu entries and not 6.
Increase maxItems property for iommus to pass dtbs_check errors.

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

