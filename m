Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DB229BDBB
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 20:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554444; cv=none; b=EhDsizYvLpXwvKdS9sP6JVlTbo81IMvcV2Y8Y1aZP6B2vGQ900R5bm9C1ecccY+hJn+ejdSwro+lSd+QK2Wh+stsuBq/nOlL4PB/EZRzMG9zD+NdomqG+NwfAOgn+RlxboVSCLFcGi02XHfpJAiGx2oDZo1l50owCuQrDHH/eXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554444; c=relaxed/simple;
	bh=hoPDHDQibcZ5QPB7E2k0D1PiIPR0iiLqAk5Vj8yPXI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DOwDL23p1GmazmXSpvVpCzIw2hDiNe7mcs69wgKwohoEWT+cWGd2UGqp4i5g10NHPaeQp/sHozRip6g3Pw8YrqrNaeS7f5p0OxqtA+C5kUEb2TTQ6CZ1gVfb3+wAi9bXkcppopnDISMkrEJtB8wMLv7egZoc0veOncV9et+uU9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYZ5DNC/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYZ5DNC/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490c1915793so33082115e9.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781554441; x=1782159241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ys+Ch9+o5MY7cR3EE8RYAIskU9R4aJW7Q2TKA/9SKXw=;
        b=XYZ5DNC/EPqlQK6b+ai+WjhkCe6KdYuttFo4mS8uS/H6cIOd31Rd+rv0FyZ1nbKjPn
         HfqyDDXDhx8NbUNvAoU6ZVafWnOtpjayjt/gnYPaI8Iv6vg3y2DanHUI16a6FP1yXDlZ
         O2SFgtJ8h9htC4y+V2bh3IlcwMe7jnSJLeS4KQnuh4UCyZGkxkshwoVD+8W16mPNyRWf
         pLvzU+XZPgXSstQ4Q5AXcm4Mo85LqPZl9prwgftqNSnggnrRF47c26E5hWMxzREby+tS
         633b+c/4xSwLBQneOqj2oSbxUTrLLzJRGbsJyXxNv55gQYP5aTZgEsCJII4a4JZ8W90C
         w+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781554441; x=1782159241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ys+Ch9+o5MY7cR3EE8RYAIskU9R4aJW7Q2TKA/9SKXw=;
        b=haGZxU+gM0jJVgx4awEPzj/AFKS/N7G6pAObp7FZFGtGkxuhzZtvZtxGkG6wgdNMuu
         LnS1XMIlTKaFAmIwFbbHDVtsqwvGs7W4ExhCmRSHeHlOmk/0V+ximWXWRxPTPABvu+q3
         TnI7LUPG/wZuWLU4XcojymIcNGHL1ro53K56fK3z/DoFwbVsaMYjBZEcf/peeYmkMaXS
         NxzNMbGt/jLjh+9ClJfK51UvT84bag334U2hdZ4BXmXhXEOe9xVxVSqQjohftkyieGHw
         +bpCtsmgCgurcJvzuzuzOmGCFqCFQwTwtaNN26B2BkJXo1bXQka89NXR2L5sWvdvAHqA
         JeEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uBog+oerYqGAJ9/pHVlu6fa0d1d1QIL4VR7SQGF2/1NaBNHNTPpDanFGiBSWoQ80IUauzDT3GQt8W@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXHczmM6Q2oD/j0ssovN/cYRGYznhQ6WdCEVfjx4X46K00iyU
	rlttpXvGheD0ksbbfmi/TBHfgOFISlKLJliGPnB+OXrgYVI1BKx/seSx
X-Gm-Gg: Acq92OETtfIhtehK75iqvsD39/W+hC1abdsoi5eHHqpuBagAAfs5tVrjcIA+14aM3Vo
	kQ1uJWhzmDCwzgKHRXcig8d9/GjZKk/nZNPiMamm/VJHxdw57YAAX9amNiWKSUEa79dfixHaVO+
	4vy+WLyZrN6c7VZqqtW81y5vTRrDPuzwJ3fjemBkYjRF7HBEzG2W3zPKx6Xa1MuomgL8LIQrW1p
	MJFsuCLJiPfx8mO/oD7FGASr147ezGi74bPlO9pbBudv0UQMFkmLkZXPu3rlrzehul51uEIWmTc
	glqq28SMtE/qZ0hpBRqqYRf5QDCCeUGKi9kybMKfupy0JhTRT2dUJU9l4EBZAo7Ouf1jxn2LE5X
	Zyr/W2n/W5IBVPO0a13mrucOjcGPmX5m7PRFcOaKh+AN/wPqzQud+ByuaCtH0b2BAvkAKsz193y
	9BAFt11IKg+twrwlFPLPsp57Jwg6sfluARZw9tKApjSJob05K9RqqdIKDTzIylkM3C2q+2qc8wG
	YAK
