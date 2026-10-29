Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282007;
	b=jZok8eSNHFkw6i/cxqJHW/M6b8EbPBXyzaVKXsoOIJj1XAhRcWRFbYBf8grIy/nqcCiQ
	 vc0euTLzmHPdELICvZ0+BDblglXwGvjx5/astugKLHl/k0T78DEPDO4BLyf2OG2QQGUoI
	 l8F4vv7fzhbUAmepb7MvExmnAYgPINW1Pr3LR0A4RJmHOz2/FDtqRYeswC4lVFWV4GA6h
	 Qqw7iksFFW1NH1M6JQnSYKQiMBQ6KvRKQ3sf4MRXa2E1sLt0brg90c9LDhq/d1Y8/sYfQ
	 O2K3LjEK+V5N/dpuFDMW4pNBRA+7z8q8RWpxzlYoU7OMba9WZjrfJwVz0ScU+/68JtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SJAvZIZ6+wa++rRxCrb9LV21I8oimG6NFA16/NhWSCc=;
	b=1TEbtJIc8nVoa86wnewKERId8yLAY4Ye+2bPc+rorFDYk2BPtcUGEvQblueazynUpPRD
	 cvc4BXFsRIxgRBSY1RqKQ3jwlY/dUp7oOxHnlm1JybyGl73Ao2gGbmua0jJZ1d1heCIeC
	 he15EF3VXPUMfP3xw3Cu6vjvLniAMjtbd1OLSLlEj5Qi2XWCPYXarDosY3NmBXYF0BUH2
	 6FCceW5V77T9y7oh4q9zTIyofBgf6e8KT95o5iS8A0B5/cfvdS16f0oGQvJ1Xp8qkVABA
	 SPIcbGk/ef/R0g0CVsvQeYm7CfXEbY00aTkwc1YXETb9TzCIix9GYkI5m7b9qr6xmqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxX61Adm;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA2C60A5BFD
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA2C60A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxX61Adm
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1260339f8f.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282005; x=1793886805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJAvZIZ6+wa++rRxCrb9LV21I8oimG6NFA16/NhWSCc=;
        b=sxX61AdmcJUcES57v2HxLPcR+Myf/eYDjlkwM5Wz8MhRK3ZHVOM8/Hh4fZdBWSoccr
         erfwS9TDwZsu54UaBxET5B5V/v0pBt+li89M3b2v0BUBKxlmGWQya1CR6RcIha44HN0R
         v4bTPxeYKXx9KNaN+yJtvX0EmhR92nTL7CqbyfpvlQ76MK2JIkZ4lqPoGO6qIzivbMSb
         yVQ7N7mkuMtGo1P2Hfkn7BHIzq/2QnuL4HIbTIiNR9/s+Ho6RMGxEXT4iENG3ZHWb5I/
         dxvRrfpyFbEWJ9UJyDWt7tgmFQvaH3EJd7z0SFs2TIHUs6BOTnm9cbuqULefbyQ/cHAt
         Y0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282005; x=1793886805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJAvZIZ6+wa++rRxCrb9LV21I8oimG6NFA16/NhWSCc=;
        b=ev44APezuaa/RQSMu7++dJYDLsXLZ2oCjVYNA9ZBBU1w7OS0xLsiMsuaxyGGJdL29H
         7N5CodWsaH5K9n4x/84iOzAjpTXRByjQjgltPHqyECN85QYG9Wes6ntePO3LAaKh2yHR
         22+zHYRHo0DOc5nPobwyV3Y8gPI7Z5LnR1sPnBXWNGmxxayJjVZEAfpVoc9c5/GchAuN
         MU/lHf7v2utRUp/HcYeSsypAL0ia2Mtwq3ScgWxiPLSlEsi7x+MLwkhIxpa3beyQQOEZ
         hnPXKihGSxif35pYbICvQ2BVb2dYRkdy1nv3qRFT5lNgJxLOtM0L/PPr2gJTSHvu/GZK
         yy/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmLD3HUP/yVjaCcVdOilFMv0UxJbYThWDRgv7Ywo+t+BKUjdD3vqu1ZiJcBF+W2JqSj332u5ScQykn@vger.kernel.org
X-Gm-Message-State: AFq9FYJokKSsHeJVR/vwYUkawoaGVvQ9AnMhHPu+TW3qlHDUOAVbpJt4
	B7W0kpFb+pGP3bemKReJWM+QkEwxKTbAc0gvTkAshRQmOps4yP+5VF0=
