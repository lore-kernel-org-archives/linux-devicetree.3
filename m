Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44E4B7A3C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403851; cv=none; b=Xnxbir+SFzee7PL3EdxiUN2TYdzY+a70fHPmdj76FOqNu9Ei5+wO7GzTD++ALxlGnX/qNw98Klu1wojdbmtSOQnzdJIJ9LXkmTrLYWD1wCvfNzhh/2TW/3l0yj9skH3VYUtSIG+StFfuM28RiZ4MbJ487e0ZAdZ0Nv8AFFqosoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403851; c=relaxed/simple;
	bh=gqHFQkDqt01PNe3dmhsrva6agIu6Wotd2DKXwpYNp60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hs1a8yAzzqp6nP46AjLD8iN8nDL8hL3Ibr9L7OKEbuEtOkg3m1yDqqAGEvn2hLywGozaZNe06Os81CcOlaCvV5hKljF4nZBgPS3Yl+ghBCmT/zIkgOPcOdW1ehlvLTenz41gzcCh9XV9Kd8cAM0qtowwSoBsV9HWZze5UIPGLig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPYIuYDz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPYIuYDz"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1573725f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403847; x=1793008647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=TPYIuYDzCdBqBPa4E5p68F1gRXoaF8O77/6zZGBw4PLV+l6mS4oP4/nU+5Rruz0CFn
         8ZaU6GybbnAAX18KKxLk7GR84VVdK/w71SU9ZBtyuMF8nMq8LMhqSdcRTLPm+LmkB9Ma
         vgkFxOIU7XqwgXMIlsLqjDbLhZX5q/VUR0xvCrc8ED3NkgxnSj6HMCpBYYcYZlL5QONh
         jRu/S4K74Xu27Nk7xviZMKxq+xvrMxCfUtZ+mae1ms0tYyLGxHJ6N3slHboxAEPKzxG7
         tul7jJkPvrNfsbP128wQWuGg4Mmarah5uC24uGKzol2j2TC+0mlZ3dI1m/ttFI/GFuH0
         L89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403847; x=1793008647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=gGlhOgP1xH2eh9d/X4qw3aYHBjzRj9KCJetUN3DzigEL8Jk+XLoEkKEij8gvlQg6Fn
         UHQevQIc7HseyFrkxCMGRqCh0zQOMLAK5clS7RBiwvcpA3mMSIoX1nHbv3VBGg1pgTpa
         vBazesSROShBc8HKR84XU8mv20kSBLswcBfWGR7HTROA4bwS6eFsMCtXuJ+KZ54H32K9
         XSIoGBtxKYh7LKFsApsTjCyPLfkU3QF9JYmgpm70hHP5seQWOBRWm9sKYF3k/Z4sO7LQ
         eoNp9kzPqzg6Iw2Jn6IKYbVa06phz34ZC1wca4Zizhfx/VmDAze16Av+boDuaSU/+kij
         GJsA==
X-Forwarded-Encrypted: i=1; AKwUvBwUe0Dtq9vfazxuPwGZgKw4Uf/jMjoBzE1fIcgQkZQvQrayJhNLr+deIQ7EJCTukiezqQTFYQGo7Zm6@vger.kernel.org
X-Gm-Message-State: AFq9FYIjgc1JBNIRqsrqyj2S1To0X8LvlXjdmZq0ZcG0E6mLj4qffFES
	LbrVU0lxapttCQn0lZ2VHAlf7VJLXqTHZG5KBiokxiqxGATOhAis/zk9
X-Gm-Gg: AYBFou2LgJl0Wv3V3ADy8a00DGyNw5lDcfnMoauXTsq83PhdpRK+K4QN8UpWj8QDqt8
	nd1kMj+vDLTk/J2mIEU2QsGhnqfYYya9kJAP1tosZ2NoyM5414RRZYjvL+OHlqqNqMgHdcR7EUu
	xZxbJshCcdlI4R0o18EHOpD+EysC5IGBJrILjYKIMqPkRIEt4tbXY1IJgmfmtKeqCwM5TAU/4EK
	K+znvTNLuVP+QwurzElKurWg69XlEwPBxmMOslK1SXWgYdzEQ1LyTcXg4dn2cVkmx1oREBvj6fy
	U5M1rY7XSrXsjqqH2HnDGsCR5EdnxlIQSc4TYeyT4at5VFpT+gQ8i/8v8oheeaI1gwI1/v4PyyJ
	BA4/BUlNOt5iVWVlLyC9b3o86980vPrSMIG4CuOji2EpylflC5JJsT686gb2TV+ecaAOQp7XohY
	ddwvNtcRzLYVFEugAhBGw+wNZdCn6ecdOI/btvW+Rfu1c4biWczgzCFmxgfmMjpDoh23t8W4qxt
	lQYGayjyumURnkkPtI=
X-Received: by 2002:a05:6000:22ca:b0:48e:d57:9bad with SMTP id ffacd0b85a97d-48e1afe328bmr362780f8f.3.1792403847147;
        Mon, 19 Oct 2026 02:57:27 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:26 -0700 (PDT)
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
Subject: [PATCH v3 2/7] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Mon, 19 Oct 2026 12:57:00 +0300
Message-ID: <20261019095705.91062-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019095705.91062-1-clamor95@gmail.com>
References: <20261019095705.91062-1-clamor95@gmail.com>
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
index b6d09a8d8e5ea..da9e37fe36689 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -104,14 +105,24 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
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
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -124,11 +135,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
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

