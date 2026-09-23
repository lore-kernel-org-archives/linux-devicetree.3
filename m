Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811548641F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159209; cv=none; b=lEpzfNLLnD8hyWaXTgVE08ASYzJH046rYEqmyAnjfWECojATq4KPeuKwZ87d2faIXPEJkVKF4h2EKUAEMULmxaffIRJPdjvQUr/Z0yrhbx6QezLSQKebSNiq10pXbyvVv09fYPYR+0L2k06csD+NvrV9k/GpLBIE9caXyS0CmiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159209; c=relaxed/simple;
	bh=enyT8E+9AK26apYvWRrZ3yOlEE4CZOhJwCOlmwsJANs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdF8nkOkgaPBiUf1xUO66b9+zuOnqDGRycse5gT05nMaTNnu+jNUXxJIJlYjQ5Qrbr9rnRmhx3J6Y0GhiYXbsfCQxDQ8AGsIXNDRM8nI7rMu7txLhTsB604UVYkSsuTPNNKEWccq62bSjrt83n5O3bN1yxhQnOb0wVGk3yf5Gm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZgtCUu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3n7ndAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZgtCUu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3n7ndAP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2rqC2951381
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wl+seacDctymxAQmXB69/Ucgp0LZ7i+ElrITf9m6VG0=; b=NZgtCUu1PCoyQKbz
	mX3quHrDMUF3vtrKFl6d310tCNd4TZ8o73iFJEjIhySeYNaqNGK8u7mMB0rLBepd
	/1QfPuPCU2uQ8ZLGOoH4QUhQVMESPPlLp3dY3Kl10mZnMzzsR5AX3THQsqq5Ks7w
	107dqrziU6yvERsIP6qT+5C3sFGx7TGFy2/gYyIBBIE25icccrHUMXm68Zqp9Xkw
	OXOSiArSq+zLdo7u6fQoktemYO9gy7LE1qxFYxusk1rwdbBKpZ+979i8Cjffi9N+
	7MoAFP1MxyVLbeQJtVbzaVD8c4K1g93xpWbN3H5umj9e/2DWGyRfcHrs5nginM1U
	oALdyQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qtbfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:26:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33f01b74124so232824eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159194; x=1790763994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wl+seacDctymxAQmXB69/Ucgp0LZ7i+ElrITf9m6VG0=;
        b=g3n7ndAPMT0IvkGprCXPdYIZ6C8gF2d5oI7slvFe1YH9TdxQ80HubET7Ev+p+2vD1N
         9ncbgnkPW9ZCDVwuxzFbnJrIsz2XKfYN6Up7+1cVZWKXvGzew+JLwSnspLvrpWBxKuCL
         +OP2+BUgqOyed4Mvdx3pnV1yR6CaqLmMyYr9kV8BBU7kwKX9WvqmxMcJ3dPvuvGIFxyI
         sWKtMAI0fZPGSlRyl0xjjJqF1T9VPSE3ovWMBV6Yqz7G3GQavH/7SgEIKYPG4aDe3dms
         CJ1HQPBzrKzhHcXs9rAF8lBr1+P3oKbvKoswyqfG0R4K8bPnZYVTrEcbtm2uczSRY6Os
         EABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159194; x=1790763994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wl+seacDctymxAQmXB69/Ucgp0LZ7i+ElrITf9m6VG0=;
        b=Mi368LlHTP8sCfXJip27imgAb2cRKhfSyAxGBOCjbGTS4bs9ABHu/Bif3CeQp8Qnge
         fQvVYrm2HqspyFhmb+I4bgtbzM2swv0hD53nvVoW4JR4EaovxbcCKKid+ExfnyUBjkUV
         BwlIAomWWw53hO1Hrk0fu1/R+ctCJ1/VIz4VwZzvLMJsUWUSSZ6Qk1AOf3jFlyGLjbas
         x1WPVKIPs55Eag8+7SncuFdioKfltv/37I8Cy1gfpxiL567RZw3QsaxauPwitHnaahNt
         Pgi2O3fkAld6yxAM52Zl6n6Jc3LEoKr0MNeyYeZZGPX+CGdO95ddgJ/f2o5NsYWYaWUN
         zASw==
X-Forwarded-Encrypted: i=1; AKwUvByfohpXi9rWCXLcnMkGBitscd1cSXo2XKAyEizQkUrQTsdeY7chE8npjtCuD2wd9dvhSwISBhS4uUnS@vger.kernel.org
X-Gm-Message-State: AFuF++mGMEvNl5EYZ7FRwJ7EuX+NHiO8aXkQfo803cuMXn3W0AyIg3t3
	ipmOs7hhe+LxC1+/e2H9chBU22/9cf3BNlWpYkE99RyRsWyMzqyojKbq6vwBGyZXA2Nn+7Usyi+
	RqoHmUs5+llDO228S9za4A2RDTqtpCTFOT+vOdE8FFExmhdRpyLSMpZFVmHPEEneU
