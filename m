Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0904B403EA1
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206930; cv=none; b=SC0KsJO8n4zvwcGPf8ReJjXhibDpj4W0c3z32kEF7RmxC93CSva0nud/zpeX7q+ghUV+zZkwXhUwlTPPtFnX4Yk0x6GKUflb4ShUzZ+uLwct+zRMGh26OJo6NM6JZ+hlMmKEb71YCmzZWYpoCGo/zfhmuESUJURATxcf5Vow0Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206930; c=relaxed/simple;
	bh=WKlThPEjph8Kg3zvYIYJ/KDx7j5uItr27dZBo3VHreU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWFMTx4JbagUvrvRjpIg5OPTIL3qh/MaZSm0QSpvzg5lQBhXCiH23B4yS76i8Wk5TKKpG63Ds6lW9IXjBjVZqc4lQHv/DDiwnKgnfrqFLhxpgTsrjSQ46cMD4+4md+o12TbhJERxpY+1cUvP0nuLhetu8r/iwpZBtbkj1LrqfwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8QSGId0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8QSGId0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ad135063so30289275e9.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206927; x=1779811727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAWcMRCYIfI13fsHZY8bUdRnZOMEHAf8WPoUZ0UW9yQ=;
        b=m8QSGId0bGki+VpeY4/H6URcYqM3GbWw+2BmrxlyUC8IxPIvxiGG3s7k4d5Xb2CVt4
         tfUye7ueA/4+ZuJccvTN/WMO/9bjNYjo4/5Y4SaB9MvdfqvpoWxg5KWz6umIHrwXlZFw
         ZLOTYcbDag+hJCLGWJkkpztz9tfSOqS0eKyFwUYrJkqS/0jERn/WqWnFHdFI+9nCWi/o
         JN0GpeW0Sk1yRHoT8B8gfFwwEzf5zfQMgWT7UaqAp55s/A0SOQClrYf1ugE1wo9F1Rfp
         mo1yUaJKDUklZEzFLiIACXoY+yONuazjrUppmjy4Kac91Em7xJlifKGfmxWJUsd04OwK
         wEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206927; x=1779811727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aAWcMRCYIfI13fsHZY8bUdRnZOMEHAf8WPoUZ0UW9yQ=;
        b=kIAOsaAephIsl3bpsZYryjw6r9wLhvGb2ZvKOMQO49zex+dTiKBaeNUSPosgcydomQ
         JJZykSmkychVxCokCEzmrqfDQm9l+YhNacwIsW///Jli+eo1lqrAXJ27G9ZpzCnYSZ2l
         qcJfwU5coTmMFcSPOIBZVD3GdTcoFm47eU0iJDgQSkrn4heobVl3q1Uy2Qatnxl+nAGG
         hktjD8xPjvPBAU8EpUPC33BmgW9iG+v8uw0TQtFFIE3sTnRbRlJRnZEobgp/52cLmvcs
         NhDAWaaoomWf4ep2XWmDG3DuWnIyyjrNifVpbhDpZkeWrQMbUAG+seGXl1z7FDfNv58R
         +uYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9jUA2ESjpF4lTTWj/Z+VZJrixBSGVgsQZfKlJsHmyuM+eVmT4XH3DoMZC3JHnxyOOWKCJ4XzoLaQt@vger.kernel.org
X-Gm-Message-State: AOJu0YzAu49hTUOHIGtdBDhh5iE2X54m1JIY8Ur2xQ51jpSallOKx6Rg
	uEzOXdwfAJMEF++RkrgzHvovEFwWtigekpjg8PhjSFBrRAzScEW2gyrNKEnPvpagdZ4=
