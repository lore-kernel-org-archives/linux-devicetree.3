Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729490;
	b=gJDuM10b85GH4WrTkx9fLrSS71PfKOr7qYttfijwDG9DcNSZZy/IYV4ifkOAm4S2LdgD
	 tzdtsVVTgBuobk80trrTyMEQrHq8IaOQSzw/NXHWc5grJp9DXNWRR6yjchuHwzQM0GSZq
	 848JxV2lu+LzAEIHwoiEBihkl3nPll+SXsCsBCscQKZviDljjmp/uE7fQs4kmmbBy/QJZ
	 xR4gHu2oTE6J2ozQjMlmJ07g05Q2FMCeTPJwpW6zfAOOdoxJu3lgnff0LVDHODIj2cOPy
	 37p8cCbDQr3gbGD9HiQwxcZUhCrTD7X/sqtEhZYTx2Xheob3/YbsHOoOK1n5zeuMbZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
	b=1jLq62VDbxKXKY8LjFPZMZoX0VACv0ylZI2r8NAy2Kgt91ukSOPDLurmhlKWiebNZKsa
	 lz5SnmAyvNe+OFAy2X2k2Kn4vAh59S2swm7CGSSNQmodOj+kFtGhcIFZ9+pAc4mXvRzK1
	 TWkUoMe8Q3jscpq0rkuqMSKS04eAhETbKkWlFVEsYOGzJbVdQmtCGHrReWpeLJLgRFLrv
	 pLDVYkfRQVEEodz4vGRgvGHrS/mnH1m7m5pXcffXuKBfx0/OMZQ2PhD2NCRqXvlq08brC
	 QGAnElpVSMlqKmCV+MeW2K4+PCmcbKbyScrWY6NBvoTJUKCx7N/mbl44/MbAmYcSK6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tpeY+1JD;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFCF606A685
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAFCF606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tpeY+1JD
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492690dd5daso5707043f8f.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729488; x=1796334288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
        b=tpeY+1JD7JdsK39iv7Tn0SmamSGWPwbVoc9MtOdugigAxwZ40Ja5uBxqt89+q9I2r5
         /AetbVX8x3QrgypYN3Z3lKd7zOfzb5xym/ZH5a+Q/ntnjgc37H6MjQMYutOhe8613eLF
         8fkxwg9SLhzna+wBGH9Wo4bv1R6Y6fqYU5/JpjOjA9PHolbbt5E49DnCtpIzs4Kszfyf
         rDw/2Sp+vG/D7aAoVkxUTIxW0+HjPGTWtu3Uu9tK7PHcNov6scW9d6LrrblBoKSaAk/0
         T8zJ5QsmMuRzBEmJwYVjkH8sc7OleK1OexJpgWOywkhRyUa4uRCEbUfAyLJx3MzW0nIJ
         HmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729488; x=1796334288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acaXZc4OKei2F0ZgQ8y8R54n527Bro3xiFkohRD4bNk=;
        b=MAIYwWv0ezhuadK5xpVJM7VtxAdmpWUBa4y0AK7lfJVZpU9DdMc+VaJFDNvL1s7+lg
         HllqrlI4bW35+SOkMF8jZr0qs0WtZq+/zIlMZFCfSj7lXxXAnQs84vMG3fMdSwphVGdw
         dcGIUExvHsrfpOYU9256ULNMOLEC4+a0qyb+PSWyRtdIXykSt1dE7tkEZnbkqbaOK+gv
         CSGVvQI498KVAQ/3OhXQ93gzpbbuPJsgv3r9XlW8s1NApvaCNFgadRyLTrc/QREe+m2r
         D5a05X7Ro7kq4mF47cqo0QakDr7KkpTGeP1ieoJULkc2J1SBi6vu6Ztc92qZHb73TJI+
         igGQ==
X-Forwarded-Encrypted: i=1; AL+hErF318v8j+wYmuNMx+cztjWQ0oaGtx2b1zswKOmG45u0E590aDlFzyLJvczztrnPFDLrP+98Er+1Zl7n@vger.kernel.org
X-Gm-Message-State: APuU4Z8OYVp6dFZryHKRJXPfYaKtMobxh4m6M2A02r/SlGj9HM7W2ODM
	NtZn/XaOEECp5nvrtSJ6wE2/kbb2SIsRuN4rNNeKidES430MALAsKT+T
X-Gm-Gg: AZFdTZdz9AktlYdBZU9k0FIZjDpeKJnTB6Af4wZ6TT2geHUnF+U52+J6ITw+ZXx+f0z
	RNHi8nWa7ZYx3n83XkWc6ht3rKBBULqg662ffXs7AzRtOIcl0QtRc65JdcppJoEzvrsTfszt9Nx
	Dxd5MAdVAKF46Gsn8xh2jAHm7Kb6MvbbT+p10z9DgAL+YWDyOFRVftC5JsOMpC1abkreUAxQdax
	BDgtPKs+CBESNk4Uzsn5o8RmeSQOyU4wBbNedR0eGLC8Kv+852jysbOwGaKXUBUu/uOvZBflzdb
	wRnCjFihrrPxfqzz43nME36YKlmCTf0SYUxD8XVQFOqGDaG55LG51wcZipBjf0XhQAt9BfSLKtW
	+L9uE50PkBPoNxxGoC12j9sOBFO0mKD+pI8gFQwWEE2xcnwl2ajKWWI89IWAw9+bHusJoKCeBSn
	orntIbbDg4d2dtEzpMeLtQn9q9QvVjATY4jzBtZ4tCZ4JlhflUSbI26nfsqizwUPjPgusciIWe9
	FIDXHUB84chBloZ4IdMdnL27y8/pBM+JDT3i2GYFR+w327UwZeEBgdeogHX38ngpLbHx+2xGQDd
	/YtiGcqXK9zqFfIZaXvNYSIiufNuD7jNXPwQSOytHuKrr7AvdEQ3+uUcq4Ronv0qTFK5hqvPxo4
	l33Lb4s3BK4K4qA/RZHPaioFmFOhJ8XPw41O9sllZK/1SYBRAqXu7SQH+BXXBg1+65iwzWYtIRc
	3pTO9nz2gDvKbd00ekpyEF8mpBVbVQWDeGLw1vbBXFpb8aAQN1RbN1lCMJiNc5oCeDLIp7f2feS
	+ifL6cmQ5jgzB+DnQo7pP68z7fk4GYoNuQR8GroAQ==
