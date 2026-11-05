Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904953;
	b=2b1yirIONTm50n5WGh3z7oof9FVEmvh5G1mf0iQt2AAC/k52l46syWaJCgbXwMMB46/y
	 lG8BJ5kfrugapwIF4plOawBPQZSptnqQ8D9F/FSeOLXNNCNrKYkJG2hzyoV3ew2d0kMIV
	 7zH9KFlyOVi5YTGWlnepx7VrlcO6Lli0XOjmjy0T1pbRqHcXqj6GL0/xBnObNCs5X53Ia
	 F85EPoB9ruLaOPbe2fVjriEuWHy62VqPSJQZfrwpGpWgh62KC5i13UmB+WIEtYwVtSoH2
	 eJdhUow7FwE1klKggAoMUXQw/XJelk0g4LRwXT33Rvt3FBq6eMZiqYBfUzfxK5oA9PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
	b=oi4LDr4M5xDvcNbdgs7LdgOKKsnAbvGWZNAvlfb5QLvuQIrz2sZHCQ2WpMAPTHxhHid0
	 sPC0SxAD4c5jayEkEcbnsO5/hnsDau3eWk4YdY+mK7tu7hSzFdNd/f3JwwNYGBiBghgIy
	 /02FtJJ++AvNepQcGREXtKtC3x1hjwYNgLVGFgzDeG0ASGIU5b3jrJdkKvDq3CgCFqooV
	 pdMBmeAiCniJ9WXRC/zD151GRl/zgYV7OeVHwqEHWL9fRezx7eWu55UziC3dhG+0/6tgw
	 2m0ofwShndY0LJ6go/sJcQXuICzP+jIpGyRHagXyk25ggO5+XTZj8wd13rIfXGGoB7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwZvZ94a;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC50606EEA8
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC50606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwZvZ94a
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-705cb6ceebaso1493573eaf.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904952; x=1794509752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
        b=CwZvZ94ar1CR+3U7q1Mi7xxnxliKIJcxFb2hHKiFu/l78SIWAH2Vwl7iGoGrNjyKU/
         fWJpBBmlkFm6aC9zLjF1X8ciznnsb6x0Q6TPNC7Oz9+re9UQ82mq/MibxlktIM45n/wc
         Om0cx019lLOmsVbpurX3nQRN7fCE3cppw/aKRofJxIvMS5Ir4pdhu0GNNOGjkg8OLLtI
         88rQZwf9BY74o9fa/zxWxXSmPPhY/ZUY+2Mv9y28FmgaYvM2XPgUv7xPCw2jJGq4sJEY
         l9KaYzs3VxgoI5+2Calr6i+r73WoBalbFdE94w1FfG1mhvLwA1R0J/OpM6SfPoT3jdbI
         53Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904952; x=1794509752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
        b=l1T7OQtuBHIQKqdXnplEkflLqTurjxBWPEqWTOMp28GaKCmLym9GZfHCFgd40QJoRr
         h8WsHZfDtFB05C13tMcSTezRghWUyHFYtLNIwVtGiyJkdoEAX4FNDhrmt9DeTCqILsUl
         JFAL1X60DWEvizwT20fIkhN0kvFVX/WLZ/ZKA33/JFcYN1ndI3nVCvtlE3Rn6YFRPmpp
         KB9ayppG1cAgeNShRz42QvmT5uaByQM9iAyVMA39WR6o/pnvdqOGQuv60AYxuUU6Y68R
         zF8jR49i0NbtMnmiH4Ywv2EYnw2hjh0eQSAIkD/N2eHVqgMsEILttXer86vBTFLhcStz
         T4Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzVXwAZVU4+jUz0Y405yT/0+b9JxVz+ii8rAt3As2nmuYFa6CB3lXdcG5+10kXJLTb7ZfrAQB1tdtQW@vger.kernel.org
X-Gm-Message-State: APuU4Z8rR0uJgVc4vVnBSTfkkeqrwsZghVKchUGVDLT6qIane/yzQC2g
	W3hRkWEU33fKoDqWDX9xtFAd+tGV2ySsMRPNoc3t8sUAuCf7hF9zk9ck
X-Gm-Gg: AYBFou10/3b6e2PjCyN5IrDMCzGTNbLFklyOELeH+hP2nTobJRKagGY3wd5pCNpkiU1
	tZq5e/Zfw/pOzOvi3RODAfPoujZcOTvLjGerAdzqn48XMW9wRDM9veQ8j50/Y5gr1Rp34khOd8U
	pY0MCkx9dWGbVn8M29hKY4gBc0gwEFE3xuUDqBjxRNePSw5u4QqG17hK35Vufis0sH05ZLq8G1d
	EqWlpOFM8dARvgxkuN5W6zpkyu2DCGMqGJnFebSEdl/8LHWBJ9jRMyG8Ve02slytLqhoc8lUQ/I
	Q0kHNBLShmQ6459S3NT/PgYUP7dv59nxGctZCJtjoz1rusy10pLmQeSz6LTzArHtlqR0xDajut8
	w1jZIk8RKRL8ROH3YFarFzJLEFd5aX/x5gulM3UrUUYsBBYq/Qval+Ob9Qebda2DJLvY5lrEbNv
	ZvVVdE5kbU9LYwPLJvO1D/rTOuHqUX1Hz96MgDGR0+8kaaBcbg1w5uBstqTnYJEPSmS/kTggJp/
	bVr94qEPPkpJKZ7mYjuIB2bmXou5j6SP00QgHkK2tPblZ1IcRRMEyBvBwCgnbdnxvRUhONHRaVj
	D3BMu/5UWwuw5SwnWWr97CpQCI1pHMjRmwuZRdbEPALMGqG53pNZLmUY98ZrgH2NLRUt/swXjGC
	+Npl6XyOe1Er8ufr48J9dgQsrj5WV65ATk0S4O/4IlR901k2quVrMxjlG3ibMpsSgrdtUtKjekJ
	vTzCoKdvKidiuiYXxbYBXwHrQVlD8bPUYf2XdEMSf3XO6+dJSmCDCa1A==
X-Received: by 2002:a05:6820:c30b:b0:716:deda:97a4 with SMTP id 006d021491bc7-716e790f945mr252144eaf.48.1793904951958;
        Thu, 05 Nov 2026 10:55:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:28 -0700
Subject: [PATCH v10 12/26] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-12-dca1f6ed29a8@gmail.com>
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
index f003da59cbe7..5f57c5998f03 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1841,15 +1841,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

