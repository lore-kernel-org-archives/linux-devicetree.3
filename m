Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223471;
	b=tI3DvBMV/6NgiElfuqDdhNhEediXZ0ejQ2PpdCphwcTpOGyCSQnJtXH1UeaySff7BNR/
	 BOOrnOyFkJ6hqFwfZWdZyk9/ItK9yC7fMGx2s6uZDGyUNqVzyEK9t4gn8w/PbkR8ucdfQ
	 m6Aa33sagbYdiIxRvjDM6GYZ5f5qRkeqKgR0BfYRL2QyEgQ9Dey8PMANsKtu3c3DpfolO
	 02xvSP+6p0yvxcc9XE0awRgCCO989mUg3f1NGDaufjn/yc2Q0XmMB4kVQx8XcwcDfU5rB
	 d/AnPgtaqLoz0qRvgzs47oTQR5i0VRU0PECcaVcz17ygfA/+gzC0oKGDUsAgut1TLFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tDxDnDKQmgOhb7t9CqFuoW8PN9zlg37X4nU+lrooV8U=;
	b=JPuFTvrv9HsdwS9vwut4vOFykSkgr21+4wJ4L5XBQZk7+fYnv6XQkws6C9WWtXFbLzXM
	 Nmq+dZxeIHHjZw2qK9pGV3AmYq6FX7d97KfhtnbdvP4DpcUBlhHljRITOMvX2erwm/3VC
	 Ae3A+M1WZ5lFu8YpEWM9rRasBoYZ8+lzWp45N+EJM8VOQdekS+D6DmmABDcvKjUnQBgV9
	 gdnFTKP1QKddh9NaEeL/5FsM2rNaCnOhhF0macJNp370U/BxKPNRTLgmvogYpTr/YCB5K
	 UjZpiD/jB2i70MIt+vnzShMNgyRzUZca3Lqh3ZwnEzTDOjUhwioTxGtZ39iwQMBK6Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yx5gheen;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B6E60A263C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B6E60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yx5gheen
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b28d7c729fso1187879b6e.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223466; x=1795828266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDxDnDKQmgOhb7t9CqFuoW8PN9zlg37X4nU+lrooV8U=;
        b=yx5gheenrepbzKlY6Zc758JhtUoa27vxVHp6l2Dj+Nk65HcFNRkrroyys3ZK+FR76t
         lAqpw2Ak6QhnWujbws5tJbIXpgJ1T/9gir9C3lJijMuPJnPuGbEhILWihsBMjXHaTsly
         KrjUw4gS4nZvvSmXYufKzmFWQSNBf9KIZBnmvZAhJRxD1514PL/gSJI2tgsdyncO2jYG
         KeOn+yxOXNVw+eH1GTgvs7MZwx0kcuGLzBmZETtB0usZ61lSwaBaiIHNjMqIo3og+8jH
         Dl/+xNmg+r2C4OpnA07VUqt+6E/OFP7J0mp5HErff/jDHWagNAEagTKgqEspU7ydLGht
         lhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223466; x=1795828266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDxDnDKQmgOhb7t9CqFuoW8PN9zlg37X4nU+lrooV8U=;
        b=ewOuj0KDAOZOuzbKMBUtx4VIJsDhkNHAFDjJuV1k3OUCSsmz2P1pRd5WAG6OLSS0vf
         4tSrt7qGhiWQjp10xTl5qaCPP+zIE7PEpS/9FOoHdeUZA954XfQO+UR2/KCHFsnv12/E
         dBmGiKgK8ebv+jNUkL+Zb677cPxlRwX0d44Hcr3k7HsvShjiaYdgAclKPRdL6IUVDGFV
         p9KBWqNO2RvMIGuGSxYZW85/u6QUdJuw2zM6PuOc+9PCWTcnAHnoWNf0RCSbmSCICfCd
         QWnVlgA0yMYeh1Xi0ZF2NyW7tTHxUEcuQ4CVuu4q8Q+YH5NBxwx0bersqVv439kLfatk
         NAmQ==
