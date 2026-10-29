Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281985;
	b=TowXhuMqrc7cV5S73I9Jcq7zJf1tELjskpe0/E5002PfzbvkLmF1ZEoRpflHJo/r9SE7
	 vrg6k5WUZ1zpU4pLYsPPRP3uSuI1yv7FTul8MMaVV+ZgaeX/t9BHwK37CVQXgA+3oIYG4
	 gl7k3zUD4aZc1y/F6M4hb2IDAZ7TvIo5n6R+6tv9mO8gEojLDbRJgEciNMacBm9L6Ag9V
	 5wsANtlcnoV8gbUu22+CQG7mZO1hzBI7LW9SEo3HqdJwGQyF9U6UTaUXmFiLRj9Xz80pZ
	 e+tlVlygzkgIXnFEM3O/mMWu5ojriaMaHsIMJEH1pt8hp+T0u9cK0I296ndnDAnkzAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=V9LeGqPkcZkvMAaOCWRDZnBz0+KZqqx0idX6u318GH8=;
	b=r3EOTZLC8YNAfbQfwM23Ua0AIvNk2QdVhYRdp0c1ht1h8S0ADZANELdTJq8nwZVNivOt
	 8JBAMbQTAlslzk7IxDOPr+d+5fFS65etdSKOqMrOc9gdlKXfUnxJf5Qz+3BEhRaQskgee
	 haxwSF5vSHAfzIEjtD40bpZhaXvzHO2K0pWx0kmqd729MfprQyhmW/OX0HNqz/b92cP7k
	 navR9aMcz7a5luRQtu4e9hiBDScgYYi3yz1NW6Nzm2elvWSt7GAcpZWL0zEBO4iXEm7YT
	 8EKrLVFsNVF/kA45agmxiln5xMcz1uJgy3Ggj8BPEtagQvI5P8RwImfBA7azy/VqnmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlLBCYYn;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6380960A260F
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6380960A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlLBCYYn
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1164395f8f.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281984; x=1793886784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9LeGqPkcZkvMAaOCWRDZnBz0+KZqqx0idX6u318GH8=;
        b=hlLBCYYne4KrUPyEJSpwKfrXnAIId30fmQRX12S2ubvrcI0iqGbI12mQI+3LYohASC
         5jPMYB8qspVtQ0XfWndgMSNsSq8FE5ylY2+GG+/rCMiqWXlTMRgo5JHPpwGQo3xr6V3+
         Nq/2XsxHjTGDCJm9V2eE1mUvr/JgQyNzo5epL1KmM3aRQs39qR353XW0Z5Nzcm7nwEff
         qD+eayIu9erEs23xO1IEtH7y0YEhj8BUIrnDXzU/0IKEkt3/bxdjMjufOSfH0tCHZ5Va
         lqe74360uOfu+P5HaA4nYDMhwqGl0haxAi+Eieh8+atOopOLMgl3STYf2o8D3hWUKEbU
         fV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281984; x=1793886784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9LeGqPkcZkvMAaOCWRDZnBz0+KZqqx0idX6u318GH8=;
        b=bh95qhYhw4rKCGFJ/J6l5uKK4c1EV904c32h9tGLxkiZT4lOrZ3h1/vZjSS8kj2FSn
         iaMP4ipx0lqU25oiO/cvHqxLTUmqVikGTyoVIcVwU5RrpK/Ux/8K+0pGOc+NS37t7wJ8
         jrAvs1waxPwoIG1v47yNSivOBf9hPT+odVK4PPP8mXAtAaWNyQ5mJLgjAv7Abt4QMFmM
         qLN9anrZIsJBj/T7fq2mKSq96kBGChSQdkXLibBT1mrOZfKY4WgLAxBT+mzExIIzIHqe
         Khg4UGy/1y8RGYAXMePcD+KIKFd44Z04Tqi3c4fZEr8caFp9BErYEDeAdkTFHBsA371b
         SAUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzFVkX64lqC88Sm8SUqmX3Q6o8tya66jr/IvGpmT7XxzflFG/xzyMy0FYcYhFyPveN8GM9ijtBBxSF@vger.kernel.org
X-Gm-Message-State: AFq9FYL5uQaVfW15QC6t8mO0bKfaOMsw4Mg6WORKI94fFnsBsZsz8DPD
	5NLBNe0U2WOHPTLyzppUkHfWckyWxEUBB2JS5tHVrlKEiap3GfH9wA8=
