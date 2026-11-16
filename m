Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841838;
	b=nBUFcNW/6JGK9M3UPE89kmbW7LPRjVnN8Vnk+pKGLjnQ16sOCo63j9bANgSf70MxU+ne
	 jiaidCo1/khac9wls3aQBjbXuqMo0AUhnMFdrH6HSFvM3P3UgNDpWq3UHXY6R4x0ClMBi
	 GSH7aBp2/5vXWFKdgLoUOPM9cXbwfGazos+kZIyqLLQHHpa73kgWyeurmEvNUd3IqnwLE
	 p4nDAd35xG4c8mPBJbQRfRnZpHa+wLnK1za0joIa3V9h2w+OLgsrrw23WfVA9ANYusOpx
	 5CFBDKtlBthwqMXEBL8DCU0dzN9imZHZb/XwCUON36sjQA35SYyGiO+uMWkl48gNNYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
	b=4PlWpBotcDJPr8anTsCiucWlmOA7KEIvr98qzcQbAll5iXSp/XnKsU2l7VxLz8AErpkV
	 PLcgR09s6erfS/1JrnBHh7cGB/T2wiIxueVnL2wBEyZluOYReXAyZ7aalDfY63rN7SRXt
	 GKNSoqmdO3fBMZZaMZQW9J7WWE/Q9YHDPrysasTPobyFnIIece9GFzfRVUkZ1cObkcC+9
	 DD9aDbANVhW4nDUp0RDROrzRMmkfUE4se+zM1b/Tw5vjDdRTidiL23M04xXtQXYEDiLfe
	 tfBMSC4wAuRTaf/kQ0FQb4ADSNoJzLzU2r8TcydyFdLR7sjAeuCaQfR7sIx9lptwFfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzRjc8lG;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D72B606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D72B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzRjc8lG
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50e26763a4so131520866b.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841836; x=1795446636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
        b=ZzRjc8lG6K5pMISUfZL68KqhlUc+won/zAj6eOU6Ml7714jBz6QH2YG6WO7mLKfXwJ
         j6y7yt3u2mn+lJukdvkQoObQMloTwDjKmIGf18haUQrJRvcVGK3MHoMkAT4z0rYZ6eTe
         MidgrZsFEOGLcuVfPOnm5dNEulzwEg08lcKL71aBLjFiPxjmxI/ySk2lgicMvsazSKZ5
         gNvdQb6ReZYa2Zuglg/HPjh3MZSAtVHjIxnbAx0dzwG4JQCx45sL5uOIm/WnszS16DrJ
         Bcguo0xrJcwV7PKOOATYHRfbZ8jsQPi3hpt/ED5Tb1LK+J08/d2mXDiTKTWa+NTBSSUR
         txcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841836; x=1795446636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
        b=1qdrcoRHM9DgaY0RnnquJ5IIksdJxKNWpncIjmoTZLzzlvBcHSN6YgVwZ6ntSwSraD
         S+X1uJcnqB0bv+1VxakhYMyxHREdcnWU0W7oB5j/tzNprej4hViiXBfOsovIQeGeUmMw
         V4s6xIh4WPQ1dJDDUL5zkFRwI2wYye6HIzldIFwBU+Gc+xFxo6+z5EMCNo3TfWfht5O+
         P56i8Zg28cCgdQBrQE4usj0Osl2SQuA6FB9SD5x92FCmqhEVerEvGPvE/9drVGWY898m
         tNAqPkF1E3EKKL/CmUUnrgKERKMMFSmO20lf6Iq14YcQwm81WH/U1qnObsibwlKwprT+
         QVTw==
X-Forwarded-Encrypted: i=1; AL+hErFQ45f88h8oeC0W52jq+dH91fLq8cJwMS7enbNNNGXtHET8sdJcyU5nHcjY7OH3o191hc08gW92WdU3@vger.kernel.org
X-Gm-Message-State: APuU4Z9RQmfJQeLuLysB9cuQVA/L8nTPswnyTNRbAXnKuCElDhBYF3lS
	/jKNitY3xArRk5MzZpbBp1Bj/rZhwQ1ymxIGC+RgWfklvPM6pRoCwHGv
