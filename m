Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4EF395AFD
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498800; cv=none; b=FljbPyh/MWf9dDEWerMV5Z7jQBd38yobDGVV8cVgVUv/WlExv8WDK3IiU2EQa0Py5vf790yMzQSZTP8XDKXA9124r5QAiZGqKMCDx2EocRdhPPKe0mO5pXhqy3Tabik6UwHSFRq4VsEaO5jlFO2IwwZ3+dpp+kygtZmnPosnzMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498800; c=relaxed/simple;
	bh=lXWNmEJrXxHXoCAHvxq7qK8w3dDJ4/31/UMC2TNJybs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NR8tvbaEqjrSmAmu7EMerXmlyt9LR+HHC4Dl1tI+nbbIKNqm8sHfe3BVETaK1XUvOaiIA76b9DdH2y5PKlebQe9BTKAp/0r+/Fdtvv8oyrntXquLh++q3gLeQp42U545ZB3oLOHTVM5OJbOseTsW+YMWij+VpUzEUaVBOHK3JW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/kZaWzy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3tftPjP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/kZaWzy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3tftPjP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vTW32368077
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 14:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=; b=n/kZaWzy+7rupsEH
	dKKhdpNDX2gmHMsQQmIxtQv+1JBkx6YQPTiAAjIkTarEXS9IgJg2mmVh4+VKlrR/
	STUal+Qga1WrbTzBqtFqkU2k/IW5An8fdgdmATThKdmbTRH/fpmVev/zTUViv/Ak
	l2f32rfJWzB/6PdIZLeTIQMNIsL2MP5fCfLJ01S/MCVz178wv+imrML+N01qAFIu
	pGs1GFz3c2+7cWPMV+LPZKEMpkHpseKcDNoplbHjDYpL62GI+3qQLNjqqCtQYJkt
	YLSJ0q6DGL4uIqXuJpIAPwQCdmlfUqafOS82oVgDoVuSn6lH8tx6zSWE/NjNDKha
	Jk3dcQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gh6b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 14:59:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423efdbe6fso1155507b3a.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498796; x=1781103596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=;
        b=C3tftPjPPyIYrmd7MSiByV6JXsd0NijgWAXlPKnbI39eZvml6Wm3rerwo89okykp47
         N0llgzSH81IWO+XiHxCYvgYieyekhP2LSERf/SPiw1+wSvaPLXOu4S1YzA3sB0+yoLKX
         zyigja/MjlfB8znmAsE8Goo/QDBpTXwR1GfAJ2C4JnWA3pi5/LKwYqExqVfWt8ZB2Cvb
         /tU2/5fqQRcl2d/WOa6JFsz/+qQcQ4xQgLfNvDrrWc54o83G8cGncCLOil6eXYfXbFH9
         nLltVKtI+M6Mdh7QggsU6FE80CEmckyPHbJlc4s0jvmkZ+/wRNKJk2ZOGK75jvUzoiCm
         fhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498796; x=1781103596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=;
        b=sZFyhjs/xo3puLgyTBTIkksIEhcUrU9nDTBqOzgMa2vH3+115qXm07esTZHtAGbrr+
         lVJ/Dk+wdTm2GPxhYtjXYU/zw4rRtiMDFDhe2f6L17aGYi44lB6SX83EjmIeOSQWGkt7
         JNw/FAP+0Qc4yrL4WFjf/CcyMv6/4m44tD1N+5o1TVoMk38w5NAPiMwWa3gZOzgjeBhT
         oz03ObLEjmhZZbxsOS9UNMJuSEV2NvB53ZGux0vPWrVVqpqbtJbZnYxo4Vb2XOyk948Z
         g7FZ8PH5Ll2ABpw7AVLBnJjMMgkE9PzO0xTFszd+HqpTpT5cOoAfIKOMZK9wFp0b9tYa
         jCQg==
X-Forwarded-Encrypted: i=1; AFNElJ+SiCQZR9hBmI6eOgFLHttH4Mw9iXg8fCk6yiqzfLBXUBbhh0qTWlV/HUGMgT3u9a9D3LCWZelBTOMg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Hk9BJbJTawsxhP2mskfxWj08jcZDWcI1fzoBkGWjuMzBylKw
	4cGpi9KXGb7+hOaxkF9iqf2Cly+iJ44WzvtyKzYT8QK/OoBmwznzj+E3s1HHauckj1k04GTZcWK
	6kiINVXPU2I2MzsgjGzu1k/0om5rS0jnLWEhkgirfkdFt3c6T9/pzKKWNN5RCPUma
