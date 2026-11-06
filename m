Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966348;
	b=PRpQnUOF5A8pbx/IUQqMsScOJ0+HhVVfxqfXF4PmrDR6idKwLlcrdpg6BUwLKqMMY7YC
	 fbdO9MAPbRAs4IHg8H2U97Oyku7tA3j+6UZUOdL2rAdlOKxrHIOPfUOqYMu5S4B80KF5q
	 1EsnkbkZFjhVTmIbMtVPYGmJzORKkjo4CadGdRDLjldrY7441lfoKTreqpgqAXa3xQowF
	 pFk5R0FJ3ChhH4s9vWlmIEqjaNocXGXMqCLqi0063cW2jfXirfkWC9nGu+R//5jkg76kf
	 ejRq+Qe5/xn39qNQQgwuIkInQGBI1tJOFOfWqLIvfgiTZyzT3liz5XFtaf8ObuVdzbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vgb+cjl96ygFaTK6ZGzDBTxWIYeEzqjwHcNjALJCkdU=;
	b=MO4Q79YTTfR3G1cq0Zh2az/zz9/b7WaBc/wYL5kJlIhVsG5xkTPbNGMwErab82DPDdqt
	 7OVAFF/KqzXvyMW1p+5TtXbJtkWPAbz1bxW/Cr2Uz/6PzjSownoflJQJ7D7/Z3OfAnhzr
	 m3Lk8oldjCrrGz96VDK6ERnsr7tuDgTdgJuR1w5wv5aqsfPbDvK8rCTYyLW+YbMo642+U
	 slut/dGQYE3yDsWyapslVT/VVoMHs7AhPdqD7DCAtHwocmU2OMthCVDDxzkIdaLqRtEkL
	 x2iSj9sn6JfHdJ52xIyBG946qRe8qr9rDn97Mcj6QuJLr1CjvkaOk7jO/of2ggflxwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7xtl7sW;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D21606D82F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24D21606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7xtl7sW
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5229225e9.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966346; x=1794571146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vgb+cjl96ygFaTK6ZGzDBTxWIYeEzqjwHcNjALJCkdU=;
        b=R7xtl7sW7EmobVMgdMwO8Z4zbumVWxPTPUqr2gloWr+RMmgVLk6X8UZ7PZ2mwYaIki
         K4n0/3ZqNqI5e6Mnjn3IUgacRQvAbIgFDSxrj9QtUHUbsOPs34iFLSuIxqMVatMhN/aX
         JWGlTv65AvH/HlgUvF07JriBlvvSiOrRZ8FUOdSJCju9GElvmdph6uq3mai0VraqKqIs
         9+qmBsdSYBpolGLGgIweT6UX4CtsrDiRVtOfoVBN5k51JpnQrX2OQhFWgqEMvoKVItbP
         xNqInF2tnnyUvIQUw8mNMXilHd024EhauwK1wxdMUwWI7RpYlBmSUhLUOGg1MMwMhq+N
         k6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966346; x=1794571146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vgb+cjl96ygFaTK6ZGzDBTxWIYeEzqjwHcNjALJCkdU=;
        b=prClbJpwEUi9ydgbNLMvs8yJWZuICY8VYj4u3dVMWvXocdHdTz9vHMtZ7OUCZXEqva
         pGJIpgV+NupPwPXjXcU0ofyjNqqXK3dNJG1avXwth5fKtui6plJ/wRZUyrMqyXYwoldC
         wRQrrHjYIycYGpjCXl36/Cs6jhPUiJW4jFoeqcj90iWHd/jH0VbDlxUxaFwyg9ruTn2s
         jFBSNvB3cDauzuKI+4NuRzlP/mNf+U8ZKvdhDW67Pxn5LCKG6skpR+atqmaAJUxpuCT9
         y5SICC2APLuqozkPKrGYO2kSh7go5xsUD5SEqNEDuQqwBSGQ5XW8PhQL90lfGUEyAR8f
         AnRA==
X-Forwarded-Encrypted: i=1; AKwUvBxz4YdEeD/tNcA1rZ+latzaCpzvb7fs29hlz1XqrXda8RkeF80rg6i0rHDF6bV2zkMS3sih9Br8RYqR@vger.kernel.org
X-Gm-Message-State: APuU4Z/SDHGxGAIOZyBShc0NckTHZdxLePD1qkrotCQ+n8GHxcvwwuvV
	CLMhXhF25z4Z4JmncuBZBm1NENCWM5ooLIi98LQ8K8fg/JunCl+92eC9
X-Gm-Gg: AYBFou2fiQ1n+tvyR9VKDebbh23ryQtyui0LJvcuYVlAkanYit8M8jK0Bvirv8klFNC
	ZXJ8vZWoNoTazVhsK6n37vH87yJOhiJ/Kmleropli+WI/NDZKYiTcaB9Y8sklKnU0WXNllryEcS
	3ccd0XRk69c1bcGH7UfJ0a4vX1BS5y/qvfGLYqeSu2VCsk4o8CntLRMoJDGqsvox3ZdtdeG2S6y
	22W1OM+SLH13H+BCOQo/RQHaXSmm1DFpVfKXkgqcQHWcghDrTj5fv0maIIdUmn5oM//zvM2eyA0
	wnpcN6hqNyA2eezXoTkVWwf2KIAXIa/XyeNg2FhaVopy/IPE41rMNn9J1ZiDU3aBNW7jg6WIczI
	RDaooEcF2OLLJC1yHFly5CdqfxYYQOqWvcARNtQeV6krIl7sHe6t8cV6oWsIs3fcWrCD2Wssm6q
	cmIcQFc9kurVmsPZbQ6iL1Y859kZoT9KW8GcUi2/MqUkqSuoHPbFJCDzo45W7lyURq0PeIIotBd
	jwaet+a0o46DYBBecLxfUBkLtKtys7YrwxoWRsZB1jiHbRkSkMYxhjC7eKFu4Ev7KoaJE9+/aHa
	tcrk3M/N7cmJeqCQdm23W3IGNjigO4DrGk0LhZBspftxOc9YM9rtTNgMJUUGNbtQR1bLK3Oe9ip
	nlfbifDDGgzAX6LQ7cohCwlILXT9Jh/oA3HJR9PSqHtBh3VcHZ8iG1M4=
X-Received: by 2002:a05:600c:37c3:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4b6d8592096mr37325885e9.0.1793966346253;
        Fri, 06 Nov 2026 03:59:06 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:05 -0800 (PST)
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
Subject: [PATCH v11 4/5] clk: en7523: generalize register clocks function
Date: Fri,  6 Nov 2026 12:58:49 +0100
Message-ID: <20261106115852.189098-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106115852.189098-1-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
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
index e534a5c91e61..8e24eef651a1 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -818,12 +819,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
 
@@ -1308,6 +1312,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

