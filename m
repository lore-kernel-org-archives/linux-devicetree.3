Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745303;
	b=fDEMb7PCKNssyb5FOZGwkSEqdr8eE5SQwqUycu+Uqeb3pNNPJVtL9FD++S1rCuH0+FvJ
	 Zh3Vl+OArfKpZc3NM0obonR3mg0fsca/WV4N0SA7gdbyjquKlfUQDHjksbsj61mYRC7Al
	 CkBYkrREOe1RU1FghWlmdlUqxosJ+6qBR1U0CO9PYviEobGXG5yIvbuBNZum6oamfBnuK
	 rQ9Cn4I2G+48iy46SVC+B6ue+QP3rJa9z9kRElAcEtk930zt0+by31KwNpPpV+0upV5IL
	 KT4cvLkeDeKSWmoL9jgu1Q82YdL7vW/CuFOYZwmE3iVPCJitcCACuw6rDr/Bny2gt1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XhodWS1aWkSeFvJLIKsGNbnaDQgoaSu4UhdyHeAK+6E=;
	b=2iGz3URQiFoNBaeCUafgZSw8Ngpdu/RPlKOmQzyr1eCaKksQA+fOMhvyKcC9rWoZaIWd
	 U4Xbv2DK190nv5YDPWaukTXpk2ZBXGpFqjgbWzxuM4xP+ii73QSJ0/SQvBIP5ZAccpAWd
	 yLe+O3CNliiqA10yAv4q+FFxe38O8tZdBhpMrea6T1U7VZgXUGnwGKL8XEIbQXs1ozeQX
	 pdp1Cymrr/U5RUCe5Wba2WxNa+0VdudUmom1zlpZFeOLTDjGFsXgsfRU6VijfklcamEzs
	 /oHbVSGsVrXzhtnwK6KU/bQHIxTQJ4nw6uDCmpo0qmv4yHHDBE7uJNmD0eXh5BlujcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=swRdGaG5;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC40D606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC40D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=swRdGaG5
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso72685535e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745301; x=1796350101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhodWS1aWkSeFvJLIKsGNbnaDQgoaSu4UhdyHeAK+6E=;
        b=swRdGaG5Dxnb+2MKGWucidB/TKMIKiA2OM8GDVQgDwy8oAvIF1GZ4jCFGH7u/izZsP
         HfmamVbSHFbYSo+eFNXfjc0JlkUI510ue9nBmPqyWI3rpC16VFGmw79l18gIxM79CXoO
         brBeRh1CuNj1VYFJg/xtZqVb9YDK2boPQiPUFXwN8ct1F1RNFx1rwPHsku/FcN7HrAnp
         1Wq07kWz9feUYAqGKJkH+fu8EzpmlR5NzsS9ubFlDihYnnRyqunJtB0KU4WOJuWQow8z
         o+QdTR04LFIjLuwOZoQYAjx8U3Asz04/JJA3ZSRUs2DAcmcgwEnsVfgUPTZ8YncGDpN+
         +GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745301; x=1796350101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhodWS1aWkSeFvJLIKsGNbnaDQgoaSu4UhdyHeAK+6E=;
        b=RiXwZgU9On5QCJyar00BY0T5OsuVm5bnA1bYOlySgspudFURjgPSC1K+AG99vYJFeV
         WoMnqSvwVBqtnE7DcMkzdti7peFXwKamwEgJgdyCMH+RZkH+8YJPYiBe0CUBgynO955H
         3c0R2mbq4tdbBWSyo3NcDEPmG1mANa4+oa1aozohAKIhNTLylqM0GlNcV2K7VDviNMd3
         xbo554yX4zGiF2dimOl+T9RkjnE9HIfnzBIYnbZCN/0dTq1Z14D/yYKVmcrUmoBsdzb3
         3r/teOzWRUzVuyj6JWPO7NMESE5QhAvGpGOD0ewjCxetdnreHvi++HyJjFy6INUo6wNp
         IT1Q==
X-Forwarded-Encrypted: i=1; AL+hErGOBJjnlm1OkE0J1fRXlJVN8ANtSr3oJJ7YtqmfdetVDpsHdCHfqypg1xpJLvkOzgfcTyQLnWkfzaNZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/h6DQDyRKZqgNkKDcFHJNb39JYyyLphNbZIaM7oorL3ehhclRy
	jxc34bCktg533zs7ql/6LjJ/YvTMF6TUzB+RERYCQaO/5v1r8iG6SmfR
