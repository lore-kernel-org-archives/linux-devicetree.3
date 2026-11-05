Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904967;
	b=ew+WfRyg3ccfPr7fSeyGHj3X+2B8+r+ZOv8AXrnJyx/JD/9WfwF3OpEKkwofXXVGO4A7
	 nSKagEVvig4QJkkYOkJJFsjxdJlDcHNcjhPi1C8Ec7uJiHo4f/HWREBvB40aHRXht4l2l
	 ZaVEjbboKUABP3i079Q3xx3g5KnG9fAQQs+vj5/h5drZNVDpy703+J86g81VgZvJwv8uS
	 AC2W1Jq0CWmqs4BAfEGHDgipm2k3y5iEI23PqBbCAEwlCA/eU5CVL+dNpfslPNFyTXj01
	 KabW95HSLRCFku+75u68PKisZfOwmRRION0Xacjf6/KxTIWbpBTgo9Qe+EMcDXS6eow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
	b=J9hP6bPuuD9R/ylaTjm3nQ5lmlwjCx12hlSS3g8e41xd8zU/uzBFoFvbr3ek8OYlUJQX
	 fOe3pd4y58ABbPP0Wh9gvrxlSqLK0Jb6yu1cGFsAlBsldo1Hvw+c6gd5F8gK4cbYNIMhw
	 MfkmXrF/DIWmmY6vQA8zGnVHSkBjH2UPsOtk9DIi6zlzUsjUoVpfA+2CJ27SzLUimGSqs
	 /vcoxuIllNE0K2tdg+ETTCwl9t3ym6ziD5KxrChecN3yCEORTCbHb3HVjow9jutkcgN/4
	 qjUm59j/W4bxiKKTBzXnw8Qz/tasg9fAc5tJ+sWIBgsffgDr9TzowlK7hwbz+ljGuVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyLqRTd8;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEA4608362E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FEA4608362E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyLqRTd8
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-705cb6cedd5so593451eaf.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904966; x=1794509766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=PyLqRTd8O3Wg28izDJsUxpwuE/XGlYjDIvGKMAQXSERTjL1ehnq7df/k7oltg3PlA5
         IUscCHvYFXDRskkM3hDAsni/yCGfPlD+w5iXw+QwfIC+okc2q/Wi+SzboG8ut8cemQfG
         VRoR6FpGB7NTSnc+DJWwfth8be3W9droFoZc5Ip7JZtoGQK7VW8z1uCohZPfYx5bMp+k
         xcx9nD3tjpp0wVOB+f9shdNnZzViB5ZqHo6msIzW23kq3BH3oXKnjM2ZoKNHBLxrv9yv
         TUxSAWmusWYRNVpZfzblGOZPrUwokWIjjPGp5RmfFjVEsLovhz7/xRqvCUvNcpkHyS3b
         WfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904966; x=1794509766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=haSibnwJBJS7ecad5QKMQS2nb0yjSZ15gSux+mEVRCwIUHjv+0dbgJ4ZpL0eFnO7/I
         1GtwI2MZJB7qQRCNKRqMDBbTUInO6UaEuIH85CuvueBKopElan4qeMiN+m9lyDr60iRY
         8T+xEzzqQYZJJikEyOvPTUSMGLb5DxH7wRSFMgfQ4Kl3Qq4as5ZciavHW87hTK0kqrsy
         ADtJ3byleGf6vbAe4svWwSjCGb4z0XGAbk5LNVL3ypPRY1SY04A/3rwpdtfjJrM5eyLQ
         67YpNFGB6U1Of1ql4ra/cQXuzdt0/gcEcC6nAJHvwkjDjWMdgBpn3JY1Tax9feeE+CLd
         rd5g==
X-Forwarded-Encrypted: i=1; AKwUvBwkj4Tdm+ZhbN/cDWdcGcQ995zhW4Qecc2bczpAgnzJes3Fy2B8a0NtfUNO3iJMmB5CHjkEXTRXx5xh@vger.kernel.org
X-Gm-Message-State: APuU4Z+OGnYd7IBQIG6J6EU8I2fJzkMv6NTl6Ejk1rI3G6lKXVTE3U/I
	DDo4rGDRNJGYFP2A8VrCLuFVhNWJfGbALqrP4RYOTmN5AUa7l2cRfNRu
X-Gm-Gg: AYBFou0kPNRMTJK4MdBOJdTuKJPMWAK6ooynoEQGr8nMiP2dAUycJ5RKooOjiwrPyTc
	BJMzexdQO1xflTQ/0MZjsMfeaZZoxsrKrspZ16HzrMU0YVB013e5FN6iKgIzriYvZOBuQHhpkWK
	UgnK8hR2XM7xIIhCsl1CPOJyemUvGS/jdSkGJ08NPliyPJRqbbEF63LXArMKRUb8666rnr/rZAq
	rWkH9eGLGf8kbm98mG+zNESniiO+SuhyG1r8SGiQ8uuGHPIFsnbgiXyTffvq1qJYHrlRNkFGTe1
	XGQa7VlgIEV6hDI0b3cJqMmGnFfy7v/5g4WohOzQCaVavzok3Me7nAQJnBXxoFGJT520UbYbPQr
	5RAKCFGa6B04sdSHLoPjgYqhXmpvnqx/QDjFCOMa+r3nBZ5pWpDPJ8DtBdhd+LfwiUZ3bZ4qlnQ
	9eQO/TDMWTq/CTlEEtEVM1IsEusJkIXl1R99yDmYGrZcBZsHcewMKwTEesTU3fW4a213L142HUT
	aNa2pT7y0gqQa07ebfMwfAw7oFFht6/HBQsHKxqpJV8PRG/gIRJoTGSUPwxK6PPEyhhDzltETt4
	+Dqt+oIfYIY5ViuulZbTMlCNX/ewUONRuHDLxGdnAPX8FwfczLrpNUcY+LdNsq9BXV7b0YTvNd2
	19qVf4XeYYnoxwrEM3GJ58Hd6/6CicRVMdeyTdP4rZ6LZREe7vjFc3Wq4bllwWVoalq5iTGDWHV
	f97tInhq9+mewddUEVzXPj1k3rvUFL5VQMPiCcNnaH+b/a44lc6kiQV+A4/LmJg6qJrJJrEOzne
	w==
X-Received: by 2002:a05:6820:151b:b0:716:e9e0:543f with SMTP id 006d021491bc7-716e9e05899mr67251eaf.11.1793904965992;
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:39 -0700
Subject: [PATCH v10 23/26] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-23-dca1f6ed29a8@gmail.com>
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

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 11fdc10c7f14..c9135c8abf54 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1718,7 +1718,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