X-Gm-Gg: AYBFou3cV3zfKqXl294cVDTU5NrVyxPod1ly8HXv3nPjqpCQ2GiTcisV9X+WaO6RX6/
	DiNHdrqSDxJLSdEJfQmLN2Imwl9cDTVGD6uN2/lrmTSdVdRUVN0HP46WfpUcsx0kT6CVpL4MXEn
	jAKrqEFznqPtAcpISCaAKqVmIwx76AV9gerY/QwGIGoUilE4PuyZHZzPSmnw9A8mWrWpkZm7xFy
	O+TdGH3EW+NtL19HeaaeKY4jxUCDFcg9uf7rdbMd29aQkd3nqi9TyDLOko0ef6x14J4DhuBArx2
	YUt+ti5mWoLjT8AbrQyihvoxOgJQ6RVfEwSrmpIs8C4NvXrPykb6f1kvDiVUI1b7m9RSn8729vv
	emjS8FGE+D8r2duuyugrL9bQCKqTaj4UfajGnKP9YJP3nzhhWvcbOHxtbc4Eu+uL2lm4IdCqG1J
	LKB15lM4l1tMED/DT1XzFmxlwBiiXV+f7myeCejm2H0jto3PNRjgqTduGZmUWDa3LIYb2d9uATs
	/8j8Dm3+IHT8DkkIvgrR1+yATwP807/GCtlNvWBZPUKuYiRvNfQt1p+uc8LHhOoq4PccJx9TpVP
	o8krT/aNN6HGdSCJt6Gm/v21rZXmU2dn60KoVrKhxpZNB9giPgDuqFw5NJqzI8Jl9D0=
X-Received: by 2002:adf:fc8b:0:b0:48d:ca32:e90f with SMTP id ffacd0b85a97d-48e5d5e0167mr10244342f8f.55.1793282004707;
        Thu, 29 Oct 2026 06:53:24 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:23 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:46 +0100
Subject: [PATCH RFC v2 09/14] drm/msm: initialize LPAC ring
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=14622;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=f8EvJqvvdp9FH4cgz4FrbTlGR+xPFycpbVbUqPhx1jA=;
 b=Dt6OFL2N3Hv33O2Q7m2QaCUpf7vR3F1zmc22Rbocf4QOj1Ni08wUyfKwBRJ9AX87bi2o7FRZP
 ZJyGCj3p0NwBn4HXCGLny+j9LZG3AZ3XzaMUQMlYRDodxwuZO930j9z
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Program all the register needed to start up LPAC and send initialization
sequence.

Additionally, now that the LPAC ring is live, make the code aware of it.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 107 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |   6 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  34 +++++----
 drivers/gpu/drm/msm/msm_gpu.c              |  47 ++++++++++---
 drivers/gpu/drm/msm/msm_gpu.h              |  10 +++
 6 files changed, 179 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..5ee00eead14c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1394,6 +1394,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,
 	REG_A6XX_CP_PROTECT_CNTL,
+	REG_A6XX_CP_LPAC_PROTECT_CNTL,
 	REG_A6XX_CP_PROTECT(0),
 	REG_A6XX_CP_PROTECT(1),
 	REG_A6XX_CP_PROTECT(2),
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8b3bb2fd433b..e7bc12de650c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -168,6 +168,18 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 	update_shadow_rptr(gpu, ring);
 
+	if (ring == gpu->lpac_rb) {
+		/* Copy the shadow to the actual register */
+		ring->cur = ring->next;
+
+		/* Make sure to wrap wptr if we need to */
+		wptr = get_wptr(ring);
+
+		a6xx_fenced_write(a6xx_gpu, REG_A7XX_CP_LPAC_RB_WPTR, wptr, BIT(3), false);
+
+		return;
+	}
+
 	spin_lock_irqsave(&ring->preempt_lock, flags);
 
 	/* Copy the shadow to the actual register */
@@ -730,6 +742,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
 		  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
 
