Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA815351C24
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169927; cv=none; b=EA7cmI9KJtjGAuvYTgmyMFJPlj35k7U4yH3/jFUHi2KNSwGBrR90L0JOdPnOdsD3BD/Yu2YfW8t1ly7VeyUqfIXyhDtSct7T9YLW6toDy1wFRkedO3QsH4ZoF7RYQLBnSzHlFsBdlXrHosZXrQ3yq7SCp95xdhVJTtjg5cBwPtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169927; c=relaxed/simple;
	bh=kF2LzxdgweAy6FzpXdvDjmf39ogbKBMsqbXNJC0dsg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ml4Pj4CoZlv2zzV2NIlPEAadsx3fTP6vX4XmZ3FqjgdzDIyRnfPAnUnlsy2ZvIGxxiW4Jlnfbxy/CLST0WrxvNjiUIElUeXjlJbVsjx8nfHetGJ0vgM/nzlRsVMvqIAi8PCYix604qZkTEcJJ44wrh0v976D6uuu5c+i0b/wGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAlYMjbM; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAlYMjbM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f8893bff3so1397038b3a.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169925; x=1779774725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0iPmr2FZaFpGbv5xE0HK6353ex2Wmyxrb+8vBjR4oM=;
        b=sAlYMjbMHvLuNN51cxPpoiVNCm4D1eePm6DEfsHf4tVDNiSGPE9TFt2LJnBBXv6dlP
         QfkXBE8rguKl4gwWxi4yVIUDvoukr4aV2mwFKxId5PfyVe3yK58AUXKavtmYJppyABHV
         7DjVScIyoisSoyndZtJZJJn/y9S5pnIQXh79cpWIrnZpmffVR9e1ObeJb9H+GgxZf4eg
         ov7DmuiBDDMpwvauBOssgsyhcFZ8K5fXMgsPR5R9UktKMRUuhpDxBYV1eTd7+NEg+kVa
         3N29Kl8IHnfd423+gibR/RZLqrMsV+wRSdlTaGrFp/lVQbLx7gtIyJILpOWEsNIpXQC/
         613w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169925; x=1779774725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0iPmr2FZaFpGbv5xE0HK6353ex2Wmyxrb+8vBjR4oM=;
        b=b1yJsi0NjX6LnzUuLEfxKHAo/Lu83na3G9xNZmifWyWzZ11jPw5ZoBMyVjvMBSkquC
         fo+TmCVAaVBk/hAp66lH0Bf2RiDZQwgvseUS2iH1Zr/6ezoMAKoMibZVf5oERQCDQJoX
         l4AZfx4F1EiAaF+plH1hKqb6BbQwaVvdp2Ce/7sLrfD2yXWFjOhjUlFdo8r4OMcUiqM1
         FNxODWIbMAVo8k1hg1+RF5r2cHx13ZSUn8jraGx+ijAvzk/i4G6tfxak79cTL/YqMl/2
         NSToSw7WWOR/Qp8NBmgJQfPnxj1GGpfplXmdatLqAqjDPqpMBuM7S/TG7nEHrmBWyv4b
         oLWg==
X-Forwarded-Encrypted: i=1; AFNElJ9wJwQcVLR0JTwlT3mxsxJvDjO8vW9PE/SxiLI1O7kAKR1wPHp9DlqcVTelre52Gm6Pq77sUeK4tJQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YxpoJzj8SiJIK32ASandvjUr/vOPby3zzdUcFeeu8y29Un19B6t
	ih4SNph16rYKSFKoEtG46sQrdtKZ1YzVM7tjZKD0fx9MgV8hGIoXv/fM
X-Gm-Gg: Acq92OEysCjbK7xUZsDNZq2XmBmz5F0MNq6aRSapUkxmVfBTOFeJ9gWvaw5ER6IRoRv
	T9gEQcCoNABM0PBlqB3f7wKwvrXOUxlbcYfNX3UMymJiPQclZ9+DTpz3td7lwehBWvvWWD0IUdY
	l2ZH6NkDBi5+zSAuJ3GCEGg0ZzDR5cfYH2fuLosW+F7lFoySV7LnVgea0OvSIMGT5Z4xWeveesO
	HzyCQawa1VcKy7S7E1lpqgb4UQDrP12hCkEMeOKwMn80yyf/Jg35s64LvM+OBLqeIU9sXgnFNDR
	Uupo3JojvJAcnhajOic2/HyhTrEPCO5bPPa26z8OE3UY/od8a+1aGs7W2HqhYOBiv+Nvthc0ELZ
	9ID5DFBe8rw6+9J4mH3CGAHC5XFN8pPx+RuJNsybV+AzN3eNuaZjwZvAwoAeAwZqmDf8QTudaa7
	XwyXUqDJlKCvu0nNdeDNKc+5ZKa/f6AeuOln1XPyXJPExRN+GPQkTlCz1ojWbxIfzNBC/PSy1QH
	jrL36MZqBhb
