Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A32F36492C
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239286; cv=none; b=GmNGtQLLJXfelZSvm5M68tbsyMjbeJ5KaPRusML4bl46Z4clzRjJaK1fjTW3RkmyIaEDbQDO39Cz3Odej0s71Y+5dQru90aIe7HZIZMGAk+EfapLS9oq2WlTTD95qmGQDxeumCjThMMU6h5qQwUww4r02yTWbjuUpteOt7yZuKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239286; c=relaxed/simple;
	bh=HZVp9+yu5Mjb0F7vgiRaX5z1PEYeaeliEtjK5AzdYdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZKBzXWtsFfHfdwuDfGoeaHJEs30ue4E3+7Swbq6Q/9/1zj+psjtmQrzBqVSibjLK2NS8QfhWeIrNBMI/1HnvzSsRtGjjsOZX0v0MbITpW+c94OVokCivxYRfl/ibUSGVmPSeMkkEQMKmZCu94jtB01ApnLvmfnaQnKfBmFB4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9dTxtoQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtQ+wW5R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9dTxtoQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtQ+wW5R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6654BQoq547829
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=; b=X9dTxtoQsWPjTwA5
	Gj50OTqt/zygM17ti3yhh7M3q02i2+/8io4M/dCZWKo8aDCDbJFY5L/6IXNX2FtX
	sJ1GN/oXfqwAOrhE2Vv1azlgdptslqSW6CDfwwhWzEtDUKRRNWfACP485i2RDt7M
	HCiCnfm6A82Qix9OrxwmJhAoOQ1ZkGVQJQPaLn6kmdtnMNoXcjqSk/jgt3zgPTFp
	yF3F/SWTe3k+hCZcLnPHb7P+kyBpq92NIfUaY2YND+as39H7W9QTNw+GFpiFBODU
	mK/j76efBSjNZyKLMXsKvt7gXvPupnQYXWn3/ZKgBGUr9iD7HTIvTKawfHZAFp0y
	nzXvLg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf826f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:14:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c892143db7fso1406822a12.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239284; x=1783844084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=;
        b=NtQ+wW5RbviHS6VkH8IPtFTKtOv7yVI4rxJIR7eEM1KF1P0tPYz9yuuk7SXp90u4rd
         aa4illiHgSqKCvA7100JkLwe2WbzcY//sJISlrnkMMUTGsil9EpgGcRBw9cQlu92AqOt
         LnvVCDtpjUAZwmEsEUG1cf41Ak+kg0tcJZfMAfn+pySIQrKom0NjNCVUe5NL899IdL/f
         jp0srFLOkkfVVSFdqnaxhaRsOw6RTM5d/F5cIt/xEqCCCiSk8q7MQlAtWIaPwylio8eg
         jU88+yvapQh9hey+EsSqQb0/hFr+61QWpYDOkAlPEtKY3BE9kybXTaD9i5Csdji8BOA+
         FSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239284; x=1783844084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=;
        b=icK1BibykKrpNYE3ZhuZLO0AAxmBvBUYJLgrpc5mogrV25zA1y7mBWJrRnV8h606Zg
         PliJ87x9yROnGehCjtkfHQ9VY5XxcPPw5p4vSJg3a6kQtE1GRSGWMvLLoBLohykd55UB
         HOqQjzSqk/feqP9rCO+1hvR6TOdXqYvhUI4bGaLaGz1lUubL2feyEIAiqm1s0rql3SZh
         73xajzV18dMz/LCnn1Ikn+SUVgvc4LdFnu5Ke6vU0/kHKHS0rQ/8u0qodwBeh2Rlf1/c
         ADuH7pd5D32IWe7DRGj4uTg9Xvo8Qnh86IwBkF43JDLdyAqM2GbRUnyFj8OFCbiseYtA
         y8JA==
X-Forwarded-Encrypted: i=1; AHgh+Rqdh9SxYDo/dfAFEg3xiOj/FidDV3hByq1JJqxGg5nJfs2+OIRsTgmzhb4a1LpRJ30CvV734r0LnMXd@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdGtbOeJRmA3fRqbqcTzuM8CZuq+PoFV3aoYLHQGFbTOIdk6U
	Glwxx48YlTA6RIoDPqknu5ZSXOcvNMx5pXwu9VpI/BzcfKdE5JChHMZZ4LommUbJiQVZyp8/5yE
	/bwUKMS8zlvX66Xt0WVhPYE9jsTPgE5J9903T4msne50CfQ+3T6Wp55hrQ1DZBl1P