+	if (gpu->lpac_rb) {
+		gpu_write(gpu, REG_A6XX_CP_LPAC_PROTECT_CNTL,
+			  A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN |
+			  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
+			  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
+	}
+
 	for (i = 0; i < protect->count - 1; i++) {
 		/* Intentionally skip writing to some registers */
 		if (protect->regs[i])
@@ -972,6 +991,53 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
+static int lpac_cp_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct msm_ringbuffer *ring = gpu->lpac_rb;
+	u32 mask;
+
+	OUT_PKT7(ring, CP_ME_INIT, 7);
+
+	/* Use multiple HW contexts */
+	mask = BIT(0);
+
+	/* Enable error detection */
+	mask |= BIT(1);
+
+	/* Set default reset state */
+	mask |= BIT(3);
+
+	/* Disable save/restore of performance counters across preemption */
+	mask |= BIT(6);
+
+	/* Enable the register init list with the spinlock */
+	mask |= BIT(8);
+
+	OUT_RING(ring, mask);
+
+	/* Enable multiple hardware contexts */
+	OUT_RING(ring, 0x00000003);
+
+	/* Enable error detection */
+	OUT_RING(ring, 0x20000000);
+
+	/* Operation mode mask */
+	OUT_RING(ring, 0x00000002);
+
+	/* *Don't* send a power up reg list for concurrent binning (TODO) */
+	/* Lo address */
+	OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
+	/* Hi address */
+	OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
+	/* BIT(31) set => read the regs from the list */
+	OUT_RING(ring, BIT(31));
+
+	a6xx_flush(gpu, ring);
+	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
+}
+
 /*
  * Check that the microcode version is new enough to include several key
  * security fixes. Return true if the ucode is safe.
@@ -1096,7 +1162,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 	if ((adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami) &&
 	    !a6xx_gpu->shadow_bo) {
 		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
-						      sizeof(u32) * gpu->nr_rings,
+						      sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),
 						      MSM_BO_WC | MSM_BO_MAP_PRIV,
 						      gpu->vm, &a6xx_gpu->shadow_bo,
 						      &a6xx_gpu->shadow_iova);
@@ -1289,6 +1355,9 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
 	}
 
+	if (gpu->lpac_rb)
+		gpu_rmw(gpu, REG_A6XX_UCHE_DEBUG_CNTL_1, BIT(30), BIT(30));
+
 	if (adreno_is_a640_family(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
@@ -1386,6 +1455,13 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, BIT(24));
 	}
 
+	if (gpu->lpac_rb) {
+		gpu_write(gpu, REG_A7XX_CP_LPAC_CHICKEN_DBG, 0x1);
+
+		gpu_write(gpu, REG_A7XX_SP_CHICKEN_BITS_2, BIT(4));
+		gpu_write(gpu, REG_A7XX_SP_LPAC_CHICKEN_BITS_2, BIT(4));
+	}
+
 	if (adreno_is_a690(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x90);
 	/* Set dualQ + disable afull for A660 GPU */
@@ -1437,13 +1513,19 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 
+	/* Set the ringbuffer address for lpac */
+	if (gpu->lpac_rb)
+		gpu_write64(gpu, REG_A7XX_CP_LPAC_RB_BASE, gpu->lpac_rb->iova);
+
 	/* Targets that support extended APRIV can use the RPTR shadow from
 	 * hardware but all the other ones need to disable the feature. Targets
 	 * that support the WHERE_AM_I opcode can use that instead
 	 */
-	if (adreno_gpu->base.hw_apriv)
+	if (adreno_gpu->base.hw_apriv) {
 		gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
-	else
+		if (gpu->lpac_rb)
+			gpu_write(gpu, REG_A7XX_CP_LPAC_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
+	} else
 		gpu_write(gpu, REG_A6XX_CP_RB_CNTL,
 			MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
 
@@ -1451,7 +1533,10 @@ static int hw_init(struct msm_gpu *gpu)
 	if (a6xx_gpu->shadow_bo) {
 		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR,
 			shadowptr(a6xx_gpu, gpu->rb[0]));
-		for (unsigned int i = 0; i < gpu->nr_rings; i++)
+		if (gpu->lpac_rb)
+			gpu_write64(gpu, REG_A7XX_CP_LPAC_RB_RPTR_ADDR,
+				shadowptr(a6xx_gpu, gpu->lpac_rb));
+		for (unsigned int i = 0; i < (gpu->nr_rings + !!gpu->lpac_rb); i++)
 			a6xx_gpu->shadow[i] = 0;
 	}
 
@@ -1469,9 +1554,17 @@ static int hw_init(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++)
 		gpu->rb[i]->cur_ctx_seqno = 0;
 
+	if (gpu->lpac_rb)
+		gpu->lpac_rb->cur_ctx_seqno = 0;
+
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
 
+	/* Enable the LPAC SQE_to start the CP engine */
+	//TODO is this needed? Doesn't fw do this at init?
+	if (gpu->lpac_rb)
+		gpu_write(gpu, REG_A6XX_CP_LPAC_SQE_CNTL, 1);
+
 	if (adreno_is_a7xx(adreno_gpu) && !a6xx_gpu->pwrup_reglist_emitted) {
 		a7xx_patch_pwrup_reglist(gpu);
 		a6xx_gpu->pwrup_reglist_emitted = true;
@@ -1481,6 +1574,12 @@ static int hw_init(struct msm_gpu *gpu)
 	if (ret)
 		goto out;
 
+	if (gpu->lpac_rb) {
+		ret = lpac_cp_init(gpu);
+		if (ret)
+			goto out;
+	}
+
 	/*
 	 * Try to load a zap shader into the secure world. If successful
 	 * we can use the CP to switch out of secure mode. If not then we
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4d22223c3323..6e2333466d7f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -359,6 +359,9 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 
 		drm_sched_wqueue_stop(sched);
 	}
+
+	if (gpu->lpac_rb)
+		drm_sched_wqueue_stop(&gpu->lpac_rb->sched);
 }
 
 static void resume_scheduler(struct msm_gpu *gpu)
@@ -370,6 +373,9 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 		drm_sched_wqueue_start(sched);
 	}
+
+	if (gpu->lpac_rb)
+		drm_sched_wqueue_start(&gpu->lpac_rb->sched);
 }
 
 static int adreno_system_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4389559e1d17..085e1b9044bc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -655,6 +655,22 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 	return bo;
 }
 
+static inline void init_ring(struct msm_ringbuffer *ring)
+{
+	ring->cur = ring->start;
+	ring->next = ring->start;
+	ring->memptrs->rptr = 0;
+	ring->memptrs->bv_fence = ring->fctx->completed_fence;
+
+	/* Detect and clean up an impossible fence, ie. if GPU managed
+	 * to scribble something invalid, we don't want that to confuse
+	 * us into mistakingly believing that submits have completed.
+	 */
+	if (fence_before(ring->fctx->last_fence, ring->memptrs->fence)) {
+		ring->memptrs->fence = ring->fctx->last_fence;
+	}
+}
+
 int adreno_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -682,20 +698,12 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		if (!ring)
 			continue;
 
-		ring->cur = ring->start;
-		ring->next = ring->start;
-		ring->memptrs->rptr = 0;
-		ring->memptrs->bv_fence = ring->fctx->completed_fence;
-
-		/* Detect and clean up an impossible fence, ie. if GPU managed
-		 * to scribble something invalid, we don't want that to confuse
-		 * us into mistakingly believing that submits have completed.
-		 */
-		if (fence_before(ring->fctx->last_fence, ring->memptrs->fence)) {
-			ring->memptrs->fence = ring->fctx->last_fence;
-		}
+		init_ring(ring);
 	}
 
+	if (gpu->lpac_rb)
+		init_ring(gpu->lpac_rb);
+
 	return 0;
 }
 
