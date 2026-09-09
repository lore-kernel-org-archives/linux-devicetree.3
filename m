Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F097F471418
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942666; cv=none; b=KEXjB/ZA7wzA0QopF/jRbzIzatjzjUAbAZGVboTHgtgxQvUXJgbE6ncABgWGBmvxnZzg71/oGQz4hB/0vvAaXJ9kehjwqBn9to4zbZeSTdSJcO2DbkPU6MKFdksehzulvp9y0yTUu85Ot6zlbE6pT4kFf/CIBldfec7/JdSfJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942666; c=relaxed/simple;
	bh=E0Hu13NVGjVcdOOasuN/FpRSk1aK5eY3ouDDcya/TIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiOSOYHYHIl9NSvkan7rPzj8x5uKA28VKPQ4ERzqgAnhhsV3cZGy2F8apgELNLNao0D6LemhLk43cVxwCo5HDlNoWpy5LlvGfoPDVpFPmYfkZi/9sqNhsiULgxXoX80S6zp+1+Lj+LMUZPgAO6UyPsrgyjaCMQUMVAq2w3EGaCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+BQpDdk; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+BQpDdk"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7ffe6893503so1351343a34.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942662; x=1789547462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=E+BQpDdkE4FdCIXjPuvlVP8rPJwkzu+vd61j221VllIWWCeSNT8xHOMyRbL/rJfwSn
         NYLIJqEymlC6F0YI3mpDIcJ2Ye0sMtsu1w3q5HGd5UfyhU+U4sF+Fg89d0SSKMhHp0Wk
         vujhNH7HdVCkKPYBodTjUXjZ0mn326D4q0oUwlZXFo+xZXwb8dl1nplNhT5nqDSoYgxk
         6NQy6FrLIidNWlbyuCSLM/kO8uEWjTV7qWuI606GR01el7S/DHvJNgr/dg2GNQ3mbN08
         6K0GSvxrA4zM7/Xo0b2iJlAZsE9TaddzrQJNitgFMnbZxVGJxlRp3k21pcGlaxqYOHe4
         secQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942662; x=1789547462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=ZkNEqIyb3Bi7s9a0i4HEFrafTYhT8Ysi/6GjdKogW2QmHQ+NvwT+Y7KanLNy4U69qY
         RIrIzaJIF93vAoX4lkq20jBGW6GrzARGSDr318SikO/G5qjR48XPyWWs/nmB1VSyPoz1
         W4LjCoZL07UPIQux0hA7C9M/e/MipemX9JuegNjWihLaw3vRuZuljO2bGX7gIYu8Vin+
         XpWVo1jmW23NToXzCe2nT4PF+R34jSlw6De/byw1iEIbpomPJHtFuO+O5e+ChyeHM/iS
         K0oMshgqTP9aYtUAfFioVYWdNOQiWqraHnErgbQupWnHeSOdn1t8YM75Nlz4Yv7rZ3Ar
         ESrA==
X-Forwarded-Encrypted: i=1; AKwUvBwsKKaE6i61SUjD+UGPJMLmQHbuJC/jiiIED1MuZG+YE8UAc7vRUufuh+zZB9KreNla56KDV6a902qR@vger.kernel.org
X-Gm-Message-State: AFuF++lMsM5k/j8Ok5ELL1hBuYNR2EECEiWS7Bop+9z5o5Gh2Ed0T2Yz
	lVh4rtvftMy6wZt7Zb5VpPKh3C1WZTPpnFzCBi3A9W43ks2EJu9TOu3R
X-Gm-Gg: AYBFou0a/g3RbLTTto3i+jAzUuda6DYyzp612AAvtgh3JRH2eu5fWFqgkI7O7Ujzw7L
	TAXBFF1ENKJeWsYfeG4Q9LvfK9A+cyU8vktlXnrfWq9G8Bt2w2oZ1+6a8CUtNKeBqOjKUQzuYh6
	tSA7dVXgvKT2AoDZnglM43MgtCj0B5ac3r1fKbrjIjwgwz4QLTJjY39jAtV52CV8mwJYbMfxUtp
	hGDqKCkaCdFq/JdIAX5/qXxTeL1VpoPt3HVoYrzXz8IhETAQuJM/mfTW0D0g/1BGEnPniUKrJfo
	/ttkJb5EQ8YJryH8+E0hOUBz/ubLVx8TKOBikPUpxc22x5nnW2MRZQh2idGOw7umM6gosxy0GXu
	C9dzM2z0w24hThFdChZ7fj38mPZWS9Mcz7dWqK2PiOX+08zGmEjGXFSXb7YdzO/f5WQiCaFTSy5
	Wc4vval/ru57nmccyBIqYSnRGB/qvfSIPHXQHcp3SKmKIi7UcsqjAw7buDwtDAGaRfM4iAfgCXp
	fTDP6P5y1XBdBjUYMDA+S3gkNPDuhlrxMGzzQ3lo6OKCU88ZsMAjx0Ikj6yx0Nf9+10ug797cnk
	ojlcUh/zE7KxhaDyUBKkMKivnO6dcuGEUl5dlponInexRQO3R4oGcwmWod2kJTU8nGe+EuvwX+k
	Z5+0e14NvkFyq6qrnNw8sp7Pd45Yz
X-Received: by 2002:a05:6820:162b:b0:6b6:f16d:d672 with SMTP id 006d021491bc7-6b6fdfb6581mr30282006eaf.16.1788942662447;
        Wed, 09 Sep 2026 01:31:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:40 -0600
Subject: [PATCH v3 07/15] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-7-838cb0ba1547@gmail.com>
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 545da54b8908..16b2b39524a7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1497,7 +1497,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

