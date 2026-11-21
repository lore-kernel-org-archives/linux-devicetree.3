Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223490;
	b=rdniLLh0m5GYIv27R8NrnUuUbCIzvm9OF20oLdveRJLsZ6pXDXAYeS/epl1KGdx5BUaF
	 AUunuMnuvFbqtG3OfevVzTuhZJjwWzr7sH5lOlPXFU2VpdtfpOd+8nBjvuSavYuHkulHa
	 J0G1z/ChPgwb4k4MP3fxoEjNG5IMDNUCwXf4aqZ3uOLJESXg8l5hEr59IcbBam+03N4x4
	 i3or2wumpCShAcBKEsMLbsfVJ++BC8iXIxlE8ipKYq+nq0URwKpamK2VlcbjUMp1AMvUY
	 wm8Vj0qlEIRsrMzn3JQV0vdeyoBYOQ3rds6FfUsVNEzvjrO64Kj/Lu4fVbOrvhkPmjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
	b=14IUGAzZ63MXaYJHCV3uAB6gZP/ZWWDDrbjq1zeERAGGSjTjI56rg4ckCih+5CJ2WaLY
	 TCzz/8uNo3EKE8dWofhyq22cem5niR61vu4bb3PBkcuJF8NkEuMufFBnb2kHo6BhKqqwL
	 cW/u0F2o1tXGnavxONeVRUpifNp1/dCYqmAr3avd0DvffjZLzOGRt5hCphQAknjFIoBwg
	 agnAtpz2rUqLjUpm5f4SPVqbGLo3BjtdXNwgc2z9AoKOjccXfxXdOaAGhel9aNvlflUdR
	 JWlGQmji+u3ZGHLtuhMV82oG6Ou+Vpsrj1vKYxnnSTbcdr3d6BC5NDDRGtHqfTAsFVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVHIq2XC;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098FC606ACED
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 098FC606ACED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVHIq2XC
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-56431524c22so678553b6e.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223485; x=1795828285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=mVHIq2XCT3WjrztVHPg8vVCUXUbHdEH/1VKb6z41SGdHKRI/p7AoWxyd4YNFXbmB9h
         Ay3uBvXx13gcG22PjCEtn+T2KwPRFMyvSa1upNHBvd1br+dgNTyhghWEg4pUe48upORR
         zavCPtmvytHTLnrhlUiITak/ZligpZJE7TGkm5DeIMsG3Xugn/VublR8Q0Nx2gW05l+3
         tF34RajjMtUi/DdRHD/wm/QS57f8qsLnBZKZEVX6wKsB+s0g6pzmQ54IW9A/Tmr/8ZiM
         /Zv30Ad11tzAn2GAumq902v2ZT0WPdPWxnzAgjhJYxZY/1ZmGrVaIYR2AvEqM/puYtkv
         VKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223485; x=1795828285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=P4X6JQDDOywA8AOl9s9RpUXnTXAEcbUWnVvyFJFFCmhXpNcpbcNEKUNMW1WGcMlBBj
         woHoUgHrGxMe3kCeHt+12V2du4+PVkISxsKt3JoKZNYxPW3bU3Bv782b5kbNKIzEQs8F
         CdrJwOcIKIDIWdEiEqCQN0M0d55sftOjU9sZCT5QXnnsVZdimYYjYhNZd2orzCRXgZ2E
         j9trLsqWW7JgjFOxEJMDszSywJAax5ACvl1mzg3rVZeDuK+JTf5Z9hzOFErKXLayRhbl
         lB3FoorKqmmIXwzyyeOend1JPgTmYdyFY2S6eTCCeP/KyS6DCb1NFbj5VjLlXd3ywfKE
         OoRA==
X-Forwarded-Encrypted: i=1; AL+hErGEJwscThu4GdQfYn9dwu1Wts7QKuSx1WUEo+T4jswbIfSpT0KxGC44AxaOPU6/gR0+0pe3B/aVKqFh@vger.kernel.org
X-Gm-Message-State: APuU4Z++Cfv502RzBZSrDmKUtTxRSmy2IyC5XyoYUYzC2siRpyHy4Azi
	wfHTGifkSVKedg4EIo5zerq/Nk0ipFYV1aLjlbI9/zcXmFLiLryEGEyR
X-Gm-Gg: AYBFou2vjMHBKqGtoIgbM9eIjutk26PjK0EQZkqnkDVZnQFs6CI28mLZoupn1xBST8Y
	TXfXujTAHS5e/ZKlSbKACDnz6xP32oLKit+ORm8JvNIG8yMk8/c1MAx6B9+oKbPyzFvGQvJmIkN
	HVdvUiF1zKMUuI7fsYqt5xkviAU4pvgj3B2R/+Fkx3ZlwNcWL3HSjjCU4+KYPZ42IZmEXDaCgeq
	ym/diL+thiRRDZOEID3UOVIw2Xgr4WDwiOwx9xNNewy88IAzjMqGkM9BXJ9KiL4xESbAu5kHHVw
	YGcmF2tfaKRJKdTakV1GGstOui3pTlTr6T8UDq3CAxTeiaWlSjm4rLux7kUayD6f2gSa0zoY9Zl
	DrAaK3VFAnWVMfrf8l5M19vljXww72JurXZhw/9Agy/eZwAnSmlyi2f1vnfQMo18cbZ75ph73IL
	DtHR4MJPkETEpqwkbBeaaR4bz5ZLGZDHArZqDyG/GC+HRD+mJfzszhvgphi1e8ko94A1DhOwfpx
	0wO4rlteBvvyKpGhEj+daq4dJ1DmutYupcru7ovVMUD/mNYO2pPNkLnzPSE7McUDTN2KRQ1FDPV
	77kF4ZpNk7Z/oJuNEgaMrY1IlQ2kwIlKsPORWYNGdpalzwsnIc09089tzhHOxSMuvmt0jkvJANc
	gmZHwiQgtf1M99EPH33iZoK1GMMUx26m2HDD9WlwN1nz75Coe7IZBTTjBrWUJdxQTBi4b5dwE6m
	GtIac+pqDnghRYlCeSJtWaLjxZByct3PWY5zwgNo+BG0gSrZWWwKlc
X-Received: by 2002:a05:6808:1915:b0:4f7:867a:1136 with SMTP id 5614622812f47-57a0c7bef2emr6229820b6e.64.1795223484984;
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:44 -0700
Subject: [PATCH v11 21/26] mtd: rawnand: sunxi: skip unavailable NAND child
 nodes
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-21-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

A disabled NAND child can prevent usable chips on the same controller
from appearing if there is no chip at its address. The driver scans
every child, even those marked disabled or reserved, and aborts probe
on a scan failure. If the chip does respond, it is registered despite
being marked unavailable.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4478189bf920..73d6cd89ca19 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2661,7 +2661,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0

