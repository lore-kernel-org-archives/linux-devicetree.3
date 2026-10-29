Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281999;
	b=I3vKMAKBoFJBK9yoZ9e4O+ud5dgXUIFDEl71aOcAGB4SZWHfHtVg64N+x/VUPWfofSEc
	 HMNsGvRqhoxQxLSk06V3nwjtISLb49DL/rEqZLaXH7isP2hlXg1LIF9SANu7ZUnDw1EFQ
	 SEXiRWWqWcnwaLTKeSyuEN7AqmRoD/3QLJMVeWwOJSrf69eRwYaVANEZ4o/wOh003bYVn
	 zHHflGjcAL8sBrQYm14XJNoc8rJP8ZMWciGTpVvypimRIDy7y72JAIWgCFMAvvhEc9Bxx
	 BvgZWFCR7X8P6opiuW7g5osbp1zB+z5ExnazFU7xK2LNSagKzClkhZpA9D5VnDTEhWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
	b=C0321gWyxbK0mZyZckwC96ED5j+d45Oh24ErWHxKNn7YX/o+6UhN9QfNNZVW2OybtaoM
	 gbjD2wmhimyivSAoeeDhB0vnaNQ0XWMDCWwTKVEn4auvV6HbD/bUnWIAIsolS5a4MsE+c
	 xxj/QmaopCgxBGfa5KZjJARhKq5YNR7dbc1pmzv3fuKadcLyq79Y6C8uhe6UXUleOk5w+
	 KAB4jzUZPaoDWAxCwaa1pnxytX9FN3iF+JKqdpK4fgmTaMEhW341y/hd17jqRYEy/lTYf
	 h+wxNYPgVURWcAxIkGK3WkHmOnP7a9Dr9lUW01Wu4J+a+8GUskF6kJEAL9IrYgUA3Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRRfYxUF;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B438E60A3834
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B438E60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRRfYxUF
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so460578f8f.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281997; x=1793886797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
        b=gRRfYxUFQqwTkUT2oyeXYOUkBjicevEGc3PmbdOaYe4q525sM4GW1KHH/GZLMjZqxe
         cfIPkORDTIG6BYAy6VV0m89jmebmE4y5YMRVP55FKwHQf4NSXd0tGra8SfLioopUOoPa
         ORfS1uUt94DVUdWZA6okIiPnR1Ud85iMh+TC8ns0LYMrPETP8MW8svSr7lO0OrylXIvQ
         0tEhcDm3kkGY3aF1ZM+v+RjbQgMKbOsl6iEuxvBgtUpITXwjGmUb7AxYhgTHKAJuWpeO
         HQu3X4rwffKavXmno+LcnmaOq0Z4ZL/UZpM8D0dPodlH/A2LFz5fH+sAoashAsLevwSS
         GPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281997; x=1793886797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
        b=o12YI6Ox7siT0SG6rNQ/LuN+Hf07rGYrSzRqBWqw7en71UYkjbm3o6TXBxTx4bA4H8
         H6sKb83xaVR7g/SEhY6pPvw3Em1jSxfYqmep+hbKFK8rMsgqP8ANy8584vHXMBAtwtW6
         3hCsLiKG9Q/xQmejzquihLtllrPOhLRbIpw2khASA5X6kOKSyPmB619NJ/Z9+NklxkGn
         rqh+yaHkE0qm2qAOTOFl5VkQFO/whpd5fZlU537zsxoTiw8Rv0pPc8oTG69SFZTwPKVq
         1+9CWK0lGv1ZHTfZIrbhzmVCGo35oWM6M/ZgfhItDrDS/C8h9UZIMT4FHrMg7aC/1ypn
         lA0A==
X-Forwarded-Encrypted: i=1; AKwUvBwezVGQh1Ts3vzIPW3H5DvDQTpHwHLvc/NsZMpp/DElxBkso0PtdowD4b8Y1m5sILiuGmn8Bi+9QHoG@vger.kernel.org
X-Gm-Message-State: AFq9FYKIwQlfRTenaMHBLivyqonzfvKwCQspGSjkqRLmUbMuVi7RBJQT
	fcdu8ARQHL53b0fvK/Y3gf0vgDW/W1AB1IBDiAC8n6c18GLtgpTGjrQ=
