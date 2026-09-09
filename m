Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C327472783
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942661; cv=none; b=n7ocG6JKQ+iuGl7RmQVTr6m+uzXVq/eZPErWwdrcgE4h1HjDCjwVSy5hnz/bLE/Ye8XPRHuwMu90WFM/J1nZSeoiLR0jLfbP480ouaOUuVH9LBYIGwKWHts0qXr6dqhwbxb5rXZMow9gpXdxwt9cOpfbtCcQ4lxdOhB0SWs+7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942661; c=relaxed/simple;
	bh=M5gOmxNVEYBWCZddIshPvl/AuXs4iPCkuaNTOjovIfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrrC3a4MX0uiYpSXx+kxaz9fdlcQ2XmrQUt4JUkqiNtjfIBpVeqbSydeykO3ZueLiDg0sV3rHJ6fhi2g5DpA0hNRLswQHQAQ+Lz5qJgdIOKg1ODe3x/Vej9wwPoyKl+SFXlqaFvqA5DbNKnUjKY/fJfnQYbx9Kr61cyq5Jqgb5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvjU6WvE; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvjU6WvE"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f84a55cc06so4084388a34.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942658; x=1789547458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=BvjU6WvExhhxPpTrJ5lvNGguXUJEKG/lEFmCQiJs5nrd7yhH1hBXZmJYKUP0Eb5S4C
         ndb81ExTztpeFETqxmyWqHtH/Sw34+tkprOkUzqGZrlgi/WrwwZY14LfUvFFZtIfEhp2
         jvmAQoeiOujMka2Auh4uVxNXAmdkiho+ZkOsA3ENE+SLigLoDUey1bqme67Ikor8AvWT
         AMvNej2WmaNqJysoVAuyqZmLQ7M5fxibmsDqcqjeJr9etAHlYkq9lUOn01NEbeZTdwIW
         /TEcol49N4rhcJD6E4YGPbEx78fhEwP2Y3QVlqBHp84Nt3plqweVmNVMEYnrDn4fjwL6
         b7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942658; x=1789547458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=l542kFE8w6VRytLNos9zsyqbOyTFd02EbRBhnqASDyveaOGYeG/jbgf5Ipk5FXhtix
         qhpd8OLzdiAcr61RaT4ufedikBA5W4NVzHnY3FBhmQ1s3tAy5jXhhbo1JZ9n3JecBujK
         9l7nZypUSX6ZZa6f6Ym/dYT6wCWVpjgFVJGfxa8TSSlRR6wp4kCWlUSo/8WrUnr/pExm
         H4izkXS+nW7p2Fv4OxVS6OxE5MLYL6yILqLLY++WLQCzRWBLU7trHGuWchhMwaYcF3sk
         +K2WG+2gBENHdawKDP+OXM3fWbxUi7GiFsZJ3BUcD/nzC1Xto0WArpIE6VGOiRHX9KID
         adcg==
X-Forwarded-Encrypted: i=1; AKwUvBwJDvFnflubI6PzkHClulHrMYCwWZeDXPVqBzeh0xtM+cY0XphP2Wd9ajYrI7zH0HsjipiX2dQ8EC/n@vger.kernel.org
X-Gm-Message-State: AFuF++mhG6Xu7MrC2zyOSKrjIMV81GsPjBk2J4QhlFm2AWmVY+5tDHes
	o1i8T78Pf8dBQl0gKewUhf0m1V7QLIOaC8X+6d8pOCeotIaKQj9SoeGx
X-Gm-Gg: AYBFou1Yt8hYFoYw5dPLEdn3werFQzqVKYa4YykJ7l3qZKXdJXXvnUMwdQtFZCsi0a/
	fbV2M5UpeHWjpAoe8K2PHObYLUR+wqeq5k70CqKUpfzOxLljBO/EVReZI/ZaSbUvTAUW3sSHMEr
	0t2PVfVVEunDpqAx38dw2aJsb2nbZlvK0alWhtvi8D5FJeyn+6zU3Qa6YvAYWoon/FVp2d2MxYC
	cDwV5sAWLfFaqJHVrvzTSj4qyamsmdwH0/qHdY6xFjIhK+hbpHs8iPhdgqNbYLbNaSyk4XkWdP5
	/TRe6a4hlueuRGVB3ODcnzVzaAz4QINf3jX17Nk4o3SoIQWIJ/iVXC22dqC3dMGvIjiEBdA5Kee
	BMPJxBmPRAzdd/ZATzmyTzeLJ12xwK89IWeU3O6QszbezdcnU9lsNZdE2t4qj6NsH+AUGa61PNW
	JfR3DzT6EHDMrO/Sbq27Snudp9aXigTXmi6zhfz/pHH96iv8CycyUiUc3vgdJj1/vpEMvAGb1DN
	jf7smRnvlvpN+S350XZv8HIA808vMcjrS/bvrBYeWYtHi/lVEKF8I/qnZ7vqOkFFgo8NtjXhp8i
	LC0wziTwJxo9ezpHvBIbTNlAOIMhICfCrBSAsPyZEuxZgagT+8VQs61v5UGtDDdPOfUS9yC5Y/R
	90HfVLSUFI7RUjD2Nya8DsGMflJhi
X-Received: by 2002:a4a:e914:0:b0:6b2:69bf:c8d7 with SMTP id 006d021491bc7-6b6fb3df17emr20147370eaf.10.1788942657854;
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:37 -0600
Subject: [PATCH v3 04/15] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-4-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index af8ba2d9f7a0..1bc94565e9e8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1105,7 +1105,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

