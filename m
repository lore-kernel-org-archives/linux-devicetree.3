Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F105408017
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736963; cv=none; b=dEbaQcM98mDs2sC+he+jmzHo/hz7qCfd14Jr7OJJnrUqwYoQvjcJOP/0hOptc+C/7g7NYIBD9OaAdaTY+KvM41NDCgz5Wce5F434zAopQajRqN+3CuWoAYpj3A3dAFYjCsRnup8/wdJhWovuZAZyp/vGdgCSVtcV49+8nH8oamk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736963; c=relaxed/simple;
	bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tg5ELqvN9u4l3xI1JTtNMTOJKid/HaAvMd8R9at/XmT4GsRUCx8umMvWh+tX2bFbS0bFUsP+n4hopFVwgtRfqOYr5/X3+tQQX18rLr8h+NWjBGLTjTsrfJUE3Q/NUIZn6Vi7U7zaPI+6vjHlQj6zlSty7yb5mKa9/kPjwvDW9fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NGaRvJ3p; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NGaRvJ3p"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493a287b8c1so10300105e9.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736959; x=1783341759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=NGaRvJ3pKdrzawa5CQoL2X0tGODbKMiNJ1m68rKTbe6BNTpBnrlynETqFz5kP3t882
         /lGSfikchUWVdfYyW+LTrz9ofqwhT5O/ntRiAhZw1ZLOG1YA+VVDym5rlMT77GwETCyj
         Ve8sQZoYrgnDpa+tJfKNVQ5qttmI5HT893lyieriAUtM9tPtHmhj7jM9CNezrI+sdrz9
         0u41IygVqV4eRZIUIfUnFr9cyC9B7/02kwiUhckiznXUlIjqsF5dB3z7NtK1/Sw0xrv4
         LsRZeqxQk60eIvA7kW0VJWi5j2UoCEH5sTe7oy405OeSwlzsiswNKw5UZ8luhnH3l2hv
         Hj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736959; x=1783341759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=Bo0bSz8cn9AiTaXZNWs4YUl5zrtSHV0OttagscCfYVaXkyqgjy2Ms7i3ijppSKLtgy
         k8B68bgVrA0GmEPe1HEZxwfve4YsG0VlI6QYoKr/o/C5v4aQA6I1F82n+edzuvUdmCOC
         0STGWbpKAgiXx0Y3lO1+gB1bDhY/L5m0AJl+347hGDSV0tIN4pqhroXLue8jx0SzN4Vt
         ayVo0Nf5ecdcgPPd0k9lNmF1Zc/ACKDk15//I62FC+dgp8iYqFDkfh3xlLD/IojSxY60
         ObKtBrw9Yvdxw0xifvFsGv+xDlfdy7fBWMpw8CDiPvHwWzULuZowwHBc1oska1yIRS+y
         278g==
X-Forwarded-Encrypted: i=1; AFNElJ+xDHtOarjc8SSGgLmT/cBh4Jdx6tnM7AmUubHkJlyg5eisFplQ3Ap4Gta/Z+JCnR1mzXvI30rMq5fW@vger.kernel.org
X-Gm-Message-State: AOJu0YxXs85qdS/2OCQOQiRHhi+og37Gn09zAXgBGc9lpJjtsEfUNCr9
	vAGhyz3wS26kdbGnMKRqXUzepLgZKfyfPOrcNw3phGXVaHSvBUbi/hZBLH0NTrA7Mjs=
X-Gm-Gg: AfdE7clpe8pkXpOX8zwt1HUHNhRdJTTnv6bXy1l5aJw/W3zWERV9UVdLc/vMjv73YrF
	cXR20yKsFEO+yo5Q4v5VZajboRlwEsTKtPpEWW0y/XA/WH2hayD080h80tYFEWr5QmDYoYmDE17
	HR+otbWk1mGFVt0i7vg9bL02YlRcxJt4ZuS2ZalcLUIm+5LIiDwxLXT62yzE+EERYo2SZfOlxhF
	ys6jLDB2cbieE0O15pm57bMjx01ayFtk5KJ6R69n7MP2atnAjbYkuAjEnwPW0d1wWVdbUzfJJjk
	N0T33I0by7H6tEy7Btq35QtqPMMyOndxD2frzPdOBcV2CZ4WxIyHQ8bVVnPheEOhYLiCfQySwwA
	ANoykgkAluaEA0BJ2jLrNwbUMUQLSLbFEWWye6uGFiByeylQ5ZG0sHpTk/7reEx9wXO5op4Lj2m
	sTryKxsJBsOgE=
