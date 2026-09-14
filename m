Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F36415B76
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420212; cv=none; b=MOkWits6b1JxHXjOPxE8Cnqsv13Liv4vz5miJwWfvO74jgRrDE1kglLuTlOctu9jFVInKJDz80UONsmK1w6L2GmMs2o+A9UHRw9wI6CmIQizalFIWwF4wCjT/V77nPd8zUYwWjDZS8z+NpSCn3vfYkShiSly+aGplYAyo3LNFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420212; c=relaxed/simple;
	bh=o3NPqjDQtjCU8+r59n9WbZaWXsVSsfQ6oMXDXHHDqIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3fS/SkcRFHZtaMRzzumMULAFb5hH59cz0piwwB87KuCZw+K8MQXMl2CodEOE67Lh7MPlezdvMpgEiL0+nzGpPXX4kC4Tx5JV0v3PBz5PhsRUTQ6dJD9De6AB4Q8hjn4mhFjqDlaMqQuHPV2oOmuKOrIDq5vn+RET2sFSGaoAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMGrK6vv; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMGrK6vv"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c66ba0b762so455572b6e.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420208; x=1790025008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gIMuO5LgsmThmwiwqzrGE8ky+825OhMeKFgclE6Udc=;
        b=VMGrK6vvL/fHg+2LM3PwyFkia5K6WQCN9uBr7YFQ+F2fIgTbtA0ZOSuYRePfbxDi9E
         3cfnHAlZ2LMUfPwMjuPqCnWLdyCl30Fr6PzoZYWvpw8ZPevbr6HmEuOOPl28a+SCNoqF
         4yrsjl+A24hefg7rc4OerKSMYSkASQejaKTAc+AN661hKopjIL939eFugVuG/2CvEAQt
         MbN4aFQTxYrAmpqwbCQTD1BOhjEK6nqxq5xG3QBqKfuQRDDR2kv5SZR+QWPcVDD51xga
         5hJj4TCs3K75Km+Rf+X49Zsmm5GluboG425391Ag1N8BwB4iKSUFmZrrm+wnd7/nptvd
         hLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420208; x=1790025008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gIMuO5LgsmThmwiwqzrGE8ky+825OhMeKFgclE6Udc=;
        b=0QsMQx/IYTpAqA+uV51GR0bxoojlJwtQ6bh02NSrSe+vW0BF5o9T0fE9dImxrZHgdF
         YJp+8HWR/8dpzQ5I4mMxYDzsPP8jXO1eJ/KTRsMCvECUkLSgwGoMllsAVPawDyeGa7n5
         YSDg5sR/kzCcLw9bQoUDejzXAlw6jobUdXTgjK6MIektgelRPUmKGSZMUZpn3ppncBUd
         /O857AH/zEpWOyoEv+cba61VcOMfunXyEsgIwx/rHOTN8a4RH3QO3kKL2ggSOnVORq9V
         MjdmNlmpM/+2wTgjKqPnwVk6jQcBe+Kpy9fP6Au3VAYx+pnczJpi9CJMf1faxLtO5sxC
         +CNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE4aBNArofydP/pkKqoIvG/XYPiAeEkoZxiCaWoe9pAnl4b0NSKcNCqdpSAv4GJOvWmZmLAqZBcrct@vger.kernel.org
X-Gm-Message-State: AFuF++nZo8xIfv+oZ0KJptPV46KRAANJODJtunWNEdxWo6vRpVuIAwA+
	mwSPbIycygFHwOGPaCyfbQFm042sb9IO6uGxV74+nlWhP4VP5SFGsKCA
