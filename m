Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E673BE65C
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696817; cv=none; b=Uzy5f7uip9TTNlJdZYuuMjQi2+7HLvr6F+Wekc/5WFGiQ83Eh6An1jHWFFRYiec1Hzlvc+8RgnnyA65PUXhE1ZRFi3oeSpP1eRG+DTJKg03ROJCo05RYXBlsVTf+PZKaKe4lrZicanYV22JJRvzLF1i/Zgbir3/oMlt3EyrgPIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696817; c=relaxed/simple;
	bh=0X7i2KUBJWNqMEcdWRUJvZ6mZ/oWjbbd8I5nakizUHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jao3NIQypsgsv0GOY1bkxdKAb5LUcX5wV2XB1ZGVvF12dp01/qcK8CDtETN3/gOcwPMpDVviN9dOpJl0rXkVD/R712RL3tiqOta1egrX553Fiw5/cYJgYnPVjwfSa+0NJ/6dS2ZRJMBwDPgJE7bKy4IWa4mLDrg6KLeSwvg4nXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQgNy2MA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQgNy2MA"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4624a44e152so738758f8f.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781696814; x=1782301614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1xUbc08OXQwXD0H7YUvkinrceXsCq3vVphz8033T20=;
        b=MQgNy2MAE+0vCqlZg/iP3tr7HRbBAt4XWHzWfePtoV3q+HWVWAinIF2i6ICLAJiXSh
         qxGXofukYn8vKIlL4dXrN1PE5+STubqLYzzakaHLsEbl2yf5/PjB+K1GMSljMhzwvuse
         /iS+Wric5wZ2h0jjHS2rnd8WrWzzHGcWiJBLx7QhsedOt1N+5oqk1iAMqu+C4JSLUSVz
         aS2I3iX2fRHK6e5W9dqqZipE1FSwu/+QLe9S+toyxHkKDF7SjUoAm/4W/7jEW40m2vfs
         eY/MOXGllax/2tclPfoeyNIjwDFocfDCxBQV4lA4fqFWHnhK+saOIirhfOkM3xVON88F
         7foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696814; x=1782301614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T1xUbc08OXQwXD0H7YUvkinrceXsCq3vVphz8033T20=;
        b=TDQHFaqHVw3TGa6mT7cmwPFtYUCSj3B0OLI2Cj2qdeRFMRNXt/wvErtTSnmh9DZAyo
         AVFlLEmiiEe3Q4jo3odgmKuNd0z4HMREVJkEo2IjRAIzm8XB3kpN4/yCL+wZXtRt9bcU
         BBS1288BITzMkZ5RqK0UyA1b1sa6ehIFebOzNU56ZXtfQVMrZ45fUkL0MlzSBU5yhum4
         iM3avZUinEA5YVgcfKMwPQNTbVtgCboLXVaMgFjX24yej+K50EoIJHIbyHEOZhowXq86
         AFYilQGk8sHKuqjHkdD9178Ln5rcuJz9mxa1a+/reHvFKgeC7+6ckgAj81NTSh6eieoA
         eIsA==
X-Forwarded-Encrypted: i=1; AFNElJ/6e2SPMEx3rgIyEEhjpqVlfZbfHpitwTRzKcleLOiEd/D6vTHdYtoZ5UD3ImcNLZeBxwwDBMfEYxBX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp+YRiQSDPoUJIh6YEecnKcJVPJLs9yksYXANvkCwqC1GkgnOE
	+dlYznFSXILQcFS2Rpmm9Z4FJq2RjKU/+vy9PbppETvjmUyuvPhVIR3H
