Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887566;
	b=ZY9j1UFVamLAiI2jPkbskuhaV4q7+93C6rqBQNtp5Ak3N0imtzGeXLeVXqj+/027Ffem
	 tf8HfXycHCozIa4IvhmlBH33qrgmmmD7SnCAGsE67ld/yc6SljIxl69eMHdQnUM1Z/WOZ
	 UROX0J+hWZaEsQndcJBD4APb8Nzk7gRpxmHMvcEwkSEQXn0vTP0z6QJd7RaiBENqZiHNM
	 Jbsb8q4ZeLS1fhacZWMrFudetnOj2PR0iQD+j1Md3lvZLVi5Z+gwMwXGnW8fgL1MuDu/U
	 pfkyTLDZO4RwzKOEB7SWSKRAJS5Fw+fpebJhawkv5SkpGl/UMH3JeRyLAoerzXa/r9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/TZdy0v25LHQ/8qZj/SLbaFNwYCRnqtlTMoJLynwB7k=;
	b=H36hRTkeI4MX3KtkEh9X7UTtDO59b7x371P0QtcXnHTAbLF/b6TOFeARK/nywvP9DSmG
	 LsSu1thq5LGU3bRfellJ2AEaOVJBk7fwUiJOIkZvVk+OJ8/2dmos4W9opSYUNxGFS+qmz
	 vp4RH9I4lm7y9g40VukkJqKnWB6HyHfckcSjboAXxrf3Ye6nGRLvOHO0qRhMLT2Ge87o3
	 sgWRTwek0MFp8qoX3k4M883ZRW/HS7TQSK8yPRXOQXt4xg6gWqz7WqdfMQX3ZeDwWPBE3
	 wePvIRpnQTYJxIH8MwbmLQNELNwBs+PbGxGf6hMke9pFEy8iG/HINbGuRUYzqEA6VtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzGmAogF;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB470606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB470606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzGmAogF
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so17783915e9.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887564; x=1794492364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TZdy0v25LHQ/8qZj/SLbaFNwYCRnqtlTMoJLynwB7k=;
        b=PzGmAogFk5pSFK+wRR9BO/6p0BoRe9LotWLbM+RS9OR9kFRGX0Fus28SaCZHTGG88U
         EPKw2Cc9cpeAr99lWCcTu5Vmk4jyf/vjnH5dYm7Icj0AYxqLi7vt/dyF/EybyeBhDqeY
         kXME8cwLrQNVhJDa2beTo+cY2ZCQ0qzs+Ofze8rkUO5o4l2Zf6OoEnYFBqI7nw2EuQMk
         rX4NkywdVM0w1kS2Zrn+dEQ3Bnss2G5/Qd6B4OuGMU25VFuVH/4SdgcpBvAwFEvpQZkp
         2fOOz0jj3KYGOUQwCn/bmfrSkLeo5V9kyGZuJm9DUv65PJn27GU6OQmjxRB6JbTlBDLZ
         M4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887564; x=1794492364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TZdy0v25LHQ/8qZj/SLbaFNwYCRnqtlTMoJLynwB7k=;
        b=MBBvM6kta11eiVmadb6G/dLemkmWzfL4j8pQbkfR5hocFsIZSzgqo7cMOGsEqC8vAt
         ti3JLKUPHYXxrcpkFE3G5TS28dP5CDJ4uF8ehXvgoARdfZJ6XqTMi2cfma9Rw6wZXf1m
         DDKRcage7QLlXUd7Ldp59Hn7hDqJCN9NaXI00uGm3nQ01GS5fWL/DucCj1KJjLfmZvPR
         GTlfNhdsq7qvXl4I1LeOh/AFwdUTEZZTeeYToDC56WhrW+2GbFrjLFgHjl6EmIC0Anc+
         cjjZNYe8RCs6wGnsfx70ZfxFkRKhv2rOWL1igt6J+AV7P+6OCTMoWYY0FU0CvAZvG+zN
         zTcg==
