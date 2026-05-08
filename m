Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32F396579
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239079; cv=none; b=TzANJVh/gxSnuQLDmlc8a0YI2LsGDU/YVoD9RD0UD8l//fYiuKHG0HqNjC/P2F87ZUI1lSqiB9IKAKzlxAD/WIuAYDIDvw2gcnt1xekyM48lvPihSln/rm2GC9UrFo0URMcn2VAMtViwwD3ZMiFcXpQltHYHgEVdsqebAe0X1Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239079; c=relaxed/simple;
	bh=6rePoYg9zZjfRvgAGXJYtlK8ma8tlX/oIEwFq/4VEQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROlfKYeRvSH6o37vzOvjo7Wh7DbURECAM8tyCtyqdKSNmw3nBbUjvdaPp1Ljse8QXv3l+7U4QbA7QdurYvYU4dAuZxxLU4NYCx9f8wTye3rFxso1a3oTqMEYAD9a/lu2rmSRk4c8jU3Dem+oZQhcRdN0fMQv8pL8kLlab0CWcO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAeqt9Jn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAeqt9Jn"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d77f6092eso1217705f8f.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239073; x=1778843873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4xhery0lAk3gv+PVUgTZeq25ctOn5hBwj4+jcbkRck=;
        b=RAeqt9JnI359yOeHb56Mndex4o97DAYwFkW6zz+8jvDyypg07UqyiiJlv8ai843OB1
         tdGN7j3zRPINVAjEIpVQUvjMzam7jq6x9fhNtRy5eXuejRR9uB1C+DZisCI38jYpp+aH
         oxHgMLHgXmCuaKqzZZX7RpzUCDHwCfb4hwEf7tvAN2FcDFTRtu4Kxjl5I8UClzSX+z53
         rHf3yW9gWqRkSYiW9tM927XJIwVtpEz++iNRpW46bPxj97Rt1WibYehLlcioPa++HLIb
         vXAsvuRVp9NE/ybOYrCAV4ZM/nh7JGCW3inIughoh7s7Jg/87An5UkG6HikaHZlTmUDy
         5/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239073; x=1778843873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4xhery0lAk3gv+PVUgTZeq25ctOn5hBwj4+jcbkRck=;
        b=fkeR4y7y0kffEZeqfrTY5QJbvucUj3NCpWWWGxBkKpsNfD6Ql6BG72JMREsCXe6Ju2
         1qXzwhmfqdKkL4XElgwxpc10SdybZq+HFGn59OSfkgzvFapOHyU9MDNGDwmPXf9hDv7q
         Ran9kA9fKuplyOS8ncFWLIXrawst+eacmQ9F7gCto5Ek3V/eA1MS3WfduGrR0T5itM2T
         JxOYtYukIFHnsY5WU+lvqNdDXHETmamhQxdxDqarwcVVJNJ677RUigEiQMDCGl8mNyuF
         jp5FEBfGiTOQmaa0CgwLZbaauI23ZNk6BxWANyEl7X71LjMTHBBJTAPuuVDRPCZpbhnN
         v1YA==
X-Forwarded-Encrypted: i=1; AFNElJ+9fOu3Pn76q570LsMpuT9DFjh//mGheMX0QS/NIczjK8/b0IPIDd3+0M9K/sdXIx3RlXj6tQ9G3mTy@vger.kernel.org
X-Gm-Message-State: AOJu0YxyFnpPAXbCdrpPIS51SJQKHt8qaSjWpGT4ItC6026xJwMcU5TT
	k+1F1v72ITAlZKOrtZ5U5G4MlE+ky1Q8LlaL7JIE3rO0rtf1J2J4bXIt
X-Gm-Gg: Acq92OEYum3bWH+tpcg9hSnWzRWEwQI25Fg+J2BGfyy+dAUtDY7+IWXHuCFtA0hIdeK
	pi3lubd8Osry3vPMzf1qvSLiBUItn/9VfHv30TcqyE+1VKs7gvcvqlxNJ8zkBS0ymKy8ruhoz66
	mWMs8b9iyCC0jbnsvxmfrb0HqYAzBPdMdP+CB5JOQ4P9Nj70Ao73KksurvbpRx3T3l95OzM8NAO
	dfN5B7Oy4GOkzVBVBHnoFgQYRJSHPQkWHpJlyDh+RyhUcWj9WlK6/5YPwTNv4+37bJLx4BsIOPj
	OGmJ3khWa8UcVyz95cjzLFb/aFTyFEn7RWDbvs8ssoiLhkxmSfVRg6YCFta3Wi8alHe4ZTBbdZx
	t1nvJgg6Jnjsp7fuuRuHOM45AowLcJuOHszG80FNIn1j/tvx4Mx7tdnD44l8P/4EOvjAQm9v79h
	izz6L27BwHOswxUS70r1VaRyD9KQbT3W3M9uVBftG/WSNfpUoju1Xn23wArFE0+Upwl4XnnYRTN
	+PqdM6vfaz9vSYH6yxm52y3+guWh429VZg6zNdURg1l7IuR
X-Received: by 2002:a05:6000:4010:b0:44b:aca1:f480 with SMTP id ffacd0b85a97d-4515a6c3361mr18785764f8f.8.1778239072877;
        Fri, 08 May 2026 04:17:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:74ae:919a:e57c:bd9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm3535563f8f.25.2026.05.08.04.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:17:52 -0700 (PDT)
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
Subject: [PATCH v2 4/4] drm: renesas: rz-du: Add support for RZ/T2H SoC
Date: Fri,  8 May 2026 12:17:44 +0100
Message-ID: <20260508111744.771659-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

