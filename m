Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282015;
	b=upTbHTV2Tz+QU0hGz/+FuMvLUox86kvyfzEHvv/zz/zJrX0KIVkvv0tkgQmWG21XhdL+
	 SqJt9F6BJJXjp6jl7/c8XzTS8nYDGQ6zZlJq39H6lFEIeXbyBV2F+OdnWdK7UivUD0hpX
	 r5yjflcX0tLcj6tO4bzoSBLDV6By3Ktutmpo+ePDbZjwOLlcfzeefWutvNDDOQlOI/yVh
	 lwYsrBCywGiJR/f8jKxjAIE0swfpVumv+CqQr0H1HyarQQSxQuRYTg7r3SrrV6vyaBP50
	 RyYy5WMcXSoIpq8rn0sxSVAjznEA/w+ZwGGZAbT0WnhQYZ3R0a4Ng32+40hJsAko/ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
	b=K+IpCHRRxaipB1okTdooeT7jELcN47enCg3egFS3tY5v4VeYwi3mvhM4YHzm/Qg/WTXO
	 RMI3gh+XaLe7x/1nsYwpXBtTwUNkNm/7AymO4FEY+oKG/H15Vsx1Jv5EssIXlPX6PKYzB
	 NEBHwkiPt39s3vBYXJbAgX5p2nUdAzmpIv6FaXLSWVArwvwa4sHKu4o3FmLmvn8kL/Wuz
	 9peTg7EiGOtnXECEV6KLdqEz5/VU3bsJ6xXaZsWV6RoNawjEJ4mI7gNAr5YyKu4wYoNAF
	 as4nMwtbwXTd2mo3EX15mjKqRbgh9h8WOER+MIx8tebiCFI0TI84gjfIT07gr4g3hgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA+IduUU;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25796606A335
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25796606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA+IduUU
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22257935e9.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282012; x=1793886812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
        b=jA+IduUUd+0hPug1YrCr2hXnLaqTuQd1EZv9dP7d4Sc8lmFIx2vkY+aa9kMfSFwUYr
         eurhjOp0+aypsWUWPZn884DphWWF7ztUHl4GwspHS2YYjZyHRNZRF0M9YVjkmLDDn6H3
         8tfdykAeOkHCWYqwf0Mef/gNymZ+4U/xnV7I9HLX4G9xOezzU3gbAUH2+ditvx7X3n56
         Fz8c/IV3qFpCkXIGkQmO3IJTeJ3O0223lT9P3mZsewgSRVzlU/lyCLaMMwCkkqi99fL/
         ZqOhp/OZo+ewreqSL9tmfITtu6nY9T66VGVBr6Gj8RqsfGT3lciOFidl1wvy84/+xrap
         yWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282012; x=1793886812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
        b=XrKCjokpeuwFUhf1OHyZ7TuznEFhSu5PfaBMa4cmls0IsJjOKEp65mTylCsESt7x1K
         mPbeDS11f2QMdyC1kyhbKbUVYjyTNqTi0MHIwKXP6HqML9msI3sE3qrGcfFSGBBVu7gf
         OHLrORwo4IY0NERJUd+ayLMHq6PIA5YtxKCwg2/4uJN0TXfqNqZhQVk04l9yf2JiGLmF
         ZUP8HUBikl2Wsq/lpg9g7bi1jOi2YGDO0TRt2hfA7jHwFw7hg4lOwCYS0HYm0FbJEHKm
         7g/lQYTqRB/UubURzyyTxFZ6gwb3paaVWq4M/Xg7aVhYro5yu21kdzx43rtV5wrxMgOR
         eEPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbAYn/5fzMtddZWk9qnoYAXBje2rDhFoNWKGQo0HeIr0OCJEYLEZN3x8vKGxnmg2oYmYPxEeyomgr9@vger.kernel.org
X-Gm-Message-State: AFq9FYJDYbhMhYReEfgu9GXll6uASlOj7NVJaiJmvmyg1AT4CR+ZTRpv
	OQJXGxeCecxnFIPiaq3ASfWEWOQRYcisE6Q3psrfsWUdx8JLk3Db+e4=
X-Gm-Gg: AYBFou2oOGyssZlAm/Kp3WytpWinjaaswczy2Z0OpNSbYhfvSKbddhvosmsFRw+D75w
	qHao959MFiSVSjbodW0DVSzOIVu2AqqyUfY1vl2CV2t4iELvFm8iGzKW/IsfJx7co15gN+UoBwd
	QQFIuCFcs0LhnrZ5+I+qXkaPDDsB3uWdM23c0vzgD7Xr+lOnpBgPqmY//MjYmJk/Ptr0e2i1rer
	ieHmmm44ttswSJkwr9ll8DMJKRJfdp3T8RyvNeq0MshqwbZ03UjLEEqbcteqprGZws6YHq+xwnn
	8SyTeMUMXRKJMCJy7tb4j6E3lboJGuvAYqCfAc6VG79f+7CMEGRGDEj5S2Ftlampz8Hx3gK8LMA
	bUwfatqn/wCTDkvAOjIKlvrrGMZ4PiKRstjkewjjnwtgxL6wRy0c83UKbIrwZQQSvgZ636j1tqd
	4XAlhdxCT4i0H7VMulqWFWfUCT6tNIpd6unl/QRyRbvU/vlybg2fdMEVqBsRjPf+c8E3iguQiRq
	/3f7ZSpCP5eC+cLWYuc6LWozpMfwyduAbOKbVMqm48sguMXYSgPPqF41m7xKl9SLtXCRkC11SOC
	Tat7kWcRiVYlLVVa3WfHRB2Wr7iKtZn5PEnyKUs66Tdrtw==
X-Received: by 2002:a05:600c:8b38:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4a966c4062fmr131340985e9.14.1793282012331;
        Thu, 29 Oct 2026 06:53:32 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:31 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:49 +0100
Subject: [PATCH RFC v2 12/14] drm/msm: add lpac ring to devcoredump
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-12-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2731;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=SjlYjQ7B06EmsCE9KnnMd2bONmqc/uyNMNAcvp2x0Ec=;
 b=Y4u2ENL4nkbD0aM3WvJ/ELGPfCSRXNJvoXA78hkmUU4GFxXHhBZNuc0iEh6bPVi314GSCwW/2
 pbbFXwlzl23AkJnsI3vrmGEICHfTAEqdZf+4MgQRM3PA140b5G6lp9N
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add the LPAC ring state to the devcoredump for debugging.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 085e1b9044bc..1ce172e5f73a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -785,25 +785,26 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 
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
@@ -1004,7 +1005,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	drm_puts(p, "ringbuffer:\n");
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
 		drm_printf(p, "  - id: %d\n", i);
 		drm_printf(p, "    iova: 0x%016llx\n", state->ring[i].iova);
 		drm_printf(p, "    last-fence: %u\n", state->ring[i].seqno);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 877f88ef90d9..6b05c2d45bb3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -640,7 +640,7 @@ struct msm_gpu_state {
 		void *data;
 		int data_size;
 		bool encoded;
-	} ring[MSM_GPU_MAX_RINGS];
+	} ring[MSM_GPU_MAX_RINGS+1];
 
 	int nr_registers;
 	u32 *registers;

-- 
2.56.0

