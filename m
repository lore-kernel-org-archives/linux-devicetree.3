Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223464;
	b=1cJLtloaBm0tmTye7wdGDvtCGm7Wo5nGnJBXnkE/IjXv1/Pki5DbE8VeDmI8TqNAJeSG
	 qBTqtKp2CafiYEpVLz/q6YQAgtTpH4Y8CZXkrot1/HFmOzFaJ/pGQfJn0jcEmOrs1NevX
	 vTSjUPAeg456FSn/ZXRCSjFDZhvjmqZe+v+4cabxBtFvVIdZ0aCDmczOSciSuXcFp/1ap
	 RpSY7PoJZPzo0uM0athNyY3AvpZLLL0I6l2kPXdBbwVBiyHw+8lSu2M2bLA9IutF6OSN7
	 jCu75znIKisBlc4mqQH7JihmrJQR2EdPL53pB2Mupex6kVx8qW47I241uSDNfCcezvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jSA/8+JIJhXyIE6wPAaPD1PdPonBWuUoA8eu4aZnEWs=;
	b=ZGDkrw1ff92e3/z3QWlmvEqHlNtjop29aZn1G88I21ZNusWdElBZoOohTQxZ7adAXpJs
	 rZDJJgBl580+4eyfDwt5AYGxz9dQUQ7JQ/m8xIRVXmvbhQhgQf4X8uM1IhWyHgSw69RU2
	 BNgUup7oEpJ4p/WgLhWk2dpZx5g89qhWnYpiqWIsB+RGIrEpPG7rG2WlC0QYSrQ3s60DK
	 /rWInyGVv6jz8RuySUdN6KNAi0jLIb0Hd4PQXMgQLkkUNqkTyMFbmFS6bZFeE8/nr+tDE
	 s6uo7vf6SQsmKoaAnFkbI7OUliWflwosj7alGeRNvuTnbc0r4Oxxfa6mlBIaJDBRNWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hT0S+JG8;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB69606A69F
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB69606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hT0S+JG8
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-862aca1ed4dso703010a34.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223460; x=1795828260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSA/8+JIJhXyIE6wPAaPD1PdPonBWuUoA8eu4aZnEWs=;
        b=hT0S+JG8I6YYgGITV7Jl7Aif2ijt0Un4OiRttS6vndWP78uQgAHyUswlHhS1iJGuY7
         a++UyVtijuvwLSJH51qU4VonuHyKNrp7JBjFSqBulgyAdjqMzLDv6va8AIsLe5EVAQSK
         UWNSKtm5zV6c00U0eHoXTdnNZM9m687hTWFJPt5A7IPhcXxKG1DIcTv1PyLXZkT+foRL
         bUFJTRUm6DhtnEHC924/1lLOXAYYqQgJIfbJ28po2nG0krf0d3XK0EfVrTZjJh74ce8a
         oYyDwvnONHAjKWDlEu2Qp7LG6ZY7nuKJBsmXYjREQKYZYxY4lTIe+OSijn5Y0y477/6x
         TMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223460; x=1795828260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSA/8+JIJhXyIE6wPAaPD1PdPonBWuUoA8eu4aZnEWs=;
        b=WN4p5JggHGezd7saBcZdMuxWlssN2Pl3wLXoGSaXsAdJXN/09QjIeWt0v7gjvnhPW2
         javuNS3ZXQSGWyXuejRaUoRuiUcKIGXUmGYyG7O69t2Ig7epF80Jt+K9MsVJlnRVk933
         d3KErSQfRH0ip9kI2HCqqqlR2hPacLUbbFXvKWV9Gl84KhR2nmhA8kXeVQerYcfc6Mw0
         EBdSWOgGAUSeo4WVJW84bGDzR211DJqaeVFDUtHDz02dm+T/QjoNK2/rlDj5zYeuFAbI
         sAj4WAoaZfO2epNWgczyTfDiBv52mQ05eb3cuFiqnGx0k6JmIZVgeZLEKK+XUML04VPZ
         +SgQ==
