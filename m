Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942973;
	b=34tGbl7DCbVQCeHQGf6KEhjjpslVm2mxuERx14g5v8Thnjjv51jsxGfoeCPOWiEE0rjP
	 VXh0/wBoIRGJWBWIs0vmAHNuTb/I6R8FsJtU33/DZGuxAzinU2II/PLpOmYmCkmmwAqoR
	 w4U+k9dzY9/XeRKayNl0QwZSPKZgjY1gbVTYqYUpniSwDjnkpVTIu2bnZEl8gZ6yf+yD7
	 MyHtsHabJ+PN8sknUFNsExFa5jd1VGYNi37eBsdjDNh+rTaEDtiiAco0odMyHV+D7BDGh
	 2VX+zkUJSEd2hJS2snzt6L9DqWsDX6jByYQldJkpvajFT1HHU6wwEwj1vcmMqGndHSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
	b=ajM1AHZ4L1XWUZU4TLuj1SGby5ZGfr6OvYXxL2LwhYCfoqvdU1KWcy40PUTqhRCIHC+4
	 SiM5dbJN1H8gXyMt2Cwgwf5nY6y7kueh7syGEvTLpZ/wsUqwmjQt/YHYWR5APyBmB6l43
	 poZjraTAZkSYZjktdTGx8hAGBEMHJMqSeOO0AT+ohZAxYsHRClSmmOZjta6Em79jXZIzp
	 EHng1xXCBvlES9GCco3Mw01F0Uci39ubBG8kYfmf6uUi05V0w4vVqIQMBeL3QkZX2KQrm
	 eytjEDRqi6URKxuqjr0MU/TryJDOjSahpFGCyy+k97q7C7+iGPtq1p9y6tCUcq6BtGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MQhSiGUi;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1F606A336
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA1F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MQhSiGUi
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2057845e9.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942971; x=1795547771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
        b=MQhSiGUiKYUNjsxYbJpr2H2peA6r5L/6blxVL+o7hYSjwkW9K51Dgg8z87VH/nu6KU
         80618/BBuEQ2J91nD/FbYuADN3buxR3bYvtL2ydAsl29ILU8yYxz8J4TK5aVE4YiSZFP
         NZqTgCAklUOHG0GCZKYsI9Grxd+st2Sl9KPPwagq6sLCxpiwCfdpGavgOgN+4nkwjWX7
         olkjQKESHgYd1/or5dtLJDzahK5d9Dk4THXEg8bvZjviKMj2LwTFir9HumfUGfDN++ut
         2Nuk0hpUipZyRYZPkVRyfVWNmYO4vx7Sy3HZN0w/eclaOS8gB0JiTL17ImgkEcUTZFNy
         6s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942971; x=1795547771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSmLsRsGHKysWf9eIOoeDWnk3aBAslOlmRQvenWBQVw=;
        b=kw99jPI6UmEO/4Q2T7l6o9GkgSF6uiqH4jdQIDfQYGY9cMvjYSAy+bfdTyrkLa3Yhx
         35iRWWS8jX1nHPIyjfDhlmCKwlKg59x7rWT5ZNy49Aw3yCL3M6101Dojk7dP6oQesYVQ
         6d/WyBN9X7ixiOH7JuHhfUr9g7JyNS/yFsnRmd0flgyRMQL0LuLz7TuXTnMzCKQLOOPh
         mHZ4Ht10sebiMCP0J/kUZI0JMbuEXGzuDoXE0GnR8uWTVG6QOS4MSyU6Z882ky3k8kAT
         uA8OYatz2ThZl/hB/Pu8H6/bn+ZBM9UolT137vergJBnE9xTZm+yTBKPFKC8jT9glYze
         d6zQ==
X-Forwarded-Encrypted: i=1; AL+hErGJcf3f5PozVztVlOSOHIf2P3ZHU8WLle09WcxnmgHjAfEgskrQ5LGRJSwpIQG3aQCxZSpAx8nXFhBt@vger.kernel.org
X-Gm-Message-State: APuU4Z87Xx65iBZ1M5AP8XwS6QZc0WWG1W91iJIQXW8lUz6dMuFzjUsF
	9gfxsC4cwpo/JglQvRlBnVB4deHJgr6qI85fq0MCLZ92C+/P8EPUjJdpz9vqhtHViVs=
X-Gm-Gg: AYBFou0Z0Ywl07OUMiiafxT7b22JEckjBIx7D7VvWezcwU2m/sF68MbtK1L8ELRziZ7
	GXUacTltSxY2g5cYDyn7T3GipYAQyulGOlj6dUC6waX1GMKlwojC3R0qQ5XEcN3NCPB1HfC4Lbl
	HFsZMH8oLMOjQv39omevQgcSm+YYOfuAP4JXbgUFlE4n+q+ev9rF+jIiBEB2w5wFEYtq5an6QOU
	+fDEoH47W0bPECDmlYjW+PTfu8FEL/FvnRWnRcWbBthnZnNoAOpIu29A+Fy42UVrqF0gr8Xki9A
	uj09oBInYd2sIR476ybxjLaY+kO9VoepQNxxfnu515wYQlrqzSfpIMDOAsFOwSTQiFeJ9mVk5oY
	lI/qbehR6MyItVE+t/FI0Lf2v+lPruNXtomuh6cWnFxznaXlV+QkAKqBG0gkcIF4dHykJl0TLw3
	sL/ZMWH0n9c2wXq+VKxzIjXr+a5US27XjV3P6KaLKCXs+eavNHfJRzTzV6GJyxcXM4U1WQ7xcIa
	5tU4JC2uWcKTbHB/AwMSkSAmVw/i1lVY4y16dXHzhuyztp39gof8pUcLN7+AF3tUEm+8pD2sZlu
	HEL/aaYa/36IM4rIxMDWhhp9p5iRNqGb6aZWZKfclwYAMFKAYxYFP4lv
