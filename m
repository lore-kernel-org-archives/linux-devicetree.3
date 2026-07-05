Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837D8369D5C
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239296; cv=none; b=Z7kcSg7C0SKxHBzKRls6TzYvZAxCDlxiwQlBJjp9SIR9jKU4W70eoODXwjNX1PVyMT2axywD+hCVTGJv4nQu2G2eca2ghU7bEUlLAg0bMD2wHTHF6Nj89tTMeNtluZ1Mg38qNwHH7HxjyXwosHTuxyYVKORuBVfmb0SZFiOa0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239296; c=relaxed/simple;
	bh=ycJJry48vK1w/9pKWHhMt2Pa7b3Ht8W/8/Z4qRb1cBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3rw1Z1F6MemPU8PjCDr6nE9mVqnKquF3lJOIHVIipb0p0b0zb4UE1xsK4jdS3/KsU62x53naGq1PBrY8eUtSbR1ysr4+Lqgi/KrdYL9tCBF5n9zUHWEeoQ0cQUYZf/k6GMRDl3Up6vK/2xzm83OdoSyG5FvXJzsv77Q0oXezuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLZNNmCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNPiancu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLZNNmCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNPiancu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6651nPrh416526
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=; b=SLZNNmCligj73r9a
	HmTSVxVWqJcHqpk5129dmpy7qmKlR3hvUrApOZdaL/B6xsrRis07VNYTQb3NuaiO
	E1V7NU/NgcStSN4LHLkr6K43wagLw1Uz3I5JcnoS3rTHHSm/IudS+ngwDC2Pvr8d
	qJjX6kuo6A1UuSChmy9ncv0KL50r6SLdjvCyeQ7hbS66oaOsZ4khPDchsMJmGq1+
	xAQxIsqsxDgVnVZB3KLIKCW7m9WWwhrVZbK7qWZhcT/4R1PvMGXu+kKdOnD59gYx
	vF39FU9+LoYsF+cnyBpU+lEWhh2Ikb0vCoWJwtxqcfXiTGObZxASozwujX6u/dp9
	24bQ+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64jey7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:14:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso28696595ad.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239292; x=1783844092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=;
        b=HNPiancuPcFH656fieNHAmZ8QWfcSndYeyvWj2SZIDl6FnBbGTQJuouiivs6NEqsPk
         yyuX9YB3BX18QLb7ikgGRzySv3BWzSy6KnwiUsOqfJM5s7Gy/UOwAwp1ReFJPPNPtWIc
         /tGKq+ycmU8otfnDh7gfnVE/Io2RIJVvKK0h1pk5Dvw3iwnBxAxVOm1zu/wp3wXnRRVZ
         S5VKswPRMs5ybS3Drp9WIU5qMNEBv7HdBsloADau2GSGdCbSPeWpKuhaQM+g5pM9RRMG
         J6SrMCP3TGEuTd+hcJPtQmTeLMX2u9dRFII6c0pLcKHS7O+n68g1g/GuUo9anfgRzAe3
         r+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239292; x=1783844092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=;
        b=NWTSWHuTABEzsRgxTX+eSSE6Sr5U18XeaG0DtYi4XdvmHjN4ErVdQDCZ4HQGyAdqV6
         2tijxbreER219raqWtt5VNhrnhPnlHc23uizGE5Tp0l/ezYKabILInShJYo88l7CTbWU
         PI7FR7pSOTKrN0AAUae/8OiZwvS1OFiLNa63ckPYg8kuc5n6cZIL2zqVoOalJ4Sj/Fn/
         Zf8E1esgigM1hDIZO5TYqeZPH1e2J8YGZUYpx79u+u7UZKYgXdaxPFs0HbQ05SwszqoA
         dK/mot7UOx4xlkLzn6L27suleKwF7TmeMkHKOAj7F6XigeokNfRP9bwamlCC3PM4z9yd
         wK5w==
X-Forwarded-Encrypted: i=1; AHgh+RpiXRx/sC78p8x4cs1Ehp4Omk32Y0BJFPiQRez9rVX8GQCrBqmxnwDWbrfkxyfIvKt8T8FxNw6MgghP@vger.kernel.org
X-Gm-Message-State: AOJu0Yynpw6hwLWvNeSgTBupY4JXWisFqkDZor84yHj+QWM88CN4kuxj
	nP/j5R2inSJc3LkArgNBFpStDf9i4kPk0enSQ9iv/2KnxUT99vzBx5Md9BCdHj9uzqxzuB0YquO
	i2nGDIHvlNqIu0IeerD2lN1+EfXXohSIXTalguSli0JjEfTHfZWxn3yQd0ncVMLCq