X-Gm-Gg: AYBFou14jUJMGOVptPqkkRySB1qJiEO9ruRjZiUP7SvxtzGq4LDpAQoamumsnhdrG58
	+rqA74LjF8ljzv8UIrVlvY6FVeryj1sDXC9/Bh5eIPBlZXAzXOtCOeS++BAadRmdzBV2jMYoDhE
	pOXka1O6RDMRu456M9bZrfIaxIxMY1QoTFoQHzanaMPCtreOhG1yGrHuxlD0+iX8+fBDEFB3nc2
	TTkNOp+yI4cto4vtEDD8dEufJ/3aLF4zMW0mBig/lEXqxEVvmwqHpuLaU1xc99DSnDLrxI5KlxC
	Atsg8HqtR5V9iSM8eYqOUIfm32lzn6tI8oF0BFMPAJ57I499WxqsMA1fQVKhkFB17uOm875WJ5A
	T4X5Ba5bI/CdaOcmeld10YoS3CtulcNvb6UDH0hScovTTKbsrcqCEzRhD57/ghznD40QHXEDi6p
	CU5oW7yGAJJmIkVrqk2jezFPhohJtp5MmWv9WsZiiEkZky2vgRf4yhBsFvodRAFtlKXqRx/w803
	j6xN6qyIym0vhDwUxvbDULYGW237MGgXeXEkxMvv5+tLCPyGMo94zM5LtVCDCJqH5my4AL8f51B
	nXYS8adbMH5p6VITC1a7lmk8dTDR55FItHzCpALHVeCbMnjtBocHmkKOS52Z2YZ8B39qmO4=
X-Received: by 2002:a17:907:6d15:b0:c46:6a50:40c2 with SMTP id a640c23a62f3a-c5096387b7dmr889055666b.39.1794841836225;
        Mon, 16 Nov 2026 07:10:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert to use MIPI DBI bus
Date: Mon, 16 Nov 2026 17:10:07 +0200
Message-ID: <20261116151017.274764-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from a generic platform driver to a dedicated MIPI DBI Type B
driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
index 83c2af1be9755..318ece68b7806 100644
--- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -14,6 +14,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d07vm0baa_supplies[] = {
 
 struct hitachi_tx10d07vm0baa {
 	struct drm_panel panel;
-	struct mipi_dbi *dbi;
+	struct mipi_dbi_device *dbidev;
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
@@ -40,9 +41,10 @@ static inline struct hitachi_tx10d07vm0baa *to_hitachi_tx10d07vm0baa(struct drm_
 ({ \
 	const u8 d[] = { seq }; \
 	struct drm_panel *panel = &(priv)->panel; \
+	struct mipi_dbi_device *dbidev = (priv)->dbidev; \
 	struct device *dev = panel->dev; \
 	int ret; \
-	ret = mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
+	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
 	if (ret) \
 		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
 	ret; \
@@ -54,10 +56,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
 	struct device *dev = panel->dev;
 	int ret;
 
-	priv->dbi = dev_get_drvdata(dev->parent);
-	if (!priv->dbi)
-		return -ENODEV;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
@@ -243,9 +241,9 @@ static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs = {
 	.get_modes = hitachi_tx10d07vm0baa_get_modes,
 };
 
-static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
+static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbidev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &dbidev->dev;
 	struct hitachi_tx10d07vm0baa *priv;
 	int ret;
 
@@ -264,6 +262,9 @@ static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	priv->dbidev = dbidev;
+	mipi_dbi_set_drvdata(dbidev, priv);
+
 	ret = drm_panel_of_backlight(&priv->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -272,9 +273,7 @@ static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add panel\n");
 
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
+	return devm_mipi_dbi_attach(dev, dbidev);
 }
 
 static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
@@ -283,14 +282,14 @@ static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
 
-static struct platform_driver hitachi_tx10d07vm0baa_driver = {
+static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver = {
 	.driver = {
 		.name = "panel-hitachi-tx10d07vm0baa",
 		.of_match_table = hitachi_tx10d07vm0baa_of_match,
 	},
 	.probe = hitachi_tx10d07vm0baa_probe,
 };
-module_platform_driver(hitachi_tx10d07vm0baa_driver);
+module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
 
 MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
 MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel driver");
-- 
2.53.0

