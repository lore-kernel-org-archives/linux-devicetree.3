Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55A3BFAD1
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596906; cv=none; b=avwmOK4VvXaZg/FFSPZcEJx/Hr0h9a7DFmZrasdzG4ErKCYJm5bby/2k/RulBMyPoQzvEerBaAaYo8hJY1I6E/AmR+7SId2SdF/lvzZz9IqfHR5b+IKZJjImihRVgg1Qi3SEaupVKR4xWNP/NineTUhaionkTzkwF8dHHUr+DeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596906; c=relaxed/simple;
	bh=GeKJpkd/j98AfhkHt5WAQ4eEE6xH9CQ1HHKJ+onSAMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JywqqWw8qtcu2/oZeQOyPAKoFi3as1f9hajPnYMfqvIy+hAPjNnBu09R/BaZ19FuETIp1bbCyKoEewNImU8eo1wbjnx0BG7sYG8EyCxqp+fVN9MrmjY0HSaxyo/StQ09Cx4tu0rLaWc2MXRs3sL6LEiXoAWzNjFo/bfi7mzqc4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCkMkerY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCkMkerY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ad135063so45702225e9.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596903; x=1779201703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgAo1QhSf4NjgO8ap5MR36rDEgMWMS95+8qq7l+7W58=;
        b=YCkMkerY9t5WFAao1RfTCg6Pj3nOxaBtmksIqJ7i28jNDNT0gMQkal67i9qnkieqyY
         u3fXabvYsHkNh1/R0ZrDFP5P5GZ+kpClR/mZ9BRrwjHfUYIWFqWeu1tG+zpqLBLk/1F4
         DbUk+AI+MVrmHIcg62mU1V8EtcuVxj9JKXu77XSEU5TixkDkfLXhLuclgY0QeJfKFJgS
         miPWZ01AUIj2T8DIQ97tGumPuTqQVpRjDDUxXKP2ZvvhMXmt9bo4QQddS4f20oYMaMLv
         GddYNOx8bax75AUsKjmmWz9W1lw7f5hb8jKrJF3/beLHbpP4mswJzY48aLpASJNdfIcj
         mOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596903; x=1779201703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jgAo1QhSf4NjgO8ap5MR36rDEgMWMS95+8qq7l+7W58=;
        b=cPzAZ16HeuyzajcYPJGqZYPbWn0TATcnW2lIVEafpJLrwC1StWLlaULcJj5BPk9y93
         EfJ0HOAV4KQpeGEBOkQB8K6mRoZYFrnAG9mio+vEONpfbvVhU5TmVm8Tv0+P1Ytvw4wa
         aZYiLyVMh+AIin0uts9Jcf+bWy2us8SfnYI3wsXXOKT4DJgqzRVp7jU51ZCiF/PUcZ8p
         i5IaH8FL48Z9XXfG2Ib8ngOD5hSsrh/JAGk8Gv/mSmZRhFUwOtFHVwg/j71Bkjjz/hqA
         l6xDmvG3G9VitCwj66qpn93taJzfembt2tBOSaNRdpxHtgqED0zgTFI6wCgT+WasMYY9
         W1lA==
X-Forwarded-Encrypted: i=1; AFNElJ8aaeYApqfXSfjLv4NOupjihdH0xRt4EwgANu8FVWYizub2x08q2yacAUkFBwQFtxuX96YISV9WtD7d@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo1nYqym1l1STf6hXnjMfHPPr6+sGzR/i+f2ePdjXM1j+C9AZ0
	iyANbqhhiCg+u4yyoDWTeGSL6nxPmHeevIhg5ibY3i5zq/z4InrkWhsl