X-Gm-Gg: AYBFou3BaMUv+Izd7AF6oKE39cO1JNYA6BZK37LwOHIZ5qsEHI1AekvNjA1GV5Ch/yI
	Em7xfJd4O1fY69k1JGhAEQWsQkSK6pr/2TNsaj+bHKmsTa87g2kaQO7RbT7utsqRZcBqogP3vhP
	lNIfw5ctzQOVziun+FC2mcpA4yJ+4TbufYswBjKlmKrIX03PO4610gonB7DnFYYdG0s7AqETLQe
	wLi6OjjBMa75+YUPdnQo9qAmL3k0bPXXf9YwP72wQrlReDcrz48m/zOSadpHcT560XKmcksYVJd
	qVfppId6I0vHwUtznjcHzmi4Z8ufEAjZISq+aOSICuAHXhfvW/61KiH/sSqgUobgwmNqEnn6NuU
	HKFhe+gaGItL7BgBM2/+53Knd+6kIiEbWhSU8Idzad16JqdQqCxKQCz3zFPQ7Zs9pd7OGW+EP7r
	zdQvbttnFCYH8QxfM+w3tBXr+aGtLmrKyHSXp6yCVgznZvL6erxgwUJmRaWfRRKhkPftC3HbBsn
	KVHsXuqjVN55mHJz7wRzUm5wShDZ9/eDZ0tzPbjzzwf6ExQWpU6ItICkRL75rr6aJaImoml5u1M
	TFUIdpu7n8fkw2jVwZCa8109RJ2uQr6wYjFbkVeRMJQ1lA==
X-Received: by 2002:a5d:5e8d:0:b0:48e:5ea7:b1b9 with SMTP id ffacd0b85a97d-48e5ea7b1camr12043233f8f.31.1793281983455;
        Thu, 29 Oct 2026 06:53:03 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:03 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:39 +0100
Subject: [PATCH RFC v2 02/14] drm/msm: add support for lpac_domain in
 msm_mmu
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-2-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=15243;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=4jK+Yh74C6Kj+QYcgrcNq6xZY62RwgtQGRq7cSzR4eg=;
 b=rzDf6ctrxuLiYdo057e4nMKMqLWWUiyergAPmnnK+y0jGzW7fCLdOm1GOBX7W+iOQfS9N+7EU
 Z+neenOkVUYC7mvyJQPzgeYXrUinUYenUE/a/cHS7MypUUweyz0/1yE
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

LPAC (Low Priority Async Compute) needs to use a separate context bank
in order to be able to update the page table independetly.

Add an iommu_domain for LPAC and keep it in sync with the main domain.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h           |   1 +
 drivers/gpu/drm/msm/msm_iommu.c         | 170 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_mmu.h           |   7 +-
 5 files changed, 160 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2e5d7b53a0c3..a91d9b03ca88 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1569,7 +1569,7 @@ static int a6xx_gmu_memory_probe(struct drm_device *drm, struct a6xx_gmu *gmu)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_new(gmu->dev, 0);
+	mmu = msm_iommu_new(gmu->dev, NULL, 0);
 	if (IS_ERR(mmu))
 		return PTR_ERR(mmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c62c45bb0ddb..f3fc7032fadc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -201,7 +201,7 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	struct drm_gpuvm *vm;
 	u64 start, size;
 
-	mmu = msm_iommu_gpu_new(&pdev->dev, gpu, quirks);
+	mmu = msm_iommu_gpu_new(&pdev->dev, NULL, gpu, quirks);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6c83b8cbbb90..e2291dfe3ca8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -175,6 +175,7 @@ struct msm_gpu {
 	const struct msm_gpu_funcs *funcs;
 
 	struct adreno_smmu_priv adreno_smmu;
+	struct adreno_smmu_priv lpac_adreno_smmu;
 
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 058c71c82cf5..0e770ec91a83 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -13,7 +13,7 @@
 
 struct msm_iommu {
 	struct msm_mmu base;
-	struct iommu_domain *domain;
+	struct iommu_domain *domain, *lpac_domain;
 
 	struct mutex init_lock;  /* protects pagetables counter and prr_page */
 	int pagetables;
@@ -127,6 +127,8 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 	}
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
+	if (to_msm_iommu(pagetable->parent)->lpac_domain)
+		iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->lpac_domain);
 
 	return ret;
 }
