Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5E3C276F
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353224; cv=none; b=US7z3eR9i4xNwAJDYFL4L0kgWHZpgCMYYjNrJiE1/ZnIEzAS2Kwc/NFGzdXEDpZ/UKzMIk5w5RK2LEM74k1p6UDRKG2zZvTQBuAnxRx1Qd07NIXVD2lmO+x0l1lTVwXbT/hIY7ugZpdLSBg9U/XA1HFMtYgWifdA7lbpF0aG2ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353224; c=relaxed/simple;
	bh=+SgYs8Hj6grWe0pXXV62TelA6SnR62JorpH+u34niZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uj1zJQ9r5IKJLv1gTkw7+W9QpE0DFCptpUe1CfrZvaCY6g/3iyNZq0eLUVfaHwYHef7wmqS7AVwM4oq6bHOmmhkJG1ibXQUDy6VA5abhBvE8P4Ut7lRaduVn9I7+BswqAPnzX47nV2gTcWOYdz1dCjbzckiO8VGBdZwjQ4mBMaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4/naHhz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4/naHhz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso20553815e9.0
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353222; x=1778958022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3EJ0517xJNtY9t4icYdcJ6JRwvMjYIpIptqEEIrShg=;
        b=s4/naHhz00t359VQkDNR1RWSQl8jNXCe54zfgFk3viAOAQzvB3WE+k9pp7c39Ek+Wg
         HNj2YDYI0CzHWFE31bJU9J8deW5i3GbWp1/eqot0vm5Vpgo5JlvgvIPTdw+1BAqC7OoH
         AFdckF0HreuUIy+E5VjarzQY0KKjb8ZlQAGAZwRF/jPiyOoUgU/W0SzW3Xw0CWkcdPWW
         WEUYrh5hzO4h5y+5HFdGWog3qLkpoQClkt5K/5ZR6GcnVVKOjnzMGL/Kx/znHZ1Ldqk2
         INhx6Dlvjf35+yL9VyI6oNJwgUQoWIs31E5+xqTB7kQT6u5wYxuDBdKCJazy8iyXDU+0
         xFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353222; x=1778958022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F3EJ0517xJNtY9t4icYdcJ6JRwvMjYIpIptqEEIrShg=;
        b=pTL1qtUJ4Q1FYguxBfLjYL6/AMVS5kpZdhFgKBCn+mYZbZ4nhEYoSSkM+LBmVB1Pe8
         BgDUcnPS+tdPsHN7V0UuA/Dd1eD0VgfPUUhu17Iad4RyYs7Rv/NvI11ScQcLvAUCRVyw
         6Nr7W2MuuoASwKFQ7KkKbW5vIVWx1p2t2EFRbG3jRtJOPYIi28GqYt6W1QMJVu9BSIwM
         CtlvgcZheDxmXso1+7U/+8pbzR2ESzgWLIwNn5NnBviqf+LD14FBMHodNex1BqfWJs4G
         tV/EC9tcyLp65OhUKDiRoyiCn9jIqANcGOTF0TlhUzNPo2L87+f0Yfl6kupGd6Mx3kwU
         BWSA==
X-Forwarded-Encrypted: i=1; AFNElJ94B8liyL9PcnkcQvEexUP9FkBsDyEwHawuWIrYgba5bKed9hTkv9826Q/J6MpjG2HnBWh9Q0525dSn@vger.kernel.org
X-Gm-Message-State: AOJu0YxcaiLvuPkn7wFxfY5+WryjiLNgL+s2dPjMq26FZAGVOex53WZS
	DzxuHyHLg0bkGlGvTw8RUWCinEeVPTlH818jLPvVOdp0ZYUavmUyknJO
X-Gm-Gg: Acq92OF/LOuNGyZl5NXvp5HM74R9QM+g53UCUfPQO5BGNeFWoWjF2czadCQXFdnzRbj
	o9WezuinHsmogIUMahMUmS7+DF5tE9W1LlFJ0crpjO8sVqCadY9zsxc1ImXO2IDEeOWKRNUHZDy
	Y9Huf9O74TzZoXm5PgdHMctNQ2GyThxkjQr3Jfu4tq9IpTLxpVolCE0mg5jiV3BrnpZZ3GMfC00
	PWc9t6j8YTuvOtCinloIftewNT42IwNoAxbiT4WJr54I6oCOu0g116SAVqvrHMHE53BuhjbVvrs
	8nrmbFaTYlAt1ygpESyzYNP3jt0sNF4dOQXB8zJBLJTiroN++3uFeg13x+0tg7vQIdaK01Y69Cb
	pUok2gU7eLydZ5yYnuhw77fyxbKY44DnraYXo2chMAGXedBXLSulP6n1RyRV21I1BWxx4wS9qlV
	ytVJPsb7Bxsw47CtCof50p+oxVha8NFRdFJVepfQ5AFhfbMwbaPVosD2JZU3Jj3yMFbG8=
X-Received: by 2002:a05:600c:1e0f:b0:48e:51f5:2764 with SMTP id 5b1f17b1804b1-48e676c0353mr137860975e9.27.1778353221568;
        Sat, 09 May 2026 12:00:21 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:21 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sat,  9 May 2026 21:00:08 +0200
Message-ID: <20260509190015.79086-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Positions of clocks and resets changed when version 3.3 was introduced.
However, old positions still work, just by luck.

Fix Display Engine 3.3 resets and clocks according vendor driver.

Fixes: be0e9a372787 ("clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- new patch

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
2.54.0