@@ -1253,6 +1261,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu_config.nr_rings = nr_rings;
 
+	adreno_gpu_config.has_lpac = !!(config->info->quirks & ADRENO_QUIRK_LPAC);
+
 	ret = adreno_get_pwrlevels(dev, gpu);
 	if (ret)
 		goto err_put_lpac_pdev;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 20581be10ca7..aa3d6ff456fd 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -739,8 +739,8 @@ static void retire_submits(struct msm_gpu *gpu)
 	int i;
 
 	/* Retire the commits starting with highest priority */
-	for (i = 0; i < gpu->nr_rings; i++) {
-		struct msm_ringbuffer *ring = gpu->rb[i];
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 
 		while (true) {
 			struct msm_gem_submit *submit = NULL;
@@ -782,6 +782,9 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++)
 		msm_update_fence(gpu->rb[i]->fctx, gpu->rb[i]->memptrs->fence);
 
+	if (gpu->lpac_rb)
+		msm_update_fence(gpu->lpac_rb->fctx, gpu->lpac_rb->memptrs->fence);
+
 	kthread_queue_work(gpu->worker, &gpu->retire_work);
 }
 
@@ -975,21 +978,21 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	}
 
 	memptrs = msm_gem_kernel_new(drm,
-		sizeof(struct msm_rbmemptrs) * nr_rings,
+		sizeof(struct msm_rbmemptrs) * (nr_rings + config->has_lpac),
 		check_apriv(gpu, MSM_BO_WC), gpu->vm, &gpu->memptrs_bo,
 		&memptrs_iova);
 
 	if (IS_ERR(memptrs)) {
 		ret = PTR_ERR(memptrs);
-		DRM_DEV_ERROR(drm->dev, "could not allocate memptrs: %d\n", ret);
-		goto fail;
-	}
+			DRM_DEV_ERROR(drm->dev, "could not allocate memptrs: %d\n", ret);
+			goto fail;
+		}
 