X-Gm-Gg: AYBFou38d54TzpuI7zLU26p1bhLbiziAef8F8wBY2jdUJQET3N0cRvID1OOAzP2q64b
	DhVkuWRsVdIknXaOAyQ1k2t8cK++OqNngjm2gfCYysUYuPbWWEgZq6wqFRpFtOTZ9X9b41r4JxD
	vnNUpmfRKZ2gLWWLLBUROacFGl74xyzYqI5U7/qsOLM58cR/b5v3TfQ9QXYmDrsPzjTeB/aw3eO
	QSISAxWv2lh5kRzT4ZQn7gd42reY9C6UpQgzSmpezGtpyTl8Ip1uFyVDT8JU3w9evL6fVdhjtCw
	uqvF6lA/bZu3JvzTwoXG0eDiZ0kUx1p3hDtvDO5ujKxiEPMeNtCL6feJ1ekLu2TFgp9WIvSTaw6
	qnKpZDLA4rZ0EoewU1cDEwcrgXhLxOLRWUo5UwkhXO52Pl43ndm2JOOeV4Ai/yzLWwIbdrkwERf
	SbvAF/f1ruvIm/yvSMoh5I2O4zGpSaDQB4FQ+iEn+y8QJr4LGTDOm2jmWv4Ai0e/eFGg4MVcsfI
	porkBp6LAWHoe6WF9whWrhRUzry0i1j/7JovSshIC+UMYVDRQXw1JkA3PrIxKDevWJOm8rvADfG
	ZqwSjInnwjFyUOHDXUfcpVuRIqGjXPlfrF4PR+Yn9poXm7SxMUaxDBA6DLyOeHzzezi4HkdPehS
	nkL8L9C67B6GRPpI3c8AjLC/avsDC
X-Received: by 2002:a05:6820:1899:b0:6b5:ec3f:4987 with SMTP id 006d021491bc7-6c63a55903bmr501376eaf.34.1789420207811;
        Mon, 14 Sep 2026 14:10:07 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:55 -0600
Subject: [PATCH v6 09/18] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-9-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The hardware-ECC read paths use random-column commands to revisit main
data and OOB. Small-page NAND does not support these commands, and
nand_change_read_column_op() rejects pages of 512 bytes or less. Ignoring
that error does not provide a physical reread: the erased-chunk check can
instead inspect stale buffer contents.

Introduce a read-column helper which starts a new page read for small-page
NAND. Let the NAND core select READ0, READ1 or READOOB and send the row
address. Keep random-column commands for large pages. Pass the page number
through the erased-chunk fallback and use the helper for normal OOB reads
as well.

Retain transport errors and only classify a physical chunk after all its
rereads succeed. Read exactly the requested region so the tracked column
still matches the start of any trailing OOB.

Also select PIO callbacks for small-page hardware ECC even when DMA is
available. The DMA page sequencer uses large-page random-column commands;
PIO can stream the single 512-byte ECC step and its OOB without them.

Keep the ECC geometry checks unchanged. In particular, the usual 512+16
geometry still cannot fit the controller's minimum 28 parity bytes and
four user-data bytes. This fixes the command handling for small-page
geometries that pass those checks, not a demonstrated regression on a
previously working 512+16 device. Software-ECC and raw callbacks,
large-page DMA eligibility and the on-flash layout are unchanged.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 40 +++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 13dc0af56eb3..e29638c828ca 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1079,6 +1079,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1087,7 +1097,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1095,13 +1105,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1169,7 +1178,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	const int nfc_step = 0;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1179,7 +1188,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1217,13 +1226,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 		return sunxi_nfc_hw_ecc_read_error(nand, data, data_off,
 						 oob, oob_off, user_data_sz,
-						 max_bitflips);
+						 max_bitflips, page);
 	} else {
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
 		if (oob_required) {
-			ret = nand_change_read_column_op(nand, oob_off, NULL, 0,
-							 false);
+			ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 			if (ret)
 				return ret;
 			ret = sunxi_nfc_randomizer_read_buf(nand, oob,
@@ -1285,8 +1293,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1386,9 +1394,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 		if (oob_required && !erased) {
 			/* TODO: use DMA to retrieve OOB */
-			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							 oob, ecc->bytes + user_data_sz,
-							 false);
+			ret = sunxi_nfc_read_column(nand, page, mtd->writesize + oob_off,
+						    oob, ecc->bytes + user_data_sz);
 			if (ret)
 				goto err_stats;
 
@@ -1416,7 +1423,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
 							  mtd->writesize + oob_off,
 							  user_data_sz,
-							  &max_bitflips);
+							  &max_bitflips, page);
 			if (ret < 0)
 				goto err_stats;
 			if (ret)
@@ -2305,7 +2312,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