X-Gm-Gg: AfdE7ck8RNF8O0x2gJAdvrKjgTy5rqiRYd9jJuGGED7RJV4tH6M+3qQKz1w8Y6mCbJ1
	CuIgdLZeXo0vbW0OXuiPWsG3Vhg0m5vqf+7/73I795HGx9e7+BpWfgIww51+S9yqYbjGuhKbRwR
	bSiGT/6NrEqrPIV5Oa4rvX2+uOcpHbrAL0kIGPTUs7q9r9Obl+0HYNRl4PbkgtNZvESxEMl43Mh
	pOsQO6eICex60xEbiKLJPF3X6yH3Wpe7CkOnkWkb++DUufLhpgdwSu3CuANfPm3RCYdyDgOBqEg
	x2EeJH+no33Wa6W3d77rN2CEhBbPF942otOKM2dpGZEuOS6PDY9KKmOrn4OJcEZbOHyRE81msKR
	0ZtZx9Eg47jvkfdRZViUxb197fhyb4O7GNB0=
X-Received: by 2002:a17:903:2b0c:b0:2cc:5fae:cc36 with SMTP id d9443c01a7336-2cc5faeceb4mr48253505ad.11.1783239292361;
        Sun, 05 Jul 2026 01:14:52 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2cc:5fae:cc36 with SMTP id d9443c01a7336-2cc5faeceb4mr48253135ad.11.1783239291889;
        Sun, 05 Jul 2026 01:14:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:14:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:17 +0530
Subject: [PATCH 2/8] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant
 register
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=3102;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ycJJry48vK1w/9pKWHhMt2Pa7b3Ht8W/8/Z4qRb1cBM=;
 b=RzMbhCYJ2ZVJ46j3xP2zUIMGGw8WVIy+lZYD70YsCCbS1sIJXmkNFXeiuEyreMuBB7MYQZS1g
 RXh6zlYFDeoD3GtnpNrTlKyIUkDM7BSY1PSqKYgqQVY0hbbpW7vVH5g
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX+tOgtb9IV4nd
 FDBsOh4dIP7UNm2i3SrvbotPrsTGBeivm18iTOkrq8/orBGnC1vpvcD8rLYg0sQAUA3Fs7O7gDT
 V6m3M5uq0iNPrbM/IdhgPtxVDrpmknBK5P+6W0/ySMOeSZtsxhE/kPjOhbPIyXYm+wZL/jgN25K
 gWSclEMn2VWKlLQvfUCznnALvycor5eB6pk5eWS3Y1/FOyOLPcgq8DuAMqo7gB8mOGMxwOn4yX2
 wCyS+oN03XhiECe2l/JS//xn8DNfmRdzUre07hCJen9NjcyVRQ6LRAe9siUbMFgriYf3RgQZNrx
 yFz8i7+WR2ixezDo/x786BDG65XFwsaj0FUYvr4Z+6oN30h67IogTaL5tasgdYaTQw8mOB/e7sN
 b5X6oFY4sluqpnWT/m0PQsgmdh0zCXAdhjhGv0Kl9a7Hok/O+r+Z9JNTzgY0/Oeo3ZP9yhU52wt
 V/d60hmNHVYJBE8fCBg==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4a127d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=W9u8H8Hp_niEWJubwdoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: _rcM_2_5j9KtZBUciLR19ghvxrY8zBPO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX6HK6eZkEuyyx
 Fcv7pWSxB6OqzaZcJSFVwF1C7bVKOvxWknE4nW+ucpKFbBBhx4K43pumQapw/XTKBGLGaRXoEjr
 w+bv4PUWxFFkxU9GUJFKzgWGrlH0q+Y=
X-Proofpoint-GUID: _rcM_2_5j9KtZBUciLR19ghvxrY8zBPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050082

The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
A722, for example), so it should be tagged as an A6XX variant to match
the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
register XML and rename the generated macro accordingly at all existing
usage sites.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         | 2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index a98d550b72d0..4b68416e4d05 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2180,7 +2180,7 @@ static const struct adreno_reglist a840_gbif[] = {
 	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
-	{ REG_A8XX_GBIF_CX_CONFIG, 0x20023000 },
+	{ REG_A6XX_GBIF_CX_CONFIG, 0x20023000 },
 	{ },
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2e5d7b53a0c3..4a3c8dc8bb88 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1032,7 +1032,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
 
 	if (adreno_is_a8xx(adreno_gpu)) {
-		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+		gpu_write(gpu, REG_A6XX_GBIF_CX_CONFIG, 0x20023000);
 		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 9e44fd1ae634..6a75bfb6cec1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -228,7 +228,7 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		 * GMU enables clk gating in GBIF during boot up. So,
 		 * override that here when hwcg feature is disabled
 		 */
-		gpu_rmw(gpu, REG_A8XX_GBIF_CX_CONFIG, BIT(0), 0);
+		gpu_rmw(gpu, REG_A6XX_GBIF_CX_CONFIG, BIT(0), 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 3349c01646e1..69dd0446f8d2 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1268,7 +1268,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1" variants="A6XX"/>
 	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2" variants="A6XX"/>
 
-	<reg32 offset="0x3c00" name="GBIF_CX_CONFIG" variants="A8XX-"/>
+	<reg32 offset="0x3c00" name="GBIF_CX_CONFIG" variants="A6XX-"/>
 	<reg32 offset="0x3c01" name="GBIF_SCACHE_CNTL0"/>
 	<reg32 offset="0x3c02" name="GBIF_SCACHE_CNTL1"/>
 	<reg32 offset="0x3c03" name="GBIF_QSB_SIDE0"/>

-- 
2.54.0