X-Gm-Gg: AZFdTZfIwGAqDoT25RhgNOaclE2GUkDLToMRHYwWTVUgkBo3A9uKxCYcTgtqfqrDG+w
	eLITcsLd3jAkMNKq4bCpOOdMBblKEgdc1ZWPksTpu+hSdimsV5qFXFbcjyYNnlmD88wt2T/9XhM
	trbxdpvp9kxczagiPA+EOHEM5831MSaapK6odwyUD1WRuVlBbQotRtWOQOhEsx2lEo4PFjN8hhj
	31nhcJ2Eiy3qKDRfyZyyUQdOGz34hNXhzm3+hlhOHmxo1QnqVTBawLaJwGCUSFLSczrN32tItGZ
	A2V3GasLGDYFDc9VrUs5HzhszVX+4lGwR70OhtusI+WlBmoGoKV5HrkHEdjQtk7ioZgT40yxBls
	StQltOVD6D9yIbOFuddQOz30rePNJBoxRikE0PN86UJJZoyzT4ua8DA7g7TawW7emSWY2zg92cb
	hIzNT68VovbJ+6R22WscJMLddtwcQRizlGrn9QBL7aO1jCIGRaSBAiaQY8dMo2BzGHVaXzxE1rC
	qGLaGxFzq+/e3ak4NYlR/K2eE3x/lQXCtz/tSCANfcm/3b90C51FMzntvvs5c2p3vrWA4im1lox
	YZ0Y6RalspAWAXTSQ/JjQpNB59TUqGiu8YUoAvwwsW0OpdW1xmatj43Aj8PhQQwcE2G+g9Kejeo
	RB98q3yfcnru9k5RI/2tQ2KpCwDau7oiiKTRn8vKkGNYblx8cEcf3GjBlGRhj8vSL1VI=
X-Received: by 2002:a05:600d:8449:b0:4bb:8e95:8ce1 with SMTP id 5b1f17b1804b1-4bb8e958ce4mr325490295e9.23.1795745300965;
        Thu, 26 Nov 2026 18:08:20 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.20
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
Subject: [PATCH 4/4] drm/panel: st7701: add the Miyoo A30 panel
Date: Fri, 27 Nov 2026 03:08:15 +0100
Message-ID: <20261127020815.1621790-5-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld (Allwinner A33) has a 480x640 2-lane MIPI-DSI
panel driven by a Sitronix ST7701S.

Its init table, taken from the stock kernel, doesn't fit the encoding of
st7701_init_sequence(): byte 0 of C2 (INVSEL) lacks the 0x30 bits and
RTNI is not derived from htotal. Send it as-is through the new
init_sequence hook.

The stock configuration runs the panel in non-burst video mode with
sync pulses and without EoT packets; in burst mode the picture is
unstable and the colours are wrong.

Timings and size are from the stock configuration: 23 MHz pixel clock,
htotal 560, vtotal 684, 43x57 mm.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index f288c8c8aab8..a87da36dc60a 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -421,6 +421,64 @@ static void dmt028vghmcmi_1a_gip_sequence(struct st7701 *st7701)
 	ST7701_WRITE(st7701, 0x3A, 0x70);
 }
 