X-Received: by 2002:a05:600c:3144:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490ec4d523dmr214202975e9.11.1781554440584;
        Mon, 15 Jun 2026 13:14:00 -0700 (PDT)
Received: from fedora ([105.157.86.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa510e7sm22303535e9.7.2026.06.15.13.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:14:00 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Clouter <alex@digriz.org.uk>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v2] hw_random: timeriomem-rng: add configurable read width and data mask
Date: Mon, 15 Jun 2026 21:13:39 +0100
Message-ID: <20260615201339.1264676-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO for supporting read sizes other than 32 bits and masking has
been sitting in this driver since 2009.  Implement it.

Add width (8, 16, or 32 bits) and mask properties to the platform data
and device tree bindings.  The read loop dispatches on width using
readb/readw/readl so a configured 8-bit access doesn't trigger a bus
error on hardware that rejects 32-bit reads to that address.  The mask
is ANDed with the value before storing.

These are platform properties, not runtime policy -- width depends on
SoC integration, mask reflects which output bits carry entropy.

The alignment check in probe is updated to verify the resource is
aligned to the configured width instead of hardcoding 4-byte alignment.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---

v2:
- Remove old timeriomem_rng.yaml to avoid dt_binding_check conflict
- Use IS_ALIGNED() instead of modulo for 32-bit PAE safety


 .../bindings/rng/timeriomem-rng.yaml          | 76 ++++++++++++++++++
 .../bindings/rng/timeriomem_rng.yaml          | 48 ------------
 drivers/char/hw_random/timeriomem-rng.c       | 78 +++++++++++++++----
 include/linux/timeriomem-rng.h                | 12 +++
 4 files changed, 153 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rng/timeriomem-rng.yaml
 delete mode 100644 Documentation/devicetree/bindings/rng/timeriomem_rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/timeriomem-rng.yaml b/Documentation/devicetree/bindings/rng/timeriomem-rng.yaml
new file mode 100644
index 000000000000..0d8460e9f916
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/timeriomem-rng.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rng/timeriomem-rng.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timer IOMEM Hardware Random Number Generator
+
+description: |
+  This binding covers platforms that have a single IO memory address which
+  provides periodic random data.  The driver reads from the address at a
+  fixed interval, returning a configurable-width value masked to the desired
+  bits.
+
+maintainers:
+  - Alexander Clouter <alex@digriz.org.uk>
+
+properties:
+  compatible:
+    enum:
+      - timeriomem_rng
+
+  reg:
+    maxItems: 1
+
+  period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Interval in microseconds between reads.  New random data is expected to
+      be available at this rate.
+
+  quality:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description:
+      Estimated entropy per 1024 bits of data, in the same scale as the
+      kernel's hwrng core (0-1024).
+
+  width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 32
+    enum: [8, 16, 32]
+    description:
+      Access width in bits.  Determines whether the read is performed as
+      an 8-bit, 16-bit, or 32-bit bus access.
+
+  mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0xFFFFFFFF
+    description:
+      Mask applied to the value read from the register.  Bits set to 0 in
+      the mask are cleared in the output data.  Default (no mask) passes
+      all bits through.
+
+required:
+  - compatible
+  - reg
+  - period
+
+additionalProperties: false
+
+examples:
+  - |
+    rng@f0001000 {
+        compatible = "timeriomem_rng";
+        reg = <0xf0001000 0x4>;
+        period = <100000>;
+    };
+
+    rng@f0002000 {
+        compatible = "timeriomem_rng";
+        reg = <0xf0002000 0x1>;
+        period = <50000>;
+        width = <8>;
+        mask = <0xFF>;
+    };
diff --git a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml b/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
deleted file mode 100644
index 4754174e9849..000000000000
--- a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
+++ /dev/null
@@ -1,48 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/rng/timeriomem_rng.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: TimerIO Random Number Generator
-
-maintainers:
-  - Krzysztof Kozlowski <krzk@kernel.org>
-
-properties:
-  compatible:
-    const: timeriomem_rng
-
-  period:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description: wait time in microseconds to use between samples
-
-  quality:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    default: 0
-    description:
-      Estimated number of bits of true entropy per 1024 bits read from the rng.
-      Defaults to zero which causes the kernel's default quality to be used
-      instead.  Note that the default quality is usually zero which disables
-      using this rng to automatically fill the kernel's entropy pool.
-
-  reg:
-    maxItems: 1
-    description:
-      Base address to sample from. Currently 'reg' must be at least four bytes
-      wide and 32-bit aligned.
-
-required:
-  - compatible
-  - period
-  - reg
-
-additionalProperties: false
-
-examples:
-  - |
-    rng@44 {
-        compatible = "timeriomem_rng";
-        reg = <0x44 0x04>;
-        period = <1000000>;
-    };
diff --git a/drivers/char/hw_random/timeriomem-rng.c b/drivers/char/hw_random/timeriomem-rng.c
index e61f06393209..4557326618c9 100644
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
+	unsigned int		width;
+	u32			mask;
 
 	struct hrtimer		timer;
 	struct completion	completion;
@@ -48,6 +52,7 @@ static int timeriomem_rng_read(struct hwrng *hwrng, void *data,
 		container_of(hwrng, struct timeriomem_rng_private, rng_ops);
 	int retval = 0;
 	int period_us = ktime_to_us(priv->period);
+	int chunk = priv->width / 8;
 
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
+		switch (priv->width) {
+		case 8: {
+			u8 val = readb(priv->io_base) & priv->mask;
+			*(u8 *)data = val;
+			break;
+		}
+		case 16: {
+			u16 val = readw(priv->io_base) & priv->mask;
+			*(u16 *)data = val;
+			break;
+		}
+		case 32: {
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
+	priv->width = 32;
+	priv->mask = 0xFFFFFFFF;
 
 	if (pdev->dev.of_node) {
 		int i;
@@ -145,9 +164,42 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 		if (!of_property_read_u32(pdev->dev.of_node,
 						"quality", &i))
 			priv->rng_ops.quality = i;
+
+		of_property_read_u32(pdev->dev.of_node,
+				     "width", &priv->width);
+		of_property_read_u32(pdev->dev.of_node,
+				     "mask", &priv->mask);
 	} else {
 		period = pdata->period;
 		priv->rng_ops.quality = pdata->quality;
+
+		if (pdata->width_set)
+			priv->width = pdata->width;
+		if (pdata->mask_set)
+			priv->mask = pdata->mask;
+	}
+
+	if (priv->width == 0)
+		priv->width = 32;
+
+	switch (priv->width) {
+	case 8:
+	case 16:
+	case 32:
+		break;
+	default:
+		dev_err(&pdev->dev, "invalid width %u, must be 8, 16, or 32\n",
+			priv->width);
+		return -EINVAL;
+	}
+
+	if (!IS_ALIGNED(res->start, priv->width / 8) ||
+	    resource_size(res) < priv->width / 8) {
+		dev_err(&pdev->dev,
+			"address must be at least %u-bit aligned (%u byte%s)\n",
+			priv->width, priv->width / 8,
+			priv->width / 8 > 1 ? "s" : "");
+		return -EINVAL;
 	}
 
 	priv->period = us_to_ktime(period);
@@ -167,8 +219,8 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	dev_info(&pdev->dev, "32bits from 0x%p @ %dus\n",
-			priv->io_base, period);
+	dev_info(&pdev->dev, "%ubit from %p @ %dus\n",
+		 priv->width, priv->io_base, period);
 
 	return 0;
 }
diff --git a/include/linux/timeriomem-rng.h b/include/linux/timeriomem-rng.h
index 672df7fbf6c1..b4202ad2f507 100644
--- a/include/linux/timeriomem-rng.h
+++ b/include/linux/timeriomem-rng.h
@@ -16,6 +16,18 @@ struct timeriomem_rng_data {
 
 	/* bits of entropy per 1024 bits read */
 	unsigned int		quality;
+
+	/* read width (8, 16, or 32), 0 means 32 */
+	unsigned int		width;
+
+	/* set to true if width is explicitly provided */
+	bool			width_set;
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

