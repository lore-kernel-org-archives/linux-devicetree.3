Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F793F9A08
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301924; cv=none; b=hb1lTzpGps/JG+56jia3DDpkUWashv87hqrtEEBIUCRY1kfF/iWpyOhBJEc5br2gNKRaLHlmokP5l7s7GHMRmHJVcTSexy4ueBuZlFQX5ca+DOTN3T6bthX/9JjFAWg3x5gepXeoPbF7iCVNgwDQWXqMyPzcfoDUi8wH8KegUL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301924; c=relaxed/simple;
	bh=JBCNsbbmpvOyQAHYAiNtZ0xGeCHrftQkcKapQT6A/2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PALF8MVST4iyINhF3MwAI8tZCHar+gLTxw3ExE7/vLBndFQGGrOmYDskoxGmowSWnuO6Qa9gjdBGgDX3wQ8Glg/2TTAyykBrIdo4aBHAT/lJ7C5W+VWCWON04O5bCPZUBRWJHwKPCzgBB5v/x3EHRNGeXoZyYA5ngzjfQRObnbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZI8Xz8pD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZI8Xz8pD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f633e6058so635273f8f.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784301915; x=1784906715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=ZI8Xz8pD0an2hMPOpmJnezf2BVCtomQGKnHbgVCoBL+pOoBZXXQBeiDq7x5S0gSpmK
         8ycywpyuRueymEurtYh61Jraf9B0NEG0Lim0Tx++iE13S6HekXNQ8Gkw+UHHABI9rpZl
         Vbqx2uOb00yKzDVMLAz/SP03O3JFy8dy6pGWP/WxrPXmOiJPiGE4vTLCcrXE/TcmTEHE
         nbnI8pyH335bbh9EghyhSJvFDj1nVqADP6rBfJBvyogZpIlbRNgDkcT01zXR26sPVmuZ
         cEm91DqhUq1QWE95IC39vXVTnBNVxQZ/bNHZhnCquIYbj7VLsJOuSAPhaPLLDHFjGBJe
         xrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301915; x=1784906715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjvDxGaz/+Ym5ockvfd8pkGSRzvwp3SWGNBrqT7Ifz0=;
        b=QDEhurcA3kz8031qWHbBOgMXzgOCa1ZfGgtocCG3ntUWXX8xEw7vv6R5mEvI8/yYRP
         sjF8YU+tuH2AiLCm/KOYDoCRyxa38H1kE3fumg+bw3BglgXzPDn8b7uozO5Pv9AiYqUf
         tV+cQjMWKiRjzDpKf8vFIAbgYNuI7/lLov5fHMdd5i3retjxlzDJsAkxd36U/lvCwnOl
         JwJK23xKZd7anPIBh4UfrHDRfwcsGInDOjMjtQe6cgj8d8okoI82nvVkjnpxJDOQqfgn
         XObU5Ejl6NvULKeF3hkNAEWbozAMEwRiYoaYz5TmJr9N9Aiw4wH5h8WNYKnSKqyHZBpW
         WtcA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0XCE7+sHJ14bVW8EjxBJ3XIugzcvstOPlld9PHhZ430Vl/nhbOe5oOpv7FPg+QJTT0sAzwTcPQcub@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZvL0eYHIRCmKS5jGTSozOhJj11XdNaLeu8PCb0mPFR3tuBw8
	U4pMfcvBc5NKeb0NsQQjhgiQhJurY3x81NXyk7OU05dRuV6D3BM6+Ts7l4aXHv5WIXA=
X-Gm-Gg: AfdE7cmMKT5SgH3RDZqWolk4Gb6xYw5fDaUE6b1SUFrz/3HQ1Nu5e0FOeFE7/QnjjVB
	Ew5O4OFGHxxJtSUYO/2CdhaaE4UJcIcEti9wFDE1PJfF9JpwKfbs+/mnmlUYbL9jYdfM0+y+YtR
	ZgOi2OSlgsTNTt4P/qFcV6PsqnEIF51Lr2N2W4UwlhVU1vSlUiG9FPZwNTg3b5r/M6imsbkF+yG
	crVC8BRQypiuvUXog0AMT6Ib6xgXe9uvnUldS1ofnbpmYd2NLqEs+jLP8IecB9xSSJ98xxJTNzx
	Np8qXqJVk64GwN2Q1fOEP59WtDlVd+sVQWe6hRz6e+C+wdEBEuzXAUlgDe0WFduXjwiofDQTIYu
	aB1O2JzzO6tkJK2b5z040+cbms8zjB+3yMN6erv3A1g91pkKX/V7cC7gOlmyonubeanJaghQJda
	Ez
X-Received: by 2002:a05:6000:2303:b0:47f:5291:fae with SMTP id ffacd0b85a97d-47f6233bec9mr4275709f8f.51.1784301915393;
        Fri, 17 Jul 2026 08:25:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63eeece9sm4855342f8f.37.2026.07.17.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:25:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 17:24:53 +0200
Subject: [PATCH v5 3/4] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-a733-rtc-v5-3-3874cc26abf7@baylibre.com>
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
In-Reply-To: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=JBCNsbbmpvOyQAHYAiNtZ0xGeCHrftQkcKapQT6A/2Y=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWklOUZjr7y2WuxQfFPTyrAQ07oi9okv23RLOm
 R3EG8Nkk0uJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalpJTgAKCRDm/A8cN/La
 hUtND/9gWGLRZiqsVGnuaARlPg06QXVbvSuUCKTaYB/564ePeUYI4DDA+VB8WQUs3Xzugzqx8lz
 BmHR+EzBj7XpYIQn1l9k8CVOdXwacybzEXuVQL4WMybY6xZmOK9fLWqxRNm3ZGibQGnTJQn+STw
 raYcri4xgBN8Zt3zWOI5b4Hm8q0WzyPgNUXNT0Q8VX+nj6LcytzgJR00sWp7+n5NnwW01GSNOKu
 RkKwbV4xg40BFjFVzNNtCkrPjcbpQWPQS5GxJxV5N8Wgapti+PfXYEtclRZWOw+V84Xsia8XeFD
 VjT8RBfBgHpRn/uXvSBS1tjEEPOGrmxP8bfiJAlE3MspvkXW2L4bqcZjdzlGE6osA6U8hd7masY
 Xar19j0B5DJBxAV9ZRzIjACTONt0mhLTVOMyB5QVKDiP9Zo0l6xrilWDlU9r0iyh1fM98++/xJf
 F5yUqxAPpO7ps5aMIus5NNGcrnlCEFEOha7FY35C9xjlkxljBtdm2kJZoYcui/FQpM970e3oqN9
 9KqzpEDlBNJ4GT1/Vz9uNxZiDvLAA7Rz1BTicn564gdqKl5Wr5btdDaRsZWGgLyrDaXY7/h8TaS
 ylrEyos2SqTVybeivbBU0lfvXuIdOCf4LQPCq2Tx4arDtEJZa/kVzNC2D7OqOZsxyqssY0O6KVz
 XEmvMHzAcf9nc1w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On the a733 the "osc24M-32k" clock has the same gate bits as the previously
supported SoC but a different divider implementation.

Instead of a fixed 750 divider, the divider is selected based on the
rate of the oscillator. It can be seen as a simple read-only divider.

On the A733 the gate and the divider are on different register which is
not supported by sunxi combined clocks. These element will be split on the
A733. Split them for the older SoC as well to keep on sharing the gate
definition.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
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

