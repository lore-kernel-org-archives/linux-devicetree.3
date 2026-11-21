Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223483;
	b=RcacFuAo9EaQf25KGm/XeCPxzovybRd+LuDowwemABuUQXzAydh14T6vD3tLit9UgZFT
	 HAcHNqC8ggS0pMUkw9boRKfXFLp+YiLMQQErUb2EttbCOG4YEUYqeHigcvcz46koHykiN
	 3Rnier9eRBvLszgPcVoZJspEsGHzlSupWGvXwmVywehJ4MFwTBAxZ19EQVYXnpkUrXT34
	 YcK1ggr51EC0ek9xABzAJhutuT+uJzKCSk7mL4ZxoAX0ilKPXrTp7xcTY3jO9KrYh+Ukh
	 p92y8aJri67D3CXPxMxwmVBsqw4sAzhN08vjQu8O5Z7USzFthyktvwg1RbzAmht2E8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
	b=XYV0H0qGoJZVgXMUzjn6PMgyoLb7lZx7BOw+67ekiemDZuYoemGDH4o5SHWVLFaLbjUl
	 1427VUq+rPmn4H8jsmY9f8nGFvJpy01BtpRc8MMXivWVeXufu9Kuyxaut1Sd7Y12H785T
	 UbRgM37HscMuElwZxfz3iaH/ntf3WLll4/2e9KjP8XIfdytEMHGDBJayKPprEatgIL3BN
	 BXJxwCRqLz+cLXUikDkfSYITUbjDPLqD1d2C+SW6T1puay+ioAd1BfGCuY3eZw920cMU3
	 6sKZvL2df+twBjTgEic5m3rQJkTpm+1S7ChaXE3sqCv1+ntFvYzQA53rXBNAqZ2xwew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znugP4EE;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885FE60A5BFE
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885FE60A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znugP4EE
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53ec2cc397aso981313b6e.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223478; x=1795828278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=znugP4EEWaZd213fx3PrvnJuMx6s7G058ioZ+DOESVCtuUF8JECDL3ho4kBIzIc+kE
         wBn92LPLuVT8SZsvXTO6CPk6c87hk8qfgTvcFWW30ucmJxSyK13bz17gnRM7yzmp9g7w
         f34dvrndWu7B2wiCGvFqynhfnHQdglI7ba7AlNf5/VUskrC3YTGyIOrbwTzySHAfKEuS
         w97M5I/ZjTKtu141iEr+ezyJfkpDYgqhFOaW6qeJmC0WqPEa9ASuc35Sv0mv/0Lb7Eu+
         Bv5sCfM28y9XtWpCtlL8SXvfYKYrKSCTCR6sF47gk6VpncgSKj0AOIGiCHdZ56xqGHjF
         CmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223478; x=1795828278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=C748QDi9pWFdbRUurYFogJIWY4Sq2n2/C53UfwobTbrRdrg0JeaByElHgibrULcY24
         zGecpR+tric5XC4ZOimFyl6bgQZ4ggFqYLSbFLOBdkls0MbnKz8CXJqa+EsUZtyzUJ4S
         YVx8ZjaPtZHOSIPDELNXtwjBglMf0DS6tNNjmy9KiDi29ZVfMF8QThjYywHeRuQhZDLZ
         FZF2ZN5UIDDPdBTC7zHFO2sET73bv5/k2xZhEWwrjLd5bexE6MieWU5D8G62bELKuGJ3
         FvNx7949JVDNB5brGeQ+R63Gjl6Hsrc7M6KLQ+7KgaB3sdaUh+KN9F+s8DJqj/jR5FRM
         KBjA==
X-Forwarded-Encrypted: i=1; AL+hErGxn3xbj8oD+75QcWx8DG81f26AcpeTWRACwcmXwne7yZ/56tt9kyohKgZE0A+ii8u7H3H47fBj9x61@vger.kernel.org
X-Gm-Message-State: APuU4Z9dr+44kHMy8Jud2iaRPxekxLN+/TSM8cm81RA699Jd9w9H8Dcu
	gCXko4zKw2IP0CWkJfF+lFe0bEOYJhk5aCjObwwvI7LpacIiVWPTk+Ht