X-Gm-Gg: AfdE7ckn7l+LnkjCytPuQzZSDK6DrE6opdj7Q5Qsf6NLg3GvGXsxzwDdR3QvqQOmUPa
	fDZSF5y2QvkkfhnbIc2BvG1mRYpag0aj+MLokfxoUI24e1WaxK43jE3uWDDLWNBJB5HbVDwpKrs
	QkLeAVRWKRFaZgrcYxXXizJy9gxw245tgtTTKJNiLZ3dakqxYpmOVrJ7IU2emTVXkG3pJsV67XJ
	uF//V5qShmZ+R/KyNt6HM4473bPmdN4NPDbtbIs5zVSJutO5ql9Aqzf3aGHgm0qUnvGs0m7VxQp
	++I9XzrU7ujO8r1X7+VA6uF1B5w2B/FgykAaoXZmvX7sz09GKkUXXxOYr28xQslDinGXvCLBFA3
	Cn0ghs5DQJvkSBdjyf3RYeW7T2X5w2U6Oscc=
X-Received: by 2002:a17:902:e74f:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cb97e58139mr61841925ad.8.1783239283820;
        Sun, 05 Jul 2026 01:14:43 -0700 (PDT)
X-Received: by 2002:a17:902:e74f:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cb97e58139mr61841665ad.8.1783239283335;
        Sun, 05 Jul 2026 01:14:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:14:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:16 +0530
Subject: [PATCH 1/8] drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in
 a730_hwcg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-1-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=1238;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OoP30nq6efDw/gDTU4tVQRkvylV9nMkq0P7LwxjPzqc=;
 b=K2483gwyhqLi/J7WvjgvqDh88wJZPkPUhmFw5qcCp573LO6/H7fw5XIN7fLqLBDMer82FPplk
 Q5nk2eUH9PNBHF7RtP14pDCYSjIh5szSJQLeY2X1ovfJKHH8/UCoysZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: BTanPIKFgrraIuUQ1DctzPg5vwCYIMZ2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX1evhA5Ax5vzJ
 ifwNoSNXINEmJsLNs3e/fo4/Dy6yCdvdZKQuqLeOUqE7c+m2bDq11WyDuSkjInxWrZ5NGHu78qm
 c5/G8fTpBgawPE3HCUpj59mmwhHz/6w=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4a1274 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Vf0ozLlH3VOCCO7dkaEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: BTanPIKFgrraIuUQ1DctzPg5vwCYIMZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX1cLRFtBNzw4E
 WF7L41Du3tDBWpCXnEtw0E98CpwmGnh+wCLsVeH+IPkpjtrzZfI/VcIuf3t4rczR6bX/93plCn7
 6FhNOG0iwGoHZRLhSIeZrlGJRGufj9Rlx8xwatZx/0kNbmtwndax+kTjME9UbOp76JVP3ja5NfR
 0s7gJjIGH76idnCfbcYkgXu9glOTSv2X3Q5Oc5MAPYL8dFBKSR79E/MOVkQegDSn7jCMrJUzGIZ
 +56qh10u/Me+TMfn44gMo8C6BOFt9iGme3gb9bPpYRjaciRajOI/k9iQ/KF0nJK3ohDrNci0lmr
 e0jUVGOQemMG6NylHc3CxuKcrFAgj37GuMTDLxTR7B4yIXea2U1W56BK7WtpdCdW0ToLLNH/FnO
 5d6Z/5yyJzEiJ+4ebUo5W2GaLhHv7UaHWDBHj0CsjnFXyDr4cqyK44AgsmzsC+8SNl7dvu4+Pyx
 bWo5VHUMXMnTvtHSCLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

The RBBM_CLOCK_CNTL3_TP0 entry in a730_hwcg has bits[19:16] set to 2
(clock gating enabled for that TP0 stage). As per the latest
recommendation, clear this nibble to disable clock gating for this
particular stage.

Fixes: 9588d2f860a4 ("drm/msm/a6xx: Add A730 support")
Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..a98d550b72d0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1199,7 +1199,7 @@ static const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22220222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
 	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
 	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },

-- 
2.54.0

