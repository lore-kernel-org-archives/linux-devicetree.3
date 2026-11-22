Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335545;
	b=z77nwEpLzlbkSXa2IwE/VJJG6aQpVtxhDNQ+k8kA+metrHaoIcPMVCR6JnER1j5F4U8e
	 Gc7BjX4kVjwntULLtB/RFfWBvNLVwpOYOdZIl53YMZedTzxJ9TUGZEaHB6sekbAB6DLt9
	 ogdfi9AMLw5K/T3AfJkrWHjMZSaGcahN4MEZKrnQnSoDMocAS1MyqhlJrReYdksa9aR+6
	 2cHqj9XxEnZr0lJTCW0dmAl6Y2G48xyznGTlW7vcrAeXYSR1N+1ypEXqUD8+ugVABRen8
	 aMoPdKEj/4CCfVbgmZZaVU7l+tcS0yamA2doyWg4+/ceizub3Dha5ZXcAcpGduvaslg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=raX6dCAIomOIJ7ELRGbL6/J7HJwcKSM4UvEKLE/Febc=;
	b=OW8EtJBOyGBzvYgY+Kx6OHU4S4ZM9JwzzY8kYFCG6tNV22fKZGVDLYNLH/wE7GfIpeoz
	 0yavIbXzOcTEa2gRYgcsCq6VyECKxpR/5QgR7bbDbECO/TetlbPQHyNQ+I4L5zP7VqpDs
	 Bsks1kOAMHn07ohqFskpvi/XJnLsq1wt978XkDVxCmHfVi6PttSZaEqmuAOb0MDYBfBEY
	 LOE4g1ryO0CfeK43GI6ARjUhkarTUSIVCZgyy/VXAMUb4bjRkR/53BKI4MlpPQFPCet1R
	 xQSilw5CsGjUCQWo4smqoAXqXAa+eDNCWFf5EEENQX8DySBcJIlOo/Kj0d9hs0xb7EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LvBo5S7y;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCAC606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CCAC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LvBo5S7y
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3648180a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335544; x=1795940344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=raX6dCAIomOIJ7ELRGbL6/J7HJwcKSM4UvEKLE/Febc=;
        b=LvBo5S7yvr0z7KdgzrGRmCXs33lPM1QkxpmPhP2ZLyKNJU7Q/ynRbp/RIAU6gfelwc
         rS1F4qlfTc1bxfwZM+rEYhu8EOwmNa8T81NAeZC9eUs7B6J5VgmDto0pLM2kocFwcTs9
         Cc5TAnXMWdPMRuCiI2bBJxsZbBRUu+ilA4vm74i94CUjvCPwKOxHkg+Z2JJ30ymzrBVH
         IAUehypO41YGi31S2P5jnJ/4XJD9MILbY53k6UEuiuQbmCoeJbS+E8wv5CmWlCuMI1uA
         9A96EFliEBU8KBWtjwcMkilAQYJffUTUvJ9/pSRCKLxpt5ReRi0N7fdA77b1epcNm1NV
         JqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335544; x=1795940344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=raX6dCAIomOIJ7ELRGbL6/J7HJwcKSM4UvEKLE/Febc=;
        b=DAZPh1uG7yRbJNF5ECyLfM/wXYbwUCYsh+ZkLdE2V11jdOlUB1SxRHapnfzkLoW4E+
         CLzgLNdh8bdL84AbLlii6GQTKTpm7p4JWLTxHu7lM+2WXGLgxlnGivAt3dsNYtSAyBsZ
         TsyWxn5P0On5xBuWULJtpqmq+vRJLOD3yO1TOJJ/RD1eESvuxy6vI2gIHYYJzkyoIgYL
         FZ93pZbQfcSIZR4CugbbSoAio4ENMNzGYuTCsrG2y6TexFI/Fw3KxAfRjOAD8bMGb88q
         5GAU3usMfr4fpk38XGWmqgxA5EYL440ih+11nzG2NGvQIbJQRnnhHL7SNbyK1thGm/67
         5EIg==
X-Forwarded-Encrypted: i=1; AL+hErHuGCdFWmZjziu2Efjj5c3A6nm66un6dbrNVQmczD/+eyUyKdiOCT7GI2h7STj3LmlVZPIPbYZiOsRO@vger.kernel.org
X-Gm-Message-State: APuU4Z/GCa2IE9DASrKCtObG+UIzzVqMkFS7Ff8Hd4I2Ji2dxptuAjct
	QT+WnD63REBYeHss9m1rdivE43mBshWRgtKkiJXGZm/1fe1GFl4bJIry
