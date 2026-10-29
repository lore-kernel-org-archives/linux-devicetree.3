Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281983;
	b=1/VkhXDDu0RfIohvjYyk52uyX3ALsNxeT9SuotGKx2KAHB8WSu6v+CcPc7K9IBvj/QNO
	 53PB8vR4CVaTfRwmZfSW3m76PsN/48DDzVbDVud1AemHSXgrcnS0rjBTWb25INGeKfq4+
	 TautqM6gTMki/pODuPXLtLFuauSyaxltaUSJziMrO3a2t1bud8nz4/TlB0x/utvyY9SPP
	 Gy9tld2Q5A/1cW9C+6BiYDAwMP7IGLpmovdIxwUtyOI4AutHFDVfNtXWuz/GTBHhncnM4
	 iEtvsEKKueMbo/yglRfkhD+QrH5IjNbpT70DSBBs5KuOTYiqeXlCVhmv6Zhh6OxDMuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
	b=xGZIUB4uG52gCd2xhV87wR0TQ5c46dObYZ9xOAQOu3ChMCBR8N0xdbjE9aF2n6RC/WR/
	 1MfdAfdIxnx13nSXj5jlYP3fPh2kzJhBVyy7gtRBPkGuobWj8mkGp1N/D6esUf1udaCEw
	 YMWgm7UwPGAnL5z1/pgB0vu7ZTYyL65OZ3IJeiIMubgF8DdQo0chP06hqBncT2GX8ZVgy
	 U+l3DPN65RA6H8vWoL9GDY37Ma3Bp8WzyN85b60vufzCda5CKPx5cKgdiOcLrhGrYk/0m
	 R8yKnb0YJPOIKr+dOT7y7Gdxim5zDdn76pkTv/ygdDxqYi82DVnqX0sjUnHU4os74aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHBOXQLA;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E90C606A33A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E90C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHBOXQLA
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so15749865e9.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281982; x=1793886782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
        b=CHBOXQLArqfC/kYwkg2z5vBijPZxsFSY/d7UHnyTZhCtyMpUYiXHDpdVgyIT/vkK0Q
         XajjYDO6pv5Q6dlNIzEuWeqnqkLtUNAr6dqiUgfyOZar6xRzhb3eW7hsw3PiYc/VD+5Q
         GV6YtxzpW2SNF9YRpZJbDdyo/hkR5nap0QL1/AeUzMZS80iltJpcNrMw8rt0Cze5QZ27
         K0xglNQu6uylBYa2ZblI8TGrJ+owFcp9Ze9yixdX+fyupq5zhylvAYWM62RKpocav+eO
         5lnDojSz2zcvVIa0carfvx136wUStQntxTF0jRiwa9Syhx9wYuPwLMzXoncAaFonEJdC
         yf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281982; x=1793886782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
        b=CWuojLx8cSi38P5WACo+veTRbgCcP/+uVE4r0Z1YfoON2Qi0GOe+k/HVp3J+OgJM0u
         iUkAHoeYL1aEH52Zon3Tb3s2bCAnZ5VcAu7O1vRT+U6zu4oeWoIdiS1zYxxINnFXFQdg
         N1Phs56dwdio2LxLVCqK3Y0Iz0itDPewzQMkJULa/nQXVX93TJovYJaJXzNQuS7jVv3U
         criVK/7El621uMHLwVRnq3TPQRoBCw+BXcaD6DYZ7t6hDGtlVryY6WOLos71iwOYB7hG
         beiM1E80MWDZVEYugq2ghQdTjjqYiOVdgc+fsI0pC3UTXbCW4/oSoN+w5QaQTPrvqTYG
         nH2w==
X-Forwarded-Encrypted: i=1; AKwUvByJ8qeiHoCljQ/iJ8eJtzSLA55L7rfhj1Xa/h0w5WF4ShaPZB2yGoopD80lq/0JgOuDxDOZLIvVtlFm@vger.kernel.org
X-Gm-Message-State: AFq9FYKkoVpvcPRujAkPJq37WQLT5m5F2Z7pJ8cdljd1cdEXF52Qx354
	PPjbQK9tcLyV+HLNyGnVi7sfiQwR9FP/65lvaVopq/pk/uowFF4a83I=
X-Gm-Gg: AYBFou14+aBQ0f1TAH9ILt3TxQhlVVkop5gmqDeF2HLoP1/AEnUT1XLEt8w353hQTdo
	fEVE02F421AFgzMFyET60fVxwEGquGcX3maQ0QAcY78kVgUZfhTw5W/n9Omi5XBBkfwTG3kL6hw
	WTcAeokP+RVWO2eFs37oA/Tl7F/687Gu1MWeB8K1+aZPgqCeryjdIhLnStm8Hnd98WtlnRw734W
	wMGVG9Oik7OLojQMgmR35z6K9JuGjDozgym3wod+X3clil+0YZ9KxeU3B48FJc/nemu620rquEB
	yF69at3io62YpT9Xyd3bLcYESdapTiSd5elpcorMEEiGv+dLxbPnBeYJuOtxhqfRKjDuvM40Mei
	f6oqK+d+SQQXqms0JtrY/ivTjn27mUx1QVmmpO2bR99Nm4QRlFCcrh9Vgwas3pyF1vArQq6aHHo
	o4Fku1tGduL49yVf/aSbemXtmcOeEz6UkCuNrnhWflYbZFxxIILQg2mKBizwNG0jq6n8G0CPDEo
	RoXWmhF+KHwcVJ8um19ey4Voo/ewQLvq3ZqbuVbUXMjdAXMDYG3+kV4E0I16pIz3U4KzLlW2PCU
	yNk90A0xUK0TLEKO59HE6b1R4JVndU0FPMOEefcE3fyPPQ==
X-Received: by 2002:a05:600d:8496:20b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a96677324cmr86595655e9.16.1793281981611;
        Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:38 +0100
Subject: [PATCH RFC v2 01/14] iommu: arm-smmu-qcom: Configure lpac device
 with split address space
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-1-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2309;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=NJ73RVOWEiPlPH9Z7PnLGwHMRejJoPZBM69o25lxk5E=;
 b=gj8sBR9N8QG04JyrcmUt5R2oXuziVAr6kQLdSMm6i0TlFKl87Gop8V8EHKny6NTxmbotiGmJc
 fs65LYDtGd6Dd5piBIpN6ZzqbLECs9zGbUWlcBT96BceUkWcOkEDLhv
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

We want the context bank used by LPAC (Low Priority Async Compute) to
use split address space just like GFX in order to be able to handle
userspace submissions with per context page tables.

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
2.56.0