@@ -224,6 +226,10 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
 	struct adreno_smmu_priv *adreno_smmu =
 		dev_get_drvdata(pagetable->parent->dev);
+	struct adreno_smmu_priv *lpac_adreno_smmu = NULL;
+
+	if (pagetable->parent->lpac_dev)
+		lpac_adreno_smmu = dev_get_drvdata(pagetable->parent->lpac_dev);
 
 	/*
 	 * If this is the last attached pagetable for the parent,
@@ -232,9 +238,13 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	mutex_lock(&iommu->init_lock);
 	if (--iommu->pagetables == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
+		if (lpac_adreno_smmu)
+			lpac_adreno_smmu->set_ttbr0_cfg(lpac_adreno_smmu->cookie, NULL);
 
 		if (adreno_smmu->set_prr_bit) {
 			adreno_smmu->set_prr_bit(adreno_smmu->cookie, false);
+			if (lpac_adreno_smmu && lpac_adreno_smmu->set_prr_bit)
+				lpac_adreno_smmu->set_prr_bit(lpac_adreno_smmu->cookie, false);
 			__free_page(iommu->prr_page);
 			iommu->prr_page = NULL;
 		}
@@ -450,14 +460,22 @@ static void msm_iommu_tlb_flush_all(void *cookie)
 	struct msm_iommu_pagetable *pagetable = cookie;
 	struct adreno_smmu_priv *adreno_smmu;
 
-	if (!pm_runtime_get_if_in_use(pagetable->iommu_dev))
-		return;
+	if (pm_runtime_get_if_in_use(pagetable->iommu_dev)) {
+		adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
+
+		pagetable->tlb->tlb_flush_all((void *)adreno_smmu->cookie);
+
+		pm_runtime_put_autosuspend(pagetable->iommu_dev);
+	}
 
-	adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
+	if (pagetable->parent->lpac_dev &&
+	    pm_runtime_get_if_in_use(pagetable->parent->lpac_dev)) {
+		adreno_smmu = dev_get_drvdata(pagetable->parent->lpac_dev);
 
-	pagetable->tlb->tlb_flush_all((void *)adreno_smmu->cookie);
+		pagetable->tlb->tlb_flush_all((void *)adreno_smmu->cookie);
 
-	pm_runtime_put_autosuspend(pagetable->iommu_dev);
+		pm_runtime_put_autosuspend(pagetable->parent->lpac_dev);
+	}
 }
 
 static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
@@ -466,14 +484,23 @@ static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
 	struct msm_iommu_pagetable *pagetable = cookie;
 	struct adreno_smmu_priv *adreno_smmu;
 
-	if (!pm_runtime_get_if_in_use(pagetable->iommu_dev))
-		return;
 
-	adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
+	if (pm_runtime_get_if_in_use(pagetable->iommu_dev)) {
+		adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
+
+		pagetable->tlb->tlb_flush_walk(iova, size, granule, (void *)adreno_smmu->cookie);
 
-	pagetable->tlb->tlb_flush_walk(iova, size, granule, (void *)adreno_smmu->cookie);
+		pm_runtime_put_autosuspend(pagetable->iommu_dev);
+	}
+
+	if (pagetable->parent->lpac_dev &&
+	    pm_runtime_get_if_in_use(pagetable->parent->lpac_dev)) {
+		adreno_smmu = dev_get_drvdata(pagetable->parent->lpac_dev);
 
-	pm_runtime_put_autosuspend(pagetable->iommu_dev);
+		pagetable->tlb->tlb_flush_walk(iova, size, granule, (void *)adreno_smmu->cookie);
+
+		pm_runtime_put_autosuspend(pagetable->parent->lpac_dev);
+	}
 }
 
 static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
@@ -504,12 +531,16 @@ static size_t get_tblsz(const struct io_pgtable_cfg *cfg)
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
+	struct adreno_smmu_priv *lpac_adreno_smmu = NULL;
 	struct msm_iommu *iommu = to_msm_iommu(parent);
 	struct msm_iommu_pagetable *pagetable;
 	const struct io_pgtable_cfg *ttbr1_cfg = NULL;
 	struct io_pgtable_cfg ttbr0_cfg;
 	int ret;
 
+	if (parent->lpac_dev)
+		lpac_adreno_smmu = dev_get_drvdata(parent->lpac_dev);
+
 	/* Get the pagetable configuration from the domain */
 	if (adreno_smmu->cookie)
 		ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
