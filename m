Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335528;
	b=OMRk9pv8d9sflNTl6A5M9l2pVc22ollasRfEKqVbItclBQsZ+zLeg2U+f8kQZB0PKSXI
	 0vliEfQ7T7cUJ3kpn/xc6MtXdB5pWJtnFvlZowcxV31yM5y1wmJFZqruU46M6m43WBFz5
	 s87pwr96Xq58nvDOCwWIXv9Gw4sZv22ksgZ0vZ/ulK1EiRt5sD/b5AF2xAv+tftnrLIjH
	 19LleDXEbmerfdXW1I2A0OBusMjY01ruZCXQq0LBktVPo++shVYOBqGWpOxo/Kkm5/5yf
	 Lp95ihq3gKBEf8ed7GTCy5bluuOAqMKO970pNdTuuN9VfdSwmPRVFkyaCE1TXAwlO1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JbXjqMfnvt4YseLHRKZimZ/QrsGIK2yqJbgIKnZOfks=;
	b=pE7d6+3Ra1gGNvdn7P5ivUrObWmhucKjPJSuz8Q7tTtLA5SkhcDp+RTpCAvqGuMRao2F
	 yBbxA27P4IVMetfz2XNRKGxb8IN2t/ttcidsUyYITvWbXW+FtbqMBknU8Qrdf7wumG18I
	 IAU4duwsYYQTjBOMKjbZ1MjEr0YZ1a+wzcIdOGN7un4KfyyWoMJVQTDN9G4QzvV/51HA5
	 m9PXDKbrpKC0DpcqI+YhCJE/duUSTVo7upnJYYdugIaZpOP++Uqx4Yc1It8sdJdeohxyn
	 OZin8ISewWazpFIXgBMb8bQ+z2uxlhocKwgeEgoqAMRu8IrDCmv36CraGHB9E9aJuKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCwcJTrv;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A814606A330
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A814606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCwcJTrv
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso2647789a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335526; x=1795940326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbXjqMfnvt4YseLHRKZimZ/QrsGIK2yqJbgIKnZOfks=;
        b=TCwcJTrvH8ER+Hj9H6iA4IasGf/NpB/Q5n7Dzzv0fA+hi2E0zTz/9yvZ7Pl6vScSjq
         akgBguBRJ/ziNXNkHMZWeTUppoxwX15C6E2NLBKfC+lu9sSsv8pVhTzIzc2xUN5PsXi0
         Bvid60IATLP5cyNb8A0fXc2n2lUYcvo+kj8+toPKaRuu1b/KyDG4+NDJHPhAUissZZVF
         gJuvf8hmY8UdEBdh84LO4is1NzQjsldbivjP4tWuSMmq9S9wvaMpxCIWmniroggzOIis
         /C4/FSpl9/llRAdjVsdZ3oJ817EcCCTRiOkDfONM2Xu60cN+j+s7cddzG4z3yyC02Z/w
         gDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335526; x=1795940326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbXjqMfnvt4YseLHRKZimZ/QrsGIK2yqJbgIKnZOfks=;
        b=IMFdP40SDQ0q6dDQPP0q/7H16J7YUiTcBel76IWLpFMwxduxQ0s1nHMqgVr1v66tnC
         dlsoN+a9/2qg4APa+E1l1wvGeVXCVB06o/7LQI/kFE8aufuZDiciBjk28fa8Bd4JYpc6
         1A9riw646qHd2oFhTEVXjpfxVJyqaa89M/NI/GDD+4WiS0Vx5rv9IJVsRwiN12bAndsv
         tIGJff+1xv2/jiP6qR740ys2PhCiKvU8LCfC3m1TGMeTVQA5RPYP64RYKGfdP0CPN2Ji
         q7uML4GjciT8RyFBC0/FrgU4kGnYUib0gTClHftj5fjPYllNXuEJobtuPYl+9OcCwsbR
         DHlg==
