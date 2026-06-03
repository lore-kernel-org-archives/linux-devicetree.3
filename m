Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5443AA1B5
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498825; cv=none; b=JwhLEQcR2iTcRZv6ipH4e8Xp34VrajSjdk2LtJoB33CxgHUHjE0J2GEFcuewyTTv4a+kT69B77T8/d0HK4NZPbJP7PpmmkdeLG0n2hJv01bIiE01vVIyssvXrIpA8FX6l0MZkaffoh6WZlq5dPsd72lIs2CgLlydV8Bizq2bNnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498825; c=relaxed/simple;
	bh=oR2yHxswddj6quJTdd+FGIgKIDMApsb7sGBB9OxVs9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RamPZhKH8tB9/RHf+qi5YKEg1d9KrF9nnr/EgAFfBGlQCdrj0orkqhF+2GDYSD5PElzB+j6BHGvtTxWlhzd5sF99ID1c0sGsc+QTS7BAYzoZvphOxLt4gON/IynIKsMsHVHPCRTdbpDO0D8mzSmrfghZ7xIip4quidNHAF0qcE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FR7PSlyO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqY5hp1v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FR7PSlyO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqY5hp1v"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653D4ZhH1956521
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 15:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=; b=FR7PSlyOJkWGIVkP
	s6K5xuZO8708Qske/MsZj0ohP7hQzcNJPNb20Hx54i3AeK6MWJ1LU6PTti3NXgDJ
	0R2wBcwfzbNy76tZjRzRkiIQMcmzPZDf3I+sDeMlabw9gVD4tPx0j53IFckySyXt
	9LljQR8atd5o24uTbjtFePW3cSKsUxJyDJ/mgF0fEvKo0a480VjSIljfHHeAC1Dn
	tJ0FskdFCcfF3usxaFdRegGWE0S/wZZj5q66dXsfm53CjicBEY6foMUh2NBPhUzx
	5wOpdzPs+EGPt/2x7FxbQO25m3SsQp0uN0vcOGpN9ObPB7K6S2VUQDExk4P2xfD8
	XWGtNA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc1umx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 15:00:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f424d5bso2696427b3a.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498822; x=1781103622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=;
        b=WqY5hp1vDUxiHfVx1naC0V/uN7+0mqUZ8V3QgawBbcgnDT9kAjhQayfxNMQao1kdRm
         3xlHj/GVDVthOC8aLgNf4qW1GExjNAvED++ymT76TO+sd+NYwaXa1GyDfdYiEJEYkLcb
         WDw3MWbAG1O0jngmnS70V2oB1ruY3stbhip180dZvnP5uqbqbJDhOAXTEJyo+7pR3N4E
         qd8Eq2vJmxFYQSxIdOf+B+dh4QRYq0dmdtn/oueBh71IWSKUhkDzBW+nG/KSz9VkV/2J
         r4NDp18ylAgnh9RaFcQahrOR/lXMdts+1B+7qPxSnn/IwSPQr2uzSzKreK3VgF8V+jYI
         5elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498822; x=1781103622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=;
        b=USkOtRmEUwRb1WahvY7yqYT8Lm2QDT1MoWw7SucXKMA4/wGe7M+TC6gc7gESro8dwI
         JDIxOqssTohS+4t6igqiz8fzLo3Nee2LZvZflWGDArdxtmC+RPgZO/dKy0Ug3PFNiWCr
         Rpd5NXRioZusass0cQAGN3aOYib/l68bVdcaypY2WLAjaS18XK1EvGe8bwBYmmxGxzf+
         /wDtD4wd4RmeYy3O3SFH5bqLh08tA/tOTHJFQwGLHFSDFg9I5s/mt4FhdBExplvhQXrf
         +BP6mAA4vdF2gTBIXfyVmwCO8rkZ+cUSU/peGVxI8CGtV6iSrXhhQkGJN1TTdgANeswX
         zo3A==
X-Forwarded-Encrypted: i=1; AFNElJ8BH6HeNrViHbNph/TMf/kNsXqGSi/78jPIHzi3aknzeX+mgXMuPUN+R8SlEEnbqG0uUlAe2ZzHhVYy@vger.kernel.org
X-Gm-Message-State: AOJu0YyjIucnqN04xhOc5kuq7sz74asGVmrCy2Wx0M6RGXJPGVuZuqAF
	EXLgYt2Qoth/9PSZsizalOLw1VS1w673KPXygRiDKSQF0T3oN+YMdCsyV/JBPKi75cvDZz9ctxQ
	OGiXAcsOaVtsdPsVKE9zHrSpIzSWMk2JudYmluBEJEeQIqUnXqRjGRduXhFVKi8UA
