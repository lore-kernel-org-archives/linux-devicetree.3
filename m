Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FFC3DE439
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206931; cv=none; b=efokLIPJqxYsYtxDWaRA4wiSm1/UxaYxiFjFatRouR3BZQ+4f+GTp4ivCi7WVWCwVPjztmGAcGoFyctKWkouICiOeZ6mnikHvfF5prmbvQPpEhxQoBeL3iCEap0V6GxR8olNcfXxS1xGc3pP3Q3jSGJhU15eMFGuvx57K/v//H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206931; c=relaxed/simple;
	bh=+xVm8Xax4VAKdAhD5oD6QA4LEfJKKTaqqkmkZvU9t8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ql/rfnEgBczdTBpqdXSvkdkYhHpHjqYB7g60AGXWUGTnkhA8phHtqNrfcNIoIUQZob19cj0GWI7PjHhM/+Kc1WrhbXcn4tGbgusqD89DjXxQUwZWcjI+1Vy/aedZlEEUAZ+k3BI9hDoa7mlGnr6RYNU+BRpC/K1laCETtPYnDrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWRae9hL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWRae9hL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so41913035e9.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206928; x=1779811728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPi1O/9kVNRbabQOXnYQalc7uFGr2pxzXb6VmowUh3M=;
        b=YWRae9hLVyLEJTl2kvfb4kqBe/K7zu9EQ6bQOfPcFgsID4sp4tVy/5vhWR8HaC0Zu2
         I2hv84idH5NIEKlpQIPhntDsrVHCd9R2ipNFVp4KNW+j9BWv1Co9hbdPr1yE3I1B03uK
         03Nn2i0VCHKl7hWkwT4wcK0fsoqw6imZeg6jGwl6t/sGd+3959HJROfOcd3jRcfrcUjF
         OgBDN30RsQVHBk6grya4r9DIg3GPMNs3/2yjTA94FU9egQYIvLsIJqG+mRNrbYuAZyiM
         wXxIC8vL5xArmRDgii2PQ5Ty60mKGh6Psg4yZhiHIriUFucK3UQ048VcjZlgf9f3WRFR
         BqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206928; x=1779811728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JPi1O/9kVNRbabQOXnYQalc7uFGr2pxzXb6VmowUh3M=;
        b=bbK83/9CQtMWkTDVsb1hCa6mxery2W8qRM4YTjb6HhJxzT4Agw0KaMIDdLCceB9eq3
         u3Bs37bQu2a5Cq8cem/dqPgn1wZNWvK4G7D2O+T/SJsxV4yplK6eaRnI8SUIilRbxilJ
         7LOXvPAQwy4jMBP+SVq45HWhZ/UVWnpROL12DKEH1WTAwoDpW1zhe2U+BguRR/2yyTSz
         9jQeSP5aGdOy8jGNA+g5WPd3607h0kUxjGhwQHIBEx3MvKKwBwmCuOV/BHXFW7pjRcDG
         y9ebenXUb3sVfOyZ45G4q73iAcicRxln/T7nO6boyFPULw2Ru3/yQKzffjhM+0sHQtOI
         vVaA==
X-Forwarded-Encrypted: i=1; AFNElJ/66gvDFzQ7ywJMCxoATvM0Sluvqgcszze35a9NqEnkuSopE2I+GHpaUVZdMah/NgidjI/rcvK0d3Wc@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1hS63/saLD3FpYXa1MNwCaoz1r7UxqAByd/vKoh3jyDm2NLu
	Rgr2lPJQWHRN4jeOWzPWws8mClbIqf8U8WElg2UdTrXCHMsDHhrYLCpE
X-Gm-Gg: Acq92OE1Hl72kcLpdzXWb+gVLeR9dFT/zwqZQxiObAots4A6ZdKXfMd+nqAJJ8ey3ap
	/aOBPj8p6v3N1Awfv8l8rFboDjchI9ysOBNRD6mTnYkK9rvKR+8cZ2YRE+pFhjy5jY9NZrfaYtS
	gyQ/15wzY1vob1n0lv0lZU0OmDmIIr0tzNhSyCQ/aewghtUwvMjlk9FGHinCab2/pYxthTcY9wk
	uIk0BNE2ZkOJAjkK4oRAZgG3nTLIdxVlZsnJwPNp/28i3LIq2SLV6N9NEVNpROSxHiMJUCYcIyZ
	TM6ljsYgpbOhle9kgDRaXz6buH8J7pbv5u3CXKc6k8wz9sC+saHfMj40ibbwx60XVmrBPn+/vMb
	reLycZT5DzgbpyNvGZ+GGuTzuVk7s8F0Ljxy7vDZOSvV29/KNJdAjfFPFebkgZbSvA9yybiyT+J
	MhnYzSbEBCLvmUn3y/dmtw5Zyph/HO5cp9We/HKQHVyu74C0Z/Lez2G1v9jIag+NNh6DiAoQ2q/
	t/YfXZ2SgoLlhD4tuumGJzufYuysy2nLJGcfw==
X-Received: by 2002:a05:600c:4692:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48fe632579dmr319854455e9.20.1779206928193;
        Tue, 19 May 2026 09:08:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm372645305e9.11.2026.05.19.09.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:08:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 5/5] drm: renesas: rz-du: Add support for RZ/T2H SoC
Date: Tue, 19 May 2026 17:08:25 +0100
Message-ID: <20260519160825.4082566-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v3->v4:
- Dropped per pad limits

v2->v3:
- Moved clock limits from device_info to output_routing to allow
  per-output constraints.

v1->v2:
- Added Reviewed-by tag from Laurent Pinchart.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  7 ++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 14 ++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 10 ++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 48065f4952a3..d0f01aa642a7 100644
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
index 1e4b9f38c55b..3d13f61d3c97 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -65,10 +65,24 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
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

