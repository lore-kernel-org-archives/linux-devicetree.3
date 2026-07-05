Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A153A75B8
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278884; cv=none; b=ZCX4xdV2YUgeHMNehd8NjhM+8O3ZVhRXb0A/bHb7KZU7f2ifjhjEcWP0umh7nIz9ZZUcqfIgfStKbLPvrxAvmeThF/XleiJl9oWC8E2BtwntEis5C/lUlEFvwJHI14Y/rwMdlj1XLGhqaYyjzjSuaLu8L80CoRsEh69ffTN49U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278884; c=relaxed/simple;
	bh=wmCqgt9bbc7y6girDLeQUG/lasgVe98klmVzcoHOM/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MV9y22lEtEAUAQZRcsXZK01PqVEkaqrILwt5KEvMx+yjIoXuJBjqzFfqmZqTWJQ4jNj0MRS/QN6kML0/ZxNzFQVbqV34zh8bnjaQtiIf26mwDDPGBfUrj3D5iIyWlrYcMmL7+XnaSpMqOr0RAhMRCe2myLr0aSWWrQxHbPTS4gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YunYPb6f; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YunYPb6f"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c733f15aso23263325e9.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278879; x=1783883679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8zcaiL31SCCh1YPdlPY6GbxJWdviTylW/ogJ//b4zE=;
        b=YunYPb6fLEi839drRXRBXRyV5+J1auPYZgtYJf8T4q/IpYGnN/qdlRWs2Oz/sgH083
         gh9znccHCwaDqgsc3H6fAzMaJnGxhSSdBzXccf8dkvp19A5wtDtK5sh2t5sn0Ey0PZ2u
         d6f2OsGzzf0DFIPFlNtOgdIbjBYow2SYLl5VJsXvo3gUrA2XHXwvGHjcjJzy15dBhAvz
         AfhshRCyJ9rlBGqlDd9c7yIXY2/sm1PPn4p+/M72AiWLDSWvw+pDTpA6xzuMePvbJAIz
         ekXRT7+HHqWkDD+vTdBZFUPnr8SKwwk84E9hi4Y/PF93KQKv501RMYKdgvHpZhqxmrIK
         CO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278879; x=1783883679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C8zcaiL31SCCh1YPdlPY6GbxJWdviTylW/ogJ//b4zE=;
        b=hAJ/9hn69BLv/EU26jVTKdfCe3XTFC5aqdDztO7aC9eRkmoN+ZNtsvjg7iU0KpDfLB
         c4D7dyy8++LHMmCgbwuWqDc5GXHTBWAJnpeK4uw9rAfpTWfpqAj7MDK4Zh+f+8bDGgGT
         TyBvvPABt2T+Hknx4Pvcp8yU26BC1oh8KMwlif1AkE47CAyLrmtstJ6GF7VDqtPT7C5Q
         7AYnNtA1k5BhjU2gHzQvdoJp8vebc2ajmcDvgAVSTiZT5S5G9jdBmY0/wNx3fKYZrWYj
         ZWa9hbwHPfh5QE8hWVbrhDi1Eir/ZqgGuVTyPV/edzKP95E7vaaCk7maYX4+wvSTIfX+
         xrTA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3SFWA6pi9UmU0oaiweMkwoAjxDwr48bXkKLV9m0ilhRs21N6ZjabKYK+TiArYHMLkv/VSAkf6ZuBy@vger.kernel.org
X-Gm-Message-State: AOJu0YxpHdKEiMOWqBNlUiYNAqa/7vd5OZuQm0tXtn1g35GfdtcjvBFV
	tNrtmvEKfUXc5Bi3SomMDNzNSrP6GGneg9iJjiQUAnp/JbyaY5tSSxI=
