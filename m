Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335532;
	b=xQbm3gb1sAHbbMm/ID4atUUo8+9db6o6bqpb/YTmrliaSbLAnyWCXEZn7LU6NbQSBB75
	 Iz/pgzII1rjLDa73ZXmJUlrNEmy0x9XCKDUnGVnX/vOWR4HJaeJ1iNiA7hBTwYRh+k7zd
	 1eZZtFIKfJmNomfIP8waPueDz+Wd4J3GmmtRy46TUwplW3i0vK7Mjps9+p7ghEK/uYtSW
	 uHcVZEZRCd04rSur5V9ff0+bI7onRFRBG3+/6MtBwKAjVOUdJ+2Vm+mlzoGEI7VuEccWL
	 FWHNdWquvOclTMDDFzHTBtAfVhAI/bXLVK0o4lpFQIhFeXlCzcIKJZh7Y7bNnEgt1ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
	b=yOH0Mv7ZKm1Ar8BrC5fQc01sfd2OuP0/zcGwAlZAufzi2is+9jVDb9UKq+BstvTzsAnE
	 G2pqqZ3wue7o7C3X9UCjmDxGt6FEyVZDATpspSXkdNaBl9NlT9QxCCwQeWxyyXH+owisv
	 uNXnjJFC5CT0dppWyF2ve2CKuG1x9zpajIDIDK/3hDEYWjS63f5yOVqOr7BTsHYNCEnaF
	 0BT3EaWNqf+XfIA2jk5OfHMwUXqaWyuK0kzfY6B7HRTv9Q9ccj3p+knPeEoMUVx2tNudI
	 G82qEQfnB2MS2YTSn5AaT928WoRU6JjyW0W263u30wXlFW2eRiGZNWHDI8HUhuAZukg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bB26HDf6;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593E6606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593E6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bB26HDf6
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50cc7540b7so308379966b.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335530; x=1795940330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=bB26HDf600jdMqxCKutJPmbsqrb8UZ5Jx77PmaK8AmGNXP9Zdth99ToXahTI8I9fGH
         k0j7n049EpqXTbWdvSbQKB721kBIAY40T4HdjoZ8WR9jjHaoSBwUlQN51ul0nSGrRr1g
         p5hUYJx08CxznYsnpigmJdThiVzp1tdAMyTKPrLICt2jPoS1vW89davjz7D/4ZVJmuR/
         5z4EhvXS9X2PSggMbIKii2kA3xhUY3epdlmLrEB4zQ7x5UUdRqSiNbi74OVc2SfzePkk
         nmmA/VdUeyD44VTJnPIcYrZ4YGdrh0QZSQ/Z+x0dWvU3V9KzvshiINP6/S/4h1V0AMc9
         FFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335530; x=1795940330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=oVI+XYG3mYGY0y/+c6ydgNlzC+odlbOYAFg2EwFSChEG1iU89cDRrh+85v3XxT/uiO
         HNo75H5STi9lvYf5lSW7wd1tCb+e37s9rVu4Rh7T2+KFB44YfzrUzhwrk1Zz5uU1UPCX
         TXJG19F8xBUJnzN0SL+WtFiC06MT4Oqu7XulWgFN0wttMSOz3SOjNz/6oVh2TbfOpt5U
         bO+zIFLU+d0S2sk80gtBU5xGo/FNXrCpZTEBhQVg8xG+tFyQRNR/PEUhgIhevDaemPpI
         Cj8EdxRnRO4mNEU49vCNF7V2e330rWgeug8d6m4sUjOl3VXrPdVh3jPY19Gx+B528dHI
         KGfw==
X-Forwarded-Encrypted: i=1; AL+hErHLzQwdv/5Qybfkj4cmcJwMSTuZ/oTd17Q6EyHAPhqAaDPLNyHyG80Xopc0FvjXsBgSiScrWZptbNAy@vger.kernel.org
X-Gm-Message-State: APuU4Z+faPA1KUu+ioBUubLkhvnuJqgA3MO78n/f/5hvxKP+rQFuZjvm
	s+SvhMZfI++UvgZvO+eWZxaQg68OMpmZQJ/mVbkoKgOPK0ugbL9CM5dV
