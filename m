Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108E846F484
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266376; cv=none; b=u7WpDiMtwFsHk5h/21ZlAfiWIp5PDqhFBFT8xzg9bpeI4DnXb6tfxMbUO3759gsS/LC4guQc1azws9RX5wsgA0iItpLu7mzCyU7RRZ5wjy+r6RD5X4iItN8NH5tQ7CDtssJFqbqeS71+LpPihkEdv1L9hO3zH40RXXmbcr2UuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266376; c=relaxed/simple;
	bh=mN53hNOFiAzhWVgJjfpGtTS1jmZz/HpF/K3uG0lAfxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elIKozl5wS+3Z4l3CfsxxTh8eLXqnr1v3NYb4Q2O9XsgaW/U4uqm3e1l2AHUTUjqZcP3/4rxJR9raZJiv3+uxMwX8fNYikD5UT/z7quTTImL3FM8M9mH27sK790KHfILX8KUEzrc0r6YmKaQhSievAg8ukqvFz/bJrwQY+UOEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed7NX3ij; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed7NX3ij"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53ec2cc397aso390711b6e.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266374; x=1792871174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=Ed7NX3ijYnk6YNBTLc97CquhQS7Uh2Em+4XiRnvER5C3XSAiKdV3OCpZaTjaKxq6dX
         GI5ABajnXlmy83/RTJtRQN1ocIxKxE7MkndpXx2j8y/kBLOo9KT2vkmbXk/m7pLEmciX
         /mWtPivQ4n9ZPA/4buV5lCpf5fmKC4uOJokxAltdDZo2BLT16keCLcg3ha25MI5bY2+1
         sexGlgiKArIbGIOTwXPehQq8+tITuiSrloTHSQHlFuxjnVXZRhdr9aHfow992fHSkF5e
         AzXG3JHx3EzZ1Y+uHv6nXx9Et3+yLoohzaTYX6b8JnPtDU85sisZJVZXpgylaQkiRy5n
         9Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266374; x=1792871174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=gFbXmQpYpRPit4akeE1WCZnQ7zz6KeBzCwI6IJJp+bNyKdIvD1lGIYZ3zwEx7cvmGW
         lFjDfpb5oJWu24DCRbR9Hdemb7k7jfmka6T10ocYMLx3FnP2qyCpp2umUx4aZHbIjSlL
         b++7kNh+yQAoL1Gf+u9DUpsBvyUW9nGkwrnEDWE3ZTo+pzdC6iYroSszphyBCGKVqJE3
         XkDDHM3xi2PGSe/yOhTYs/Al4hG1rj5Kc6rk13EY/0nUsa6TMjVmR9R+XJoaHnKqz5hh
         h7rNgYG7Xna1PHhq65cjiSD6PJqUidzDDhu6VOXii2q8/pbbBirL3GT9m3U5jiMm7ykx
         Bphg==
X-Forwarded-Encrypted: i=1; AKwUvBwnfQH5kaTbLvFIhQVn1sLQBc3IebjMfQytgpRDZV4J3xV5fkjFYFHQwSIDzzfvkeO0dz1CCplQt+cy@vger.kernel.org
X-Gm-Message-State: AFq9FYKF4yIMK111Hplez/mrqoEM1m5FOO7In143tKgVJyyCUL6XVk0e
	+feVunJgPK/gV2DQ3EEeLop9eUeb+YKWYQO+1lKCz9M7KPafM1AgHBoL
X-Gm-Gg: AYBFou18UrE+Cj1icw0PNgIn3cdFu7mFuUwoq5LYevShf6otqbso5DtAs1NR8Q+FQfY
	6bV1OAkpKJcN9jTUX5tBEUFbxcwYab9lSfVIqIKSAxrzCsoTrRvMEnU29l/8x/u9/stfRjz1edo
	wIZE19VF3B6a4vefx7bvqgnxeWR5j+9XDcfffcidr2BqLcEoc1wjDGAXDkhuL8jrWBElTq6dVL2
	7eNmKNSZj4/YfbyIedC1KWvJh+11cByw6p4CUEKA3TWICz+fRBqeX++7psFBp+2by5DggH2RTPk
	H1Onu9beUrCvTeaj1p8NN4El4Ko6f9kbbVAFj0WspZomCndxJjuKD7uhLAA2WbFud2aLywwvNSa
	uW6g9jT5MbCrL9uqRoSo1k7c6ksuP48B8PHqzmVTjb8DJ9huhexJ+gajk97TR7jLbTVbDt/ozFU
	xPKWwGYPSneBmsjhQQCWS6TmlbTYmM/pf3Z/yaLhPzo8VHbHahfAdKBuOR2JbzzHlNpWKWM+L79
	imX0oxkjRG8YN2dv++5Jy3gW/56EY9ftUsK4fqSy/MEBaAQybAYsUPPCCHaQEYpHqjO3WC+GaHU
	3yR4y6OHVsslXncA1tOf4xkBpjulF26RdyT2m+0lOky7NtBRt+ftKWGwbTQxCuE3Y22HVYghzI4
	4WAtbFpqpIUhupVJ9xWLH
X-Received: by 2002:a05:6808:30a1:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-53ccaf1dc47mr3423128b6e.18.1792266373854;
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:45:57 -0600
Subject: [PATCH v9 02/18] mtd: rawnand: sunxi: reject pages exceeding the
 ECC step limit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-2-b624c09e3ee5@gmail.com>
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

The controller has 16 ECC status slots on A10/A23 and 32 on H6/H616.
Hardware-ECC setup checks the strength and available OOB space, but does
not check that the page fits those slots. NAND identification can supply
a larger page size, and the NAND core does not enforce this
controller-specific limit.

If enough OOB space is available, an unsupported geometry can pass attach
and reach DMA code that indexes status and user-data registers by ECC
step. H6/H616 also represent enabled data blocks with a 32-bit mask. The
number of steps must fit the controller even when their user data fits
the register bank.

Reject excessive step counts before allocating user-data lengths or
installing the hardware-ECC callbacks. Check the final step size, after
strength maximization and the conversion from 512-byte to 1-KiB steps,
so valid geometries retain their existing layout. This also keeps PIO
fallback from accepting a page that the controller cannot handle.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-173724@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..bd2193d7259d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2230,6 +2230,11 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
 	nsectors = mtd->writesize / ecc->size;
+	if (nsectors > nfc->caps->max_ecc_steps) {
+		dev_err(nfc->dev, "unsupported number of ECC steps: %d (max %u)\n",
+			nsectors, nfc->caps->max_ecc_steps);
+		return -EINVAL;
+	}
 
 	ret = sunxi_nand->oob_ops->init_user_data(nand, nsectors);
 	if (ret)

-- 
2.53.0

