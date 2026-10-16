Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35813A9616
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122339; cv=none; b=LlG4mISPO/s4f1MjkSxsxDZJ3TeVlLm7a9oC/UBBIFKDy0XuuXx3raqbZxJiVIZTJD6SdvCum3/KTP2EQfPvxNDs7XwPj57nIOsqSlGAEmXLmuhRTpw9CGQIcq+LEUcc6sIxRxcUBhuZb5ttS1Q2ljjPEtp2MgRgg4MPStbcSZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122339; c=relaxed/simple;
	bh=HeEn7ZBI4PAW/iteNQhqHA4zXunmr3jV3/OD3Rh6OA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8BIMR002+t4aWGb8Ib9zaEpBtU3WxjKfravZ2zaHMmfB8w/T2CNv410ueJsTR/2YEo90j6jo95sL6NAXPL6Lg+xv5cuIPCFrlXbFkmPx0InFj2+zq3s21RbmGS9uUf7TdZ81BE2xdDIjkXOx6Cx4XauaRzgxinjxCGy4vScHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1iNEKna; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1iNEKna"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-825487fb37bso3635637a34.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122337; x=1792727137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbxk8jsiAzvQZpmw8X3BW7J7DhacWFvl1KbYwBAc0jg=;
        b=M1iNEKna+GK+WSBew8EHr2/FEKgaoyIYJovOBJIzcaX4OFjS8ZX1gv3F1U/sU2Jf6z
         +p7Yg3PMDh3o7sgIMAFuQBR49hmfo0Owqfkgi3qpFMMBDk79SXzdpuGsN4X/mDzsN8LM
         XVHlM5ykDXM/mxkgeDRvMjesmEHu+FPft4Vlc5kK/dHRyXhQNTFpnAbxcSy8afdu1v3k
         O7hu3rmOvi6wwaeRQXWTngh0tBCiA/iPRg4AWJ0F7h7ykDoaE2bmkS4aqhWa3Bd18JKj
         Z2r2zgF3f6AKRndLJHKFYXmANmZuCgm16xdNDS/JmhSHzvQ+CjGcsrvjBJtDbq5grx7k
         8PNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122337; x=1792727137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbxk8jsiAzvQZpmw8X3BW7J7DhacWFvl1KbYwBAc0jg=;
        b=lvwDnZdpyejA1KwI545/nhueeRgxKDuVKmiIAHpnXmd38VCj3dbYmWcHah2l3N0z8j
         2iLod0oC7N6byKjXKIPwppjFaW04p6BqvqBFSOwyFVj+YK2RQ0x+RZ2TqTyrYTQ0wgaV
         Aqomd2AfCWHx2tGXmnO/9DpWcSBYFKrpu7+N1YWbHka7qduf7Oh5IvFPtsoEcYh7k4Pn
         hBjvsrZBtRsmyK9c/NqNwAmcBjGqIAE3SnhYESNZ7BgxgWZdakpvRDezKm6Om1uqK9X+
         X866UNCJP0ICp/CzoI1NBvVmu5ZK4lVOlKuVRepTjscqHzYk007PHJBbzW0yup17stgh
         K3KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAxSSEJ4AXfAZUeF9Ivs1HNuMwccRTVju21tUwIJkWVWMBqKmjGI559tT/c8tWQZkTDwYM6KX/voH6@vger.kernel.org
X-Gm-Message-State: AFq9FYIqBPKIbUOmXY+Ul3pLMj1oiYNmay4D+xwAJqf9jTe5h6BubS1+
	8z72axQDFTPyi9TdLVHsDcaHyMz/NEAJNfu50S/tA86mdsrFEvo+Orja
X-Gm-Gg: AYBFou2MSKXDzGTaZrwrJPZjUuwR+7uvhKDon462m3y3Gqzz/3I9lol8HjoIVvPsNf9
	iDnwA0RF/pX0djVySSos7l8fFZ+hgVVqx4ohOnXUIHDaPIX4YdVNQC0q2dUsuROF0f4GXVRK91i
	eoUBsbQGT+E9t+o2az1okXLhv9sicUkdOzkaMdqSj6q/mpvZcdkjehdLTAHxuQ49hd7KZseLd1w
	7Jhf8RE1qM/l/mDq6R4G+rYnTbJKMoAwXEztKhuCHVboYNAPEVrqhE+WcP/gp2mrVCnUOsRPpGK
	N7MuXE5Ub+ILPCGq0LIgKfLQqKadorhZ8UtrTl+oXFvVk3QctaCVhK2L8shHeCoILsXZbvcQEF8
	YPo702kHVmykjKnK9SHGI9+tsx7nQEpjjBuplnxvrgDz08DK6IgIQIM+8uwSQ8uJJGBufEf1kCv
	TLboL6afJXyz8tzOJ7+eLkeTE+n3iVE/8wH4PscODt9PgphWL8P0/4zEj5XX3lk+OlOf3V+xR5k
	lofDzxsKoE8ADkfPPybb0tZ7kVwReGx3vYjYSz/M44bRswoflfCGnn0nWVnY7tCbV4CzC4xCQbB
	eyYjDnWvULU4tp+m0d7xaaGJ5L+A5w2xNutt4TVheWub7K1W1tuaF/n+t3y157dTI+6BIXu0f8v
	EkqLl5m9IkVoyGuc+Alx6lg==
X-Received: by 2002:a05:6830:6a14:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-8309814bd65mr21830521a34.29.1792122336679;
        Thu, 15 Oct 2026 20:45:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:21 -0600
Subject: [PATCH v8 06/17] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-6-8ba4881fbee8@gmail.com>
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
index d71b980ababb..661ced4e07de 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1108,7 +1108,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

