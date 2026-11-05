Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904955;
	b=GXm+OwrAWGjS/wxQmE3gl+SKJpZW6pNW+Qqegn5pdrmSw1ybPfhk+p6ImtwXPPKPFzmh
	 Tos/Q010VxlixnyIvTg4V2mq8N1AEMskIS3MJEq/tWbZLODuTKJas1YyrVhSRHPMboDdC
	 HhaEBZANxYE/tqqcPK3d/4xTUjVq/djjOgtqy05uBW7HbS6xQEIQVqKNV8HzOKKOh56Iu
	 TC+YeTaAHH0myVd+Lq88c1wvinKgPsnQY8NPl+XK7gTOgkTvoNMBHaGcsrrQ9fYF8MaEh
	 vZlOFIjAbb4sLiJ83ke9+KSKhflFhJTRrJXBjOT2NShISRHNkJlrqjX+KqrzJybJg7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
	b=pjanOvH6ogxQoJS2KYyAhvrxEfVni4HeJ+iwFup13bp8Zd6TS5OfZeSfScr3bbQXJJ08
	 63WPnyU8mhPx0wEzD1YqvNZMNvEm2NA3iZ4Ph1AI5H41Y8+BMzCtyS3TMXw1YYpDhjpmt
	 Uiv3iGryarEFDVzrhsz/vpTDbJc0I9nCJdouOYT05PyMB5BbVROgY8aJf3CxWC0pb2ITB
	 gX5nSY1qHVVgPaqvJvK4VwbwMio1ZxrvGgj9kIw2Aj/NsRAV2lOnJwpuVcyrfrQNpm21B
	 4VwUkdwrXFTJ8PnS3XtUTDQeoc4dn6H8GFYtka5opMF3PzHmMqpdWiWIdBHlWimTaPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y9d2vTFj;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9727F6082BCF
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9727F6082BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y9d2vTFj
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-703be215729so1031920eaf.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904953; x=1794509753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
        b=Y9d2vTFjPJpkKsegsThQa8LAZzwDsNcncCOXG9gbYdky+bdpK4R4JZ04GLrHE8FAzo
         qKa830Er+Cin0QxxCmOoEbm6jvgqdkIrd4ttv8WkLIgRR3XfQFIpV447R9bGUh22GYYP
         9gT9hRoysIwpwXkZ6YuDHwViwwyyqFJ9Fm5vEA3Gpd0QcZghCydjrEctP+IFDk+QIm69
         Rg+f/avCrVll2P31aPltBlOn0XCcC/HtKpOzhUzsTNJJp7zNWnPK/y895P7QlOXN0IQK
         IOW3DUoM0uz8kRUSqXkazaQFy4Prd7zWaYMxgn2Cfu9jfuH7vrEKJo7ffEPLGglP+e2p
         dR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904953; x=1794509753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
        b=pGrk1wyXQcBEERRiky4n94dG+ufH0i831uPaoK/0tKPrWZm83ZmM4d5tKF7ynIefRy
         kcfaULrWIVZ2UJLoOdPOMJ/rF7caZzVfPB2hXE8KzrGBnpCoxJ1I9kZ1E7HnMVzMu4fI
         FutaEJ3TWK+dDQb5AvQ5B6E5e2fFONw/MuiZZ/bNMmSsm/U4fYZmEMlj2gdUPGtxkBZS
         alv9goKb90/IRYa+i5OYkCYp6UJ4UPyMdZAQFWGiUz0af4eWMpWSawuCJRrxpSiQNu+V
         YZ/LNTRETHuRp9PdOi5USl9RJIcG+SJW8nWx3rxL75GrSsUBUcbKw+w5ymB7uO/COWaG
         qV2w==
X-Forwarded-Encrypted: i=1; AKwUvBwh/ArHtxwoFhhQYh2kKfpwru/zf9Z8cyUVrY7SZ9r0P/5o3x2JRyhcqAsqpjo8tMyHvIk077upU/5F@vger.kernel.org
X-Gm-Message-State: APuU4Z8VksFsdOfWR63HtzCvx7XBAPYmTPC63+dxpFt7MyXNtNmDUBTG
	lSrV0Br4Og7wNORbxOuLtLaa5HzS/HP6UR7NmYQ5IdzUDnSHo1zvlJwa
