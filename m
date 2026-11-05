Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904966;
	b=5b+6SIfSgLkmCdA19ze6tVLIs0CeczoTgwRsR2yvtHaSFG6zmvnJ+5kbzmBIDo6Ttb9c
	 okifM+HpNSkpZmfHrLciG99FRPe8MaMvCTXTdBa+71dKHdEpE8VmN4EizJeKHHug4o/MZ
	 OkwYs4x0Xi76ON+hz6+mKyu9NK1okLQrFH+EoGyIPFKBYWn5pdBq2UngBhvAuTsASzwXY
	 o/JBTsQKw9DZREgW8lYGVn2Wnb/D9v9GffV3Sm4hFwy9fN7pOUqdGcSlkwfau3uDM2C3G
	 OT/Hr73iU8OPrac4iGrLzNgfScR7GchSQfDFj45iPqaKzsHdqaC2k6rSJMQcMnfcGug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DQAy4dqYs7TjtXxWS4cbH8B9UiQeX+sxPX5st3d37Tg=;
	b=cIFaumIuoSXay/bcTbuqf2YXIH8+3eHGb+7eC5Szsjaq1c2KrrM7k0t2Yczk7T5wGqHy
	 hqeZmOHJhsZ00C/phwGximQacISbBWE02c2k6m3X4w7AR4X+zuwFbhBgy89q1bF9BHtHu
	 v3idH+9EyYN0XUnn/jCOdNO3tyWsEoX5amo26mfmdgqrUwLroMtCeAJ0ULu1g+CzD0x2T
	 Zck2+uZY8Vk8Uw2WIEYW4tfju4T8eNB59x2Mgsot7ih1TWqQJ2LrZ4lX4sH4MZ2KfuE74
	 HCMhrIxuVH63W8JzoymKMvaFxhxRsEhJSLkE6H9S8BJAS6WdsPx6rxTcmcvmLNFBp7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3e5AYPZ;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76AA606EE93
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E76AA606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3e5AYPZ
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6d68de53053so1245085eaf.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904965; x=1794509765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQAy4dqYs7TjtXxWS4cbH8B9UiQeX+sxPX5st3d37Tg=;
        b=x3e5AYPZX8UzQBEWmXVSoQy5JHsuQXKvXcZ3RxIZF4MNzqPwaz2aZOPo+jlV0JGC6N
         PR29VNggohtowiCe6kKxCTKmoxoycaPn1Z6HLLN0NO0eWp/CVwxRfGG/UGe2I643nvac
         Tz/8HB+ciBlnfnT6D1FboEjPkllMQGdGmPkM5qBQWfIuDuh3F5IZhkDc6PlOl9bTpv4h
         zB2ZTqOgH86+A0Q2kago5hbj4AIY6ex/OOacKeMjfjZnzJyti/ZX4UQM9+FxLp3YMuFV
         kGazplu9OuuaQ4v6mSATTJvQHv9pM+ZFh5p/kmJA/x8p5omWhGw/pb6zbpn/G2BaPxRu
         viQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904965; x=1794509765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQAy4dqYs7TjtXxWS4cbH8B9UiQeX+sxPX5st3d37Tg=;
        b=mMJE1zourtWLFbbDZbwwdY7q8ZBNz4bzcpfvgpczAkIbNXWIx8wTilyZNnrv8SkuZP
         Se55KFhhMbZgTsAa2+ejb2OEEeKH2jEVR4rDZuPNrlxZxm3FS2QSds0Vuzs7wWre7awA
         RIH2RUmTAK3OB31Yb8TB/vQaUweUZiUdlEaFiZxiqRngJoAnDqFBCJAHYGQqBK313uQ1
         iZqjjFShRxAm+/uGV91LXCaPv3YT1OLCPT7S97tPf0v5rkJ4Bufb15gynEC3assZ7qdb
         7eenaufLsATW3cRM+PupHZGWv08esMiSmkeKzgrf5htW1rIv60OTzS6zBty8va1BsoWS
         3eKA==
X-Forwarded-Encrypted: i=1; AKwUvBzpg62QgLX3yDoJRzQPJ1qI57uBiSfKIzF4l4tYC3XfNr7HrBJaBcSNT4QiuMfXN5FEzGf7iExlTRdR@vger.kernel.org
X-Gm-Message-State: APuU4Z+6mYkSLwqm/F+GkdjotRaw0crPjmCsaeXartJlJ8sTP3F7Xymu
	zyhSq8tGE/Bq2J2QoM/DRJCUQrZKKzJzrwua2vpBaCNsCZzgXPJomYARrJxm75pO
