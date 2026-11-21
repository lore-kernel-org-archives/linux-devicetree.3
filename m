Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223465;
	b=uZQ2ipGdQda2Z69RYjKcuRIVeg+525uFS2aJn4+QAouQ1hDQbOwi8BU/Gxm9tfdc6Sso
	 9OEMRfcgUrtKcYpwvr9wPBbtyhkbhl5QTWuQgcmOURKtITifdEp/eiBq7CVOeCfxvzawO
	 oJ+VYoMixlXwbEEycy9ymTu8mvwei6uyo5kLyFBKIHwQR9jKW+MFvUJ+N9TN32ndxDjjq
	 IMDtjr6vByaW0LyNLvT7f1Dvm2PddmsBu9e60Flnt7PlfXSSImCdMFF+6LtCrNW+E4RnO
	 7ckI6fhR5iuoW7vbm6YW9yYf5aSs91HagT3KzU4isCbTqQjzLxzqutq8wctz/UCdnHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DQGkpSAcUEldrefS3FgTooTEIoCcU3OOOCqakdoP+Go=;
	b=ZLFalDvUTXYPu35dCSPosqJ5eAyC2+6Zxwi0yD1AriEmVMiZpWFKVCaSur2zmr3u/mtb
	 ipxV5xOwr4eQjuHrS8YcKCmbUXpNW00U0xrpPOzPbvSw6VI646pvuaXALJOeNUIgPjpSa
	 kAbW42fack5R/++2Dg1uxRj5T5dwDQ6RxJT2TLDcOEV4zEY3+komAfNVJJts61r2cP/o9
	 kU4hPvrWq5SL9CzjL/ygAD5N1g411UvG0bE5qZnxMQ7JC+wPIhe1eSapEMShbhrCeAkpP
	 DDllOx4dHW8KiToN/48tl39fOjLszoQYiOGfZH25QjQCSu1YZ26FR37Z5ZyJgVMzAAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtKTVdg0;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64782606A6B3
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64782606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtKTVdg0
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-833e671ee9fso1454926a34.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223461; x=1795828261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQGkpSAcUEldrefS3FgTooTEIoCcU3OOOCqakdoP+Go=;
        b=PtKTVdg0TBSFwEMvs0ufRtpT9ioQcalRjBzMfjMbrTJBdKkVOxeDIBK1C4l1yEX5F3
         R7PYfs7RRkMe+Yc4UibocTqa1yY1M3TTkhAqCqtT1xMcwibJSGuLLs4xah2ui+f5xtxf
         oHq5orG3WcU7nW19hCnCZcOn4jU9ZRbZv4HJnU1WNdoVUAjpFIjdXFZ9XV5bVuCi2P2Y
         GpCAeNP7DOOo7B7KFDWIFh9341w3vST6e5hYwkqUTwGyn+PfPHTkxhtbqowjgFO7UOSu
         /TrqV0IURgYSsnKSdoJ935mFfyDtinY3Ohv4uPPA2hTLO2SqAAT0310PuCXleJ1OsoL3
         QIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223461; x=1795828261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQGkpSAcUEldrefS3FgTooTEIoCcU3OOOCqakdoP+Go=;
        b=R4op+mRDdIKGVm5eCjK8QyNFh3Ig74wVyu/sxNCg2kDMpqWqrz0F3J5VONJoNFVxqQ
         hF7eknbdeYKk1mNRg/zICjHmp4lJQV022DDyxL5HXUf8kpO/v4IOpUHQ50NkEvNfrxdu
         sOW2Itq7bNyKWOXLZrfyp8EOYzMk4v/gKXGrxffZ4u4BEADHAXHF9So+cm1+BFjp1KL+
         Ep7ltPx6cYw37M+A99+b+jv6LCgl4umOFIAjJ//f9eoM7kh07MM7idT8mamKg/iylQB9
         df1lu4DN0cNwlGnkSV9D0NuwWPQgc0gdt0vgBUFocved+yAWcoEuoEAeU6WE46Q4HCgu
         6RIg==
