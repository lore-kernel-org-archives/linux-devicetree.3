Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1137B40A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320930; cv=none; b=YUH7ahEyIMxn8hV19rp73Q9Eg6tb/KOwH1//j7t6hf6JkMiwHl9QYUrGX4HsoWxxNR0kcGoPP3wJioToSMrmkHbRx3U+dVswTnEpcYxgU8Pi65hUNc8D5isJ4a9DkQQCLsB8Kp3je4OKfdO92EeR58zuaazZLV1LfQV+0TDDvy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320930; c=relaxed/simple;
	bh=OTjz/hUYsdXL1nGMP1P88FY2BvXLf3kfPOscxh457b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IT54iu4+0XGsJHvgKL6KWmQfe/9+My6JkEl7y0KsW343BX967kXKAyKW/pQP+/M4Eo/JpNdm/eF/I2dU+j8y0HB89RWIUBWq2TaPiSqoL1XjKSh8j1LS+d8D6VzpS1gGfJz+rn4f9on4G63DMSL6FdbSpvdQ7ZoGykN62ysYk0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8KWpHMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHL2Z92c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8KWpHMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHL2Z92c"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtNno2619448
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=; b=F8KWpHMRjsjMPMsl
	iZCB39fkxhgaevrxxSw/OnsjJu9+UxkQXWwyBPOT+jkzHSgljNuwfR7rUYwSxqBj
	97ZmV+/G7hGE5Xy3FoeF2vRifP56AW3n4++Q6qbFuWC9LZDrXBRmsdvMY9Y3m/3W
	JTladnYYNU26T2lZCh4aEjapaV/kTGlnmi8WGIEIlYuvhEiwWdNvxFT/fmuhoQu5
	HNiMz5Mxfl8UV9xci0w+ayfeCtSJ68XMLnAeCljwOQ6KhI7Oaqn3rihx1GWzciVU
	MMb8dhXBsTpKqwWFXnYvm/VipgnF/2ly2maxApBLr7xG32iInLxmzEiovSZ8DRVz
	Ih6oew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffagb6nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:42:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2226753a91.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320927; x=1784925727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=;
        b=cHL2Z92crkdvNhfwNdrx4OH5AQ2qI9zJaCWWLyRtNsx/5dn51vxA1JqOcgLi1lL26z
         dwe+JbOxVK4JREuo9kxRwwnv8QRQezR7Bz/mNud6gYtk+VKIw0/WqeJIYgDO73CbmQJi
         Qx9ynj47KxuLtWpmuLGpVkL8Qar6ghm+4qqPkRj1SPu9XYkuoG2ObbLELN1nK+6qCPLy
         LVaIhuWCROfHitKGAsbxVvtfSnCPc24YDC3N8YFmk2D7EZGIcbpbB59DHShihh6cbdvC
         45GMH8Uvlf9PtpRLkPMlWFshiWUzqx7endVwEJx+12cOiIMtyLBYK8raJfqktMReMQ5t
         wZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320927; x=1784925727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=;
        b=OfS66MgW786GkWeZIYkystMvoRNFF8FlSVlf0KNKB2Gec9Fxqk4ou5fvj0OuD6nAqK
         1xDdOyXbQ07gR5ul9vEoBq9VwWHGmH8DGr3RPbMR5ITKFz5W1XHZVCOEffOoqrI5dApH
         XSOBk035D3I4SLSWu9VwXO+KoLVZLSMGNGZZzVTEw12WE666/yr9hB7jjuIGGmWMgv6m
         U1uguwX2e4UHaKjTbYC3xk2df6n5iAKCM/vHm5NrualeWWoKLYGARwlJLaN9NYmpRQeV
         7aDutxTsk0fPXfoEMkTetMXL7y5tNBVu77hPPgLUXJArW8nie7RALmKVX3ggxYoO7uaa
         Gx6w==