X-Gm-Gg: Acq92OHrw0qJY5s1v6C+QEwqoMSNsKBbmYSQL/pKbzDLKPS+avCmAv2t/kU8SW+4fik
	pRduFPaBMRUUYVjB1WKOKW5t4GZ5YbnrS7IOaIYWJhXJOk13Voai/8Fz9sZTisl5nb+DKa1VHJC
	Q+qjXELBI8eJQX3ZFxlP56b7LcMVclUZdQC2pfoF8OqObdU3GV26PJAMF7q5C7xaRVi/MTHU5+X
	tZ8KwRwZ4GeVg8x4M+Zt4VqzeFRB4K7nvRb62toSOWgA/9zd0B4xxo1hwf6kcHTDskVIXM5iqhM
	hyZwmYmrxANBpMRkh2dQA4JARr+Vvb5yyNrsPlrInSw/jKlHZH+oWPD6PhgfMY/SDR7eWkJiK/D
	n5OQzpprDdYNdbAU/2sq4C4LqeICimrOOCFIQoigqDzrIEKZZ8qz3LWL+tZc=
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr3805637b3a.23.1780498821395;
        Wed, 03 Jun 2026 08:00:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr3805562b3a.23.1780498820755;
        Wed, 03 Jun 2026 08:00:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.08.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:20 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:30 +0530
Subject: [PATCH 5/5] iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU
 client tables
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=1873;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=oR2yHxswddj6quJTdd+FGIgKIDMApsb7sGBB9OxVs9c=;
 b=slT7W/f52dq5AGO2+1rwtTo0T6c9Jbsdja/oVrv6fulBjy7AdNAx6Ybfd6TtE7V8hPTZoRf2Z
 IBvqNqxSNY+BT8jWJynyp5mtqdDgum45kTsfs7dMaj99ai7z9uACjZl
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: gtvthHNG8wdp6xkVX8LH98Nc_D59-cT7
X-Proofpoint-ORIG-GUID: gtvthHNG8wdp6xkVX8LH98Nc_D59-cT7
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a204187 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WiTR6ph8kncRzgk6yhEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfXwTtdPSgsi6ZY
 z27vNJP1ZknmktPuhSl+jGURfFiFfhioXghJUjwlS74kI6Y9tpz/x8ReegiKuFN4kOaxxotcDRr
 RuORFeKNmvrB4RELiK7dnGleud8WXnITxdNJVT4B6dnhOGNe4GqKZMnbgaC8/i5qHdy8BtEbXnN
 ijhsJsPt1qC/d9qIJwWY7iWNTeV2ce2taIA+n47tOdKEHf+07sy90tGw75MnJqXz1nu7an23O1q
 OWIh7PkxN8dW/J+7sMx4UZL4eYUszOOzar8na5NiyZmVzSJOsaECwW3qtDcSXQ0nYkftkfHos6C
 FB0uftARaw9eHB4mw5lEepHfD228OwNqfpkslXZTIglBHJK/sAgxHv5S0sweLI16cjFCKR21A5Q
 qTUSU4bC7k/8hHP5d9Nz3xKs4Kh6mtjfjSilviC9H9HXWSV/IuIL1Q63DW3bwwI10/Vk058iZcn
 e3vjcrDHddLsJsKxjvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144

Register the Shikra MDSS display subsystem in both the SMMU ACTLR
client table (for TLB prefetch tuning) and the SMMU client match table.

Shikra MDSS uses qcom,shikra-mdss as its sole compatible string, so
explicit entries are required — there is no fallback to qcom,qcm2290-mdss
to fall back on. The prefetch settings mirror qcm2290-mdss
(PREFETCH_SHALLOW | CPRE | CMTLB) as Shikra shares the same display
hardware block.

No entry is needed in qcom_smmu_impl_of_match: Shikra's apps_smmu
carries qcom,smmu-500 as a fallback and is covered by the catch-all
entry there.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index e2c914fccd6f..3dfee947e2c9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -45,6 +45,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,shikra-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sa8775p-mdss",
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
@@ -410,6 +412,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,shikra-mdss" },
 	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },

-- 
2.34.1

