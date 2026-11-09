Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240435;
	b=dIiHNaT/VFZQLI2PpOJCWDGp31oE2B6U/wandZgeep4S1k3NABocEW7FFSy2RifniF4D
	 4NOqpxXYDyoeNgTj2tesjQiFmpBmMqVG5uajLfh3fn6XXkFb9Q03MNKo8OD0j8rRJjN0i
	 nCzjJKnd3TIEAjI682qHl3QXatS3/aO0VshxVTXkquu3Ok7LgubvudlRLLRRwGPGjebCr
	 7rCPwa4sMRiIfYrZtQM/AnUxbrNz7HgndUHJjZ8ZBhIFXHjWZFj3I20nkI0vws07gPMiy
	 w6H10VyAjhp074H+2k+tj7CEde9HV+3n+9gHPZmmqQwrVGJPsfriGLrZQ6qszHwIpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+NgIZ94zuDgUp+uszh12oHM+e3kglPF/onpqBOfOj5g=;
	b=1+dJgYgJrbixQj9tPxb70EBUv87RvX6BpHUUxb7w35fdRuEtKODNPHkkvH0RbZdXnQOH
	 VulaMn+Ts3uG4Gr71aRexCrs6j33v/gYiQCdL+YkRJUlrZsnO7fySAi9Ej7ELgxi5JH3T
	 gfo8t43ZOEJN/O5i45cr/4+Lhz9QKDbBzhTJw1uBbYwun+d2TeNiwHRRidfGrITrvxLOr
	 d6Dsr9fpJYVZnLDSWukHYGv4wqztNZQOHDljF7/aBCruTQIt95CtDstN/Ke+hd8NLw5k+
	 sXiz5PVelZ+yTEhepNBt/80liKfs8KiFUMfaFcoKBcvfWYHkgJ47Z16pkoaRJ+Z8amQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFrFFRUK;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0714B606EE96
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0714B606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFrFFRUK
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10317185e9.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240433; x=1794845233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NgIZ94zuDgUp+uszh12oHM+e3kglPF/onpqBOfOj5g=;
        b=IFrFFRUKmrl0G5M6KzrrHVX/yiDKWpxTOMMw6wixzTS499UzgQttumJQ43svtgmzYL
         7//QeLJqEBP14PoPakszYxjFaT6qzzgJKRYp7jLfekVg8+zoQSJ00JsXbyEu/uscZVAL
         OADcjiNLJbGwMUUSEOl4nWXS9d5p8HmPdCt62zWq7nDU/57JoQcD6T4Qd8MZYIN3j0wj
         Bhnjz128jjJTYZ+Wil8+c2M81SdWYJCPcPZr9K9aB0VjqOdqjaNZmHfYyP/HCFzhXwJ9
         wVu2NU4borqXng+ThFuQkT0TmArYRkjSJA3y6Qad7ptP0tZWXMN/PJq1vAvUKS3r4FYc
         +vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240433; x=1794845233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NgIZ94zuDgUp+uszh12oHM+e3kglPF/onpqBOfOj5g=;
        b=N3CzKAjs4zTmojwtBVyQzhs4Aqdyo7xUIZ227387XjrOcXjQcfP+ozcN2YSNr+GQq9
         PpBKdnNMmiuMLzph9hXRwzuoa+Oms4+tu+75AYhEE3g40XMyCq13pjJrc/EjhiCiFEAK
         y585PSKBOYXqq+/ncg9+uQyCAbs5ymSpCG9xcvjaXB8yFCUcUpQ2KKncwt6hy9G0T5BG
         Owm+VNoS5o9vLeooU+wCD9zcaIoEq6mbYb1t3s8XPyVGx0A7q5ooVRfu0h18hesiK0rB
         2Zxl0Qd+600t4FZ8pYgiDCPjJkfPHV5gHTLWRx+xhE7o72BEYdI2CzR7m95KROA6tHal
         NpTg==
X-Forwarded-Encrypted: i=1; AL+hErHqVUpdlMA/6l3eAWY4JPTvBTyNfpbiWVpKSGIcjdpCGSfPcKhV5HJw9am1JbirKUR39WwvvboIHpLd@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qf/Z/Zwuouv5XGEg0lATvsVMSjTM/7fQfniioa8fpAVwzN+Fi
	AsNEE//tZqIOlNag6ojBNtIEhwNcPaZhU+MtZEuuQbUJkLA52DdUddG9
