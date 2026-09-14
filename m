Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A646C36A342
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354926; cv=none; b=LIEcU9QtmxM8Qa/pbSC2uRoiwwF2FN4VrUl9E6GJggiFsswrG+np581QNhWeMlCxKmmCLL+emm48I7TuWWfk3u229LheWFQwciWaWBaQiK0K5qkGGggweEbq/1pP+injtTrhOtJLOh1pw4o1c0Fr+jUtH87ZIpB7TC667QxnZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354926; c=relaxed/simple;
	bh=ySqoYQ1XnzlLitXctoBmkfL5K98OvUxXEwUoBjaPCPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Haqd0DRN5Yb3A4OyeD09+Ger9yF7p3sGz8O4Mm1xbor++B2SQywi9xc8QYBsEm/WLjyHy8kNpMrzjoJIsuA5b7X8/B8KqfsM1kNMIEv8hCdINGN2/Gn02BwA5jzt1kz89wtxJwKA9phWXuyKBQANoRR7KOYMEK+330nakluRl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcXjYGQr; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcXjYGQr"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f57db8b5a4so2452975a34.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354923; x=1789959723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWbz9jOOwHMkOzJhcyeNlTXZtZx9bja+bTwtbiwOKWk=;
        b=VcXjYGQr5EzSNkheN/pgerTEtwxKzp7tQydtJpRgumjy1HOTLM45D5nu/feXGyVXDr
         4ywL/K4sKCk964w0F/u+bJ4ovFON5HI46vAA3vzuxsp69HTAcYEz3JXEQtAGR+C6hRfk
         qvhOqdlTy8UqlJ1snYPEgLLL91QlOPbdsCsK2mFxzvC2TUZkQQqp0klIa+4/YqQu3rA4
         bR6dwZxSWB1ItpCWqDfWTXmEQNIToa0jGMa1MvvN3TBg/Ff9o/0U85vkD4tHtmtv/MW4
         s2+3CNiVTzp1hqQ/Zqb+gbOoELq831HCq5YZavOuWejeqvlRnBPuOeNOlgBV2horHoGu
         oz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354923; x=1789959723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWbz9jOOwHMkOzJhcyeNlTXZtZx9bja+bTwtbiwOKWk=;
        b=JSPNX1LYOAMZmU02D3kT/TkTTc33umg0m1Jv+5HTcyCQxJZuYOfR4rRCyOMfUd27SF
         J/g/4UjK7ov6DqzUx3i0lHlaHIYb187r61Ort3zEGE3yo03RJ6crL5bLlmDjU7WCz9GK
         zZgDyRVOPaEszr/0x4ukh6G96UqMpF+xEv/JG+96MclI8enZ37ZoSvnMOSJ8YXOLtgCW
         3YdzDBLzuW6FnCT8RHriqyDePq4NQFGlV3Z1JtCvU1QuAarGFi6y8tV1GL82j2OXEP1L
         buIYphIMmrbJ+54GsKecWMPEUiP0YbjA7HPMP6pFXpJy1JJsB91dOk1qrVHWD21RzTzZ
         RxKA==
X-Forwarded-Encrypted: i=1; AKwUvBxRogqT40spthfcm3C09zg8cML4Fjz0w+0RcrmblsMP/aUwnoiUhygQqkYUBnzT5gHYZLpHGHxtHGi9@vger.kernel.org
X-Gm-Message-State: AFuF++mMMWCmUMUP/yQzQ/8eMOqrva5FOd20kNmub65Lqm0DSvdDK+rP
	2bpT7tHAKJAeJ41cPZMg0fVH6BU9MEyW3NONxWFw7Y+ekncI/97wOgZ1
X-Gm-Gg: AYBFou1KyGg3l6jIqZSuB6NkHHbSb9RNg/3B3o6/SsKrPwGNe8Y3NrPFGW/0E9sMqGL
	C9botFS71aRWL3vDRi+IzU1838+4xTr5wYdLYVXdvWneDFgWW/Ck1WfoImCcMutVtDu9UKyzjye
	XCqAm21WYun4wXgyBnt+r9frde5oD+AKqdIf3EXoBttUlmXdd4B97zHqQ2r0RwiuyuasWFPTyx2
	HX8A706fnCGT8GCtDSVa+wFe0ivtWPJeWbPjOz7u2vwUe/o4FjmdwPu6qOZVo3SDXA3wtbQCDIk
	gAMrHr0IN283WqBbtbxSxwauhwTAscRULgqQy0HJFTh0dULPPswheiV/sjPMzRKvvC8i9rqfp6K
	8o5qAMMflzkEprMP7kgrYFt93nEzudrvihqcHm4ldOl6Vlxlsa6NKhHxnLDmSN3luYWz8pov6aj
	yVudiiBtCcEcoRcV0DET7GGSA6i+iCZem/vgFk/BvTXEty77QkelnSOL5ZARrbriwndt3lGnB3+
	kzyRGj4Q2idcHk0Q7VrvW3GROAt9640e6XABe84tV/kcvstxEf+VngkM+Bk161YvW47H8oKKlsX
	bD87NIErvVn7L5r/Hy6xKwjyPTIoNE2Oj4bx5142yKE37ZUS0Y82hIrfZMv/9kteUxtWqJplqar
	tLeusurbD37z4FXBOJF5ZZf2jIVJ5eipvs9PcDpRb
X-Received: by 2002:a05:6830:3888:b0:7e9:ead3:4449 with SMTP id 46e09a7af769-80897489f75mr263437a34.6.1789354923503;
        Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:23 -0600
Subject: [PATCH v5 17/18] mtd: rawnand: sunxi: reduce user-data length
 register accesses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-17-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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

DMA reads and writes clear every user-data length register and then
read-modify-write one field at a time. Multiple ECC steps share each
register, so this repeats MMIO accesses to the same words.

Build each register value in memory and write it once, including zero
lengths for unused slots. Reprogram every word for every DMA operation
instead of caching hardware state, so controller resets and switches
between chips need no special cache invalidation.

Share the length encoding with a PIO-specific setter. PIO always uses
hardware slot zero, and its page callbacks clear all length registers
before the chunk loop. Write the slot-zero value directly instead of
reading and modifying the same register for every chunk. Keep the
per-operation clearing so other slots remain zero after DMA fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 75 +++++++++++++++++++++++++--------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4103337f6a07..2b8ed142c9bf 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1005,35 +1005,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int hw_step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1223,7 +1248,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1540,10 +1565,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1733,7 +1755,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -2037,7 +2059,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -2045,7 +2067,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0