X-Forwarded-Encrypted: i=1; AKwUvBx9vrWVBigJ2Z0ouMDKsL0yWx9AScIemVFj6zJInC3vEQfCn4y/ViTkVhhKN3H9/kPT0ZTWy9mLu+Qq@vger.kernel.org
X-Gm-Message-State: APuU4Z/l3kGhGBRUpKdz8XZrHQoJ/WGIwTrSwReb0VxhMQMgd6oWxsUg
	nDqOkAFU/PzPqh+1uT8pp0snFuSGMBixLiBFeW4719itToHJn6STaXEr
X-Gm-Gg: AYBFou2J1AMcL1wrS3nEjLf9f3ukJq9EtpXXzSdnPXZdnuDnypcu3wb2RKaQOFkKJUB
	MW2fS4+7KiLFv+/NauOpAkJcMQpU8AahMAa7Dkq+wErytWpQaRit4JhzKCyORQBzbc4CD+2LEBH
	wblfocujyVSOOBXUqcwEpCq+7WeZ6qpCrfgnqcZBwhP5lhd/geR8iaj61gqy6I43N7ozWlDOJvg
	F0t4tzFVktKziKZjPc+7+AbVapXofzuIpFtEUP7jiHuLWTYGAZ5ZdrY612Wqb+vXyOJiLhEdrt7
	lRwMpHDYOi1DjBi7xXwQ7YwuwfLx+tv9ggeRG8ze1DxWU4H5dKV4bdS6SAJSCfSnXAzhV+gAFKF
	eSk7YQVpUzrvyp6J6pHFOYpabNXg5rD6Tj2Z2/ecXRHMu+RB9OgprE+CANMuVE5Lo80j17hDqw0
	T4mQYJD7I5pv2Ls+HjARj2mINGNkNRCIYwuM8gkpC0xjRvgIj8zEQO+TMRZn2c2N9lsVfL02XlY
	NYSqj89AL7RWf7xzphSJ2cL+aehl5xp847Hgs/xR88itbKgQIS9f15h8sJjtaoTUfp0gDfqKon9
	eNkPU/kZvkx7/2+YAHVzVY7XxL76PI28DP2NwSmNTgG88wg9Rg==
X-Received: by 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr424532335e9.17.1793887564261;
        Thu, 05 Nov 2026 06:06:04 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:03 -0800 (PST)
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
Subject: [PATCH v6 06/10] drm/tegra: Make panel parsing by tegra_output_probe() optional
Date: Thu,  5 Nov 2026 16:05:06 +0200
Message-ID: <20261105140510.165165-7-clamor95@gmail.com>
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

The tegra_output_probe() performs panel parsing unconditionally, even for
devices that do not require it (such as HDMI) or that handle panel parsing
on their own (like DSI). Make panel parsing configurable.

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
index 7b595310e7379..a4c0c63bbe567 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1618,7 +1618,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	err = tegra_output_probe(&dsi->output);
+	err = tegra_output_probe(&dsi->output, false);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0d2c0ab0a63e9..fc6eb7410045c 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1855,7 +1855,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
-	err = tegra_output_probe(&hdmi->output);
+	err = tegra_output_probe(&hdmi->output, true);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index d0ba3bd0aab8f..ff2e28a1e00b7 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -94,7 +94,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int tegra_output_probe(struct tegra_output *output)
+int tegra_output_probe(struct tegra_output *output, bool get_panel)
 {
 	struct device_node *ddc, *panel;
 	const void *edid;
@@ -104,31 +104,33 @@ int tegra_output_probe(struct tegra_output *output)
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
index addcecf8592b1..01475995d9cc8 100644
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
index e384cbd0cbf72..ab81e412e05f1 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3806,7 +3806,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto put_aux;
 
-	err = tegra_output_probe(&sor->output);
+	err = tegra_output_probe(&sor->output, true);
 	if (err < 0) {
 		dev_err_probe(&pdev->dev, err, "failed to probe output\n");
 		goto put_aux;
-- 
2.53.0