X-Forwarded-Encrypted: i=1; AHgh+Roh1VW2m9bO/xKb6vD/SeWZZK9V+tfL4DGxfqLZ9nbFE7CqEMFHLUbdh8nXnul8GdqKcVPgBXhHeHO5@vger.kernel.org
X-Gm-Message-State: AOJu0YwUjwOxIesPZvrkRokRFbM7axDXzw7s8tFizum6S3NReTj3tZDQ
	VJV9lIsBKflsveSiaWDf7A907fna+Mox2SrdYNIbWdXEKKPhr/BsdClsAUiAkKvuQERLEPccaZQ
	NCgc3dGSGNt7xADsihpMM9p+J3+tilynV/0LPC7DatF4RxmpuibyQlBQdFU/RAfnk
X-Gm-Gg: AfdE7ckjqJ68PDuK+9dSTYzmMWw6U6n99HFtiQ8A2Yn45BM3eBG9UzNHiuVK/y41yvL
	+OWEeM4JOg8UzyNEsIz1SpxVJ9SJa6a6EGI5otZDFkZJZ058EBYHV3P5mfW4WFPJp8n8PopQrqT
	LBBDiExPwW40X/aWw+BcRy2e9k3xMju+EyYQXGpl1H6Q5SVmLYwBXFHxBCWkLWB1dcmhZBzO/ZR
	FbXphv47Ig64nx+C1YOB28DE2v9tl5wN7re2JX9yGwX1PLYvZfVhuRiUmMFQy9yDUyIYw6/Ysdd
	jqD0Noqdvg3UpDc1H0jdSuqyvKCANnwN4mb9Ne/Pjhfn7GZVJa09i+V4aZfZU3CfV0dj1/Kyodq
	khCJq+K9N3k+BEblVNTomGtk3
X-Received: by 2002:a17:90b:540f:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-38e3d163538mr10090675a91.5.1784320927535;
        Fri, 17 Jul 2026 13:42:07 -0700 (PDT)
X-Received: by 2002:a17:90b:540f:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-38e3d163538mr10090626a91.5.1784320926891;
        Fri, 17 Jul 2026 13:42:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:27 +0530
Subject: [PATCH v2 2/9] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX-
 variant register
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-2-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=3230;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OTjz/hUYsdXL1nGMP1P88FY2BvXLf3kfPOscxh457b4=;
 b=arW5LOtnhsz7GNASG3k6T6849UaVGE8SxWpxFRJrV5xGwidmIhco5hKA79Zbb2P93PIK0zXO5
 NW9ANLNRiHjBZZmVwziWRlZIJZJK1ayJsn7ebxeRUw+CxcdiSQZwX1A
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX24xtLWBhRadJ
 8pWOnMozFsVS8pa+2VBQXBcPhS6alUhBpqJZI7pz76IKkLefx9mTv0zTQzr2qxVcUGCa6yqafct
 cMwTIg5Nw+iqhNKRNtS8+JxVTltM0nB7dWyCqYXmBp8CtXS0bIaQxg//qlYeSw+Wuc8JnfFxIRV
 7CnkkKZamXZQ1SKV3HM5yCNT3yu4yXwFztqGO/h66lNWq6QkWuC/fD+IihTmQNAPQOqbkFrjwX+
 0cqHxQLfk8s5dZxjobFP4NVAkqqUfiWBzUb4SykZaqOYZgwNrht97N16tAouWZ4hadg0j5ENed8
 pK0pXyuDP+2oCco+BItH3nVRWGsDa0VGx6GpICrVSxzlAWi6woE8YesKRVjlTzDORkD3dCPWwy8
 emnv9gyPZ7Mtu3oh/23g9Fec+jIB7FT3aIrM/Y8rW82QWPlvYgJicm8K3snq0w5tTXKNh2x7o2q
 05Wtl/lk+GCL2VihA2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX3MAqFRjAdi1z
 BvNQasykUXQDVEnh/T/1k/5vqVm99C3kY2bSG6ipwe7ABvLvdh/0icwz2NTMYM3yW/kEfs1FTto
 cIgCK3C+2xXjyWPxT6EVZn6LXmUqK18=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a93a0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=W9u8H8Hp_niEWJubwdoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Yfcb7r1P96flHDR4lRBfStvUL-zcJIQv
X-Proofpoint-ORIG-GUID: Yfcb7r1P96flHDR4lRBfStvUL-zcJIQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170212

The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
A722, for example), so it should be tagged as an A6XX variant to match
the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
register XML and rename the generated macro accordingly at all existing
usage sites.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

