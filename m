Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE93EC2EF
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696692; cv=none; b=i66Ix5UMt1ph8cwVQjTfdE31Smh8O70dvKhLQvfcsTWfVWum3b8tdXq0m4KlCJ8D35q42c0vHI5uRPoGSEnpYT/F5pAc87dO8P4jLJ6tKXJjeEFrwQNhvbqCtItDASKSzQ1tpvpRXMVn/B6/+x0BCAuu1STvUzO885rOBMuieD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696692; c=relaxed/simple;
	bh=6PRiza3LXnOI5sh399qO0oBWFGp2+hOMtX90PkVi46A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQ80tIVPILO6APYwxlBxMCp3Fh54WX9BLPgHLAFAaJ/ERuw3T18MduUMmMkS7hp6Ux64QNkwWB74Y8v2+sEoDzsB90TCipoO6lUY5o46zpjMmqeu2ydPWxMlPouzRPe029XZ84CuEwg6BCJ3/3yWaEIDkberzetSW8nCngoADP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuOuDUPA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuOuDUPA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-460662fcb4eso3876719f8f.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781696688; x=1782301488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HPDJtP52p5BOP+sKi7OFUfIBErlWFolQCAuHzVeCjRo=;
        b=OuOuDUPAR4dq8V67wlZu7BAr9/kD1BFa8qxQw1eYgvS3cMky6B2m+oj4ev2J45pFHl
         ohkYTCy65X0vyrT2yaIHC6Eqb1/cfcHm+4j0NhWjvaWQ3/aqiVkIlrVEfj6SHofeDoX6
         mgCfsTyvXB4lpPOspsx8ihJ0RG8gdf/TWqlVkPuzGgsUd47OioRCLnLflVKAlZ/beRFp
         2CwwOJkg8hgXgbsGyaSvoxACJ+9tkftqjENEcK7gOyoBFaehk3/fFC514Bqp2UpYv7Pe
         06YqDMd7t3Hz/ik+8AOxX5ORR3PVIwJXvBknn99T+Y23HCnYqByfj/G0nOE/pqoLB+xr
         rzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696688; x=1782301488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPDJtP52p5BOP+sKi7OFUfIBErlWFolQCAuHzVeCjRo=;
        b=Ia093Y3DcY9YORSakAl89UdaMupMIYYmfECzBd/BDRcSZzDSX0yZztJN25h5ljhC7w
         kEWhSvUfmHaTwF1ru5p3kurD7qJzNDCNlh29IzHonwQF8c8BTa+GmlHZDAGDqUicPS53
         vtFjfQlyAkKCXTjuY81eYtwY/Rb2lJ7q/csHxwYnbTwYiHtvmq55FXepqNYCORpeU3nG
         Mv8E+KFPanhqPnwrdq1RTvsgHnV23Ejy6UXmqSh3F2asemxFgqkSWUi7jAjGGxPUL2Zr
         3ZZMUMXS1M2/NUiULXADRZaYnKnFC14ypoR3U+QFEZMkWkJfbrLjCyMYs6WxTldG7+9I
         lQSA==
X-Forwarded-Encrypted: i=1; AFNElJ+NSQV7UnBo/LMiDVK3cnkJtz87wn6i14I934+2D8iJfWz7xdUlqRQID4ZFiq6YTM1gDHhyxgPpwk/l@vger.kernel.org
X-Gm-Message-State: AOJu0YyYPXo+W+zWR8USUqrp1w/5xglwdU1FlzY2JywCzQ8eUYGE4PJL
	ZcdIHhyAtIOfVlF+FqTLvm+i4iWRShMWQ8BL4zD4J0RhtD3DgURRFa/w
