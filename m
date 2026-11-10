Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269295;
	b=3Z4JpojWvPykWoqKfj+/ElbylyBB+NvurwmewGfT9LTNpj2+DV40jxCGlFkgIfSJaG6E
	 HbqjZLEYmRF0HAMjcsycThaMcOlxKxS5YAJOSqF7q721cwgNCNMb5efDzLfOV3hBYl2/h
	 vrfFf2PWbTyS6e6OAP+BfEhSSYy30uzHLXxSAIxKEgIZ+ywvynbaPtFHYviniB5Bjhmjm
	 lIldFy//ziUuVOQ+oo/r2LkiiJEtmWjt2TuykA6t3M/FoxFCYIZ6NPlsrWKO2Fj3tw2p7
	 6yDZ4J6F5KNq6AO9KGuYj/JymTZ0wFzTSnqDMxKr9LIx/KAZHqbA2AvgtrbGpmfqzMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xAKv7qC2wxPIbTea23GQAKBZyNJlV9zWgrcWZRncFq4=;
	b=o6iOWW4V7+5DYMoJpweH9tlEgWKisAwfXAvlxma01odQlYpN+fq8NeaweiZ7g3GmZUM0
	 nbm5Hegl/eKo3LlT7gN6o1LhK/Cmt0XDbR95qnS8xFLEz9421/jR6R1G9ZLYq3r76gOi0
	 k2le3hXaLa5mXdG/MfDjnSeQYyP3ervLBtU4rhnyzqcxZqrQWTLSxkNveelb7wgjJv5Yi
	 1ITOHlUNpzrVEuyHuZ/KTS3QhNVigvnUU22McMsq+20kI7IANQ2CJ12jnIRmTj5BTRl01
	 ryfeEcT5TAFwfal67eEnh95bLU20Fr++02zNzCFYvxUGNMU70ov7+bgjEUKQyL5mUag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY3ZSYuM;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A760A2633
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5A760A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY3ZSYuM
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490f38e9688so1152420f8f.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269293; x=1794874093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAKv7qC2wxPIbTea23GQAKBZyNJlV9zWgrcWZRncFq4=;
        b=CY3ZSYuMj6d1KBAuZ6mSZcQGtrsjTZEfWlgaZXhTn+GsyS2D+PfZK7YizsfmWrNXZe
         Trybh+Wfbt57HwdfM/se4a4grwhRBYczTw0XyuBmuTg8cjGxf/fvPlwvE6M9XwTmEM7x
         zKA4HCgkRuTjjizqx4XElLoNhedo2ri+wxoHbWa9mVBS1l9sz0zcPLyjdqRthZ5VNZDr
         aLUCld4zrjNa46S89hjyEpVOL+H/pc5OM+QntJsZVSgbLjdzxdh0uIIMOrCIqY+Nr/Yc
         dgLfLwoff65nz07LVtf0UqFBPO7nMmh5Qr3xpg9tI2y8Sav39wdVxzkqRTAuYFytFEjf
         hZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269293; x=1794874093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAKv7qC2wxPIbTea23GQAKBZyNJlV9zWgrcWZRncFq4=;
        b=K0KMybZe6lkU6BZqEvsMLjSQA5HX9Cb3Cz3tVoabM9ztALlNs10KnXfD+YdjzJ9uwd
         s4dIat+ZzYXluvp8I8t8+Xb+aSpzA4e1UBg5NClYGKfR3CGur9f8/VnUnJOXKAHHQthv
         hPcAApXnjNST1QQz/vR3u7k8ee7rfPOvjlBG3Q1QYSyZIpMxRl40iegvrwtYoS6RNE/N
         Ki+28rBEShBcx234mLgyTl1lb0CL0N8PFAI0Jqh2rXJHQcs02YcpdUIvgIUMRjo7OYea
         71f7Acdb9gvVUlVI/Q/FIXfkKffdLGs+4zoBdjO1kJEm/OXQ6GfDbiT2EenmyOyMwzOA
         1zPw==
X-Forwarded-Encrypted: i=1; AL+hErG9wUcwPorTFVj2N72xvRZ8s5RJmeKXt7fcTkiXpv8OmBKfrdcE/n8nWf74vjbMF8jxBSk6Zfv72DCr@vger.kernel.org
X-Gm-Message-State: APuU4Z+ukwSGiYdTqtP0WdHR3f6pUx/fxYvkfML9AJnP+4kdnOHaOlci
	hf33W6SooRkBzAVFxjCLPvZrTX1SMqqrf3H9nmObREnhBjeD1P0TwZX0omRWzw==
X-Gm-Gg: AYBFou2q2KYFona+2SzSux4qldtM7AWuzJCl+nmmv1ipsN55TNONmr8tzb50MzdcvrK
	cCvyGdpeQPfYbeXTrsMtVEjvPNdfk7X/dJL1FRX7VMVMJdTXHdFBcHFOh4+jmwV/SwP/id6DWr5
	5CLk9YCpdVL8AHaP5QGpFJxX5xetSSNMmPxAGqvJWXjcBIfPIXDZKbH1CCwDU7rrVRDdYD0wtqY
	0Mv6702IqyU64u+w3nakAd7wsalu8JYchoelny4xZMy/s/vdmi1ByuT4P7QBkhZNveBHyH8WBBk
	S/dPHOTMJ66iFA4jgrZauHrgbWkTt80nRNDBhr2IR3Me4OvR75ISBKs5JNfxRMwfCiqJZZZFg+/
	VoUpigo49Cu0UQ6i/MUDQIjNrF3sZXfMCE6qF17v9qyNGEZhKgWacQtM5rPRQhDB4UxIB/EQWZW
	TUf9QQiVOAOpQ4yeX1lU9PneeUZFHk58QaZ8h0W685gVZdWtaaN3EVt4neV2WwLFIirJoNYVe8A
	ml8kDovRNeFEYGqYrbrjhxkfW6lnxbq/RI3LvuBEOfaSa0/wSJQd9MMbzN9jO2174kHO7G45YfP
	ynNFnGjiS1fLmuqFdBH7WRBBOLpzBWpGOgLpUfGozQVILNTIZK8raffRV6hh3yLpSIv1aAzBerK
	82Xt/jAwfZK1zK2Yc5xnKYOB+b9t/i+ml7ZIg+vrul/fKuOqAA5g4LwgfA7PRyj4tu2gUNyQ=
X-Received: by 2002:a05:6000:5c5:b0:492:3f98:5070 with SMTP id ffacd0b85a97d-498364d741cmr1563424f8f.12.1794269293229;
        Mon, 09 Nov 2026 16:08:13 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:12 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v12 4/5] clk: en7523: generalize register clocks function
Date: Tue, 10 Nov 2026 01:07:49 +0100
Message-ID: <20261110000753.508-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
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

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index fbe10e4c3693..7d302498c3d5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -823,12 +824,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1314,6 +1318,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