X-Gm-Gg: AfdE7clcB/LgHC80Pu/2vVvWaa6zIlUWtbKfGvAd3eXgXD9A2hd+S23wWAi23iy5Gdf
	oRbUm+aF71EhIQ7RVnmsHgcLhS3hvKzhtWZzSi2d2Pzwc/o3YihddhHwLdDYvrZZd5G0dc9UrUg
	Kpg95huB2AHWLPQ1xffpXHuNmCNiSgAuRXpC3UZ5+yHda+iRmYolXyl/Tm7+R3jOSl67MkAA8j6
	izvyzX5sWgcai5mbm9ySK+Tln79taHbbwL1fxFJxH2+IE8S0J+nIxflTUU0MSfVxarfQUHRHVQX
	ckMlHbFO8du9mkdKs7KjRCyJ88bQriE/AAB0vjgZDhRUTjw5j3gA00tRnXQRLRNaI06bwrrUWHd
	Mr46k0Ls5IRHkLn58R8MocgR2E7EFQ8ReaNTm7f+8akYgSYr15SdpgrsOL//ewLVfiuK3CygOyT
	rTPwI1GkTtONW2YkhykIYfg5Hmw1t4vlq3KiprYWyuO8jG32I/B+sUR/BK39Iq6qI=
X-Received: by 2002:a5d:5d81:0:b0:441:1e41:194 with SMTP id ffacd0b85a97d-46236ef6b36mr6601847f8f.17.1781696814071;
        Wed, 17 Jun 2026 04:46:54 -0700 (PDT)
