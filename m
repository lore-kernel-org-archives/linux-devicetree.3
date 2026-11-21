Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223494;
	b=Wv46ew0SQn5yOXTUGP7YJT0v3NdkBhyzkg1LGqJzqEsgbXCbGRP+jlwMcYhYRZIqPxUr
	 84ochpnUSpjw7p8aki2R6DeXVDhb032929Q9Mr6qFWZzzMDbE8tPAbFkDHirbcFLS9Hq7
	 jxhrt+UJz8e5SGmMhz6k3t3LI8vxHfIFfYYwpYeq8fPI/oTRrNcSyapT2hBzXvgTFZ7yN
	 CkwcjTqwe7hiwYYoQlz8HLJekF/fGwg/CjN1e3IYtM2/NU9YFY9DT8mqM/k5tWYKk8jBz
	 xr6W/YVEWYUdqMO8ZuiyWKuDaINxfZ+RB3+fXjnm6uGJOl/L2LguHT22JPUMdfIvCPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
	b=Z/D/QPDRHYdiatxOvzRAbDTzzdbvhifscyLAFK79f/IH5RKmnkgadR7ejSy8xYvdPEe2
	 tJHUZUvafaNk8zc/IBKhiY+Hv/97PK4xhrpd6eOrEl6MDNjd/hrfsNP4+A7TNtkTHefuy
	 PsyCe0BdbTyqCf5nRw6mNXAycQpAEvUIuDF04pomdzVcBaSQ4i+f65NCAQTzk0Of4xvee
	 E5z1OtpW/xi2BMqoMt0kANsYVc1XVq3+Zfj6zUj8YxLq8bDMeVWcCxaj5LRzh2OTDNz7y
	 Q5bqneHoFmhIEgYv+GbmXsIonlu+PAlFFLmFriiB6H20PC6DPyJHPy6crHdK/i28oXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CLt/7c2D";
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AE606ACC5
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD2AE606ACC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CLt/7c2D
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-57309bd40b1so909010b6e.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223484; x=1795828284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=CLt/7c2D9bgcj1VCDJD/Yx9MziudHQSEBWpHHhHw8bDVn+e+sJu6zChF9D19FvYIZy
         K/LXd35F8IJt3f1TryrwwBkAmOXUV0jttvhBLSuW+JJyaBG5Gf3uxe9brV1ANpwkLNa1
         V84SILZhe0vO8U4nj9w84AYtvc/gOwL9cADHaVNNi1DuUjGNZfT+k4q+4QNV8wzqm54P
         uaGdIta7yIH4iKLtpkQRNkvKLB4o0QEQ6j1TnyUNGQ7RJWugw9ZGDPq/52vPS3J55/Xl
         A4Z+Suiw9OvroDWKW/rEuJjZ2rG6/aP62VlWrWZzg9pkMA9DJgdWjmCV6gQdeNN7VpfG
         o0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223484; x=1795828284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=q3W85BDpP++C3Q2b3i1+TP1PVlPfutr2O5b4AxMdyI+dzE3uNBcbwzLvsa4ngL9OOo
         cz6ek70nca/7DCyu9g+ma6FP5N7nkaZTFDuKSoMQorRZG+DyvHnJgs4ZvYuwa5Kcx1kA
         14Q+l/ySNJpMqbHG8BYQtscsJfJfWjTikCgxVwR4AEu3EowdDqfrV86EPLhxHkfODj42
         9C1gYoqOfvSozsbhPUzYSA9m0UilDJbQqGHNttnlG6afSyhz+7hZM5YHWK7jabJ6As1G
         nsnKwcFyKvR3dHCz0h4/LZnTpUW2uroZgDZqYDbUuv0XLp98a6Hqhe9GMtp70WLpyR3Y
         1+VA==
