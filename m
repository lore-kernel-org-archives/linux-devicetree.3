Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161BD2E92B3
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712045; cv=none; b=c5+F2NyoPDLZGiaphbSa7Jb3jebnOd7qJhWKzm6PMAaD5Ka+e7LjFhreR8WdhA1ahciCoiWW+FJxckbl24a08U/N+g/hOuARkgejPAGbhiMkpmHY8Xm+kUwwu6xRzXSgw48tVmNOCaY2aC06Qn2oDqK5AHT+7zurf42MK+1w5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712045; c=relaxed/simple;
	bh=dJeEv/rGh9nisWtmFwa508ECRE6nVq1Qn2/7Sn6Pn9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfsaXfuWjyHqJVan5NoCmXJJ69jOm2UPPjC7mFhIeysx+Tt2tP10K6hf0ZJj0t9tqH/f5FIGdwNE3S2bpYGjoyzVUVkOO6gWyNKDj8eqOqzXvsuBaML46j+9RKimLr2X52c+Y+dXcSZsmuiwi8O6F2+JIb5l1asbfqjyujJaQO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZk86m4h; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZk86m4h"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8585c16ab5aso315607b3.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712042; x=1788316842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w469z7Q5/aaHi8aSt2+jyQ5LFi1CuQ46eioWVHjW3cs=;
        b=TZk86m4hkmHwVS39nDrdJZ9g5vTEyUBkTBVvRkD56eVSZXq0uld/2wjHl/RrpfV/VO
         DNeP9gYJJYJGnAdf1yraAEx/byepVGEUMwJRHInxl/06pOpeJU/snw8qVbsiOuuYK9W9
         9S8yeqCM6j63Atyd29aOSdd7z2BAYBHxoHOKyTzl7LZ9raMB2Mq0erVPOsPlEQ8UpHzE
         VeV8ozrjc+dTvqHDjQY12CnRKSe+XtLe3TcJBajRDSB8umJLPzMdokRGYEklh5dTjCal
         CGZPZM5BTKFN6IfiRQa3AEVYmGbftBiJ3VJq47cvtMi68C6gSRisCLIDCsDhx59VEU8d
         I/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712042; x=1788316842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w469z7Q5/aaHi8aSt2+jyQ5LFi1CuQ46eioWVHjW3cs=;
        b=rmWla8kG15BBFJm7qu7vLbJwvHGzoc/BTeAEUTwV60MTvfY/WlVp2yA+BmpxC0zxcr
         zlGgaZNyByWw8MBU2DASTksDwkCPbCHnihcWHa+8lMOq2W5jOK6zc6YnFE14OGoQ9Ob/
         N4QyxBfm/mcEyxUVN5splMQ0nwvsGR8du5JorM5POmiIWsS33EDOVap+yCzs3Sc5G9Qg
         8YE1yKyJDSg3Z195o2bkRnavMNBEY+qMMu3RQAd325ogA5g2owoi0EhIIknDaAB1MJhY
         bvsKdrkulYE3s7tAUXvQ+GPsocaXCH+Yqh1rj8IpOzDhQT6hkETZpMg/GnS621/azGmN
         5DuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7DG6n06TcozYmanKYcocslpJvchPoPP54YAzqWYs/0HxgzCb1aYZhSl5Zvy5H780bmyKCxb6EeEFx@vger.kernel.org
X-Gm-Message-State: AFuF++lzalBxZ0XfOLhLtzW4hn3XjY0RYH2XxHmrkdRB0BUG/SdagtHr
	s5LQeLSm5XTyfowRzwcHVYlDZrAvhwlxZ/e+03BtuodNhdeNIpEbpHnx
X-Gm-Gg: AR+sD10c+RWmv/eAFhHxN2YZX7X7R+lNhJyE8UOF4TZg/Sd7sQXQTt6+7h1WV3/UYXV
	ZydlAVTy3H8Uv22ClAtV28aNN9+sWlIYyVxQJe2ncsq6nRHOYX00CNozrA+yqFkDiRY9nSTPX9a
	NPQjcRfFW5Vpdp713aGK5fniVJ2uVHE+nQrjFt8SZlW8fQoVyppMn7J15TRq0EESTtz2sdvPCwm
	oO05jtAj2v0AbJ3yryEQG7w+Z1mZuQQpk0cHM1g1LJe0qtqNA/M26NzHDtfIRQzPwlGP4uK4wJK
	mIQTPzk1eVjisbfafv2iD/Tdgn9jHZdIzKtYbCB+8bZ5gLBWX8dcNMdhxy1lcNdd/apYSYETn8W
	Ths3T4UjknDL4437pG2QmHSZa9PWo0eDTqbGSoZQdJ4qvmbPv13kVR5U3GzflonuxtT2i1cHNFL
	kdb7RjMir16w6xrZIaj3JxUkblcxwuDZ7RoIqqng+q8shyy2tkjsjgLKDk7vFSbg==
X-Received: by 2002:a05:690c:4004:b0:81e:eb11:6e5f with SMTP id 00721157ae682-8574172735emr13449597b3.34.1787712041685;
        Tue, 25 Aug 2026 19:40:41 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:41 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:28 +0000
Subject: [PATCH v5 2/5] dmaengine: sun6i-dma: Support variable address
 widths using masks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-2-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.16.0

The Allwinner A733 DMA controller supports higher addresses (up to
32G) compared to previous generations. The existing `sun6i_dma_set_addr`
function uses hardcoded logic for setting the high-address bits in the
LLI parameters.

Add `src_high_addr_mask` and `dst_high_addr_mask` to `struct
sun6i_dma_config` to handle different high-address bitfield mappings.
Update `sun6i_dma_set_addr` to use these masks via `field_prep()`,
allowing the driver to support variable address widths.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f305fbfb3545..1ffd870d9594 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -7,6 +7,7 @@
  * Maxime Ripard <maxime.ripard@free-electrons.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -103,8 +104,8 @@
  * The LLI link physical address is also mangled, but we avoid dealing
  * with that by allocating LLIs from the DMA32 zone.
  */
-#define SRC_HIGH_ADDR(x)		(((x) & 0x3U) << 16)
-#define DST_HIGH_ADDR(x)		(((x) & 0x3U) << 18)
+#define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
+#define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
 
 /*
  * Various hardware related defines
@@ -147,7 +148,8 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-	bool has_high_addr;
+	u32 src_high_addr_mask;
+	u32 dst_high_addr_mask;
 	bool has_mbus_clk;
 	u32 irq_stride;
 	u32 irq_en_offset;
@@ -687,9 +689,10 @@ static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
 	v_lli->src = lower_32_bits(src);
 	v_lli->dst = lower_32_bits(dst);
 
-	if (sdev->cfg->has_high_addr)
-		v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
-			       DST_HIGH_ADDR(upper_32_bits(dst));
+	if (sdev->cfg->src_high_addr_mask)
+		v_lli->para |=
+			field_prep(sdev->cfg->src_high_addr_mask, upper_32_bits(src)) |
+			field_prep(sdev->cfg->dst_high_addr_mask, upper_32_bits(dst));
 }
 
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
@@ -1283,7 +1286,8 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
-	.has_high_addr = true,
+	.src_high_addr_mask = SRC_HIGH_ADDR_MASK,
+	.dst_high_addr_mask = DST_HIGH_ADDR_MASK,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };

-- 
2.55.0

