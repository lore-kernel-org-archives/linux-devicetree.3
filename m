Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110894;
	b=wDanzH6yu+E+i5WRCkswZalA4+7A3m87jI3Rl/IJFnvIP05DHIgdTr/9llrPrGGHhRm8
	 yAUmWMgzOUeJXvWTCt2wLOyzT3k5MHyJ1Iw3235IX1n/JDyBm6vv4NuGTrLABG9E9JQQI
	 mVYK+6yY6jnEiVMYtLPK+2C3WIbKLViyv1kmIDexno3PMT2K8UYz3UHiVK72oMEMuteds
	 xscxcwX9Rm5+rqQC3jaJXix1BxR2KoCAIHlWzYo4gVpeTzm59mfFi5op3UGeMwo2NPb8M
	 StAOF00mmm8ZML+C0lhCdmrytwYV1Nh7gVLv2UNAW8FnxgC+BWJJuIrmmjBx3uWllOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bz3NO8S23PrM10kHofxJdDquSac/ELeH8koKyIr5zoE=;
	b=1mhy5JZSFwUVVEsaRpFBoF87EonlAn3Umfsxwo04mZlFU2Er618UtoN0lPCT/cL2vxFi
	 BO1tGfEEH3UOCjWs4A2xgVHXA6QA7lR2JfnptJ33hKWPoexXpPoDMfFzKvzezVgpFavsA
	 wnTzatzpXHd0zljdJ3++aSjwOkovU5p3e82PsGQsmGFj5GnD2Gcfn7/vlH6VWYQq20iOE
	 kJPMCBLE9xeqzemHjj3TCs498XuD3vXPw1sk9cHLgE8wTgmcTsnHbOs2p9X0PJUwBvNEN
	 6oi0cTxHthTj4mZufKxIxz6qMpw6wUvX0tPrkyNlWmTtmtSmfqO+5uHNpw5NHs5D1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifiLCOj+;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDA360A3803
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDA360A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifiLCOj+
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so26901635e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110891; x=1795715691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bz3NO8S23PrM10kHofxJdDquSac/ELeH8koKyIr5zoE=;
        b=ifiLCOj+L0w7YsLURUygBfdU9igOkDV6iRLMDfE+5xnJhdFdRgBcGbu1gsg3yxWVeJ
         SB2P9oI0igxYZHlHuPslUXIJWE6a0lBnj2qfI/zg4M2m8gMdT/YoGrgWpcR1mTmphSdJ
         UM5/Xn10axROpllPO5i1krp02cF9hXsbqAILqWDe+AnOxY4Gi7hxtP17x/ujxidLVenY
         0Oe29ipVH/9BRn0ODpyWi5rhpRPMLaJhGuRoEz4LkuY3aYQ9NCwBT2vmJuhW8Mky3z86
         urrif/1QpLJuf0t0ydbLiDHhctL70CgjGau2H9Z8rB64oLLZ7vsxlzEZ3KOKMNiG6H3b
         dZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110891; x=1795715691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bz3NO8S23PrM10kHofxJdDquSac/ELeH8koKyIr5zoE=;
        b=QQAbYO2hqBGLsapCyfuuNxnsO4wU+F5xtYnwnj7+9+D+C/6Ej/7vuLRqLGr4TMTmgq
         acIEdL3yk/PC7YwL2JJKMfotN2URUysyvHQtYAqapnWuqQdjsMKIjZFrXKo/2AkVWNJu
         D/xZnRoZ2d2l+ElwK1vOIQR5XTV6bWv8EsUnNxNgOANrh+YAbCxquhtQiL/1GmR2Goo6
         4o7ZeGAoySC+u/GLPbpHrHboGUNKLc8Q75xatpZdx/1eG3CZAjxhwE8tQ02GvHmrilXS
         ic9df6+tPGuSWVtP7wbRrukzgIG5AFd/mC+SsI6qRVlW6zAsnDujjWdytlnh8L134fjl
         XXIg==
X-Forwarded-Encrypted: i=1; AL+hErG4NTw2Gb/VDCCsmsg5A3AHK3kCoirVUw2ONZgdkEjUrGLPyNC9LWdyJazD4Gme3N4aq8C3lbC8hcBl@vger.kernel.org
X-Gm-Message-State: APuU4Z/IDggN9lXFqu4q8UKBqIcageBVXVaqY/zcBFSHE8Md+80jBlkq
	LwNPAvNfCT0gybla5OTtheTARfPeDaCO7iwZ2NA8oXlskEZuuT9Y7VGl
