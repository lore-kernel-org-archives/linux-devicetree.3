Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC26036DA0B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229997; cv=none; b=FhIBI7hrihBoriKVSWh7YwjstyTAxdToFUwsymTJJGTRsuiwyPB47zT+jmTCIYjWgljyvW2u4lf00vjVJ2i7zfVzMNHT6FuCIbk8LGzJnQM5leW3/TCRyzxa+Klj4EUMRfCydkRgqxtqdHE6c9OSoP5Kdnp/luR8tV7AEoW5ae0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229997; c=relaxed/simple;
	bh=Y3rrfwYds9sZ3rVEgOuLjjzbMEvYwH+wEZ2bp61Lv68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WqEC08Ylj6buTzEwf6AJwax2zuqieagy/oePyoRd7CzDJMSDnbywJ8CycOOQFu8PdB/hrU95LmfMFHx5w4FYMWnCBSLPZ56pixrXpoo+HJ9oEWzsaM6vFZb0pI712rVKFfpC9bqmTBAGNNYOM63lXtuBu/kG6X4AA/2aNuK5kOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sk6q6DGS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sk6q6DGS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso30459345e9.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229993; x=1779834793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNsfYCBsduV7LW18AOFLY4oJx3XVZ8OM9ODGDYLi8HY=;
        b=sk6q6DGSNtpk4AgvApPHQSursQqkck3rtc36iDpDmFr3/pBT/45psyFuduEGGMn+NC
         0I8XZOiHSdQb4dpURpzPCJxYtAAv2aATfcB/GtthXVpgtW3Ij6414x1TFoU38kiJZe5d
         kZlnRHgRtzPDoCgjiWwT4x16/tNKQv/5jm+JGlmHpsDhgUGdR4TtqCahHLo+kj1VTD6+
         Q93Q2oe5Q/ldj3ca7635AQ6MX2sQDkKnhMN2wpY33QaGQUGYTsffL+bTfczGMrvmhlY4
         OQGDg/DegGD4SOTFxUY/bi0q8J7lTJ4qpH3mQW59RkdidnFs/PS0lIATU6nD9hyQDH2a
         B0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229993; x=1779834793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNsfYCBsduV7LW18AOFLY4oJx3XVZ8OM9ODGDYLi8HY=;
        b=O0co2wFq4FjnYaDzWsYpJv/lpswHYqUnRQl9Y3KbzOqOYYCXVBQv1KVEP8/+EyXyVq
         Fq7DiyrtaCK1knaAKcfXZLoQ0U85JnOs7pmDQ62rO8/if1sd8aTcWWXzwF9WaN03vfX9
         ad6WZ8RIF1BuC2Hrl8dEkIrP7Jv4n/R2Et0cGvX6vmV3+4Vk15CixgAA5W9FlSqZuW7A
         xNYjAnIPYSuHNxsTXFrBcSi7o4ZJa8YUxgGri0owGjllVmfPQkpYGnm5uky2qARsyhqZ
         dTgYK1nIgi9clkjGnFzByH5h8/kbIpbRtZQIhON6CX0hgRykaXQEZloH6Kjd6ByF0uEI
         B7Wg==
X-Forwarded-Encrypted: i=1; AFNElJ9yksHZBjrtPB1fq7zbjYyYShGw8c0khKMThNaMo0w6AB0yEQ9zkAen/9Nlab5MMggc2REhLwjrd7GX@vger.kernel.org
X-Gm-Message-State: AOJu0YzWGN5yZLF9fNbzGITyZENsqAB9E4JVZZe98z/ssT9TMq8egeap
	4V+qrmhtWguz6iybe9bEfwbGnvtAkIhn376f6oPkZCh3cuIhYxYk18/Y
X-Gm-Gg: Acq92OHaNzXM9GT5Z2/k3Idy4TJb5U8/Iclm/OBcuJKjMA4fPc3JDc0qDUX1DrzamlY
	o/KGKC0IzKJal8FgJQB+R42f4PH6qF67KlPdbXE51Mld0kz5AkfT9XAftaWvW/UOIJ11Ar3a8kO
	JZxczGcUmptdlMEeDsb3skQjqJVD7umFbuWZdOX5VVBPh4h8YaBDFwfKnx0bcfUNOBjqMqdqYJi
	R8tpNjyLCVPuvbZQVu+zRjMiPYIDulCqKQRvmVEQgoMkO4Y8AOWT+OXSVCCjb9DlrIygw5MD3Xh
	YyKhDrzOP77A473P1KBSkdqH4vYe5C0KDMGZVYttA35wKMxi9pTpIurCuBxP8m2iv8jgMFc1mvv
	0wwSRJigeUD8uKjrUx7R9xoYizm9PgM3G5jcyr/RzM13QgNpbdLiSHtDU1g+x4ti8PLrMs/j8D1
	PVj5mzJbT4zBOnB8LdI39M8o0sYXRTJpzDITa/nuopklRVrMKuNQwM1MBUGI3o0MUXqGst1W0aP
	7ohbkQ+cg==
X-Received: by 2002:a05:600c:b95:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48fe60ea2dfmr321638395e9.11.1779229993156;
        Tue, 19 May 2026 15:33:13 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:12 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 4/5] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Wed, 20 May 2026 00:32:46 +0200
Message-ID: <20260519223253.1093-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index d8fa29e7e0fa..3cde43c57a2b 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -88,6 +88,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -98,8 +99,12 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 	/* Clear any pending interrupt */
 	iowrite32(1, i2c->base + REG_PINTEN_REG);
@@ -271,6 +276,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
 	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "airoha,an7581-i2c" },
 	{ /* sentinel */ }
 };
 
-- 
2.53.0

