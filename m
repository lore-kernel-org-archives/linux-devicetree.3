Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597204;
	b=gu+B/VSOXx20DcHA5iDmUGriaxPtYHBNqcdxtXFszNz3BpQXu40tTEMInoC9KQVrnxGc
	 ztJdWhvLPZIEUyffLcrCEOPX5xWn4xw9+vcjwai/o5xFQj5OKKwk+q3dts1Nytox/YRTk
	 XXy56UlSmgdJDzspL6jKjFYkADPLZONW2TGuFdPCiWpAuymdDkNKhhTCXP1fGMEW23y4m
	 AQ1D9aOhXWp61zUqiENTKAz6ZVTDPfAh+vLb+N1c1OXVHxGuOMagppHikEfYUgc90QGVb
	 A7jXjRZFcsHHtvIj1jAqTtDP5+eBJ6pfU6dcAtdbNh34zsZgogdUaTcDcuih+7+yX1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaYwnYAxjbvafi5ZHaoMwUtj+Rh3uHmAjABbHohiMRE=;
	b=CWwSUJGbJ03se4Cgot54UdOE9jJmGjBRRSRXnfhZ3rI7bj2Nl51PJCD11jNlDfJ9rn5K
	 3GBaMByfwXK8AlPCYD3BrIUTpzb3Kw34e3Xmdmz6a1THkgdxGpiKv9tGoUQl/L9Xry4j1
	 daLSWHIllwNwZCLmuj/JNd+KLxQ2uDm0/Rcyw8fccSOob0U5VfjBGUu/ba+Rk2dbdBKCc
	 2xZvX8DbAvkES6wfTINcveE+W1DjgsF+FQcgrKRWtynroI/oEkvLJhTFQd5kpaZ7DVEsh
	 W9H7uX5a/L2/wOvoOAxGyrqf5UUZXcQdfGRVeHYQpPndkO0TkHrNpb2bB9xGqHI7KBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeXBTAIf;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55934606A32C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55934606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeXBTAIf
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso11560025e9.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597203; x=1793202003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaYwnYAxjbvafi5ZHaoMwUtj+Rh3uHmAjABbHohiMRE=;
        b=UeXBTAIfPiCMuR1LAD8ORgCkAfwJvgzFVzOv5DelyEpnNtRMT829g4ht0Y9ToGZ6Er
         al9V7Xp2Ea73W67Mfiw/DYe88EYVF5T8T0CutO0NQvlf9OID2yNUPOLXXv9l+3ZcfJjG
         DM4tmDkJKbFoRonUeyHiHUoUdCaLlu4Z2Mbq0iq6FfReF8mf0Y46M/PUAC0M1dSr8xEj
         SwWRg6p3GnBb+m/o0ri4ic1Q1UKZYBh0SgqeEWkBYIhrz+jUU+jhwjykw10vxlDcz4IF
         J+0Sh7N6IdKx4fcT3GIYTGYX7gT3L521otbmiQ5xE2hnge4tl6HRP0ZvFPhjCDv8plUb
         PS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597203; x=1793202003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaYwnYAxjbvafi5ZHaoMwUtj+Rh3uHmAjABbHohiMRE=;
        b=R04w1iMelQBf5OjLIAbgO1FlStgAdhVowLXj9vFIeymjpGNzK68/ACoxKVl3PCUXJH
         tiV3Z/XEL+93pZkNM8qXQSRVNc7COlGt45WiW9Ry5Ga5XGyfXi7dfO42CwDVg15JEoUV
         uRtQacLbJoe0+dM8330Zl4GCg9ze2yXxIUJ3A/XVMnKB1ywqlU3juwdxtoshofDBrQ30
         pOhYXsfKBz7PMt8X7IEbXFjv6CpVEGa/HEvQfL+Vsy4XJJ0oLpX0yf+8d8vVsIimGEaw
         MjBJ/nUwTtz4yMrtRCUTTtQ7kz1LREYe7NvkBWemmimTml7IdBG+BQ5aKb9PL0uhy9qD
         uXVg==
X-Forwarded-Encrypted: i=1; AKwUvBzvBOgcNYuvNnhzODrNHgoiY2Gr1NYTsYgJN0O1ldkuMkdF6GITBX6layOUpCKvN5MAy7sTprVJitNO@vger.kernel.org
X-Gm-Message-State: AFq9FYLkiKS4ytFnVnTVYGLYYJKseS52LoEAtPHIHFjH89U/R+5FsB0b
	Y3oZRurlKeVlXH30qiBRG+Zna7Kv60nE7bDP6eNGKj9+H4BKmT/efUmt
X-Gm-Gg: AYBFou1McMUPSyHmb9RIGVQdnLgnbN7UjNg3z75K6fWvpGkwGgeBhnQtsqqNYu8JQv6
	rHXNxeoh1KYWtia/N0AcSB5+zLmJLW7mBgbzByYL5eI/Nba9KrAGno0RxvX6mZKEB46C25PI5wm
	IbPL9EQib+TLV6gZtVZhTvUQ+7Zgg3c0EJhCjBvXQloLhMBnpcFGmXg96skDfcBhARIqCfDvdCl
	cXDZ+yCZXw9aoQbfTIrNNFInS+BXBueo2NwwTzgeCpVVALxu1hl+kSBO3dnTqJZqZhGBkgsV2ok
	D4gRTlc2X92SXuzgvJNyxQz5Vygoyj5M8QG9BUeom1VULl8j719E+46CXUp7TnyqbIJdcGT4AW3
	VK1EKAlMTmhlY/CScncXI1cGGOzTkNFeTbgANyTPqtU/WSJARlU1gjP5G5xnUc7yck5wWFQJUga
	qaO5KXSdua1AzOp6PDA4F6l2HcjdMeNJ6JprPc974iUU58VCFHwVSScGG9HCySI378+gR48k69w
	woXkLL8DEtan6hmc94aJds9E8dr6TQdFtxA6dGYvPBKoJGxYQVOXIsgbnfBFjQTKZGINJKFyozu
	XIBspk3tWv8+V2C04CDP6iTkJj4VvRSxCPZP+k4O2/JLaaqa2dk1FOal2vGA
X-Received: by 2002:a05:600c:3513:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a1fdd2461cmr53680805e9.13.1792597202563;
        Wed, 21 Oct 2026 08:40:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd70027sm27793675e9.0.2026.10.21.08.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:40:01 -0700 (PDT)
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
Subject: [PATCH 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Wed, 21 Oct 2026 17:39:52 +0200
Message-ID: <20261021153953.285222-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021153953.285222-1-ansuelsmth@gmail.com>
References: <20261021153953.285222-1-ansuelsmth@gmail.com>
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

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
Mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..19dde7c4069e 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -65,6 +65,7 @@ struct mtk_i2c {
 	u32 clk_div;
 	u32 flags;
 	struct clk *clk;
+	bool have_scl_stretch;
 };
 
 static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
@@ -83,6 +84,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -93,8 +95,11 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	if (i2c->have_scl_stretch)
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 }
 
@@ -249,6 +254,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
 	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "airoha,an7581-i2c" },
 	{ /* sentinel */ }
 };
 
@@ -296,6 +302,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
+		i2c->have_scl_stretch = true;
+
 	adap = &i2c->adap;
 	adap->owner = THIS_MODULE;
 	adap->algo = &mtk_i2c_algo;
-- 
2.55.0