X-Received: by 2002:a05:600c:8b30:b0:492:6eff:7d02 with SMTP id 5b1f17b1804b1-493b71dad66mr10202405e9.30.1782736958743;
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4730937e18dsm14116290f8f.21.2026.06.29.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:09 +0200
Subject: [PATCH v2 5/6] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-5-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgwCcpAim4iGNmxcdYBHSDfCGlZjMmgEkjlG
 pEgFgGXBn+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoMAAKCRDm/A8cN/La
 haOZEACnFfbvW3FhdzHAFggeUxMCHosJfDMAsVLsgX8coJCaSYo7KTr+uvuDH5zi96kgfbQFk82
 JX8sRKJemEUWdYZWWiBiqVSWYlk0LGOqL1aeqZjNYRpcHDuo+bEZSUute478X/gtGo+xF+Euqyx
 qc7ecT16wVXAGk6Ti6B14ixs+kgmoai6oyYcW7u8hhVpyfsC8+RaawD/4ng0FE5W0U5mhkAtrZU
 quu/IsG8QrFmvHaRy2b+clEQdK9t885FlCriHWlqqv6L0Sq1OLS2oyFpXmtwNpcdx3yrzPr2IIl
 +3EU7yJCxknNQh42OtSEBB+KwnCUUY/mWyQnOPihDWtxWT3Uoc3OVdJsaZdYkOL5zBrttkVmMKr
 d5E5ddcl3ChK4VuC8rjgjMhs19xua46P9haUS4YSlaXtUn3xftoXpfNwtcERxLlxVjAD37M0ti9
 ioQJ093gTZFRC7JPe6LETF2qSlneea758Jm26jQy72/2XhemfiIZUdQ1Vg9iD5zVlFvRDZ4Xv2F
 +WVGtuV6ayT1kuc/vV+VwQ8umGEzGBF5JsTxHTUjPvOxQIy5AncPF9bkWrxrG0Cilc4JNgYNZ6/
 k4f5yOMZyIOlo+C1LPERCOt0MZICSk9UBeQeyrAEqHGaL52hNAQtcQ3b2W1yVzdcy6S0YkN4Wjv
 2JBzJngCguw2AUQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On the a733 the "osc24M-32k" clock has the same gate bits as the previously
supported SoC but a different divider implementation.

Instead of a fixed 750 divider, the divider is selected based on the
rate of the oscillator. It can be seen as a simple read-only divider.

To easily replace the divider part depending the SoC, split the divider
and gate into two separate clock entities.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 20 +++++++++++---------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 ++-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index b24c8b196e66..25dd87e78eb7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -218,17 +218,18 @@ static const struct clk_parent_data osc24M[] = {
 	{ .fw_name = "hosc", .name = "osc24M" }
 };
 
-static struct ccu_gate osc24M_32k_clk = {
-	.enable	= BIT(16),
-	.common	= {
-		.reg		= LOSC_OUT_GATING_REG,
-		.prediv		= 750,
-		.features	= CCU_FEATURE_ALL_PREDIV,
-		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k", osc24M,
-							   &ccu_gate_ops, 0),
-	},
+static struct clk_fixed_factor osc24M_32k_div_clk = {
+	.mult = 1,
+	.div = 750,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
+					    osc24M,
+					    &clk_fixed_factor_ops,
+					    0),
 };
 
+static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_clk.hw,
+			 LOSC_OUT_GATING_REG, BIT(16), 0);
+
 static const struct clk_hw *rtc_32k_parents[] = {
 	&osc32k_clk.common.hw,
 	&osc24M_32k_clk.common.hw
@@ -286,6 +287,7 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
+		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
 	},
 };
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
index 9ae821fc2599..ab7b92b47f59 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
@@ -9,7 +9,8 @@
 #define CLK_EXT_OSC32K_GATE	4
 #define CLK_OSC24M_32K		5
 #define CLK_RTC_32K		6
+#define CLK_OSC24M_32K_DIV	7
 
-#define CLK_NUMBER		(CLK_RTC_32K + 1)
+#define CLK_NUMBER		(CLK_OSC24M_32K_DIV + 1)
 
 #endif /* _CCU_SUN6I_RTC_H */

-- 
2.47.3