X-Gm-Gg: AYBFou0LEYMgUghzf+RzbwVSWeL6DxfR8ZJZXc+7r274/tNzEH3VosqfI+aA+uGoUSy
	Ljy+5EvkqpZgdaVUB3ZWTC3RJ1ay02HasNcq8ahpS4ejifLv3XKUC4z2MYpNq8QQH/SyAVgIMTj
	b7pacHQbi64WEddKAHfvuKmOYLAsF6+od5F5qcB47VE0ujM04f6rhrPieKIHpyn+mk0NFpAJLxK
	rbIoet/lZ7XlApsfVxinjwu+x+yOeJfVubjSyhbibyx7MVcfmHS269pg6vEqzFSru62ujCt6+yo
	d8KOqf/JqGOcC0RDSdGHlyklLesxBtgNeCJoa2LizuU0LWr7uLnnxrQiYm4bS+CEpH7gpXUuHDY
	CCyzaVqEyPATnigdSNEP6p2suFc31D6bzbP6Uqg5V/xyOZXI97PHdKGUsGy19QkpnvcjJXbTIMg
	uICft0Ql60lNbK7oiHQx9hMRYKKLvCeqMBXR+78V4Ge1eEMygPCVZKfj8Zus8YycP4mmWnucRCE
	zvZmY3uRGvInrTeUiTFqaRitEzzMNOpd3jevySUE+fxxhFjpnDIi1xMHthfUT6xNwreBh30D97T
	ULLPY3z7I3uRAAt6X4/wv15OTcA6WaJI/FY0S2iQ2oEhJRZ/jH3VrDH1BGXxt7aAHAtsgdu7zHv
	S7I2iJ8XJULNShhtiQtJRfFUxxUrruB8A5h2hbpMrQcR0//vQy6MKWnlGLvy+6eBWYCjleVmB8m
	X7efENQhPHs+g/32JxWILSaPgh/nKWNbB7Tk4fRkRgKRri1Kj+j/82
X-Received: by 2002:a05:6820:340b:10b0:716:d710:3f2f with SMTP id 006d021491bc7-716e79b789cmr261602eaf.64.1793904964805;
        Thu, 05 Nov 2026 10:56:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:38 -0700
Subject: [PATCH v10 22/26] mtd: rawnand: sunxi: reuse ECC status within
 each transfer
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-22-dca1f6ed29a8@gmail.com>
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

A completed DMA batch leaves one ECC status bitmap and one pattern
bitmap for all its steps. Four consecutive steps also share a packed
correction-counter register. Reading the pattern ID for every matching
step and the counter word for every corrected step repeats MMIO accesses
to the same completed result.

Snapshot status and pattern information once per completed transfer.
Reuse the status read when the controller places pattern-found bits in
the same register, and read the pattern ID only when a non-error step
needs it. Use a cached accessor so a reader can request pattern IDs
without knowing whether the initial snapshot already fetched them.
Cache each packed counter word while consuming its steps.

Keep the snapshot local to a single transfer and invalidate the cached
counter before processing it. Consume lazily read fields before starting
another ECC transfer; each PIO step and DMA batch gets a fresh snapshot.
The ECC decisions and returned correction counts are unchanged, as is
the page layout; only redundant register reads are removed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 108 ++++++++++++++++++++++++++++----------
 1 file changed, 80 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e8286dc360ac..11fdc10c7f14 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -261,6 +261,7 @@ struct sunxi_nfc_timings {
 };
 
 struct sunxi_nfc_ecc_read;
