Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223476;
	b=Idl77eUDs6uVSbZFxAGfMj/M3lMQfGgUxYrNuEP/d6mZB5ahXZUlS2mWH5tetJkQScu7
	 nqZDlaRnb6wMC+P5FCOiipHUtjfvcwRTWIfxGGD4BPs/H/zxllrG6gbo+5fQCZepMsP/G
	 JrFpSwvvdhdz001xkvO63qszCGijnwUNaXg9rOyEXidVICh6Wl6IdxR5E9WKcVnWiCimf
	 4aSGqg37C+wS1OtPcTzd1dAa1IKZEK0NvXS7aR0Mk6YNQx9lGpZrzI00J0nDwGaU06nez
	 et3DdLjzIIZkJKOuAnIz/8YTRtlbIwFRGyjycXQkT7TFeTSSNHGO3wQ7O1SWhQ3gSRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0IrAGyQNQ+9vmexJ3HX+RGvKm7PP0ZR37lEcYjBayK8=;
	b=OAAYQ1if4Dcor2DCqUGLsLQgQth8hsFSJxyeWTr+UARavlx8/U0OEiBdEpDGp064z06V
	 rdymsyuimR4aKSzZ9lWBXqO2AtjpwGaFlIgw9HlKqpCu2uZCD1tEi6v1CMV/lZbLQmFjJ
	 NX9Mgxndd2A40bRBq5OZqALit/0tWt0sLjyk3b8hm++VgBfdE+dwALoVz/8wHcqSpybui
	 pqRWp5Cz0DSIDJ5spAJmig8AZ9ebOIdmuGM92Adp9s1iEEn6jFTpZQ29ZM1IFk9htHXV8
	 l8BbpU0UKbdf0KZaAR+mq//WBrMWLbR4xM22JwNFhj6p/Y2XnwKhljke69CWBrkzjlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wA+gocC3;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8560A2619
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E8560A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wA+gocC3
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-702dedeb70dso977029eaf.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223464; x=1795828264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IrAGyQNQ+9vmexJ3HX+RGvKm7PP0ZR37lEcYjBayK8=;
        b=wA+gocC3cINfQJysjlhm1wWwd9fwDKpCIMdkLBs9xSFYRo514mTsibmbMjvsFTyuJZ
         qISsD72LyACapDfMi19sBBXYXhyhZ/PE7drKYWmrrkj+CKfPMlSPH4QvE2qwnM7fnHii
         aujPxAfhrB7c82uB1bjbzrjfDrXoBQUy/zhKTTHJdARTS/7rLqa/a2h16T3C3A9r7YtS
         oiBGH9Gm/AsimfLVkcjiMiGuBTyISsBjhJmDjykcybmMVt/zNjZVEygxtOvaOOI8yFaZ
         MZQksI24r1PF4xAF12pZVcA4IbpefNWFRTBDy0ruq/ZF+JweCulKT/Nl7FUlqtfYVvlF
         89AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223464; x=1795828264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IrAGyQNQ+9vmexJ3HX+RGvKm7PP0ZR37lEcYjBayK8=;
        b=blof8v9peoJUlC1BpeyhMmpyaACIv31bl6vId7xxTdKLvd0fEJGW61A/8vKEhhJ/M8
         1nOZa+94S+1dEjLa9gZyaY4AKJ1NT2RFcwcqCvVscvu0rVtQ1eMS8XmqO5+L6PVWET8s
         vLQVu+o89HRZpxtIR61Rh1NqIjp8emPATxtla8qSxCcTqnfoZfIGkflPixzewTeCNXVN
         CW3VGbWMKGttkIxeSFVqOppkIn6PnIGWb7klzdL2MSCnvRUBUhnMbv5Ew0sbHq5j6Kva
         tfrDCA/CW2JjnHHFOMsmE9ywfpYDaJxiRiHaqq3ceLQYobbi5GOJpa8SpwVBp903GGrO
         ZBzA==
X-Forwarded-Encrypted: i=1; AL+hErGsw6QkhcrIWl0I3PTX9Z+SxGcY6PL2kG4ualITBvxQXsIujF5kpi9Hh0Q6rh0+HmyDDD6Zt/aRjxY2@vger.kernel.org
X-Gm-Message-State: APuU4Z+ODHX0Xjgi0ZIF/QQK7WXojnfIVGTjZy7S3wGEIF+UMaP+HyQ4
	gcCVcNgqtHviUZ6xI6bOr6pAouqmK+gLZnGwXO3sPRo8ndk8HOyB32b8
