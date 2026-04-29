Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91F410D2C
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482027; cv=none; b=bOnR7EUXzUnZGUU6McrCoyax5EpAA5yho7URc6XgvjGBRPBVVKSe6+25D2UW/2cGBSH4HuNOYxN6HaUqyP7bDAOg7pP3ElxlYfk8uv8yCZ/6j/+MfCceLWxotXUZOe4GuQneT4LYjtNXaBA/Fm2QSP3aOcAx0Z2v7YO8RA2ArTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482027; c=relaxed/simple;
	bh=5KJb4pUz9ISCWuOFq3mdW6ldExid2fnbaeYjkHbT2Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qa8oGiWPE/XBFyJTVwJf++ZZPzYsXzlwNcXaM5hcmtkMhCecy5A8i9jWWUW69nWTk7XYhjotM8C+lFiOFbTNyI9SQwej5X+LiJkR64dS8tgGsZoX/fjIOC41CpdlBpdTHXqgqO4Bw2UPuPOULTlCB4v7I6M6RD/h3nEfrbgZC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9v6t60E; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9v6t60E"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so115919545e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482023; x=1778086823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkSm8ny43p543u10ucazCdZPdCMdlkGl7rYD8obUTQI=;
        b=L9v6t60EVwJS0l40I9Wxs7ixw3yT/RqlkQPjdsj8+jsEfZRhSBV5wCqavh5b+xkkIh
         cu/uSbyRPbXzLL0GlxeETvfbG0Rso5UlJ3ar1XeypEvWrvZVrP1nQkvva68BVCFR91RD
         Vt+/tMXh82o00vbnliNomQjABvJ0TUz4b+EepgwTRR6NUnCRIre2LWmiB46z6B2vQqHM
         Rmehb5/cHcBkV3N0+pRsFT4B9JYxBmZEB1mHpn7FLqWdr5RnoWBeanUG3peYcHHFdFUK
         3HoWWJH2wW3r3lTsLkXKY5sxq5gIhUeXjgWDJ49+p+9d+KWRQKASam0L7xAMrsqhSq9i
         Bg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482023; x=1778086823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vkSm8ny43p543u10ucazCdZPdCMdlkGl7rYD8obUTQI=;
        b=PidRXPjaaIHV3+0Rse3J+PoRTVj7WzbaIksna2LhcGMvO8axyiXx9Ce9BFQK6lC0rJ
         aLQ/ywR3yEY1VZvgRX9tCgcXWrNaWjeF3FlfVy/3Yv4HaAzzp950MeB3jwhGwdkoytB1
         5fdwS/0AMxSves5gkiF7uFs5xjVaSFV3ia39hIODxFC105V5fRWdxqoIW+t5W+3VxjI7
         1k5D82hsADoIXxsu6HMvywi9b3bcc6ZYgvFfZLN2Gl0vN1SiSbcuWY72V4PlWIwUo81Z
         aTKmx50wsvkMOX/kwdXLPrC6VuDhAYjj+gr1KjzkEbi6G0cSOoLHKh+nn9vpJdOmbVni
         gTDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QkTddQbrjV3ry8EcPi4aUD4vqKiA4vKSd7auGI1ysMEkSwnjJ/S1xxOiUtM4VJa7HzCCjI7Y18q9A@vger.kernel.org
X-Gm-Message-State: AOJu0YzdY38NoQZmk+WQtrMPLw/yhGDe5gproJ37OtbRfapI94daCn9Q
	zFGwCBoLtdKdmKyJ9jWH10ItP3kEPhsg4u7J/86AbtgG+69l4ruYBDyr
