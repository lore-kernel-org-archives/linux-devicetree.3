Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28B42D3733
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278862; cv=none; b=Rfcjac7/wqy6tnhHQp10ZIA0wPzr5sZwjScpN0e0J3a2D2INcfZuwkICwmFVcLnp7DEM4zUou8y8c00t7zAiiuqgQOvkAJgXpNb5Ckzf9DZH/PrtpugMB/xBz9JyHncDw7b6mPwNTvk28crpnoxdkQoYO5FaT9kMzm1QMFiNFPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278862; c=relaxed/simple;
	bh=bbKLUcBLFub1tb5TatUPZPAkNtWF5490OkNoXJdO3Uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtPOqFepSFG719BotUnHz9GP+UTesSPHFxVZda+WcW2h3hzdVWQAYRxsjFUP2T3FRcG/CFO3jvSbBwHstKWDyIFo4g3DeZq0pmYszXHEdcU5adOVbBxww2KP9UON/uDonBEo6KQOOVfAn/8K8nxflOVJS0K/CZHKdwfEf4XzW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bat8PQbw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bat8PQbw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2560335f8f.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278859; x=1783883659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDQluHb0hl8HpKdUOUtAwKScA61PoZ6/9MDK96/p22Q=;
        b=Bat8PQbwE3k4HgVVMEDBJsVnSgAfJgyAGPFvHXE9lneEOM87MDsI9VSeovc05LTdcv
         eGGvE8FC8uKHKjzMz6/s2vZDxNVk0VHemnJzb8fHV0crhB61tXaSptYsgsxabLBCgT4B
         iMfRBKzULA4RMgkBUHMrx+iMAGD/AaBIuVKg1oR/YLn4EFOroVBib2fGcioQ0mptJM+f
         DM4EtPq2gQfWqEGUaq4WPHtLRj5pOzzBD7cfk8ULPiPY6SRoTMxkVPYLZQ2CuqfNBAU7
         6TbL5RCk+R5f8K4VB3pN7klqkaDP2CEJC2/5cP1kW5TeouFtx8zEXrZZ5rFJDto7aGAY
         g60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278859; x=1783883659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDQluHb0hl8HpKdUOUtAwKScA61PoZ6/9MDK96/p22Q=;
        b=l+AudkS23SJDBtH+3tM7Jb6i49S9y4T1dLLOcUxu97DGJYmKiHrxbFvGdSyQ5fYLWF
         S8rc73AC5Gtlwz7xyJ+WW53MaBlxgCayP66XDKTSPTzViOlnvdwNUUaeZm4EY+v2Dyeo
         eoDRRgeD/Vr05btX/i1YU6AnhGQzugK7bOnr+4xQI8c6NhsCW8/baMt6M2UiGNEKIOXX
         SOmDxO7/ZJ00i2S4IAaTVT3658nMWhjH8pFYe2qBwMV96UVPtAwbjqLMOdWZq560kNgU
         kLcZ4u2+Knehezqj9ewwEtqDFAvP2wZFfm1DLaDLVJB2BtFPfdocdRowfSx2cKQn8uF3
         aM/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrabOZYC5prPAw9PvWmVH7BmqFUZAYBc9foR+XOtsO1Dm8D/sdxXJW+7bUOqIXUQoxlpWUMjvixaTG/@vger.kernel.org
X-Gm-Message-State: AOJu0YwxJplwUlM/qPbhKEqkbygiEyMlThwcsH/MsA+zWuiuEghdVDoD
	i1ZCEbLQMHT0WBwJbQSs2DOxYmssgwd6oIRpG9c0fhpUceal0r3zBS0=
X-Gm-Gg: AfdE7cnLrbzlpw12y7Lu9un9xcVFr5HqyXg8Pr316lVxpr3Ki2NqhOmc17lGUoa1DAA
	8kcdI3w1l69m/iNYFBMd2dV5VCVbb2T4Y88ba6hXrG2oUkHH5ls9WTviiyIf0IHOPZMnI4a30gI
	5Rzy++CF+3jb/SM8KI44VlkGNiVPdNaavrWqdMSrnUrDTxXNZlT2IisWI/fd/6bvjEBhNQJf168
	VLsfXMFLVfcs3g1X9qReQmwqXlMpD6K1VEbEJMQDU80zGeCcRO5zat/pL7MiX8RjmqIAZ0a0ygp
	TSX4RktaFV7AdwpGwrgXunuBJEyr9vvKVe1vQ75tIftRrklP0hxz0qsxjP9wV0x/pE1Z091N07a
	7Guox6DHtSUUlsDqlhurpZ8rgGn9TCS/CQuFLemLlIqPmky06/7VRWl/RZL4OwcwtfC3gnAMAsm
	iB9l8rVs2YY2OAnxHXNMOkq7uinB9QKQ==
X-Received: by 2002:a05:6000:41e2:b0:46f:ca9:465a with SMTP id ffacd0b85a97d-47aaa60d512mr9236488f8f.21.1783278859133;
        Sun, 05 Jul 2026 12:14:19 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:18 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:37 +0200
Subject: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=3023;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=bbKLUcBLFub1tb5TatUPZPAkNtWF5490OkNoXJdO3Uk=;
 b=7V8X3RcC17AsLp4EvKV8VBh99CxZsYWbT6DX1+PJ1oeSqvZHrZHxSjd1CzKlfExV5zUSLhrW1
 hjyiu/P/E73CA/bsNLALt50GwglEelh/PKZjB7H/Z0Rc38c39U6bUFN
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

In order to associate the SID used by LPAC to it's own domain and
context bank we need a separate node on the DTS.

Add the code to look up that node on initialization.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h           |  1 +
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f3fc7032fadc..71ce4cbbf27a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -11,6 +11,8 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -201,7 +203,9 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	struct drm_gpuvm *vm;
 	u64 start, size;
 
-	mmu = msm_iommu_gpu_new(&pdev->dev, NULL, gpu, quirks);
+	mmu = msm_iommu_gpu_new(&pdev->dev,
+				gpu->lpac_pdev ? &gpu->lpac_pdev->dev : NULL,
+				gpu, quirks);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
@@ -1187,6 +1191,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *lpac_node;
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
@@ -1200,6 +1205,20 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
 	gpu->pdev = pdev;
 
+	lpac_node = of_parse_phandle(pdev->dev.of_node, "qcom,lpac", 0);
+	if (lpac_node)
+		gpu->lpac_pdev = of_find_device_by_node(lpac_node);
+	if (gpu->lpac_pdev) {
+		of_dma_configure(&gpu->lpac_pdev->dev, lpac_node, true);
+		platform_set_drvdata(gpu->lpac_pdev, &gpu->lpac_adreno_smmu);
+		if (!device_link_add(&pdev->dev, &gpu->lpac_pdev->dev,
+				     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER))
+			dev_err(&gpu->lpac_pdev->dev, "failed to link to gpu device\n");
+		pm_runtime_enable(&gpu->lpac_pdev->dev);
+	}
+	if (lpac_node)
+		of_node_put(lpac_node);
+
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
 	    adreno_has_rgmu(adreno_gpu) ||
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e2291dfe3ca8..271956e7f870 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -172,6 +172,7 @@ struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
 	struct platform_device *pdev;
+	struct platform_device *lpac_pdev;
 	const struct msm_gpu_funcs *funcs;
 
 	struct adreno_smmu_priv adreno_smmu;

-- 
2.54.0