X-Forwarded-Encrypted: i=1; AL+hErGsg0pVwkS9DD6fMKl/spkGp2GjI8u8PDFs7prNK1tRtDyrAuRSOB2pd2k88dHsc6vPxFW9X1GQL6DZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/a5Yao22CyjZYZqfdJ6fYTgYEXDntlErSqT5/MUr5kO6tos4dx
	tvMSoVWgQyyLnTnVju/WRZhZjwe4OJg0KF9WtN83dyiUzSUZsG0+BkFr
X-Gm-Gg: AYBFou3SiPvBOJ2aHTytJrwvVcZLLUJgxbr7iKYMmZYyi4MtZ97GZXfGIfc2N4eLOvg
	x718GGal+LYbgOi+nxdTPURPzWBMeKHi6oV7FjONPgneIBLyUuc81dVzRCFEvqg0KhDNsq2HSNf
	KgiMXsT7YCc2V/ao7zeB5+8aOuwcl6VuHN12AkB+hw5IMJAsq16gOPD7T+BnPwX8Ul3AaagEOs3
	0pgP1Cwf1aBm4EcN8MOuwurP7NCSQiPg25lTixaozDOAhSBrdUyjsmcuaVqJ6evq1D6w3vBIGRy
	HYhHZbtWH/l6UiM17JaJf0qef+bwbEWvCwjVWEn5t/ocxk4fILszsuV6kfaUBBehunbuNIT03Z8
	pKNa2RZ+cQMIyYLTlfHVzGyHvH0UUhOKJQfzzbMrNdxnBqYLpamy7rGylJsmrB3HR5LCI/nU/eM
	YR/OZ6X2M4RXAKsXglduHERPZyxmRw4t9ZEz+Z+ebCL0gbCkA8WtoIjRWyT4dTnpvDl+Xc75CGq
	v9uaLDKsuKLA+AML+oGJPEX/YgCFwuCEjC57WRahnmHj6HhQxpInEUKWOG9y73x43yRz+Wg3uN2
	rfgelWLO8aAxyeSNXx9MisfVs4O5ksI/XXn1acBJjEc4ijQRMbxsks3o77Qy1fuwhWF8dk5MTwr
	fPuBqLUTbCzt3z/p0Ji4a4nUCeQHrIAqFGRHXudIGw3//jk5WwVcK086wQdFtxpqn673ou0t3+d
	Bm4pSdA84/n97Sik5d0K/73RS7IT428SrlMzGfxAuK7EAo8VyLDWcp
X-Received: by 2002:a05:6808:30aa:b0:4d6:90f3:74a4 with SMTP id 5614622812f47-57a0c0a40e2mr5697337b6e.47.1795223461220;
        Fri, 20 Nov 2026 17:11:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:27 -0700
Subject: [PATCH v11 04/26] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-4-9721b1905ef4@gmail.com>
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

On H6/H616, when a PIO read detects a pattern and OOB was requested,
filling the OOB with that pattern can overwrite the next step's bytes.
On the last step the fill can run past the end of the OOB buffer. A
PIO write can likewise fetch more protected bytes than the step owns.

Each PIO transfer uses hardware slot zero. Looking up the protected
length by slot therefore always gives the first step's length, which
can be 32 bytes even when a later step has only 16 bytes or none.

Pass the logical step's user-data length to both helpers. PIO still
addresses hardware slot zero. DMA passes the length for the current
step and still addresses the same user-data registers.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 96 +++++++++++----------------------------
 1 file changed, 26 insertions(+), 70 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8c5aed1fdfb3..ffbe851b87c7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -927,43 +927,19 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 
 /* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
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
+	/* Undo hardware de-randomization of the plain on-flash BBM. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
@@ -1017,48 +993,25 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int step,
-						bool bbm, int page)
+						const u8 *oob, unsigned int reg_index,
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
-	/* Randomize the Bad Block Marker. */
+	/* Compensate hardware randomization so the BBM stays plain on flash. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
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
@@ -1086,11 +1039,9 @@ struct sunxi_nfc_ecc_read {
 
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
 
@@ -1213,10 +1164,10 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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
@@ -1228,7 +1179,8 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found, &erased);
+						    i, status, pattern_found,
+						    user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1257,7 +1209,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 							      true, read->page);
 			}
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
 							    read->page, user_data_sz);
 		}
 
@@ -1437,7 +1389,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1637,6 +1590,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
+	unsigned int reg_index = 0;
 	u32 wait;
 	int ret, i;
 
@@ -1657,8 +1611,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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

