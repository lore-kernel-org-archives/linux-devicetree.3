Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223482;
	b=2c86SL8Gqa2E5NNB3nlEgT3cJOiDbw/UUc/eYrvv8mtbnvv0+xZN2NlokrSiNOJig+te
	 byP1YPQDl/mt8pEl2qqKttROIBd22YHPvsuflkf2w1e2swENESJb3FGkKAwZL13SrQH5V
	 6DY8BHsZGM2Lei2WR5I+uY7rh8sQ+XWt84xpvcgT8sqfxKCW0GpDhJjBbwSQgMr3KiIH+
	 2le1f8u2BctkzqPXuqEeReSCaVnA3b2t4+XWEwX6W//eOU81pm4qSfg+WLfNqbsMbLvjU
	 c3dlSbxLNbAGCbBbIsOyRS7Wd2GEfoRkr50IqYLeTllV36ojPizg1tbp7vGNdlYQKRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
	b=RupeNYJ0Xg3zrcmqEYueOWEe3iDyTDgeZMyrunxVSNpL+T4ikC0zVdCqjh9xTo6rxT3K
	 tyqOu/pUCr6VmpWRie2TwlOrCncWWCL/D/AGJ8z0+aBwMUfMPhBuPUsCxTXsKrnAwkBua
	 /YEXBFK+UlmyfpbUJgf/bAQjy1/1yJkTymKzGYY/o9Ir8rfO2jzXdZCJqLn0sou4U1c76
	 /6PwCd+XRwT2svaDhhOopQpMHyHX/IMEb7E058sJmLAF1dflQe5/G9W4xmME65CYAWFDQ
	 Z7qYAxYIS28vIKU+uJ0tXBkCFwPcfvnW3GK8NSIh5xhfNYkXrsuYmYvqL3S4MxJc3JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldYMPKEl;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15860A3837
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD15860A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldYMPKEl
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4ed6d69bdfaso913787b6e.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223480; x=1795828280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
        b=ldYMPKElWhbs0fukl2KiGDSnyLaUOTrgeMCcvfSieEcuAYO2ECMlj/vIwwAzrganVe
         LDzqs3dzhn58+XXKh8GMfij1+SGs0NtuNJU/6ml4ccbd8a1OsyPHVGIQI7oSYjy9f3zK
         hB8CfvU6HCqka3H5pYx2TtOYDfOh+ktqswQiAv+JOKz7f0p7bHZf6DihY460+bQ8aTkq
         E0GP1t/QQowKmfyDwLU6HQdk/rMtaAj0DgRKGgY3+aE8W1U9XdG1FIjwHKmblk4hELmT
         hqfrE4Hn7WwsEaqbgghbC+y92r2cNqAYLuKdgPjoB+ONm5y9c1nhbRjXvv/IVFcE+aZW
         EHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223480; x=1795828280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rd+OJrfYC05spJgrrPaaw8Or0kLWD6WKtcmuDL8E++0=;
        b=hRF0Ib6F0fjSV7AncRYnnKPDNQoU0cFPPnkD27qxTWjeuxgeKNz/qRYjItniKyCBhC
         GN2z41mlGIqi8DS3++b8ERso0iWMGi8HxsXJfjzDJCIBfNht+FckFEqcFTs2x5joGL/w
         ebMYDNkGPGFnkUBdcgZpOM/NlbqrL3ENStYXJcQUaXYBi97WhaHHXhKI4xiU/Ak0bO6T
         lwociK4S76+74rTEwwfs6c5VN7m6O1HcrQvyFOPxa6IUS2H9jNAbtNu3MLCg3qIgd1sP
         XaQxQrFxiW+8PuqD2h/WDIOXAOQrIWiWqEwmm2h8Jg4NOVG/10iqd9EYTmqUQ3RHrNeW
         c67w==
X-Forwarded-Encrypted: i=1; AL+hErFD4gAdpaSNug9QcNLNylBFA6tiWCjCsQAVzx/zlS75PLrYus82RS3Ij68I/iCVzmozxHDj+PsmgkGH@vger.kernel.org
X-Gm-Message-State: APuU4Z9BwBBAXoF7YlU8r+NbYBeZhK3HbjDneZ8HwM1DGpJbCq/yS6/l
	54qOVk0/1CUv3I1oupR9MaSF/083HSQ5e19Ko7X2wq3rI1Snh5J/VT00
