Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281996;
	b=WA0R5BdXBoqOrJo969GWsHlznl56awlAmzLZ5S2MePZyfuAqL0NOj6snh/qSjwfZJ2cL
	 gLkAvBRXp7XWRyhqgdC3F6fmT797Tz8YEi5W8CvwVRMgbrRSKQwMcio8ZC6wHoGDAKU3u
	 +vlvpWMlnIceEbJ2F/L5TgXBwXzO1gdkNsEcCPActQBc34ZhT3D9XNWd5tnQ+ou7uKtVb
	 jrL7Z3IdiuQn6YHVDsAUlzeeoku6Vwiy25UkZDu8ioX5F1RQxboaFRI0JLMWHQ4TAsVoj
	 43UbRFjlH8HRhYiSHbiAv46Dw94PGHM21U+gGayiVs2Wl/tmgbrOy8+xC6FM/3XSnBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
	b=w4p/TOZiE06AwJpBFtpc8yw9Q7ISSruBPaaXF723qqjTRqE5iG0+ze/m+SPGAid943sa
	 V2MH4FZnng6ZpbickbKjmwWTnJxHia4fn7KPNS1S+SSozHSDdHx8tw4jqavT7yIN2IG8r
	 j0MZLPP4lPp3UdS31fOs1lIrLB7WLzTkVMZzF2juVh+F/CEPHaj/msTRqn62ea9mD2Ln5
	 vUZfaZKa/lVc7RY12z39IC8E9OjGKdoZquTqcjga6IOgcnJhnQuBdr1DstE/u3JkndQxN
	 TBwbmygRWUP85pOeKL31Q48kNSeb160otEr1qEgqQQ41UQTIP9iSf/XdPcqQLDrmCuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdXI0uiV;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2818660A2608
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2818660A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdXI0uiV
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1000799f8f.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281994; x=1793886794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
        b=XdXI0uiV0ZwTd9Wa3AVe8BbXXAxv1zWCaXkMKoaY80znZIIZrzYEfmcCzvWj+5Zm4k
         ztmZhqI0ftUqS7EyiHCrspnfFV+wJCT3zsHo7Tv0T906QAxsHJlB6tcXUHyNQUadTmYV
         hnGXrOz+RzyfYvTy/TY+KHu6Iku22IehZklIyuUnj2W0Padnj7srM56WWTX28iDGeIGz
         gv45OgI4AkKWESn3MJqXmLxza+b4ml15fCMz2nhGO5Dg+1yAYxufF3hJD8NbEPppOYKJ
         HEFt8+buX3/ImND6YerrHO0wJH88YB1TmFlrNzB9H5pc1yVfF4v89tFBSrZ9Zw2NGOf/
         BZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281994; x=1793886794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
        b=XRGSLt6Sj6/HZj8Q4j9D+QWbwYlS05GthqowXXmEyNMwmosNTXwUlrlOfdcbrQds9l
         bu2D4xxZ7Xn2rwrGlsEvjOr0hol9dkCgpMOEWomnGLaVqYb6RqQTdGDQDDHTow7z8/M3
         UGGrA+FcVPShgFSlNeHmrWvTto9k1Gh2UCRU6ui202PtbGPjOJGPWqjMRLKk81/2GEtn
         OJFv+WGBuBlrdJscZBawE6ekkw6TOFL4dMZEIb3kCWyhh9Kiz/fHYGKMjTM1X2OjgwGh
         uFyhrMiQorU9b4Ij7a8BZkZBBR/pJbkZ8/BGT0yRvAtP93weEI1ZCHV3KmDNDQ+mk3Za
         YHfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB8pRXiKJfez96lBF6iXXN6PrWCYQIzy6fCCMWglcovKjGMg/w9Zolh3rMGlJPtYe7jF/phAR//WAI@vger.kernel.org
X-Gm-Message-State: AFq9FYKVH9i437c+9Hvwm30YSuFmChDl9r6ssWMSXcOOW5CdbzjnT21Y
	kV5tH2Zt90ZlO9z53ulrA7DXEoPppVDNLVP+nfmquvf/wJc/XLwqdBs=