X-Received: by 2002:a05:600c:4fc6:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb7da26fc7mr2486695e9.20.1794942970661;
        Tue, 17 Nov 2026 11:16:10 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:10 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:04 +0000
Subject: [PATCH 3/3] clk: mediatek: Add MT8196 PWM source muxes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-pwm-clk-v1-3-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

The four MT8196 PWM channel clocks and X16W_BCLK each have a source
selector in pericfg_ao, choosing between clk32k, clk26m and the
topckgen pwm clock. The peri_ao driver models their gates as fixed
children of the topckgen pwm clock, so when a selector picks another
input, CCF reports the wrong rate. For the channel clocks, the PWM
driver then computes wrong period and duty counters.

Model the five selectors as muxes and parent the gates on them, so
CCF reports the rate of the selected input. The selection made at
boot is kept, and consumers can change it with assigned-clock-parents.
The selectors do not forward rate requests to the topckgen pwm clock,
which all five share.

Fixes: 212779900009 ("clk: mediatek: Add MT8196 peripheral clock support")
Co-developed-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8196-peri_ao.c | 38 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-peri_ao.c b/drivers/clk/mediatek/clk-mt8196-peri_ao.c
index f227a86c5d60..00873264c18e 100644
--- a/drivers/clk/mediatek/clk-mt8196-peri_ao.c
+++ b/drivers/clk/mediatek/clk-mt8196-peri_ao.c
@@ -85,11 +85,16 @@ static const struct mtk_gate peri_ao_clks[] = {
 	GATE_PERI_AO0(CLK_PERI_AO_UART4_BCLK, "peri_ao_uart4_bclk", "uart", 4),
 	GATE_PERI_AO0(CLK_PERI_AO_UART5_BCLK, "peri_ao_uart5_bclk", "uart", 5),
 	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_HCLK, "peri_ao_pwm_x16w", "p_axi", 12),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_BCLK, "peri_ao_pwm_x16w_bclk", "pwm", 13),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK0, "peri_ao_pwm_pwm_bclk0", "pwm", 14),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK1, "peri_ao_pwm_pwm_bclk1", "pwm", 15),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK2, "peri_ao_pwm_pwm_bclk2", "pwm", 16),
-	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK3, "peri_ao_pwm_pwm_bclk3", "pwm", 17),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_X16W_BCLK, "peri_ao_pwm_x16w_bclk",
+		      "peri_ao_pwm_x16w_bclk_sel", 13),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK0, "peri_ao_pwm_pwm_bclk0",
+		      "peri_ao_pwm_pwm_bclk0_sel", 14),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK1, "peri_ao_pwm_pwm_bclk1",
+		      "peri_ao_pwm_pwm_bclk1_sel", 15),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK2, "peri_ao_pwm_pwm_bclk2",
+		      "peri_ao_pwm_pwm_bclk2_sel", 16),
+	GATE_PERI_AO0(CLK_PERI_AO_PWM_PWM_BCLK3, "peri_ao_pwm_pwm_bclk3",
+		      "peri_ao_pwm_pwm_bclk3_sel", 17),
 	/* PERI_AO1 */
 	GATE_HWV_PERI_AO1(CLK_PERI_AO_SPI0_BCLK, "peri_ao_spi0_bclk", "spi0_b", 0),
 	GATE_HWV_PERI_AO1(CLK_PERI_AO_SPI1_BCLK, "peri_ao_spi1_bclk", "spi1_b", 2),
@@ -117,9 +122,32 @@ static const struct mtk_gate peri_ao_clks[] = {
 	GATE_PERI_AO2(CLK_PERI_AO_MSDC2_HCLK_WRAP, "peri_ao_msdc2_h_wrap", "peri_ao_msdc2", 13),
 };
 
+static const char * const pwm_src_sel_parents[] = {
+	"clk32k",
+	"clk26m",
+	"pwm",
+};
+
+static const u32 pwm_src_sel_table[] = { 0, 1, 3 };
+
+static const struct mtk_composite peri_ao_muxes[] = {
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_X16W_BCLK_SEL, "peri_ao_pwm_x16w_bclk_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 6, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK0_SEL, "peri_ao_pwm_pwm_bclk0_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 8, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK1_SEL, "peri_ao_pwm_pwm_bclk1_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 10, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK2_SEL, "peri_ao_pwm_pwm_bclk2_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 12, 2, 0),
+	MUX_FLAGS_INDEXED(CLK_PERI_AO_PWM_PWM_BCLK3_SEL, "peri_ao_pwm_pwm_bclk3_sel",
+			  pwm_src_sel_parents, pwm_src_sel_table, 0x20, 14, 2, 0),
+};
+
 static const struct mtk_clk_desc peri_ao_mcd = {
 	.clks = peri_ao_clks,
 	.num_clks = ARRAY_SIZE(peri_ao_clks),
+	.composite_clks = peri_ao_muxes,
+	.num_composite_clks = ARRAY_SIZE(peri_ao_muxes),
 };
 
 static const struct of_device_id of_match_clk_mt8196_peri_ao[] = {

-- 
2.43.0