X-Gm-Gg: AYBFou3Mul1ePpKnOlt9Q0qyKsa2a9KlzTtPbrIbELmSFvK2erGPHywtEYOhc52PmtM
	hEA1ygkXFVkI3mvJEdV0YYLtylpE2AWr+Imlud7XN+OwN7NskW/3tT/WG1CVbYJrQt1sLNPHpTt
	zwpjKiSP5qDtap/gOIWRT0/XfpLX4nCqZQuEIwHbPViitu7u6BM1HdJtqxSf+PC/9gebqNfb0pD
	JPNndh/Lq2mOQZgg00EUIBXMxAy4NHzjuXDl2Aq88WZwtVsHqlirREPA1ICsv6KrwRqx7P72I6+
	sF6YXK2X8b51OLifePSSSx+/oy1yez71ktV0wxclMTXfAcrjRHR9o3OeX27ROsOH7YLFGkE4jCy
	10cW/uEiKnMckfPJ/X+r1qUoRnoeSfC8TP7Cz34V2YfEAtzVToo2l2+vOhSSPR9BIzEIdN57/Xg
	1kUELgvXn4pWnw53zz9beRKJ4iroHuk4+vo82X9lzPlVeDJUHurnco+LoKNtg5+eOW5uk8w6gRr
	56qSjxRnQje7slXWy+WxEwZy9E4NvhF2AhSskuFxParMqjqhklXkvJTpcZrSMHvsaH7efFaGHFY
	GTghM8SujkN6X8yr0UcaRnA7uW4L4NeWo+5jNj0tkOLtJZaQgxVVbpIsMi0YspMrePUE2CqNGyJ
	OR2tNK2YDt6utPnLBf0yl2kRq1oQQz3TSG5l4eU1+Apqkz9FdnIN22eyg4eunQjFuwJVaAr4ifp
	/8WOvCegzc0gyIhgbDJGkEp0Qy1O61LdWB/S3lYbqxRLP92MDlTn8W
X-Received: by 2002:a05:6808:4f0e:b0:54e:7cf0:c0b9 with SMTP id 5614622812f47-57a0d2f1a5emr5946703b6e.64.1795223479754;
        Fri, 20 Nov 2026 17:11:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:40 -0700
Subject: [PATCH v11 17/26] mtd: rawnand: sunxi: preserve bad-block markers
 on erased OOB reads
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-17-9721b1905ef4@gmail.com>
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

A bad block can appear good if its marker is the only programmed byte
in an otherwise erased ECC step. If the controller reports that step as
uncorrectable, the erased-page check counts a 0x00 marker as eight
bitflips. With BCH16 it replaces the marker with 0xff in the OOB buffer
that the NAND core uses to check the block.

Leave the reserved marker bytes untouched when checking the physical
first step for erased data. If a hardware pattern supplied the OOB
contents instead, read those marker bytes from flash after the OOB tail.
This preserves the column for sequential reads and leaves the normal
corrected path and data-only read traffic unchanged.

Fixes: 146b503e1027 ("mtd: nand: sunxi: fix bitflips in erased pages")
Fixes: 4be4e03efc7f ("mtd: nand: sunxi: add randomizer support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5415ac6960b4..f8bc6e3c3ac9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1111,6 +1111,7 @@ struct sunxi_nfc_ecc_read {
 	bool oob_required;
 	bool dma;
 	bool has_erased_chunk;
+	bool read_raw_bbm;
 };
 
 static unsigned int sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand, int slot)
@@ -1167,6 +1168,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
+	/* A factory bad-block marker is not an erased-page bitflip. */
+	if (!step) {
+		oob += SUNXI_NFC_BBM_SIZE;
+		oob_len -= SUNXI_NFC_BBM_SIZE;
+	}
+
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
 
@@ -1251,8 +1258,11 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
 			if (!read->dma || randomized)
 				memset(data, pattern, ecc->size);
-			if (read->oob_required)
+			if (read->oob_required) {
 				memset(oob, pattern, ecc->bytes + user_data_sz);
+				if (!step)
+					read->read_raw_bbm = true;
+			}
 			if (pattern == 0xff)
 				read->has_erased_chunk = true;
 			continue;
@@ -1321,6 +1331,14 @@ static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
 			return ret;
 	}
 
+	/* The pattern supplied no marker bytes. Read them after the OOB tail. */
+	if (read->read_raw_bbm) {
+		ret = sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize,
+					    nand->oob_poi, SUNXI_NFC_BBM_SIZE);
+		if (ret)
+			return ret;
+	}
+
 	return read->max_bitflips;
 }
 

-- 
2.53.0