Received: from fedora ([196.77.26.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462e7fc53fasm3221857f8f.33.2026.06.17.04.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:46:53 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Clouter <alex@digriz.org.uk>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v4 2/2] hw_random: timeriomem-rng: add configurable read width and data mask
Date: Wed, 17 Jun 2026 12:46:42 +0100
Message-ID: <20260617114642.1911191-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617114436.1909659-1-inasj268@gmail.com>
References: <20260617114436.1909659-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO for supporting read sizes other than 32 bits and masking has
been sitting in this driver since 2009.  Implement it.

Add reg-io-width (1, 2, or 4 bytes) and mask support.  The read loop
dispatches on width using readb/readw/readl so a configured 1-byte
access doesn't trigger a bus error on hardware that rejects 32-bit
reads to that address.  The mask is ANDed with the value before storing.

These are platform properties, not runtime policy -- width depends on
SoC integration, mask reflects which output bits carry entropy.

The alignment check in probe is updated to verify the resource is
aligned to the configured width instead of hardcoding 4-byte alignment.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/char/hw_random/timeriomem-rng.c | 77 ++++++++++++++++++++-----
 include/linux/timeriomem-rng.h          | 12 ++++
 2 files changed, 76 insertions(+), 13 deletions(-)

diff --git a/drivers/char/hw_random/timeriomem-rng.c b/drivers/char/hw_random/timeriomem-rng.c
index e61f06393209..42393409f22a 100644
--- a/drivers/char/hw_random/timeriomem-rng.c
+++ b/drivers/char/hw_random/timeriomem-rng.c
@@ -14,7 +14,9 @@
  *   has to do is provide the address and 'wait time' that new data becomes
  *   available.
  *
- * TODO: add support for reading sizes other than 32bits and masking
+ * The read width (8, 16, or 32 bits) and an optional data mask can be
+ * configured through platform data or device tree properties.  Default is
+ * 32-bit reads with no mask.
  */
 
 #include <linux/completion.h>
@@ -34,6 +36,8 @@ struct timeriomem_rng_private {
 	void __iomem		*io_base;
 	ktime_t			period;
 	unsigned int		present:1;
+	unsigned int		reg_io_width;
+	u32			mask;
 
 	struct hrtimer		timer;
 	struct completion	completion;
@@ -48,6 +52,7 @@ static int timeriomem_rng_read(struct hwrng *hwrng, void *data,
 		container_of(hwrng, struct timeriomem_rng_private, rng_ops);
 	int retval = 0;
 	int period_us = ktime_to_us(priv->period);
+	int chunk = priv->reg_io_width;
 
 	/*
 	 * There may not have been enough time for new data to be generated
@@ -71,11 +76,28 @@ static int timeriomem_rng_read(struct hwrng *hwrng, void *data,
 			usleep_range(period_us,
 					period_us + max(1, period_us / 100));
 
-		*(u32 *)data = readl(priv->io_base);
-		retval += sizeof(u32);
-		data += sizeof(u32);
-		max -= sizeof(u32);
-	} while (wait && max > sizeof(u32));
+		switch (priv->reg_io_width) {
+		case 1: {
+			u8 val = readb(priv->io_base) & priv->mask;
+			*(u8 *)data = val;
+			break;
+		}
+		case 2: {
+			u16 val = readw(priv->io_base) & priv->mask;
+			*(u16 *)data = val;
+			break;
+		}
+		case 4: {
+			u32 val = readl(priv->io_base) & priv->mask;
+			*(u32 *)data = val;
+			break;
+		}
+		}
+
+		retval += chunk;
+		data += chunk;
+		max -= chunk;
+	} while (wait && max > chunk);
 
 	/*
 	 * Block any new callers until the RNG has had time to generate new
@@ -125,11 +147,8 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->io_base))
 		return PTR_ERR(priv->io_base);
 
-	if (res->start % 4 != 0 || resource_size(res) < 4) {
-		dev_err(&pdev->dev,
-			"address must be at least four bytes wide and 32-bit aligned\n");
-		return -EINVAL;
-	}
+	priv->reg_io_width = 4;
+	priv->mask = 0xFFFFFFFF;
 
 	if (pdev->dev.of_node) {
 		int i;
@@ -145,9 +164,41 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 		if (!of_property_read_u32(pdev->dev.of_node,
 						"quality", &i))
 			priv->rng_ops.quality = i;
+
+		of_property_read_u32(pdev->dev.of_node,
+				     "reg-io-width", &priv->reg_io_width);
+		of_property_read_u32(pdev->dev.of_node,
+				     "mask", &priv->mask);
 	} else {
 		period = pdata->period;
 		priv->rng_ops.quality = pdata->quality;
+
+		if (pdata->reg_io_width_set)
+			priv->reg_io_width = pdata->reg_io_width;
+		if (pdata->mask_set)
+			priv->mask = pdata->mask;
+	}
+
+	if (priv->reg_io_width == 0)
+		priv->reg_io_width = 4;
+
+	switch (priv->reg_io_width) {
+	case 1:
+	case 2:
+	case 4:
+		break;
+	default:
+		dev_err(&pdev->dev, "invalid reg-io-width %u, must be 1, 2, or 4\n",
+			priv->reg_io_width);
+		return -EINVAL;
+	}
+
+	if (!IS_ALIGNED(res->start, priv->reg_io_width) ||
+	    resource_size(res) < priv->reg_io_width) {
+		dev_err(&pdev->dev,
+			"address must be %u-byte aligned\n",
+			priv->reg_io_width);
+		return -EINVAL;
 	}
 
 	priv->period = us_to_ktime(period);
@@ -167,8 +218,8 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	dev_info(&pdev->dev, "32bits from 0x%p @ %dus\n",
-			priv->io_base, period);
+	dev_info(&pdev->dev, "%u-byte from %p @ %dus\n",
+		 priv->reg_io_width, priv->io_base, period);
 
 	return 0;
 }
diff --git a/include/linux/timeriomem-rng.h b/include/linux/timeriomem-rng.h
index 672df7fbf6c1..5732489a17a1 100644
--- a/include/linux/timeriomem-rng.h
+++ b/include/linux/timeriomem-rng.h
@@ -16,6 +16,18 @@ struct timeriomem_rng_data {
 
 	/* bits of entropy per 1024 bits read */
 	unsigned int		quality;
+
+	/* read width (1, 2, or 4 bytes), 0 means 4 */
+	unsigned int		reg_io_width;
+
+	/* set to true if reg-io-width is explicitly provided */
+	bool			reg_io_width_set;
+
+	/* mask applied to raw read value */
+	u32			mask;
+
+	/* set to true if mask is explicitly provided */
+	bool			mask_set;
 };
 
 #endif /* _LINUX_TIMERIOMEM_RNG_H */
-- 
2.54.0