X-Gm-Gg: Acq92OH1V6FAO9qOhIo56zQ68DVES8kQERQm7oNtvJXMB80ozdnWVMwxbIUysMhyxU6
	iLGSbqGouJSjoWvUmFYL3cZfMiH0T7hj4uIk71tphF6K/IWgwWGsLeavgBdVU+R0V5MzzIvEKJA
	TqKQRWKPPGieFqg4hDm84baHwTCSxKMgRrzWU3gre1FAXzC9Ri0vjlH3SASRLO+hRlwbtHPEUUA
	N8LC0SqS2xAlDqsEX+BwHNi9p41zUV4+ANeEmNe3HXA+Wm8ILBr8VAfCz620Uaq9SfpwQdRrXv9
	Nt0ymD+85KOEnE2Rc+iwjfOnusX7FUal4JZQHZpojXGr+EnppDpAj1fnLOc+s2bkfF04YzWQQit
	fglkwF37FRzC/TA2owsymv/jebRG195RTJQ8UwKLMqMYfB0Y3WvNerQMkbrOPIlgKTOhHDmLPQL
	2Xf4oQ7WplyPAMpTa7M0UYy8hkCgrI0wT7xGcd3yfqoFdAPdYj2SsvENiLnYiECbaEM66wyKfAg
	E+dnZyyKh8yLrfmrYHU+BLrqJmu6vp4CxrP9W1QliMvfsgM
X-Received: by 2002:a05:600c:4692:b0:48f:d835:e104 with SMTP id 5b1f17b1804b1-48fe6325391mr323856325e9.16.1779206927342;
        Tue, 19 May 2026 09:08:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm372645305e9.11.2026.05.19.09.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:08:46 -0700 (PDT)
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
Subject: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to per-SoC clock limits
Date: Tue, 19 May 2026 17:08:24 +0100
Message-ID: <20260519160825.4082566-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Move pixel clock validation from a fixed encoder check to per SoC
constraints stored in rzg2l_du_device_info.

Pixel clock limits differ across SoCs in the RZ DU family and cannot be
expressed by a single shared rule. For example, RZ/G2UL and RZ/G2L limit
the DPAD0 pixel clock to a narrow window, while other SoCs such as
RZ/T2H require a wider operating range.

Add mode_clock_min and mode_clock_max fields to rzg2l_du_device_info to
describe the supported pixel clock range for each SoC. Update
rzg2l_du_encoder_mode_valid() to check these bounds when evaluating
DPAD0 outputs, returning MODE_CLOCK_LOW when the pixel clock falls
below mode_clock_min and MODE_CLOCK_HIGH when it exceeds mode_clock_max.

Populate the pixel clock limits for both the RZ/G2UL (R9A07G043U) and
RZ/G2L (R9A07G044) variants to a minimum of 20875 kHz and a maximum of
83500 kHz.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Dropped per pad limits
- Updated commit message to reflect the change in approach.

v2->v3:
- Moved clock limits from device_info to output_routing to allow
  per-output constraints.
- Updated commit message to reflect the change in approach.

v1->v2:
- Dropped storing info pointer in struct rzg2l_du_encoder as it's not needed.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 6 +++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 9 ++++++++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0fef33a5a089..1e4b9f38c55b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -35,6 +35,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
 			.port = 0,
 		},
 	},
+	.mode_clock_min = 20875,
+	.mode_clock_max = 83500,
 };
 
 static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
@@ -48,7 +50,9 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 			.possible_outputs = BIT(0),
 			.port = 1,
 		}
-	}
+	},
+	.mode_clock_min = 20875,
+	.mode_clock_max = 83500,
 };
 
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..885558eb9547 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -44,10 +44,14 @@ struct rzg2l_du_output_routing {
  * struct rzg2l_du_device_info - DU model-specific information
  * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
+ * @mode_clock_min: minimum pixel clock in kHz
+ * @mode_clock_max: maximum pixel clock in kHz
  */
 struct rzg2l_du_device_info {
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
+	u32 mode_clock_min;
+	u32 mode_clock_max;
 };
 
 #define RZG2L_DU_MAX_CRTCS		1
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 0e567b57a408..56220139a149 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -50,8 +50,15 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
+	struct rzg2l_du_device *rcdu = to_rzg2l_du_device(renc->base.dev);
+	const struct rzg2l_du_device_info *info = rcdu->info;
 
-	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
+	if (renc->output != RZG2L_DU_OUTPUT_DPAD0)
+		return MODE_OK;
+
+	if (info->mode_clock_min && mode->clock < info->mode_clock_min)
+		return MODE_CLOCK_LOW;
+	if (info->mode_clock_max && mode->clock > info->mode_clock_max)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
-- 
2.54.0

