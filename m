Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745302;
	b=dmrqBw4Th+FJyL6mQHQs1xRW7jcJvh8LMhMtOWZ4eBViYxDm36ZAEShaJUlBvgeYdUkJ
	 Ugmy2mHBKKN18ssbohHVuC+iohJaIciU/6GWRGN0YooSarVGonQbcE7rDy4/3tpl87vJX
	 d06m1AjkYV4dHy4Tu1o59CYfuNpmlzaftXHR6VKxk6Ugft7dvunb4s64fD2g3U/zMa8db
	 E0pVpAScX5yvrlu8/Pd/TFlNkLYD9iDOYMAqDeHKn6aNDWM08Zdv5yISJppGKxrq95JB8
	 8jk/Oo6NBTSUmEJ3qDuNWAyoHNTvSLlWCdSNsZjtPw2LsU0Rw1BsJXYdne/lNbx5GqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zyy33FAdfBAAQH0MmIGIDDo6N5QoH0VVbaF8njRBWYU=;
	b=D7G55g9hnTaiGGP3dQzcLEPYzIiHc8gXhrw8VZnvRtlTybHY3pZiMPqFtGdFRwCqz4fN
	 vaZKnUcNGlfB5nKxrRvBlDdS+Ra9OAw+JfpkJVkZ/QbJCAq99i6JhkerCNmW1+4aijhJ0
	 oeZ22mrHSl9b7GteOGjNpHgAeSEwJ7pVcCgYb2DURdKAk0ZmkJkSKigWQGPRfMtVmX74q
	 qDxo33hslVJ+fwWrCUMom/s023bohWIIMTGqklJ5eQnmXIeRh9I6+wCbIGqZIw2LdeGAt
	 wP3P1BFiqLzOhKhpPRXAPPYJbtHGaf/nIdX5OSp3LKRGDtgogBiOHETefYrCN80VLGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gn7nLSc3;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1545606A685
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1545606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gn7nLSc3
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a358881793so3990560f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745300; x=1796350100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zyy33FAdfBAAQH0MmIGIDDo6N5QoH0VVbaF8njRBWYU=;
        b=Gn7nLSc35VkCyfIZco7EWga20Dmbgc5BvUKpMxR3uTDZ4LFNmycaK859MP1jzlkO9d
         bbrIOEUTYHQKARwJT7PVGmh6lk5lS/PqssTrIdSMTjYbaIRpCFgtoOfsRRhhRPAKKAL+
         Kdt9kX+SNPCsg7cxamL46nnm4QTRTso04B4CQLtmFPg5x9L/f2P9bhuwWgQjInzL9jq1
         od5jBS55dX0u4nENDFzAuEnN74P0LEQaDyMtJdn2s0jLKhDd7hmSHIF9a5KmNXTGYvsS
         0oaMN9dz3okMBqljIdAZX35hvxItOEv56joIUEiVYsUc7jftptlbJJIla9V3iJ6krbx1
         TjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745300; x=1796350100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zyy33FAdfBAAQH0MmIGIDDo6N5QoH0VVbaF8njRBWYU=;
        b=qF4Tr0birhJjTCqgGFQ3ovdUXDtJLeF0Sly7HHIZF1y3R1cx6fb+Csvr5JJoNbFuhK
         zxXGE/jpafe+ZBjwxUIH3M6a7crmB1SpaA22z2YqBzRinHjcxyYig8BpoTdJ4zdzIZ4A
         HikjDywGSprz3EYNcZeCx2XnZzxVDBov08iT55+O6dvYeS3eGCf+e217Gei5EviooKwF
         68WAM3mZzI8m41q5NTnpawJ1NXvMKsHX2E455bywiTgwYZR4FI4gG61q/mECemvAH6Iy
         OMQLtkvfj4iU5M72LrTMg0SBCDqcYcM1kzubX3srRbelg4epnWptg4UE57QEdqP7z9Hy
         D3qQ==
X-Forwarded-Encrypted: i=1; AL+hErG0a0INK/irTYFMZdF92XTqfGX04+aDfOcftIBue4n1Y3Mk3qUJ3S/snjBrckVy4EHZBOppiNnHMj72@vger.kernel.org
X-Gm-Message-State: APuU4Z+xEaY++B67DmeM0GUrnsXp7f55NdZiW0DpWh6sZFw6nkJVZl+w
	OMZlNu8HILHEJxRbcFvuzv+8Y90zhOcn7CTB3SIWd/3n/TOUe3B5qZml
