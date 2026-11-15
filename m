Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723084;
	b=sTL+QxRCtlBSe8bonf5lIWjVUY0E506PZt9QE6rgp4Tmr2CG+ocmA29zLUEughvc0kXj
	 MaSU3ETrD9vm17osiIgF8y0uOWy7qhuyWnGNIHmgMnFpHav3T6RyYjbrjbAFlufsxK0+o
	 2kRodakvbJkIiam0Iir4C+fnptTiaAOx+ZEPJ2RLWow0Q5QpTMIIg5kx6bk0AHdShtxWE
	 IkIqgzidZwJGbpqLjsenH4EKZ3uzbS2TtkYBZ2nxWBFtR1OxGDMV3S/1X0ATbLGQ9Ljsw
	 Ullkf4+14bUSz9+MVlWowWQk4Y48fJL7ZmZTVuhX7oSu8ilUA1v5/pQYU61/G1RjklA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
	b=HN9lkaKIpKRvP903HpQlIyIPSCH2xgPPzcXaQAfwJnj8OWG9KlSYp08vVnHA+JAUWyf4
	 dxCjLr2GuCwpdwK/r4H/KIVVe3JvkcaR7GpGWS0ok22Ub4rh5A8NT9Sj3p+EWjQTHZ2h/
	 mmYaV3cDseH75SErwz96X6uAo2PgSzquaZQC3M2ETq/nvDneF3A3q0/ATv4dOg0FGvlOR
	 TKf6scV4+bRfI4QLHo+aNDuZNKLh+3JR/DivnlSN+TI4TARLSuM0FkwMfeI3itjlfHSe8
	 Zm7B8JlURmbezzd3sEKZc5S2g9v/kvB1j2D34n8AYK/PEO4Uaj94TZUyxWdLhsrSYMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlTlGXIO;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD6606A334
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1FD6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlTlGXIO
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18552715e9.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723082; x=1795327882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=vlTlGXIOH7WEwDuXuI73oMjpDY1y+4bmEoL2DDdSjoaX/Gq2J+q7U/y1GObo0M41PN
         89Ps3BWtI76Eh3BSaGuOi4Bm8huVoWM7uEN/jfuSOS+8vuWNT7WpZ0VyUJQrwxjvHIAx
         AmZkh+X6uU7UQN+pj6Sjsv0thdeqR++v4H/sdHwEZyvpZ6gx3exJsEuzduW5PHaW0XtM
         B2xW7jTtfigZ4hVLLYhAUtxSjHg3hkVExtqqJAEmWC5KTwgzW/y2OoP3gf5ZmGGLQmRL
         cr5hyWG1lHEa8F/PrQ+sx9nUci3em/EVQDCtaPj0Lizy5Z87MCdAgHlXyCcUcDvpzenZ
         lAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723082; x=1795327882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=X+S/HW0nLjxFpdkSvN33MkUIDEWolggCQlbSZ1cqOilBeZil5rZCRJe0E+up/NrDYG
         aFs0GU7RQKahIZOOFxAuobL7kfk/Bi3zZjjP0YaumfoFYzTm57WysKgP8yOBYvZZvA/m
         BO/JFmyAipOliWuZY7/07qVLgC1+8zK4CxaJqM/yF+5A54LYzb8ULoZbLjSHwtOi5dP6
         TMujT266mvKoYTG7bttYdX0xP3PRJ8hS4yU78iwS19ZOqXZgHPxkO2FU5pht6aN9tqU2
         yH40DGNozzA/Sak32bWnK4KpLNk6ODu7NjleVuo5c5RhLcHDtBiVBlhjOEK4Ye61nQlb
         z1sA==
X-Forwarded-Encrypted: i=1; AL+hErEbiPOnaCkXl4rW1Q8jqRCK0SOrpKn3yTiB+JXAG3z37A4OysQRkAL6hzPi3SsG/7xjpA+iRJiSohWQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/GcInuQlVuNzKUu4Jg8DdA7PgKVXvJD09c1vMA4MCfamzysxaf
	eOjICSlnnESz4IlddDBERwVAC+nMreA7+89MZB94pPRG2KhMjH1Cl55+
