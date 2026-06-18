Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6903B3D88EF
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784128; cv=none; b=bskn/EofDrVEjXpYR94o436nMdq7JICjEfbFds7rFWw92Tonfb2JiwhD5Yn2t8ehLLbZ29etZyXepa8BxZsbBMf7OMqzf0WcS41T7lsD33PN2ir+eEbvJP5kSWJ5X6QHYPO7rP+fCrNDqWCsTJHpL1X6Mydbn/pTXAj036Lwtjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784128; c=relaxed/simple;
	bh=nAR+OA7gXWkWT/3sD4b2ObWq4aSUoI/M8xGgOMeTofc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qa1RQWO1a5Vh1wrYmE63zmviSFwwCNkhmoF8hSftyyBNyukEm1c73kxueIpZkI8TTjswWrrns/FTgBdGwJBAs0jm2fMahv6nFMA7xVF/lGgMt5Kc7MxFBiu+J8bymVhya/8se2Ff8aifxI1XW9to4OlpX7i73ZOlyUWSUNXkgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFhgZASY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFhgZASY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so6235835e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781784125; x=1782388925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cL7ZAyXICXyIClcaBG39KHbuvW628IbBZhELwCm9xo=;
        b=MFhgZASYp8o7yByRAo5ikTAW200tm64aiISuGuG1omSWRaV1aFMsFLdkOdHhtjNbBB
         OTLX+lUw6qeIGD0E5aHJKPT7jM9D2/Zb+sSUt+Xg2IJfGfuno9Y5gNK7tr7mLdOpS30q
         fg6kecajn1RPC9XidNqOyc5dKkrTJFwCHU/OHLz0GTMhuHaNfICZkdCQfZgvGmKkoTjP
         xLuR8gzJtuzMwNscn9YvN9+oE6Gft2DgV49LEdzjc95aTWgsVtWicvuEXvHMyBXJ6n5e
         KmIsapxtZDuSdrcpPieGU3lD1MCmCUKp0JjJCQ7uF36HOg3vyr6dOAb/0wd3TJmaWhw1
         t42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784125; x=1782388925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8cL7ZAyXICXyIClcaBG39KHbuvW628IbBZhELwCm9xo=;
        b=gSACa+OI2pi0tHaIrAjB3JUbVB6mrNlg/GkkZa178P/rarLWFexMAFOesYmO3H0Ai5
         AAhOxxP+Yu/4tDw4DcEOROZJ7RHDz7gBxn11UKfIpq2bIoWN8usC44i5/xZn/KJBGsly
         wCvz6RFBgcirSiBrCx0+p7Gm9UHKB1kg3iyy1F1l4wwE5ALEy5V0iztJzo5XyK0NPe30
         8XEVtA+vpI/dim/P+N7tjxFvFbVBUs/uyQ5c1n2o4ZBkih2PPW/ywqmvcIySiOU25Q4x
         0EK9YhRDeeios5++BoByXO9kBkWpyzESnGL2SS6DUC9UUdikYG5MGwtP/WO9vQP+M1kN
         LaPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0baOWeH8U0hkpzvzMGBO0FV/iD9LvoYRJOIH20V90zux81PT40tt9JidTgq7dZ4suUqOu01C/aoAz@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwz0BtgJBbwUXywGYpW2FGipfS9kAaqmtbmYaXfTV1uxL4e6/
	xfNyV5NplFiMQzBQLHdDOAHJey13lCmxdt6syGKS09CcvCaXQo4yPaXr
X-Gm-Gg: AfdE7ckjDKlfUVgtlJ1XWEOZ4OQuWVoJ4Dvf1rD4z/lqaymFjkX2VO3Lpwo2Ub6h6te
	U1csyZ56dENps/n6BfheIS2shVfJC8OVn2SiO58Bqg60Cr9f/IzvHFd5FJCLYCTIF9m7qUcjxqc
	rN1GywjEldynx7ZMRiMisCbXTKAkPDAKGEW5H1RuXOy0As0HB+MgW2qhz1vecHMAzVvzal9XLKB
	0S3AgnAYdSOlP8HJR2c/DEsyLqh3gE9YDfzrzd7GjcN3blnf6lTl5cZaDe5Sh2MAu5HN58z+n4P
	ZKCBOIxzaTyw4w0I5gXN2gy7XidnwMH8TqZM7qpdsGFdQ06O6H2bQCnOTUsm8mqtTP41PC50tMU
	1NhUf0Cs4yHfE4F+YXnHelkMC3VmevePlH1VgonSsEP6qy+LSN7bGNRzswodR3JIR4v0oRqVdik
	gBgGPIU3vAHomOBzHRCFF10oSltx2PKfcRHO9fG9pghLSaACrHo6JAhrAVXhBon+nZGtXMnbYQi
	XR1lg==
X-Received: by 2002:a05:600c:590c:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-49234139cdamr85546085e9.29.1781784123883;
        Thu, 18 Jun 2026 05:02:03 -0700 (PDT)
Received: from fedora ([196.121.162.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a8ec56sm218506175e9.9.2026.06.18.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:02:03 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Alexander Clouter <alex@digriz.org.uk>,
	devicetree@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v5 2/2] hw_random: timeriomem-rng: add configurable read width and data mask
Date: Thu, 18 Jun 2026 13:01:10 +0100
Message-ID: <20260618120110.36439-2-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618120110.36439-1-inasj268@gmail.com>
References: <20260618120110.36439-1-inasj268@gmail.com>
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
access does not trigger a bus error on hardware that rejects 32-bit
reads to that address.  The mask is ANDed with the value before storing.

These are platform properties, not runtime policy -- width depends on
SoC integration, mask reflects which output bits carry entropy.

The alignment check in probe is updated to verify the resource is
aligned to the configured width instead of hardcoding 4-byte alignment.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
v5: No changes since v4
v4: Initial version with reg-io-width (bytes) and readb/readw/readl
v3: Added configurable width (bits) with mask
v2: Rebased
v1: Initial submission
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