X-Forwarded-Encrypted: i=1; AL+hErEpWqLwSYu6fJAiPlUNWKdGVrm5nkJXsy1Dobg4HoGSq0Tjzr+R6wocsh61fKU6Wq0t6nePZjon5c1d@vger.kernel.org
X-Gm-Message-State: APuU4Z+/STxkR8BvJuhzr3SoIfREuzejG+s3JE9f0dajKedT0QkmtmK3
	OiszK0+0dqHR9PXS47eSsjyYCs0+9H2o83edSDYBqnHotN6Mk5J8hppS
X-Gm-Gg: AYBFou2vyGhnq600s6EdamTfq3r7xDwSy/USJcktbl3E4IdJ22TmrVzkoAZMJL37J9q
	+8JNU+FRZou56bZbk0QIi/4bpVsTyO8CsIPAE3S8LG764jvr+abiwf8DAfQuNzY4lgR+BnmyFBU
	evAJzPCJ9jvqjBU2H7CXuL935Jim1uoHDL2wRHr7hBpZPHafP+w45UL88rEVQJcInSswaTLnos+
	1mC06B/BsBexO9uejSKRLPXQtCtZJZJfS92CkLw5VJs+kCtXlcjx5PfM2lQiHYsizmtr47GIVO3
	gJV152LR3x+eU7+N+0MOBni6TvKI+//bRIeMhaZR22h1t8OMlpVzTxZKtDnEBWHPqOv7/1I9JFp
	rreYcY9VratY5QcfE5U8BeoUGLJf9R08s23CSGrEKRLdBL37sZoWF79qrxTta9msngsTlW7j9y4
	kJmJQEfuYrSnDEnmTg/nmg8kY8bbqBohE65dMPXda8Reqwn43MwEALhR0fHMJs99RNnpzGideTD
	MgbErzDKX59MndzUo2dMy2+ho3y1fcN/4fhDYJCBF1GECt8endBdVrN7KBZOtXu7EpZeA+hDASY
	e5VSDjnmFGxhgd/hnSfdDz1ALS5Gon0UMPz+MJpFXUtpn4Lz2jDacxBdxxaCljISILWvaiTFsJT
	xjaMvUHBtPcxFyarlyibfT9gARwdKCLOCPf1X7P61U2hT3AUHtWK9Ep5fGQBpzHlMiUvZ6cSflK
	cREG1AUnWWDLhlOOAEad6Rq4qThW8oN1Ipw0yURAHiV19IEYinpvk2
X-Received: by 2002:a05:6808:3503:b0:4f5:eaac:5151 with SMTP id 5614622812f47-57a0b0414a8mr5815721b6e.39.1795223459632;
        Fri, 20 Nov 2026 17:10:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:10:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:26 -0700
Subject: [PATCH v11 03/26] mtd: rawnand: sunxi: share ECC read handling
 between PIO and DMA
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-3-9721b1905ef4@gmail.com>
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

For a full-page read, the caller should get the same corrected data,
protected OOB and ECC statistics whether the controller uses PIO or
DMA. Each path currently implements its own pattern handling and
erased-chunk checks.

Use one PIO loop for a full page or the requested steps of a subpage.
Pass each PIO step or completed DMA batch to the same ECC reader. An
erased-step check derives its data and OOB positions from the logical
step, even when the controller reports its result in slot zero.

Keep the page buffer, correction count and erased-chunk state until
the read is finished. DMA must collect corrected OOB before any raw
reread, which can overwrite the controller registers. Keep that order
and let each transfer path issue its own commands.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 446 ++++++++++++++++++--------------------
 1 file changed, 216 insertions(+), 230 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f57184927fe9..8c5aed1fdfb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -925,6 +925,7 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 	       sunxi_nfc_user_data_before(sunxi_nand, step);
 }
 
+/* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 						int step, bool bbm, int page,
 						unsigned int user_data_sz)
@@ -1073,6 +1074,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+/* Shared across a read's transfers; buf remains the full-page buffer base. */
+struct sunxi_nfc_ecc_read {
+	u8 *buf;
+	int page;
+	unsigned int max_bitflips;
+	bool oob_required;
+	bool dma;
+	bool has_erased_chunk;
+};
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
 				    bool *erased)
