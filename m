Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675423;
	b=n02ypfa5xpt+6DIUCJc24QbfVe9/SP9eIf8q7l/W2rj+NoE7eZ30ASnHg6T03gOZVziz
	 W/VEAplvPmA5g0gsVIWc0wm/zDLFg+oZWRu132kPqAhS3dF9YPRgt6xLkaua7rNRM26eO
	 5dMKq1fCzB7+8eqQ8mjLLgynxsIKJcfX7CdVCX+sfYTX9fKfX73QsEyuBjdqjfPsBQww8
	 B3dJow1XnUscI+wXQ04tfrkkJYi8sIoqZITRNbkJjsvVfwCHPgxHH+OqMvB0Ysw0TcrEq
	 UC0d2jBfRLyucnZObuEojWBiOSCcC5vB7ULBt+iZiDPcsXCLGLx5M0mS2lzT9Z9hlrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
	b=jJBrufssHuWsGlHFwahwAKwtp6vKEgCN3GCMUPxbS1fcKn/laG4+sp4OWU5BHQ9pIO/t
	 ZjGLV7MO8531bAhKokKca2mxY3S/qJisXZJCM86k4+AqvB++nVK5zS53go6Imd2QFV/Oh
	 9kStI8HfB0e/NtaqDZEG/J3rJ6tFmThkAYgl3+S2iQRiANDIhTCJ8mW+1vQTDNKCHa0lQ
	 0uLjTA86EuP799FFt/QIehBzZfhi9N/AhBCMIFBcUjIdZZaCJNbYVSLd7suTouDmhz7Do
	 Pz5GAhzzpVSOPLUpzB3pXqnmrEOYf/3ZlnAhjZasmOyVFlW9VQhbbR6ZHb+goM7tyvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkBhmq5m;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFDE606A324
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFDE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkBhmq5m
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso825994a12.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675421; x=1793280221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=EkBhmq5mBZV4neeVDw3QDVYVEpHfN65BO1zRCLBetcTnYmtQ8fKgUb63Tkq7PWTe4c
         b/5boo7iDILM7RZo8aeoBa5xJmEF79qzTZnRhuFKbpRL/tEspXknbeATPQQZIszfe0yY
         BqMpzr1PcNClD2DHPMmxKTqlmmYDfbj4vOje874AJozMoeEUX1MgU5C/yGh7Imzak9jP
         Bg3bocwEAH7sKC/WABhRJldPF4pfMCvAs81Qhp85o14fkjySemSfpOEgVEjT3o23mEMR
         8O2eUSQmyaG9icElecDr7XSjsYD6Ugvdd7FjMXgemakb4CWsJxDnKt/T73QzZoZOphms
         xqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675421; x=1793280221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=Fmrkr/kM5+4ZzQJm2aWyXU0vZl/2EVqu/A0X+iXToEv3b5CBg9MJdAiVf8HfnicPRO
         2tQRW0bKlAZMgF1JlgfEaF2G9EWND6qgi3cw53Y1woXc1wSmjrarOsY3RYLj4cu6l3S2
         pxT/Nnl8sCHPU43R8shVCqGiKjwZJnC4C+zBjBiU8jf56CmxWjnyLl9K3CCX6ODgoiLG
         G80nEEjHbVpUbOn0JbEkFbLN0O6wMAiQAQE1Rc4r23Hm8BEuJgNVsX2ziYiR/BdR8FtG
         5VapbEQVREoh9twprfmvlr1ve935vHB93zK1KfsdjEQy68y/j96lkLCsdTX5M0dSWSLt
         2Qcw==
X-Forwarded-Encrypted: i=1; AKwUvByC7ToP3rDMRCZgCmC0evBd8fd+zspyhUZdbw/QcIwH68tDhk+1a+/UpBoTlst9ortX/yY59aMhKC+x@vger.kernel.org
X-Gm-Message-State: AFq9FYIVnmBUcztBlL3Y+b/lK8B1g2gGEpx7hy5J0tG0z3QMl+7kH/fJ
	9owzUmCF2ctoGltPNZHEymuwnaV41cR1f7k4imDPMc9E2kjtB/IsdoyK
X-Gm-Gg: AYBFou0ZbS4cMMJHD0lR4d4VlG55JMdiYjXDz0XsTfp4bonTUbS/wNhk65W+bvtHkQA
	jihRJ/soRvB2muSR0SmIPxyxlwldLv45xwsGwDJ4Fm68A5kcxCJFUdcebYm8xFUD43W16bgdnbo
	zMnm8h5rfvAsel6IhFGWsckNsIN4KKA8285OyH27Er57sac68WPBZYkI7uoPLwmVjCG5eZIgMnp
	om9qG+0EbGpDg2JshDDQmD4xc4hfMYklvSIDDjzSiG0AS2Q9sWncMzFNylV0uiKZXGMybNTE2oc
	NYi6sMpginbQTXP+VA4FvO9ahz8SrqqAagNm6+JH9/cp6WkffekSsCdwcHz8ivRDp8Col4P1iMs
	ikmQHlOVJPvTDFqXPBaoTqJPBgjLgW3R2aAb2s4kIXG1p5gS4L5FiA0dzwUSEhs7XhnqYhMiWMh
	mYCJ782qzZoqT7BuvSIqHx4165YsTVGXMZCr9AmNr8z70RsvvxajNqagHWfTSloKq7J2qJstGfm
	NGZ2oK92+2DjFNQYluNsi6HAGdx5PDkSxCd7AYfeBM54m8lK/tYIVSDBtBRCpEz7moI5wZAi4Co
	GOJYKrMPt77U1SMctGTORw4=
X-Received: by 2002:a05:6402:4246:10b0:6ae:1895:3b3e with SMTP id 4fb4d7f45d1cf-6b41d5cfd2emr2354555a12.6.1792675421106;
        Thu, 22 Oct 2026 06:23:41 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:38 -0700 (PDT)
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
Subject: [PATCH v4 5/7] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Thu, 22 Oct 2026 16:22:57 +0300
Message-ID: <20261022132259.240717-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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