X-Gm-Gg: AYBFou1F/qOX5juU1Bgt5iCiqpJ7WufbYKFvvRsNohNfU2Lrq/dT3Cr499WRFmVIQU8
	g78Myx4OdiO7zp3+gvbtuQdOn5XCly1YqHkTRj9jVz8f9Ov+2ieVzYhdZ+zU5rLxJ4TxOiSfWZX
	Zktg5LzAeuq0f89ghxVVD2It7sGY+2Ec6EhKMzxVU1dykPx72pmyMzMhCVZW02kzIPDCrAYcZis
	QAWq5onrBGDUdSTkG2uXMMnZGIe5OQ9izcq8D3YY/DrRtfSS70asU9kvCJVy7hJFplkAobrxsp5
	BbVvIaDsQQ/feicB0DZk6v/eBOh1U0WxQ7nNuC9SpWWBuVMoN6cs4T0zFGhexVQa+Pm4SFEra4W
	emgbT9swlxF/Wvi7axpasjxdh68nvMBi7bc/w21NNch1Xe9TaWCXWq7pqs6jIt6jZvyvFVuqAky
	vmcE852EKqNINstZnV49VdXJvuCbzO9DTOqz/FdjCy9qcVDNTgPlpSyZb7SnaBO0YpD75cWPUXn
	8DQt7JGpjUF6EVrovJOupdhYHk+5UTN/9Kze5kdu78uAfoXyspnzyXnHZOgr9Dk9UTWq9eKemKg
	NdXh7QP5D5sV8DXKjzFEnNBxFB+/6IR56zY+ILRZ9ctFCg==
X-Received: by 2002:a05:6000:4715:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-48e5d5d16afmr13493554f8f.53.1793281994421;
        Thu, 29 Oct 2026 06:53:14 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:13 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:43 +0100
Subject: [PATCH RFC v2 06/14] DEBUGGING: print contextbank and other ttbrs
 on fault
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-6-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2450;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=dH+it9hPPDLJzOx0q/+eo2IfgBzUDyQPf1+n9ilF6yo=;
 b=rSQ/TIKRIiV2aSX7/+jAtk7J1jcL0JxB8zRWLfn1sl11ELATT02XD6e/9sRnBZS+9corw6Stl
 Oo1uS/fWy8LCZ5C5THVWfEq4MkKG8/9Q7VkA0Io7j8QvOp628/2VM06
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Faults can now come from different context banks so print that
information as well.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 4 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
 include/linux/adreno-smmu-priv.h           | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 65d34d0cfc38..4389559e1d17 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -329,8 +329,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	else if (info->fsr & ARM_SMMU_FSR_EF)
 		type = "EXTERNAL";
 
-	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
-			info->ttbr0, iova,
+	pr_warn_ratelimited("*** gpu fault: cb=%d ttbr0=%.16llx cb0_ttbr0=%.16llx cb1_ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
+			info->contextbank, info->ttbr0, info->cb0_ttbr0, info->cb1_ttbr0, iova,
 			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
 			type, block,
 			scratch[0], scratch[1], scratch[2], scratch[3]);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 48a590aaeb5e..ae6152bddf8f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -136,6 +136,10 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+	info->contextbank = cfg->cbndx;
+
+	info->cb0_ttbr0 = arm_smmu_cb_readq(smmu, 0, ARM_SMMU_CB_TTBR0);
+	info->cb1_ttbr0 = arm_smmu_cb_readq(smmu, 1, ARM_SMMU_CB_TTBR0);
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f..5d6de4b4de06 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -32,6 +32,8 @@ struct adreno_smmu_fault_info {
 	u32 fsynr0;
 	u32 fsynr1;
 	u32 cbfrsynra;
+	u32 contextbank;
+	u64 cb0_ttbr0, cb1_ttbr0;
 };
 
 /**

-- 
2.56.0