X-Received: by 2002:a05:6000:2c13:b0:4a7:9630:7b57 with SMTP id ffacd0b85a97d-4abb43dece6mr43971087f8f.44.1795729488089;
        Thu, 26 Nov 2026 13:44:48 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:47 -0800 (PST)
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
Subject: [PATCH 06/11] drm/sun4i: tcon: Add support for R40 LCD
Date: Thu, 26 Nov 2026 22:44:28 +0100
Message-ID: <20261126214433.3562326-7-jernej.skrabec@gmail.com>
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

R40 TCON LCD supports LVDS output. It shares the mux function with
TCON TV, so use the same set_mux callback.

Each TCON LCD has analog registers for both LVDS PHYs. TCON LCD1 drives
the second PHY, so in single link mode it has to program the second
analog register instead of the first one. Add a LVDS PHY setup callback
which selects the register based on the TCON index.

Add support for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 49 ++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 77b6026bc895..0cbd6ae66c4e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -139,24 +139,25 @@ static void sun4i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 			   SUN4I_TCON0_LVDS_ANA0_EN_MB);
 }
 
-static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
-				      const struct drm_encoder *encoder)
+static void sun6i_tcon_setup_lvds_phy_reg(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder,
+					  unsigned int reg)
 {
 	u8 val;
 
-	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_write(tcon->regs, reg,
 		     SUN6I_TCON0_LVDS_ANA0_C(2) |
 		     SUN6I_TCON0_LVDS_ANA0_V(3) |
 		     SUN6I_TCON0_LVDS_ANA0_PD(2) |
 		     SUN6I_TCON0_LVDS_ANA0_EN_LDO);
 	udelay(2);
 
-	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_update_bits(tcon->regs, reg,
 			   SUN6I_TCON0_LVDS_ANA0_EN_MB,
 			   SUN6I_TCON0_LVDS_ANA0_EN_MB);
 	udelay(2);
 
-	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_update_bits(tcon->regs, reg,
 			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC,
 			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC);
 
@@ -165,11 +166,17 @@ static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
 	else
 		val = 0xf;
 
-	regmap_write_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+	regmap_write_bits(tcon->regs, reg,
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(0xf),
 			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
 }
 
+static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
+				      const struct drm_encoder *encoder)
+{
+	sun6i_tcon_setup_lvds_phy_reg(tcon, encoder, SUN4I_TCON0_LVDS_ANA0_REG);
+}
+
 static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
 				       const struct drm_encoder *encoder,
 				       bool enabled)
@@ -1410,6 +1417,27 @@ static int sun6i_tcon_set_mux(struct sun4i_tcon *tcon,
 	return 0;
 }
 
+static void sun8i_r40_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
+					  const struct drm_encoder *encoder)
+{
+	unsigned int reg = SUN4I_TCON0_LVDS_ANA0_REG;
+	struct device_node *port;
+
+	/*
+	 * Each TCON LCD has analog registers for both LVDS PHYs. TCON LCD1
+	 * drives the second LVDS PHY (LVDS1 pins), so in single link mode
+	 * it has to configure its second analog register.
+	 */
+	port = of_graph_get_port_by_id(tcon->dev->of_node, 0);
+	if (port) {
+		if (sun4i_tcon_of_get_id_from_port(port) == 1)
+			reg = SUN4I_TCON0_LVDS_ANA1_REG;
+		of_node_put(port);
+	}
+
+	sun6i_tcon_setup_lvds_phy_reg(tcon, encoder, reg);
+}
+
 static int sun8i_r40_tcon_tv_set_mux(struct sun4i_tcon *tcon,
 				     const struct drm_encoder *encoder)
 {
@@ -1521,6 +1549,14 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 	.has_channel_1		= true,
 };
 
+static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
+	.supports_lvds		= true,
+	.has_channel_0		= true,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+	.dclk_min_div		= 1,
+	.setup_lvds_phy		= sun8i_r40_tcon_setup_lvds_phy,
+};
+
 static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
 	.has_channel_1		= true,
 	.polarity_in_ch0	= true,
@@ -1562,6 +1598,7 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-tv", .data = &sun8i_a83t_tv_quirks },
+	{ .compatible = "allwinner,sun8i-r40-tcon-lcd", .data = &sun8i_r40_lcd_quirks },
 	{ .compatible = "allwinner,sun8i-r40-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
-- 
2.43.0

