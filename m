Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887555;
	b=0W8bMDWipGCeMN/q2to92LSO5kQxkRi7pycDHjW7Jmr7EH2vL/tqJcWvBsVoNWY2CgsX
	 pKg/3SsJ4ikKKNjRB0ee2uYAeIqva6W+7pqcjvKQ5LMGaAehzEHFLNZ7XXojfv8v6uKz7
	 zLkBtKI3weRwzu9z3qlZhA5/Cv33UxTkT1DHcassU7Qh6vCMeWHHyQo7jCrZRtvqK1mno
	 3NxYgfXuQjweA50yfwypTbrCyHi7FIMZuVuVdKBUq4zdi4SScNIl2msE9WxnKgdISLHgU
	 JOwoYnNF6TjfISnChdWLtgYHEprNpUaDEpBHiPrSUKOCTihfdOfIDeEPKA5/8LrHSzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xGkKWgS0NbCDY+LYXrxAJx4PERN2uXgRauM87oEmlok=;
	b=GduXo9LUZNkI9JVreHJDlUEOLHkB4cjPJkLLHcwkLnzga5mGYC27W2X7Fliy9IlXTNir
	 yxGmiDrQb0uiWDc6hvuk0LH//osp4Q/mbWrem/zgxgHCF5Sl4YKQdDMbak1Kf9rL+c1SR
	 v6e0VERjt1Sb9D3HL/+8tgZJl72dSfO5RMnrOTOidixBf/uMT02qEgakKxHg7GA/vHGg1
	 4nYJ6T/PZy+nRsWzXShyrEvok0FCIOX11wgxvZt8Nl4Goe0lCgnbALuWDjOH4oLdB7bdp
	 UjC/qRuIPPj5wi8wMr/jZIOgOmf/gWwOlyynA1TdPz8w2j0ydDck2pK2lLFG+LTkVUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8jdf3Iz;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C1606A337
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574C1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8jdf3Iz
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491846221ffso515957f8f.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887553; x=1794492353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGkKWgS0NbCDY+LYXrxAJx4PERN2uXgRauM87oEmlok=;
        b=l8jdf3IzWs6p1xzwDIU2DBdC4VMJeUW9IWoSpkJblibkV7eylcPWlSO+5f3W6K56VB
         Wu983S8LkCRcSJFTK1U3OPuQpo2WP3w6XWi5ZN9i9ztFvXjn/c3ilOWtbn1NiKrliCfk
         0uHfWf+aUrWTwj+1n8ifxzysJPuN/XlADq3X62QC907YVt15/U5huXznqP8WA1TbYQE6
         wntcsl/LXvFVJnCMl+xDu3JogsMA1hQX7BdQzRluDZG6WBsnTqzsebCreo8IY+/IwfdE
         lhBt+uMJKObxuEwacB7BkpR16uiZ8l30PfsvpNZqR59b141YCysv6peTpqmPKg+Inz4B
         Jszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887553; x=1794492353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGkKWgS0NbCDY+LYXrxAJx4PERN2uXgRauM87oEmlok=;
        b=nlQa8EQVGRvaC3mLQYqvmHntIN+B88SsWa21OTCWIGFzU2TQSXbtKStEf0uGjkhAKW
         2/0sKN9Xe+S8rOF5anSY40ccncBKLdE0QBDt19MIyiQDIEfoCitX/L3cjistL1t3I8eW
         GadREXWRDlL7za1/Of9y7A8d8JIc9u3LFTwclhtrD5Aem3086MVbvDTS8NVP8W2lLVlE
         7PLoFXF/k8FJe7930UD7qvRg7F945yP5q00Xw8gsToEHHHoEiXF9G/uVRRmqOkcpr+p7
         rZxgOJ5fyDy0a8Ifw4srsd43D6Yu/l2OCb31fWosJcwPQj29LoKypYYfCvl6T0v6nHo5
         xe6w==
X-Forwarded-Encrypted: i=1; AKwUvBxqcrQzLV0CsKOBf2aoCg46n/+1dmX3KDXwYG0uYNaLy1YqQQWCdJx0+DNS6eSTd4dAEF/0h7ZZIQMp@vger.kernel.org
X-Gm-Message-State: APuU4Z/l+DWvFXXLnfEjptp9XTVS8wG3GlBloI+F2GhaCQniuDgu6dj1
	6GtmGJqez+yR8FaSx5rr2eJO/qJLEERN8zzLRz+0/dXG4KtGdAdNSgSE