+struct sunxi_nfc_ecc_snapshot;
 
 /* OOB geometry and interpretation; callbacks may issue supplementary reads. */
 struct sunxi_nfc_oob_ops {
@@ -276,7 +277,7 @@ struct sunxi_nfc_oob_ops {
 	 * Return zero on success or a negative I/O error.
 	 */
 	int (*read_batch)(struct nand_chip *nand, struct sunxi_nfc_ecc_read *read,
-			  u32 status, u32 pattern_found, int first_step, int nsteps);
+			  struct sunxi_nfc_ecc_snapshot *snapshot, int first_step, int nsteps);
 	/*
 	 * Finish remaining OOB; return max bitflips or a negative I/O error.
 	 * cur_off is an absolute NAND column, or NULL if unknown.
@@ -1212,23 +1213,82 @@ struct sunxi_nfc_ecc_read {
 	bool has_erased_chunk;
 };
 
+/*
+ * Transfer-local ECC result cache. Pattern IDs and correction counts may be
+ * read lazily, so finish consuming them before the next ECC transfer.
+ */
+struct sunxi_nfc_ecc_snapshot {
+	u32 status;
+	u32 pattern_found;
+	u32 pattern_id;
+	u32 count_reg;
+	u32 count;
+	bool pattern_id_valid;
+};
+
+static void sunxi_nfc_hw_ecc_read_pattern_id(struct nand_chip *nand,
+					     struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+
+	/* Zero is a valid pattern ID, so track whether it has been read. */
+	if (snapshot->pattern_id_valid)
+		return;
+
+	snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+	snapshot->pattern_id_valid = true;
+}
+
+static void sunxi_nfc_hw_ecc_read_status(struct nand_chip *nand,
+					 struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 pattern_found;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	snapshot->pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	if (nfc->caps->reg_pat_found == NFC_REG_ECC_ST)
+		snapshot->status = pattern_found;
+	else
+		snapshot->status = readl(nfc->regs + NFC_REG_ECC_ST);
+	snapshot->pattern_id_valid = false;
+	if (snapshot->pattern_found & ~snapshot->status)
+		sunxi_nfc_hw_ecc_read_pattern_id(nand, snapshot);
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int step)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, step);
+
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(step, snapshot->count);
+}
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
+				    int step, struct sunxi_nfc_ecc_snapshot *snapshot,
 				    unsigned int user_data_sz, bool *erased)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 tmp;
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(step))
+	if (snapshot->status & NFC_ECC_ERR(step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(step)) {
+	if (snapshot->pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
+		if (unlikely(!(snapshot->pattern_id & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1244,9 +1304,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
-
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return sunxi_nfc_hw_ecc_read_count(nand, snapshot, step);
 }
 
 /*
@@ -1315,7 +1373,7 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
 static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 				    struct sunxi_nfc_ecc_read *read,
-				    u32 status, u32 pattern_found,
+				    struct sunxi_nfc_ecc_snapshot *snapshot,
 				    int first_step, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1338,8 +1396,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found,
-						    user_data_sz, &erased);
+						    i, snapshot, user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1348,7 +1405,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		}
 
 		/* Both patterns are already filled; only all-ones is erased. */
-		if (pattern_found & BIT(i)) {
+		if (snapshot->pattern_found & BIT(i)) {
 			read->has_erased_chunk |= erased;
 			continue;
 		}
@@ -1384,7 +1441,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
 	}
 
-	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+	if (!(snapshot->status & NFC_ECC_ERR_MSK(nfc)))
 		return 0;
 
 	/* Finish consuming the batch's corrected OOB before raw error rereads. */
@@ -1392,7 +1449,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		int step = first_step + i;
 		int data_off, oob_off;
 
-		if (!(status & NFC_ECC_ERR(i)))
+		if (!(snapshot->status & NFC_ECC_ERR(i)))
 			continue;
 
 		data_off = step * ecc->size;
@@ -1434,10 +1491,10 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	int data_off = step * ecc->size;
 	int oob_off = nand_to_mtd(nand)->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, step);
 	int page = read->page;
-	u32 pattern_found;
 	int ret;
 
 	if (*cur_off != data_off) {
@@ -1473,12 +1530,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nand->oob_ops->read_batch(nand, read,
-					     readl(nfc->regs + NFC_REG_ECC_ST),
-					     pattern_found, step, 1);
+	return sunxi_nand->oob_ops->read_batch(nand, read, &snapshot, step, 1);
 }
 
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
@@ -1489,10 +1543,11 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
 	int ret, i;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	if (first_step) {
 		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
@@ -1554,12 +1609,9 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nand->oob_ops->read_batch(nand, read, status, pattern_found,
-					     first_step, nchunks);
+	return sunxi_nand->oob_ops->read_batch(nand, read, &snapshot, first_step, nchunks);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,

-- 
2.53.0

