Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D88346E55
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122332; cv=none; b=emu2uQEbaGax8YXWXXVKJpRk3OW51z7H+pRvoXNQVrzGJLxoxYfFuDmkENi917nqRNwLja3CVFp6AHWaNEAy9DSkVsKeDUqdWX2Afjq1saMbzk2sLNf7/xA3hkO3JWl2+xD82q1aQMQAvTq6k6xrL1gPDHywti58z6hVyOc6lYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122332; c=relaxed/simple;
	bh=3GQZX5iNGkz0/Zep2FfFJdRYaRxOFK4ZULPjzOeOBBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAEM2qLW7hes/mg0D18wS/Fo3UPbuhS7jmBXTZfnGyM2/nLaqldoc/oug86ViY8IhzBlkweRIp0w0aJiZ4jzBXqoLNKt7a4NwS+aCpz9JBTYaB7QUFSir7L7AQC3ot7Z2K3QXLLaLoIdcOZ23oX0efrpkpyMF3reUAqNJILnSWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffmz47fm; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffmz47fm"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8241a56cd70so3923400a34.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122329; x=1792727129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDQOoNR8PIvzHZhKm/btQU1LikxfvBk4c4i5XkHFMOI=;
        b=ffmz47fmz0f9ZPuMKxEgjshy5qV5cPdCJYw7Ux602TAvXQ1wVHsVHLICAx4ugXACvl
         OimkRCfCGSh2jdRawqNLwFdJpIBm9JYvuZYdsYY4Hn5ulUalK4cNv43L4FS8HvH6/d78
         uAu6MNjhQeKDVeGEW/hoeVHMu4phVLW04HE7rEKOODr2849cwlY/87IOlBQ475Kr7Ooz
         X0Qjo0mxMMP+jpadrGDfe6V8viKQnoGlSk1CWKatLw3tEtZdsMhaZp/uv3K+kNVacQfi
         2Q2NprZeQQ4LGllcN8ax6b4ymolTcnTXLMtHVoYBgy9rRD34LTNTtFSKGOdQhEslBb3u
         lLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122329; x=1792727129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDQOoNR8PIvzHZhKm/btQU1LikxfvBk4c4i5XkHFMOI=;
        b=PVPQfVoXqhQr36jt65vwwbyiUwIOsMol2VweYbSDZk31eQETHUQRVvpib8WL5Lk40J
         1GVaFqEJnPU4HJymtaMmlKkTd+udvSiuRJTHh8wPMtAHyWSfjXKXbiyhT7fcLn6n23YA
         CDvGWooGIgTOCRAjC8D+0nMig3t42yg8c4o1UP8Qf+Y4CY4fDFY4Bx/meDZx/pIk8eCf
         9TDiE6ehp9I+4skH7Cscw9/e6A9SpWPASc1G7uRiZVzzn5toQTptxduv+v87fNZXIZDf
         +cJt95uN+zjNQ09GSfbKjXnC0YzK4E3UiakjYUxX5MX5A4VTriIkDARwGp9FuCDgFYs1
         Jg5g==
X-Forwarded-Encrypted: i=1; AKwUvByY0UsgCjIVICIa1fuhLw2ufnKLhgXCevK4CxqOrke8ro8bRKV76BZDq5++Q4ZFy65XqTh3fOwiN8lh@vger.kernel.org
X-Gm-Message-State: AFq9FYIsNKDxcwg4mKJVTxMxzPTG3PgbJY8CZTB6llPifFbBck/itWfK
	HYA8n+h8rGNZe7w/KiF/Lq53l3AYjNmAyO579fKO3y0OYKb8dM1KiuxT
X-Gm-Gg: AYBFou1kwETXjmMR746TPI+RHkzBL9Vmi4kHXM4qbTbhhLYwiS2O2ja307+dcCBAUmn
	tKWM0h7kKUnXsqWqSYoq9dZ4y/n0MI/D1JOvNMLWXanQf/4Cwhi3eHZZ0R6ry+vY1caou/vGFdI
	hOgUrg/6OQeLoh1iZAyrGUYIAyvHHxokEn4DnR0HQfRInD15HtOXGRM6qDtduzY03bYOfmusT4F
	45C+yS0eFf0h5zeYVVrW4+FNX0NZ+foW1dePjrMCBXloXTV8WiSLchEWpH/OSysfNMCHnafEjhR
	umHYz25dlObwZXMM6XPxq4T30BRR+VqyXQ8uVnz/YR8ovvYrF8G2CstJ4wfL74LBV07f3tUwmoa
	M8j6cVyqCRhZW0bp57+10U3IHdZ5ppBfmRQfKtBbJCooq1lyKLPm68ZYujeJLf1HbesRc4+cxyn
	38TRPvwshz7aaUKv6SzRgOw7BqnaJA7aL4dhnMmQ+5fggnzSTxb+re/ldG2fYC6Qsta3mUbzwbE
	CbkSYaNMOTPpMV6CwlEfhvMTlX8uzCClDr7e1Rbm/azJ3ZZOYVo0kOQNNnPzCg6tu8bvhhj/tm8
	62WFuleMZLPvsZKnkvytT6utaDcN32ySspfX0QEFPuvFSGpRGSYZqLj+LiqkgKv+HBWTn9PBHb+
	nmpA0sIV9gYUSMcNBplDcDA==