X-Gm-Gg: AfdE7ckTvbBxG6h4WETR8tYjnG0zL6bnEhAbPqaWRr4XYQTWpSY28zyP0fl8kbnrL8/
	5ZTRR+voZb61e5ZxAI8bSjBRzbDxfOvTHw7Ggnvd2fNNidEV6OX4njZ296yVxye6V92sPQRQ8Em
	EYALKrWFzp1dNjaoEmKuTZqqoY+Mytpy8sU5eRebeHU6iZ0UVRcoXhG33abj3XhVWYtoB+lk7bf
	ulIufM9dOavdEodVdv83eGwJ+j7CuXGJwk2pQyE4vKT/m6mrHCu2c+/H9IlnxuBkBH9a8UfYmLK
	gUz8mzlmnwo3ycMVddXU9chnQqEZidZ101aupoAht+TVw+z7YU+w2vE4XWg74HAWCRv5z2GtEX7
	6tvYH2ed2jkbusPMigkRZ4k2dUE68ZqRYUAy0pZ5rqyL3sl4OwypWkU23oIPE8Fp5dkc48kEYC1
	MP0cKWTOlyPHA6hV1PzknNneGZHuvoOmnFnEG3bdaCZLhEg8RT2iZagGui1r/MEvk=
X-Received: by 2002:a5d:6109:0:b0:460:e00:121c with SMTP id ffacd0b85a97d-46237b7179emr4214957f8f.28.1781696687715;
        Wed, 17 Jun 2026 04:44:47 -0700 (PDT)
Received: from fedora ([196.77.26.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c4240sm48998658f8f.27.2026.06.17.04.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:44:47 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: rng: timeriomem_rng: add reg-io-width and mask properties
Date: Wed, 17 Jun 2026 12:44:35 +0100
Message-ID: <20260617114436.1909659-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add optional reg-io-width (1, 2, or 4 bytes) and mask properties to the
binding.  reg-io-width selects the bus access size,  mask is ANDed with
the raw register value to allow only the entropy-bearing bits through.

Update the example to show a typical 1-byte configuration.
Update SPDX to dual license to match kernel convention.
Drop the misleading '32-bit aligned' constraint from the reg
description since alignment now depends on the configured width.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 .../bindings/rng/timeriomem_rng.yaml          | 48 +++++++++++++++----
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml b/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
index 4754174e9849..740bc52bf474 100644
--- a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
+++ b/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
@@ -1,10 +1,16 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/rng/timeriomem_rng.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TimerIO Random Number Generator
+title: Timer IOMEM Hardware Random Number Generator
+
+description: |
+  This binding covers platforms that have a single IO memory address which
+  provides periodic random data.  The driver reads from the address at a
+  fixed interval, returning a configurable-width value masked to the desired
+  bits.
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
@@ -13,9 +19,17 @@ properties:
   compatible:
     const: timeriomem_rng
 
+  reg:
+    maxItems: 1
+    description:
+      Base address to sample from.  Must be aligned to the configured access
+      width (1, 2, or 4 bytes) and at least that wide.
+
   period:
     $ref: /schemas/types.yaml#/definitions/uint32
-    description: wait time in microseconds to use between samples
+    description:
+      Interval in microseconds between reads.  New random data is expected to
+      be available at this rate.
 
   quality:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -26,16 +40,26 @@ properties:
       instead.  Note that the default quality is usually zero which disables
       using this rng to automatically fill the kernel's entropy pool.
 
-  reg:
-    maxItems: 1
+  reg-io-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 4
+    enum: [1, 2, 4]
     description:
-      Base address to sample from. Currently 'reg' must be at least four bytes
-      wide and 32-bit aligned.
+      Access width in bytes.  Determines whether the read is performed as
+      an 8-bit, 16-bit, or 32-bit bus access.
+
+  mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0xFFFFFFFF
+    description:
+      Mask applied to the value read from the register.  Bits set to 0 in
+      the mask are cleared in the output data.  Default (no mask) passes
+      all bits through.
 
 required:
   - compatible
-  - period
   - reg
+  - period
 
 additionalProperties: false
 
@@ -46,3 +70,11 @@ examples:
         reg = <0x44 0x04>;
         period = <1000000>;
     };
+
+    rng@64 {
+        compatible = "timeriomem_rng";
+        reg = <0x64 0x01>;
+        period = <50000>;
+        reg-io-width = <1>;
+        mask = <0xFF>;
+    };
-- 
2.54.0