@@ -1112,98 +1123,6 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	return NFC_ECC_ERR_CNT(step, tmp);
 }
 
-static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
-				       u8 *data, int data_off,
-				       u8 *oob, int oob_off,
-				       int *cur_off,
-				       unsigned int *max_bitflips,
-				       int step, bool oob_required, int page)
-{
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
-	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int raw_mode = 0;
-	u32 pattern_found;
-	bool bbm = !step;
-	bool erased;
-	int ret;
-	/* From the controller point of view, we are at step 0 */
-	const int nfc_step = 0;
-
-	if (*cur_off != data_off)
-		nand_change_read_column_op(nand, data_off, NULL, 0, false);
-
-	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
-
-	if (data_off + ecc->size != oob_off)
-		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
-
-	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-	if (ret)
-		return ret;
-
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_randomizer_config(nand, page, false);
-	sunxi_nfc_randomizer_enable(nand);
-	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
-	       nfc->regs + NFC_REG_CMD);
-
-	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
-	sunxi_nfc_randomizer_disable(nand);
-	if (ret)
-		return ret;
-
-	*cur_off = oob_off + ecc->bytes + user_data_sz;
-
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
-
-	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
-	if (erased)
-		return 1;
-
-	if (ret < 0) {
-		/*
-		 * Re-read the data with the randomizer disabled to identify
-		 * bitflips in erased pages.
-		 */
-		if (nand->options & NAND_NEED_SCRAMBLING)
-			nand_change_read_column_op(nand, data_off, data,
-						   ecc->size, false);
-		else
-			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE,
-				      ecc->size);
-
-		nand_change_read_column_op(nand, oob_off, oob,
-					   ecc->bytes + user_data_sz, false);
-
-		ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-						  ecc->bytes + user_data_sz,
-						  NULL, 0, ecc->strength);
-		if (ret >= 0)
-			raw_mode = 1;
-	} else {
-		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
-
-		if (oob_required) {
-			nand_change_read_column_op(nand, oob_off, NULL, 0,
-						   false);
-			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + user_data_sz,
-						      true, page);
-
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
-							    bbm, page, user_data_sz);
-		}
-	}
-
-	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
-
-	return raw_mode;
-}
-
 /*
  * Returns the offset of the OOB for each step.
  * (it includes the user data before the ECC data.)
@@ -1225,6 +1144,37 @@ static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
 	return step * ecc->bytes + sunxi_nfc_user_data_before(sunxi_nand, step + 1);
 }
 
+/* Account for the ECC result and record erased chunks. */
+static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
+				       struct sunxi_nfc_ecc_read *read, int step)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	int data_off = step * ecc->size;
+	int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
+	unsigned int oob_len = ecc->bytes + sunxi_nfc_user_data_sz(sunxi_nand, step);
+	u8 *data = read->buf + data_off;
+	u8 *oob = nand->oob_poi + oob_off;
+	int ret;
+
+	/* Check the physical representation for bitflips in erased pages. */
+	if (nand->options & NAND_NEED_SCRAMBLING)
+		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+
+	nand_change_read_column_op(nand, nand_to_mtd(nand)->writesize + oob_off,
+				   oob, oob_len, false);
+
+	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
+					  ecc->strength);
+
+	sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, ret);
+
+	if (ret >= 0)
+		read->has_erased_chunk = true;
+
+	return 0;
+}
+
 static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 					    u8 *oob, int *cur_off,
 					    bool randomize, int page)