X-Forwarded-Encrypted: i=1; AL+hErEuJ8PfowiM8vuSGsdw5TbuJ8m1rvtQ6M2BRsAaX0xAsrzxDIEcjqeQ6WSV14nLUc+fc9vQTm3QMCTK@vger.kernel.org
X-Gm-Message-State: APuU4Z9NLj4HVFdCELia+ClCaZgk0yx2bcy1YltrlFeYdDycezqyt1UX
	fn7mFb3GNkrUeCqcPExfFxfbaPFwiXYV1WDEXN68DwaWK+WmzvdHe7u4
X-Gm-Gg: AYBFou0fRvnA/PdJhAmrah9u0uKw/MdJsAUO0UGCmqRNXjBUZf5pLD1vjGim6yR8j3u
	vOehlySItkP6qQu4tBcUK6xWtsqIr48BCAL+bZOG4Udm9qUV9LZQvw77HiuOxfGNxOGb1+/EPed
	PFFjhBxM4cRS4ioo4bmZsu3wyCtf2BAyUvjYp2gTXfLbhay28f7aRyJE0CYMD++aOyf8CrzpR5z
	3N2j+E1mTdIeOESiQ+yr7QcTiVzbpA3DTOOwIMedb4tGBve8tutFZ4MPuzdlcRkIw2WpM6E5D1p
	ZHmlNYILbbHptUg7uceK/8h34RicZZJ6rC9/plsZoJqv33MR36R6Ks9PJdRgMXLTKHp819luyDv
	BkY7e5Jweo3jUp+cNPPZvBN+qOlFJLMR6u3Zz17/qGjdeP3IkpGf1V58D+sMeQK0xVNu5Kf66AD
	vIHi5Y2HyS2RB87aZDxHF75lLIHLRWsY4mgmc7lnX/oj0QuJZyQM1jSxgLlAFnUvEqhZOF8L8iR
	TnXOif6JPL9531cqUv8Iw7eO9a5zcw2/6utF7dWS+kcpqKQLjSDFLQtfvlJBNa7kPzd9UCraPxx
	1ovcmLaUvwyC7azyiTNhS+I29JrskezYIWG0+lRsG++KwKsSEAwrm/kjX2IPKKc+ThlZhESQiI3
	UNnVwJV3y1OC/BmmD/bNdo3Octxv2Xa5YTGXNLPg0yPzPs1hSHgSe6fBG2ubbTcu7DF4fnaWLEm
	aTonAz/HqhwqiXomadsWW45mNQ+es9RAl4kLCcDH9pz0qZoK+IDL3Y
X-Received: by 2002:a05:6808:244c:b0:557:4340:4d47 with SMTP id 5614622812f47-57a09400d0amr6720622b6e.35.1795223465752;
        Fri, 20 Nov 2026 17:11:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:30 -0700
Subject: [PATCH v11 07/26] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-7-9721b1905ef4@gmail.com>
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

If the NAND read command or ready wait times out, an ECC read can report
success with stale data: the callbacks ignore the error from
nand_read_page_op() and continue with the page transfer. Return the
setup error before starting PIO or DMA.

After an ECC error, the driver checks the physical data and OOB for
an erased chunk. It rereads main data if scrambling was enabled and
always rereads OOB. If either reread fails, propagate that error
instead of checking stale data or counting a transport failure as an
ECC result. Leave uncorrectable media errors in the ECC statistics
for the NAND core's normal retry handling.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 45 ++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9d7e3e6f22b2..c5e429318de2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1120,11 +1120,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		sunxi_nfc_read_column(nand, read->page, data_off, data, ecc->size);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = sunxi_nfc_read_column(nand, read->page, data_off, data, ecc->size);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize + oob_off,
-			      oob, oob_len);
+	ret = sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize + oob_off,
+				    oob, oob_len);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1308,6 +1313,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1315,6 +1321,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1366,9 +1374,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nfc_oob_read_batch(nand, &read, status, pattern_found,
 				       0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
 
-	return sunxi_nfc_oob_finish_read(nand, &read, NULL);
+	ret = sunxi_nfc_oob_finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
+
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1453,7 +1471,9 @@ static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
 	};
 	int ret, step, cur_off = 0;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1461,10 +1481,11 @@ static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
 	for (step = first_step; step < end_step; step++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, step, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nfc_oob_finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1482,7 +1503,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1510,7 +1533,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

