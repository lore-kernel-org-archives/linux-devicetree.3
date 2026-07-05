Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BE339F165
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278858; cv=none; b=fMFLEPTYyfwm78aPOWPQvYoTvyO3iq+gRnjiJ0PrnV01d6KqYz2IBRDumBMuR07NqdEXQfySUy8CRy4qn0B6ztUQO74R/grn4Z/p0gvCB4klK1tu4zkd69tA7EGvIEYApNCnlfStEyhkIb1LhiZcumx5jXHnEnjK8/hrz+5QkqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278858; c=relaxed/simple;
	bh=TOpopsFtZ1PPnGuz7Qdse1Rb2dSOsjvazts1+j2Qsuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZ7Lsq4upsC6XSCd5e4CERwlm5YToDOKb7xgWREAJVXuwMsI72k0ELYHkGMhzSEUbG8ZrrTmcWzmSoiT6iiX+EH3hQvJN3Lzkpgvb5FTuTUMIwD1dtWP2wDfGmd725AsWEuoNmHqhQjCpW6OHUdRt6Rpd/pHcarQk6BZbOpPL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6J5Jm+e; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6J5Jm+e"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c83474ddso21493545e9.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278855; x=1783883655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3eyPuG/7N0ePFJ/qBb/yJdx1/OQTbqvhMmqlXZb7jM=;
        b=a6J5Jm+e/0Y1MOQMKzqVXOgFWmPwSOW9R3EAG2I8i9WF56GGFJH4v49p4Hefof7PPX
         2yNB88FOsoKwn2ygn2mYcAab8PDsx95HZ/e6CoWbja4X+7Ln+7LE67KubhU8YNfa4RQR
         Ms1QAhPU54VAKPNnn+u7Zmec6P7PMDxvofonikFk54GiWxiohSad9uWurRcK3qPupBPh
         MHf1Z1Oqzrep5h0LDGu7PoFscbeNO/ImAuAYsNfwywpJ2nFl3jvpfdFuldqMTe+4ypPZ
         l6MelFntwDrGnycL9y1h1EFL/37LeVYsMWmkhDLb5Bz5IoAg3NvdZnDUTjgItJPuoIrl
         crYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278855; x=1783883655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3eyPuG/7N0ePFJ/qBb/yJdx1/OQTbqvhMmqlXZb7jM=;
        b=pntiegfQXIGVjm7owgaz58/UN+hEpJOv0CKdL8FRKHl3r8Uo5pObSW5D5/gkdSJbFM
         JqqAPb/bHfQe2kybn3VuYkTCPOQAUzWxnhG0cwXfaZBzGc+CiEBzmgXR1Oar2kNnd/nI
         szxPYgtCjd5jnLShwvytJbgCXNjfCowR3KZmsV3qH1I+Cv8M7bN36aNB0FlL8XCZC5bS
         2SLi59bVn0BL5eANqeS2LeG3z19kDFfExxQeVr2p9HLi2uZT0zIyGpIzc5jcPnDPeZ1v
         3AzLngmg/zkdRxmgoPnBWMQsjeu+TRghEkufuxsZ6bCSffsRMvTsMxLbraHZZtguTjnq
         RxrA==
X-Forwarded-Encrypted: i=1; AHgh+RqRG/I/geB8szpuOoNNfpTvr3NonYdCztqBO6J9l7IBsPXJimVX7A7bou5mgFrqlhFe3n2neQqw6ybe@vger.kernel.org
X-Gm-Message-State: AOJu0YyJgG8Huk4A1rzGt57f8nfRlt8deDNtoU2s+/lwXPzh5UzowDG1
	2DMjSFrcBNp80wdOiLRht5dQTXfbNy2sqxH6xB+8ua+r1n/Uwrc3lekiwEYnvQNXDAYC
X-Gm-Gg: AfdE7ckZykS9USGaI1Mxu4kYXTJu9tp0afhNvl1drtB3RilBigPJhUImN3NYluhQk06
	m+QvNaRRibeC2Da+cFgBLnDpea5lWOw1cGvKDJnQdPfr9P1nzLQ3v5DSmXcHpNMfvNGSCwfi5oc
	uCqQfUpUzlMtpDayEgRsCE8lwJyuet4HkZ0RvZzfw5flCpGDS7mKygANa1M8OhZFDww+EGEQvKe
	wrL+Z4gT9An2d8cCKtW1Al4Ae7WGfOSN0DakaaHDKCwK3wkUjk7zDBvXTDyLljW6/sncMYDLFwm
	g8ea/jCwHIkc4iKiYjC+9UZvlG2VzpuMCEMl+D73GTHsgt8KTR+w30LWW4TaounyIrrmhIgQcNC
	7BrUNis/IOZBq2ZTg4mXmlFQfpFG2+084euCATwdl+55iHgHUaxMnKXAuLXK2boHuogi1wqW2aj
	1FRL0n9bjdYVXDa/9GZHoldDeFkTy3hR42lKV8cS6z
X-Received: by 2002:a05:600c:628f:b0:493:bf84:53d8 with SMTP id 5b1f17b1804b1-493d11d7d55mr92320425e9.9.1783278855325;
        Sun, 05 Jul 2026 12:14:15 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:14 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:35 +0200
Subject: [PATCH RFC 01/13] iommu: arm-smmu-qcom: Configure lpac device with
 split address space
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-1-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2198;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=TOpopsFtZ1PPnGuz7Qdse1Rb2dSOsjvazts1+j2Qsuk=;
 b=swnPSg6jJwnfwPpO2lUtsliGm7jHo9gqL51QEmCML+oAIm1zPDuCFHYdt3TNVGcjeXVx38cVC
 13fGjbA8BMDAB0TZwyRx8GCJenaSAUzrSU2r89a5X2KYaRbtynBvrSe
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

We want the context bank used by LPAC to use split address space just
like GFX.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..48a590aaeb5e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -35,6 +35,8 @@
 static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 	{ .compatible = "qcom,adreno",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,lpac",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-gmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
@@ -217,6 +219,7 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 }
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
+#define QCOM_ADRENO_SMMU_LPAC_SID 1
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
@@ -230,7 +233,8 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
+		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
 			return true;
 	}
 
@@ -305,9 +309,9 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 1;
+		count = 2;
 	} else {
-		start = 1;
+		start = 2;
 		count = smmu->num_context_banks;
 	}
 
@@ -394,6 +398,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,lpac" },
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },

-- 
2.54.0