X-Gm-Gg: AYBFou2ALsls/YwEzXv/h3BbjV94pJVI5NeijTxtVqo7c79UlnG68OmPjeXSKjf0YZN
	lkXFeo2z1lcRXJbVhChL/kKXgDxZ5gh3zzp6IW+U++hAlOm9Qqb5+uRQrMFVpKRhlkz8U+Cs2kj
	ulApsnt79xYqMTFX+emFUOjp+9epxmS/uGQAzUwM9d1qs/N4xPW5lIUAmhAB/l9ZHZM+ALW53io
	Jzjl6WtbfKYKhenYgSJXWdv6hYEUSPP4cSx7MgwYXsnG/i9YlSTE+bjdxNXwCp+rfZdDsVuVCUz
	rqoZOCphkW8aHtw0PkOVwnyaV97vJl7VFjMIiPiLJOE/kV1S2ReAILpk0ORA9z5kE4nxeFNDTvs
	fG5z8Ep/YCyr5PD+uccVd6rlYohsLzcO7kUO3phQcYg59yEJDZdTd5Ds+G1gJV9p4zpdwmGZlfl
	rGgPH4hofyuMnfPniRVUDlLt1XHwuhdLuI5UTRZn7mxvXgagT5tiT7zhHK5hxS5cewHb7X82EhU
	JdUaS28fJqGiDFm02XQ0KrDT1566K9sBQONFfxw7uQJRQqdN4w3uc43+/3+l3yJvI8OUqwOwSeo
	OtbdOMB2TvfSbR2Yvj2EGqVbLfjSkjyaaLs6GRpuNNGK7RPZL1m7ZosRURkj574OK8MPzWNRGad
	svyU1jrgO1HsC6tHhcDkVlQZ30eAjdFiyaIrptjTWiMJaDH96SdMe310Q07RqAMFN5JMaltnErG
	wPcnSdu/FjVAZb7bAjXk9KRAdzjUVgDWRNrR6A1hpjEiOyF+vbM5W9CkMszMloVAIGKdPy23bUq
	DmKhMi3VuImuOCU9lcyu2ejmBUqx9zVhjFkkmfqHms7P22ppMaTQ7pINr1IeJONttu7sdE52N01
	rA==
X-Received: by 2002:a05:600c:5307:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb888283d8mr7139155e9.17.1795110890838;
        Thu, 19 Nov 2026 09:54:50 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:49 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] drm/sun4i: Switch DE33 to split plane bindings
Date: Thu, 19 Nov 2026 18:54:37 +0100
Message-ID: <20261119175437.2520400-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
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

The shared plane driver and split register resources are now in place.
Switch DE33 mixer discovery to the new bindings and remove the legacy
per-mixer plane setup. Mixer register space now covers only display
blending control, so limit its regmap accordingly.

The old DE33 binding is not supported anymore, since it can't describe
shared planes and was never used by any device tree. If it's detected,
print an error asking the user to update the device tree, instead of
failing silently or misusing the plane register space as blender
registers.

Note that the plane driver doesn't enable the scalers yet, so H616
planes can't be scaled anymore after this change. YUV formats were
already removed for DE33 for the same reason.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 191 ++++++++++++++++++++--------
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  11 +-
 2 files changed, 136 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index dbde80b32080..4677180ec780 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
@@ -28,6 +29,7 @@
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_vi_layer.h"
+#include "sun50i_planes.h"
 #include "sunxi_engine.h"
 
 struct de2_fmt_info {
@@ -257,7 +259,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
-	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -294,16 +295,16 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		route |= layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 			     SUN8I_MIXER_COORD(x, y));
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 			     SUN8I_MIXER_SIZE(w, h));
 	}
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	if (mixer->cfg->de_type != SUN8I_MIXER_DE33)
@@ -318,7 +319,6 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
-	unsigned int phy_index;
 	int i;
 
 	planes = devm_kzalloc_objs(drm->dev, *planes, plane_cnt + 1);
@@ -333,12 +333,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = i;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[i];
-
 		layer = sun8i_vi_layer_init_one(drm, type, mixer->engine.regs,
-						i, phy_index, plane_cnt,
+						i, i, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
@@ -358,12 +354,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = index;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[index];
-
 		layer = sun8i_ui_layer_init_one(drm, type, mixer->engine.regs,
-						index, phy_index, plane_cnt,
+						index, index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
@@ -377,16 +369,34 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	return planes;
 }
 
+static struct drm_plane **sun50i_layers_init(struct drm_device *drm,
+					     struct sunxi_engine *engine)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	unsigned int base = sun8i_blender_base(mixer);
+	struct drm_plane **planes;
+	int i;
+
+	planes = sun50i_planes_setup(mixer->planes_dev, drm, engine->id);
+	if (IS_ERR(planes))
+		return planes;
+
+	for (i = 0; planes[i]; i++)
+		regmap_write(engine->regs,
+			     SUN8I_MIXER_BLEND_MODE(base, i),
+			     SUN8I_MIXER_BLEND_MODE_DEF);
+
+	return planes;
+}
+
 static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