X-Gm-Gg: AZFdTZfu0CS1q3eLcVOprHFOEJ9QEJaEssMjYd9fm0WxKN90Dj0XWisLIK5LOutdzvp
	eg3Aa2LbAa6LHLowmghxsXEbM7kwFVPlnBT/FN2ZsDiuVtmXdzOjc24QqkSzZ714xlzOzP2+dSv
	aN06hLQhY+uayoRyfZ7jD4AKNL2mDDrsTt/9E+PhUoS6d+ATuct4JqnXTD+oG7j9ZfVa8ydG4A2
	rm0Vh0YV1vhSULjmxCXIsPyYtvpqMMLgPT7hfE5Cqkf4gy9QL+qwGwOFF452NnM5q67MNVuulBd
	kkCQYmP8+eZsEhIlW5fJ/w5aIK5egOBXt05RCZv/8IBcsQLIyhrsOQyy3fvj1Ozo36af75cjUzL
	fv22zFu7BnHOidNY6v9cfiavKKF+CYB63mP9eDarbr1Fme84DNixXHDOvIVcn9V65kX6+uEJHV5
	n3NHdIXedwTBG2pwNN3xx/DCVK7xdzHm0lThiwl7U9k/wGtPINmSyKRqXqmFrds1EqQDLWIyFeN
	USzNdB54cs1RXZTSuFevrxOCtnnzlV5XcavjMs5uO4/a5/qU0aWn3ZgPpMdZLj/fU/cR1bz89Ml
	/r4jZI0vR/TWyVmvyCCHkipxaBbWSu5rAtdMPwzkiH7O9VegQihdZqMDFylwDsTF7AZDIbmwZxw
	1oIozzOA4AA==
X-Received: by 2002:a05:6402:1512:b0:6ba:12e2:46f2 with SMTP id 4fb4d7f45d1cf-6ba37d18d2emr4447226a12.8.1795335543575;
        Sun, 22 Nov 2026 00:19:03 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:19:01 -0800 (PST)
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
Subject: [PATCH v8 08/12] drm/tegra: output: Make panel parsing configurable
Date: Sun, 22 Nov 2026 10:18:16 +0200
Message-ID: <20261122081820.53199-9-clamor95@gmail.com>
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

The tegra_output_probe() function performs panel parsing unconditionally,
even for devices that do not require it or that handle panel parsing on
their own (like DSI).

This causes devices with dual DSI panels to fail, because they rely on the
OF graph to find the secondary DSI controller, whereas
tegra_output_probe() treats this port as a direct connection to the panel.
An example of such a device is the Xiaomi Mi Pad. Make panel parsing
configurable.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 +-
 drivers/gpu/drm/tegra/dsi.c    |  2 +-
 drivers/gpu/drm/tegra/hdmi.c   |  2 +-
 drivers/gpu/drm/tegra/output.c | 52 ++++++++++++++++++----------------
 drivers/gpu/drm/tegra/rgb.c    |  2 +-
 drivers/gpu/drm/tegra/sor.c    |  2 +-
 6 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index bc720ae8d95e1..e53fe68161cb8 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -156,7 +156,7 @@ static inline struct tegra_output *connector_to_output(struct drm_connector *c)
 }
 
 /* from output.c */
-int tegra_output_probe(struct tegra_output *output);
+int tegra_output_probe(struct tegra_output *output, bool get_panel);
 void tegra_output_remove(struct tegra_output *output);
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output);
 void tegra_output_exit(struct tegra_output *output);
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index b5806a53e75ac..6d6adc485e51e 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1617,7 +1617,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	err = tegra_output_probe(&dsi->output);
+	err = tegra_output_probe(&dsi->output, false);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 3a94968bd983a..e8c4347f09e69 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1855,7 +1855,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
-	err = tegra_output_probe(&hdmi->output);
+	err = tegra_output_probe(&hdmi->output, true);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index eebf0ec0eea0a..d7d7f6ce0a8c3 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -93,7 +93,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int tegra_output_probe(struct tegra_output *output)
+int tegra_output_probe(struct tegra_output *output, bool get_panel)
 {
 	struct device_node *ddc, *panel;
 	const void *edid;
@@ -103,31 +103,33 @@ int tegra_output_probe(struct tegra_output *output)
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
-	err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
-					  &output->panel, &output->bridge);
-	if (err && err != -ENODEV)
-		return err;
-
-	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
-	if (panel) {
-		/*
-		 * Don't mix nvidia,panel phandle with the graph in a
-		 * device-tree.
-		 */
-		WARN_ON(output->panel || output->bridge);
-
-		if (output->panel) {
-			drm_panel_put(output->panel);
-			output->panel = NULL;
-		}
-
-		output->panel = of_drm_find_panel(panel);
-		of_node_put(panel);
-
-		if (IS_ERR(output->panel)) {
-			err = PTR_ERR(output->panel);
-			output->panel = NULL;
+	if (get_panel) {
+		err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
+						  &output->panel, &output->bridge);
+		if (err && err != -ENODEV)
 			return err;
+
+		panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
+		if (panel) {
+			/*
+			 * Don't mix nvidia,panel phandle with the graph in a
+			 * device-tree.
+			 */
+			WARN_ON(output->panel || output->bridge);
+
+			if (output->panel) {
+				drm_panel_put(output->panel);
+				output->panel = NULL;
+			}
+
+			output->panel = of_drm_find_panel(panel);
+			of_node_put(panel);
+
+			if (IS_ERR(output->panel)) {
+				err = PTR_ERR(output->panel);
+				output->panel = NULL;
+				return err;
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 40a02cf5939aa..227a178f761bd 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -236,7 +236,7 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	rgb->output.of_node = np;
 	rgb->dc = dc;
 
-	err = tegra_output_probe(&rgb->output);
+	err = tegra_output_probe(&rgb->output, true);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 061c5dbb738be..ebac9068b670f 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3803,7 +3803,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto put_aux;
 
-	err = tegra_output_probe(&sor->output);
+	err = tegra_output_probe(&sor->output, true);
 	if (err < 0) {
 		dev_err_probe(&pdev->dev, err, "failed to probe output\n");
 		goto put_aux;
-- 
2.53.0

