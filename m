Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD5B3A0E93
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278872; cv=none; b=F3mnz2hOy1zCjEeXn8fGCHBfugmyIKV6dRyt8loQ3LhlKGzFt/jApuH7jNG1u3kr13hqK2KdmmVToY/lpvVJVW4kS5S2UR/8vgssEbShbde/mi8FLDQVufnhihFZ5Q6MGL1P1/EuhhLhK4UXV8AEwhxiqRIkZBD6BqHE36JKr1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278872; c=relaxed/simple;
	bh=U1AI7O1BhdkrzXxItW/0XejZckUMlwC4IaAuS4BWmNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTCCUFZmYUeoNueONAzVEv2j2GDOh1Deo82vcWq6xuNg26UERbFwgkAJBnqm9lDkPZtcEhO2ukaPLMV5VLjDhZwKvBdSWwLkIaedWIYITD7EPF4M92WpExgV7rjGq8A+2BV8ytVHjHr9Q/E5rMo6r+fnETrgUYq52I6rOQr6uSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agg2jxB5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Agg2jxB5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1107307f8f.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278866; x=1783883666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmTeIgN5AtQt28lNx3DVWq0mIIdy+DVEwXhPE9hXVsA=;
        b=Agg2jxB5IlhXlRYo3Gh1DvIdJCTUI1429cPyMjdFgNzObJb7oQPQuZHJWXZVzYQ1pd
         E4mO+4QGppNKgAZzpDb/+vuZaijpR6W252WOd1LNB9RQbu9GhBksSLgDS/fw4Htrwtyf
         eNME0AnRTKTK2iMty/sPvcmAMcmJbgzEq9QpU4SpBOhbE66FLLXHYorcGKF4k1HvAs81
         8+0uBfSOyZMBXz2TYhcwDx3/DLSvY1qKNCNY+zbDY4OEF6iKjfZuIuytVvReFuxSkkU8
         xoAT74ey/kcmOd/01Tt4A7L6A9GoFr/GwrONUHtqxysp6f9HyekmH5Whr+IhSQ1GbT2X
         jKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278866; x=1783883666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmTeIgN5AtQt28lNx3DVWq0mIIdy+DVEwXhPE9hXVsA=;
        b=EIZviXdP/HOoddeZJaNvmv4ZHJjENK4tTXc0Usi1TTe6RiLiJSkF86DI1LMBZNpsaA
         229V5jf2IhTKcgLEgSQ+BbbXaYc0c7OTAF192X4rTbisHdtz6qsCltqFxYpQz3RrKVM2
         BuyYuZtgRUOjs0kpCxjBv8lX1HZ/NyzBZAk2e4TlvRFCj32Bz+XRHGyeDVwcZK24nqfD
         8+GDlmB12Ye0DqyiZi1DATf0MHRWVLu3TelVmazGjaJfh/5K1EzzIzsB4u7B9ppBw18L
         IYKXFHZvTWI6vmVdcQdA1TvAfAbuOdnBDMPpHBDA/xWH/XVfoZfc9joq3fHJ+yKDiUg0
         Z9vQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAQUpFg9EnVs9ivO4Qi45DJWrbQ+P49oC5NlcNOU+KXsWS9whrcC4ZnpbdDKvYlVNRiwYIcjSDO0FQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ivIKDCjPboun0dmTuCmXPf4nLAxliohmNWaUlsVwY6vMEvEf
	Yl1objfLjt6pUQgoYjqhO0EKJxua0WIM5hTpTtzCwyct2XKXFOFdwr0=
X-Gm-Gg: AfdE7cm9o+4QwrLEEuDVoKTYyt+F6BMzp0izZdUhIhFFenCbErS4nEy8u2Z9jL0Z+9a
	QbwghliZ9T84MTPzfcqib+GbusMgiQtsqFv3ZlCAmEC62Y1ZJon9JpsTk7tSkO5Z8KvqwrbGysb
	ThjxCUl4Aj/MJOOnQPw/wobVx1qkyZ1Xt9NPHaGD9RdqYEDUrr8mkAB9+WAWI1A3pr3CwEScBkX
	Jiyc8s9FvAw2dGh5g61c6UAB77gHdQ3Hf2JQoJ9wjAz4HBpXrQ2tXG+qui5GfHHpWpg5dM13WU3
	XqpRCRqGwb1b127uSVA3UFYMSaNUF4tV7PwMNkJWHM89ugYQwGj4RyGVlyHBl/uJChjMPRJng3Y
	Bl0d/8rNOQ3w1bTCOQCO/ioimbBkkImqGWtsO+B2KSdPDCxukZPbMLzQSIA9GWdbZ7drfx5Y9Ae
	klNeqFSnEG7gwfgpJsHwGK0MnmzZDElg==
X-Received: by 2002:a05:6000:46c4:b0:470:3edf:e2a7 with SMTP id ffacd0b85a97d-47aaaec02c4mr5836740f8f.37.1783278865571;
        Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:40 +0200
Subject: [PATCH RFC 06/13] DEBUGGING: print contextbank and other ttbrs on
 fault
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-6-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2450;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=U1AI7O1BhdkrzXxItW/0XejZckUMlwC4IaAuS4BWmNY=;
 b=M+uiiUBR/lmMuad/SAHrKO891VirOTvBs28b6xreWN52s/uXJnTXUgzkAI4/P/yddSN2TXP4j
 AH+AF+T02UICCWBKtKMyVk6fvecJCMlYT6OCGtiT5he3yQ4MXqiVKBI
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
index be374cf209f4..6a48e211fa3c 100644
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
2.54.0