X-Gm-Gg: AYBFou3nv3fenByq8lv32slgjev2KfWDoL5WoutatW+Q2+XRBebidUUF0EbXZwUwI4T
	oxi3afJUYmYODRtAEyQ/UjyRDhC28p+AwVagKcQA/L3BqhPwdftlhZ7JCl4jYQ8ZCdtaCRi+Luh
	9ZQAdWfQgq8k42OFYTq26AyIz44OTPa+CgYsrXAbvBm2hZR+Kgt+GBx86Yum65Bz05y4sg0x0xR
	Qsbmb2yGvbArrirPAJdCBxfEyWVp1UQEVlDOZDvhTv3TJktNRYcEL8REE9azCfY28OHLzUHogRY
	wCjF6zASxFL8JyOLiQt+14O7oQsp512jk60ujfgzpHqsvF+cB6KsYkGhc++mEMKzAUpQq0Mn5AY
	1vqh7tzfFp9dx0TXqYPGaxE2LYcIwK3BntExGf0xU3ROFdOsZAm6Aw1BtIGD3yIKg7nh+4WO0WQ
	XpFiHfvsFhkecoO/8eSTpPSrEekgmKZS0J5qJqXTjeDxAKp/V5zGUZtFuh3iOG9+L7sBJyUXFu7
	snv0sbLwTPuoP4KYJXX0kzgAm8avTuVQ1HeoN5toeqFSDUe1D2cBSUyKv7F6S16OcMlV1c/LBMU
	ELc7bojXteI0jnKvY2XaiJz54eqXjdVfDFES1QAhnVBN+ul+OSyKvDByrV7qzKIk64QUfkhJhAo
	DnA3GJBOmN5MdfC9EtjsmtFMdZ242Gt3LlyT4kw880ZI4e4hBihV++1E+nj/XoQeRARIExvKFsJ
	yMoMdX5pMxtJe3/6pSXe7OhzQhOr4IkGWxg0XLzjThiiBaBG7nPnpK
X-Received: by 2002:a05:6820:340b:20b0:708:ccf9:886b with SMTP id 006d021491bc7-716e79e8540mr267932eaf.84.1793904953478;
        Thu, 05 Nov 2026 10:55:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:29 -0700
Subject: [PATCH v10 13/26] mtd: rawnand: sunxi: use page reads to
 reposition small-page NAND
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-13-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The hardware-ECC reader moves between main data and OOB, and rereads raw
bytes when checking a possibly erased ECC step. It uses
nand_change_read_column_op(), which sends large-page random-output
commands and rejects NAND pages of 512 bytes or less. For a small-page
geometry accepted by hardware-ECC setup, these reads therefore fail when
they need to reposition, rather than using the small-page read commands.

Add a read-column helper that uses nand_read_page_op() on small pages.
The core selects READ0, READ1 or READOOB for the requested column and
sends the row address again. Pass the page number through the
erased-check path as well, and preserve errors from the resulting
operation. Keep the existing random-column operation for larger pages.

Select PIO for small pages even when DMA is available: the DMA PAGE_OP
sequencer uses large-page random-column commands internally.
This corrects read-side repositioning only; the write-column helper still
rejects small pages. Software-ECC and raw callbacks are unchanged.

This is a command-path correction found by inspection, not a claim that
ordinary 512+16 NAND becomes supported. The existing controller-ECC
limits still apply: it needs 512-byte ECC support and at least 28 parity
bytes plus four user-data bytes, so 512+16 remains rejected. No
small-page hardware validation is claimed.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913041642.E28F81F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 40 ++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5f57c5998f03..931d437e196b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1077,6 +1077,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
+				 unsigned int column, void *buf, unsigned int len)
+{
+	/* Small-page NAND needs a new READ0/READ1/READOOB and the page address. */
+	if (nand_to_mtd(nand)->writesize <= 512)
+		return nand_read_page_op(nand, page, column, buf, len);
+
+	return nand_change_read_column_op(nand, column, buf, len, false);
+}
+
 /*
  * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
  * statistics updated in either case. Negative values report transport errors.
@@ -1085,7 +1095,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1093,13 +1103,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING) {
-		ret = nand_change_read_column_op(nand, data_off, data,
-						 ecc->size, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, data, ecc->size);
 		if (ret)
 			return ret;
 	}
 
-	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = sunxi_nfc_read_column(nand, page, oob_off, oob, oob_len);
 	if (ret)
 		return ret;
 
@@ -1201,8 +1210,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1268,14 +1277,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 oob, ecc->bytes + user_data_sz,
-								 false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off,
+							    oob, ecc->bytes + user_data_sz);
 				if (ret)
 					return ret;
 			} else {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 NULL, 0, false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off, NULL, 0);
 				if (ret)
 					return ret;
 
@@ -1310,7 +1319,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1350,7 +1359,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1360,7 +1369,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2326,7 +2335,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->use_mdma) {
+	/* The DMA page sequencer uses large-page random-column commands. */
+	if (mtd->writesize > 512 && (nfc->dmac || nfc->use_mdma)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;

-- 
2.53.0

