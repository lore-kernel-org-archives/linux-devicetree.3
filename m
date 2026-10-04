Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC236F421
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131496; cv=none; b=hgQFc0jNQDSEHHKvkj9QzoSAZ/6L3cR3lXN1aciflgm3ycV3pYLgyU+zPGVdp9J9lbvs3T+xaxsKfCHCVVCQgiJX48N1JQ2fEKiWXxQAKkpEysWlRxU6D/5WdJeP4xb1Rr7dRrzTRNCG90If5qm+p+QKaTnhugj/8YtTk05kseQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131496; c=relaxed/simple;
	bh=gr0swvEQ0IvAy7Ct+2h58VUn/TehcKJEfIt0P7+gIsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXv7Tjjq663UCteyRx11E5yAu5W61GBCfePvYoiqC+MX4sZo4x++s/jLScHv3QNHzPHRlc/ZFt4JvgVr9tpMlS6K8Rbwmv6WBBq54wvT+aKWcsy6fbhoctV7ZEYnzXqt6X8Avon8oUdv873aHnVtaz+EGD2lxODymvqBdSHmZmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOvfsGS8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOvfsGS8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso3314585e9.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131491; x=1791736291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLhusyP0ZK9/MPigGSZNdEACXF2TD7fqbQDb9u0lwRw=;
        b=iOvfsGS89kY5Oytu8EmrN9kzcwz4qsaZanLw5A0dXlSOgOrnp+oJtLrdftpJj8qMGu
         U1VbAF9cYpEJMN3GlBKYF13zyBLBxvraOEoNftgBZwu9jSiY6zXKz8f3bNEIqz2xtiPW
         l5ZBqaAogMJdTYWddBHpI8isuRMC1e3T6h57oDhaxn6CkuvZjqXrEq7hwrj61Jgl4/el
         xmEYnfgI58ck5vd4btZIYV8V222veXffjbOCZh5ouBPmDuZqCVjkY1MCctUAybqSpD7o
         xhiAZ38CeekRqOHfq7dWC0YP9SixgmWHtuhd8EpomYr1JMAVY12pmlLfKrCy7TBTKi29
         cOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131491; x=1791736291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sLhusyP0ZK9/MPigGSZNdEACXF2TD7fqbQDb9u0lwRw=;
        b=TnxbauA059A5RqSnzWK7N3WC5V0WEecWX1GiX+NUnMlldBjD2AjgBctYRY3FvTsFba
         Su9eKPoyvw8UXJ5kW+548RuMkwBHuILAKlw0DvaP25xTCwgMZTFQ4pIMDfPckGYa55Bz
         93LUKApNNgLXBIl6AXkm+GalGjx0xa2dQbubm0seiJHnBNw2Ni9lHU15BbzeGpz+9oq9
         sIyaDhKLL8xCATk71sVOnMjVGNJmT5IhHCS4kJfFIWVEKN0iJZlrTou+JUQz6dkSI5Ep
         i+DRp3SeEMBziN/KuedLr0u2gzdleP/eolvWOqPC1Lar8g3mlWhq9kn6CeebuEAcQytI
         FUIA==
X-Forwarded-Encrypted: i=1; AKwUvBxCc/dod7AdmX5ZjvNPKULd6oVoX8yZr7bfNOlxURXtdsEgbNTLIOMpYO4oOtWHuLoP94F3FoSU/o2N@vger.kernel.org
X-Gm-Message-State: AFuF++nauVtX/Cw4jpT8K4E+s3I67zHRfY7QgBwFoxAPpgby3962uoJp
	Aw0ftULDDBZQ70M73/14dVeL4tnaDxHZ7RUYjMm2RUCapcg2d+W+fo1M
X-Gm-Gg: AYBFou0oFV0InZK7PPiKu6i/UCGcHGDMnyPkKb6zjQfLotskBaEyBJevhKAPDYNEZoO
	zCxmnPKamM88wSfp9hkNCCMEcdaq2l/50XCN+CX+bs0nX55mEZswAZkpkcS7x4bJyj60V0vL59+
	4KVwdDdLOFTMGVXLpTZ22zOkLeJDMrfLrVoP9UfhoCw6mNsSpmpI+XT+Cs7MvuMn8ogBpbwVZZ3
	Oo9R8y04vZg/j6kpLwkRpYJT975ssTsgZ/hMw40gQHdjxAZhuKhfvJ2Y+FlKnHaqGIWH75+5Aco
	AhQ0zWokmbtiU07uixmD9ZbUk3RqGaeSFyzia7YHYXkjbpeFMb7umLHhHb3FSvnTX9eHDfgVNdG
	+D/8S9qX8rVJmfC478EwgR6p44JHib3+BrLrVXL/Sip9U/N+dF0iyfUfE8T9SMs8lmfwz/Or2kO
	PvTQtwQKW/Fbr57ia6LeSpibJphLgcu76mkOvvPHOO8ih6kSxvkjs5TEk8NQch04mlvBOU4H4Y6
	9jwnY2sK+e2wwQr720=
X-Received: by 2002:a05:600c:3b05:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-4a027561e0fmr137493995e9.13.1791131491320;
        Sun, 04 Oct 2026 09:31:31 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/7] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Sun,  4 Oct 2026 19:31:09 +0300
Message-ID: <20261004163114.181800-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004163114.181800-1-clamor95@gmail.com>
References: <20261004163114.181800-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parameterize configuration based on bus flags passed from the bridge or
panel. The list of supported flags includes now pixel clock polarity,
display enable (DE) polarity, and data alignment.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 41 ++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index bc1c93c7554c5..8167447cec900 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -103,14 +104,24 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
-	u32 value;
+	struct drm_bridge_state *bridge_state;
+	u32 bus_flags, value;
+
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_bridge_get_current_state(output->bridge);
+	if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -123,11 +134,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	else
 		value &= ~LVS_OUTPUT_POLARITY_LOW;
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+		value &= ~LSC0_OUTPUT_POLARITY_LOW;
+	else
+		value |= LSC0_OUTPUT_POLARITY_LOW;
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
-	/* XXX: parameterize? */
-	value = DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
-		DISP_ORDER_RED_BLUE;
+	/* configure DE signal polarities */
+	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
+		value |= LSPI_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LSPI_OUTPUT_POLARITY_LOW;
+
+	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	/* configure DATA order and alignment */
+	value = DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
+
+	if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
+		value |= DISP_ALIGNMENT_LSB;
+	else
+		value &= ~DISP_ALIGNMENT_LSB;
+
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
 
 	tegra_dc_commit(rgb->dc);
-- 
2.53.0