X-Gm-Gg: AYBFou0Qs8OMbVD0HK54KPKqr7Lr3IMD68hy+oIvWJCNiUoyFmM1XRXhoMDWSXDQgoM
	Lp1BDGSyP3qaFNBn8LjIGh2wFd5mWUh959VB/Lo25s2Z9Te+zozcBAWTq1+vCDGDKj21qV9uKYo
	qtkMkOuY23YzYSiAaIo9EnTnIr7tTAunIpYfKPDU9A2eZma0oo8wWl/NanLPGPLSDnMYJQJKBXR
	2jrqraQlE/467oSNehA6IBpeuEtt0Wja3ljX6/RAk+J685JGVY13BgxwvRuCRbWUwLOY/OuPbh2
	DGjSnHIj8Z0D2SSzWjsJtfOYalE4wQKLYs/sP5dtPHTKXpOuQEz7BANHNTT6jEaLT2/YjTk4Wuh
	lobBFLFy7FTuJVX3mC05egVqq3qxIFonwNg==
X-Received: by 2002:a05:7022:f90b:b0:136:4bbe:9524 with SMTP id a92af1059eb24-144ef0be192mr2107174c88.10.1790159193646;
        Wed, 23 Sep 2026 03:26:33 -0700 (PDT)
X-Received: by 2002:a05:7022:f90b:b0:136:4bbe:9524 with SMTP id a92af1059eb24-144ef0be192mr2107158c88.10.1790159193036;
        Wed, 23 Sep 2026 03:26:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:43 +0530
Subject: [PATCH 03/15] drm/msm/a6xx: Fix RPMH dependency votes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-3-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1636;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=enyT8E+9AK26apYvWRrZ3yOlEE4CZOhJwCOlmwsJANs=;
 b=TM3drMHi0LUTT3rpKITA1yUMYkFSZ9baLFTe9nVutJch5tXY+aeUWa9EiMkQbSti9C6ozXpii
 JgQbn6qY5AcCZp00eIAT5DK8UQqAO2P7qIFPk3aYEhIZ26EavKJmxuP
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3a95a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eKBiAfeFZ4O-hnR0X2wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RiqAt_yVBpOs31DuFSBCqAj0ux_N_W3N
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX9XM05hNaALc9
 KkldJtGy1MWGEFCBq/l5V0XsEou7stY6dULQywod0UFeW9A5+ywIhYqpphoEfHBhqNDIwCBBYad
 1R4Yt8zYq88BzaeiuvhjAcS7uU4u0UE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXzKFy6KY5C1f2
 KfImeDfpqf//hn2LWXcoODzdCQHkI8+CA8OpSn8urpRW9zMIzgGEJeLAJrfOtfGytiuYuDPU2pL
 K+gRDZOdkGmr9G0tzDTvzAIc+aEgJOh1BjFQaV1TQQ3zWvfHrCRaJ+pL2xXwMCb85GL6/FZLoum
 Urp85VIyvDiWvb7nTlQEh8qOcS1Uh8xaLHl0czwBiiMmDw5+Dj3FZw+aEfFxsJMzpH+666/ppX7
 VCKyqAfG7Pengs6b/LNfq+Zl0+RhIODh6ihUp5n5itXdXoxP1VuURdSvj+o0EV6KBIf+uAyWfL5
 Wjo8Hr/ye+PuT3uBtG6yltUMg7JGIQ0vB8KHm1SXrWpxfZRhH3YaZ3gFJ4n+dBBDD16mEAjzKOj
 /j44cjsuwXA8j5d2ucVYOByV2TM/891PaeCgGTSUq43LlYUW2K2Pz86TVrtysd1ifkwIIgTwXfT
 VL7DZp4YRqAiCpJlIfw==
X-Proofpoint-ORIG-GUID: RiqAt_yVBpOs31DuFSBCqAj0ux_N_W3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

a6xx_gmu_rpmh_dep_votes_init() iterates the GPU frequency list
(gmu->gpu_freqs) but was passed gmu->dev to resolve each frequency to an
arc level. This results in generation of incorrect dependency votes
table. To fix this, pass gpu->pdev->dev, which owns the GPU OPP table.

Also, reorder the dependency vote init to improve clarity.

Fixes: 06cfbca0e1c6 ("drm/msm/a6xx: Share dependency vote table with GMU")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index d072646093a1..161b360bf3eb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1868,13 +1868,13 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
 		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
+	ret |= a6xx_gmu_rpmh_dep_votes_init(&gpu->pdev->dev, gmu->dep_arc_votes,
+		gmu->gpu_freqs, gmu->nr_gpu_freqs);
+
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
-	ret |= a6xx_gmu_rpmh_dep_votes_init(gmu->dev, gmu->dep_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs);
-
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)
 		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);

-- 
2.55.0

