Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF13A839B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122352; cv=none; b=qbu1P3WWgLk3UjNp45eUJhSGyXnnUKMSy7TaWmZpOaMBFK90+Ai5NKQ+Hu3EFhrBDp1u5t6k6RW9yYM+d1RTRVvlzjxY5pqSlrgyFLtWwva1BocQAySjF9Fnrh2SR8MrRLSAWiO+KgCJPWccukuVDD5mVEsmAyugHSjUkWTTNLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122352; c=relaxed/simple;
	bh=8gBZUPMs/8ybH7J2DLSL0LxVyDkr8YFuS4UrXkubECQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxXIpbFJ0GFBFEo5FrpETWzHQrUXpsC5TSK79uSpQO3ZfnAUf57fihJfrVfW4q7pog10WPc7hpKa8zMw3ko/7q774Z99IN/BpyP6QU7ep1GiIyGu4ZNqxkzgG0pWWqiEBoff5OLa1dSPDJElPSsqEjV/7jo8CiI94BRDcL46Ito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIIj4rOj; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIIj4rOj"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-82478760557so2035369a34.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122350; x=1792727150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=mIIj4rOjM4CJMqUqlR0aRqbv8BoGRpGNm0LkkjC4+J42sxkazljg2vM9Fng3HqVoyC
         /lzF+zz39ODz7R4rnVgEeqvmL3L0Vb3qPauIegsUok5s/yuDVnULb9V50KnZz9KcPTw+
         DgLC7s5G6kHTrS1iQWbXgCcLELtrt1bGp9NAYZPUbKwAzZL7yeSVT+V2xYe0/vBQS6Qp
         1TQYj7W+DyluqX6pF3lrqocW74t+tXeSQQDMKL9rLPvt6gV5Z8NS2Fh8AqbIa8AyeMZ5
         rcZUey31ixbo3n9EdqR6K1duCL0hGf2BKJMiIWV2oTjYLmOk5MtID0kpJvvBNoXwN7i/
         5w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122350; x=1792727150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=kghXvxpHazJh6VdhQllUneB719pMYq3xtvZ2f41YZ4ALJqoiDpOEqRy53VpahFUB5P
         lLGWxYuELl+B5OTas9w3hIkPlw+/XRBFgJn3UVwSJbpk9qKzpfkFSHWoFVXFyfbDOI8U
         zz9plH0so0TrwMDVdFAUZUx3NecY3nufpOXXf1K0oLn4GoeIg/yqBctcg3c56Jlt2qG6
         //PR5wfsElbWpWLNsLNyPPyFA5Oa6USDaqeV/hePK2MfW4zW6PPEflzBScSdUJQNsg+m
         tve+yvmM2fDRxopbWUv1enRBhNMKMIDxMeF3CReYzTbCH/hsp3PlZJyqWUnUb8Jrt6vc
         V94Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeTUicvkGpmhFzzxMFjC4MFThRrbrF3PluWD8e7lLYjqOVbcpG/z2Zviren1u7MDMDJ5X507olivvq@vger.kernel.org
X-Gm-Message-State: AFq9FYLniQWWJHq9ufKPIldgiwpmlTuzHJPf8Et3gnjBu9xvCWSlkoqC
	LM6c4aNURJCCpKGp+sXhStzQ20Wuw4poFdz/xHhuIVsqA/B1pQhMtEuZ
X-Gm-Gg: AYBFou1PGktXeSkcKUDUntQmTakSJpHfbJnYO/pGk2/ERDDO8jWiKLFsbG7TMcmGPqj
	iIRGKfirMnJShxrJNwuvF2c8FeOTgwln7Pge4ISc5z7noQOKCQfes5u8v04xH1PTJxA3F6Q+OvO
	dKalG4daxo7k3xTqDpGmwo+yzCjfxZGY18RdyUz8xoWS5cCL1QSg0kVboMnzBzZYr3gyaEi275i
	LxVTEsiaEPGwn+2+2apiA4D+UvLF+zx8h6ogbaJI9hN7Gm5nTRzzLl1KsSR3TE37VLHuBX3ncr5
	RNAEhUWUh/V34T40hBClJfQUcD2t9KRbp876hsYAefG/tHeJNwPbi3NCA0wd9lSJJQzxVphFrFM
	R0DZGEoF27N/RUZ2p9IyFT2XSErp69audpO13p7dVGFzFl9ZxATonrqjkWVxlhRfTUqFIwTNVIy
	xC+cGudXPCHR4Gu5+gTsdnoX+2ktw1nrtvHVGuPTBa1oBvHz/5eTGASlplcgaFswOEGlwIcpQZ3
	DryDUaHPn8fbipGcjdseBXMa71s2D5o1oWlyjWlweTT6CkGHN8u0fH/G5En285+WUxd+yuKYdFP
	6HRi+0PNtkbJm5TH5BNEBw6cH4zXiqe5dVsyr7GBmB60R6Ay+m/v8vKcM1xmArTgHeomnOs6/uW
	Ppe+4phO63Fv1ptCQpgEZDg==
X-Received: by 2002:a05:6830:640d:b0:804:ca33:4aff with SMTP id 46e09a7af769-83094e783f6mr19887903a34.9.1792122350229;
        Thu, 15 Oct 2026 20:45:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:28 -0600
Subject: [PATCH v8 13/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-13-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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
index 105374e93b37..dfb2a64c6b50 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1620,7 +1620,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