X-Forwarded-Encrypted: i=1; AL+hErGp0Xm7TSvhE5rzPffevJw+XdjbtVbfFy3DofPnZoIW0TtsI9SxDkifPpNQDgOqunKeaSClDdID37ta@vger.kernel.org
X-Gm-Message-State: APuU4Z9iNZGGj/tBZ1ALYPIvDhkIcPBfOOsxRePGfaPmtXPhYGO4NNeg
	xLjitLKpAB50jzllEmwYGShsIzcRGdlJRVIdmxru506YibKJ6EDFntEc
X-Gm-Gg: AZFdTZdNuZZ2uEWhZ/7KWpkC7qKhF1ijy7OVUOR6ncRNhFfpnoNXorxQcD0v6G08yyX
	t0kcqe8cGMhkWMSJCjF1QU1UvrB0qSpy4E+dlPLVQ3Ky5n8UX7CtEq5UdKax7EpQShNiwxc30ym
	aKh5FvFWuIXdni4bOb6Hli+ILJm6cNt/6zKciBEANBKWocx3OTTc0GEcIOPIW/1Mbix+Y0K3R96
	iWQIcx9d97zDQZjenbfcgpmkQbWFa8WiGAOTzIB1FEZf950ptpp3D8e6DROHGg5g6+4vT/UKxf1
	ntOPfZgUeg81eAcZMrHxUb7iQBb0psUeFMJeJVGlQov5y0V8WM/ESg22t7BkuK3kFchmJcSzSci
	VN8F7RjFAgJVaZp1t4lpXKYfkAH1/Kr98l3bljEJ1ppJbv/6R+6hBytPJTo9KGgxhTR1+ynOQ/8
	ZWM7sB83EH21s46HbV6N0iu6tQ02D9s7XK6mbnhC4km5zTBDM3m6oY/hAxXCSllgBztHIuKWOD7
	Y1NszOoEakR0Ys2BttkB4ieJZo8GXZsL+rQzc9ZbGgSsm76u08/wRUpQk0SdP4wTEYBmcJXTyS3
	yAvM8ZUuXQCAHgWXgZuxvA8BHxHl5n6YneRa/JCkF5bQeMbuYN2TQjKNPlihdg2hcnn5btKGBM3
	sCKxz7kh/cw==
X-Received: by 2002:aa7:d842:0:b0:6b6:e808:9703 with SMTP id 4fb4d7f45d1cf-6ba37c774camr4105257a12.4.1795335525661;
        Sun, 22 Nov 2026 00:18:45 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 03/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert to mipi_dbi_write_seq_multi()
Date: Sun, 22 Nov 2026 10:18:11 +0200
Message-ID: <20261122081820.53199-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Switch from the internal panel command-sending macro to a generic one
to improve code reuse.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 213 +++++++++---------
 1 file changed, 101 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
index 318ece68b7806..c5b59a7341d8e 100644
--- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -37,19 +37,6 @@ static inline struct hitachi_tx10d07vm0baa *to_hitachi_tx10d07vm0baa(struct drm_
 	return container_of(panel, struct hitachi_tx10d07vm0baa, panel);
 }
 
-#define panel_dbi_command(priv, cmd, seq...) \
-({ \
-	const u8 d[] = { seq }; \
-	struct drm_panel *panel = &(priv)->panel; \
-	struct mipi_dbi_device *dbidev = (priv)->dbidev; \
-	struct device *dev = panel->dev; \
-	int ret; \
-	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
-	if (ret) \
-		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
-	ret; \
-})
-
 static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
