Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B53A1CEA
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278881; cv=none; b=gW0KUQkhPgrrQsp4cKo7X8ENXzXz15990bbAlwgJUO+9OL0TFXEcULWBEuj07iWaeB3LunMGMrtfk73e6xD6YW7TRkSvXMYyVa7NSgsAYtkNTOuhy0gIa0tNFHbnHDH0vm3wRybOJ71oS/IpKL8eUiEJqeHFqRRYE5AIJG9kbZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278881; c=relaxed/simple;
	bh=GNmboLcpB1u+4sbu+20YXtJhFgR6gBIC5iE7jNeRoQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zs3pR30pftIfHLyQaoYwCy9RlRXwmU9MHbs13MlLoZ/62LgbWwnGLeI1Oz5tpyoZBgO6q2ufMjxfkCTctPZOZ7tFzLJ+k/qM23+Ky6QT6eWocI9wSUvyhVOBpzSevalYUSdhbsxbfDAPdieaXkqnVQKWmmR5erdesIulGs/1WY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZE+3K1Z; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZE+3K1Z"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1341395f8f.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278877; x=1783883677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZ84WH17cmaqhOLzZnVtdcV+4jwRY2Bo5WKI6TnLcX4=;
        b=TZE+3K1ZM/b+odEXRleMZZGmVRrAiU8q8s90auZdSliCzgJmukFnbc0xZv+XIgHm/O
         15bz4J/nCVCiL7jPfusgHxhU0oDVmIisLBpiUA0iJE3+23KNvZQgyzuQLK2mV0WfJNsh
         OYqZFxF/G9UilEpUJT/Y8SJO9Q/mMFYzdz1e6o4LNPR33qAzmZOIlGgfSgA37S/jy5sH
         3CZZ3qwfwHK7KbIySkiB6zLuOWg0FB1YSHTVG5bYbnuHXV3sEXEyR4VyuKYy1TDVB5DD
         CeqS2/w7WS6hJenDLev175BmCdlwhh+aZyDRiJR9swIy1uK0mWLikCyWabBakaLXGNZ3
         RKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278877; x=1783883677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nZ84WH17cmaqhOLzZnVtdcV+4jwRY2Bo5WKI6TnLcX4=;
        b=tVexPyEcMuG9e1+64+JMKVEYT6Z3Neh9q7Aj6rQ68fw9UADbGZglHBjHyFKJ8CB+/U
         sBn6bYFwkDuxfnFK9HVfs0NC9Yf5z1WRNqnNvptQXIQuD+bEcp3HiIZUgohEAI5f4POp
         tajNKG0ekMHLWvnjDMw2bYpI1zEMo/LIz5XixQldTQpdRM9fOld5K2mUC1gwMe1jJeks
         /Tzvv1Kh5+A0mQrTbFL6BhgPZpXP8IRsFDmqeevCgQJWYBQz4oqsbDPk7fD1u4oqEC8T
         9lrF9fl0Qw4UrJFdbgRbr3qUV35KO9MbSwb7KWlnIshr8Wzp9KHPza49ZjkMcTs672nD
         5S+A==
X-Forwarded-Encrypted: i=1; AHgh+Rre32yIImO893AgDsGXhAYqAo0E98hTe3Pvnrb0QjqPoyVWknvxZWJUNA7ILQj0rK+B9nBZIqpQILpo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd96f8Nn1JEUAeoI7QENf/91eVjBpSGfBPb1OiYGW70E4O2SaA
	XmH301mqvV7NP9czKwAmBdGVoZ1A5En9EOwsi9hqniaDr6a+EpOYFis=
X-Gm-Gg: AfdE7clVutUqSGpa1HSskETzaqaPTTboTZteJYL4KUeAOD0q6/OTFg6zDLXqq1vRKrs
	KvmC1pDI6R/zrQQf0OidRmurmSKExPvSmc6EPejAbdJef1bbDmAddm08IjNc71ze0RG2dmwCnT7
	ds6IvmMfqywHrJYesOD0hCaZdxULtiSBJXLZ3rbTeu97u/kVFbkn45cNncD5nu5yNJs/9WDu5N/
	XqcctUxOB/tajwz3y8Hljw1TX+FEb03FubxHIuKRtmC4/+gAvWpnx+7/ZlfCf2J+aRVLfmzwSPW
	GoPcrq2qlc/7rPbUyuDnPLNHzUpxrpt8ls9+ovhc61ZpAx9fk5WTGffCUnZZGq0RuLHzuhoyfRP
	3GDSNOSReG4acE5d3kRrjDYbWmwhoaKVZH/fA4BrwYRQN9h7e6jHA0KlBICKkrIzhbPdhwLV2ZE
	j1KD+l5Z2laZkg0Y1PT6/gAPmJ93uoLg==
X-Received: by 2002:a05:6000:1846:b0:473:cefa:98da with SMTP id ffacd0b85a97d-47aaa60de86mr8534994f8f.10.1783278876921;
        Sun, 05 Jul 2026 12:14:36 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:36 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:46 +0200
Subject: [PATCH RFC 12/13] drm/msm: set ctxbank and asid based on ring
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-12-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1658;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=GNmboLcpB1u+4sbu+20YXtJhFgR6gBIC5iE7jNeRoQc=;
 b=rmC2QQUsBeGBctekJrkX9Bu4XpWytNrOy081NaDsxEdKs3EL5tzPk65CpjizWt1u9+G71Ip0Z
 pqDS3aq7HVdCwtuw5G8Lc0fcU6h3n5cTjmCTycxplXu/JrouOa8zMbf
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

qcom-arm-smmu always maps asid and ctxbank 1:1 and lpac is always 1

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4417a9d04d7c..a8a061652ec2 100644
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
2.54.0