X-Gm-Gg: AYBFou1f/o/LmnqqcQg5oRVPNG05+/5ep2va/7chkMbuKhad+AONYIO4mGsad3FUa0s
	1kwdiTS4AkqfSCZxq5AoaY8H0mhfm5skU9O37UlX/7z+/x/sCC/AYJBN2cRo6qNxDYB1VDQqXpd
	TEmPKE9OThUtBV30pF6XDArrBLi3Wy2iCGIHSl1vl8Rpeu0+X/waNFaTjxYe6pj26DO0H5E5FFe
	2C+o8H4/I5SvnKuNLGKLwMOgVJzzipgxsx1Dy6UdulQ7yRRxTki6LgWpjDQ1lPHvVUuuG+sFt6/
	taSTg5Rfdx1SF/neY92BSbE+p1UyWrOoGbMo8HoHqlbrzdZLAH3XfroqN1yCym4mQxw7O3XnJRs
	h9CTXPBAO/7pRO/NtR5hOnUBDT3aXCmBbbk67DuWwpsYv9YGVN/nel7iuNC9DILwRVcaoJWNbx+
	8kcouA0rhhtiKjTO2Pc/6UrAaQlwAntGnqVfjBL8hy+Oak67F4EoKlrxFVYh8jqNb5qY2wiHQg7
	RoW5X9jDvufp6xvxdjSDeqPoTpz2qcCZnrYL9pNXt3g+oocdDTgDyewoeoGBkMRPdXNT4Zpgxox
	vqwdy1tnccXFO48eDAdrZhU67WIIYy7fs6t66o9IU0DzbKwO0sTLGeGf0iISkqwIAcdb2DqqKep
	cb7moBVoUyLO1qyA7epL4h67A1WsIHSbofsc1zXiF8MN/a2xuCq8NfdAeTqTcqgCDtPvKFXq91a
	9hNWi3tam6UidBTjQX8+vw+qG4OVKq6z5OrbvFYCL5NfCeej69E+Hz
X-Received: by 2002:a05:6808:4f06:b0:53a:9d3c:caad with SMTP id 5614622812f47-57a0a4079a5mr6188187b6e.25.1795223478418;
        Fri, 20 Nov 2026 17:11:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:39 -0700
Subject: [PATCH v11 16/26] mtd: rawnand: sunxi: limit DMA subpage ECC
 results to the requested range
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-16-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
X-Mailer: b4 0.17-dev

A read of part of a NAND page can return -EBADMSG even when every ECC
step covering the requested bytes is readable. The DMA path transfers
from the start of the page and accounts for errors in that entire
prefix. An uncorrectable error in an earlier step therefore increments
the failure count that the NAND core checks for this read. Corrections
in earlier steps can likewise inflate the reported bitflip count.

Keep the DMA transfer unchanged, but only process ECC results and
perform raw erased-chunk checks for steps overlapping the request.
Keep hardware slots and user-data register indices relative to the start
of each transferred batch.

Fixes: 2de85e733601 ("mtd: nand: sunxi: Actually use DMA for subpage reads")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7f93ce226f24..5415ac6960b4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1106,6 +1106,7 @@ static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
 struct sunxi_nfc_ecc_read {
 	u8 *buf;
 	int page;
+	int first_req_step;
 	unsigned int max_bitflips;
 	bool oob_required;
 	bool dma;
@@ -1234,6 +1235,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		int bitflips;
 
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		if (step < read->first_req_step)
+			continue;
+
 		if (status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1294,7 +1298,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	for (slot = 0; slot < nsteps; slot++) {
 		int step = first_step + slot;
 
-		if (!(status & NFC_ECC_ERR(slot)))
+		if (step < read->first_req_step || !(status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
@@ -1451,12 +1455,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
-					    int oob_required, int page, int nchunks)
+					    int oob_required, int page,
+					    int first_req_step, int end_step)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
 		.page = page,
+		.first_req_step = first_req_step,
 		.oob_required = oob_required,
 		.dma = true,
 	};
@@ -1464,8 +1470,9 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	unsigned int failed = mtd->ecc_stats.failed;
 	int first_step, batch_steps, ret;
 
-	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
-		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+	/* PAGE_OP transfers a prefix; only the requested steps contribute ECC results. */
+	for (first_step = 0; first_step < end_step; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, end_step);
 		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, &read, first_step, batch_steps);
 		if (ret)
 			goto err_stats;
@@ -1618,7 +1625,7 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page, 0,
 					       nand->ecc.steps);
 	if (ret >= 0)
 		return ret;
@@ -1641,14 +1648,15 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 					     u32 data_offs, u32 readlen,
 					     u8 *buf, int page)
 {
-	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
+	int first_step = data_offs / nand->ecc.size;
+	int end_step = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, first_step, end_step);
 	if (ret >= 0)
 		return ret;
 

-- 
2.53.0

