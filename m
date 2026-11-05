Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904958;
	b=terzFUI1p0p9qKgCA0Q65hUixHWgoJ8Zp7AiVXQDj+lvYJ+JxpmOEnQ4ankhOxxZkZov
	 YOyu/ueI+QfHrR7UG8cv9GU6/xWxAN7d3b7AMqO3vNJTJw9Ba/DfoLksCZpF3xnzfW1yk
	 sVT7xT5bgcbislw3jovEYaryt3tU/uYKEQzn8LwZZThz+E8658V/uah39S59yyTrfqwAn
	 XMnN+aq9DxiOeyxSCDJZvL9xe9XKs1ryIDz7Aoh7X9Zt4cWaIab47WQCQC/8gsCwft92p
	 MhDC8ELL4PVGD6ASYTjpT/iXMtH4uDAhlRWxr7N4JaLRCeanx1h+iDewyRXA6gMX9ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
	b=HtmYA6aT437xbtLYlFTDrhvY8PIgKDUOXDAEXkIO9wKnG5likhNGgmHZRO4GzM/yWJP6
	 7vTBv/nt65040J6dnmTo6OvTefTf0Msg4fuCb5MHN3Eaozn+q4Uq8BNu0935Pg6G4bsO1
	 kTu9rS/CK/Cw+0V6zoK7v9UWbIws91K/Njd0mPu/qEhmYaK7Pwh9nolu9Yx6sggUA+gAL
	 odUcX8BcBYDuk71LNYPby58LD+Q/fOcBcJIQb/FvEvE4ALtd6axmfvTAbkFLdQso0RISD
	 yezoEAeewuqTJrc6Wh31gd/RRS3PiyiIVT5XCCIsbjoNaNZR4840xvSqyoP4WnHKsZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYyjVWuo;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74371606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74371606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYyjVWuo
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-705cb6ceebaso1493637eaf.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904957; x=1794509757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=lYyjVWuoOKNJPABMuP/3QLExRn6GuPJpWyxNvWSUgg0jfO91mx48Yyahq0yc9mDOO9
         UjvC3khKQdZ0PIeiIJfG9cCrh2ahYorSE9snNqm8Gdoc3wwoKO9BkJiOM9C0JqRepj0Q
         tkWzbpVrwXTfOQSFHz6t3n2FDCsi8Hv3BtL88eTFv4ztj+k4lROaxBvvOuan7DacVcK3
         fnJaHNJ0Xtn7YcpeEHbFfmSe9pKEA4pjyj2QDM7OI73fNWAqRy2+d+2UcA7lf3NVr6j/
         MHkegb0THWy+k6V9/fqJ63lWi2R+QRKJJAg1lLDdBn/3lbY8fGQo3AK6SWOlGecUrSwi
         SmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904957; x=1794509757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=zgBdJ85mZs3KOG7ZT9ZGAVFzAWeiACQyUT7RKskMaxHHld6jDrLxv+SfanbWrseaY1
         23t+ClCuMncy0nn2pordIN6QPSx0HMtIGgfCL3nQ9C1WrTBoc3IrvTb9Z+JP8JiWx8BU
         fwHGjNdMQfqPNsGpm7urppGQRR1Cm9LqDl+lAB3PBA6x8djXsMZ0jAoEUw4Zp+Rea3cL
         jzr1bKH3Q88uX5ltq7Ac9rwe64XXegxhgKC0GRwMCQmqTqahFE0Zo9BaIthZhcPtEgO/
         V+hyaj4XukBwLhzUfRlL7yFVz8lzbI2KFUEepcQkRyWfgBXUz6G8PF4qxLmLZbgv83fE
         t35w==
X-Forwarded-Encrypted: i=1; AKwUvBxzQtOimnbHSEhwP87853jpemnFFPX1ujk5/HOlD5bUy4v2pEb8QyBnl8CdBE0/pF7nE6CsALQIYnFA@vger.kernel.org
X-Gm-Message-State: APuU4Z/bg6CGyZg+3jG8wd84w9Ob/FKdyeFVy/yDNmqx0jLRUJr4b1AB
	AIZ2lbi7FzvqG/x8HnEMSVwbkgunI716pr7hqOW3KfSpbElFXMM1ndSf
