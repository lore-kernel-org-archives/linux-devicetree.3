Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282016;
	b=0NisIJkcViRG9YnYZSFpDzu9I+cUdsx/fyJTjeA53K+bg6eThNnMV0oMXpuqHhLjDq6A
	 XndNksyxPeEQVSnwTy5zKoRjkVAB5L7oLQfm3BikTOKYvNdJwB+CMOZ9zS7wCHNrtTbnV
	 hrehqgLDJOqw3iYuxcWFFRMEckGxy3YK3JRrFilrLhuskMOg8j170e47ZzWSSZx3Eny7q
	 t1UKi7HnjrsOfUacYItV/jBg34sw7t7ZO4oXlBo+li57Zv7TnFuZEhCk96+zvvrebBQ1Q
	 +zzweE8nd0L+41/OycptanJ4bYwrODuU/sD6+lD8zmSW6y9GhTd80tsMl/mM0AbUPZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
	b=waKPY4uF9aT12BhCy+K0l+YkYwKyPVxRzSeBr0NTUK9LXgR68Mvy32bAuGvoCa1MQwWi
	 ACrSKHrQhaDDc0Qqj+OFsbfL4+TOte8gjq62uSuIZPo/QU6gck5eDamhq27US3ImgF+0N
	 1ePq5o1f9MoFfnssdd3YHJif9Wzja3KFJVqJEvD21ibxmd7vctP4w1eOE5kJMiQ+Rvfk1
	 FUM+CKpFr8m/88SrGg8+YzxV1Gf3WCi8I4R/3mUBHGV9hlajlB4ZRsjjrh5qPVekbKwLp
	 JWM9L2EqI/b/XRkzV8nm4WCCqkn7plmOG1uAijWH+N8YpLR8qooQOyTr1/s0JfGaXeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+vHwzI+;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF036606A818
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF036606A818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+vHwzI+
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1179935f8f.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282014; x=1793886814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
        b=h+vHwzI+H9X2csVamkSfKUUHbALtnKDHtUUA24TsKBK5H9ZDQZfHU1FQwXDhmLEtPE
         Dr1BA7GbX+S/GMv1HE5p4KXcvVuMUEBO3nAjpaCQFQb6m4TdIWHn/w1E0RVpiLfzQflN
         nAez3m7HSTCeoZAuuBMJeUPwzNfjYmKEqJBWEXWF7E+4AD0DDcUTj1jIS740Hf76uMjz
         fOmJWWt6x1qIx11OQM6kvfNdn1re4sfj3X22rQXNoEuHddWn8BOFmZvnzH/mdhdTY42T
         qpQrN5/tchfxVBD2umWC8BqYUsPBegGq6yOEnKgC5Pp8OhC64QoKMrFABH6NGHzXMdCX
         tTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282014; x=1793886814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
        b=Tvf670bJO9vahGTilVedw3yL9pc8WDBsBKf7KPPTo4TzEM56FSBzmu2LibMHeQpO9x
         boh8CKEkC0nP0LI/MWSwh4I02QWTsgLUbSgGCWWVDFLC5+35kMmSrmOv23nNbTs7pXFU
         8hgyQXCRkif4OXa/IZytss5iwV2tLh8KnaOVaD+508MyQfLE4ou7xnTen5R4xK1ChRiy
         4DqkppJfwvHNHNg0KHzaLfmgOfyTEoebX1FaS3jWzYYc9o3vFTmoOFbW4osliKRkhtis
         P6WWBbfqfCpJnfiSqAPPhE5pIRoDNviOOYP69iSVuwue4vbF05OdcSEofWpBpMdfE40m
         2T1A==
X-Forwarded-Encrypted: i=1; AKwUvBwkA75MeiudnBZlUkj3D+JoDnfa4LDKfhv5WU72E7aHnixHnVKHPFkFlbchI8IiMfq6G6UfhTXyzxJ+@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2hByf3CoSCSSXMjCO0keD/2tlmQR6a4iqrjoXW9IDHFL0xL5X
	f40NHehEc2jxoZbhmrEaS7XR4UI3sBDa0svkZawPqL0TuqWDLKHLV3E=
X-Gm-Gg: AYBFou3QfUJvBe0eyZROSh0kIgF4pQlJtW0ARpzxWXuouTNt8I0NjUvhoVfvVN+7ADZ
	LIMQNJue6UCwVRSVoV2kOhAfELaf/7zOE49RVknYrUfXu0N1MQM2kQhp2AZXbuSmnDTGbUsPQuk
	j477Ik6wkUB0uk1TPmtVCK17Qq2n7vSBefY0/zRJMndtSycz0zsbBgsnBzM1Qk39KqveGyKfn8F
	XgdFHDKe1A/IorH8Lffn91r3qRZ0ghe5HSEXtTNIi2Jn+QWhmt5S2KdYimyjtrlEXPKDYoJjz5A
	CS4oCJbR0HlhBbPv/gofU/7ggEoISV9k1lqMiOID9x4pdywclAOy4w5SWv8e/WgvgkQdj+tA5Uk
	Cm+Cf1sQ3DpPfuEnaRpFNRtR4VgQGSkBIdAU1n29G2cBbmPPWW+qgoeK/Ke9jxHQ02mQxUsXu5d
	OHkBuvFJ5e1GpCBdpPhDUujD3wQKqzcqu5osQ7JARwP5MoW9KVIeBZJ47bSwfEvUz/sjbmSpKzj
	q61QNBylQlQ2vX8fYbLuK7a62jsZydDJpprfOB/2jRCbF52F6VVRSvrxpEtKar6z9IJx0eCI0kM
	yGvwE7aayViYsjVQWD2fMgLHGVfUD5/icrQlO14I8+mZkA==
X-Received: by 2002:adf:f491:0:b0:48e:1421:ed49 with SMTP id ffacd0b85a97d-48e5d5909aamr9182569f8f.18.1793282014126;
        Thu, 29 Oct 2026 06:53:34 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:33 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:50 +0100
Subject: [PATCH RFC v2 13/14] drm/msm: gate lpac behind modparam
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-13-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1928;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ZEwODnTsRSIiQzAvYlWfm8pmWhNZkrTmOspw3E7UZvA=;
 b=Z9dhvvnQgx4S38zM+b46UTdfg9SThPOIVSdAoOz7EGATYLcY7dL9exHHWjN9XuX2BOku7wLrT
 FTPWSEv0DrrDpKLv4feGQ8Wj41R/cQfHXOM+Z/TSHsGDJf0un1xYOaN
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add a mod param to allow initializing and exposing the LPAC ring.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.c              | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6e2333466d7f..51781a2e8a00 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -30,6 +30,10 @@ static bool skip_gpu;
 MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
 module_param(skip_gpu, bool, 0400);
 
+int enable_lpac = 0;
+MODULE_PARM_DESC(enable_lpac, "Enable LPAC (A7xx+ only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_lpac, int, 0600);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 4244d9324cda..f6927c797fa5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -889,6 +889,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config)
 {
 	struct msm_drm_private *priv = drm->dev_private;
+	extern int enable_lpac;
 	int i, ret, nr_rings = config->nr_rings;
 	void *memptrs;
 	uint64_t memptrs_iova;
@@ -1012,7 +1013,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		memptrs_iova += sizeof(struct msm_rbmemptrs);
 	}
 
-	if (config->has_lpac) {
+	if (config->has_lpac && enable_lpac != 0) {
 		gpu->lpac_rb = msm_ringbuffer_new(gpu, nr_rings, memptrs, memptrs_iova);
 
 		if (IS_ERR(gpu->lpac_rb)) {

-- 
2.56.0

