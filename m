Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939895;
	b=aLWzciNFi+WYWM/zkn+TJc3E0Y8KQ1e9w/5jZO54mwqjjzYsdfB9NVE6KFGN74B/N3VS
	 6OA8tNoLMQezO0Vti0H7QE2D3hg9pSJ52rSEpt1WxQylR82Vnx/OF8FPkJbbthkAjkLtA
	 VVeRLXwFh0KSZrd1laWkEF+RfSdR0Ltjsd234gCXMm2OtvE24lJTJhk+g917AP/mVRyc2
	 6UH2RNSGdP6GK8cd1yXntjv9j8pytXPKf0b3QChgbwrn73Jwl8mNJFQ+K0Uo958q55ys5
	 Ba/PaqdFdzr3L4WLn9KSwiW0vGTTzKhmFRU/vDIRl/0x948UKzTvwsVnprPIZ6A7/jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
	b=nMdubWVestfDmBrxBTfP7+TGL/3xZga1JqoxGGjvAZtSABKHN/12HUWri3YWqxThefEU
	 B+ANRSZO0wieRCHt1gckNdLoHexLOoxLN6J6e11BVGf2lcP2BXuDSTLbnS6ZBUlboZPru
	 GFGJlVJK9GNnGlzB5oT4cXzyvHETMfmshy0ZGVyl2u6Qjph+jxHFNKgsP+AbD8jQlVp+D
	 0moGD8i7U3ICr5l4hUByQD64gyBM8ceiIu1Ugns+3ZLT2hyeuENEEGR0TVecfe/PWeEbU
	 5pwpnQ8UOLeKxiEst02KYh/ZJen62UNiNTXLAajr68vVLt8Cf1UNaEo/LXULuusNYGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ1WGc9D;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1D3606A88D
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B1D3606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ1WGc9D
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1354025e9.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939893; x=1795544693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=dQ1WGc9DNBqDAEUPg0aNC8KIXUWHJew2ixZ77l0HGgOgqHn9PiCbjqnXTxB3llBzHi
         GUvzLA+hwOWP30Hu1S8qsxTIj7LjOfIZG1Ou8Qt6t7zqvoD1gjT3hjcxa6oYlOI+/72i
         9yMlL9/sywi6eJsebPYcsBRzstIaduVNLGMzOoiX7cgBY0o9jMiUD8BjPlfbA62Rih+J
         JQYAXwEMV672sno1P2kdNJSPLn2FKvw0Yp/ZstcmkJpozFJoBjc55CiOMZANSqoLbp+F
         pos2aSzzjdXrJp3vYqwWfsgWFXyFzjOl8jtfWNGIjeM9NACZppGMtZkCN1T4YmbOCJb4
         8eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939893; x=1795544693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=qonH3mcN25xXbH0RfUo/pB7ZWOO/4M1EXiXFVyUNj/9sb3i7NFD+yLiu+xdiqmvHm0
         WGt15A+hBc+7KRkPyHOknhRgX01TtwbU05PFL8Xt/yxpkL+xVK/yBVQKKiinOkyV5ACZ
         wwfIyvhPbf4bY8AfnlAHK/ZAMU92H2HmSB6yzRmWTtk5XuxUbcAkyNSfaxOpvYHf/JZ8
         QXkioroA217/2DWHwqHoW2DW1VVIRdQW9TLpU93LXBJGHx+cYNXFFbBn3HwEpckexwl0
         MmnlOc9/AI/mzVU8sUbyJ7p6mYa3ERPch9myOlpunzPZN02Zd5A8uF5Z2p8zasOgaac1
         yP/Q==
X-Forwarded-Encrypted: i=1; AL+hErEN7MZzX0uzRvOKB+PdbNcDjw94HmD3ieUIAJyREae59wjNdIrN2+nIoq5Rqr0sohqaaUoelGHMYwcv@vger.kernel.org
X-Gm-Message-State: APuU4Z//xrgABNxzLiQ0qcZUhomi+GKAS7ZJUYvm8cOYhvgPIhgj2UfK
	AAaceBh7el4V5hotK1g4gkQVJ5xR/74baWTIlzNRYNHC/EKAiEpQE5dD
X-Gm-Gg: AYBFou2PI3blCrlNTlWjab+3JAflp6krnCL1jfjQPfxRZv5DnzZACJnaT1hBGVaMCL+
	LxyPV6SH/+h12sXddC2NDCZn4UWDphXklEkSFe1ebioeS9D7MNUHtYXJW/3a14sIe+tVRbIfG4+
	FeyGtuxGJBRjenzZHaUb8I58CPNhu93rErTtgE1SgOHTI2L+kmKoPndC53t8xau3KPzzve/G29D
	WOv20gEnA2RBzrcNHo0hZGAS9ECViR6J+4ywOe00t6gek1fFfsor0Q5zznkc4BRLsJpC4mrKlfj
	zWgiBDzkvSM2BO+UtyD9N8sSoF0LDDaNlOhxDCzvi6o2uRlcPS6S1pw/bSwz1a0sjDePExn3hnv
	LToyyeKT2G2IfErvnuW8RYYn6w1vmnsHpNyKISHfRpijfWgj/B58ge/CQwCN0m+bnpWPC2RC1es
	826dPXBqMZfIBMmiEjwZRUn/ZXj/9GeiNuobDWKZD80+NQi8Cu4j8p/anTA85bZG2Myt+0oDbz9
	3moItAahqCky43RaqNS2L1W4Qygp6+FlEkTXT1UrT7tE3t6KwTKvQtDMeruvJ9D6cvqXZsmCEr0
	0+zIRsZYXUvg7DUKMl4SoJiMIWP4Y42kJ0+AFY3jkL1kZIjSvTYg3iwn/86nsSv300ehhPYrwup
	wC3ag65nP6FsDjuXR4S7uspAPMznY4cQmrl154gBF/LGi4EW9x7gPqvk=
X-Received: by 2002:a05:600c:a07:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb7d57770fmr1674885e9.0.1794939893246;
        Tue, 17 Nov 2026 10:24:53 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:52 -0800 (PST)
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
Subject: [PATCH v13 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Tue, 17 Nov 2026 19:24:40 +0100
Message-ID: <20261117182444.103123-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117182444.103123-1-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..9e92586f207c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -707,7 +707,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -769,7 +769,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1103,7 +1103,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

