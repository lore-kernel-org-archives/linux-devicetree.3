Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77973A759E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485704; cv=none; b=McZaDgVcLKbnpkM9Q3KQZvj4sNWaKzysNCR1dGKC07ZflXsTnrBV7PCZSjFF2PgsNnllNJpBpE8pagFpEI2vUkQqB+jHe2++1SzXdsHKRgqbg/dR9L0LOrA1t2szxug87QlfJKGuGdZxDYTSlnFu6XhQ0Yy5QNRG3r8iFAkZwhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485704; c=relaxed/simple;
	bh=OcDBfkMlEDbmFVFQBsZ8hTUlSAeF53HzTvYoSiCHOnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiS3mbu//ewTZdD5m6QiCXwlAGW9ALcWxWsjDDFvfNZXt9nhkgxo/ofuVzJoW3RVFLOaUyHzJoH4sDNtvaUY9VyhuFey4BBTCES/3mKSxRsOt1s7J0Vk2z4TiCmgjH7mnIGKiCMKhkfBQDNanKrExeVxwtZ5DO+4hTHQzJ5vdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb06tWor; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb06tWor"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a40502e63bso3519187e87.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485688; x=1779090488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbJjEkdr1gdwOgkOrbiUvdWUHFLgDfQGisgY8rnIeVg=;
        b=gb06tWoru1+Z//N1uOYj5auYDoNsrRsGQmDAbnd9CMq0Q3aiUW7ba1am8pSBRryo48
         Tl6yxM9/NZxxcOlt9wvRI6Vxd3L4OQpXUox2+QEpJ1BXtrbFNKu2iK23LkhHMOVUyzjC
         G6AFkFx2CBxNK2M/23N+fNCAO9nINuTOIfoMldu3xu9wc9wBQY9JZbMxR0kEHI8gJWqt
         s9mFv5Ba60hjtAlWhLlP1eo6KNRMmz3F8ckLrrZHpbDA6FXwNIhLkERMSxY2PYh/6SGl
         N+FZYVwU4VdTCYJL7Dd69yq8JQUdcK0a4wc1DV8Gw5s3xiMse4ek+3JK2UZgX62qlTO3
         qmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485688; x=1779090488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sbJjEkdr1gdwOgkOrbiUvdWUHFLgDfQGisgY8rnIeVg=;
        b=k9W1weJUw2wjG4Q92erb1RL8DNOvM8lHeeoEkk0+u4EPDNgzoa+LZx/LOjd+JElMSL
         iGFdPPiuY/dD11eW4SHPYqmXbvp0PKM5y7mLqb79pCZqgjCkgP5KbK2OyqPa7Q4OjghE
         qdlhLZzEh52oWakdRwhq1lOorLVi4tU/xCOHG9RViCgVRTovgvGO4biiSswyBK8HxbMx
         fbyr3Qd5epLxfu5y0fGYsMzWV7l7qFr1YSKzQPXwVX07+/LVt0Et1t8Rg80j3gsS3Kyy
         AZLYd7huQCLPS7ME16AeSTTluwymvjT7atW/TGb38mFBxDMli5AclFCdb1ceBvOvDxSu
         5ECg==
X-Gm-Message-State: AOJu0YwSD+zzpdidwQKT6IMNmxH0J1nrFt4gvvKh+SmSLgT89oeTtAT2
	V4ubV+62CkdofoSDzzFxhVAI7Zu9tc8NrmIdTknx0b3TAH8bs9GxuRym
X-Gm-Gg: Acq92OE6KMLfHpf88nrGlWG9x8ebaOp2inWUNw39vdavT9dU+B8CuH7EQoO8fma642O
	y8x0Tx1YfC/hv4RT9BDDYsB+pJxi+VXh+R4ojulM1brsHOEfZJIdbtP5tiTEuTjKjIzT6tKe0cf
	vB0a17WVV65WiNhkdG2R9/1dJaAtgPnfbTQkkgbaF7df2Nk6+ua5hYrXBnUq7tqdrLafhbIJdiR
	8Dmlk+TXFTn1tpGaj+U1534Pj8CrjrvSA4WeOlV0DBjNMURkgFEqn0QboYp4bulbGP7TaRzy7FI
	3THcO1S5KiC7moAy1uNRSUVmJoZP21t9tGewUTo6sKs11Ns7mS6nfW4HejaGL6h27/QOXGYGqGe
	1wM9//xyjwGxLPlJeURcErzEF2hKzP+yf0tl9nejbs5w2Vxv1FRhFwoivzc1GijLRJLusExUfRF
	zcvHdCZ8LecBE9