-	msm_gem_object_set_name(gpu->memptrs_bo, "memptrs");
+		msm_gem_object_set_name(gpu->memptrs_bo, "memptrs");
 
-	if (nr_rings > ARRAY_SIZE(gpu->rb)) {
-		DRM_DEV_INFO_ONCE(drm->dev, "Only creating %zu ringbuffers\n",
-			ARRAY_SIZE(gpu->rb));
+		if (nr_rings > ARRAY_SIZE(gpu->rb)) {
+			DRM_DEV_INFO_ONCE(drm->dev, "Only creating %zu ringbuffers\n",
+				ARRAY_SIZE(gpu->rb));
 		nr_rings = ARRAY_SIZE(gpu->rb);
 	}
 
@@ -999,6 +1002,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 		if (IS_ERR(gpu->rb[i])) {
 			ret = PTR_ERR(gpu->rb[i]);
+			gpu->rb[i] = NULL;
 			DRM_DEV_ERROR(drm->dev,
 				"could not create ringbuffer %d: %d\n", i, ret);
 			goto fail;
@@ -1008,6 +1012,20 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		memptrs_iova += sizeof(struct msm_rbmemptrs);
 	}
 
+	if (config->has_lpac) {
+		gpu->lpac_rb = msm_ringbuffer_new(gpu, nr_rings, memptrs, memptrs_iova);
+
+		if (IS_ERR(gpu->lpac_rb)) {
+			ret = PTR_ERR(gpu->lpac_rb);
+			gpu->lpac_rb = NULL;
+			DRM_DEV_ERROR(drm->dev,
+						  "could not create lpac ringbuffer %d\n", ret);
+			goto fail;
+		}
+
+		//IMPORTANT when rebasing on preempt aware hangcheck initialise lpac_rb hangcheck_timer
+	}
+
 	gpu->nr_rings = nr_rings;
 
 	refcount_set(&gpu->sysprof_active, 1);
@@ -1031,6 +1049,11 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->rb[i] = NULL;
 	}
 
+	if (gpu->lpac_rb) {
+		msm_ringbuffer_destroy(gpu->lpac_rb);
+		gpu->lpac_rb = NULL;
+	}
+
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	platform_set_drvdata(pdev, NULL);
@@ -1050,6 +1073,10 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->rb[i] = NULL;
 	}
 
+	if (gpu->lpac_rb)
+		msm_ringbuffer_destroy(gpu->lpac_rb);
+	gpu->lpac_rb = NULL;
+
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	if (!IS_ERR_OR_NULL(gpu->vm)) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 271956e7f870..2f6a96e560b9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -30,6 +30,7 @@ struct msm_perfcntr_stream;
 struct msm_gpu_config {
 	const char *ioname;
 	unsigned int nr_rings;
+	bool has_lpac;
 };
 
 /* So far, with hardware that I've seen to date, we can have:
@@ -181,6 +182,8 @@ struct msm_gpu {
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
 
+	struct msm_ringbuffer *lpac_rb;
+
 	/**
 	 * sysprof_active:
 	 *
@@ -323,6 +326,13 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 			return true;
 	}
 
+	if (gpu->lpac_rb) {
+		struct msm_ringbuffer *ring = gpu->lpac_rb;
+
+		if (fence_after(ring->fctx->last_fence, ring->memptrs->fence))
+			return true;
+	}
+
 	return false;
 }
 

-- 
2.56.0