X-Gm-Gg: AeBDieu8jQBEpIKkFkocMbR9S8/XrLpthutxen8Pkk3VTRaA+C2AUym4SxY/UEOfLXy
	iJvriQE98EMcpTAYq2FiV2Y7mm/WYY2em4ils13bIVjigJilbwEE8Ib0v2TR8WoHyaXTrm+CD1y
	D8Epr4974r/GyZWnLirJl7qfmF9bhttRnp6XEQW4Zle+7mrerNgN0T9nJGLupKt6Ieu72PQrVqQ
	bw4DAvLnBuMQxyUk8NzGif2KheISk29A20Y1fHclHk666yS6HYcRhK9woZGY3+a8rCxrfb+5Vb9
	6mNmLstiOPn+214u//14aML7r2EOUokuQiIj0VTRhy8k/2IAgz+HQBOh9WBYRK2YslwRPoo2o1f
	MZJek1UDW9yQv122heOgAJEtmC4XVuoN2lHi/I5FT1zdj1/g2eynNaof55FUmbmdgIpsaVPNJlJ
	175DOQ5j/0z+l/5xEqnJ5JQjuJdjjtfvL3bBKnaGcM/ZaXFKqCbhkB1Eaw1ywVNrn2mflVUCs5l
	WmvCccUi50X98S4DUVtaUQg7Dvw6KQCjal0WMuoooaTjSXS
X-Received: by 2002:a05:600c:609a:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48a77b1da9dmr131662065e9.17.1777482022872;
        Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:212b:3a69:4f2c:3897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm4809755e9.6.2026.04.29.10.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] drm: renesas: rz-du: Add support for RZ/T2H SoC
Date: Wed, 29 Apr 2026 18:00:12 +0100
Message-ID: <20260429170012.366537-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H (R9A09G077) SoC includes a DU with a DPI interface,
supporting resolutions up to WXGA with two RPFs for layer blending.
Unlike earlier RZ/G2L SoCs, RZ/T2H requires explicit assertion of a
DPI output-enable signal (DU_MCR0_DPI_EN) during CRTC startup.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  7 ++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 14 ++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 10 ++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 2b772a11c7ee..017d5f26bc96 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -28,6 +28,7 @@
 #include "rzg2l_du_vsp.h"
 
 #define DU_MCR0			0x00
+#define DU_MCR0_DPI_EN		BIT(0)
 #define DU_MCR0_DI_EN		BIT(8)
 
 #define DU_DITR0		0x10
@@ -217,8 +218,12 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
 static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
 {
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
+	u32 val = DU_MCR0_DI_EN;
 
-	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
+	if (start && rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_DPIO_OE))
+		val |= DU_MCR0_DPI_EN;
+
+	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
 }
 
 static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 3b7162c6e1f4..fc55dfffebaf 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -63,10 +63,24 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	},
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g077_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+	.features = RZG2L_DU_FEATURE_DPIO_OE,
+	.mode_clock_min = 5000,
+	.mode_clock_max = 100000,
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
+	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 885558eb9547..baf076d69cda 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -20,6 +20,8 @@
 struct device;
 struct drm_property;
 
+#define RZG2L_DU_FEATURE_DPIO_OE	BIT(0)	/* Has DPIO output enable control */
+
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
 	RZG2L_DU_OUTPUT_DPAD0,
@@ -46,12 +48,14 @@ struct rzg2l_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
  * @mode_clock_min: minimum pixel clock in kHz
  * @mode_clock_max: maximum pixel clock in kHz
+ * @features: device features (RZG2L_DU_FEATURE_*)
  */
 struct rzg2l_du_device_info {
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
 	u32 mode_clock_min;
 	u32 mode_clock_max;
+	unsigned int features;
 };
 
 #define RZG2L_DU_MAX_CRTCS		1
@@ -77,6 +81,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
 	return container_of(dev, struct rzg2l_du_device, ddev);
 }
 
+static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
+				unsigned int feature)
+{
+	return rcdu->info->features & feature;
+}
+
 const char *rzg2l_du_output_name(enum rzg2l_du_output output);
 
 #endif /* __RZG2L_DU_DRV_H__ */
-- 
2.54.0

