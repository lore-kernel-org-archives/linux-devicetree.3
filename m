Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA150340DA6
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028069; cv=none; b=hAVgytvr/FpygwIuOXVD2/j7vVgHdJeHvCG8Ig6u4PmSd3/jFMqiEXXaR6Le3couruo/Mqkd+FUOx3zxd6K3d+LEVF8H8WDjcgIB1gKZFpa1RoIkmlOJZaK8c6SfMRiObT0ESG3Y0nn7ckJCheUWow073vbDPYKs4HF85uhb3x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028069; c=relaxed/simple;
	bh=UsPtr5D7TcSTYM7m33I6oYw05r53iguxnK0xi3GQO2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rBtQ73NbC04jIm0zhtiI66UmReEbiSCphjMIXoCKneRRYCWOF2a0rr/rdlCxReUlTXPac3HTZyvEzlCTpoTI7XCgcP0QAKVEVSOJfKxTPS62OgRBw0JAnCa92teECULu1yo4aqekOegwL+Ontoyg8oEXwXAGoNrhZ6cqGGGMb44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efzaYlIH; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efzaYlIH"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-48ed0b68895so2857786fac.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028065; x=1792632865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8HSeNHmGWx6gPVnRbfeK4ulo5XYre5+Djy0Qjqqgio=;
        b=efzaYlIH1RwfcnQGypMF+ceytPys8Hw7LX0a860IhdfYIeh0MdfLujmybd+77h8E7t
         VYT+EKGwDCFNd49hfX8+eLoGzyr0l4Ds3OpnGeplCuOOfSOcg5Z5wDV9rHyY/aaGbPmS
         v3RDsOizqdSywxxzSHQSRDYe315lRmnv49VLb1PbbXxm8AUhaLWLa1XFm2cvlkimz07w
         iBudC/HbQ7YistOZXitM8nykKyILzsfxsdy9lFUbBC4RfpxTMpH8mGYV1KJTxlav0+aJ
         u8TMRSORqlTAnBlI13azP9ci5OAvVkCFGlIC1wM5A4pJJHX0GizrZn7HX2xlfqPtUmaL
         GM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028065; x=1792632865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8HSeNHmGWx6gPVnRbfeK4ulo5XYre5+Djy0Qjqqgio=;
        b=e3RqOfrtTXnviBLxeqT5DNSEB3GX54usBV1zpL5mBVM8cooy87j8HWdjkD4iY59hZ+
         vdErA5mVsKXGdWwjkDzNrWrX22vwhUl8jUEJVcMXLrji8G0icwY+bmnxpSlAxzInbHop
         TTiYNhTzUs6zmSXoO+x60pnGIUMydm9pxMWhLK/PhGONM7cwFBQ8IrhDRhthRBz+yMTF
         W387GlM5AWXOK6kgTyIsckGLLCBfUMJvMy4JsRoGCXcjQg/B86TkUYniewVbks4er+iU
         A32xkMZRDTFC1J/pWPuKa/KhHorNvomLSE04GLiyxWT+gI4CCA129FKw7f7eQNWzjPZx
         GmTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxO/qDdvIK+42PDplHo9hew6hkqWVb59VYt58aUSVaDwjixpFC+WypyNGCpSG24C1bE+pmR00tat58@vger.kernel.org
X-Gm-Message-State: AFq9FYK8YWp4jTvnX/WgPqa/j6eIqjj5SWOo3fyyc4hpd/bdB3mehw4I
	UgkSltqQ6167nsq7OrubmDKisIYg+9Ms6gjzu5dKVRPP9PuUd0qGzzcK
X-Gm-Gg: AYBFou3La2iA6F0vH1oionkLX9xxKUg99HKvFMS1u2KOX9uD+2/rDKyAEsxk0+l2hdY
	+wlIPrVdazUNjIebJpkmS3PE7heeHHoWRxs+wOfQcHO6io1MTsmKaI5hq3EOMp10FjxYKMspgKR
	10qMSpi9+dtXjxOaPTtFz+RV76uicowhzDGHpKcMJ8QJ1YjeIzdIvqZCz8VspSFt51moGxly74R
	5yIGqnPY1uf9Bu+ofKVWYC/D6P7PpyZ2WMUd5igybOl6kaOU7D0+vWGt5eC8ul797MxfQ0oGdtt
	wcVRWhfq6i5SvInoPrZPa1yg+zcbmu7reR0UAYwVhKiy4vEgLVAhoL/WgfsIlnxyl6SnqDnvrby
	r8852ayAmrHsvwrQ21SHskTcJnPGHZXHMkyVXh5SNeCRREfTHSBnohOmvv8JQ6pd/h0rvlChNvk
	Rc+mE6f/HsVNWvd6Mp8cFY6UI7lJwki8LzsUkikFAa+8LvULyUIpJ3m3svVCDWm/AhIy0wke+W+
	W/fVAQKCoEI1hdgwlAJCU38WdPaeGGqbTJGNT+VGwZsKoWAd7cvNqZEH3X0p8W7g4DefTj/WxEi
	dxLpQFDzr0XwRKAmfXRfP2EkRQOAh1OaD+YaDOPpNTu0CbCucrjKuIF7ITaVUYpiq0iGxsRpfLQ
	cNc1Ma7GWrKpjMJXar5OO
X-Received: by 2002:a05:6870:4066:b0:4a6:c1cc:e1 with SMTP id 586e51a60fabf-4a6c1cc0336mr6240528fac.5.1792028065404;
        Wed, 14 Oct 2026 18:34:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:55 -0600
Subject: [PATCH v7 08/16] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-8-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
index dfdd8d8aaa6f..6c4e1740a245 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1824,15 +1824,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

