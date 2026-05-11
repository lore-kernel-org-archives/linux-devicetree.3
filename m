Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE66371CFF
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530067; cv=none; b=TAUXdNs6ez8x3SqF6c7RBix0jvqSaoIyevkrFS34bQ+5AudfmQWlHcS3QJGdU2AIkmJxdyZLp9cxYx476cj3FBT6YVak2BAUNsjvJvLsyW7mX0Ly5Q0R/JorA9hBxl7CNg/z+WInzI7KS2nvYDY9zKtUru8pw0xJBK9fSetM4RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530067; c=relaxed/simple;
	bh=+Y9gYZSkWF93iB7//ohDWKNnMjwm/WhLykXaB9JYn4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtImBa8sKoYeMWAuSLbvs52yC/7sFN4Tlw2IxRGl6WBaESdv0kUT6rpFucdsKB2Hsyh7xSwaxbeUn2dtaAgssWvK2RWBaXGYh1NqKQGF+/YwsmG7IfoMXg6kOBq89YVI9QzZOIeGWNAqgVb3TSjNxYy/9UR6BzQGnwgBQMcyrWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0sNjVXZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf9ScqxH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0sNjVXZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gf9ScqxH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6fJP2187255
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=; b=d0sNjVXZ00zjAlIZ
	CTI3mnYjq7UvHuLR10YTbJX6asgq7wSFuh6rLkXDFd0BDc6Uay/w9VONomeNe1ju
	Xl5yO/BDTaxKhX+1Fo7yMCz2YQ6WS0MQGBG4nng9HUgyXNUBtYSq+MAlMt0HHXwB
	GF+jPPIGEpgGRV/tAWUzs0+4XhinRkB+USOQ3o8zfEi39QhstLjUfkVGbvQu9CPo
	jQ43yWSwcTxxvTyCfCU+OJ2mbY3Yupn1aTYQT6bXJFKb7MkpmFJm/9GszbX5+cP/
	uOj3DsOcMANKEq/eHvAJsCtWRNiBq1GfvHVt008tluahGNewFxp+7JUCu4xZQK+l
	fHJcfg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0r059-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso51724025ad.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778530065; x=1779134865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=;
        b=gf9ScqxHYn6bn7/UKeO1DmDbg96AYQv+xVUKVczU0qlT0wyIXzzeJh4rtFr9wnDbhU
         mboMdRAqS56n1JWCI+l+4hPbbKP16P2NXLRxjbrnENx05A8SQCarbwsxTHdDn1wCU9yW
         J23Ns9ghMm8/qhKuz4yDvHr2dM10d0LHjDAZVcY11zhtthQOJ1JczKeAkXfncNmhIniH
         ckVVPK64s3AC67iQKEOYRwUqi2hXbEcgWZryIDS3w4eu4ri309SIauH84AD1KilvokDt
         1geq+q0smSguhBU7pL3x9YyW4tcGZNsbGLTdnE1VWRXktYthi6LnFVsSlAS9QS5/J3iU
         M0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530065; x=1779134865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=;
        b=pixlbnh7cLR6vX36I0guOSNYTiOSfCqmfShk4oMLWujZzXjPbrwaRtik3bXbbfp76b
         dinXxzLEwNI3bXoO+iGxy9d51N7BCgE6w3Ei5F7BM8NSRRFUkgpUNmVku8lp+e/z+7l7
         lxgcx68RPN5t/eb5Ytx4D0P85Egcq7V+1M2nqsC3WDirzBb542ol88YhBtlUeS6BfZla
         LhXH5Gkc9p/9EIMOphtAKJlIsrrj16ZUmYzTZw5KZF4gLK3W61ju1n10W9ySLVCMLRs0
         N8USLJMblP+JCBqBPUiEB3S6O/nTm8dYt6outZAGnrJ9VlopZtTFJqE+BXWKNLluJw7Z
         KUYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/A5TIVE+gehGbj5kafvTxgkm0ifh5dNnYSWUnNFEhrAUxYW4W4s5VFuyAs1syghX+EmuWYvqVDekZY@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3gPkVNY2Si+9d7Z8Yjh9/gYQneSNmEoBIBQjkNVbjSFSzUWz
	eqRFAeL8ycxeeC6/H1Ad59fu+FXVTdFrra3GVo+ANhf8lFi5rs24B5duQYkSWp9cZ5Up/FgZB7C
	ihkigQC9duWyHF/mXnJ+2BlrzMwn7yHMruOIRNQSNJsOGluOkohlhecHTfkN5225m
