Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939899;
	b=rZ/LxcPrg33h5faCrHy+TYLFoDiCOK3jycpvJ40Y9mQgNTJjIgrBd996c38geQBZfEvO
	 8LHONl/hxg+IlmvJONOQM1jYCSKiewPqpFY2Xub8ur4qsrJyl0gDYK/Y3wqH/8Al7uPQg
	 x2/wtjN79CIS9reVdKQZjA6Dt193006cX7D7N3AHbcpfkLIBZ5CQWpDmc8mEOqnsrJ21u
	 k4PrxRJX8ssDAfsM3NFS9oYMYxPtDmZ1dMoKnqESt8PSPxccj6fKl4tiGhpXxuNQWSRWT
	 9+Q9GRm2MAUvu5M/QgDrtYOJ1uLYX9aOCiPG1UOpcyz/4aog8AFju0oFFXA9UvSuwwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3T0UtHpv3iva10MQL4+oovUpl39KWNdB9AOhKqGwH84=;
	b=RcTEJF9weUCMu3foVTnlah21CygDnjgJOdZnl1YJ8q6c2iFkiQatcK4VRXb6IGVi8+dN
	 so75dArulmp2UJCSeLXv3WmSgY0ylvRLNK1SDOJfctEweD65Rt9tiFP+w6u6YvlI5oUAJ
	 4/3Hd5o2Cu9tkLp0gG/+2hfg0cn1Z5rEIdLuJXIJOiI3kgqYhzMHX3TTjURGL0Es7A7qD
	 p0IiEgKxpDcptxUIFjvt5bHixMdPAUE7QUfAcF6Nk3pmLykIM9pC7Z4FtWadM1MVOdXZ5
	 vtDAAuwaZ3jQ4F5vlAqU8zesUQSJLPACay/ERrzHpkVKvchLOtGGH8iVPbl78d2no8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSeXD8Ic;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07206606A88E
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07206606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSeXD8Ic
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so467379f8f.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939896; x=1795544696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3T0UtHpv3iva10MQL4+oovUpl39KWNdB9AOhKqGwH84=;
        b=HSeXD8IcFiP/6H1TpvFfMVsRVZcLHCHbDQpV7AQt+9sOW+UhwgZTIuwbrtNGfo36IT
         pcA33Z3uXJLhdFJvOUlPpJcIf8/DRhKZ0xNenjB5puKyrcgWg3tXFMkN0T63Vz2k5oak
         CyLmoaJMKDdmjp2hhkDvAbTYt6vb6pBVeafFwq3UBRi13io0Yz6vupvGvQ/jGV+aSP1B
         lvO8odpXLNPPzSvEhsyBRzb0zAw3EF8Rz1IPe3VYRXmK5+Wb65GAGxNJj8x6K+6THusq
         K+QwAHwWsCny05m+QOJJ5eQNOE/HUuF9Yx7jlQoqLz+DywdLZghZWypOyVxwq3HvuwBI
         haWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939896; x=1795544696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3T0UtHpv3iva10MQL4+oovUpl39KWNdB9AOhKqGwH84=;
        b=cX/1PXR/VTKdT68i0+0z6pu1qYvBHQvyO2eT9L1XoRQaKpTqRIv3u9ZteBYmSSBZ05
         si9+F8f4jJsyDWKZorNtlfNR5nCnn8unelJSuJfrMxYFxtb6ltzcN2zFfLe+d7w989Vf
         4n1lPe6xVfzv/9ubGkm1rTo/drEZ0jWmXzHe6FgvghrY/SJS1JRNNKZnHD8io53VZ4nd
         HYzPEXsccFm188EuH4pyWCIPTrKkKki9P0kZGPq05G2jIuG567ie4djZodZlJKwjRUwe
         vGfqJzgVZrgloqX+L3dLl2HRfbVJEUQ3nX4fCv30lWXdxV85gZqEexluBNptYab5FNPe
         gJSg==
X-Forwarded-Encrypted: i=1; AL+hErEMJg38H0XUZDmthAYZP7aJFU3/ja0unKOrH3idWiYJ2meHSt54xcZdH9I60rD3bUIf9aES5P7ARmx0@vger.kernel.org
X-Gm-Message-State: APuU4Z8AvSXh4neF/+aZVXPhZLGOR7apLSPMzaCgE4pNRNUtR6XhlTGU
	5LkQJjyC+EW5drv+DDQTN/dyvj+gFAdHtuuXtuY+923CA8G3D7332LKT
X-Gm-Gg: AZFdTZd8UTKe4/TT6aRCWuOOVAiG3Ov7pFLqlemy3sp5Ke/lXFTMf7F3anJ5t5wAGOP
	YyoJ20iLxIJEahxFjIb7SiBvhA7flRtmWSca7E5V61qAXsk/1Yn3e3oXrZHZs0Vq94StyR+cczm
	Pdae/dA6+E8Gci8+VwfDeern5nEDMu8HpYSkRIf6K1obJPJ/JiMu4GGeABGxcY2ePD1WhOFV7W3
	CUB0trBVe3qaWuiFKUjfakhFxg5DQWPbbVlBXAf5bLj56jF68svqfDIitgigYY/VtDMu6gScMBy
	+Er5AiPLTRr1+UsdcMYl+SdSo81Eow2Bj7jFZ5qAnwoTr8FRojPGIbOVeWty0i3CayOz1wsnRJX
	ktLzzIrWUZjHoeIvlXAThkqn3vniDOfoYYKqOam+mQ0yG+UGkNd3I5hReqW4882SAI4YVJgsIRD
	y22k7bbxcqxyYf3R5quXMdKIlbmWNju6AEmixOhSXyP/A09OvQqblX4GFmXFtWRzTMWokFMlr6R
	/Hku8ls9+9GWt1D+0jUVgCBPCInf2y6EcKuq+I0ViOTugB9n0DbpLdiOmayFTSezMApW7LvpmlX
	nKb4WD+eicEuuQh0zXYijkHmxdlFaSRULMJFNK8k1+U4xGwSTlsmjL6YMmYxJFYcGykaUaw0D84
	k9npSV+VJhXOfNgb8gP78GdBv+ueKdKIX2w==
X-Received: by 2002:a05:6000:4b0e:b0:48d:f852:c66b with SMTP id ffacd0b85a97d-4a3771eebffmr7414445f8f.22.1794939896438;
        Tue, 17 Nov 2026 10:24:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:55 -0800 (PST)
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
Subject: [PATCH v13 4/5] clk: en7523: generalize register clocks function
Date: Tue, 17 Nov 2026 19:24:42 +0100
Message-ID: <20261117182444.103123-5-ansuelsmth@gmail.com>
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

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 6aa6dfaf414e..f12b69f8d453 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -802,12 +803,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
 
@@ -1286,6 +1290,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