X-Received: by 2002:a05:6a00:2d0d:b0:83e:cc87:58f4 with SMTP id d2e1a72fcca58-83f339b425amr15909280b3a.0.1779169925063;
        Mon, 18 May 2026 22:52:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:52:04 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 2/4] drm/verisilicon: add model ID constants and DCU Lite chip identity
Date: Tue, 19 May 2026 13:51:07 +0800
Message-ID: <20260519055114.1886525-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519055114.1886525-1-a0987203069@gmail.com>
References: <20260519055114.1886525-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce symbolic constants VSDC_MODEL_DC8200 and VSDC_MODEL_DCU_LITE
to replace magic numbers in the hardware database and probe path.

Register the DCU Lite chip identity (model 0x0, revision 0x5560,
customer_id 0x305) in vs_chip_identities[], making the existing
vs_fill_chip_identity() path able to recognise Nuvoton MA35D1 hardware
purely through register reads.

Also add three register-level macros for forthcoming DCU Lite support:
- VSDC_DISP_IRQ_VSYNC(n) in vs_crtc_regs.h, for per-output VSYNC IRQ
  bits used by the DCU Lite IRQ enable/status registers.
- VSDC_FB_CONFIG_ENABLE, VSDC_FB_CONFIG_VALID and VSDC_FB_CONFIG_RESET
  in vs_primary_plane_regs.h, for the framebuffer enable and
  commit-cycle bits used by the DCU Lite plane update path.

No behaviour change for existing DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h       |  1 +
 drivers/gpu/drm/verisilicon/vs_hwdb.c            | 16 ++++++++++++----
 drivers/gpu/drm/verisilicon/vs_hwdb.h            |  3 +++
 .../gpu/drm/verisilicon/vs_primary_plane_regs.h  |  3 +++
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
index c7930e817635..d4da22b08cd5 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 09336af0900a..a25c4b16181d 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -90,7 +90,7 @@ static const struct vs_formats vs_formats_with_yuv444 = {
 
 static struct vs_chip_identity vs_chip_identities[] = {
 	{
-		.model = 0x8200,
+		.model = VSDC_MODEL_DC8200,
 		.revision = 0x5720,
 		.customer_id = ~0U,
 
@@ -98,7 +98,7 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.formats = &vs_formats_no_yuv444,
 	},
 	{
-		.model = 0x8200,
+		.model = VSDC_MODEL_DC8200,
 		.revision = 0x5721,
 		.customer_id = 0x30B,
 
@@ -106,7 +106,7 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.formats = &vs_formats_no_yuv444,
 	},
 	{
-		.model = 0x8200,
+		.model = VSDC_MODEL_DC8200,
 		.revision = 0x5720,
 		.customer_id = 0x310,
 
@@ -114,13 +114,21 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.formats = &vs_formats_with_yuv444,
 	},
 	{
-		.model = 0x8200,
+		.model = VSDC_MODEL_DC8200,
 		.revision = 0x5720,
 		.customer_id = 0x311,
 
 		.display_count = 2,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = VSDC_MODEL_DCU_LITE,
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.display_count = 1,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h b/drivers/gpu/drm/verisilicon/vs_hwdb.h
index 92192e4fa086..cca126bd2da5 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
@@ -9,6 +9,9 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+#define VSDC_MODEL_DC8200 0x8200
+#define VSDC_MODEL_DCU_LITE 0x0
+
 struct vs_formats {
 	const u32 *array;
 	unsigned int num;
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b39..67d4b00f294e 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -16,6 +16,9 @@
 #define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
 
 #define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
+#define VSDC_FB_CONFIG_ENABLE			BIT(0)
+#define VSDC_FB_CONFIG_VALID			BIT(3)
+#define VSDC_FB_CONFIG_RESET			BIT(4)
 #define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
 #define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13, 11)
 #define VSDC_FB_CONFIG_ROT(v)			((v) << 11)
-- 
2.43.0