@@ -528,6 +559,8 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
 		MSM_MMU_IOMMU_PAGETABLE);
 
+	pagetable->parent = parent;
+
 	/* Clone the TTBR1 cfg as starting point for TTBR0 cfg: */
 	ttbr0_cfg = *ttbr1_cfg;
 
@@ -588,6 +621,17 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 			return ERR_PTR(ret);
 		}
 
+		if (lpac_adreno_smmu) {
+			ret = lpac_adreno_smmu->set_ttbr0_cfg(lpac_adreno_smmu->cookie, &ttbr0_cfg);
+			if (ret) {
+				iommu->pagetables--;
+				mutex_unlock(&iommu->init_lock);
+				free_io_pgtable_ops(pagetable->pgtbl_ops);
+				kfree(pagetable);
+				return ERR_PTR(ret);
+			}
+		}
+
 		BUG_ON(iommu->prr_page);
 		if (adreno_smmu->set_prr_bit) {
 			/*
@@ -606,11 +650,16 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 						  page_to_phys(iommu->prr_page));
 			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
 		}
+
+		if (iommu->prr_page && lpac_adreno_smmu && lpac_adreno_smmu->set_prr_bit) {
+			lpac_adreno_smmu->set_prr_addr(lpac_adreno_smmu->cookie,
+						       page_to_phys(iommu->prr_page));
+			lpac_adreno_smmu->set_prr_bit(lpac_adreno_smmu->cookie, true);
+		}
 	}
 	mutex_unlock(&iommu->init_lock);
 
 	/* Needed later for TLB flush */
-	pagetable->parent = parent;
 	pagetable->tlb = ttbr1_cfg->tlb;
 	pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
 	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
@@ -646,6 +695,26 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
 	return 0;
 }
 
+static int msm_lpac_fault_handler(struct iommu_domain *domain, struct device *dev,
+		unsigned long iova, int flags, void *arg)
+{
+	struct msm_iommu *iommu = arg;
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.lpac_dev);
+	struct adreno_smmu_fault_info info, *ptr = NULL;
+
+	if (adreno_smmu->get_fault_info) {
+		adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
+		ptr = &info;
+	}
+
+	if (iommu->base.handler)
+		return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
+
+	pr_warn_ratelimited("*** lpac fault: iova=%16lx, flags=%d\n", iova, flags);
+
+	return 0;
+}
+
 static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *dev,
 				  unsigned long iova, int flags, void *arg)
 {
@@ -660,9 +729,16 @@ static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *de
 static void msm_iommu_set_stall(struct msm_mmu *mmu, bool enable)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
+	struct adreno_smmu_priv *lpac_adreno_smmu = NULL;
+
+	if (mmu->lpac_dev)
+		lpac_adreno_smmu = dev_get_drvdata(mmu->lpac_dev);
 
 	if (adreno_smmu->set_stall)
 		adreno_smmu->set_stall(adreno_smmu->cookie, enable);
+
+	if (lpac_adreno_smmu && lpac_adreno_smmu->set_stall)
+		lpac_adreno_smmu->set_stall(lpac_adreno_smmu->cookie, enable);
 }
 
 static void msm_iommu_detach(struct msm_mmu *mmu)
@@ -670,6 +746,9 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 
 	iommu_detach_device(iommu->domain, mmu->dev);
+
+	if (iommu->lpac_domain)
+		iommu_detach_device(iommu->lpac_domain, mmu->lpac_dev);
 }
 
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
@@ -689,6 +768,15 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (ret < 0)
 		return ret;
 
+	if (ret != len)
+		return -EINVAL;
+
+	if (iommu->lpac_domain) {
+		ret = iommu_map_sgtable(iommu->lpac_domain, iova, sgt, prot);
+		if (ret < 0)
+			return ret;
+	}
+
 	return (ret == len) ? 0 : -EINVAL;
 }
 
@@ -701,6 +789,9 @@ static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 
 	iommu_unmap(iommu->domain, iova, len);
 
+	if (iommu->lpac_domain)
+		iommu_unmap(iommu->lpac_domain, iova, len);
+
 	return 0;
 }
 
