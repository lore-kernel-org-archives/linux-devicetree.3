Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904960;
	b=NZASAT0vGi11TubQaI0KmsBmOXA/AtS6W6+XSqMvHqCbo+Y54KN72Ml4s2W4PTeo7QZk
	 cfpFWp7mUzedUTJ57hqQbSQa/7sBwjiZ29f+mzuyIEjwirSPo8V4v9aD1Z/33uFPARgAA
	 zWcF01b2Xk9VSdtlFFE9dCucKpFKCKzzgzYz0jvFzYIhJDRLyZM0AmDRubzDBLbkYpv/W
	 /nakCuEypxqP/Frk9MEZBfQXBzaX5tGlpbol4986wg779eaatfii5Mvt3msJSt8PbVsRB
	 6FEhPnm0JFm6iC+yueX8rtp7q/53i7Snx3CbxTWYvazblPkXQSgwCahVJ1+yLZe2pmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=r8+AfGGSzvw+hGNMBk3uLeKXHLvj2EOr91SQHPXuh2g=;
	b=rHTDdlc8BTgVfeLa+i3pQAYNC6iFw472jgNTGiCuqZnI4qk9GnLi8Kzv5CtKF4ugcnls
	 Xg+csXwtqoHOFeQbmdEPh+FqaVbEl2g7CS3Ln1MBhQtF61c4Bno7tz3dTHtqgA1RBX7OO
	 q46IgbwtxdimDMpwIbazIhR6LpfqbftT2rXbDHcMSdIfbgGjOHrieMk+Co3jUiWhE1cAf
	 sBA5JJ2gK7zTdhMBybGnaVevOY3p8iE2J8wGkMd9mozNqbLrLZBESMszPz4tQS4kol/Fh
	 8R6mZHM7BZi5uLqc95fnyWEowh6dnKdfEmIYd9h1LeucGlnnsw43+YEiqyuEliZwIPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DditZOAp;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83FE6082BF4
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E83FE6082BF4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DditZOAp
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f8a519e215so1084431eaf.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904959; x=1794509759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8+AfGGSzvw+hGNMBk3uLeKXHLvj2EOr91SQHPXuh2g=;
        b=DditZOAp9Oa1DZD5AVzzsep4fe9OmK0Igum7b2A1uLgpHjJfBNf9R4+ShCkoao/aUZ
         QfQlSpsgJDt4qnyTPpXkCQEtJmRBqVzmSK4Uo3h+k/etVZhxu+F8jI3pYXZCgfPrARCq
         6b7v6kR1uZLWZ1oqM68eDBLyx5Qp5XDxooz9yO3mcTkl9RHWjvGieGyATssWmmvUahSm
         MPdaxy5diwBnU1mjolMpP3w5FDBDCvniFMxV+AhCfKvrdFt5ZpEMKt3opODkdmHL1Pke
         AdoFu0cclF+xbejhc/TuLWpeRh4Gf9viw9IiLfAbT84hKJfaQiO8LmyBX8DZGTQDmZzv
         a6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904959; x=1794509759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8+AfGGSzvw+hGNMBk3uLeKXHLvj2EOr91SQHPXuh2g=;
        b=mNgPI6fvcD9EiuGeCm9xmwxFYAeWPwqgmiH6yOLS9Yi4HfHSobMfgt66I8Z/dJ8w0F
         DpBOU0pzMpDOa+lzZr1fPjW1ipaeik7DKB0dKJtdERJLEOrB8uV8i/Edx0LaQ+M4px9P
         HIVnxS8Gm7ZVhHii2pV0HFODO2dYBtyJjIaTldSclzZRjmfCbGgYy4OQrGl/1tW8VKP0
         xwKv62zTI2BnpE32o06w4MT3idnt5FuBhcFZZsuPluXTIC2m5Bej9qf2Rr+8h+NCY+qR
         9Q+Eiuk4X5tdBTxoY7jyYC635Q/1SyK791vH+ovioJAbZZB4poQUsK+/AWIsCl+6EoS1
         8reA==
