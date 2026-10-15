Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173EA26C385
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028066; cv=none; b=iPT279oETRuzd8m2EMnw7M00+JOW/4wrFrfqDObqVuRjYC2v/vkxUflOoQPXIF6bt4o7lU4M6L0H7Qaw5I4n80XYVTCVdMNmotf81UqeHIDREcNl6rDDfaIpR3fmOhqHWTUdVvLcVnquyWB+Mh5UAtTZISTt39JJq99nFiTjl/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028066; c=relaxed/simple;
	bh=pp2SixJcCNbM9ouP1cQ4wZ06wECMdT8iJOt4pVovses=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UE4G4IjeaHiPeXrqjyd+jX9sgxra5Ed/QSCzsKyq7sizsBC0+qALRmAkbP5aSQKoKEgFh7VkLddxb5JZDPDzdRY4d5DZgsU3rfuVyUi7woTmyR/OZCjLfjclH52gI4UiNlJGFIiVuofwuKsN3Qa6uXKn7PiOBRDlRpEevmUG+lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcUu9KLx; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcUu9KLx"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6d68de53053so2032447eaf.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028062; x=1792632862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=XcUu9KLxCjU4p+NWZR8aVHuvo7wr11XN9O36/uMlIYhNWkkedQ7Il7q6kwGrOaxmgK
         5ODrASbmjQCiKIu+PBuVDVXEhulAGV/PdUqUUDesVDEHdrhN4Y4qRXnNg7EZ8OBGIjZc
         yApHALPrJUPW1RSrrN5WUhH/tWFBlpTTOX2/GhVHbngYEQ+hpmGzlVyQ//ENlXJ2NJlY
         7CwpGho3iHkW3Ys1jVSro2ygf15o5SREjwiY/ZbO6chIJK7PT5qetqGDaqmdDKKJmATi
         vocVptOI0e23jV3Av68cnpZG8c0QNOb/jbNn1XnN0pg31Wpg9dtnHyag5NVggW9+n5Dr
         8xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028062; x=1792632862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=mmDMcKWErn/joluodb498DaVmFKpYxffHMwwOXEs71/CprhUX016S6A6JpBNoRe948
         cta53cxuJau9ko37H+wNKHCJiX9Z+uu9jQh1HsBIWb74LHhW6eX5dvu1JEX47LRQBkSv
         HNs0y9rjy4whLbx9yv6imy+G+7lupewWPpfFXs4k7JYjDgHOCXIoo/PXs8mryjTJcrX3
         XE1+P75IK6ffd1lYVM53jh4PSpo03UB4aS30n2mzsdxFuLb5NmURjK9OKLMVmkK+k6qd
         Jor/mD4x8bA7ILW8eKg6jNeubX1R+S10H1tHnpO2XWOK9/QggYRonBFqg8wvif4don/w
         wl9A==
X-Forwarded-Encrypted: i=1; AKwUvBxq+8Wo8syiKTsFwubx4jfVhR0ql2kzXrZDBRJ1hJ7eH5baWRVIiEGlPLz/sTvf7kuxfknhyzR6Y50D@vger.kernel.org
X-Gm-Message-State: AFq9FYK+kg4s1707IzSAAb23EURhWRWGoZy+4yVwL3KEJHZkBdv9C8aG
	Y+Q5WK12ibj+KYeaC9NzyonWS0AAwXu+D5mKLpbCwwPJqMCHXJFlk6F6
X-Gm-Gg: AYBFou2cobdsWAyh9TMByyv5X3SW0EdI70aTo5fkyawZQ+mztRTmX31yThhN8CCl7YH
	TcAT2PnNAvmVFhEuqEqHquSLqO29NYHXRRgzbnWQldFT/q69tAejx+x8nzsev+0aB6kRuyUBKTg
	A6z3tfx9y+3JD+xnOQQUl3CQYiyooN8zITtwLP9YebOLIPZmEbXmzNJ2G/74nvK3Qaj9ChNJMrW
	zwUUI2fYYOf68fip0/abpAt/HeJxOP5/OV9FttkU9L3+8oEzmuXgmZDZlUUkMfBH8OEdw2Gy2AW
	DPhZhAxOsBwVzDOdonFkSWMXbv3PWjzgeH3WSXGhkht+F2AaI0nGp00ygMcGsXBbw+z63xAFpR4
	J3eztQPEKqRx/iRoKc2b4QrpsHaVqrWAvSm/KzgBrIvEwZCvUHFoLPMkzUBudiwLRtsxwIWIbl6
	ED7vgaMgXxV9lansNx23s7R4niYwmfRsXpuTBXF29AN8oFS7aNecV4YinqA81bqms4rNhvqCwwI
	AFML8f7qMv58DVCXXqLk5V/kGsQJ0NZWenwLMlfFgZ4Ut8vjr/JahBYUblCijrmyJXw16WEdDKK
	bvG0zSeJOovDvrlNzgeNnb/CbHTthkSHx6WcdZQBqrSK1W16dXirKJ9hXoNZQm+7SY1SbJH55R0
	PGQEOk1SEIUfXd80Vy6Fn
X-Received: by 2002:a05:6820:1517:b0:6cd:3fdc:a936 with SMTP id 006d021491bc7-6ef1144ff66mr12723501eaf.83.1792028061915;
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:53 -0600
Subject: [PATCH v7 06/16] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-6-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
index 57df88099206..8256982d1d56 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1101,7 +1101,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