@@ -708,6 +799,8 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	iommu_domain_free(iommu->domain);
+	if (iommu->lpac_domain)
+		iommu_domain_free(iommu->lpac_domain);
 	kmem_cache_destroy(iommu->pt_cache);
 	kfree(iommu);
 }
@@ -720,9 +813,9 @@ static const struct msm_mmu_funcs funcs = {
 		.set_stall = msm_iommu_set_stall,
 };
 
-struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
+struct msm_mmu *msm_iommu_new(struct device *dev, struct device *lpac_dev, unsigned long quirks)
 {
-	struct iommu_domain *domain;
+	struct iommu_domain *domain, *lpac_domain = NULL;
 	struct msm_iommu *iommu;
 	int ret;
 
@@ -753,6 +846,39 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 		return ERR_PTR(ret);
 	}
 
+	if (lpac_dev) {
+		if (!device_iommu_mapped(lpac_dev)) {
+			iommu_detach_device(domain, dev);
+			iommu_domain_free(domain);
+			kfree(iommu);
+			return ERR_PTR(-ENODEV);
+		}
+
+		lpac_domain = iommu_paging_domain_alloc(lpac_dev);
+		if (IS_ERR(lpac_domain)) {
+			iommu_detach_device(domain, dev);
+			iommu_domain_free(domain);
+			kfree(iommu);
+			return ERR_CAST(lpac_domain);
+		}
+
+		iommu_set_pgtable_quirks(lpac_domain, quirks);
+
+		iommu->lpac_domain = lpac_domain;
+		iommu->base.lpac_dev = lpac_dev;
+	}
+
+	if (lpac_domain) {
+		ret = iommu_attach_device(lpac_domain, lpac_dev);
+		if (ret) {
+			iommu_detach_device(domain, dev);
+			iommu_domain_free(domain);
+			iommu_domain_free(lpac_domain);
+			kfree(iommu);
+			return ERR_PTR(ret);
+		}
+	}
+
 	return &iommu->base;
 }
 
@@ -761,7 +887,7 @@ struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks)
 	struct msm_iommu *iommu;
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_new(dev, quirks);
+	mmu = msm_iommu_new(dev, NULL, quirks);
 	if (IS_ERR(mmu))
 		return mmu;
 
@@ -771,13 +897,18 @@ struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks)
 	return mmu;
 }
 
-struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
+struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct device *lpac_dev,
+				  struct msm_gpu *gpu, unsigned long quirks)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
+	struct adreno_smmu_priv *lpac_adreno_smmu = NULL;
 	struct msm_iommu *iommu;
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_new(dev, quirks);
+	if (lpac_dev)
+		lpac_adreno_smmu = dev_get_drvdata(lpac_dev);
+
+	mmu = msm_iommu_new(dev, lpac_dev, quirks);
 	if (IS_ERR(mmu))
 		return mmu;
 
@@ -791,10 +922,15 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 			kmem_cache_create("msm-mmu-pt", tblsz, tblsz, 0, NULL);
 	}
 	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
+	if (iommu->lpac_domain)
+		iommu_set_fault_handler(iommu->lpac_domain, msm_lpac_fault_handler, iommu);
 
 	/* Enable stall on iommu fault: */
 	if (adreno_smmu->set_stall)
 		adreno_smmu->set_stall(adreno_smmu->cookie, true);
 
+	if (lpac_adreno_smmu && lpac_adreno_smmu->set_stall)
+		lpac_adreno_smmu->set_stall(lpac_adreno_smmu->cookie, true);
+
 	return mmu;
 }
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 8915662fbd4d..1965b98d20db 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -52,7 +52,7 @@ struct msm_mmu_prealloc {
 
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
-	struct device *dev;
+	struct device *dev, *lpac_dev;
 	int (*handler)(void *arg, unsigned long iova, int flags, void *data);
 	void *arg;
 	enum msm_mmu_type type;
@@ -74,8 +74,9 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 	mmu->type = type;
 }
 
-struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
-struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
+struct msm_mmu *msm_iommu_new(struct device *dev, struct device *lpac_dev, unsigned long quirks);
+struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct device *lpac_dev,
+				  struct msm_gpu *gpu, unsigned long quirks);
 struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,

-- 
2.56.0