X-Received: by 2002:a05:6830:368b:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-8309758aae9mr19094737a34.25.1792122328983;
        Thu, 15 Oct 2026 20:45:28 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:17 -0600
Subject: [PATCH v8 02/17] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-2-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

PIO transfers each logical ECC step through hardware slot zero. On
H6/H616, user-data lengths can differ between logical steps: step zero
can have 32 bytes while a later step has only 16 or none.

sunxi_nfc_hw_ecc_correct() uses the hardware slot to select that length
when filling pattern data. A pattern detected in a later PIO step can
therefore overwrite the following OOB region with step zero's longer
length. The protected-OOB write helper makes the same mistake when
loading slot zero, reading bytes beyond the current step's user data.

Pass the logical step's user-data length explicitly to both helpers.
Separate that length from the user-data register offset: PIO always
starts at register zero, while DMA advances by each preceding step's
length in four-byte words. Update both DMA callers with the helper
contract so variable-length steps continue to use the same registers.
Fixed four-byte layouts and the on-flash geometry are unchanged.

The mismatched logical and hardware indices were found by code inspection
while consolidating the PIO and DMA OOB paths.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 106 ++++++++++++--------------------------
 1 file changed, 32 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 27d6ae635e9c..c2e97b8656f7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -929,45 +929,22 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 
 /* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	const struct sunxi_nfc_oob_ops *ops = to_sunxi_nand(nand)->oob_ops;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 user_data;
+	unsigned int i;
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, step));
-		sunxi_nfc_user_data_to_buf(user_data, oob);
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		unsigned int reg_off;
-		u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, user_data_off + i);
-			user_data = readl(nfc->regs + reg_off);
-			sunxi_nfc_user_data_to_buf(user_data, ptr);
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
+		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
-	/* De-randomize the Bad Block Marker. */
-	if (bbm && sunxi_nand->oob_ops->transform_bbm)
-		sunxi_nand->oob_ops->transform_bbm(nand, page, oob);
+	/* Undo hardware de-randomization of the plain on-flash BBM. */
+	if (bbm && ops->transform_bbm)
+		ops->transform_bbm(nand, page, oob);
 }
 
 /*
@@ -1018,48 +995,26 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int step,
-						bool bbm, int page)
+						const u8 *oob, unsigned int reg_index,
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
+	const struct sunxi_nfc_oob_ops *ops = to_sunxi_nand(nand)->oob_ops;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
-	/* Randomize the Bad Block Marker. */
-	if (bbm && sunxi_nand->oob_ops->transform_bbm) {
+	/* Compensate hardware randomization so the BBM stays plain on flash. */
+	if (bbm && ops->transform_bbm) {
 		memcpy(user_data, oob, user_data_sz);
-		sunxi_nand->oob_ops->transform_bbm(nand, page, user_data);
+		ops->transform_bbm(nand, page, user_data);
 		oob = user_data;
 	}
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, step));
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		const u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, user_data_off + i));
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		writel(sunxi_nfc_buf_to_user_data(oob + i * 4),
+		       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 	}
-
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -1111,11 +1066,9 @@ struct sunxi_nfc_ecc_read {
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1214,10 +1167,10 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
-	unsigned int user_data_sz;
+	unsigned int reg_index = 0, user_data_sz;
 	int i, ret;
 
-	for (i = 0; i < nsteps; i++) {
+	for (i = 0; i < nsteps; i++, reg_index += user_data_sz / 4) {
 		int step = first_step + i;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
 		u8 *data = read->buf + step * ecc->size;
@@ -1229,7 +1182,8 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found, &erased);
+						    i, status, pattern_found,
+						    user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1258,7 +1212,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 							      true, read->page);
 			}
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
 							    read->page, user_data_sz);
 		}
 
@@ -1447,7 +1401,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1673,6 +1628,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
+	unsigned int reg_index = 0;
 	u32 wait;
 	int ret, i;
 
@@ -1693,8 +1649,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
+		reg_index += user_data_sz / 4;
 	}
 
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0