+static void miyoo_a30_init_sequence(struct st7701 *st7701)
+{
+	/* Vendor table, from the Miyoo A30 stock kernel (default_panel). */
+	msleep(200);
+
+	st7701_switch_cmd_bkx(st7701, true, 3);
+	ST7701_WRITE(st7701, 0xEF, 0x08);
+
+	st7701_switch_cmd_bkx(st7701, true, 0);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_LNESET, 0x4F, 0x00);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_PORCTRL, 0x10, 0x0C);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_INVSEL, 0x01, 0x14);
+	ST7701_WRITE(st7701, 0xCC, 0x10);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_PVGAMCTRL,
+		   0x0A, 0x18, 0x1E, 0x12, 0x16, 0x0C, 0x0E, 0x0D,
+		   0x0C, 0x29, 0x06, 0x14, 0x13, 0x29, 0x33, 0x1C);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_NVGAMCTRL,
+		   0x0A, 0x19, 0x21, 0x0A, 0x0C, 0x00, 0x0C, 0x03,
+		   0x03, 0x23, 0x01, 0x0E, 0x0C, 0x27, 0x2B, 0x1C);
+
+	st7701_switch_cmd_bkx(st7701, true, 1);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_VRHS, 0x5D);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_VCOM, 0x71);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_VGHSS, 0x8A);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_TESTCMD, 0x80);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_VGLS, 0x4D);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_PWCTLR1, 0x85);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_PWCTLR2, 0x20);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_SPD1, 0x78);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_SPD2, 0x78);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_MIPISET1, 0x88);
+
+	ST7701_WRITE(st7701, 0xE0, 0x00, 0x00, 0x02);
+	ST7701_WRITE(st7701, 0xE1, 0x06, 0xA0, 0x08, 0xA0, 0x05, 0xA0, 0x07,
+		   0xA0, 0x00, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE2, 0x20, 0x20, 0x44, 0x44, 0x96, 0xA0, 0x00,
+		   0x00, 0x96, 0xA0, 0x00, 0x00);
+	ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x22, 0x22);
+	ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE5, 0x0D, 0x91, 0x0A, 0xA0, 0x0F, 0x93, 0x0A,
+		   0xA0, 0x09, 0x8D, 0x0A, 0xA0, 0x0B, 0x8F, 0x0A, 0xA0);
+	ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x22, 0x22);
+	ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE8, 0x0C, 0x90, 0x0A, 0xA0, 0x0E, 0x92, 0x0A,
+		   0xA0, 0x08, 0x8C, 0x0A, 0xA0, 0x0A, 0x8E, 0x0A, 0xA0);
+	ST7701_WRITE(st7701, 0xE9, 0x36, 0x00);
+	ST7701_WRITE(st7701, 0xEB, 0x00, 0x01, 0xE4, 0xE4, 0x44, 0x88, 0x40);
+	ST7701_WRITE(st7701, 0xED, 0xFF, 0x45, 0x67, 0xFA, 0x01, 0x2B, 0xCF,
+		   0xFF, 0xFF, 0xFC, 0xB2, 0x10, 0xAF, 0x76, 0x54, 0xFF);
+	ST7701_WRITE(st7701, 0xEF, 0x10, 0x0D, 0x04, 0x08, 0x3F, 0x1F);
+
+	ST7701_WRITE(st7701, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(200);
+
+	ST7701_WRITE(st7701, MIPI_DCS_SET_TEAR_ON, 0x00);
+	ST7701_WRITE(st7701, MIPI_DCS_SET_PIXEL_FORMAT, 0x77);
+}
+
 static void kd50t048a_gip_sequence(struct st7701 *st7701)
 {
 	/**
@@ -874,6 +932,35 @@ static const struct st7701_panel_desc dmt028vghmcmi_1a_desc = {
 	.gip_sequence = dmt028vghmcmi_1a_gip_sequence,
 };
 
+static const struct drm_display_mode miyoo_a30_mode = {
+	.clock		= 23000,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 48,
+	.hsync_end	= 480 + 48 + 10,
+	.htotal		= 480 + 48 + 10 + 22,
+
+	.vdisplay	= 640,
+	.vsync_start	= 640 + 26,
+	.vsync_end	= 640 + 26 + 4,
+	.vtotal		= 640 + 26 + 4 + 14,
+
+	.width_mm	= 43,
+	.height_mm	= 57,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct st7701_panel_desc miyoo_a30_desc = {
+	.mode = &miyoo_a30_mode,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = miyoo_a30_init_sequence,
+	/* stock sys_config: lcd_dsi_if = 0 (non-burst video), lcd_dsi_eotp = 0 */
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+};
+
 static const struct drm_display_mode kd50t048a_mode = {
 	.clock          = 27500,
 
@@ -1401,6 +1488,7 @@ static const struct of_device_id st7701_dsi_of_match[] = {
 	{ .compatible = "anbernic,rg-arc-panel", .data = &rg_arc_desc },
 	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
 	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
+	{ .compatible = "miyoo,a30-panel", .data = &miyoo_a30_desc },
 	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
 	{ .compatible = "winstar,wf40eswaa6mnn0", .data = &wf40eswaa6mnn0_desc },
 	{ }
-- 
2.43.0

