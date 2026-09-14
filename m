Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20184A0EFF
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420210; cv=none; b=AZ+s7U2iRcGwJ7Gr65mUHxc8nT9yLTXFfXyh6AJ8UFlIYp/5ZTsQMB8kBiYUJWYKKF5Sk33i4zhsGKeb7OQBzeWyvIUxhWAIpn6aYVm5Zvr62mYd+mzhe/eOIMgSmvtN0U24jEaLinmkLg9UmKNTVvIprYs+C9R+NGa4AvAwlHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420210; c=relaxed/simple;
	bh=+EYozN7O+JBkDeCx/hgJ+s4q3FbwEjbXAk835pOjKgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OybrcDIulDWskGsFN5p1ICfT+tHUky29nE8J66Owmc7eAkXo2Pl/rahBZvzcfJJE3xoUTffMxyW2YGd96/cm1v/IS+koQCN0Q994x0FoHd0so/x3BOrHcXmrSo3CRiQCFnTRclafBojTuPRst4bDeJJ6XOtgI0Hf63+bIu2RaqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7vsc+j0; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7vsc+j0"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-80032c08611so2329993a34.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420202; x=1790025002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=i7vsc+j0MDzwuy9p8HQ+0B6fX7YeN/OFLSqJ0wix6aKQhWXH7HfuJLbURyJ8YgAGrd
         qeDei1149SAby/vSYf18AEnUaKfPQti759XTfUMCyKH9IO/qpjnhjiu0arn7ravO+7Yq
         +DHCbpphQg5V5X968xFadqFfKcmx9AWWnXERirILenvHCfExLXJo+HRBQk4BcgRRxBnp
         WVvwDPyjJmjN59nC+Cl+UZn7pExjeZVQJP6h3yEAGf+7GoPFuZ/dem9mKTYq619ghJAx
         DoyoJoBNq5UyPANXN7VskMoQywwqhiBntzftlzs2hu0JOTAmzS9EUiYZgeS9jQAv8+sD
         xXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420202; x=1790025002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=lJG5FoGBoaR7zaWacDp8JPyvheWMR6M7+UP0SoONf+rlUNM1AM9sBK/75Zo12GmRrQ
         TFG+WAHBiUhe0w85JbVwnE+8dIf9Ic6Fr35Ec1unTRg/J1Q95cj4IE92/zaGxTynCdim
         CvNL8tUTj4Jac1hLPuAIW/hvD0LOiami/vFhwKg3CSGOnNbGUchuMTKzqgBwYAlSVjaq
         MzuUv0BsHHV73sovRtYg777SfA6UnZtiBqFJxv6ULTY7yhWj0FjeEJf6a22LgegLSAvE
         fg8pid+L3a9vM5ljJPYFEAixUxF62GxKFCFFbU4Z3oUFQTjpZrxfhC/itIemSVuxIxOR
         gDSw==
X-Forwarded-Encrypted: i=1; AKwUvBy4MZbYsugIMBJ6DMCOUK1yEmFF53cr01q+N7mdteFxCRVffQ43+s4LE1gYJ/GLwfdsNfmpHE6KKLx3@vger.kernel.org
X-Gm-Message-State: AFuF++m8CEHgx9VOkMdsj0WKWLPLsSAGWB7HDC0KsiIUkcXRndewXMTH
	pb1VxDyFbcAutsXAoO7amdem0MRAxhHohBQ0nAMyduq7ZIiqS5TJf3h+
X-Gm-Gg: AYBFou28XZklV0Pqd7U6FnkSGFJmJkcgefIRWGAv5vA5hk5E5IUVbZYR1txlt8fUrId
	tDrxkzKQQ6p6UV7dnJIOxpgl3Gx9qZPxbRM5BGZ+YhmMUnK/DXvVrkid+UfrlObabjdLez1JoKB
	jPbztN7Lup8puwXp92oIlaue/ie+EhaFmaSsQ4dwnbpus4BqnaHWjnFaD4Vumad6ZTESzpn4a5Q
	s7WWJQyDmdQXQTfXA6FptOMW3sq+MJOlW6k470d97TyLXf8/Wg9DRddfe8hzqgAAmBtjxhYfOVo
	0sxKz+2KX9V9scdIpikpTe9DjWGIGtn05u8mU8k8Wv0+ArSDYxkHB45cUjTd9fQ0Jx4N+DjpztW
	u0oU5krBR8GZeFF6yoRpcEUeoqY05D2egnSEK8p5eV//L2reyzIPDxM8+yzS+NTlS6O0Cx6796A
	079XXE/a0sloT9oe2pxYz2V+xxFmbFFtHiljDZhBkibsi7+QeFonMz1zOy20JC8MNhEnjDsbAR3
	oVbQfiMyjN6ZcGPu4sPK3IvGiUJXZJjlvTO8z3BzM70kbtpZygJhyk/ua3QndDUZ+czyiQ4FXy1
	wZGbv5/sXlEUGYEAkQWQvQoJIg7hN+zjormET9UrEbOT++cwW8TObKs6XV7Dn8+bGwudO1HGHR9
	mU453zr1b1uR3TKGCSCloT6uMjdDYVQ==
X-Received: by 2002:a05:6820:80c7:b0:6b1:b33a:db69 with SMTP id 006d021491bc7-6c53fb6bf40mr4489299eaf.15.1789420202250;
        Mon, 14 Sep 2026 14:10:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:51 -0600
Subject: [PATCH v6 05/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-5-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5d88ad3b8f70..3f506d0666a1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1117,7 +1117,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

