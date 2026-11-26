Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729491;
	b=nGn2SmDj1Y2vmwORAL9oegM2wcwP577GgfAMFxj+zY9Om33g5i1/ZusHUQRkwbbh34Dr
	 nFxLySiTHn31k+9VTZ7naKqp+rDniAGL32qj5VJUB3oWLdqEWKlG29CR7oE7WQz3USVsM
	 YjqJl48qc4ifKlAU03sqzJsbtqq7Bk6WeYQ88LJ5FsszRzbBjEN2kCC0w2sJwEKTrGvq/
	 NubomFh7E/w0F/vtJrJ0eqqjIcw//Z9bS+7orZugC/7UFaaOn4L6+GcEaoSG0AE+KMy/x
	 RQta4xCMi+w7eGUmXl0XNA93cfnc/CSfkvU1ER8wp/vpBmrvmtCc1Bi4iF3d6hvs1ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
	b=yDyQ686cnSvu902czSYK50YAKUSODxFz1gXQ+xmwbjHHaGyc+WiLS+s+pRDbpy3m9NzZ
	 hhWNnSN1AUjQ7L0ZjRQmlOnCnKPfxr75knvbq8nzUYvqhU+V/j6H4XaB6qVHPhWaKQTn3
	 oHBtqW56y3uSRp3Li20sxZm82UZk+S+zdw4EblEd2Or1yfAlfpirxpldsDj7hlbbllSCu
	 wyHbw7uq4nYeasoyHqx8K0qe1p2OOuIQ1lCO5YnovqMfWNJGOk4q3t0VTn29HhaMZumjq
	 aNzmB2d6G5VUhkI5LXa88S79/nVKq/HRwH2uDy1EamweR63WTE7n3iJzFOqfZJyPQzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwKl4KS6;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B76E60A3808
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B76E60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwKl4KS6
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a9be758734so4741003f8f.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729489; x=1796334289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
        b=iwKl4KS6tBb4Ht70/muqBqFScubPFa81IfWIRUCeGaMvoVfF+YqzImETSFbx0L6Rv9
         PybrGzV6vJVszvh0qhUIHiwYxOv2i+H+ltVPTjqTkBY/Q7klv+QflVz+bw965x+e+t5E
         ZmHGDminqVLqUw7Qk5eG5oCmiVmrtp4NXgmcSXnlM1fj0pvV2HK5CA8cCT8vPcDoFMzx
         4gzq9Z+oFRdqDnuz/8opvbk/zXTlQuMefM+tNSsjcgHjGWvOZQ6qSHfpEasUzaB9r8/x
         0t0sKx/NHor7gWU5gXag02542FdP+K1pzxyVbSPRYzx/fTB8rTz7UmFdPZJh8oMQDb1t
         1kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729489; x=1796334289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSd+CxRijsj4N8ajh85kl4a69YfAGH4BSJ6W5M2ec1s=;
        b=WNRps5rKCJC+2mJxOEHlY7U70Gcn7dojXz9r1Tu+sRuy8nTWDmRipTkwEvcxtMDi1P
         4xLaPjB2dnm8/XYIuIhyH6D4hR0LnJ7vGMtA+6gw9CsihBSPRcO25V17jOqTFyX10ZbO
         XzCvQvBpnDBnVQKoe1zxwm6dheQuWD0NEf8Kgq5lzPHqGBmdt4+lbIyMePRGTnkejstm
         xCZDiZh7/i4JTTxvWVSNjsTS2KnGlTjZBnNEiorPmG5dnTEvHdbnAaZ+UCP2uRhHh2Cr
         OQ+W25vSKitaJ4sGrWHNKMYlW12Fh7sJ48/qnmu/ensHPvx9nXn9fjax/ypze6iuwm7b
         cuog==
X-Forwarded-Encrypted: i=1; AL+hErH+vVPcyn4cA6g0tKhjqWtu+Utz5j7wev0PlpGrGZY0UaLRRMbOJQIrKXqbPZQBui+xEQsDmWh0gHWJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8IaxpAmBDVJyFfuwx0Mm6mTAhdDTOQ8QFin695yNIW7k0R3hww
	gM2IXynrawUx3xklf4UoUfYykuKiievUmBfM/v7zh9bwgvfaQ6MRo6AS
