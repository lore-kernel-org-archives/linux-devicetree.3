Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE93A1686
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278867; cv=none; b=YYn+1xeB6k0Z8gbkhJDVubqFDZn7Sc2r+FSl6xfrWH98EzRNvoTrcEwOw0jk0MA5c1+WyW+XsZ+6mRn8bBzio5v6I5Mwbu0Zjb2cf4dLJsqXY+RNEL8mzpiZhX6LqU0DWTfLH12hFFGY6sFRSyhhuciGwbtXsaHqeHuXfRf75LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278867; c=relaxed/simple;
	bh=xCTorTjZtBUEYbL6NZx5Fd5BNvNcYE4Jm0bT2+wByeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duT0pagxBWH6zJzYR0bi/Az3Ls61R56o6hZJSXBK9aaivkXs+ggYMZ3fZMcDvkMmD88FRstA/T/EbUcGa//cnyOzi/v1hj5O8+y1VwrJV+GX4EOFYoUFgs3UJDsLh9iOIYiS/PI017YqkC3MegHtaZo4nFCNylpHOjnhND0qlDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4JICqZL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4JICqZL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso2406186f8f.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278864; x=1783883664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56825qeGGlTN+/ozHQUtA7w6Jg/t8lgL+V6rDIROEUU=;
        b=V4JICqZL9g54xA5d7N3r8RLcayJXfmXmZnCGmKS6CstQEZFaVhaJr2UhMs4xVABmJn
         RxX3y4CmIDb5yABJShETYRPw5PHaFFJtMyCWmdiek6/N56Zqh/lqE8GOFHhF0qjaLW5e
         3YXW44ad4GATUUjjWurokM9OFOk/qPkF47JravK4WXCm7UmaxixP+lYMS1pwPYNzppJ5
         CdbJqiUGcGsTIbOn2qpqmkHb8qCMxZ6LKd98C3kOpapIjCGfAxEUemaHUTr6CpkoHJ5n
         mGZqFjVk5IKQReJIQD9obxaoNM2wfRs6nKjIz5NBASWkHAjNiyZfIfGX2ikS9SqNolLU
         tINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278864; x=1783883664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=56825qeGGlTN+/ozHQUtA7w6Jg/t8lgL+V6rDIROEUU=;
        b=akD97qhUiTnJXneftldjM8cEbkmDIh14n0Dq++ASc/v5ewAj3em32EIQOhO9YrDVd6
         Cv9R1GzHCmNzi8Rb4FqwOs6a8PipewXjCsgVnD2LfiGpLXOLtY0mn9SJKQV/V9iyNWHS
         rUjuxpKvU2KPG+swwuUfwYVtcqZfUresDFne5WgPn1sei+AY+JX/HkFMP8cRKIjiL+WY
         WclYsV4OT9+/AovPc+A0t1oBBUEiCC7wODVYMfrIeSCRE2fITeJ1vip0hQ1/Way9+OrV
         AEI/G7GnWgfCx9yrRi27R5RW7oYPikCIlmb3cPEZNE8awN1Y8Mjkung7ttNePrNjyMYY
         FkiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPO2s7VZaUdc37dy6tYJKld65dudOZFGqIHM5MMEYz7ecKTnGdZEhIi/PxuPaYSCmB2kGvz+vH4f3n@vger.kernel.org
X-Gm-Message-State: AOJu0YyVunz1G4QMRLt77Cyyd/JAbmLdeScq+4ZDMi9IrndkTMAknzud
	MpDXt2YVSVSvfIb2yaZKlFE0MdtrLor8QuDt71876zaNNbsCQCXWg1c=
X-Gm-Gg: AfdE7ckG00ygOQMpgF1WgbjP+/ZJ8Gy/gOp3wd8iqFh8/GWbb5uS809/enM/e14ZHd5
	1rQ/X4EDcBYeBF0wu1eOPxyws7DXpUcA0A6FBQg7bpraAnCB6vtI/1GMtLya1ZZbGzhuaSJd99z
	sQK3Cp/Na/OFQUq0B2vfFMB1DXHz9ds8x7ZJU/rIsiZk7HXmqsCgrWzZSib7gx4xYV6sV6Yt0QE
	tjhzjkBzEkMghZ00Nx/LuayTjq6k83Frr0xpbI7/3pgyU63fkzlykhzUIAFgofVriGS79/zHj+z
	inztwvwDRzxkNq3sdSAreq8wyvK2+M7JlWdq3TIL2qb48gGC9JKVKvzHPNul1SOcb0iNb5gZiKE
	B8Icvk5kZHAI4aFqGlIQCJKPF8Qjbpcz2zuATaA+oIhEXL8GrYDV/C9XX/F85PQaYbqWmhUV/8o
	Lf/rkWPMcYUfcm8Zo=
X-Received: by 2002:a5d:64e3:0:b0:477:f5c:9bf2 with SMTP id ffacd0b85a97d-47aace8e983mr9385528f8f.51.1783278863594;
        Sun, 05 Jul 2026 12:14:23 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:23 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:39 +0200
Subject: [PATCH RFC 05/13] firmware: qcom: scm: Configure LPAC aperture
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-5-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=3104;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xCTorTjZtBUEYbL6NZx5Fd5BNvNcYE4Jm0bT2+wByeQ=;
 b=JM9qT2757B3skDadThg2OlzWiKU5aLJo5x9qIqus/1JlX88Naikriu2+e98AC1wkrlG4Kxof/
 4ILHHS1V0i/AYzsBbF8lb5SHonjTx3ikmirYkFyCsdZyXrX0gQUGfCW
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

In order to be able to update the SMMU registers from CP for page table
updates we need to configure the LPAC aperture to include the context
bank that will be associated with SID 1.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c        | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 include/linux/firmware/qcom/qcom_scm.h  |  1 +
 3 files changed, 22 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..92093399f20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
 
 #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
+#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)
 
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
 {
@@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
 
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
+		.arginfo = QCOM_SCM_ARGS(4),
+		.args[0] = 0xffff0000 | (1 << 8 | context_bank),
+		.args[1] = 0xffffffff,
+		.args[2] = 0xffffffff,
+		.args[3] = 0xffffffff,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_lpac_aperture);
+
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 71ce4cbbf27a..be374cf209f4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -668,6 +668,9 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ret = qcom_scm_set_gpu_smmu_aperture(0);
 		if (ret)
 			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
+		ret = qcom_scm_set_gpu_smmu_lpac_aperture(1);
+		if (ret)
+			DRM_DEV_ERROR(gpu->dev->dev, "unable to set lpac SMMU aperture: %d\n", ret);
 	}
 
 	for (int i = 0; i < gpu->nr_rings; i++) {
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..70fb93e303e2 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -100,6 +100,7 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 bool qcom_scm_restore_sec_cfg_available(void);
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank);
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank);
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void);
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);

-- 
2.54.0