X-Gm-Gg: AYBFou23r6bWlqJejWjw7uJOLOYTzpQTVMGXUM5R3zIju9rcCO2tkFoLsy1N7ymvaX+
	2U0q2/EsJjJJ8qMTZdpBj0kjT1HaiI6WYRH/v8Bnaq0wDVL0UzTI+Qz8r7qPGyx7WX78BgoGV/v
	mcTeQQPAmriB6T70Si3xUm2I+GoFuYqt6G+mSFKcSCo4B17MhbBa75r7ESbjVZBbrQUdW6xRprg
	iL6r8t3FqYv/9+VzYb+LI/HqST9ATECrfIrrwZyyNOoIuBivo/6GhB2DcjpNt0AEUs0AXCFNUPF
	R6yqS615yPxquHKeUGiDYO5ZDl5xowaX5gHxyXlnXknOMqkJr7UZOXsc6yvUlOHptKs21cmqw9d
	TYO8eUCBnTUvnPZHwDM9Qted1P+on8P1YeM1qr9srjSB+H+rReg3Dsgy9c/lPCzlyqhThLyVDwh
	G/xFKsOm+3Euh1Od6E9kvjE8AwdultXxg68eaiCz6bqorGR1K+QGo3x6VrD4wm0azfsAc0GmS59
	wuJUeDB4Lf9X1T5FXdmLhLAPkbBqq+5jvilApdRWYIlpyfz4qaM1t1+PfN/5JPH2YwGtnTvOd6v
	8ZBz3tTqzQ4ftesSNnuBD5vWhEZKb5/I1cQjSg+oglz+sjTo0NBumqhP6/o6anUxv7pmRNeIsIM
	xWTL1oblwvWb/i0SgvOKQ/2beOUldgabbbUSsglwj24Auj4dzHxWc+J7wrtW883E35GSQZDesEa
	gQnf7hKzBPmqma1cW6fgjPbaXMMy2MaEEoSyLPrheMA8p9F6VMBw0H
X-Received: by 2002:a05:6820:a513:20b0:6fc:4051:d2d7 with SMTP id 006d021491bc7-716e78ed246mr305545eaf.38.1793904957427;
        Thu, 05 Nov 2026 10:55:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:32 -0700
Subject: [PATCH v10 16/26] mtd: rawnand: sunxi: propagate chip clock setup
 errors
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-16-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

Chip selection ignores clk_set_rate() failures and caches the requested
rate anyway. It then installs timing registers calculated for that rate
and proceeds with the NAND operation. Subsequent selections do not retry
the rate change because the cache already matches the requested rate.

Return the clock error before changing the controller configuration and
update the cached rate only after a successful clock change. Propagate
the error through exec_op() and the DMA page-write path so neither issues
a command with timings for a clock rate that was not installed.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0b92bbe19c0a..7c80f52c517d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -651,16 +651,25 @@ static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 		dmaengine_terminate_all(nfc->dmac);
 }
 
-static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
+static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_chip_sel *sel;
 	u32 ctl;
+	int ret;
 
 	if (cs >= sunxi_nand->nsels)
-		return;
+		return -EINVAL;
+
+	if (nfc->clk_rate != sunxi_nand->clk_rate) {
+		ret = clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
+		if (ret)
+			return ret;
+
+		nfc->clk_rate = sunxi_nand->clk_rate;
+	}
 
 	ctl = readl(nfc->regs + NFC_REG_CTL) &
 	      ~(NFC_PAGE_SHIFT_MSK | NFC_CE_SEL_MSK | NFC_RB_SEL_MSK | NFC_EN);
@@ -672,14 +681,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
-	if (nfc->clk_rate != sunxi_nand->clk_rate) {
-		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
-		nfc->clk_rate = sunxi_nand->clk_rate;
-	}
-
 	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
+
+	return 0;
 }
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
@@ -1824,7 +1830,9 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	u32 wait;
 	int first_step, batch_steps, ret, i;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
+	ret = sunxi_nfc_select_chip(nand, nand->cur_cs);
+	if (ret)
+		return ret;
 
 	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
 		unsigned int reg_index = 0;
@@ -2627,9 +2635,13 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_op_parser *parser;
+	int ret;
 
-	if (!check_only)
-		sunxi_nfc_select_chip(nand, op->cs);
+	if (!check_only) {
+		ret = sunxi_nfc_select_chip(nand, op->cs);
+		if (ret)
+			return ret;
+	}
 
 	if (sunxi_nand->sels[op->cs].rb >= 0)
 		parser = &sunxi_nfc_op_parser;

-- 
2.53.0