X-Gm-Gg: AZFdTZdOAiKacwruMDwBcACnZ67HvbdMzQRiOuUBQlRahnTszPXOD08uU6VbM7ekQpO
	uEIX7QG5Qlt+X7pwlz/H9Q2DWXNyX9dJ3/6G/ZeV4cN1Zo6qdyOTYxOSGfCN/mAhM3Tc1HRaH4u
	XJK4gwOYNQONjj7kw6OKnpdUiRX0m1hZfbiAy+VXaoQMeALxNetUbZ9CHN6Wmurk38Xux8IwmRa
	uHjHvb2silz/c9lc6KtgnRLAYGrCkcfJEbzhIj+pNunO43qcvUPWpMbSplBA4OKLMgEpslIPiGS
	fxh/7cTGmlPKmCgd66xuzoEa/E12zRvRBPomicDVFoV5YJPClNv97y40P9Zi0DxuLSE4p9MxQrF
	z3+D2+x82HdjsL1Bb0g1A8s58FtEqd1X83xUPLED7Pz+xiGc+UYfFwnQNOJCk6HxJx+90jMbMgg
	l1ezJ4BNwMRGO6VjjpvSgaDBvT2POB65PbhZc/tfCHiLl6s/FVQAOVic+2DvmUhCwXq3bepz8ag
	ZaJGWRbmttpx2v7wprmlxDHyN6mEOBb4+0lsL83hTxqo3b+1lZgy0weRkMvToSrfaxPaMSZrh71
	HkBXza55I2/sn0vzp5WyEpCbQQJhwe4LTB/J715vZB86/wlzIGFaxoXOOMsfbxMyS9tA5VhdXiu
	q58GPBJcP6s8wkBIqL7g97V/TPHUpF0g=
X-Received: by 2002:a05:6402:320f:b0:6b4:59d0:7294 with SMTP id 4fb4d7f45d1cf-6ba37e9ec85mr6083730a12.31.1795335529477;
        Sun, 22 Nov 2026 00:18:49 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:47 -0800 (PST)
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
Subject: [PATCH v8 04/12] drm/panel: panel-lg-lh400wv3: Convert to use MIPI DBI bus
Date: Sun, 22 Nov 2026 10:18:12 +0200
Message-ID: <20261122081820.53199-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 27 +++++++++++------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
index 557bcb6f2ca70..63efeb434be13 100644
--- a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -14,6 +14,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -25,7 +26,7 @@ static const struct regulator_bulk_data lg_lh400wv3_supplies[] = {
 
 struct lg_lh400wv3 {
 	struct drm_panel panel;
-	struct mipi_dbi *dbi;
+	struct mipi_dbi_device *dbidev;
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
@@ -40,9 +41,10 @@ static inline struct lg_lh400wv3 *to_lg_lh400wv3(struct drm_panel *panel)
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
@@ -54,10 +56,6 @@ static int lg_lh400wv3_prepare(struct drm_panel *panel)
 	struct device *dev = panel->dev;
 	int ret;
 
-	priv->dbi = dev_get_drvdata(dev->parent);
-	if (!priv->dbi)
-		return -ENODEV;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
@@ -129,7 +127,7 @@ static int lg_lh400wv3_disable(struct drm_panel *panel)
 	usleep_range(10000, 11000);
 
 	return 0;
-};
+}
 
 static int lg_lh400wv3_unprepare(struct drm_panel *panel)
 {
@@ -182,9 +180,9 @@ static const struct drm_panel_funcs lg_lh400wv3_panel_funcs = {
 	.get_modes = lg_lh400wv3_get_modes,
 };
 
-static int lg_lh400wv3_probe(struct platform_device *pdev)
+static int lg_lh400wv3_probe(struct mipi_dbi_device *dbidev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &dbidev->dev;
 	struct lg_lh400wv3 *priv;
 	int ret;
 
@@ -203,6 +201,9 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	priv->dbidev = dbidev;
+	mipi_dbi_set_drvdata(dbidev, priv);
+
 	ret = drm_panel_of_backlight(&priv->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -211,9 +212,7 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add panel\n");
 
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
+	return devm_mipi_dbi_attach(dev, dbidev);
 }
 
 static const struct of_device_id lg_lh400wv3_of_match[] = {
@@ -222,14 +221,14 @@ static const struct of_device_id lg_lh400wv3_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lg_lh400wv3_of_match);
 
-static struct platform_driver lg_lh400wv3_driver = {
+static struct mipi_dbi_driver lg_lh400wv3_driver = {
 	.driver = {
 		.name = "panel-lg-lh400wv3",
 		.of_match_table = lg_lh400wv3_of_match,
 	},
 	.probe = lg_lh400wv3_probe,
 };
-module_platform_driver(lg_lh400wv3_driver);
+module_mipi_dbi_driver(lg_lh400wv3_driver);
 
 MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
 MODULE_DESCRIPTION("LG LH400WV3-SD04 MIPI DBI Type B panel driver");
-- 
2.53.0

