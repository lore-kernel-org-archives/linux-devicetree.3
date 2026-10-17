Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E68E48FF8B
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266400; cv=none; b=eIM3+2kIFpTyEgu5AmzwVbEafNV/PD54m2F8pWNCSRbdGN5SvUqhbT12DVf7PO5EdJR5TNLrqBhSncgkr6X24S6qOJ9NbpNJvH3wFpMFPVKHuUpSjtL0tLWHEkrpIFGYZpysFSzkoFGWEqsat2Ler3RfWUAxXedo7+rIBPyrK2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266400; c=relaxed/simple;
	bh=m1ZuakMOOcoJ2UTtQA9uEqk1ka8SS9czOwQlxYyqTGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUVVHXHvpXdf7fV/XZJ/rvI8VAgrGauGhLpYOjhWXGj0hRlPIfFo3nZthDbO7ibicoXbZpvR+eQJPEYW3/a7zw2jNXpdPFf6K8Olx+FgGM7wmE0rs2V8FXMtbYwmL3dJizaktoZmCwOxTpsdqunpQwNVx4EUZZ5kLahjfAU5CXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LENaPMTw; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LENaPMTw"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53dda625f63so457769b6e.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266395; x=1792871195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggIlYqb11US26O5sA+ImWPEli5zTJui5OSrJsvz0LFw=;
        b=LENaPMTwigPBAQZiUhLTwvE6M75HoHwXawicYRk8vS62r9I0wREFF3xBlL1BhGKOmC
         OYKSa+tUqMy9Af0l3enaIZkTwyokBER7dnhfZyf00d4AdjV28JlgLCVxmCHSmWMgJW5b
         OWvRTGEgyJZeT8CQqbcbem1/RRMoeLMDrPyyS8cKRRrxCzSsUc9dy8sxItQ15XLVkaHt
         KVYfzlDXhxj2ZBxC6KwDV8s1vjEqW0J/J+dF+04JWvaO9L6Xf0nfeXQMT2bc1sgS5gZ2
         VNouVQch2YnKn+NKr4l3Pi6mLbqzhiKqPAO19yaDwN2KRP1KqJrH/uGbCaYFutjHkzwn
         qwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266395; x=1792871195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggIlYqb11US26O5sA+ImWPEli5zTJui5OSrJsvz0LFw=;
        b=eKw0quKpu7OFYy5i4HUd7Yc0fFAL82ozit1SuPtSURShayI0VgCK3fTtrGA+Ovq54z
         pEakI3Gx+LVZeemMWwQwWMkftOQHEK8+5crjSksA9mg/tSe4R+/gXRlm3DlHaBTBj0O4
         Bv6YvNs4pqlxf4iXeJpDaAFGzwyp+Y1EPr8QsKQq75Lzy2KTUMfEMklFhGKKBffBVzXx
         XL90FxGD3tdtjqBAyQBoy195CveccQwL9SbE5925leuwYSqzNH8dObkBiottV6L76+rI
         WhHvD5kZb511j5q8XhbTDFg6dMa6G9UIPwl9/prxJ87Eqv11TU247S5AGiX2Ox4EyH3u
         RtNA==
X-Forwarded-Encrypted: i=1; AKwUvBzuJLVlCNatX2R7vW0HBoSNU2QrOSwqunyIHu1d3Vi5F6NnYUxPQaohFEP9lYdlE+QwiPQc67nvUx8c@vger.kernel.org
X-Gm-Message-State: AFq9FYJrRLPN+76caBCDBxjREW6RIhXxwITBqop+abysqHZDd7TIGByJ
	Qrfj9m2PbnadH5YVTjbFokHqt5IMSCazNGVBQN13B2jQttmomLOkJJoEj0BCvdhh
X-Gm-Gg: AYBFou2hmFvpim1sVcIkc354Qw+DtimRE2KK16HtAogut3lJfSCbZwcksfvo1M3ErtL
	vaAgJuByNrjT/oOpRvrZis9dpVfOviOtLEiSG4euxTc5uLi3ndZpuKEibVJQ1/+xx/mS6KC93MD
	mq3XhyuPku9u3SE2hyI8BtEpigZ1ELgiL1hNCgDahD7ZR6FBqf8Lhp5Dp4mU5CwPK5WrhO3jR/x
	/N0VGrCxQkUKoErTvHQ0c40ZFyWA5XQVaVm+XZOyZdFiR2lRyCuGZt1yOGBGEUoN1zS2PIrR6a2
	CmELhCdOtv4mZELXfNXeCIkrbva7ACtZFRd1eCpRnzyAVJ1U7P6HU21hVJPlwuDlhCS8wP6DZne
	oY7/s31kJl3G4TxmMuCQGgERWk3EhdEXQJerx5HwkAyLppTvyCq8HyqnJgoSU7aNtSxx8YuFBSQ
	Sn1xk34nF2ODs15GEiOVH/2JKTDBACD8Jdiy6/96xbKk1hVaOJfK3eXjYiWoLQC3M2cyrprs8NN
	Ld+TGWO04AxLGtlwm02Ghy6yxucvL9FDkyrKA37TBYuk3uZVccaEXNFKfUB1AfGPVRVLbo8CZc3
	oANrQG1ZSaGhf6v6ITs6x322J1hRemTzYS3CKBt8cPkkZk+n96pEZwXp9QGWVS4lRGZfVQH0n5z
	69dbffhsybr7SH3SMKWmw
X-Received: by 2002:a05:6808:238a:b0:4c3:9892:96c3 with SMTP id 5614622812f47-53ccb300dfamr2614650b6e.22.1792266394712;
        Sat, 17 Oct 2026 12:46:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:05 -0600
Subject: [PATCH v9 10/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-10-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b79a20158cd4..f00f9a8ff66b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1848,15 +1848,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0