X-Received: by 2002:ac2:4e06:0:b0:5a2:b43d:ac47 with SMTP id 2adb3069b0e04-5a887add854mr9103374e87.5.1778485687414;
        Mon, 11 May 2026 00:48:07 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e096sm2386670e87.38.2026.05.11.00.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:48:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI calibration logic
Date: Mon, 11 May 2026 10:47:50 +0300
Message-ID: <20260511074752.24745-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074752.24745-1-clamor95@gmail.com>
References: <20260511074752.24745-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20/Tegra30 have no dedicated MIPI calibration device and calibration
registers are incorporated into CSI. Lets reuse Tegra114 calibration
framework and add Tegra20/Tegra30 as a special case.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/host1x/mipi.c | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e51b43dd15a3..cfaa27e0f892 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -61,6 +61,13 @@
 #define MIPI_CAL_CONFIG_DSID_CLK	0x1d
 #define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
 
+/* DSI V0 controller */
+#define CSI_CIL_PAD_CONFIG		0x09
+#define CSI_CILA_MIPI_CAL_CONFIG	0x0a
+#define CSI_CILB_MIPI_CAL_CONFIG	0x0b
+#define CSI_DSI_MIPI_CAL_CONFIG		0x14
+#define CSI_MIPIBIAS_PAD_CONFIG		0x15
+
 /* for data and clock lanes */
 #define MIPI_CAL_CONFIG_SELECT		(1 << 21)
 