X-Gm-Gg: AYBFou2kVUcR6t5sBBDy54mFHZCG6DTlK96bUFGFtfCZMMP1yve7mhiDvOz/BEQeCy6
	Bo3Q71t087xhKZCW2/2nvF56a9T3jD7em1ZUbsNvT0Ou8ZKhlbJnRgXXxqxqtmaueCKi9z5WldF
	z8gVDA35+cwjc51hFMdXybnvhdQiOlBpip0gKlVESKB/yyiLOEe3F2oMRQWsFP2xFXCj0hh0bta
	tvhDlgBtAw+LryqbML/G7heLC/zJ9xRNq/ee+JB45RasmNgN+jbtu4aDhVjBqmsZVgW5moI1SJK
	QSNyEizrbmUemrTzJAZ+9RgDoKjb27jxOAN5RtA/YQNu6R7OtB1+eftOindMS9qrycqIbmwaNsz
	0WZFy3JK/ELf4ts4+WzmaUgmzjIXypDUNZGz0FShh5ajDJIFDx5U2n2BkatYXAHDLZ1vT55kARf
	/MNfA7foz4oZ9Zg+QCBgzCzqrO8/wJ8CobZScepgNFLoGBX6/kiNlBwNjsYzUP9wtuu/RpU4WHy
	S4qQ5mx1Vik6YTB4BebnP/syIgBlDCVvZLsOy5Z5SOHS+CvjpCBqXwpWLFw5bBYR9ki56zF2sNI
	doyfQnrWahI/Wn6mSINrXMCBAFR+j8iPKtSNDqDWBlTUCPz0biAhn0pxHAS1scvTfxr25fq/Nf6
	RU1tlDCzBXTgx54JLbLGmYbyoueOdcDfnsEV5xY/Nvt4ocmjTiu33zsEdwaCSK0DvSQQBJqj9xi
	jXPHLPLosR5JezR/o5Teap8jEOxRhqwktDEDU4PCb5o19P9NHCC15ZILOGwzjiGPfE2M5mGdXC2
	GTItpWCGjCG+bi48wi17HEDvAanNeRJJMo=
X-Received: by 2002:a05:600c:4752:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb55ab2b89mr152010325e9.22.1794723081993;
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sun, 15 Nov 2026 07:10:55 +0100
Message-ID: <20261115061102.229680-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

Positions of clocks and resets changed when version 3.3 was introduced.
However, old positions still work, just by luck.

Note that DE 3.3 actually has only one bus clock, which is shared among
all cores, even though it is named BUS_MIXER0.

Fix Display Engine 3.3 resets and clocks according vendor driver.

Fixes: be0e9a372787 ("clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 39 +++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..6ec6c0dc4c26 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -36,6 +36,13 @@ static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
 static SUNXI_CCU_GATE(rot_clk,		"rot",		"rot-div",
 		      0x00, BIT(3), CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(mixer0_h616_clk,	"mixer0",	"de",
+		      0x04, BIT(0), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(mixer1_h616_clk,	"mixer1",	"de",
+		      0x04, BIT(1), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(wb_h616_clk,	"wb",		"de",
+		      0x04, BIT(4), CLK_SET_RATE_PARENT);
+
 static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
@@ -54,6 +61,9 @@ static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
 		   CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(bus_mixer0_h616_clk, "bus-mixer0", "bus-de",
+		      0x08, BIT(0), 0);
+
 static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer0_clk.common,
 	&mixer1_clk.common,
@@ -74,6 +84,12 @@ static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer1_div_a83_clk.common,
 	&wb_div_a83_clk.common,
 	&rot_div_a83_clk.common,
+
+	&mixer0_h616_clk.common,
+	&mixer1_h616_clk.common,
+	&wb_h616_clk.common,
+
+	&bus_mixer0_h616_clk.common
 };
 
 static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks = {
@@ -147,6 +163,17 @@ static struct clk_hw_onecell_data sun50i_a64_de2_hw_clks = {
 	.num	= CLK_NUMBER_WITH_ROT,
 };
 
+static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_h616_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_h616_clk.common.hw,
+		[CLK_WB]		= &wb_h616_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_h616_clk.common.hw,
+	},
+	.num	= CLK_NUMBER_WITHOUT_ROT,
+};
+
 static const struct ccu_reset_map sun8i_a83t_de2_resets[] = {
 	[RST_MIXER0]	= { 0x08, BIT(0) },
 	/*
@@ -180,6 +207,12 @@ static const struct ccu_reset_map sun50i_h5_de2_resets[] = {
 	[RST_WB]	= { 0x08, BIT(2) },
 };
 
+static const struct ccu_reset_map sun50i_h616_de33_resets[] = {
+	[RST_MIXER0]	= { 0x00, BIT(0) },
+	[RST_MIXER1]	= { 0x00, BIT(1) },
+	[RST_WB]	= { 0x00, BIT(4) },
+};
+
 static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
@@ -244,10 +277,10 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
 
-	.hw_clks	= &sun8i_h3_de2_hw_clks,
+	.hw_clks	= &sun50i_h616_de33_hw_clks,
 
-	.resets		= sun50i_h5_de2_resets,
-	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+	.resets		= sun50i_h616_de33_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
-- 
2.43.0