X-Gm-Gg: AZFdTZdD+ixFGURMejmr9g6e98RnmAx2Fb3xctbyuCuekhcdWOMPMEZ1aHw80dDGpBY
	coqBWayUvPYbKZdCGOlMSqu5Q0EJZJrfUZFre79Br6/zdrP2GFevnfeEm6A/RIhbL+ja2GoaBDA
	CCaQC66ebFFE40CC2v87kd1s5lKLMEiNez0K8zWi2owmu5iOPfrECtD3UZ5KQhceR6/v1WZCWJD
	ifLfs2BYoInxaUuv2KQVwKZgX8XDuzKUIlFBaqMvjpu+fvI998IyqhO38U9tbEPYxPZxkq5GymS
	AwEHHyoaBAufz3XCczaptFCHhSPmzo8ujKuvNcafFPS4oDom5DFZmCrpVVYjdlxEr55pJdkmVVr
	nKGgfvehKccnNcVb+p7nh3ik9dyb1dCfC2gGL+E/qRy1PEmXtMq21zDeeKz1uPSDdpuRSQnoNoQ
	yWAfOvnkvGn4Ec1H2kL5nvVCVJvmyEV4apwr1IdvJkD3sCtOc6fJXm6mG2obw2Ov6fdCXv4s5ZR
	Gt/wZ2nwPDgokyzYn4wcer4SXe/iOkYWKLbFLwfehaeOMNMTCkJAIGRsA59Vj3239s/6Uj8kjYx
	QQTTE8k5NSZDTs03syHv3mPPnJ3Wn2L6+KtVTaYt7xohhx1iZM9a9ZerHVXTNDMngYKroqt6neB
	H+dNKHortpngciANezhwxxD3d0TvEnXt2qXcNQHWW+lnjtw==
X-Received: by 2002:a05:6000:40ca:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4abb5146238mr44410235f8f.34.1795745300251;
        Thu, 26 Nov 2026 18:08:20 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:20 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 3/4] drm/panel: st7701: let a panel provide its own init sequence and DSI flags
Date: Fri, 27 Nov 2026 03:08:14 +0100
Message-ID: <20261127020815.1621790-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127020815.1621790-1-romain.tisserand@gmail.com>
References: <20261127020815.1621790-1-romain.tisserand@gmail.com>
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

Every DSI panel handled by the driver gets its init sequence from
st7701_init_sequence(), which encodes the Command2 BK0/BK1 settings from
the panel timings and descriptor fields, followed by a panel specific
GIP sequence. All of them also run in burst video mode.

Some vendor init tables don't fit that encoding, and some panels don't
work in burst mode. Add two optional descriptor fields:

- init_sequence: sent instead of the generic sequence and the GIP
  sequence;
- mode_flags: DSI mode flags to use instead of the default ones.

No change for the existing panels, which set neither.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 27 +++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 31c56eadda12..f288c8c8aab8 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -128,6 +128,16 @@ struct st7701_panel_desc {
 
 	/* GIP sequence, fully custom and undocumented. */
 	void		(*gip_sequence)(struct st7701 *st7701);
+
+	/*
+	 * Complete vendor init sequence, sent instead of the generic one and
+	 * the GIP sequence, for panels whose vendor table does not fit the
+	 * generic encoding.
+	 */
+	void		(*init_sequence)(struct st7701 *st7701);
+
+	/* DSI mode flags, when the default burst mode does not suit the panel */
+	unsigned long	mode_flags;
 };
 
 struct st7701 {
@@ -559,10 +569,14 @@ static int st7701_prepare(struct drm_panel *panel)
 	gpiod_set_value(st7701->reset, 1);
 	msleep(150);
 
-	st7701_init_sequence(st7701);
+	if (st7701->desc->init_sequence) {
+		st7701->desc->init_sequence(st7701);
+	} else {
+		st7701_init_sequence(st7701);
 
-	if (st7701->desc->gip_sequence)
-		st7701->desc->gip_sequence(st7701);
+		if (st7701->desc->gip_sequence)
+			st7701->desc->gip_sequence(st7701);
+	}
 
 	/* Disable Command2 */
 	st7701_switch_cmd_bkx(st7701, false, 0);
@@ -1343,8 +1357,11 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 	if (!st7701->desc->lanes)
 		return dev_err_probe(&dsi->dev, -EINVAL, "This panel is not for MIPI DSI\n");
 
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	if (st7701->desc->mode_flags)
+		dsi->mode_flags = st7701->desc->mode_flags;
+	else
+		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+				  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	dsi->format = st7701->desc->format;
 	dsi->lanes = st7701->desc->lanes;
 
-- 
2.43.0

