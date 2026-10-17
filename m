Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF3B4915A9
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266391; cv=none; b=FwAZ0CZdVQDxuC4n1XRH1FrXEGvd58jXyB5//EdK8yi1dbj1OrAQys/uK4qeoMHRZnBhY3naIL0G0cLgkR7sVAQj96Phy8AaPtqqPXgnHsXlY5Iqqfdsi0qsuYtyILQUTCY9yrRQMgYNF7qYEmm/yBkjxYdXUKbby8HM2Vu9SyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266391; c=relaxed/simple;
	bh=Gr8R6NeJ/RQhMXjnXQ9SPScO5ueGFcDbXLJ+snnHayc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0LHUWuQiQ8vIqytv1UgRo9DPRO1aP1kxe2hUgO65w6sKnbXtNyWSrw+3pNd21WcLUqLn48QH699laiSIF1sRF3TaCCUfxhuZr8rABPibN5nlkDFYbSmyF7+GhRj3mrsuV2rYnxBw7+FKh0u1HUnAPsqYQIkx6xJobnESepwwgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIYFjPty; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIYFjPty"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4a451915d8aso616835b6e.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266386; x=1792871186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=mIYFjPty38OYk1rlO9OZKZ+e4xPY+/ARO6ZPcRFlPI9BdZ1lEsMyaB+TrRs25MvejC
         NI3Sjj1VzB5cZjB3QuEpUr6SGnCstTa2sjevXMYOd7ls9/kv1MEGSTOycZOffXkS0Etm
         p9a/r++LED766d8KgB4o3Ve4ywxGGmv50rCGJ6ZYgGVp2+CfQINkY97XlN06XCs6XHg4
         X/XcoPYzbapz36o9+cbkLcdzkUqxqF7K2s9f0CLWQzR/GBrHsSgjT55jOFcmPKJ0Qc7O
         ythVjq+NgQmxG5aut1jNkn795KjMcNJ93pNEVQL8we08JChW168eI63cd91OUeVHafBE
         YSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266386; x=1792871186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=T6MbreXbdCFNSFJ52MILfuXljVpVB+emaaKP8uH79fnSmp7gfDyNW0mtQZ8KllKTDM
         Fj1stxELGYTLND9DEcAlEklHwndCYpgP36g2OV0FJWuPUbWKQaNeFPeO9GdP6rXRcrXk
         zEJ3eZj1SlnzpKMkirEinexX5TJdySzRIOZ6eQz7t1MUX20A/kbUPzJZlf7YyOmcOqkB
         PYrW9SEbrLB7SqQq6ybWGH108aDZpTyfglAUTPFU1je/N1nS5ddltK9f4zi3LjLH0Y8p
         3UT63zkzf8vXXCKK/dN+7tDWNenFdjHUDm5vbUjO6g+uQEDfCCDsrXWlNgbpFZmj4M+c
         AgQA==
X-Forwarded-Encrypted: i=1; AKwUvBymVMXHS14oSM3rg+EvoLKLLMOt8CcV2twzgRQdADZHJkaKYeqegzbL1ZqX6Jbtnlx5SUHzx2AoDjXw@vger.kernel.org
X-Gm-Message-State: AFq9FYLmfyHYKpXLmYlcSQ1B+QnoFfRChF05HG5CdYX3HkJegaoVjSZZ
	TgjlOTm8KBWlU+TiK+8L297r1/HQJUZInqZlFAccnO8nOpTO9+AvjajR
X-Gm-Gg: AYBFou2HLFi+h5p0Y1YVcrOnZAh+N0bnNfJ3uSbVog9PNWL1KnVdbk4vGRoOK1rO25y
	4LKuqG6+485pRxuo1gf910yoWFGMEcQqirkhkSQoVWU+LZvBDIc3DsDlTbjnt9ePWlJEK2fvst8
	HnmJDM+tUteo4zkezBclWzYgIrT3ZwzEpios3DGVKBcgJygVNXZngCEQyJ5KbzxkPF8CjFpmGc/
	pSmeYzgB1IjCm6cokAUnzU3I4aNyqYNVzluqgiA/yQQI4C/FKoTYrX4OwwtSDybLqZYv+2k9Yhf
	VlQjyZ7+m4VxHuHd8z7MkQQeKHlAWO04YMHzR3pZK/jmqBFaaFXE4ilqPsAXDz2tXSsXJwiTAfN
	jqiem5ou5rxVWsOHtgEPh/etCEm6ruGoBO+i/KEZn1gwFI0gPPXR+jw9a0yfdfpr6hK4wJk5FG9
	JUIvjKc4QhcGgaZoPDgANRIm+ztXxMQbd/PZUA9nnxlJjJfUeqR41NmLtb/Gogf9xNJoXeLTjQO
	knNz5vEwz1RZYiVSfO++jtyxCYS+Nc7NFVyHrABb4jdaGzy7BbLtzs3gOrbLWfZCUbdIdyfgRDe
	FZZ1eGUg3q08b3ykBDTFUqrcofFhMRnlQJMHB179lKyTsMEVNAdrnoYeFIC8scDcJhEn6AYQFSj
	En7Y4QLMmcKs1DpYvEpf1mrZeRC5FRheu
X-Received: by 2002:a05:6808:5392:b0:4c0:12f3:6007 with SMTP id 5614622812f47-53cc22e2b13mr2397740b6e.4.1792266385605;
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:03 -0600
Subject: [PATCH v9 08/18] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-8-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones chunks.
sunxi_nfc_hw_ecc_correct() fills their data and requested OOB buffers with
the detected pattern, but sets its erased flag only for all-ones chunks.

The caller skips normal buffer retrieval only when that flag is set. For
an all-zero chunk, PIO therefore overwrites the synthesized zeros with
SRAM contents. With scrambling enabled, those contents are descrambled
data rather than the physical zero pattern, yet the read reports success.
Requested OOB is also reloaded after synthesis, in both PIO and DMA.

After checking for ECC errors, skip buffer retrieval for either detected
pattern. Keep the erased flag separate: only all-ones chunks may set the
page's has_erased_chunk state, which controls randomization when reading
the trailing OOB. Preserve that state if an earlier chunk was erased.
ECC-error steps still take the existing raw reread and erased-page check.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 22cc8998d49c..82af3ccad885 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1231,8 +1231,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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