@@ -92,6 +99,8 @@ struct tegra_mipi_pad {
 };
 
 struct tegra_mipi_soc {
+	bool dsi_v0;
+
 	bool has_clk_lane;
 	const struct tegra_mipi_pad *pads;
 	unsigned int num_pads;
@@ -122,6 +131,7 @@ struct tegra_mipi {
 	void __iomem *regs;
 	struct mutex lock;
 	struct clk *clk;
+	struct clk *csi_clk;
 
 	unsigned long usage_count;
 };
@@ -265,6 +275,9 @@ int tegra_mipi_enable(struct tegra_mipi_device *dev)
 {
 	int err = 0;
 
+	if (dev->mipi->soc->dsi_v0)
+		return 0;
+
 	mutex_lock(&dev->mipi->lock);
 
 	if (dev->mipi->usage_count++ == 0)
@@ -281,6 +294,9 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 {
 	int err = 0;
 
+	if (dev->mipi->soc->dsi_v0)
+		return 0;
+
 	mutex_lock(&dev->mipi->lock);
 
 	if (--dev->mipi->usage_count == 0)
@@ -300,6 +316,9 @@ int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
 	u32 value;
 	int err;
 
+	if (mipi->soc->dsi_v0)
+		return 0;
+
 	err = readl_relaxed_poll_timeout(status_reg, value,
 					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
 					 (value & MIPI_CAL_STATUS_DONE), 50,
@@ -311,6 +330,43 @@ int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
 }
 EXPORT_SYMBOL(tegra_mipi_finish_calibration);
 
+static int tegra20_mipi_calibration(struct tegra_mipi_device *device)
+{
+	struct tegra_mipi *mipi = device->mipi;
+	const struct tegra_mipi_soc *soc = mipi->soc;
+	u32 value;
+	int err;
+
+	err = clk_enable(mipi->csi_clk);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&mipi->lock);
+
+	value = MIPI_CAL_CONFIG_TERMOS(soc->termos);
+	tegra_mipi_writel(mipi, value, CSI_CILA_MIPI_CAL_CONFIG);
+
+	value = MIPI_CAL_CONFIG_TERMOS(soc->termos);
+	tegra_mipi_writel(mipi, value, CSI_CILB_MIPI_CAL_CONFIG);
+
+	value = MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
+		MIPI_CAL_CONFIG_HSPUOS(soc->hspuos);
+	tegra_mipi_writel(mipi, value, CSI_DSI_MIPI_CAL_CONFIG);
+
+	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
+		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
+	tegra_mipi_writel(mipi, value, CSI_MIPIBIAS_PAD_CONFIG);
+
+	tegra_mipi_writel(mipi, 0x0, CSI_CIL_PAD_CONFIG);
+
+	mutex_unlock(&mipi->lock);
+
+	clk_disable(mipi->csi_clk);
+	clk_disable(mipi->clk);
+
+	return 0;
+}
+
 int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 {
 	const struct tegra_mipi_soc *soc = device->mipi->soc;
@@ -322,6 +378,9 @@ int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 	if (err < 0)
 		return err;
 
+	if (soc->dsi_v0)
+		return tegra20_mipi_calibration(device);
+
 	mutex_lock(&device->mipi->lock);
 
 	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
@@ -386,6 +445,15 @@ int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 }
 EXPORT_SYMBOL(tegra_mipi_start_calibration);
 
+static const struct tegra_mipi_soc tegra20_mipi_soc = {
+	.dsi_v0 = true,
+	.pad_drive_down_ref = 0x5,
+	.pad_drive_up_ref = 0x7,
+	.hspdos = 0x4,
+	.hspuos = 0x3,
+	.termos = 0x4,
+};
+
 static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
 	{ .data = MIPI_CAL_CONFIG_CSIA },
 	{ .data = MIPI_CAL_CONFIG_CSIB },
@@ -399,6 +467,7 @@ static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
 };
 
 static const struct tegra_mipi_soc tegra114_mipi_soc = {
+	.dsi_v0 = false,
 	.has_clk_lane = false,
 	.pads = tegra114_mipi_pads,
 	.num_pads = ARRAY_SIZE(tegra114_mipi_pads),
@@ -426,6 +495,7 @@ static const struct tegra_mipi_pad tegra124_mipi_pads[] = {
 };
 
 static const struct tegra_mipi_soc tegra124_mipi_soc = {
+	.dsi_v0 = false,
 	.has_clk_lane = true,
 	.pads = tegra124_mipi_pads,
 	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
@@ -443,6 +513,7 @@ static const struct tegra_mipi_soc tegra124_mipi_soc = {
 };
 
 static const struct tegra_mipi_soc tegra132_mipi_soc = {
+	.dsi_v0 = false,
 	.has_clk_lane = true,
 	.pads = tegra124_mipi_pads,
 	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
@@ -473,6 +544,7 @@ static const struct tegra_mipi_pad tegra210_mipi_pads[] = {
 };
 
 static const struct tegra_mipi_soc tegra210_mipi_soc = {
+	.dsi_v0 = false,
 	.has_clk_lane = true,
 	.pads = tegra210_mipi_pads,
 	.num_pads = ARRAY_SIZE(tegra210_mipi_pads),
@@ -490,6 +562,8 @@ static const struct tegra_mipi_soc tegra210_mipi_soc = {
 };
 
 static const struct of_device_id tegra_mipi_of_match[] = {
+	{ .compatible = "nvidia,tegra20-mipi", .data = &tegra20_mipi_soc },
+	{ .compatible = "nvidia,tegra30-mipi", .data = &tegra20_mipi_soc },
 	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_soc },
 	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_soc },
 	{ .compatible = "nvidia,tegra132-mipi", .data = &tegra132_mipi_soc },
@@ -525,6 +599,14 @@ static int tegra_mipi_probe(struct platform_device *pdev)
 		return PTR_ERR(mipi->clk);
 	}
 
+	if (mipi->soc->dsi_v0) {
+		mipi->csi_clk = devm_clk_get_prepared(&pdev->dev, "csi");
+		if (IS_ERR(mipi->csi_clk)) {
+			dev_err(&pdev->dev, "failed to get CSI clock\n");
+			return PTR_ERR(mipi->csi_clk);
+		}
+	}
+
 	platform_set_drvdata(pdev, mipi);
 
 	return 0;
-- 
2.48.1