X-Gm-Gg: AfdE7clsk1DWUI0oqX5S4pQ3v6iTYv3/E8vuHr12W3vhgnft/jl9LJaxh9ThveMKKCD
	4S2tLSTNbgzD9CS7Rde4lS/ZqgYXJSYAj9J93CduFQa9CALYKooXju/4ItEDboN7NXT4gBsVkHG
	jpD+LyXtHlDZiNDHSl0yNZmbDbflaAjAx0uwCrmif85lvMqTtKRtVpMpw2l1lAOE+goyvf0ti6s
	lqFSyi24bN6KjerBjaCYL2IjJt03aTbxtL/hWmf1sfqpUCaHsP/N7bLFaSJNBlxOiBHbxJir+Zb
	PxmglMMf8SPOyYhu+9HafzZi7dqUGUQ/EzETcD9ivqpWXpKLw7iRhEvjdbJo3V8VHdGtD3nGPda
	9cSE7Fs9d+TaAEWG6VfvlzJCwfc6qdx4cy+d+jwN4cTZgKbU+QggPU89v0/H1ogEyA8oJXqo7yi
	wMfNK5bybBs6NW7U0=
X-Received: by 2002:a05:600c:c16f:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493d52ac417mr60885215e9.5.1783278878843;
        Sun, 05 Jul 2026 12:14:38 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:38 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:47 +0200
Subject: [PATCH RFC 13/13] drm/msm: add lpac ring to devcoredump
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-13-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2731;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=wmCqgt9bbc7y6girDLeQUG/lasgVe98klmVzcoHOM/o=;
 b=PVK05TezP6oByIlmJqXX6RCKZc0Sfa+FvqbaJD2D2MNQt18wh5zplyqPzMUoPj4wq2v3x/AHS
 ORhKtsBbYDeCcbFNugaM2rR3PLhNr8TrJkg/x8sEhnkPAzo9vnVPIw+
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add the LPAC ring state to the devcoredump for debugging.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 94dbec9464a4..030bb1aeb7ee 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -782,25 +782,26 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 
 	ktime_get_real_ts64(&state->time);
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 		int size = 0, j;
 
-		state->ring[i].fence = gpu->rb[i]->memptrs->fence;
-		state->ring[i].iova = gpu->rb[i]->iova;
-		state->ring[i].seqno = gpu->rb[i]->fctx->last_fence;
-		state->ring[i].rptr = get_rptr(adreno_gpu, gpu->rb[i]);
-		state->ring[i].wptr = get_wptr(gpu->rb[i]);
+		state->ring[i].fence = ring->memptrs->fence;
+		state->ring[i].iova = ring->iova;
+		state->ring[i].seqno = ring->fctx->last_fence;
+		state->ring[i].rptr = get_rptr(adreno_gpu, ring);
+		state->ring[i].wptr = get_wptr(ring);
 
 		/* Copy at least 'wptr' dwords of the data */
 		size = state->ring[i].wptr;
 
 		/* After wptr find the last non zero dword to save space */
 		for (j = state->ring[i].wptr; j < MSM_GPU_RINGBUFFER_SZ >> 2; j++)
-			if (gpu->rb[i]->start[j])
+			if (ring->start[j])
 				size = j + 1;
 
 		if (size) {
-			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
+			state->ring[i].data = kvmemdup(ring->start, size << 2, GFP_KERNEL);
 			if (state->ring[i].data)
 				state->ring[i].data_size = size << 2;
 		}
@@ -1001,7 +1002,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	drm_puts(p, "ringbuffer:\n");
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
 		drm_printf(p, "  - id: %d\n", i);
 		drm_printf(p, "    iova: 0x%016llx\n", state->ring[i].iova);
 		drm_printf(p, "    last-fence: %u\n", state->ring[i].seqno);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 263dafeb9652..4fbf0dedc334 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -639,7 +639,7 @@ struct msm_gpu_state {
 		void *data;
 		int data_size;
 		bool encoded;
-	} ring[MSM_GPU_MAX_RINGS];
+	} ring[MSM_GPU_MAX_RINGS+1];
 
 	int nr_registers;
 	u32 *registers;

-- 
2.54.0