@@ -1252,18 +1202,157 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		*cur_off = mtd->oobsize + mtd->writesize;
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
-					    int oob_required, int page,
-					    int nchunks)
+/* Interpret one PIO step or a completed DMA batch before reusing its status. */
+static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
+				    struct sunxi_nfc_ecc_read *read,
+				    u32 status, u32 pattern_found,
+				    int first_step, int nsteps)
 {
-	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	unsigned int max_bitflips = 0;
-	int ret, i, raw_mode = 0;
+	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
+	unsigned int user_data_sz;
+	int i, ret;
+
+	for (i = 0; i < nsteps; i++) {
+		int step = first_step + i;
+		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
+		u8 *data = read->buf + step * ecc->size;
+		u8 *oob = nand->oob_poi + oob_off;
+		bool erased;
+		int bitflips;
+
+		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		bitflips = sunxi_nfc_hw_ecc_correct(nand,
+						    !read->dma || randomized ? data : NULL,
+						    read->oob_required ? oob : NULL,
+						    i, status, pattern_found, &erased);
+		if (bitflips < 0) {
+			/* Preserve PIO data before the raw erased-page check. */
+			if (!read->dma && !randomized)
+				memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
+			continue;
+		}
+
+		if (erased) {
+			read->has_erased_chunk = true;
+			continue;
+		}
+
+		if (!read->dma)
+			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
+
+		if (read->oob_required) {
+			/* Keep the existing PIO and DMA representations of parity. */
+			if (read->dma) {
+				nand_change_read_column_op(nand, mtd->writesize + oob_off,
+							   oob, ecc->bytes + user_data_sz, false);
+			} else {
+				nand_change_read_column_op(nand, mtd->writesize + oob_off,
+							   NULL, 0, false);
+				sunxi_nfc_randomizer_read_buf(nand, oob,
+							      ecc->bytes + user_data_sz,
+							      true, read->page);
+			}
+
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+							    read->page, user_data_sz);
+		}
+
+		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
+	}
+
+	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+		return 0;
+
+	/* Finish consuming the batch's corrected OOB before raw error rereads. */
+	for (i = 0; i < nsteps; i++) {
+		int step = first_step + i;
+
+		if (!(status & NFC_ECC_ERR(i)))
+			continue;
+
+		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
+				     struct sunxi_nfc_ecc_read *read, int *cur_off)
+{
+	if (read->oob_required)
+		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
+						!read->has_erased_chunk, read->page);
+
+	return read->max_bitflips;
+}
+
+static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
+				       struct sunxi_nfc_ecc_read *read,
+				       int step, int *cur_off)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	int data_off = step * ecc->size;
+	int oob_off = nand_to_mtd(nand)->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, step);
+	int page = read->page;
+	u32 pattern_found;
+	int ret;
+
+	if (*cur_off != data_off)
+		nand_change_read_column_op(nand, data_off, NULL, 0, false);
+
+	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+
+	if (data_off + ecc->size != oob_off)
+		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+
+	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+	if (ret)
+		return ret;
+
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_randomizer_config(nand, page, false);
+	sunxi_nfc_randomizer_enable(nand);
+	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
+	       nfc->regs + NFC_REG_CMD);
+
+	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
+	sunxi_nfc_randomizer_disable(nand);
+	if (ret)
+		return ret;
+
+	*cur_off = oob_off + ecc->bytes + user_data_sz;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+
+	return sunxi_nfc_oob_read_batch(nand, read,
+					readl(nfc->regs + NFC_REG_ECC_ST),
+					pattern_found, step, 1);
+}
+
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_read read = {
+		.buf = buf,
+		.page = page,
+		.oob_required = oob_required,
+		.dma = true,
+	};
 	struct scatterlist sg;
+	int ret, i;
 	u32 status, pattern_found, wait;
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
@@ -1310,83 +1399,12 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	status = readl(nfc->regs + NFC_REG_ECC_ST);
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	ret = sunxi_nfc_oob_read_batch(nand, &read, status, pattern_found,
+				       0, nchunks);
+	if (ret)
+		return ret;
 