X-Forwarded-Encrypted: i=1; AL+hErGeqVGNPX9hcbJdFxw6mB4Jrn22fb5y8Sd+VU9d7lCa+xrPP/KXBBGdDB+psKN7dyWgS/vesI1WR8fQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9eObE8ippwqLpu5bmX+Mlt6gd8HPbnIefci2dLzoyPjJ4PHhCH
	oTUvs6/5ro/dXNeQBZO49MbsJyqUTgzBFZIrLUulRs8+HexetPcLTbj8
X-Gm-Gg: AYBFou0wxgOACd0HTVJ9PHmbNGrDwO/dubJoVAzFRFsuMwJn7WRPx+YzsCyS6SfGqVd
	cXAfZlIsftAdMJtHinQmypHf9xu9lQ6utSSR4iplqbmseu4UnJcengfVJFG8KGTxUu7/CjD1IkV
	OZiICA/iosnL7MP5O14r4FgVQJidEVLA4GKLkJMGg/WHb43QSeNzwDvgh88Di6a5qjSUEl2R2c2
	x6bGttFHnDvMZRRDk0YudglSiu1uN15qooGuUvgchrTLnro/ex56mQmyRlHaTtk3Uofx3sZXc5J
	7ZVZVUZiBwyqhRl+yNHuaqzuTbfWYJGt1HqLkjP+3E7zu/ldYj3jIBwltrvpqjglWwpUgA8LiQU
	fgC2hIqnN0E7rOWW9NLmsgHTRm6mF4BNLXpnIZkkQxeJcVARlCJkjkpaeDzPnCTn0uEghmgtxYW
	se7MK/mlDbdxXiKyD6trwPXZCpTRjl8tjimt37/6wd9vmhx0D083RpP1fwwFW5pbzAk6V7CG4Bw
	t7/thccRRIskblkWhjsXPRooHx85IjHl7SFPfSjiHflerSq1+Nu1vvtRoTQ3F55kKSY1atiC8lb
	3UVpAcNy2UcOJX7c1HrkCQO/3MNfEDtqSktSdnGLrBCqtvkMka7YUMqY5Y5jcsp9O8GwbIZx78g
	uVz4e6PbIhDB3PHRMWdQuz/++aTlVg1ILnYKX+SbkUoFvBwpIZ/vYgYG6KFQ90vjPZyPcCi78P0
	Vdvp4+d9u2rMrcpgT3xngynjQUSrsesgKdbx04BSVxaRcJYpdTgDIK
X-Received: by 2002:a05:6808:4fdf:b0:571:b166:3d77 with SMTP id 5614622812f47-57a0af33b0amr6477590b6e.27.1795223483689;
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:43 -0700
Subject: [PATCH v11 20/26] mtd: rawnand: sunxi: limit buffer transfers to
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-20-9721b1905ef4@gmail.com>
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

On H616 a page operation can report success after reading or writing
only part of a large unprotected OOB tail. The controller has 8 KiB of
SRAM, but its normal-command byte count has only ten bits, with zero
encoding 1024 bytes. The buffer helpers use the SRAM size as their
limit and advance by the requested length, even when the controller
transfers fewer bytes.

The operation parser already splits data transfers at 1024 bytes, but
the extra-OOB helpers call the buffer helpers directly. Share the
parser's byte-count limit with the buffer helpers and keep each chunk
within the controller's SRAM. Larger buffers are transferred in
successive commands; controllers with 1 KiB of SRAM keep their
existing chunk size.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 37cc023db74e..4478189bf920 100644
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
@@ -667,7 +670,7 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 {
-	return min(len, nfc->caps->sram_size);
+	return min3(len, nfc->caps->sram_size, NFC_MAX_BYTE_COUNT);
 }
 
 static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
@@ -2498,11 +2501,11 @@ static const struct nand_op_parser sunxi_nfc_op_parser = NAND_OP_PARSER(
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
@@ -2512,11 +2515,11 @@ static const struct nand_op_parser sunxi_nfc_norb_op_parser = NAND_OP_PARSER(
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

