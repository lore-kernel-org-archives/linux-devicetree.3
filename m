Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729492;
	b=VSF4ZtPY0sz/H7lpBHmpGhJUChm6TXlhDLtd7EGoI0oh66GNA0pEsz3sHSFKakOaQJ7q
	 RK3MTM4WcfZsrJrcJEi+r9cBlUu8HDvFEZIzHseBo3NEmC0c3kfzd0YgTZqDLQmNrj2aX
	 wW40oW1efWJvkDVSAukay2X57BqzwrlJ251dlzqdkwKznRcU4HMLAGyRzgV9CwQxpNV0W
	 Ozx03Vhb9QCbq1tLvS7K5ylTrEeOrkjPyTt5DuIQ577fZuE1IOzZ7W+ieXVPp6SG6ViKo
	 4uCVsPAyQUg9rBc47cnekqSrLuO5wPQEhueUdhMPH0u+GH2OL+w+0a1vV21Kl8DrgHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
	b=pmulhFKg3/z3D3YI5UTzRZ6aw/JJ+KkYjf8BffDcKSDR5QBSbc7Ueqr/CdxmDDf0Vbki
	 iAOBG91LVLy0LjLajZCXeop9FD6GrQfLH1VPrnqpYUfjaAicSeBSbJIoi7Lqfx4ezKEa9
	 Ho1+0iVXJCvy2CRcE8QzzgMO6nsKvSljkgIFcSkH4+jzUbPH0OjbCWp42jfgqH7WZZpCw
	 0GNC1sHqA4ARU9OLkqtWLE88cbusUHNNjBull/vXmZk8mTft87xAvWmGolgWpSdnib+s9
	 hC506eMSIpYxl2byKQHkmT4rCl/EgXVAFnhD7u9PniZZ2nDUbXnSHxBr6KkvTQanBlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKtNbXei;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685960A2628
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4685960A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKtNbXei
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso53633975e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729491; x=1796334291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
        b=qKtNbXeil35KMLpy7Naa/w5DSyVtCdRy/WdIPRGurKV2J8jaVFVgqtne08azwhhR3S
         PJyzvSp9CTQJZqZsxhpiT77N7Sob9YaxOjtsoJCo6lq4dUM01qGsBFtyn3VwO1n9mYQn
         psxkOumX+QITPvxkNnpzKPuQev5GoUhjv/tNyW6P9JCJbqm31hS6tAB+ypEF1JRFH8pn
         AxnEZid3OmH087UaAPi2H/48Il+aBPDBsnNcmFdZ0JEK7yF3R8ebFIsYUMM7DxHhSjOd
         8g3RjLbPSdq4wB+znfRUoFE3hO45u1ElabBxq8MHVdVnr5mBc73s3cBsWjvD6DdsXY47
         F+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729491; x=1796334291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P76Q0BIWW49mfVcn/szQiqY9bRx9gZaAhLyuvCUuy10=;
        b=tIHvsChyb13gAhOfkC9gWD1o1BPPYxWseD+05X6A4KrY3HKueO2nr+mR4MuJRYMxnn
         ZPmg6zKRu6Mz2wsjrKl4PMO9ICoDKsOXHJARHl3pGeEDiwfXUe0vnp6lvrsO+tXy2QpE
         RgUdArpDSUfo9EJus2+J/++99KjXP200S5njiuLs9QlVaodbVJYDWr6yZg0gmJko/hRT
         MaLg4DmfDwY7LdVEfzA2Q7R8q5KC8hJlbbuM1Ewji1oovHw9rYy/0MwuDDaF86BIHINZ
         J/askcrjk6vBs1AWFWlMoemIoOTQtPnJ/BR1DgwIJMMwkCXlPipJB5UKiif/H7lf8SFZ
         5Kwg==
X-Forwarded-Encrypted: i=1; AL+hErFMj+uEtqjhGNixGiwpgQh9uMGwBTQa526Dktz50e6Ywy5XCgOfNMOvigJAClZuj5BMgeSOxjlX1ioW@vger.kernel.org
X-Gm-Message-State: APuU4Z9YekJYinX+H38Ko3jQ8If/AvjCh+fA5nvc3T0DDUdDZv48juR+
	z39EAFi1hCyNE2zPamvEA/eVd81gGw0O6CDU2oPiS/Yy+9ibSwVgbj+Y
