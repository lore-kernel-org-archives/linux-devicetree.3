Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904933;
	b=jt5AGEoi7aj2ducU6wX5PXZp9IkBqyCWet4LMRGwGw6RrqO4h34n3w1bJ75TuQztvRcw
	 +Z6V+qItIY5hHtp2myb3A0NVEaHanXkJqImbcViSgHLmaG8Z6uJ18Str8Vs0WZZhQ83VI
	 Q3riHwW+SsQ1reYy8zMRfCNlzfb22yk4PNMOWMQJwVvBl8IZLeKusXiZ2qdYf96YaVtgy
	 +MKafiIE+KIR9X5bGlPiwKiDQovBcDFqDR7Q8ikUVMRi4qQ3kt0oqpcdiO7Xgimel3ndK
	 Dki/hCykcbXQCvky794L/dhC3jr2VIEswGJDg9SZ6zyJpPoLaEXXRRKhYxX+RtsV5WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
	b=ZdFaDDdlvmKZP/5PqwIiClWF3PN7wjHEaKdV22YdsphEXtJo06wzWVeC8hHqbJBFtJdy
	 gE+H6PqqwzWfng/qZTs0FA7Y1/q+qv6s8k3w0BRo6OhZPWKcK2bhugJZtHifTl+gjjrnQ
	 yn3n8//yW3SJ3bh2Nmzp3q3PFs5vJSI2gICmytRrGGJMQkDxZZatQtjOZzbYFAyLAGYsA
	 nJ/85k27y5LqT9G8g0GXjeBG5XHOihGcTB4X8gJCnioYjkhaG6xQ3BVn7hi372aNjkI4O
	 NjugiLiNOW5S3FAgCsa16K51eo1ISWIx1Y6OYiBg25ssNC+kmGuukesv6p4+giV9xNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xce7ppmN;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AFE606A33B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1AFE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xce7ppmN
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-704597ef1d8so982282eaf.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904932; x=1794509732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=xce7ppmNcoED3tCdkzSqrRF0Wjb7ajno18o3EIxBFPj2iOob112Fyp/U60NWNB8YYr
         koXyLtGb5zjxsDiRdRIMFIvyfAScoPiVJB2mRNJfEwYZUwDCnRsXp8mq21PnSdBaEC8h
         t78E6WclojIGuSK1VLqf12YE64GKuY4/2b1PW//s9/OqeKe/nIegQJlQ2EHqBcZFsrk0
         6fDNE1Jk/K+GdzwwXwoZY6XpmnWraD4YszepKzbuhzGRJP7mZptKBqphbUbuy+6dLGzb
         9h8PO9QU+lT3EK9+yYNudXKZvitcRL8zh6Ip/yBz4peIl5BO/DTSoX2J2i0gNE4FxFdQ
         98zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904932; x=1794509732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=tHnodlGtaaRvADcnGpIjFTe1oUm4I3jlABYZ4isNDwMOwNR/cCPUt97eKLFqADDjDw
         Y9jJ02Yb3XPSxoiyYBaN1hfWyEu+IRjBBtFXp1bh4zKiVXKeu5GErQckvDPNs+IFmaDw
         wj3afZwmnDjK4cwhnrf7UZQL3/D9p814FN/KVckjF9I85Re02Y/ERauLA6+vd3/ZZ1cF
         BmLokoy+9nbrqyiNSFjm86yWsFygnger15tVP1mbUDhALU8Qda1uVSmGQjXpz+EFBPHH
         JRvqIJfFUnzB+yDNxPnOSPL58JXHzjHQ6QWkuJwvD0kZXpSFZqXmsRmAUxzSP2oVJYHr
         7Bzw==
X-Forwarded-Encrypted: i=1; AKwUvBwe6UK+sgZFYc/r+c/XOFNdPAhTgGj4TNSFJys8QyZVOgiWbkeU2ZdjKQGpxWH7WkoQnhJwFTG5Zyze@vger.kernel.org
X-Gm-Message-State: APuU4Z+WjGKqop1V7LfzTyZN1IxuvzZpURl8692XVAJaesjJeP0BIK87
	gdKZctVYsftD5fLX4Qip2TnXrvvL626ylMs2KrKoN+Bn9wHQeJ2azSqz
X-Gm-Gg: AYBFou1DuVmGXkJWL+hnuXkzShEmFAasGHOiRvkjiYoYLgqOzuOl4n9gfkwDfnlC1kZ
	jlGQjo7fqOWXBPOxRLQ0qdbMnrUgu9Q157U2PL6hkv8Z/TRpacGgm+u4SNKU5M12p4lp9VcxyjX
	FUPjZqnn+j1KNaeYRO/tR8nQ97S+bNFNu57VMP09iE67gPtM3H8PvffN3UPWqnHVQ6RC1IbQQiv
	YMoSyyXbmth2Yt9jImfFydk61UVrDKLFvRvdUxrxzbD9Lgf/7mcetTzBHiToQAd4rol0sCxpGrR
	r2Z4syCMjToPeF2a7imMYd1cwzCaKkhnnZJYB2Z/3YPyZVSrKfRZHYty6RGldWukEvkjIu0mToB
	/GK/Mt2qqRRdfPLxSBtcObbTCQhspOvC/JI2F0o91RIpf7cfG+v7McZqal+fXb3kIM9zjs3udzL
	AsHTnlbakf72QB53CF7gDyInoBSHz2dZRnjoZQPwdSeGLpJ7aPK+I6/1f0CjSTt4hQ66/NA6Hg+
	iIU45CJb7JeaVvRvyJ5OafZNoLY+0H2jqpbJ//0uWCCFmHOxImCX/jzjo3hVZwFaiOYVr1l4hbw
	G3GgWGmr4XLKduN1TQiYbfiIijMGu6JVF62wptLZPMz60bLTxc28gjSOEC7ncN/umBp87C/vc/l
	FJYqVR55AT9G2lBe+EcevhnVnmC0OgFp3ggLuNEJGLYARjiCGWm9MdwVvpVrgDCHz+0vc63rezE
	sedDtxlfyUx9XykmM+Cn/YjQByzwo5P6Dy3my94yuqtrx+Lie2MycWdYWSfZYfCBg+Bhh2ZIhJn
	A==
X-Received: by 2002:a05:6820:2484:b0:6dd:bc51:888d with SMTP id 006d021491bc7-716e79f15c7mr263473eaf.87.1793904931737;
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:18 -0700
Subject: [PATCH v10 02/26] mtd: rawnand: sunxi: share the buffer transfer
 chunk size
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-2-dca1f6ed29a8@gmail.com>
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

Use one helper to determine how many bytes a buffer read or write can
transfer in a single normal command. Keep the existing SRAM-size limit
and command sequencing unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..b75984961699 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -659,6 +659,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 }
 
+static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
+{
+	return min(len, nfc->caps->sram_size);
+}
+
 static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -671,7 +676,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -709,7 +714,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)

-- 
2.53.0