X-Gm-Gg: Acq92OHcFhEINv/hVlTEYSp8piF0W96sl/ickm+ngt3iycsaWm1VF/wzLmFobgy2TZH
	m0UCvaUzOTYWTFPtLxPSIk3ryBo+hhVxaset0x3NnlJ43ZJtXO5JI+tLYncbqGcG9GZ7eK5zRVn
	FBnCrAkF2AWJlrHQgFhdu0fQ0sBY9xf+ThkxDGGR9mkSPvsftvVrD5IB1wcls4f1fZ0EbLrQiiA
	1urQG/pFC7nVyIjlutBqO8fAXkHZDvrz+OW4WFLlAIBpjQ7MJEIAIRJQfhJFUrY8bnulQjy3GHA
	BnCE7AnsuOzcrC071yDgknM5/JNXaRkHon3QHvfkwmwe40Mz06rr8iTGLvXUxJhGGIpYIlY2z4O
	Q1a5KOBoVQT7Z6TK4ZglSKTYrzZMRJYiftZJetzNtoRlHly2Hi37OmMhclTg=
X-Received: by 2002:a05:6a00:4c8c:b0:842:329e:7635 with SMTP id d2e1a72fcca58-84284f8946amr3803912b3a.45.1780498795946;
        Wed, 03 Jun 2026 07:59:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8c:b0:842:329e:7635 with SMTP id d2e1a72fcca58-84284f8946amr3803860b3a.45.1780498795425;
        Wed, 03 Jun 2026 07:59:55 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:59:54 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:27 +0530
Subject: [PATCH 2/5] drm/msm/mdss: Add Shikra support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-2-aeac1b94faa7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=1977;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=lXWNmEJrXxHXoCAHvxq7qK8w3dDJ4/31/UMC2TNJybs=;
 b=fl8GxWFvvAxL6W8VYehdEukb+WWSYKOdLhDUGdXMeoIWzjnTFGm7XxYarDgwo+rK7e26ilCar
 sbsCIpXoMwLClv7E5wQZVUjKe9/oSpcQ1BsITrMiorkZUzsAClU3cYN
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX3Qy3BgzDIJkX
 mJfDMKO+AL7uJXSN8AmfNHyCrbxDhOgxbOUDkX561P/ZwGCj4O1f8A3CvcEIWu03Rn/0/Qlvwk7
 vyu9pzLEvcjmh5hjGUji0+zJBtjhOT8U5ZFmcWEW2p+f1uea8+PXK2BqQM/3AosIupheo9jHTel
 Lp21m+NgG6R6BeeeG0gsvxT2WrZn9Z8QB7LAehaQhAynAC056d58/7COhlYprKB1kdtQq9WE7O0
 KFDVNM9EqQEyQqpaXq4xt1aZLs6bH+N9CUIWtdso/Pg5dWPNCdyaGW38miZz8sTRPvwzABd+xsw
 Fa0/BH88S3NKVgw2NmDQy+hFucGXfMC3Jsli00/r6XXZgB0ZNuJN0Z4EY2tXN/tLsRkkoB5W7Nf
 3koiUbzUNQth2vK7/8Xt9zro+yTYYiHDAOwkUS1U94yiNP1c23VESDoFs7QNVzVfkPmEP1UHX+O
 aIqzsGpTneJApw613og==
X-Proofpoint-GUID: P-RrY0OxgWz7_rLTS8zBL0l5ZDowHHpi
X-Proofpoint-ORIG-GUID: P-RrY0OxgWz7_rLTS8zBL0l5ZDowHHpi
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20416c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IH1-U3DoIKz-FfJ46FIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030144

Add Mobile Display Subsystem (MDSS) support for the Shikra platform.
Shikra uses the same MDSS and DPU 6.5 hardware as QCM2290, so it
reuses the same AHB clock rate configuration (data_76k8) and DPU
catalog. Register qcom,shikra-dpu in the DPU KMS match table pointing
to dpu_qcm2290_cfg.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
 drivers/gpu/drm/msm/msm_mdss.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..8abe8ef6fa9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1496,6 +1496,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sdm660-mdp5", .data = &dpu_sdm660_cfg, },
 	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
 	{ .compatible = "qcom,sdm845-dpu", .data = &dpu_sdm845_cfg, },
+	{ .compatible = "qcom,shikra-dpu", .data = &dpu_qcm2290_cfg, },
 	{ .compatible = "qcom,sc7180-dpu", .data = &dpu_sc7180_cfg, },
 	{ .compatible = "qcom,sc7280-dpu", .data = &dpu_sc7280_cfg, },
 	{ .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..03f27e6b0ae7 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -537,6 +537,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sdm845-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,shikra-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sc7180-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sc7280-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sc8180x-mdss", .data = &data_76k8 },

-- 
2.34.1