X-Gm-Gg: AZFdTZdsWCt7U2X2nv/OObmrOCI4VJCblYM2laa02ZPidTYI/CsVm0UsAuvy8AzVRj0
	NS5pCk58UxlStry+u+oYeLwemapqXW6UQEwmf1VCS4zFwVElb1Z//WhMEbDAjkym4lVEnjCxgKR
	fMYdzTBtDXOpbXS0nZAgUL7gMl7qzaeYvKlxk/4PVhVm2BZMHH2DpgVdSbBJoxWZbkLJKkevPCb
	Sfl+PbotLKnysW2qoeWkJx07WUeekUDcwPXgHpNI279ZUlfjwQmcOZj53DlTHKs4kk6eMpCpRBs
	rTjiM7UCGrQNHgXbG5zNCiYnggHW2HL3xbe2vkABVggfp7Qb1Ur/MvzF+E6j6bY1xvL5UCg9KD1
	+2bEhsqln3rRo95O6Luca9jgMt42KkLEQQE/6zoF7KBxI1sW0EsQcfekN85gmvqYoUM4ZJIeayj
	aX170NLyttKa70PHyzKN5ALYdwVgIAqpx0HaxfCiOI3fwLe3jgqXDYB+j1D1v6tZlSOeXDbvs7n
	UtdaOf97TQtcWhYSX1EPhkK8CGAJxdkAZbkcdsncQr4uRcagxscwUkK9HQUhr9T452yrl7/ekbr
	xSFfd110VA6Y6SMXy9ThNybl6bgP05wAA6l3V4dHOfg4SpvExIREvJdq3DQKvE+ialkj1n0CC6l
	wvdKydI4nqAk11Jd0xifwj4IwQAWOQcGASo7qQmav1DMhYisLigghd0A1MIL+p0GOa9/+hXgWDn
	fPQmB87C9L+aU1Turtsq8jJnV66ZATGK4yxV/JbYzgXcnKNt8RvCfCdCIGvyGNSWe87M5Xb/hvu
	vn6zmcb0qXGIgqk6C/B804VOxe+w8uQocjUalR8nPU=
X-Received: by 2002:a05:6000:2406:b0:4af:e519:ccd1 with SMTP id ffacd0b85a97d-4afe519ced4mr37199366f8f.49.1795729489344;
        Thu, 26 Nov 2026 13:44:49 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:49 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] drm/sun4i: Add H616 TCON TV support
Date: Thu, 26 Nov 2026 22:44:29 +0100
Message-ID: <20261126214433.3562326-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

It needs additional quirk to enable HDMI pads.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 0cbd6ae66c4e..3596537c500b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1297,6 +1297,11 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 				   tcon->id);
 	}
 
+	if (tcon->quirks->hdmi_pad)
+		regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
+				   SUN4I_TCON_GCTL_PAD_SEL,
+				   SUN4I_TCON_GCTL_PAD_SEL);
+
 	list_add_tail(&tcon->list, &drv->tcon_list);
 
 	return 0;
@@ -1585,6 +1590,13 @@ static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
 	.set_mux		= sun8i_r40_tcon_tv_set_mux,
 };
 
+static const struct sun4i_tcon_quirks sun50i_h616_tv_quirks = {
+	.has_channel_1		= true,
+	.polarity_in_ch0	= true,
+	.hdmi_pad		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON */
 const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun4i-a10-tcon", .data = &sun4i_a10_quirks },
@@ -1605,6 +1617,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = &sun20i_d1_lcd_quirks },
 	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = &sun8i_r40_tv_quirks },
+	{ .compatible = "allwinner,sun50i-h616-tcon-tv", .data = &sun50i_h616_tv_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index fa23aa23fe4a..98bee2bd96d2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -19,6 +19,7 @@
 
 #define SUN4I_TCON_GCTL_REG			0x0
 #define SUN4I_TCON_GCTL_TCON_ENABLE			BIT(31)
+#define SUN4I_TCON_GCTL_PAD_SEL				BIT(1)
 #define SUN4I_TCON_GCTL_IOMAP_MASK			BIT(0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON1			(1 << 0)
 #define SUN4I_TCON_GCTL_IOMAP_TCON0			(0 << 0)
@@ -243,6 +244,7 @@ struct sun4i_tcon_quirks {
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
 	bool	polarity_in_ch0; /* some tcon1 channels have polarity bits in tcon0 pol register */
+	bool	hdmi_pad;	/* h616 has to enable pad for HDMI */
 	u8	dclk_min_div;	/* minimum divider for TCON0 DCLK */
 
 	/* callback to handle tcon muxing options */
-- 
2.43.0