@@ -76,118 +63,120 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
 static int hitachi_tx10d07vm0baa_enable(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
-
-	panel_dbi_command(priv, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x03, 0x1f);
-	panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x03, 0x20,
-			  0x00, 0x00);
-
-	panel_dbi_command(priv, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
-	panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_START, 0x00, 0x00);
-
-	panel_dbi_command(priv, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT);
-	panel_dbi_command(priv, MIPI_DCS_SET_TEAR_SCANLINE, 0x00, 0x00);
-
-	panel_dbi_command(priv, 0x71, 0x00);		/* Ex_Vsync_en */
-
-	panel_dbi_command(priv, 0xb2, 0x00);		/* VCSEL */
-	panel_dbi_command(priv, 0xb4, 0xaa);		/* setvgmpm */
-	panel_dbi_command(priv, 0xb5, 0x33);		/* rbias1 */
-	panel_dbi_command(priv, 0xb6, 0x03);		/* rbias2 */
-
-	panel_dbi_command(priv, 0xb7, 0x1a, 0x33, 0x03, 0x03,
-			  0x03, 0x00, 0x00, 0x01, 0x02, 0x00,
-			  0x00, 0x04, 0x00, 0x01, 0x01, 0x01);	/* set_ddvdhp */
-	panel_dbi_command(priv, 0xb8, 0x1c, 0x53, 0x03, 0x03,
-			  0x00, 0x01, 0x02, 0x00, 0x00, 0x04,
-			  0x00, 0x01, 0x01);			/* set_ddvdhm */
-
-	panel_dbi_command(priv, 0xb9, 0x0a, 0x01, 0x01, 0x00,
-			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgh */
-	panel_dbi_command(priv, 0xba, 0x0f, 0x01, 0x01, 0x00,
-			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgl */
-	panel_dbi_command(priv, 0xbb, 0x00, 0x00, 0x00, 0x00,
-			  0x01, 0x02, 0x01);			/* set_vcl */
-
-	panel_dbi_command(priv, 0xc1, 0x01);		/* number of lines */
-	panel_dbi_command(priv, 0xc2, 0x08);		/* number of fp lines */
-	panel_dbi_command(priv, 0xc3, 0x04);		/* gateset(1) */
-	panel_dbi_command(priv, 0xc4, 0x4c);		/* 1h period */
-	panel_dbi_command(priv, 0xc5, 0x03);		/* source precharge */
-	panel_dbi_command(priv, 0xc6, 0xc4, 0x04);	/* source precharge timing */
-	panel_dbi_command(priv, 0xc7, 0x00);		/* source level */
-	panel_dbi_command(priv, 0xc8, 0x02);		/* number of bp lines */
-	panel_dbi_command(priv, 0xc9, 0x10);		/* gateset(2) */
-	panel_dbi_command(priv, 0xca, 0x04, 0x04);	/* gateset(3) */
-	panel_dbi_command(priv, 0xcb, 0x03);		/* gateset(4) */
-	panel_dbi_command(priv, 0xcc, 0x12);		/* gateset(5) */
-	panel_dbi_command(priv, 0xcd, 0x12);		/* gateset(6) */
-	panel_dbi_command(priv, 0xce, 0x30);		/* gateset(7) */
-	panel_dbi_command(priv, 0xcf, 0x30);		/* gateset(8) */
-	panel_dbi_command(priv, 0xd0, 0x40);		/* gateset(9) */
-	panel_dbi_command(priv, 0xd1, 0x22);		/* flhw */
-	panel_dbi_command(priv, 0xd2, 0x22);		/* vckhw */
-	panel_dbi_command(priv, 0xd3, 0x04);		/* flt */
-	panel_dbi_command(priv, 0xd4, 0x14);		/* tctrl */
-	panel_dbi_command(priv, 0xd6, 0x02);		/* dotinv */
-	panel_dbi_command(priv, 0xd7, 0x00);		/* on/off sequence period */
-
-	panel_dbi_command(priv, 0xd8, 0x01, 0x05, 0x06, 0x0d,
-			  0x18, 0x09, 0x22, 0x23, 0x00);		/* ponseqa */
-	panel_dbi_command(priv, 0xd9, 0x24, 0x01);			/* ponseqb */
-	panel_dbi_command(priv, 0xde, 0x09, 0x0f, 0x21, 0x12,
-			  0x04);					/* ponseqc */
-
-	panel_dbi_command(priv, 0xdf, 0x02, 0x06, 0x06, 0x06,
-			  0x06, 0x00);					/* pofseqa */
-	panel_dbi_command(priv, 0xe0, 0x01);				/* pofseqb */
-
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
-	panel_dbi_command(priv, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x40);
-
-	panel_dbi_command(priv, 0xe2, 0x00, 0x00);		/* cabc pwm */
-	panel_dbi_command(priv, 0xe3, 0x03);			/* cabc */
-	panel_dbi_command(priv, 0xe4, 0x66, 0x7b, 0x90, 0xa5,
-			  0xbb, 0xc7, 0xe1, 0xe5);		/* cabc brightness */
-	panel_dbi_command(priv, 0xe5, 0xc5, 0xc5, 0xc9, 0xc9,
-			  0xd1, 0xe1, 0xf1, 0xfe);		/* cabc brightness */
-	panel_dbi_command(priv, 0xe7, 0x2a);			/* cabc */
-	panel_dbi_command(priv, 0xe8, 0x00);			/* brt_rev */
-	panel_dbi_command(priv, 0xe9, 0x00);			/* tefreq */
-
-	panel_dbi_command(priv, 0xea, 0x01);			/* high speed ram */
-
-	panel_dbi_command(priv, 0xeb, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r pos */
-	panel_dbi_command(priv, 0xec, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r neg */
-	panel_dbi_command(priv, 0xed, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g pos */
-	panel_dbi_command(priv, 0xee, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g neg */
-	panel_dbi_command(priv, 0xef, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b pos */
-	panel_dbi_command(priv, 0xf0, 0x00, 0x33, 0x0e, 0x15,
-			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b neg */
-
-	panel_dbi_command(priv, MIPI_DCS_EXIT_SLEEP_MODE);
+	struct mipi_dbi_multi_context ctx = { .dbidev = priv->dbidev };
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x03, 0x1f);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x03, 0x20,
+				 0x00, 0x00);
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_SCROLL_START, 0x00, 0x00);
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_TEAR_SCANLINE, 0x00, 0x00);
+
+	mipi_dbi_write_seq_multi(&ctx, 0x71, 0x00);		/* Ex_Vsync_en */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xb2, 0x00);		/* VCSEL */
+	mipi_dbi_write_seq_multi(&ctx, 0xb4, 0xaa);		/* setvgmpm */
+	mipi_dbi_write_seq_multi(&ctx, 0xb5, 0x33);		/* rbias1 */
+	mipi_dbi_write_seq_multi(&ctx, 0xb6, 0x03);		/* rbias2 */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xb7, 0x1a, 0x33, 0x03, 0x03,
+				 0x03, 0x00, 0x00, 0x01, 0x02, 0x00,
+				 0x00, 0x04, 0x00, 0x01, 0x01, 0x01);	/* set_ddvdhp */
+	mipi_dbi_write_seq_multi(&ctx, 0xb8, 0x1c, 0x53, 0x03, 0x03,
+				 0x00, 0x01, 0x02, 0x00, 0x00, 0x04,
+				 0x00, 0x01, 0x01);			/* set_ddvdhm */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xb9, 0x0a, 0x01, 0x01, 0x00,
+				 0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgh */
+	mipi_dbi_write_seq_multi(&ctx, 0xba, 0x0f, 0x01, 0x01, 0x00,
+				 0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgl */
+	mipi_dbi_write_seq_multi(&ctx, 0xbb, 0x00, 0x00, 0x00, 0x00,
+				 0x01, 0x02, 0x01);			/* set_vcl */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xc1, 0x01);		/* number of lines */
+	mipi_dbi_write_seq_multi(&ctx, 0xc2, 0x08);		/* number of fp lines */
+	mipi_dbi_write_seq_multi(&ctx, 0xc3, 0x04);		/* gateset(1) */
+	mipi_dbi_write_seq_multi(&ctx, 0xc4, 0x4c);		/* 1h period */
+	mipi_dbi_write_seq_multi(&ctx, 0xc5, 0x03);		/* source precharge */
+	mipi_dbi_write_seq_multi(&ctx, 0xc6, 0xc4, 0x04);	/* source precharge timing */
+	mipi_dbi_write_seq_multi(&ctx, 0xc7, 0x00);		/* source level */
+	mipi_dbi_write_seq_multi(&ctx, 0xc8, 0x02);		/* number of bp lines */
+	mipi_dbi_write_seq_multi(&ctx, 0xc9, 0x10);		/* gateset(2) */
+	mipi_dbi_write_seq_multi(&ctx, 0xca, 0x04, 0x04);	/* gateset(3) */
+	mipi_dbi_write_seq_multi(&ctx, 0xcb, 0x03);		/* gateset(4) */
+	mipi_dbi_write_seq_multi(&ctx, 0xcc, 0x12);		/* gateset(5) */
+	mipi_dbi_write_seq_multi(&ctx, 0xcd, 0x12);		/* gateset(6) */
+	mipi_dbi_write_seq_multi(&ctx, 0xce, 0x30);		/* gateset(7) */
+	mipi_dbi_write_seq_multi(&ctx, 0xcf, 0x30);		/* gateset(8) */
+	mipi_dbi_write_seq_multi(&ctx, 0xd0, 0x40);		/* gateset(9) */
+	mipi_dbi_write_seq_multi(&ctx, 0xd1, 0x22);		/* flhw */
+	mipi_dbi_write_seq_multi(&ctx, 0xd2, 0x22);		/* vckhw */
+	mipi_dbi_write_seq_multi(&ctx, 0xd3, 0x04);		/* flt */
+	mipi_dbi_write_seq_multi(&ctx, 0xd4, 0x14);		/* tctrl */
+	mipi_dbi_write_seq_multi(&ctx, 0xd6, 0x02);		/* dotinv */
+	mipi_dbi_write_seq_multi(&ctx, 0xd7, 0x00);		/* on/off sequence period */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xd8, 0x01, 0x05, 0x06, 0x0d,
+				 0x18, 0x09, 0x22, 0x23, 0x00);		/* ponseqa */
+	mipi_dbi_write_seq_multi(&ctx, 0xd9, 0x24, 0x01);		/* ponseqb */
+	mipi_dbi_write_seq_multi(&ctx, 0xde, 0x09, 0x0f, 0x21, 0x12,
+				 0x04);					/* ponseqc */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xdf, 0x02, 0x06, 0x06, 0x06,
+				 0x06, 0x00);					/* pofseqa */
+	mipi_dbi_write_seq_multi(&ctx, 0xe0, 0x01);				/* pofseqb */
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x40);
+
+	mipi_dbi_write_seq_multi(&ctx, 0xe2, 0x00, 0x00);		/* cabc pwm */
+	mipi_dbi_write_seq_multi(&ctx, 0xe3, 0x03);			/* cabc */
+	mipi_dbi_write_seq_multi(&ctx, 0xe4, 0x66, 0x7b, 0x90, 0xa5,
+				 0xbb, 0xc7, 0xe1, 0xe5);		/* cabc brightness */
+	mipi_dbi_write_seq_multi(&ctx, 0xe5, 0xc5, 0xc5, 0xc9, 0xc9,
+				 0xd1, 0xe1, 0xf1, 0xfe);		/* cabc brightness */
+	mipi_dbi_write_seq_multi(&ctx, 0xe7, 0x2a);			/* cabc */
+	mipi_dbi_write_seq_multi(&ctx, 0xe8, 0x00);			/* brt_rev */
+	mipi_dbi_write_seq_multi(&ctx, 0xe9, 0x00);			/* tefreq */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xea, 0x01);			/* high speed ram */
+
+	mipi_dbi_write_seq_multi(&ctx, 0xeb, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r pos */
+	mipi_dbi_write_seq_multi(&ctx, 0xec, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r neg */
+	mipi_dbi_write_seq_multi(&ctx, 0xed, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g pos */
+	mipi_dbi_write_seq_multi(&ctx, 0xee, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g neg */
+	mipi_dbi_write_seq_multi(&ctx, 0xef, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b pos */
+	mipi_dbi_write_seq_multi(&ctx, 0xf0, 0x00, 0x33, 0x0e, 0x15,
+				 0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b neg */
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_EXIT_SLEEP_MODE);
 	msleep(110);
 
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_ON);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_ON);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
+	struct mipi_dbi_multi_context ctx = { .dbidev = priv->dbidev };
 
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_OFF);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_OFF);
 	msleep(35);
 
-	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(50);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
-- 
2.53.0

