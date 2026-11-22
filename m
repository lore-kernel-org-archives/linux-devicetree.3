Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335523;
	b=s3wpO5d4RTzjNDwpSoLEcMmLa0jaUVL7LxUiJ85HZdrfPgCePBBINGjPfgIrvTcoQPo1
	 odTsPg918NqpM6w5GIOWkp9g6O15Rg6ndwrqlMSeFuNfxdt4YZthh4PeIMtTBw8qbBdG6
	 3iUnrz+VJ4F3mpunDJxebzvinDAk+Zvlsz3rluhuuy+mzpbcLLB5E11IwkWdYm3hlZIEG
	 djLy8TXUYUpaoqsJhbqvx0YVq6gUHGmgAE3KSVzAbuxCp7LLaYc/6HfK8x3Mfwbyw7YZA
	 rEQ98PHEBJHGpEwRX6zZW+uBVVDzntPfXrF8BN9iL8KvcB5qzYqG1zl0YEISLgXGrDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
	b=xhTXDfgvhQG3x7ECGSF/xSM0EMPXBzgCtolrM0DgUJARhkS4aLux5VQ6xHT1jiGgzZTH
	 TX5iXJeMch3qftQZa4z9oqTAfjqdoeJJL+hotfakeEVF+ozoRYV1b+eQ+qcs1o5wyn2/J
	 57oq0Cm28GHPnQ57OHr5drk7tHU/GK2NdGOvv86LwPQXGCTpvLzmrD1GCZfd12w07EJdM
	 XXaGcOrK+4EH7ry7eMNCvnOHLOOc02DCBrb38d7slIOW4rn+pUkmNU6u/whXsJMLiJAiN
	 neqvKWfvTcn+EiWxBUcXQNU6wBUmPTU0dw50ytU3PewS6fifstZrdRVkskEgPLfZehw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxgHJVt7;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D9606A334
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 703D9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxgHJVt7
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so3294571a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335522; x=1795940322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
        b=kxgHJVt7FC7OGHNAwXHpSuQyyJcAEB0fLEUL/KRqeJ5wNrfNQnUCxQkW/P1m5dBYTx
         rMoWnNqF5532YzfFEm7O8Wb6/IEHXkBlaaHTZ6szRBtBpgvt18sOBPyuDQYtmH9M1gWo
         KJBbvpOnFEsmo5ozXwP8ZB0AlE+KkeZawbh8MHACZthtk+ds9qa9cR44r/cCLSwxDiaG
         iFtzqdkYZj7xlFsGjH3hpxLZZ3pdGY4IWxGFfdZ/b1BFjFU7nd7PNC5rKa3c99oQWT4G
         ZrTy4+4cyVsvXJURC1XdaY73hY4PGV1jYZAzscOX+Wbyf1XSuYYoY59KEzU4R2ae9LGK
         s8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335522; x=1795940322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
        b=PUKt3XWVNfn85245aGXYgGIv0PtBl7F13cuOYQ8pOFBPBob64SJQ4rI07zAFLsaKH3
         ILfyf+cd9iw5TevCgyzth0PY+gOIhN8M7Ts+zyFfZbJnx9jvV3aXM8Qhg9KFMGzrtfcQ
         uU406U7hERLqZU+7zerMZMwzF4c7hv7xwAnNXwiv1Gc9Tu+L23tyN7PF9s5aFeKIrWY1
         T+vE7SRo7XEhkk0slQClJZTRUW4ERWal+fmzHsC5IakuV4s1srqHtQ59ewP9hOe39D+u
         L+fo5l2yTu1FB3eIJ/VSYYoMIES9WE+olmIzAAgokvZ+kALN1PJHvfRNoGASwko6tmhg
         GewQ==
X-Forwarded-Encrypted: i=1; AL+hErGHAyqqJdUP2USRP53F03Pghv1bm/xLKG5NkTSBtVk9eljGTq7uMWLKsraBR02VE9QMTMZ19uVwaMkp@vger.kernel.org
X-Gm-Message-State: APuU4Z+mp5vges0iiRLgGLd0o0JfD32YRAAwYTTHCYszZdAaYOldG4l+
	xyKttpr44Hc8bdYQBqlWgkLKvCid/drsFHrRAHfYulflA/jMFkwbIfRn
X-Gm-Gg: AZFdTZcx+t269jfhOmsg+CpvZqkE+SQx5H+wd8/vXM7HfTteLAUD+AlTNe0yqeA2xzw
	HIyhypNXqoPqESeIFOJTPNBQRpEZWNQV+L440QlY8EkbOHQZKefc3FWe8G49uzKvuAMcmdCFm3K
	wzfiLQ1TTzBLfGhpCdj6M4H5fOJtIrdReiIZgtJxtgdTkTohWEyleXefukS6xvv1da/Es9tNgjF
	y0zf4h20zWFqmHqXviTuyyCzZB3g+MxiWhAOKeboqVDFwyEFgCNUUYjps1lh+6FKvCzz9GKR57+
	gYqE5cDN3Qm1E5BhxBH9LcEm+3KSBoDAj5tHr/lSSKt9RVAy7uAGdOh6mxMe0OyJvEvUgag15J5
	IwKzyS86X4EjxtuK9qczE/SwxzxjdfC5ZdSYtE+E171XP8cRmq6zprjkiZ7ReMrPpLW//7xlCwZ
	Hy2+l9rb5Tiirl6J6dbbMgRHUmexU8q9b8ziemvyNRLtA3GKqYsA0iuFDI0wGY2idfrs+PO+dz+
	tIO7xvlrE+ZXJmmmJcI5IvSrlbAyFzGYpH95Vt4d1rBJcK7D9waTwOldixmuE6WjYQuCUMXkvAF
	dMD37AycQSbDEN9jVwFdORiR0poRdp1+Vn+9UcXMyg9YuMrVgOO4pKyKNie1rVUhu7+BR4Wuwd2
	HpiqPqlHFSQ==
X-Received: by 2002:aa7:c4d9:0:b0:6b5:9731:90fa with SMTP id 4fb4d7f45d1cf-6ba37cc0ad9mr3980018a12.6.1795335521825;
        Sun, 22 Nov 2026 00:18:41 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:40 -0800 (PST)
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
Subject: [PATCH v8 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert to use MIPI DBI bus
Date: Sun, 22 Nov 2026 10:18:10 +0200
Message-ID: <20261122081820.53199-3-clamor95@gmail.com>
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