-	for (i = 0; i < nchunks; i++) {
-		int data_off = i * ecc->size;
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		u8 *data = buf + data_off;
-		u8 *oob = nand->oob_poi + oob_off;
-		bool erased;
-
-		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
-					       oob_required ? oob : NULL,
-					       i, status, pattern_found,
-					       &erased);
-
-		/* ECC errors are handled in the second loop. */
-		if (ret < 0)
-			continue;
-
-		if (oob_required && !erased) {
-			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
-
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
-							    page, user_data_sz);
-		}
-
-		if (erased)
-			raw_mode = 1;
-
-		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
-	}
-
-	if (status & NFC_ECC_ERR_MSK(nfc)) {
-		for (i = 0; i < nchunks; i++) {
-			int data_off = i * ecc->size;
-			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-			u8 *data = buf + data_off;
-			u8 *oob = nand->oob_poi + oob_off;
-
-			if (!(status & NFC_ECC_ERR(i)))
-				continue;
-
-			/*
-			 * Re-read the data with the randomizer disabled to
-			 * identify bitflips in erased pages.
-			 * TODO: use DMA to read page in raw mode
-			 */
-			if (randomized)
-				nand_change_read_column_op(nand, data_off,
-							   data, ecc->size,
-							   false);
-
-			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
-
-			ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-							  ecc->bytes + user_data_sz,
-							  NULL, 0,
-							  ecc->strength);
-			if (ret >= 0)
-				raw_mode = 1;
-
-			sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
-		}
-	}
-
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
-						NULL, !raw_mode,
-						page);
-
-	return max_bitflips;
+	return sunxi_nfc_oob_finish_read(nand, &read, NULL);
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1458,45 +1476,40 @@ static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 		*cur_off = mtd->oobsize + mtd->writesize;
 }
 
-static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
-				      int oob_required, int page)
+static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page,
+					    int first_step, int end_step)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct mtd_info *mtd = nand_to_mtd(nand);
-	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	unsigned int max_bitflips = 0;
-	int ret, i, cur_off = 0;
-	bool raw_mode = false;
+	struct sunxi_nfc_ecc_read read = {
+		.buf = buf,
+		.page = page,
+		.oob_required = oob_required,
+	};
+	int ret, step, cur_off = 0;
 
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
 	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < ecc->steps; i++) {
-		int data_off = i * ecc->size;
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		u8 *data = buf + data_off;
-		u8 *oob = nand->oob_poi + oob_off;
-
-		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off, oob,
-						  oob_off + mtd->writesize,
-						  &cur_off, &max_bitflips,
-						  i, oob_required, page);
+	for (step = first_step; step < end_step; step++) {
+		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, step, &cur_off);
 		if (ret < 0)
 			return ret;
-		else if (ret)
-			raw_mode = true;
 	}
 
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
-						!raw_mode, page);
-
+	ret = sunxi_nfc_oob_finish_read(nand, &read, &cur_off);
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
+}
+
+static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, u8 *buf,
+				      int oob_required, int page)
+{
+	return sunxi_nfc_hw_ecc_read_chunks_pio(nand, buf, oob_required, page, 0,
+						nand->ecc.steps);
 }
 
 static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
@@ -1517,39 +1530,12 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 					 u32 data_offs, u32 readlen,
-					 u8 *bufpoi, int page)
+					 u8 *buf, int page)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct mtd_info *mtd = nand_to_mtd(nand);
-	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
-	unsigned int max_bitflips = 0;
-
-	nand_read_page_op(nand, page, 0, NULL, 0);
-
-	sunxi_nfc_hw_ecc_enable(nand);
-
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = data_offs / ecc->size;
-	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
-		int data_off = i * ecc->size;
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		u8 *data = bufpoi + data_off;
-		u8 *oob = nand->oob_poi + oob_off;
-
-		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off,
-						  oob,
-						  oob_off + mtd->writesize,
-						  &cur_off, &max_bitflips, i,
-						  false, page);
-		if (ret < 0)
-			return ret;
-	}
-
-	sunxi_nfc_hw_ecc_disable(nand);
+	int first_step = data_offs / nand->ecc.size;
+	int end_step = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 
-	return max_bitflips;
+	return sunxi_nfc_hw_ecc_read_chunks_pio(nand, buf, false, page, first_step, end_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,

-- 
2.53.0