X-Forwarded-Encrypted: i=1; AKwUvBylvDglB4CIs5GMhmE15GJKz8Or2paFgTk31gutWkvFOIZBF+9ykqwtvIYihYqOnCkqz+SxN4zGifh6@vger.kernel.org
X-Gm-Message-State: APuU4Z+5Pp2W5rQqOsMtyA/iKughRRvF6cgqkJ76cKiX7upsEO7ZgqH3
	JBpTs9wpgUAkLtAEnPq8D0jvbqj4wkizqg3K/A/l7CSbouaM6XPeo6mc
X-Gm-Gg: AYBFou2YASkB7t+uzZ6VuE4RMByNMXFNKM6AIflOFkC6pWwWWoFhokDXyC/lZuKy7UQ
	Mag+w2go97a3IZCgvSnrHjEDrIPsLf5gZyd3rw17Zm+dDf6rz+bqIVyYNg/7XlJfaQ0Pg8LDflG
	IjlX2jcPvddb03tL03BFUuezTGri8vOWx7lYXIK3zkdU3fufnY3yHaN5lNz7Yv8pZDssj6cUVqB
	oWAIXPUESnM/Rwgw0TTWodBpLbCW/qotKWUqSNMP0T2GVaf95jh2OaT96c/A93ltoB74CTDPoAO
	nBgLPUmUrQ0kAOznmMlkreSaxPHF/ruXnCnIvHm+VKjEvEl4K0lPBfTSKFg3g4bQb8Jp/AzMGD2
	8l/0SVEHL0fS9xE3gZoOpuo7TRElxHcjEdaSiR73FX3ZzC6a7nNPxvUO+BlLYJgrMKEffwi5VUf
	IQdnMqZfpDwFqegtdYN2ohDJds7tAxNNNZ63Lmiham7XlK/xL6I2H928H6CFs/FujI08F1OQ1Oc
	zIz0x1lo8ugZmRrSp/hdz/0g5maaPKyVNZ7ki0/PguoMqs0IUKFxQvwIDceealGi0DRTQBlLTji
	kdSOsBXpcwlmj1UmWUDpRxYwaKS0fyGR7x9dOWb3NKSD4hvgz7lN8qW49xUVc6E/tCYfPpGAK7U
	eBszUU4SggFqimltzme22J8i8gLELlvJ0G6dPGhcIW9b+02ByfvbYu72y3t8xCbfkvwLyxK+3Cz
	0olFgj8aBLGtiawOhxGvEritrQ+FyycLp4IZgYGnVgJDlPontrSf60
X-Received: by 2002:a05:6820:609:b0:70d:53f5:e5fb with SMTP id 006d021491bc7-716e7374b3cmr330726eaf.2.1793904958904;
        Thu, 05 Nov 2026 10:55:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:33 -0700
Subject: [PATCH v10 17/26] mtd: rawnand: sunxi: limit buffer transfers to
 the command byte count
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-17-dca1f6ed29a8@gmail.com>
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

The H616 capabilities advertise an 8 KiB SRAM size, but the normal-command
byte counter still holds only ten bits, with zero encoding 1024 bytes.
sunxi_nfc_read_buf() and sunxi_nfc_write_buf() use the SRAM size as their
chunk limit and advance the buffer offset by the requested count. A count
above 1024 therefore transfers fewer bytes than the helpers account for.

The operation parser already splits data transfers at 1024 bytes, but the
extra-OOB helpers call the buffer helpers directly. A sufficiently large
unprotected OOB tail can thus be read or written incompletely while the
page operation returns success.

Limit each buffer transfer to both the SRAM size and the command byte
count. Share that limit with the operation parser. Existing 1 KiB SRAM
controllers retain their chunking, and larger buffers are transferred
using successive commands.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7c80f52c517d..636a04f49418 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -89,6 +89,9 @@
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
+/* Maximum byte count for a normal data-transfer command. */
+#define NFC_MAX_BYTE_COUNT	1024
+
 /* define bit use in NFC_CTL */
 #define NFC_EN			BIT(0)
 #define NFC_RESET		BIT(1)
@@ -690,7 +693,7 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 {
-	return min(len, nfc->caps->sram_size);
+	return min3(len, nfc->caps->sram_size, NFC_MAX_BYTE_COUNT);
 }
 
 static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
@@ -2606,11 +2609,11 @@ static const struct nand_op_parser sunxi_nfc_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
 );
@@ -2620,11 +2623,11 @@ static const struct nand_op_parser sunxi_nfc_norb_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_soft_waitrdy,
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),

-- 
2.53.0