X-Gm-Gg: AYBFou1lvKyXMYpK7ZNuNrm/yqut6npTf3lPCiFKhNG0xsp5spnR5gl+nkAnHCrVLjv
	8Li9EowXYgJUu8I1kY6jCHikseFnYivBNGSR2MVqQexa3RVk7x3fqkrLsUoTgynHmsMv1Y9iDIO
	U7r+L8Jz0eUMQmFmt8o139p1iEMRc6Qqwr7ZgVhFY4u1EBCgEvtywQTPGoyglBIQPemXIjF3Hme
	PyBw0uy8OSWY6eST44Ovbm0ioe0TaMIbKTv6Q2hxfnXM9GIG8biL0yhZBB91+wpnw1YQPJaumAs
	cyjnpUOWp2dRADbo7nzguB+PL88F3dBv79XbqhUDUmfPE+mToX6SBWA8XfCtd2xUTz4Z4Fvm5Py
	ZN3fXawXk3VmfH/Zh75tCAimBep6f2u1C7QV1I/+sdMGN2zWDTKDiRxRLDNAFOMYz+JEr5VVESv
	4SBiqqLb1hGGohg3HRVqMUvJmyOWqt+FYki4O6ijPEswDm23Df90IC7T+wMr3fg2wWAa3a9E9su
	2jsXxhSHa0mSZPnOUYeJQ3mPpgTakyrRiv5gkiJ1xO0Oux+rZbMc9Szz79P2MttHc4hvBy0LdCR
	e+8vI1A/b+qtWol3uWLGvF9LNHvNThgCd3laLbdaTfiQvjpsiA==
X-Received: by 2002:a05:6000:250a:b0:48e:c84:5be6 with SMTP id ffacd0b85a97d-48e6e303c68mr44365081f8f.14.1793887552507;
        Thu, 05 Nov 2026 06:05:52 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:05:51 -0800 (PST)
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
Subject: [PATCH v6 03/10] drm/panel: Convert LG LH400WV3-SD04 to use MIPI DBI bus
Date: Thu,  5 Nov 2026 16:05:03 +0200
Message-ID: <20261105140510.165165-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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

Switch from a generic platform driver to a dedicated MIPI DBI driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 103 ++++++++++------------
 1 file changed, 46 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
index 557bcb6f2ca70..ed099f671471e 100644
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
+	struct mipi_dbi_device *dbi;
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
@@ -36,13 +37,12 @@ static inline struct lg_lh400wv3 *to_lg_lh400wv3(struct drm_panel *panel)
 	return container_of(panel, struct lg_lh400wv3, panel);
 }
 
