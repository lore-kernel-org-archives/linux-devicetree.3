Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924AA415F06
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 21:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420224; cv=none; b=s8NLTiOQAzQYDi8UefHsHmL/ZsHYEiAkxSmIAkpRXzkmon9L1ACPcfqPYT+39Eq2wuIlmRI5wBeCrffoknbusp6xRBehaLgRp2P4T/kW7tA+MQNQMdVZz0RCfnBGa0D2j9kmpPjuCSMUanmNTsbiZ61HuovLITpbMK54Y2c7BXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420224; c=relaxed/simple;
	bh=ZhwsgqB5mjFiVy7QQ4USypPx8q5jZF5EM5tixdJx7b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTLHH3UNmpB+VXe3R4IHSDwMFxfvdte6BRooc7q4845+XIO1nsPVDcEOEDY0C0CcFR6rpCjIpAAv0vSUHKKjJVPLEnoMtIvrDgiM++me9vk39xIUnGrOz0PGvoLtGblYXmXES4dnt81LbgVV71hr0cPN3n/z3S7c6IqLgfhD4MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdX4kHcQ; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdX4kHcQ"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6b1ae739df3so570364eaf.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420217; x=1790025017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=XdX4kHcQtohdE3X3AuuhPGwwYmZ38YUCF1t8fH89MNMGQ5RPhYSd4eTz7IzaPWi/hm
         JxTUqdMpd1xbqwV4mIIW7SsBM77AEAnBVTwzTREWV87z5lLqQoAKjwPYol60iW5B8fcZ
         rpQ51CAAAMufECzX4/7Ib2Vl38IuPA+6YpuGC6El8VjgUToeDUCX1vFUPzBGKj6wjcBk
         w/K0CiyjYANDQFZFLohkks6BgXb77ElCC9wdaNMlCua73JmitCgSsTP6zoREsnqYLxc2
         v0C3P1mL4clfuShcgbm1lUF+AUvGbGN3HRvPw4UxFKA0EgLEz4tNaOAtYVR95PI/5dfh
         XFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420217; x=1790025017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=L+W1fshvy72bydZRY04WJ3VJOk0/sW+pswPoNYDwrczZ4lHajNbVs94iDDZvEVAVG9
         gnWlil1Iq7RcAWL5ihmwqnswnOo9u2z5TGkwVUSHATTRhg5fEGW25QM7xONK0TMh8WVi
         Une5jrb9cZ7wBfuNkBSwAfgspwv70Iz65ANTZ7mgKw8rPwKfgBsKRPd+6BxG1qWtYYM0
         9Tluo9EYUYJ7QbTrYpSctD/4KrxyR2Bs3riCLvHPFHbBwnCWVYc/L4InkZBES5HQ1gbc
         8zkF0BS652BqEaGzdxsZPDlXe62BLa1h6HipfkIpLhbqSAyxU4Ih77wA4A2bQme2IepQ
         dDsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZmuLkXHbleoPZEFJbwFnW1zWJA6wtExmzqZwxKLAGNx0prXpnVY8AywwlFTGZLKB7bTamRzd3ibNG@vger.kernel.org
X-Gm-Message-State: AFuF++msWtwS3NFOnNin5Mws9X7fXdg4xj09NVYhUNB8EOra3rOuj8uJ
	69jLbiEfjkjNRqZT3SekHJwOWjwWhccB3a2r8Xw0rgy7bVDO3jCtZ1fW
X-Gm-Gg: AYBFou0yGqpsdASCDlAWCM7gBiYMl48fNMJi6xd8IOK2GduFY6/D2erp699Vjgpq4zi
	fGewe1eKFvNGK0izG6hZUjpXSfT0xTAw0JGcxWJqHAEav810UVxIACKApyOqAhrMDGmYIgpQk+L
	LMoiOzKBYerUog8rU/x2PrQrke+WU9clkW4DxyCbNzyBtbTaciBOdgWP123Pe69Pq5eKYe42mVd
	h7f3OTWgdqE7gKScQG9TxDb3Z++gtvXnEXWqa72CO60KhfZlfr3atDysmSVoQGyzrt+aZA631t3
	H631t/SpgkHesqkskKqiptxmIYclgIaBM+CkjZiv6Ru3K5mcQxZ3Y/8zk0ZQq1HG+UuiJa9S4nM
	+MQwNAtkIMLIkAxAIr0it0mhSELrP1HXIuuZmr+HYe69KpS3KpEl7kK0WZQXQw8HjpxrnLgDGvW
	35nq4LZkXV0Am9+rZFx6vrpnpsd541jURwZnQQ75I5yLXkeDMe1sNPr072USWW6HohH5UHAld5p
	J5XfIYWx6+jlgRFP0HubA90OwkrovvkiI0037Rm61Nvh0nCI1fL3aFm5y0gDfFnP93eaG4Eo8Z8
	+njhhos5SGLqMVTXIJUR8Kywb5u93g1tctQvnMDZmQP1vX4oG1PTfEx3GhKOjfXfki/nyz3u+9A
	vnJX3yxIPD9eJFTUo9Hx44ajAnjP1
X-Received: by 2002:a05:6820:1890:b0:6b5:ec3f:497b with SMTP id 006d021491bc7-6c639498c9bmr552266eaf.22.1789420217054;
        Mon, 14 Sep 2026 14:10:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:02 -0600
Subject: [PATCH v6 16/18] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-16-2fb084fe0751@gmail.com>
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f3234d2831ea..773ba55ecc07 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1808,8 +1808,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1858,8 +1856,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1888,8 +1884,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1930,8 +1924,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1955,8 +1947,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -2000,8 +1990,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