-	struct regmap *bld_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
@@ -398,14 +408,14 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -418,6 +428,12 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.mode_set	= sun8i_mixer_mode_set,
 };
 
+static const struct sunxi_engine_ops sun50i_engine_ops = {
+	.commit		= sun8i_mixer_commit,
+	.layers_init	= sun50i_layers_init,
+	.mode_set	= sun8i_mixer_mode_set,
+};
+
 static const struct regmap_config sun8i_mixer_regmap_config = {
 	.name		= "layers",
 	.reg_bits	= 32,
@@ -434,12 +450,12 @@ static const struct regmap_config sun8i_top_regmap_config = {
 	.max_register	= 0x3c,
 };
 
-static const struct regmap_config sun8i_disp_regmap_config = {
+static const struct regmap_config sun50i_mixer33_regmap_config = {
 	.name		= "display",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= 0x20000,
+	.max_register	= 0x1fffc,
 };
 
 static int sun8i_mixer_of_get_id(struct device_node *node)
@@ -464,17 +480,14 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
-	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
+	struct regmap *top_regs;
 	int plane_cnt, i;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 		top_regs = mixer->top_regs;
-		disp_regs = mixer->disp_regs;
-	} else {
+	else
 		top_regs = mixer->engine.regs;
-		disp_regs = mixer->engine.regs;
-	}
 
 	/* Enable the mixer */
 	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
@@ -484,25 +497,29 @@ static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
 
 	/* Set background color to black */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	/*
 	 * Set fill color of bottom plane to black. Generally not needed
 	 * except when VI plane is at bottom (zpos = 0) and enabled.
 	 */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
+	/*
+	 * plane_cnt is 0 for DE33. Blend mode will be initialized in
+	 * layer init function, where the number of planes is known.
+	 */
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
 	for (i = 0; i < plane_cnt; i++)
-		regmap_write(disp_regs,
+		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
 
-	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 }
 
@@ -533,7 +550,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer)
 		return -ENOMEM;
 	dev_set_drvdata(dev, mixer);
-	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
 	/*
@@ -566,12 +582,33 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer->cfg)
 		return -EINVAL;
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		/*
+		 * The original DE33 binding described planes as part of
+		 * the mixer, which can't work with more than one mixer.
+		 * It was never used by any device tree, so it's not
+		 * supported.
+		 */
+		if (of_property_match_string(dev->of_node, "reg-names", "layers") >= 0 ||
+		    !of_property_present(dev->of_node, "allwinner,planes"))
+			return dev_err_probe(dev, -EINVAL,
+					     "Unsupported DE33 mixer binding, please update the device tree\n");
+
+		mixer->engine.ops = &sun50i_engine_ops;
+	} else {
+		mixer->engine.ops = &sun8i_engine_ops;
+	}
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	mixer->engine.regs = devm_regmap_init_mmio(dev, regs,
-						   &sun8i_mixer_regmap_config);
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		mixer->engine.regs = devm_regmap_init_mmio(dev, regs,
+							   &sun50i_mixer33_regmap_config);
+	else
+		mixer->engine.regs = devm_regmap_init_mmio(dev, regs,
+							   &sun8i_mixer_regmap_config);
 	if (IS_ERR(mixer->engine.regs)) {
 		dev_err(dev, "Couldn't create the mixer regmap\n");
 		return PTR_ERR(mixer->engine.regs);
@@ -588,17 +625,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			dev_err(dev, "Couldn't create the top regmap\n");
 			return PTR_ERR(mixer->top_regs);
 		}
-
-		regs = devm_platform_ioremap_resource_byname(pdev, "display");
-		if (IS_ERR(regs))
-			return PTR_ERR(regs);
-
-		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
-							 &sun8i_disp_regmap_config);
-		if (IS_ERR(mixer->disp_regs)) {
-			dev_err(dev, "Couldn't create the disp regmap\n");
-			return PTR_ERR(mixer->disp_regs);
-		}
 	}
 
 	mixer->reset = devm_reset_control_get(dev, NULL);