-#define panel_dbi_command(priv, cmd, seq...) \
+#define panel_dbi_command(dbidev, cmd, seq...) \
 ({ \
 	const u8 d[] = { seq }; \
-	struct drm_panel *panel = &(priv)->panel; \
-	struct device *dev = panel->dev; \
+	struct device *dev = &(dbidev)->dev; \
 	int ret; \
-	ret = mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
+	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
 	if (ret) \
 		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
 	ret; \
@@ -54,10 +54,6 @@ static int lg_lh400wv3_prepare(struct drm_panel *panel)
 	struct device *dev = panel->dev;
 	int ret;
 
-	priv->dbi = dev_get_drvdata(dev->parent);
-	if (!priv->dbi)
-		return -ENODEV;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
@@ -79,62 +75,55 @@ static int lg_lh400wv3_enable(struct drm_panel *panel)
 {
 	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
 
-	panel_dbi_command(priv, MIPI_DCS_EXIT_INVERT_MODE);
-	panel_dbi_command(priv, MIPI_DCS_SET_TEAR_ON);
+	panel_dbi_command(priv->dbi, MIPI_DCS_EXIT_INVERT_MODE);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_TEAR_ON);
 
-	panel_dbi_command(priv, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT |
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT |
 			  MIPI_DCS_PIXEL_FMT_24BIT << 4);
 
-	panel_dbi_command(priv, 0xb2, 0x00, 0xc8);
-	panel_dbi_command(priv, 0xb3, 0x00);
-	panel_dbi_command(priv, 0xb4, 0x04);
-	panel_dbi_command(priv, 0xb5, 0x42, 0x10, 0x10, 0x00, 0x20);
-	panel_dbi_command(priv, 0xb6, 0x0b, 0x0f, 0x3c, 0x13, 0x13, 0xe8);
-	panel_dbi_command(priv, 0xb7, 0x4c, 0x06, 0x0c, 0x00, 0x00);
-
-	panel_dbi_command(priv, 0xc0, 0x01, 0x11);
-	panel_dbi_command(priv, 0xc3, 0x07, 0x03, 0x04, 0x04, 0x04);
-	panel_dbi_command(priv, 0xc4, 0x12, 0x24, 0x18, 0x18, 0x02, 0x49);
-	panel_dbi_command(priv, 0xc5, 0x65);
-	panel_dbi_command(priv, 0xc6, 0x41, 0x63);
-
-	panel_dbi_command(priv, 0xd0, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd1, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd2, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd3, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd4, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd5, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
-
-	panel_dbi_command(priv, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 0x00, 0x01, 0xdf);
-	panel_dbi_command(priv, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 0x00, 0x03, 0x1f);
-
-	panel_dbi_command(priv, MIPI_DCS_EXIT_SLEEP_MODE);
+	panel_dbi_command(priv->dbi, 0xb2, 0x00, 0xc8);
+	panel_dbi_command(priv->dbi, 0xb3, 0x00);
+	panel_dbi_command(priv->dbi, 0xb4, 0x04);
+	panel_dbi_command(priv->dbi, 0xb5, 0x42, 0x10, 0x10, 0x00, 0x20);
+	panel_dbi_command(priv->dbi, 0xb6, 0x0b, 0x0f, 0x3c, 0x13, 0x13, 0xe8);
+	panel_dbi_command(priv->dbi, 0xb7, 0x4c, 0x06, 0x0c, 0x00, 0x00);
+
+	panel_dbi_command(priv->dbi, 0xc0, 0x01, 0x11);
+	panel_dbi_command(priv->dbi, 0xc3, 0x07, 0x03, 0x04, 0x04, 0x04);
+	panel_dbi_command(priv->dbi, 0xc4, 0x12, 0x24, 0x18, 0x18, 0x02, 0x49);
+	panel_dbi_command(priv->dbi, 0xc5, 0x65);
+	panel_dbi_command(priv->dbi, 0xc6, 0x41, 0x63);
+
+	panel_dbi_command(priv->dbi, 0xd0, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd1, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd2, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd3, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd4, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd5, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 0x00, 0x01, 0xdf);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 0x00, 0x03, 0x1f);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_EXIT_SLEEP_MODE);
 	msleep(120);
 
-	panel_dbi_command(priv, MIPI_DCS_WRITE_MEMORY_START);
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_ON);
+	panel_dbi_command(priv->dbi, MIPI_DCS_WRITE_MEMORY_START);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
 }
 
-static int lg_lh400wv3_disable(struct drm_panel *panel)
+static int lg_lh400wv3_unprepare(struct drm_panel *panel)
 {
 	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
 
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_OFF);
-	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_OFF);
+	panel_dbi_command(priv->dbi, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(150);
 
-	panel_dbi_command(priv, 0xc1, 0x01);
+	panel_dbi_command(priv->dbi, 0xc1, 0x01);
 	usleep_range(10000, 11000);
 
-	return 0;
-};
-
-static int lg_lh400wv3_unprepare(struct drm_panel *panel)
-{
-	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
 
@@ -177,14 +166,13 @@ static int lg_lh400wv3_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs lg_lh400wv3_panel_funcs = {
 	.prepare = lg_lh400wv3_prepare,
 	.enable = lg_lh400wv3_enable,
-	.disable = lg_lh400wv3_disable,
 	.unprepare = lg_lh400wv3_unprepare,
 	.get_modes = lg_lh400wv3_get_modes,
 };
 
-static int lg_lh400wv3_probe(struct platform_device *pdev)
+static int lg_lh400wv3_probe(struct mipi_dbi_device *dbi)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &dbi->dev;
 	struct lg_lh400wv3 *priv;
 	int ret;
 
@@ -203,6 +191,9 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	priv->dbi = dbi;
+	mipi_dbi_set_drvdata(dbi, priv);
+
 	ret = drm_panel_of_backlight(&priv->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -211,9 +202,7 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add panel\n");
 
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
+	return devm_mipi_dbi_attach(dev, dbi);
 }
 
 static const struct of_device_id lg_lh400wv3_of_match[] = {
@@ -222,14 +211,14 @@ static const struct of_device_id lg_lh400wv3_of_match[] = {
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

