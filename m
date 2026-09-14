Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AEE4A015B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420206; cv=none; b=FMouTJcwI3DvtBo/u8g6xRF7WenuEoHlhLMdx3VYvoeBzJglFRVamOoCt7/mFegaNtV+R5+ukP14WrQl7D3c2iacTO3ywFPNi9QRbKHyCWRCvVTP2gWJBc8bKlarNi8V4Nxf4sbKfeWLkYiQVe14dpzMzpCZraEzWhiaMhOd6b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420206; c=relaxed/simple;
	bh=NlWMHvWo8eC8a5062ul0UGSwTs8Firq1Hsg3xcZzp2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dqs1QG5cjdnKRbFEONsaNTC0XMuIA01yZlbSHNCwEletKbciyqE8NxRVN3xvkP+lhrNHzioh9BDOBfBFGFqnZYZNIVwBY2S1TWwngrqBB/FKd63zvUJ06mM5pLG2F6IzpsYIvtC/Fj86F9W5hKFc2AYkmEeCuJht3YMHl+zfjL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SM9oU8xr; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SM9oU8xr"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6bda350b708so911173eaf.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420200; x=1790025000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=SM9oU8xrKrDHydJbNvI7CZE3ZMNZBaW939GK9HY/dYuCpY8SCqsadeyaKg0/rer3CC
         Kn/qqXrZQf7E3+Z5K0zWhgHDSDW98V3uCs3FgAYj0EGa7wsmPtkeNKR3ksedxWq4VqqR
         /SQiPlBs4thbbkq850d4s0ojMx8uy0fJwt5KfmyzjXNdbsSYD3L3SSsbjdBdSI/iGGZ5
         QE5Y+8PhLofTaAN+ziSZRzBZLb5DRGVfc8xXRpqdfAXawPn43xEEDfkbhT7vYChtDvAO
         qFZxCq0nNGC93DVN5Zcx6Q8msZjfVL2WHDz02Moo8bnmBxgPzja3k/tva8I2h/etvbmD
         08+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420200; x=1790025000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8noBZbj7C7U90sjdVnrOExXAG4fUCSDlE1zY+ZGE34=;
        b=SmmdEpLeGXiA3O9vv5wEr4QUXJ9mFG7yIrf/czSl9MWFySHF2U3WqrwKky57JsRR0g
         fIbur+aXnAErlvQIqTG4AeVLeQ5TyKmbjNxF4ogFEUQwDYBbRzFHm03haaOicR1A7DsI
         kdeOgnQ5lvbgXWQx3w6QQ8s5lZgbnvD94guE+FXQYcTtUk3Ac6lFbryqzNPIAhbOA2jH
         dkZw+zPFo8FtXZJdOOh2y1UoCpWOeb/+WTEHXkRCa4GY0ZB5KTc2P8SEISgqHQj6f7Rz
         r6GOiYK+tNxMoDjk3907IYFIVbHwWRhRpHF1JmGMS3DowDRuMnuHpfQgujvcrJ6KW3X7
         3AcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2cW3isdW9S3sMzhpHHrtC0D/5l2p/9iKz/ag428ObUYxTMncwOjOqdsybGV5OcqTc6canPTKmF654@vger.kernel.org
X-Gm-Message-State: AFuF++lQmpqK9/gNnk1QQA+CPd5mAbeIiVlH+ubuJ9pjnDlMVAkGblg0
	EEN/264hfwg5wcTokwRi4qoX108rikHAbgkgFJkNfYNJFibC136Hm/dQ
X-Gm-Gg: AYBFou3zaw2YDQRL3Yvlu64c6JBFWrMLAvdbG4Qyow0HUn4FdS0nah8AO8jc4KjK3it
	4Kshp57r0RSlevv/Bk3vhJ1YYCQ9GdTyxrTWm3R54spdgt/+/ThdelVwt+zqGQQDgG3WtEJz26Z
	H4QWnAtpt95qYg2JNmaL5aq4ABJwF2oqKbAntfBghhZicIrjed/9UM+99k4+IJBJoY95DSB8Nta
	bCLsoeXTVaXiaMzrx5YRJByGN0Me9jsAYQK1WPXIKVaoVY82v9bL0TIUMjxgefdkm20qqat/lrB
	+VKYtmpxsSg/n6AgB/0GqIZduPAcRvmXEoh+AzwFz3pD17g/CzHxNJ7kdfU1owVCVdRcRRUE3qx
	PadagMHc5Gl5idyhNkskImR2z2C3tYJrpXLipl0NjeuiB8XSan1l5OWae9UdByxdECe8P0DkQ9p
	ryE0AWsFpByfnuRED3FBcs+NAl5MpIHD5SC+5vJzRzj9wgQ3mmjUi2Ef2f3eQmG6bQRaCrS6Eci
	42NbvGYV3AAmGM78Osx4uNj3kog4IWLoDvpdK3tEi7GhcVXH5yOe0B+leQ8nfv1aE5m3adxV0EB
	/T6RUe2CccM533CZ008gKUkir8AXECSy/FmfQOWOKCwShAI36d1YzhQgw/06albSvUB+6tpETkr
	s8cjq3gQlH9PPCu89zeUiJisGf3d4
X-Received: by 2002:a05:6820:217:b0:6aa:ed21:6c95 with SMTP id 006d021491bc7-6c53c6f60abmr2434425eaf.0.1789420200643;
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:50 -0600
Subject: [PATCH v6 04/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-4-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The PIO page and subpage write callbacks leave ECC enabled if a chunk
transfer fails. They also ignore program-setup errors, as does the DMA
page writer, and can continue transferring data and issuing PAGEPROG
after the setup command has failed.

Check program setup before enabling ECC or transferring data. If DMA
preparation has already succeeded, abort the queued operation and unmap
its buffer before returning the setup error.

Route PIO chunk failures through ECC disable and return the original
error. Issue the program-end command only after the transfers succeed,
preserving the existing successful-write sequence.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d5d8d383b6d1..5d88ad3b8f70 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1610,11 +1610,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1629,14 +1631,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1650,11 +1655,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1670,10 +1677,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1712,7 +1722,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0

