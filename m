Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904949;
	b=dUIfUMORb7RUcjDkEY7AmI+sQIF6/OJV6oZsvbuVwF5Q4IyzbfDqt/RB3amYQyO43+hz
	 EBLM3PSakyjmKLUAxIuyhEtsjA1f/ogMRIsfjmWPFzzog4cwUQSN3tK3kWCQSyy8pcNxk
	 zU/TZ6PK0qQvjmU8faA3HYN6Ij2riJompYTmoN6ufZ/v6fzZ66gixV4CmWJbx5/g8evOs
	 tePCZNXJ/RO3Qv9FYN7UGdbGAHxNpTRKWhBTGSCrb2RcVAWXqXcx+MkEA2QabwsLr4STr
	 2OdD4k0hH5YX3d0BJ3gpw/5imwZUY3oj7CgkQrneJQZIrYB6OG+7H03GLbOIo8kDprw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
	b=bc63S4Gj1Uvha4pgiIFBL4EBUtjKJ7VrYolkFlv0YXSfaCqq/Mojv9eUFKpGPVftqgXk
	 ZxcA1SPwOlSbNjfwstxBXcI5n9uXTulTi8EADFrfcxhIMUl4wd+jPyKbPy4oU3CXmXeZg
	 bWZ4jUq0IAeqASsnVURh2O6zy1nUVOsdIlFmAbohfDSdvwF9uLlJcJHhzcXvqQqbQ7Ev9
	 O3kW9OPSABg7sRj3GDRxP6G47SqsXIplYfL/tm/KYhGQ2YmEkYEdm4OnNsICTsU48IKyI
	 YeZtpzLR7r0JfJbMxxEd3QXmFfJOCyjJbpF3MmVdpvzgX4bsCisgwbK1OaLUOxp67NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IOci829T;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F017606EE9E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F017606EE9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IOci829T
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6f8a519e215so1084209eaf.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904947; x=1794509747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=IOci829TO81PMrWPJBj2LZ9u1eWY3RsuENPwu9zrvv9WxrplG8PeUaSqxmYrqks/n4
         pqJffyWy6dauf1gkN/effxjU2ZY2ZabbUBtjWE1Z9ke1KK0xOikfb3V8vGZh3myX9JlF
         IHWnA7+gQZxOGspkJeHEidMuHZCVW6uwrVU3HNeTxQ4vUHXWtiP+hxtYu4NTI4AQZYKk
         ZC5AGQN1NyzLYv0+Q+q96NdBijqSgoCHkUnsOk7NvkwSoA0F47+u0EJAKAFf3/jdcYVJ
         I+3iYEtmvBcXnIbZsRE3eqyGfKkOAhq/msq9zLNq03tc/cpqiRKSzttFRdm6AlCv4FM4
         EMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904947; x=1794509747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=JMRGb/d/6Xei57DjLLE2DsuarxgDZQ4cw0+CDNgaab9yzzDTB7pslRm2VumOQibDSC
         94iWDvIlmBH0jY5brqeBHfa70iE/+ecBB75MoW/FASSd0XHRUFhqT0FQkOtcHrHQVHep
         gPKDU51tmr+MnCWqps9IzfxwXnER40vckfF0FunRi4pzoAYTGQ8y7uDX1d0rVBemT7J2
         r6ZxdMpUupi0Fx4tMGMkJHCh50Z1WSaqOrUBmSs+ptsvRMQoRrsBG4g5Ui94a5kwKAEZ
         jzSttfTp/zLt66SOqRX+7u3RMP3Kh0tmvCE+tfip+XZ57cKbb95RxIJQHj7DmcQgbGsk
         1pvg==
X-Forwarded-Encrypted: i=1; AKwUvBxNNWn3+z+yxYa7yAHsBPtCu55k2Cea7ot0aHHBa+7ZE4Zse/YebYmYOWu09etPQNygw71nhZquNS0x@vger.kernel.org
X-Gm-Message-State: APuU4Z8a0tP4Ng0JKmmxSD5P+WfyBIPKBvEC1BZzD1zUXKEqckJxbRGK
	Rj0EFjDJBSaEvNhVC1AU6Vh6MJNDAhTStmihaManrEUgTH3JrfcvLNJx
X-Gm-Gg: AYBFou3x51N8LrNNXGVxNqcYlwtTIBgCT1+WD9GV8nGT+JeU9iYCtN6UKiCzwbqaXx7
	WDgs7SBekhASfhtqk9mTq13rC9XRSd9Y7oAjNUO/TgK92eUagi8zVCxlK0AzPfHYY9dxS5BO0Uy
	weO4eb9tafBMd0NPLCie7QX9mEIdg1Mb2aEsALIIHOIfrRi6aFGAehgD4yC8z18sWOPWaJGMUmN
	IUEnVMvVcORgcumMDiOY0aj9alijjd/oh00O7mQv0BKSDKTkgElSmqltsjMRGPotSN05n820oKc
	g78EFlSJkjO7XT3v2Mo2UxSvIDZ0DiHlXC2DqdrA+TSR7rx38fkogvsIzJEx5Q0layKVaQFA7wT
	dUd7FYfnuIwFmtOXypcnfhbqamMQZ+20sYMCk4SUkZa4PrJw77MHhtH/GcMcP/6skameDMKpRBE
	Ce5VYS91yp1UtkdMkD6OHw9dMFocaQdcJiKl8F/rsw50gkNmgnRA/OoFMJM97lmmrtyanFuROUe
	29Kvbxk2zPju4iNQnfkdcGu91uRL7yo6lwDhUI3Xd5K1hSbUBVcMzDOTf5EntDnYgtfEqJcTJjZ
	o3dWiDoJOX1rQHnHIZkb6yPZ5VR6Jrgffu6E3zvzaMOGfnpDpOW1XorsKlf4fNVU7XFxVEsU9LZ
	9YvolXQF94tjWCGOONGI1pRiZBbCDuFhmH55FEHKqQNdZr/0iXIjQPTlz2AGpDfpsC2eh+k+TgH
	zMiJ64rHQoShQlMUpw4oZfLCgoFZKWLNNjuFtJqORNYzkEkmkNT9dF
X-Received: by 2002:a05:6820:2308:b0:70e:177b:eafd with SMTP id 006d021491bc7-716e78881b2mr244556eaf.16.1793904947324;
        Thu, 05 Nov 2026 10:55:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:25 -0700
Subject: [PATCH v10 09/26] mtd: rawnand: sunxi: select the pattern ID for
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-9-dca1f6ed29a8@gmail.com>
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

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02aa02d2cdb9..e952d7f6abef 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1125,7 +1125,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

