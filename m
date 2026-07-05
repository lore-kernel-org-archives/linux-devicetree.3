Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226333A2E2E
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278875; cv=none; b=qenp2STFvFFwF57O5PUmgzIqkeZ8yGRwiBy+uvg6+8Vsxuxdq5J2/GaMByncri/nSyqIjsuE6ZW/KX4gpYg9qjtjuISys0czSNRMGCaDt0ikfrNKiogeAY+KSALnyHGHe/Gnn/7fqXd5YzXASspZ29tLRvnFc+xxIcQOTTUbmug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278875; c=relaxed/simple;
	bh=CTSVd/0edKxTFOAN7N2IneJxadcZY86l85ROlQLsf6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5tiC1AlwUo6G+QkrEm0dRXOP/crYAJIkhcInuwGpbrS218kNHZcWJpP9ZnhVigsSbWo8nb0SubNB69chn3dAUjbdUo751Us0PZBcRkDFmtYeJPwgN3DHppmlmbWgcJ0UIDgR5DmiuKLr4xuysQTBPz5fB4JvzFKyilxOGWqGQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDgFlUYu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDgFlUYu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1338176f8f.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278867; x=1783883667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOJQZsuitJv3y9s8sz3fzgy77bgdsy3S43prspkqpPY=;
        b=cDgFlUYuB4w9Jlitem81bhYbN7rFzvcwnHGU6i0V6jW2DkDs8ix8BQUeraRduPWs+m
         LQzlifTrGyibOyLDUnQOrD2bxJa7kgQSx7TQAlcGp8D/vT9P3s2igx8H++ljt0g2ukHn
         wHgirOSiUq5AaFJ08tVUy7c6GkLLZ7HjWsOghXMGvgxMlJOxUQqysO42lyje4WgMGlMJ
         SlOhr9DD6u43tyX1nMi6WsyRUqT4K0fnfb9NhUvnN0ukAHGXuOhLBW+9Wh65ByIlKcx1
         n6GHufSoZo7E0aQQzUUipw2vWctQdtf6VgOhEGzh8xdyINJbci2UvjxCiM5DlUgsNH3c
         ARTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278867; x=1783883667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FOJQZsuitJv3y9s8sz3fzgy77bgdsy3S43prspkqpPY=;
        b=hjtybyK5hRwwqFHhcsom8W0Egt0IJaZiJ6uQBQzv0NRPY7C89eSC34xo1lW3JVXBw6
         HPxaELwyy3pUOH7GnjI1zLX0qcUqs3lc7iAJbmz6oMp6qVWupLk5WuE2ISTrAppf6taL
         06BAvfshUqaL48w3n4LZS5Uf0KR0ilipHvKLJfWX2DbTD6oSOuZHkKYm7ZLePSLr4ALu
         95/UUtrI0kuvQgnnIWVqV+URXvHW/DaXBpEbKoQT3xBAQ15uC6KMOp5z7BeMU8iAdDlI
         g5DhbHDWEPIn2QnV5Vuu/GPZX9DonLVxeqV6SZC8/I2XmUvjCqQ4MTIrC/YjhKRwmsV4
         bvNg==
X-Forwarded-Encrypted: i=1; AHgh+Roz4/ZsZ0FIA77+/ECaTCmKFG8Ga5snXcw6x9iZu4vC5yyxbEojqbiLIeg4itTB2P2kC78fQ8A5Fry0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6EgU/kkHzEoDPy23E4f6iMsIzmaeh4WxuA15m2QhMi0PZRnOp
	hm/wZeV0tU+zlsl90vhi/jnhYL1TPJbF48lZovFXhn7OAE6wyucdwh0=
X-Gm-Gg: AfdE7cme7PqpSEZWtoWovwYysrhCrKcasB7/NvG8up8nS42Yg66hEl47ulYVykmaTAx
	6wwWn0zvLrVpnoj6su2sZ7Uz0nEKfSp+XGX+ZVv14xtLZKyHpaQXVSPxVSIsTyuIU5YLVb3rQXL
	7Y5b8Gp0Dxm693PEs4PMH2ULvlVMeLIw3Ubxc4OaN7LAy57p9BSfZTrmmyVdj/GeGzxhkrHV30N
	MZYLEkIWh55/JulmLYBrRlKFafSWJMOGjpl3K1/cL2ILu/zUyASZtNitZ3e9KXIQpXRLTRNrI0L
	3ac0upWKINjpa4tXvwzs56NNO1t0TRl5f/KH2uIcExQiq1AFalgu3KVETOAz/2E9XDnHNrywd2r
	3jXjH/cYmNY7LJd/8GvrrH3rB8UGgscn+FXYx/4SmTqcwOwLn6TlzhXRheuHeUGnJLb0A5s+SnF
	d2Mo7Kuk0KGqSFiKBRxnZFaoSyKyIc8g==
X-Received: by 2002:a05:6000:2689:b0:477:6874:542c with SMTP id ffacd0b85a97d-47aab487abdmr8336510f8f.22.1783278867370;
        Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:41 +0200
Subject: [PATCH RFC 07/13] iommu: arm-smmu-qcom: Fixed mapping between sid
 and cb for gpu and lpac
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-7-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1792;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=CTSVd/0edKxTFOAN7N2IneJxadcZY86l85ROlQLsf6k=;
 b=N1CzOkGooWs0D7hEFfO64qs+XczQExJuyhhzPJnlf0WwJlRgmpU6QS/Q3PibSJHKmN1K6WJPv
 WALfNWTwDnSBfYHo0sDNPhrc2jlfRyjKisM+ctCA7C/dwWocYLjvP6b
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

We want to map context bank 0 to SID 0 and context bank 1 to SID 1 as it
makes it simpler to deal with.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ae6152bddf8f..e605a535f328 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -225,6 +225,25 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 #define QCOM_ADRENO_SMMU_LPAC_SID 1
 
+static bool qcom_adreno_smmu_is_lpac_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	int i;
+
+	/*
+	 * The GPU will always use SID 0 so that is a handy way to uniquely
+	 * identify it and configure it for per-instance pagetables
+	 */
+	for (i = 0; i < fwspec->num_ids; i++) {
+		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
+
+		if (sid == QCOM_ADRENO_SMMU_LPAC_SID)
+			return true;
+	}
+
+	return false;
+}
+
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -312,13 +331,12 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 * switch pagetables
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
-		start = 0;
-		count = 2;
+		start = !!qcom_adreno_smmu_is_lpac_device(dev);
+		count = start + 1;
 	} else {
 		start = 2;
 		count = smmu->num_context_banks;
 	}
-
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
 }
 

-- 
2.54.0

