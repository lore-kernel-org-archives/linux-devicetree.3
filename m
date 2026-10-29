Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282012;
	b=kDHnb5bo4FHlpyEGMhkad8f33Vg0NFSYpMfhMgutgNQo/JYyKsXham5DF6eLQ2qLXU+s
	 G/cu5zG8JSJ+jA+fAVWtl/S4sW4MBwH4+u3DN6GIXDRcbAFXEMZ5WYNjbinHIjXY6cair
	 soao1u2nnwyY6tkmG7aVWy979vTVOEUYUkSfyC0ZkJjuheJZXh1uqB4vOGh8BCmH+mnx5
	 uu3QKdbspc88g9lU03ywrSMkLWIbdSoosLHx18kApJzD+NHVdYExtrpV+wJB6qh+ySbYA
	 +kWFS9jqHkR0WbfKCnqQMaXqojNBYlDXi1WwEHYFqrqbXyTfm47D7QvW9sFbNi/lvWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
	b=Br/Yq/Z96l3ex666+ZiAzNEm+Hl4JUVUhcD025vIagfTZmR2PfBJoSDkFHssIrH44ZOn
	 hAV5vpLK+fQq9FuGD+9fhlsLWTOWnapeUN5PjFf+NkNDTDtLiOPptv2G3u8A6c5CldpMS
	 yy96SrkUdkC+/kCHinMbwDfZ54J1c7EFDOOHO9b4lhS6q9Ruuczm38Z7gTDo4ELhwnShm
	 BKWcl6kV5JQZ810b2/ydnWf2aT4N2FODWCZtjJxNjBtgsNMrscLKtBf17HRtugu6Dqle5
	 VkfjIbcvMKsj7vDNwmObpMwy9aHNVqP15bmrJ8FJDexFNvzwpaPY0UzBga3ET8Ek45g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR4Hd7na;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5B660A6F57
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E5B660A6F57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR4Hd7na
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1935860f8f.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282010; x=1793886810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
        b=nR4Hd7naazS+EkK9BRvkvpfhgyw1W3iQO0GoGhlyzRDAhkR91gO70ou7fj8Zwvlvi2
         X36owXIE1LnEiBPs9k//KLqCGNtFf/ulBJUskzvUAlt3dPtpnZXVSbApF7mcgLlJ63ir
         sNupJ/IIOFs0TwPlSaTn1rVLw4TzwJIFg955pGYb+u1+6QDa013aeXu2tkdGfkSd/pXZ
         DRoUGXd9mJOREyXl34hED5FWrL8m3MJ6B9ERpKLixvj9yZHV/vYad3A4X9Zdnk2C2jfy
         defHRAvr3An2qcAxtjS4gqQsJDEf8Pq8RhqQvR5Zd6HK/rSQpjkbWMIFofgLg9k/5xGY
         sS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282010; x=1793886810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
        b=lQTImmpIAq1JrNKk8AevgbA2ptVohg9Q5lAAmSDlduYHEKUBN/+3PQdBXBuyFSwTQO
         1LO5B+69Nd3QmrEQZBBpUxvQGGh09AsDAKMn1A73eNyjTDSaKeJKTJVh9dTTNqLUTI0r
         D5Y3af/8aWzZsy12oC0E8nRjDeGYpXJ88/tTFDKGOA9QVIBKQKKR83euGQ/3urjf6g28
         p8OJcp+5+gp8DDiMhXwBAMj1Qy28uxScF9/Am49jYX726bCXRSpvvU2E614LuTBS/gWg
         LsPbGjGSaYuP2zxfbYj9P3YWkR747C+gqLX2yODIgGxLcafbpPfJj64fVaRzaR/xvLKr
         3ylg==
X-Forwarded-Encrypted: i=1; AKwUvBytffMcQw/NaD5kqPC0GHGw6dMF/3MDR1WJstd6c0c7iecOFfabLLFNyTwO9/i9Mx9QGGHf6aaPJQ0C@vger.kernel.org
X-Gm-Message-State: AFq9FYJh0S9LpCYCtmGSCFMU6BHHesBH1VjyTlSVL78SvF+vJGKx9c8h
	uvkyVrgGz82va0eMA5aJmfXeEZmr8nw8ZkAq+xvjUnlmsaM8pSc2APk=
X-Gm-Gg: AYBFou13nwqtXcaxo9P6HXwG3p1WM9nTSKZszf2ITFaNjueIxqd9XEjFgPgxKFhnKjf
	ygBPc1GHCa470u/+mhr2Asy7varauWM4nHNHeHt4TEQWO63SyiiA/RssfhGmixix0WKeFPHC4cp
	BSrJUxX8GIlE6VI+6hqmOkrC/DikioAYEgW7L+dq+AMFuaZuw6H84eBg4XZGYa9TKR3MjBEGu5w
	LdEMl75sp9UMuBqvNPA/wBq8ICGB/aoHQ/EgRVIymCxaCW/yMI+O6gCT1/zJ8zT/78l/+ld361H
	tW6I9vTfzg0lVI5PleIwq+bfx0iUCEh13EwgO6XRzCZl/+713vQqi6g8dmfm0EdXVXEUitFXlzU
	Ui49nrb9bM4nxxn+PD0nBOBcohE2xyfiPxfBHM2BqN3uNpw9mvCSqfE9/++wQCJ/i3gCJi3E1dB
	w+CN96YqDyIPt/a5aGearwlrpAT3mOTmzfi4ydbySR+c9fsPCG3BgJBQKgsSElw0OIIKUgOPXyK
	pnp9GPoGJbnsRKrEOYksmoXVV82/LM+7Ffy4P7znqd8uTx1qGWYt4f/6ZUhDjFjfn6+Q8MX27uJ
	aZZgxIJF5gwEBzHHZVOixMUPhqeXpDCCz0teoSCwPv0vVw==
X-Received: by 2002:a5d:5e03:0:b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48e5d468159mr13722390f8f.39.1793282010340;
        Thu, 29 Oct 2026 06:53:30 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:29 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:48 +0100
Subject: [PATCH RFC v2 11/14] drm/msm: set ctxbank and asid based on ring
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-11-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1658;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=JeZ/oDOWBrzzXnhSTsaX5dWsSADptm5HwF/DPV1Xv4k=;
 b=4M7VMbDwjOepIjZPrdycOsvEBkNuot2Ltb1yMKAeV6IZ8onsZj759zJ8VBrGw6EwZ2ETpsOXr
 1DglU23L6d5AIGkk239c64rud6FZXnrAbBlSSiEjCojZ/rkF2k76XQ0
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

qcom-arm-smmu always maps asid and ctxbank 1:1 and lpac is always 1

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e82d0c0bc10f..57fc4035a753 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -247,7 +247,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	bool is_lpac = ring == a6xx_gpu->base.base.lpac_rb;
-	u32 asid;
+	u32 asid, ctxbank;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
 	if (ctx->seqno == ring->cur_ctx_seqno)
@@ -256,6 +256,9 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
 		return;
 
+	/* qcom-arm-smmu always maps asid and ctxbank 1:1 */
+	ctxbank = asid = is_lpac;
+
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
 		/* Wait for previous submit to complete before continuing: */
 		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
@@ -313,7 +316,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
 		CP_SMMU_TABLE_UPDATE_1_ASID(asid));
 	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
-	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(ctxbank));
 
 	/*
 	 * Write the new TTBR0 to the memstore. This is good for debugging.

-- 
2.56.0

