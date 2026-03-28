Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325202D7DC4
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774692856; cv=none; b=rxqvSpdn55ahJ4+68yFN+h+y3lIl5Pn/52EDvq0pafLKPmwEp8E1ECODtL8h8fg5BLD9m9+Z9X9YORBXL4up+xj+mipg0iQVbtSf+PFxpKwHTdiR74XuprRFOPBH37uAOT9YlwKxpS+i8d71rdaIqMTwgLkx7e2jPXo14FOEIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774692856; c=relaxed/simple;
	bh=BvfaRigzA0qTER69cauSqCVbwJJGnty09feTYvHRdgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YByi6AtwCZcSR52MnYuQCrlh4qvsoaptKSazUUOOVchJjBrRj8FWuW3IhFiVnpjKCYcHBE/BO0DU8j2YogMm6EzBEwPy+2FeKxvO+5R44rVZz7eswpBnbY54e6Z7X9dh7Oj/KAmwFSOkWr4hrnWna4MVLWJczPvuQQyMIx7UeSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4FQuUQx; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4FQuUQx"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d932cc948so373536a91.2
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 03:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774692854; x=1775297654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TNxfZYvEXs0lEvJbRfOjzznTi6ItDZ6rSbX7ZykPXo=;
        b=r4FQuUQxzU75f6ro8SYw4BCRIHF34SRnMDcVaaiv48wNjNj8qzor86WGXOGwJu2HDS
         Tw8dglIvx1f/uAnnU/wfGJ1ISSN+S8wj1ZDFHs7FYOc180iUD6uDKUia95avLkXRYOmt
         cl7PjtbFp9rBBIo+ZzHe/Myrtb1wWyA/ppxvzEVl/wjtps3Du3MexhIWht/gHp4YMYGF
         5XuR1ZmTT1NP4ERO9dN4MQYL1pqzOTvqCtzqb6Ut+Uc31sIIIjg6Rn6B/wOA+FrVEGwv
         hj9A4eU6LxCBAREHe6+S0NXURdq8Jo7Nik/o3/y3fR3rKIeb073KoWw6uxw6u69KThCS
         ZpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774692854; x=1775297654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TNxfZYvEXs0lEvJbRfOjzznTi6ItDZ6rSbX7ZykPXo=;
        b=hkvhWTZ5fbVwN6mlT7cbil4vudWJYFYFFkp9UUTZvfnau1PEazpQW6UqHNpRviYtVo
         nXksgVsI95EYRUxVAy0HPVItY6rYi95/pm2MZEEVf9A5VYxQ+rVgc1pf7bFMUoU5tXFZ
         44pN3mAO3C1EORkRuFL9KMAWfPnC8RM99nY9FFa18Amcasolq9i2l4raY05OP6rWBYbc
         jt5OVmZbSdRT99PHi3tH3hyNoXyodfvQEQNY9wRqg8AGa8jm6CzggDP41/elaHiV9lOq
         I5jqYR3j8Su0yPC6WggFPAd8w9Y2l2yFKolR/yONNQy5sP2krqCNwOcToXXid9ibikgo
         0ZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzbyZ6hNZpVillplrMD0jE4Y/73/rJbXr/zuFkvxsavzgNZR4ij3yLjKyCu4viBTOW7AVuLGg9LkG8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtshm72mNvuE05su4XVt9C5aPP1QRCXYQDWuhbiIoTWhDNoawG
	vIm1AM7zcdh10KW7uV3h0pZRg1YPXWBvQQyuWILWL79Ao4LAl0BtcInT
X-Gm-Gg: ATEYQzyjip4poZbDmB93o8Kg2g379G7wkKKAp+xPgN7YhSoClhFh6Ccv2SRm6Ojmywo
	2dhtPyT0f4rcTbz9WEK/qx3j+ZeBsp+ffcwO8PUPirtl9aX94FWuGKp9odtSin3OLPzPsXr40fg
	sZ7NgqhBfUrKrV29aXZ5cED4iBvINty8II6eb2kdhhniwbBna6vub8D9xjbSSfPZyaS/ySQXlGy
	56lfo3Hm+1wb1ERi9Wi4QHj3DYmH7nBZl1C7/6e7h1FUd2KSKOL9JBJkeU+ZP2suAtP/aj+nv+n
	1ktk4SOXrUKqvzeU9mlLspLsB+Z+jlAjf8SFpFHBP0XQkOWnhL5WdsP9elG4+bk+s/VRk8UZrQD
	zj1Uwt3i7o0NJoSs9GjatEVyOl8rYWJoaxqUkJ0jfuCCCwhmr8Smy9cSkLdzUcZu7pJdU/pfIkr
	KeHqiPRIBFo587ZLpU9As=
X-Received: by 2002:a17:90b:35cc:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-35c2ffa8af9mr5711735a91.5.1774692854323;
        Sat, 28 Mar 2026 03:14:14 -0700 (PDT)
Received: from fedora ([122.173.26.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950b7ebesm1594714a91.15.2026.03.28.03.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 03:14:14 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	andi.shyti@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: [PATCH v2] dt-bindings: i2c: intel,ixp4xx-i2c: Convert to DT schema
Date: Sat, 28 Mar 2026 15:41:57 +0530
Message-ID: <20260328101157.84191-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the IOP3xx and IXP4xx XScale bindings to DT schema. This
conversion also adds the <irq.h> header file to the example section, since
IRQ_TYPE_LEVEL_LOW macro is used. This ensures the examples validate
correctly.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---

v2:

- Fix checkpatch.pl warnings
- Reorder compatibles in alphabetical order

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
---
 .../devicetree/bindings/i2c/i2c-iop3xx.txt    | 20 ---------
 .../bindings/i2c/intel,ixp4xx-i2c.yaml        | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-iop3xx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/intel,ixp4xx-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-iop3xx.txt b/Documentation/devicetree/bindings/i2c/i2c-iop3xx.txt
deleted file mode 100644
index dcc8390e0d24..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-iop3xx.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-i2c Controller on XScale platforms such as IOP3xx and IXP4xx
-
-Required properties:
-- compatible : Must be one of
-  "intel,iop3xx-i2c"
-  "intel,ixp4xx-i2c";
-- reg
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Optional properties:
-- Child nodes conforming to i2c bus binding
-
-Example:
-
-i2c@c8011000 {
-	compatible = "intel,ixp4xx-i2c";
-	reg = <0xc8011000 0x18>;
-	interrupts = <33 IRQ_TYPE_LEVEL_LOW>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/intel,ixp4xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/intel,ixp4xx-i2c.yaml
new file mode 100644
index 000000000000..15ef510f6fd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/intel,ixp4xx-i2c.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/intel,ixp4xx-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2c Controller on XScale platforms such as IOP3xx and IXP4xx
+
+maintainers:
+  - Andi Shyti <andi.shyti@kernel.org>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - intel,iop3xx-i2c
+      - intel,ixp4xx-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c@c8011000 {
+        compatible = "intel,ixp4xx-i2c";
+        reg = <0xc8011000 0x18>;
+        interrupts = <33 IRQ_TYPE_LEVEL_LOW>;
+    };
-- 
2.53.0

