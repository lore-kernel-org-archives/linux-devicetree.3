Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DED48122F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159241; cv=none; b=L1ePpRavXjv0Q7SedrCSv4ci+xLM3siCYPKJI9Rc1v6is8BPk4meQQraXWIdPwwjXSWFWgX4Jvchmc6nkeB8ReM0xRBVyuhCfJL7Ejm80Mhqx8hGaQ9JYNRnp0GrIz9fQWLN4MquY2NktvXigetjZClraPwv87I3nWDNTBfoRys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159241; c=relaxed/simple;
	bh=r8Yu5tb0l7jWK4wCyJ4+Ppu+uskbOfyIKW3R4yDaSUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGwi8wxhCPXeDqa8aYjcH53uGYH8r9TDkAELeiTH78oi2tEdy8iqqteAnVH0+e54EZs9j6yKf9MDEW5kk1j7s7UwYR9Q8h3niP68CMG6wIQtVDRhUWVPtsQOk9V7YEnOmwxBoIMXy0L5AftuoP1bGDc+u66hhs/GjRU88bYiKVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXMWh7I6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHEZjEu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXMWh7I6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHEZjEu1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3BJg2262031
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOjyHEWtGuZjCr/VrUZ6KrtiiGIwDJckbv8O61ITjRs=; b=lXMWh7I6BCc9a1Xg
	OJ+rel88sk7wxqBiynIpx5ySBTcq4DCa9VNhXEU2qJKNLhUfXkABlKoAazX8AeUT
	FrXOy4aovigOqahx/E1Gz29P8/GpE1C0v5VxyWYuX5MZMy85WZrYY8KXb31BDt4a
	tdUQvFp0Af22WmCWF61Tn4KikvYcbdSIN2cslgo9SQ6onkfYO/fzigipkEnUVVc6
	lxm70d2xgcz5kQylT0PS7+/CDH0DZcocvp3EMw83Cy8gIFU5VoPRGQwlOvu4ci4t
	p9szL44+bo2yY6unJHOjNLVzdqlIK0mvOIBPgxVOLLJzpoR1wgDkgMJ4gCb0ysi8
	lI57dA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3hdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:27:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1431ba79941so845136c88.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159232; x=1790764032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOjyHEWtGuZjCr/VrUZ6KrtiiGIwDJckbv8O61ITjRs=;
        b=bHEZjEu18Yc5Xy4HKsXsPGefvg+V9djB7e3gQ+hL4ahhafb3NQ1AKsZxWFQ53brCmf
         EWrtLSe4wsJgnFjccRaN/HvEPc2o90WHhPNSFtV17pJiVOs+t5Ql0OkGm7juKG4Xjs5b
         pGHmpA4jX2nEXC57gS1xxdg429KATb0S/6iT7Fguq5MBecBEkREqfV6IMGY+832WS6od
         fp+QQw7LCBN62gDNCLO6g96J9Mf1h1AerJIDTx87/EcM7NXBG0Lh1blKu60ZskfJ/Up5
         FGld/a7ew2Tv0fHMoQRIFkjt3m0zJoqX+EfdsMqQhe3LFUVYP5Oqd4FoIROIVJJDLkB8
         cKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159232; x=1790764032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOjyHEWtGuZjCr/VrUZ6KrtiiGIwDJckbv8O61ITjRs=;
        b=C755pz1pqhY5AtuCjvcDB4Drk/G87DbSH6N4eL5RHFJFbeTky/3hyPGfShbMXyvEqS
         AXzRhafAi0feDIgoQYXbGsQQ8Xym86C8DME+2atN/j6b0IFLG4n+9/74rcPIv92ta+eZ
         KJkWKx+OFrT52pRPhKfrpe2iF69I4ydSYw/741pAaAxTj1+VL2kElqJ0b1QW0rt2JRG0
         QMbeNw9fPTaKentOA/9Ka38POHaf7AHsMAGKRkOm9zZPr3am6XllZw+pCU4sNqW5pVly
         H086krBLO62uhPJziUQyu0imKBLQnlfzShCs4vEn8le50UYU4jbv/pJLYxxsux2rK8v6
         Zbvw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ6kTgghZ9p05qyHUzI4UpTfU7ip9djdCqQ1TQgyVN3hTJUu2GZoFVhX2zvlBC6fA6Fb3TyoPjtZFI@vger.kernel.org
X-Gm-Message-State: AFuF++nzDXm9tHkKk5t1GmNuRhdH6nPlUlem9QmEeRnJX1bCMb0IRPNu
	CuF2sQxbJNxYiloeA53RxcfI9MHxCO+E7ZCW9F6LxJ+/1lToNJxzgENt7U1M9f1J1pUIj8/5GzN
	xnd1/IfsBxGzLiWuLScgBB4h+wEWezFTXJW2NgwL1T2hnhs80TYhwmOQT3X5eSnyr
X-Gm-Gg: AYBFou3/tJHu0BuQmDuKzC6pmD+t+Mqz8JYFuNLjd3zXY+h1cc4Aa5Eejuc5N4wca83
	PwBHnxUbj5qCUQkuXYhlpK9JyBygJ9OjmFMdV9bFJVWsRuB7TObSKKH1u0pqhqpBDq3AZls8Nfm
	gGLWpn/awW8gzKXYaSRhd1/QmoSftgbHOnujzD0BmYNi4IR8fsyopw2JPxykJ4NEaYzkn2ru74m
	/RqeJ1zQvMVcypj7QRQ9JIDO46eJWoJIDTVz+PtCumtYfs6bQVoA40BJaLaG+r71VOkV0vjvLdQ
	BisLUGstGs2d3XC1Ho3r5pgZd5X4xXt4qsB2jDwhtkVLIRAIx5DKTN4xX8vNmyhmHYRUuKWYyDo
	unGnI8aZ/JgSKMH4DyJsRypc=
