Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B189D48A2BF
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942676; cv=none; b=EfIrkAkLp6f6PVn8TrIChApfnEzEllNGdJNJPLdaelcRsNiZ/AYV3GUrFJ1TYYJc3GSWcGF64C+OaRRksaZ+42TuJfvYcQGgnD7f6t9YLpg4rL0SedcOG2QYraYJxjdCsj6mlSQYhBefbtYeFAuo9fZ0yLTBLgtrQKleapQwWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942676; c=relaxed/simple;
	bh=lMdcdhYtYCAbzv2Kq+ncTMrjUm4c2U4X65RY3mT9uRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFrHFpmJW7x8WH6DHi3ANkf3RyRachDwa8fi4u77icibtpWTLX49TaifZTq578f5xT6n/JXhZxOnfxQBoq5YKZ8T2YD7nrd53Br/Cq78lenSZk8pFGDsh1QqAS7jhEWt+2aY6+gu73/+XnOYzLqShUeI1gajp8zkvrP/SvA7Yv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwAkivT8; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwAkivT8"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6be4202867aso252051eaf.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942672; x=1789547472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAB7sP/kuv2a2+DjQqOPqA2dsbZemJ16Q3uUsVl6HgY=;
        b=RwAkivT8WZGrI3jUUHtZvljQkOwa61RJ6VAZuyKdKfo8S1yE947ejuUKCnO1WwQqfM
         8xKZBYhzKYQx3ibcqnymJLRR1auWtzug8DmuW7n+A8ocwiUHQnhqSvW2vnbrwyuGHYUf
         vZBBhcSmQq2K5HKnrxlQrRQMGRuHVjWGTkytSEh6LUq+3sSu4VEf1P7NNMIFxo0rSO0O
         rLnOTDQdkTsg8797sk6y46tPRpKbZqnAbUvIL3npXjd/t/xwRwLkAM0PSNp995VtUg2F
         o0BOwSrSSzdW92biCyjGki2S7svi5lxqkPOtLPHpLHqIa7Ji0X0W7F1SoIPZHGeA+6Pw
         CteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942672; x=1789547472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAB7sP/kuv2a2+DjQqOPqA2dsbZemJ16Q3uUsVl6HgY=;
        b=cgekj5yOf2jjdH7fQQD49mKlDb049DfhjynmYbwtvWSLf5FRQikst7GD5oxiDL9Uoh
         2c1aLo6Ai7M+RmeujUm8tDjqxOVQd5z9wnFPKviMgSlNNLcp1Hb9KbClOiMdN85Du4VG
         UEpbX0tNUHIxJK86xZAX+LP1pQ3nbiuP8bwbqIpceJd1R8fuGfOAnHnWG7pS1g3LiIhv
         DetmYW3goIYHwtRBO6jBhTAe02o1zpjtxevRIa7lXVRQ5zamgi+fBlNihZVZkjZLZHj5
         hAGrwB+kpdWdWguXTuyQ5ACQ6q45j08PmFjapnvM3tMO65cVQvI7eyC/N12bISW+CM09
         BQgw==
X-Forwarded-Encrypted: i=1; AKwUvBxHHhsW1XNKdCPfmV9yGjk3VipC0RfxXBhgp+HDFPM//d7JH8w55Z7E04fLzNR0hXiX20WYoA1Akpq2@vger.kernel.org
X-Gm-Message-State: AFuF++k4MfsoRDFuIcnbJOwZVR4QIesmnVnlEGeGT4Qq+e3MPlH1P7vE
	qWZNp3H27julaYnu+sBihE+hxXRMjngkqTP7HXwg+BwPeFH+x3ZLS9kX
X-Gm-Gg: AYBFou04QSFglLQFzrK5YSFJNKEPLRlWiaip+ldqZmD/vg9ge5y57YemqAnu/ESUwpp
	0dSs4eoC/YZusfNmbrc2+578jOKRED4S/Gs3Ew+BhqgXBa5DOos3totV/mh8qjt+uVmInbVdYWG
	FMFOFMLLn22+QQ8G/iRJbwug6TyP9a1lWjVr/6dk/6IJ+1n2XRZVqej24/rxnICfGbfjZbeUYfz
	b/OoGNXwsEiA0/W6Yag8Adqo/F0Y7Y4Rvc0UFboeDF17Dh+AsC2QvBs2lzguM6Ar9wK9jPzr9ic
	Gg5bQG8cGforqTvpIJL6a5xSMTvCtJSkEw6S44hM1TGOudbg6Imyszq5Kwi6EbSy5gp9L5t4WhZ
	HgiOz6ci1VdYWI0hKiyu4LIu8C45912GnxxfNZXwTdkx6yJomelXjS4srETxxqC7gaaFgILQdcD
	xVHam4/7IsbVHMiH1YJOAeTBusaWOY5PzqVsHknWRo/xv868Q8j8dPtrU01bFdivjLe4S3NrFhz
	DiPcpQGeecsZiVbUDpgVwwJGpOK/2yRNaugvU64PQslunM+kGEObk8CC8EQDyv5pZC/Qst6jHkG
	YkdbHx0kEVxwTdhMfINZZyG2OFlpQBLhfo5k0qFtOS9kMAZIc58j5DAkqWVgjLMu7y/Sg3jBXIz
	NTG2BLFIBL4/tw65V8I6tpJF2jjIOKw==
X-Received: by 2002:a05:6820:f00e:b0:6b8:ef7d:e17e with SMTP id 006d021491bc7-6b8ef7de370mr14081411eaf.51.1788942671900;
        Wed, 09 Sep 2026 01:31:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:46 -0600
Subject: [PATCH v3 13/15] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-13-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
index bbfed22640c8..9dc742ee4344 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1743,8 +1743,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1793,8 +1791,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1823,8 +1819,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1865,8 +1859,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1890,8 +1882,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1935,8 +1925,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