X-Gm-Gg: AYBFou29cTj7+EXbyshbAoC7LNBGHTOdTKqCl0JftEqbxQ4cJFrz3RyRru39CF+dbbE
	KSsSnri+4OtZ/x/OmTQb6rLvKNCudNPAN3H2cpBO/axTcOu1XRjy1+ZokmwwNoecP36NxGPUsOt
	Qd19Keokhbxdt/JZme035sgM9MySmw7K/Nz+a/R18gyXjSEePwjvaGdfa2b4vqnf1e9b3JtySop
	V7NRoSDr9F9Xk+ivgqngUb73R79ESKPenJ++qDD413Ua6RX28mBHNWILBxkrw1wu5fuBoFAUkb4
	NZLescTd9LHfJW47HoiHodnHfKvBTHlVDyUS/kt8oXCBxrZIU3UXsP8trgJVs3Qz6FP087iitaI
	wTrMo/Bl61eNY13XACs17lRQpFNdwcpu0ouWTz8uMdkudFAPj7OfUeAmROHQW7M5tbhnQl9G9TN
	n+zg7NOYRKTNqxkEiUvy4upefUfVkAXCe2E+eO7WOqMVEDn9K9IXqFzt1j+usXEi/urqedVjZME
	/CsuSgXsUzjPWWA4NQMhhgfZ4m8Dic0HfzIotra/jDBI6E8XjT5psV3ABfd2JSNpPbkXw2UbxYU
	jigYXedmbCw5hzwNrV4vqZFDBb9J5f4brtYSgT0HpNRAoA==
X-Received: by 2002:a5d:5b91:0:b0:48e:60a7:e0bd with SMTP id ffacd0b85a97d-48e649933c7mr5094994f8f.17.1793281997067;
        Thu, 29 Oct 2026 06:53:17 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:15 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:44 +0100
Subject: [PATCH RFC v2 07/14] iommu: arm-smmu-qcom: Fixed mapping between
 sid and cb for gpu and lpac
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-7-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2537;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ddmhwqAVzi4UvZ7es6VT6qKlZqL0nH2dFG7G9BUrboU=;
 b=bSLxcYA1Hg7TlJKZ47oBfv1YRksocS8fOUT+GDiqsMJuS2PEP6fGuu8UQ7sr0kvqrRp2ErWZv
 hi5jOvHNIWgDaeJxu8pdrMCwt9FmVwlER2SJfgdk1R9+hQIkj2UjR5Z
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

We want to map context bank 0 to SID 0 and context bank 1 to SID 1 as it
makes it simpler to deal with.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 31 ++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ae6152bddf8f..9413b748e79d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -225,6 +225,24 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 #define QCOM_ADRENO_SMMU_LPAC_SID 1
 
+static bool qcom_adreno_smmu_is_lpac_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	int i;
+
+	/*
+	 * LPAC will always use SID 1
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
@@ -237,8 +255,7 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
-		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
 			return true;
 	}
 
@@ -313,12 +330,14 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 2;
+		count = start + 1;
+	} else if (qcom_adreno_smmu_is_lpac_device(dev)) {
+		start = 1;
+		count = start + 1;
 	} else {
 		start = 2;
 		count = smmu->num_context_banks;
 	}
-
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
 }
 
@@ -363,8 +382,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	if (client_match)
 		qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
 
-	/* Only enable split pagetables for the GPU device (SID 0) */
-	if (!qcom_adreno_smmu_is_gpu_device(dev))
+	/* Only enable split pagetables for the GPU and LPAC devices (SID 0 and 1) */
+	if (!qcom_adreno_smmu_is_gpu_device(dev) && !qcom_adreno_smmu_is_lpac_device(dev))
 		return 0;
 
 	/*

-- 
2.56.0

