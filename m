Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD0333374F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354904; cv=none; b=NhyfuxrZ0p9UTOdQEr165nKVN6BY8kW+srPz6eC8i+ZSA2uxretyA7oyssOPy3wuITFnnJ54VpXTdGN3/ViqeXRYMXWIuLS0ZhE6CxSatgX79dWeZNAFBcBr07kzayJ+qD4+U/WIiadMHW1PfJgAMdOwXdrlZyHQVjFxbp2LKvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354904; c=relaxed/simple;
	bh=QNBt+pFeHHzCr6qyz6aRzEV+o3fccMFb5SqOxfos0lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lB/XBMDtTsy/UafnvHc5nLhEA05Z6T2R20+O+98V0+L9BWU+r67qRyT2cXYhO1qTvfJ3byM1O7CtV8kgsQq4+h1dzh8UAWUh6kzoZdKZqMYK5OJUDVXGcP//cFs4s2mhghJViKOOwvgodUez8cb+A+h7AK/KGUCZPqNK/i2FPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAICENZa; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAICENZa"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f65ebea805so950400a34.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354900; x=1789959700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=OAICENZaoz4K0XlI/9aBA/4R/RD9KIJnyHqDRASJd552gvF6fPZczws7IuPc1IrqFN
         VV0r1dUjZFUgKOnyrmjg1bnjeVv1zbONy/0iBWfgh4EliM+VP1h9V9czGMgSAcqLJXgj
         /l6xLzYgA7NUKiWYys11WKreaTYL8zK2bSzIm4Cv69scg5bemO0DJ8KJbN1Ar/G0xOst
         rgnC0ZG7HInJEJWaFyBr9tJxz0NaJePRfi+MjKRmBSgJcy4jUyxRVWS5q5rOouDYI4Qs
         +7c5DA0LqYs+94GZ5VMcaY6PQHgEK9WrUQJIBkg9sLY4PAxSWY+Eb/RvgylXWsK6agkQ
         45pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354900; x=1789959700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=blti8yAny+8PxiYo4GoBOcXeiVBB55ymDBSCfyOJ6WqU9r1O2VsPIcwRRhXIQk7iBR
         VRtTsGgYZhsouMPSjzzQB/LyFSTXBk1vR2hTJDk43Rvc+KOdXmBrdh+05RfaE4b/1NLY
         gIJlXgu0b/h+KOm2/lAz63BlrZSMbKwHEVewu37jvbCNp7soPCMvuWD5dylg52rVa0wG
         /9pH54TLsyMoWFoS7xHgL/vJReYzdbb9aSJQjPHXJTPXC6c0FYMWYvc8nWdIsLoOvSL1
         n5nGkzWHAP350sB/PwVMprYzWZ9OQjSwM31i9Bmyu3eTLs7J55fdq4FEOKEfBOE+RfWz
         H4Fw==
X-Forwarded-Encrypted: i=1; AKwUvBy1ADCsazCt5hY0WJ+KOzjm6oBvX/0OFzVf7SwlBNvaRq7Y+5VZTMjhi+Zwd1bmilI2YqpAOgLMnbXB@vger.kernel.org
X-Gm-Message-State: AFuF++k4otXvXHaKmP0J9NBh4EOjULHlo4iiFynotxjgSSexrP4ZBA3m
	3guPIYEL6J+jvOj+V3CTh7GoVJHpXLdJYIa3LY/mhBnD2aCB6MThrYt3
X-Gm-Gg: AYBFou1f+278IzmaUVngLaRLjmnZjKyXgu7NB+UJLLc8rHrtTTPUZQdCveyy596fGx0
	RTrBZMTK2bAoL5Q+MC2JpnEZ2KmEwv7go0Z4wEC85F3fYuUYt8dq+QpMMnQ1PjSfneW85aFwnk0
	ySR4/77cEl9Pdi/BHv85nTwrXEZW++8MWp28fi0wNckBYPP0Q4nJEfd83A4dPQW5oFLpJxPG+IO
	IIl1QxPF+HlmCFemQztNJnDzwt/Chs9jlsyW3rvD41cjdaVgawPkywBp7++ApVTkY1JcdxgkNJe
	h21pZObT57saxZugePu7eWV8X6q78geFP6PufaEGuMyIs1gNJ4Gz5B2hXOM49rjuWfCPQ2SX8g+
	O9ssJ1Gb+gMly9MNUAJdZIPhyjtcBAXoeYbLetOAVBsmfC+p3ljWdEzWIUIzVMaFIGk68LhVK/v
	qdpa4pHwphFAFYhr8PaUXXwqCFtw8wkLEqmXKg/oK/jCNMtZB8uHn5xGt3tX1kEbNuo0ak72zWV
	A7yu+8vY02bwIMZIlKaMh/2/qGGXGHI4xdnjfck6jlOWJMw8+r0Bh5oxcjZ+m0ZDFlJxYzxFUVj
	E/7yafJZY35vA4tk+epDjjWrOjvBoyZ7eNSZPWHBYMFTzCKcz05bnfY2aT3cw1s06bcw2kJ1kmA
	hoo4lhw4je8/CQ3sAOUsNfMZ1BI+2X1Q=
X-Received: by 2002:a05:6830:3892:b0:7f8:4ac8:bd2a with SMTP id 46e09a7af769-80899a529a4mr493322a34.12.1789354899758;
        Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:08 -0600
Subject: [PATCH v5 02/18] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-2-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

PIO transfers always use hardware ECC slot zero, even when transferring a
later logical step. The user-data length programmed into that slot can
differ from the first step's length on H6/H616 controllers.

The ECC correction and protected-OOB write helpers instead derive the
length from the hardware slot. Pattern handling can consequently fill
beyond the current step's OOB region, including beyond the page's OOB
buffer for its last step. Writes can also fetch bytes outside the current
step's protected user data.

Pass the logical step's user-data length to both helpers, as the protected
OOB read helper already does. Keep the hardware slot for register access.
DMA callers pass their existing per-step length, without changing the
on-flash layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e50cf5b6a730..172c7c4b0ba6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1011,11 +1011,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
-						bool bbm, int page)
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
@@ -1069,11 +1069,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
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
 
@@ -1155,7 +1153,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1323,7 +1321,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1420,7 +1418,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1684,7 +1683,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0

