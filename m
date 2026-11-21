Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223474;
	b=W3bHTLfqUIZrrRlIjt2s0iKFYYUl5Kk/ZxfL3qSdKrojILVO6tV2EvDm5ALYBwZskU2H
	 GKWWJW53h+8s1ppRLv8RStYKI/ossGh+vLMLIrkECwpKNcPkegq4JP2evMJY/Z3pjZUqm
	 zU/icrsxLVcqp8BrInaGwkX8FpyDvfxMBZW3GEgr3R0S7/fXQjJyGoiQAELAAJ+hsNtI3
	 aFboNUTow7FcoeYw/F+RdnQxpJitRYyNRWNDSzCZ3OirpJqgUJCdM/YfddJ7i9SamERFO
	 iQpFYdSB+1Q6tyEERk+xdG8ffPivzJ7PDxuks54m0OxtZ+uq9UeBuhqN2c9SSB9IEXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
	b=y7kvxjNGwLmF66Kayj61vZkbwuG5P8es1mLfepY7J0C5PKQRZbSMfCiHgPYrm0cFrazB
	 Z97rpfTxXkrBy8R15GWysDelhutbN17MBszKa4iqjmadPtW2UoDN+a1he9/PrgjYoW9fl
	 0hZQYV2MDZrds1zgFo+u7dgQ4eImb/asO8jDvdl9aokH6hEKoZecWFArRuihIxXOqbcxz
	 W9aQVjlu92YaVFPsnJgf4ZxmNI5Vx4jzV3jYg8ojbHULlBLK3BJXuNmhaomq+HN2bMBvV
	 H7MHPF1xhVFYFNRCyfBNz3340rbawNC+zEBYuhjqF8FBv+vO2ZAFjpgMRGeQYrl+v/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqhDf7C9;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392DC60A3836
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392DC60A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqhDf7C9
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28d7c729fso1187921b6e.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223471; x=1795828271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=lqhDf7C9hkmi61yRGPwOVZuyBci1NjYmFnJzMTUZWv1M9o/P6oHtODRYky3eaLiNkH
         iNo4KaQU90sIJF1K7dQIxkFH9eyVVctV7vF2i2FSzy38cInHMvjhV7b5prr4Js1rUQev
         GXUZL3KBEdNulOdic15NndBbLGqPjhoxbu5a5brHeNdzMaszYP5H5RaHSs3dUwJIrNvl
         OHRGmcwW/kxNJG02dgsCWMtAeARzWdvr4k5MvgRd+dyH8SshVZDNYbVpIn+WpIUtiXED
         3KIsM6i+ZCY+Feybdl1wi1QLr//SFQCCmifKiR5RZlYkLDKEwZXtTDvn8SXtOSJuAk/b
         ZEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223471; x=1795828271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=tGqvPMtAZsa8Fyp5dyhg12OIIRYzCMYR+y/OpDYsb/0mGJo2QkLCvZnuQ7mitxu/10
         yeEtowAJk50z/2itef5YQxk7kvFRI7h/+elbJzZjo2Y+odA238MJGZzWLFrRgcddKWFM
         0uDfRZdhdOPwKBFkGy6YzOjYIQruSIp0ImGYjjDV5l2TuFxBDuUKILnZKBOPNo/t/o+p
         j7VpJ3yjayANrJAE9o6vijWtW2PInQ48nT/SZxL5BtzyqxBN428NgotfikKb9h8CMKb7
         vzmdC5kefWBVyazB3sLLmiRwHmoaWTz3EKBI/O7JZ7sHs4Uso1IqR+Yz/9U1mIKc8O9k
         5TBg==
X-Forwarded-Encrypted: i=1; AL+hErGoscnq/wi1xy0k8pgwuG/sZmEGDvVkSM/9tA8g9sJK3i83uIjOHqiYcMLMJBcRW7SgIsl3g27vIXPb@vger.kernel.org
X-Gm-Message-State: APuU4Z9FXeARddAzbMEJripEL6lfmOdhjjKDbOXL8NFl6UTGN6ursCEO
	cyLUHxYAsCnzFSXMsap9dCwTQY4oCG0F63yWXj12r3MzaCjE+bAP/iTA
X-Gm-Gg: AYBFou0OZ0fKaBJPI163samhef4KhOFLeQTKTQE3mPh1TqdsAFdL1EVGqTZnu+PO/+9
	9QSPPRJs3enl2A9I76rkzX7HIQZ1bVjG6aWkg+QdOuBmUoA6Kuv8pYYzqIPISIUV2yFgtIcJQ3T
	Z9KZxEGSbPC/kLKnUBQqmgA8jbHjOK6FG1NLFSoK+S4Hl/EdKpjUD8bbecPjE1Dc2lu09FbWoqN
	lMr8Kl5VfjGo3KBJ6awGWb6w3RldoD7/YI+8j5hX8NGb/AUNXxP2WRG2o+JHwv3Di/tyo/1xMXU
	GyA9VFdgpXwZfOqNHQYYaYXBDxx58kh+3PnEYjeJEtfViSJYOUuGVyh8SjvBZSr3RvBd3snzkqG
	s3NelS2l//lJUBCglnEnzq34PCyoPNki66tk8VIvuB2gX7aSo1ocQnJg/geDgYfhKG43mnoDx2D
	pGKBuFuI4tXXJ1iWdsgD6MIAj/8V8Nu6UmelKKLnZqHqOQy4OFp4sDgJH4hVewtJZbWCUMa7f0T
	L+z9AvRcW+gdBCrI+PfJNpC/DWilqgrcqDTF0oesRNozcN8yqWjBUgi1YTBcjaf4kze1jIpFq5x
	QIznqsSPpmRfxHB16fJS9Ut5cThPiMhsm3Caavpl8tF5dYzWe1D3ejamUmAd6BmqQQbZBdSFLI0
	/KsMk2mu0EjGSJcr8bQp3SF1RpAlSVfWTYf2lx5r23izYHXy9IR5w6Pswf+Gu+RQPRYnGAFx44K
	vaUCCiMe1X7RdAuEpbl7x9g0638ANN7TtKaFUb4Jr9zJvFD4HNFHiBddeiiOBbjRp91bjYJcsJJ
	A==
X-Received: by 2002:a05:6808:244e:b0:574:6f37:671d with SMTP id 5614622812f47-57a056c81c5mr5959981b6e.5.1795223471048;
        Fri, 20 Nov 2026 17:11:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:34 -0700
Subject: [PATCH v11 11/26] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-11-9721b1905ef4@gmail.com>
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

With scrambling enabled, a PIO read can report success for a physical
all-zero chunk but return descrambled SRAM data instead of zeros.
Both PIO and DMA can also reload the requested OOB after filling it
with the zero pattern.

The ECC helper fills the buffers for either hardware-detected pattern,
but the caller skips normal buffer retrieval only for an all-ones
chunk, the pattern it treats as erased.

Skip normal buffer retrieval for either pattern when there is no ECC
error. Only an all-ones chunk selects a raw read for trailing OOB; a
later all-zero chunk must not undo that choice. Keep the physical
reread and erased-chunk check for ECC errors.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 43c0796d953a..538ffcc79108 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1226,8 +1226,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0