X-Gm-Gg: AZFdTZfm0ZKLgYRCJswWmCZSiTvd9DS9sTzx/dCdTZXJ5DElaE9RGP4KapB6S2b+NNv
	KqU2vwTsFqeTAycKGUhRyVwT7aps0NyRoMJqR6eTLw5kYydNu1oFFVEy2Jevx0MLzxuBPLI5pAV
	zg4tj6Rxy6ZAM7KNg+Oi0OuXZsE+1dWCcoOVGStIc6cfCLDt2O7fWr1boENFrXPVcB+thR9AQJh
	6Eca9zvtmCbhmgTc8lRy8E78cfEXCb3P3WHYRmu520tH6M29ZdttzWtMrl9YfNJxy9YQYTHJOci
	8eVc256CWVLa/NPbAo51b7aLzOolzH1QCTFf75UYfkLK1pOVR7MjU/6HpEdA0pFwkoyVb3yYG8Q
	tLXwf4nnQAtdmyJmYqf1AMZCfoxwiUUCTxoXt3710WwH6uv+bdKC3slgr+UxFDp15wTTgIj3Yzh
	RdXzJz3GlUMUDFnsL5qqWttRrvuaY54xlDvfhSG764xe34149KZbQxYjGQozgYOBQid3d7NaFrk
	OXgyTk5FBW/lds6iJw2JcLiXxvMoker8htk7dhpdU1zg3P/ciEKPTmxCvMDBRL+GTJxT3R/Rn6I
	qMAZRZt7ABFs1nZi+9ANJ0xxu5pyzO5AMaRslSOJ04bKbUHUFp/5e97I6q1vjBieNOby26FssMH
	sAerUVjPnx26N+vV2W1mJBfgvZcuMh9b/amaJgggR6h2EWruCwDZ9I/m/TGsHJ9qVGwlpgJrET1
	06EWatgJ5AaIbOS5pGlRZ/pQ1gbXDzsrOoqk4JqnYHAbSyLUwDBMbNwadSqg3qp3Ppl+UePwhbk
	uz9YzUR9UgeyLrLndboiMYFjzQiG4J41Ho7+b+vVQ==
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr445462945e9.17.1795729490644;
        Thu, 26 Nov 2026 13:44:50 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:50 -0800 (PST)
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
Subject: [PATCH 08/11] drm/sun4i: Add support for H616 HDMI PHY
Date: Thu, 26 Nov 2026 22:44:30 +0100
Message-ID: <20261126214433.3562326-9-jernej.skrabec@gmail.com>
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

H616 HDMI PHY is a standard Synopsys HDMI 2.0 TX PHY, like on H6, but it
needs its own configuration table. Values are taken from the BSP.

The BSP also sets undocumented bit 15 of MSM_CTRL at 594 MHz. 4K@60 works
fine without it, same as on H6, so it's left out.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 170 +++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 0d284804e11f..8bef4806c65b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -124,6 +124,165 @@ static const struct dw_hdmi_phy_config sun50i_h6_phy_config[] = {
 	{ ~0UL,	     0x0000, 0x0000, 0x0000}
 };
 
