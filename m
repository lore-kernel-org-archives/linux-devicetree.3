Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223473;
	b=UM1ou1BV7Gf8jCP3aTITI4HMKpBgbDhpNv7gISZwaxmlLf6rxdjB9vXl6jvlmDhYWAkF
	 C+j5ohoTmHvOAWnCCdNWT/9kfzknuB4NKlLmIFZUzF0XsT46ENgFmDfwJSzwfpN0omUya
	 MeBBWaPks/ULWsHlRRHsBjBqkTUYKGYCRfv253UyrufjLJ4pW0w93SiwyNJcJTQLEuV7Z
	 YsH0urhzD88URCP/2p0P6eBAtFTohq/FjHSSpeqQGuhCDEuWC8uTgQKc13DfiJaTIGJdF
	 szM1b3HY+GlD1Rl+tjoA3kqiC5wDMPpPorp7caiYsv2S3FBAyI2i8EbE5UH8M5ulSdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
	b=McLmMLU3kjjyNsiLqc9N9InNPpbEgec/IoRbxlCu3sMxwjAcxUqZmr5232l0fLVsBx05
	 j8ikIUnjb3haMuife8Pfpu8M0NHvfTHWH0EmFTAfqM4RnT3R/crNdo7ZLe/SD0PufSj7G
	 Sf2YFSjbBeBlTxU5o4uFpMiHuXJN8W2z0rj93I131gR1ytd55uGhfx0weG160+33lobxy
	 dNZNADeVvnNZHv8bFv/7wDl1pgNa7j6Odb04exJuh6d6DGv//4kC/WHC+oDp1QV16MqyW
	 XD7B8i/6d1qoFRRNcqpesIliHpFBGhY2cX8SSr4npnuDdMyYI5pwsw+B5j8pp4Ul0Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3Fv0Fqc;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C849E606A333
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C849E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3Fv0Fqc
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-572a102ae27so484811b6e.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223470; x=1795828270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
        b=J3Fv0Fqc33LZ9TLsmirU2vflkgqL6Or7BuyACOzmZvXLwBLLei/PliL27zMfOLMU1h
         ggatctoMnjLrKbdKvStEU32PpBMWLx9dr9vljzyNqZ1AByffuQ83Y1TU4hTcgmAdxrol
         a4aVSQHUV2UZ1yv5vbTys3+bkeFOXuxHZrk7vv9jlzuCYqc8LsfsZVJmlKLglWeILlrg
         nGjwmNIZ0QFjb1A+mAvvbyehvRKwOmiX7y8mhZS5bQ33K6YI79Mof2QrOYP1zu90s6vH
         QtGhGQdiaZbTwhZ4RIEvpWbZoTWfhm5EJY5klqa7bVbepvFlOfNQO2iUAdx46HCITujy
         R1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223470; x=1795828270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
        b=Qqg8o2KSBEYlInvC/I8q4uEqFlqpqiMaYIpV6BedEpcL/6mGBEsyLMhqF88V/0LkVT
         UQkV3hTloRMruxI93tQsgywdboVVwprQkayjX9x00yFD1JLCKVz9pkZ0Pn7iHLFIbmG7
         LqkC42DzAGduNhDNBGdJDgVlZk5D4pd2WCoR9KPLSSOCPjpkjzfaS0LiZ2OTimPeqXiF
         XFF5bxW7EadBnj/uJX8yfkrhjdRB7r8xFo+CHB0En0nzTlilwNGf5Ouud3joYcQjZEVf
         XPFEVCoD5o3skKQVsi2rqXemZgvvud3SQ1TWEEgLXL1id59DO9PPGA/uFi6m3GFh/alk
         Ou4Q==
X-Forwarded-Encrypted: i=1; AL+hErGM/gLhLoXs71dvhqJMFGeMGTs8eJ7FZTY42RlaMeEjQrpkjOUETlD/kzwcjlvB3E11t7WP+jovzx4L@vger.kernel.org
X-Gm-Message-State: APuU4Z9/SDc0dylenvg48c1OTP18pEkDOMXq2tNiY6uk3jTOFi2ymcuL
	aZSijVnlpP1YCQWvivnOnni+Ksrs6Y2FjiH++1LYtyXzshQsOQ5NruKq
X-Gm-Gg: AYBFou2ZbkSIwcOheO04Wi0R4N5Auwq3DAVwHuDnr3CvTkF6U2xmM3205BAQGWksBOF
	sWzrVu5bE5Lp1HvuTInv4s6f7AShfDJDNUG9t+WCkFU5qU51KI8CiJFrj+i3SCbUY+bSxZy7zzl
	V4SNbciO4hdvxMtsAFunmYplu3mvxRDvgqIBIIr6peSdipCxFZEuSd0VKGJmkyjnNNvHtQc6djF
	Roc3A+V8olv0fkVsXQypI+TvZA8tzlHTMnhu1k0mC1CfpLxbsygkpccrGquR/98vS8twIRhdyqc
	ufVATdDuAGBGnEwqbvBSHiK5roC7aYCE13EmJT391IpewVi9kBVBaOTVsQs+ZMiNfvs0dfXmlV5
	pKe1DKJWXh6Im+bM2tyEVyYHlvV3AnKbRe1o8vbWR/pBmD4tNWXmZgObOJZyDFljVDVotFd6bub
	XolO69Z5VXG8LnK0il0RPxUzgR8amDxb066lPTkRfACMe8WY25RET/iRbCokrps5FrNywVuoMj/
	Yro37yKGP1+EewZkECNv9P8/7ISYy37xm2Tscd2wo7zDQWateOA/37fAEJ5x8swUvYu4kh/VmMi
	ioLQbWH/CR7lJV3S6ALjRowBQkF3nNba86xET/ECRfldUZz3jwWXu2pLeWEdEPNKapcOwvD2pnS
	9N/3yTdK2IuvpUWS1VShBQlYgeBs4WcWMkiH5NDajy+14waEwmkDs8LlIRy8nhD6N9UuSRKOnPT
	eM6mK2fddJtjAbMNXvnQTce9J3m93ojMyHiaLqaG/kNH6rFjGzT1Ym
X-Received: by 2002:a05:6808:19a7:b0:55c:844:98b3 with SMTP id 5614622812f47-57a0bb53de5mr6320056b6e.50.1795223469671;
        Fri, 20 Nov 2026 17:11:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:33 -0700
Subject: [PATCH v11 10/26] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-10-9721b1905ef4@gmail.com>
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

A DMA read with scrambling enabled can report success but return zeros
for an all-ones ECC step, or all ones for an all-zero step. Requested
OOB can also be filled with the wrong pattern.

The controller reports a pattern-found bit and a pattern-ID bit for
each hardware slot. The driver tests the current slot's pattern-found
bit but uses slot zero's ID to choose between zero and 0xff. PIO only
uses slot zero. DMA can report several slots in one transfer, and
their patterns need not match.

Use the pattern-ID bit for the same slot as the pattern-found bit.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 76f60fde7a86..43c0796d953a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1086,7 +1086,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