X-Gm-Gg: AYBFou0oAtOJ1JL4W3KVsKNubidGN2MNrXyXJr5+dvjeeFPisjIFTgKUc0SKq1ALN6T
	C+nOIIuodCtwZ9QXp4ZNFO2DOWGSOJGtTSLIBLQmqFAYNkBmes5REyYkdHfWI19RaIeY/YsxYxb
	r98dZjKJlRdMp1I/Ie9J7ynSxV3RKkGFAtUDwMPVBm8F3s/C2MO1VKwkn+FwGzZEA2504G9GmYg
	JBy2JG6/p4MFup/zJaC6VnzQBIQudBqsmmy4BZGzz7v9yfWdhleuUIs5vHhNctU0uYdb08iVKwY
	8AwZe1yozAvsQedLj/i1crpxB3C4arRRULE/LpZVoTBTgvPMrCP2PqCBf1qIouvHD4hzkDeWHXE
	KH/TRv8mVf9Tv4L3xMffrywMi2Qd7zXOVP9SV03CxOgyHGShtvLx9NMakwY4tukNGL/tMwd7DSa
	DxGa/N7+hL2XES0XjVruq0MUCnsBYbgoJ/EusKw/5YVzl6UvrHlk1hiDD04OMcDDIR9xN/tin7G
	+2+eixn8LtFYQ+9lTxAoidZRN4rOsEADRxvyWPirfRTNosftNpF5d7w3J72+04/mEBBe2dU91K8
	t46hO0P857X8DhHY0nCA+hk72JRA6D72UJF2Jtq+rOkPIjzcFIZ8IqWGFb9WUgh2oy0p3strhNf
	f+s7mWMJ5oVmj8HEsRtqqhzIi8KjThKkB/wrbc2Svjtxg8jAx7ThBKY+mhdqliOnpqL90EdhO+K
	gd296PJZbJMJ/NNVf3RP22E3vuANe59hLe6JcO1JeZx7JmPA/o5Fq6
X-Received: by 2002:a05:6808:6d93:b0:571:4e99:7942 with SMTP id 5614622812f47-57a0b65aeb8mr5797462b6e.48.1795223464361;
        Fri, 20 Nov 2026 17:11:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:29 -0700
Subject: [PATCH v11 06/26] mtd: rawnand: sunxi: use page reads to
 reposition small-page NAND
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-6-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev

On a chip with 512-byte pages, an ECC read can fetch bytes from the
wrong column. The driver uses nand_change_read_column_op() to move
between main data and OOB and to reread a possibly erased chunk. That
helper rejects small pages because it uses large-page random-output
commands. Some callers then continue without repositioning the chip.

Use nand_read_page_op() to select the requested small-page column.
The NAND core chooses READ0, READ1 or READOOB and sends the page
address again. Keep the random-column command on larger pages.

Use PIO for full-page ECC reads and writes on small pages: the DMA
sequencer uses large-page random-column commands. Sequential small-page
writes need no change-column command.

This fixes the command sequence for an otherwise supported layout. On
8-bit small-page NAND the factory marker at byte 5 still lies outside
the reserved marker bytes. On 16-bit NAND the core uses byte 0, but
the driver does not program the controller for a 16-bit bus.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913041642.E28F81F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 086618dee999..9d7e3e6f22b2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1028,6 +1028,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
 /* Shared across a read's transfers; buf remains the full-page buffer base. */
 struct sunxi_nfc_ecc_read {
 	u8 *buf;
@@ -1111,10 +1121,10 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+		sunxi_nfc_read_column(nand, read->page, data_off, data, ecc->size);
 
-	nand_change_read_column_op(nand, nand_to_mtd(nand)->writesize + oob_off,
-				   oob, oob_len, false);
+	sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize + oob_off,
+			      oob, oob_len);
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1141,8 +1151,8 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize))
-		nand_change_read_column_op(nand, mtd->writesize + offset,
-					   NULL, 0, false);
+		sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+				      NULL, 0);
 
 	if (!randomize)
 		sunxi_nfc_read_buf(nand, oob + offset, len);
@@ -1200,11 +1210,12 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							   oob, ecc->bytes + user_data_sz, false);
+				sunxi_nfc_read_column(nand, read->page,
+						      mtd->writesize + oob_off,
+						      oob, ecc->bytes + user_data_sz);
 			} else {
-				nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							   NULL, 0, false);
+				sunxi_nfc_read_column(nand, read->page,
+						      mtd->writesize + oob_off, NULL, 0);
 				sunxi_nfc_randomizer_read_buf(nand, oob,
 							      ecc->bytes + user_data_sz,
 							      true, read->page);
@@ -1260,12 +1271,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off)
-		nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 
 	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
 
 	if (data_off + ecc->size != oob_off)
-		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -2105,7 +2116,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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