X-Gm-Gg: AYBFou3Iq4VNboAuRF4sV2K35NVFWF7sOmEavfzv35QwnBNkZRpBg1PUB9FPrOLsMgL
	cXwidVzlZr97iFzAmk/fc1fpoWdopPV10bWykGXXgM3gwCO6u/BSM4gBlJ3AHlcfxrM685YVBNr
	VGVMcPuOQCqa5/cqmH6GmrDJCcuflCqX3GpC1iAJTkEJeXbmDWcXVtEc6hrPgnHAsgW73SXlMmm
	ULw5P1hFQkhz1jj1qa1eeOj6RX01G2wbM7IjyGFO8MxN8Mx7VE/juyToLnBXGo5XZAx6HHxKS7U
	kT0cy/XApJV2GWssYJLiklS2B34ChWqjBVETnhoD0koZ6taFC9XUbf1M/KvyjiLNRR4B4n6ozH3
	W2ncH6xZvAKkYdSeZOJ+xBKhyTFJepMaFqW1xfUnnuvNqDGRtDZZ5DFNOCtTkz7u9cHa4fFZIGt
	rPYy4mNTo2jjIdP2dLQbbN0J73dziW6UuPGfdkI45X0oVtmKUhE5atgfpH4R5GazqwVIYgexCw6
	pAH8OaMe4MrlQaHVEk/cDtu0PIapWnefADwYxGVSARMdHCY1t+uP1viXX5eQHC/J0mOqFFtuSA7
	YJJt/uUmKBehFESTK7xalunMOQORJVUwJOlLK9SB3QxLuqsWr5YCODeaxG7FNW/xxu74X8c0MNI
	uTkngcoUie448ufj6X1iwqov+zexB785Sr47LXP5P3Ucf7+akX/djjCEk/ftn890=
X-Received: by 2002:a05:600c:1d0a:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b963c741f8mr77671625e9.20.1794240433343;
        Mon, 09 Nov 2026 08:07:13 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:13 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
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
Subject: [PATCH v2 3/3] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Mon,  9 Nov 2026 17:07:06 +0100
Message-ID: <20261109160706.2272332-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109160706.2272332-1-romain.tisserand@gmail.com>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
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

The Miyoo PocketGo S30 handheld (Allwinner A33) has a 320x480 1-lane
MIPI-DSI panel built around an Ilitek ILI9488.

The init sequence is the stock kernel's, read back from the running
stock system. It differs from the E35GH-I-MW800CB sequence only in VCOM
(0x26 instead of 0x25), the display function control (2 parameters
instead of 3) and the position of the inversion command. The interface
pixel format (COLMOD) is kept at the stock value.

Timings and video mode are from the stock configuration: 12 MHz pixel
clock, htotal 382, vtotal 524, active low sync (lcd_hv_sync_polarity 0),
non-burst video mode with sync pulses and without EoT packets.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c | 55 ++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
index 6ab8ae72abbf..29b869a6e909 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
@@ -86,6 +86,50 @@ static const struct drm_display_mode e35gh_i_mw800cb_display_mode = {
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
+static void pocketgo_s30_init(struct mipi_dsi_multi_context *ctx)
+{
+	/* Gamma control 1,2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE0, 0x00, 0x10, 0x14, 0x01, 0x0E, 0x04, 0x33,
+				     0x56, 0x48, 0x03, 0x0C, 0x0B, 0x2B, 0x34, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE1, 0x00, 0x12, 0x18, 0x05, 0x12, 0x06, 0x40,
+				     0x34, 0x57, 0x06, 0x10, 0x0C, 0x3B, 0x3F, 0x0F);
+	/* Power control 1,2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC0, 0x0F, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC1, 0x41);
+	/* VCOM Control */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC5, 0x00, 0x26, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0x48);
+	/* Interface pixel format 18bpp */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3A, 0x66);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB1, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB4, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB6, 0x02, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xF7, 0xA9, 0x51, 0x2C, 0x82);
+}
+
+static const struct drm_display_mode pocketgo_s30_display_mode = {
+	.clock = 12000,
+
+	.hdisplay = 320,
+	.hsync_start = 320 + 22,
+	.hsync_end = 320 + 22 + 12,
+	.htotal = 320 + 22 + 12 + 28,
+
+	.vdisplay = 480,
+	.vsync_start = 480 + 22,
+	.vsync_end = 480 + 22 + 4,
+	.vtotal = 480 + 22 + 4 + 18,
+
+	.width_mm = 49,
+	.height_mm = 74,
+
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
 static inline struct ili9488 *panel_to_ili9488(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9488, panel);
@@ -269,8 +313,19 @@ static const struct ili9488_desc e35gh_i_mw800cb_desc = {
 	.bpc = 6,
 };
 
+static const struct ili9488_desc pocketgo_s30_desc = {
+	.init_sequence = pocketgo_s30_init,
+	.display_mode = &pocketgo_s30_display_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 1,
+	.bpc = 6,
+};
+
 static const struct of_device_id ili9488_of_match[] = {
 	{ .compatible = "focuslcds,e35gh-i-mw800cb", .data = &e35gh_i_mw800cb_desc },
+	{ .compatible = "miyoo,pocketgo-s30-panel", .data = &pocketgo_s30_desc },
 	{ }
 };
 
-- 
2.43.0