X-Gm-Gg: Acq92OFevixFg48ClMG6UZcMvG5j1bO2ulvEgzlpc0GSsMaf2RX7Ae5xXATtmGyzcMP
	ybhB4XEdmOGr0ZPmRLu0FjfwkHFY4+UhJdeSkMTW2QJnIh3evZsEd+FYbANXfQLtpJh6HPHaivn
	XCl6Ms4nzXfBvTh3cr+8HwD6a5BdROGDrbVIx/oJ1caaZrgRV2uN/YyZsm6/xfzAm+lVp97tgvf
	Tpr66bMGT0EKGQkg630IVx5Ky9lNWURe96dhunu7mihBTjmtROYdcc9dHOW/Q4wcnUUYTnOqxPe
	OKzmEm2hpNIzcaLjxEpNakqMizMGCme/w3JUuACZzXJG/tTFhuDQeENxhRxWriUnTTRSc/yk0CU
	8A0YYesADBmg/5RliUaOWvNBkIG1jSCX5jBjroV9mferg4uNtDaRil821alDCZ4cxmHy8G5dF6Q
	ocQwh96UsPA+JgsX3z6A20EqRplTgEFucnXeTJAvptEZZ/2AN90HziAvBeGLQLNRFzKbFWi1Oj9
	uETrBIaeyAeSPcxv4JqQB1Y2sCKblj2vN44LjfHwObucw==
X-Received: by 2002:a05:600c:8908:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-48e51dd879emr325128105e9.0.1778596902553;
        Tue, 12 May 2026 07:41:42 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:41 -0700 (PDT)
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
Subject: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to per-output clock limits
Date: Tue, 12 May 2026 15:41:03 +0100
Message-ID: <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move pixel clock validation from a fixed encoder check to per-output
constraints stored in rzg2l_du_output_routing.

Previously, rzg2l_du_encoder_mode_valid() applied a hard-coded 83.5 MHz
upper limit specifically for DPAD0. This approach cannot scale across the
RZ DU family because pixel clock limits vary per SoC and per output
interface.

Add mode_clock_min and mode_clock_max fields to rzg2l_du_output_routing
so that clock constraints are expressed at the granularity of individual
output interfaces rather than globally per SoC. Update
rzg2l_du_encoder_mode_valid() to look up the routing entry for the active
output and return MODE_CLOCK_LOW or MODE_CLOCK_HIGH when the pixel clock
falls outside the declared range. A value of 0 for either field means no
bound is enforced in that direction.

Set the DPAD0 pixel clock limits for RZ/G2UL (R9A07G043U) to 20.875 MHz
minimum and 83.5 MHz maximum. RZ/G2L and RZ/G2LC (R9A07G044) share the
same DPAD0 pixel clock limits.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Moved clock limits from device_info to output_routing to allow
  per-output constraints.
- Updated commit message to reflect the change in approach.

v1->v2:
- Dropped storing info pointer in struct rzg2l_du_encoder as it's not needed.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 4 ++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0fef33a5a089..d1bc205eb5f8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -33,6 +33,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
 		[RZG2L_DU_OUTPUT_DPAD0] = {
 			.possible_outputs = BIT(0),
 			.port = 0,
+			.mode_clock_min = 20875,
+			.mode_clock_max = 83500,
 		},
 	},
 };
@@ -47,6 +49,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 		[RZG2L_DU_OUTPUT_DPAD0] = {
 			.possible_outputs = BIT(0),
 			.port = 1,
+			.mode_clock_min = 20875,
+			.mode_clock_max = 83500,
 		}
 	}
 };
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..307ae70dd382 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -30,6 +30,8 @@ enum rzg2l_du_output {
  * struct rzg2l_du_output_routing - Output routing specification
  * @possible_outputs: bitmask of possible outputs
  * @port: device tree port number corresponding to this output route
+ * @mode_clock_min: minimum pixel clock in kHz
+ * @mode_clock_max: maximum pixel clock in kHz
  *
  * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
  * specify the valid SoC outputs, which CRTC can drive the output, and the type
@@ -38,6 +40,8 @@ enum rzg2l_du_output {
 struct rzg2l_du_output_routing {
 	unsigned int possible_outputs;
 	unsigned int port;
+	int mode_clock_min;
+	int mode_clock_max;
 };
 
 /*
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 0e567b57a408..4af2ae09ff39 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -50,8 +50,12 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
+	struct rzg2l_du_device *rcdu = to_rzg2l_du_device(renc->base.dev);
+	const struct rzg2l_du_output_routing *route = &rcdu->info->routes[renc->output];
 
-	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
+	if (route->mode_clock_min && mode->clock < route->mode_clock_min)
+		return MODE_CLOCK_LOW;
+	if (route->mode_clock_max && mode->clock > route->mode_clock_max)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
-- 
2.54.0