X-Received: by 2002:a05:7022:43:b0:143:5d6f:5532 with SMTP id a92af1059eb24-144f916f3femr3112536c88.40.1790159231123;
        Wed, 23 Sep 2026 03:27:11 -0700 (PDT)
X-Received: by 2002:a05:7022:43:b0:143:5d6f:5532 with SMTP id a92af1059eb24-144f916f3femr3112479c88.40.1790159230408;
        Wed, 23 Sep 2026 03:27:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:48 +0530
Subject: [PATCH 08/15] drm/msm/a6xx: Send THINMEM config to GMU for A850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-8-0c3c79a1a470@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=3541;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=r8Yu5tb0l7jWK4wCyJ4+Ppu+uskbOfyIKW3R4yDaSUw=;
 b=VQH6iln49RMi+LSqM9cgazdGzSBd4skt8mdl9ONuSZt9VvEUe1p6XhSpuTJAzz9ZTFJvBemuE
 8FiFfOPDfoOBh8eVGmn4TinLbwNbifpPPDG+Yjb+7fAGE0/BSfsYO6R
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: qAxhhWqGwd1dx_kP5P2ytYN30dh0hy6P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX3iaq484T+1h5
 6O/2HMIxE0gkuc03enPgofgOH0mHG8612mAVRnBx1Thl8fBQmJeN9GETNKrgq7spHzHgP5T0Chv
 5/wSt96H7lXw3aIU2lR4MxQ/hFuj9lw=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3a980 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uikLNib5dCET3MXmAjQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: qAxhhWqGwd1dx_kP5P2ytYN30dh0hy6P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX0e2WCUiqtfLi
 MWNAOC7tgZ/u4/n0apFa0LUSPZQgc7vwjCteATyMm53kvEe/n0gpBITuVlcWkEKzqtXvmmO1SQM
 BwEiCECKJmhMkqwTR7WLYKE6TFXcIOVsQCRw5jTkUuV5S4PmqKT4KeNyJ8AvTHUqW5NkdHUFv+0
 UdnjX6Vq5HqpvCBBrXr/WbgP7jUxjlLOIikTy3b8WYCN/SeRoBjK71aJh2PgObeI5TvuywqPqk8
 6LSI9bIT6sB9V7RizgAo9rwASrL/g26qkrsU5iHWd/aWbGiXcCKPsumRU1jSSvs3ROrYKuk2HKF
 wbZszeFoIjK+Td2dHIr5a/L6VEvWIwrgoaYeIHexig9A5Hdp+3IFQeS6A0yM8XoO5a+3/0eAXCI
 YTWfmr7KEbAEmCvjlAc4HWzXURYBnbEPAS4IuydoV/ab6dNsBeGVybsE/TgvJSk7Olcr486QlQe
 wZwQMf+kP5m+pvaJRiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Add HFI support for the GMU THINMEM_CFG feature and provide the
configuration value used by the Adreno 850 GPU in the catalog.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c     | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h     |  1 +
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index de576816ec7c..83c6f257f478 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2849,6 +2849,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			.gbif_cx = a850_gbif,
 			.max_slices = 3,
 			.gmu_chipid = 0x80b0100,
+			.thinmem_config = 14,
 			.bcms = (const struct a6xx_bcm[]) {
 				{ .name = "SH0", .buswidth = 32 },
 				{ .name = "MC0", .buswidth = 4 },
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b50c57f427b4..43273e5f8b5b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -42,6 +42,7 @@ struct cpu_gpu_lock {
  * @hwcg: hw clock gating register sequence
  * @protect: CP_PROTECT settings
  * @pwrup_reglist pwrup reglist for preemption
+ * @thinmem_config: GMU thinmem configuration
  */
 struct a6xx_info {
 	const struct adreno_reglist *hwcg;
@@ -56,6 +57,7 @@ struct a6xx_info {
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
 	const struct a6xx_bcm *bcms;
+	u32 thinmem_config;
 };
 
 struct a6xx_gpu {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 186a73c0b99c..e33a2258e0f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -888,6 +888,27 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
 	return 0;
 }
 
+static int a6xx_hfi_send_thinmem_config(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
+	u32 data;
+	int ret;
+
+	if (!info->thinmem_config)
+		return 0;
+
+	/* Bits [7:4] contain the thinmem_cfg data. */
+	data = FIELD_PREP(GENMASK(7, 4), info->thinmem_config);
+
+	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_THINMEM_CFG, 1, data);
+	if (ret)
+		DRM_DEV_ERROR(gmu->dev, "Unable to send THINMEM_CFG (%d)\n", ret);
+
+	return ret;
+}
+
 static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_test msg = { 0 };
@@ -993,6 +1014,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	if (ret)
 		return ret;
 
+	ret = a6xx_hfi_send_thinmem_config(gmu);
+	if (ret)
+		return ret;
+
 	ret = a6xx_hfi_send_core_fw_start(gmu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index e10d32ce93e0..5123349a3de6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -244,6 +244,7 @@ struct a6xx_hfi_msg_feature_ctrl {
 #define HFI_FEATURE_TDCVS		30
 #define HFI_FEATURE_DCE			31
 #define HFI_FEATURE_IFF_PCLX		32
+#define HFI_FEATURE_THINMEM_CFG		38
 #define HFI_FEATURE_SOFT_RESET		0x10000001
 #define HFI_FEATURE_DCVS_PROFILE	0x10000002
 #define HFI_FEATURE_FAST_CTX_DESTROY	0x10000003

-- 
2.55.0