@@ -638,6 +664,36 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	clk_prepare_enable(mixer->mod_clk);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		struct platform_device *planes_pdev;
+		struct device_node *np;
+
+		np = of_parse_phandle(dev->of_node, "allwinner,planes", 0);
+		if (!np) {
+			ret = -ENODEV;
+			goto err_disable_mod_clk;
+		}
+
+		planes_pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!planes_pdev) {
+			ret = -EPROBE_DEFER;
+			goto err_disable_mod_clk;
+		}
+		mixer->planes_dev = &planes_pdev->dev;
+
+		/* Planes driver must not unbind between the check and the link */
+		scoped_guard(device, mixer->planes_dev) {
+			if (!device_is_bound(mixer->planes_dev))
+				ret = -EPROBE_DEFER;
+			else if (!device_link_add(dev, mixer->planes_dev,
+						  DL_FLAG_AUTOREMOVE_CONSUMER))
+				ret = -EINVAL;
+		}
+		if (ret)
+			goto err_put_device;
+	}
+
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
 	/* Reset registers and disable unused sub-engines */
@@ -672,6 +728,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	return 0;
 
+err_put_device:
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		put_device(mixer->planes_dev);
+err_disable_mod_clk:
+	clk_disable_unprepare(mixer->mod_clk);
 err_disable_bus_clk:
 	clk_disable_unprepare(mixer->bus_clk);
 err_assert_reset:
@@ -686,6 +747,9 @@ static void sun8i_mixer_unbind(struct device *dev, struct device *master,
 
 	list_del(&mixer->engine.list);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		put_device(mixer->planes_dev);
+
 	clk_disable_unprepare(mixer->mod_clk);
 	clk_disable_unprepare(mixer->bus_clk);
 	reset_control_assert(mixer->reset);
@@ -867,16 +931,8 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
-	.lay_cfg = {
-		.de_type	= SUN8I_MIXER_DE33,
-		.scaler_mask	= 0xf,
-		.scanline_yuv	= 4096,
-	},
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
-	.ui_num		= 3,
-	.vi_num		= 1,
-	.map		= {0, 6, 7, 8},
 };
 
 static const struct of_device_id sun8i_mixer_of_table[] = {
@@ -940,7 +996,30 @@ static struct platform_driver sun8i_mixer_platform_driver = {
 		.of_match_table	= sun8i_mixer_of_table,
 	},
 };
-module_platform_driver(sun8i_mixer_platform_driver);
+
+static int __init sun8i_mixer_module_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&sun50i_planes_platform_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&sun8i_mixer_platform_driver);
+	if (ret)
+		platform_driver_unregister(&sun50i_planes_platform_driver);
+
+	return ret;
+}
+
+static void __exit sun8i_mixer_module_exit(void)
+{
+	platform_driver_unregister(&sun8i_mixer_platform_driver);
+	platform_driver_unregister(&sun50i_planes_platform_driver);
+}
+
+module_init(sun8i_mixer_module_init);
+module_exit(sun8i_mixer_module_exit);
 
 MODULE_AUTHOR("Icenowy Zheng <icenowy@aosc.io>");
 MODULE_DESCRIPTION("Allwinner DE2 Mixer driver");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index e2f83301aae8..9552c0bd9b99 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -193,7 +193,6 @@ struct sun8i_layer_cfg {
  * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @mod_rate: module clock rate that needs to be set in order to have
  *	a functional block.
- * @map: channel map for DE variants processing YUV separately (DE33)
  */
 
 struct sun8i_mixer_cfg {
@@ -202,7 +201,6 @@ struct sun8i_mixer_cfg {
 	int			ui_num;
 	unsigned int		de_type;
 	unsigned long		mod_rate;
-	unsigned int		map[6];
 };
 
 struct sun8i_mixer {
@@ -216,7 +214,7 @@ struct sun8i_mixer {
 	struct clk			*mod_clk;
 
 	struct regmap			*top_regs;
-	struct regmap			*disp_regs;
+	struct device			*planes_dev;
 };
 
 enum {
@@ -252,13 +250,6 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == SUN8I_MIXER_DE3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
-static inline struct regmap *
-sun8i_blender_regmap(struct sun8i_mixer *mixer)
-{
-	return mixer->cfg->de_type == SUN8I_MIXER_DE33 ?
-		mixer->disp_regs : mixer->engine.regs;
-}
-
 static inline u32
 sun8i_channel_base(struct sun8i_layer *layer)
 {
-- 
2.43.0