X-Gm-Gg: Acq92OENNvhVV1E8fYPFJ41oMvR/PIE/WULuEpuIzOsewxTu5AoxWAeZs5KY5tZ2m7S
	/8HkWxLW9qqkrNf/vKtQySgbhw62eyCYECPGsDoF1UR0/Yvjk6q0T+HEnHR1/F+DeiFg3tjUDaT
	0Xcr9c5i8IFz2dE1sBDGnqgP4pIJGp10H9yJP124dYQlyV9vB5CN6TJPtl7InvK7KOREJIbl4TP
	OWTqQ6MScsRBmJNEFugsZOk+vzleESuaNWP+SiGrwOixv3OS5WfVIvdjdBtRaBy76/BtnLv91yr
	JSWuIccDJKi8WTSrtv+j3Z6yncfYWGc0J5VmSh8njJNNvfWdS62Gxdhx1BckJK+fSjOVfDSqdIR
	k1C/lh3dAYCq+2rtu9trjPYt8sGHfgcfleMtfr0YAK9gA+g==
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr16833871a91.8.1778530064932;
        Mon, 11 May 2026 13:07:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr16833821a91.8.1778530064377;
        Mon, 11 May 2026 13:07:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm64911a91.5.2026.05.11.13.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:07:44 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 01:37:01 +0530
Subject: [PATCH v3 3/5] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur-gpu-dt-v3-3-84232dc21c03@oss.qualcomm.com>
References: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
In-Reply-To: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778530037; l=1014;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+Y9gYZSkWF93iB7//ohDWKNnMjwm/WhLykXaB9JYn4Q=;
 b=jpDwm4lo12mTRBBvFYCZVHEtYZLK8NDrYV9uMGhiHEVL+Az57pN8vnvippGmyAb6k9Dwuf16N
 YUJoaxT0HNWD50FrKsL783ODVVGT63eaKXS5O2cosQz1DA71HvFyD4z
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIxMyBTYWx0ZWRfX6QiaCJjaURB0
 GUwu5HQqqlLrKLSHwSHlFu2yrGrYGio45T2qd9/Fum2ozQxXI3jKsahbVmslYSsmt2WeHYyqTg5
 e31qGQ3VbVyJd+xD8eQiiv8VUheKa0QkFYXEYrxxriJA+0aR3UD2MdR30+T8uTx4kK3Fhy7knIg
 kbXgmRGcbH+lFH2azPT7+pw7MmLVdJYYTNany9iNsowuFbCme/4OQsC5b4YHO5VzEYN4tnPDoQA
 LAOM+m7wNCJ6f2USeZ3b21eETpEvHUUPA4jHL3m+TeT6+e840Zq1p4aTOQwmUM6KkrZmQD9iLGL
 wfXvSp6kkjSQC36qrhZM67FBp233Ghlh6aGVHmGMV34B6EW892982wcegdLKqyDJGQPy+yd3y2u
 +4bOw7iUci6990BoTR+qLwbM2PDGEm/XVJw+rQ7NojqC84Xpbsv+TBfgReVHNZZJ090bHxCwWDu
 YS0z6ce3f3lNlggayQw==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a023711 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RQVZ3Ks9ONUmwc3llXAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: l8cqMuLDDQH20HTKEPaCtSi6SynJ2GMS
X-Proofpoint-ORIG-GUID: l8cqMuLDDQH20HTKEPaCtSi6SynJ2GMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110213

Add the interconnects property to the common SMMU properties and extend
the sm8750 clock description section to also cover Glymur since it uses
the same single "hlos" vote clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..b811ece722c9 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -566,7 +566,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8750-smmu-500
+            - enum:
+                - qcom,glymur-smmu-500
+                - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500

-- 
2.51.0