+/*
+ * Values are from the BSP. Like on H6, PLL settings depend on the TMDS clock
+ * band. The BSP has its own values for CEA clocks, which also apply to
+ * their 1000/1001 variants. PLLGMPCTRL is always 3.
+ */
+static const struct dw_hdmi_mpll_config sun50i_h616_mpll_cfg[] = {
+	{
+		30666000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2153, 0x0003 },
+			{ 0x40f3, 0x0003 },
+		},
+	},
+	{
+		36800000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2153, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		46000000, {
+			{ 0x00b3, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		61333000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x40a2, 0x0003 },
+		},
+	},
+	{
+		73600000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2142, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		92000000, {
+			{ 0x0072, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		122666000, {
+			{ 0x0051, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4061, 0x0003 },
+		},
+	},
+	{
+		147200000, {
+			{ 0x0051, 0x0003 },
+			{ 0x2145, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		184000000, {
+			{ 0x0051, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		226666000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
+		},
+	},
+	{
+		272000000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		340000000, {
+			{ 0x0040, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		593400000, {
+			{ 0x1a40, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		594000000, {
+			{ 0x1a7c, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
+	},
+	{
+		~0UL, {
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
+		},
+	}
+};
+
+static const struct dw_hdmi_curr_ctrl sun50i_h616_cur_ctr[] = {
+	/* pixelclk    bpp8    bpp10   bpp12 */
+	{ 26995000,  { 0x0000, 0x0000, 0x0000 }, },
+	{ 27032000,  { 0x0012, 0x0000, 0x0000 }, },
+	{ 30666000,  { 0x0000, 0x0000, 0x0000 }, },
+	{ 36800000,  { 0x0000, 0x0000, 0x0008 }, },
+	{ 46000000,  { 0x0000, 0x0008, 0x0008 }, },
+	{ 61333000,  { 0x0008, 0x0008, 0x0008 }, },
+	{ 73600000,  { 0x0008, 0x0008, 0x001b }, },
+	{ 74175000,  { 0x0008, 0x001a, 0x001b }, },
+	{ 74250000,  { 0x0013, 0x0013, 0x0013 }, },
+	{ 92000000,  { 0x0008, 0x001a, 0x001b }, },
+	{ 122666000, { 0x001b, 0x001a, 0x001b }, },
+	{ 147200000, { 0x001b, 0x001a, 0x0034 }, },
+	{ 148350000, { 0x001b, 0x0033, 0x0034 }, },
+	{ 148500000, { 0x0019, 0x0019, 0x0019 }, },
+	{ 184000000, { 0x001b, 0x0033, 0x0034 }, },
+	{ 226666000, { 0x0036, 0x0033, 0x0034 }, },
+	{ 272000000, { 0x0036, 0x0033, 0x001b }, },
+	{ 296700000, { 0x0036, 0x001b, 0x001b }, },
+	{ 297000000, { 0x0019, 0x001b, 0x0019 }, },
+	{ 340000000, { 0x0036, 0x001b, 0x001b }, },
+	{ 593400000, { 0x003f, 0x001b, 0x001b }, },
+	{ 594000000, { 0x0010, 0x001b, 0x001b }, },
+	{ ~0UL,       { 0x0000, 0x0000, 0x0000 }, }
+};
+
+static const struct dw_hdmi_phy_config sun50i_h616_phy_config[] = {
+	/*pixelclk   symbol   term   vlev*/
+	{ 26995000,  0x8009, 0x0004, 0x0232 },
+	{ 27032000,  0x8009, 0x0007, 0x02b0 },
+	{ 74175000,  0x8009, 0x0004, 0x0232 },
+	{ 74250000,  0x8019, 0x0004, 0x0290 },
+	{ 148250000, 0x8009, 0x0004, 0x0232 },
+	{ 148350000, 0x8009, 0x0004, 0x0230 },
+	{ 148500000, 0x8019, 0x0004, 0x0290 },
+	{ 218250000, 0x8009, 0x0004, 0x0230 },
+	{ 288000000, 0x8009, 0x0004, 0x0273 },
+	{ 296700000, 0x8029, 0x0004, 0x0273 },
+	{ 297000000, 0x8039, 0x0004, 0x022b },
+	{ 340000000, 0x8029, 0x0004, 0x0273 },
+	{ 593400000, 0x8039, 0x0004, 0x014a },
+	{ 594000000, 0x8029, 0x0000, 0x008a },
+	{ ~0UL,      0x0000, 0x0000, 0x0000 }
+};
+
 static void sun8i_hdmi_phy_set_polarity(struct sun8i_hdmi_phy *phy,
 					const struct drm_display_mode *mode)
 {
@@ -626,6 +785,13 @@ static const struct sun8i_hdmi_phy_variant sun50i_h6_hdmi_phy = {
 	.phy_init = &sun50i_hdmi_phy_init_h6,
 };
 
+static const struct sun8i_hdmi_phy_variant sun50i_h616_hdmi_phy = {
+	.cur_ctr  = sun50i_h616_cur_ctr,
+	.mpll_cfg = sun50i_h616_mpll_cfg,
+	.phy_cfg  = sun50i_h616_phy_config,
+	.phy_init = &sun50i_hdmi_phy_init_h6,
+};
+
 static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-hdmi-phy",
@@ -647,6 +813,10 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-hdmi-phy",
 		.data = &sun50i_h6_hdmi_phy,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-hdmi-phy",
+		.data = &sun50i_h616_hdmi_phy,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.43.0

