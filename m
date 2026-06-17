Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9FB3C09E7
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695619; cv=none; b=ihgYIxozJABzN6OUGKnc2dAXG/CzKaNrddEYK3a3Ud79RzowGSSRYpWxQCv/+qKjPmmI89G/YTogpo2eppigjL1S6S6F5xc+LtAy3R7nQ9DAzZxA0JP7SH9cyuU35L1fOQC8Rn3BTc9HkOgjPtw3Dz8OFyaZk+Pu6KpFopghIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695619; c=relaxed/simple;
	bh=P4XSAZSSLDI4/lBmgVAcoWO17E1NYhn5/B0VYcpM5x0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kB13MoN75KrZQ7F8twNI/RHOuI7vTCYS2hUXN8JNAkq9IPG7keo1hwiYitB5ApnqRVRt/kyXkZk+WFJfeJSMizvR/08K6BL97KfUS6vxJjK2fnZOaYhNqIvD4KDGRFAXbrurYPHGTbeqCjNu6JtPaGYu1UhSbbFrq8asIAlIdg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2a8K3Kt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2a8K3Kt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so59711205e9.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781695617; x=1782300417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XzRtYwZdepQpW7+D4SUSJ9DefBGTPjjaWTyX93dJg30=;
        b=g2a8K3Ktc70xFKHV8ViDZiYEHfXXgvu7nPzLcend6e98Isp0C6LX/af9E88bsyyIkp
         Hty7Fofxz+1oAIJLXRemb5b8bWQ0Zt2m9D0IApkxLJYBWJmoXPInl3a4zPN+4zSsMTi7
         YbW3yYA+JpPDLS1Sqx6xBzfRFpJDod0EFJMWv52YaO9s0PSf6F04SaXmLXpg1lGmsomh
         bV4TMjtoNtWCaGU22n0gKLpuUhYwaupNlkLkc0Cnz+k0Lpg0xnMZ+FKRyk4MrtXhpGxD
         N2i+hzJN3ARhd/bpbUUGDHDW1XEHOl2RgAm0tIO1efP4Vo0AYnv/0aVKvv9rEK8cgzWo
         rDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695617; x=1782300417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzRtYwZdepQpW7+D4SUSJ9DefBGTPjjaWTyX93dJg30=;
        b=g81eDe4flyqn6z2pOK7UwEtzcf6z+vuxeTwRnusoIxUNzKv92OEF8M31M/zuGTJXb8
         vth/yeFRqhB6WIptXhxNIfiRJtlSbK4CjBXa5uhz8y/XrVjvzA+vCTIR3va8tRbpALT1
         by4jZI7BSPehlRNSCncSOONsU7D+QlRDaIgjrAbet4+e6acQFohedxS6VSK/y7MxtTbQ
         UMvP1tXQot3rVhGx4gIam7zxVUYuf1w8HRdo3L4xSJx7PLR6BJ6NHr/HD8/iRYZYt0ah
         eVc7MUO0ipefIzYm7rmyqYJttFXLfmXLbSrsj9FvPo3w0wpI3w9bDqJx7TR5GLIVOjjh
         3Cvg==
X-Forwarded-Encrypted: i=1; AFNElJ8F++3eRhp1+5cG5KcgBNsYmGutMOwptipJ+4j49i93G7OEIswoaMcbmXC31K+vHn8qhU2bpGlaWvOG@vger.kernel.org
X-Gm-Message-State: AOJu0YwJEyLl/S44MB5nOoHgst/nOKmzOGAECfAZxRZO10YdYztZa+7b
	GaXg7bKWn11ERvI0RYjaLzNvtm9s1YO2OJit9ZwByKT2tI6BCurfkiES
X-Gm-Gg: Acq92OEBMwX8w+67/8vAlWmNo5A5IdXwiW8owvMGo53NCr+iwkVpA0hhbKRLj35MSo/
	AfOXljsYg0K5S2n/IgiH2Net01aYjHuEtLF2otrJfaZ3NxSkWpt0IjdtjYIBF36eu46kJ77HoRh
	6vDDhNJPV9Om6+moKVeJdjhfHHF+dm6rnCVJiGZtg9YdJp1vGu20NJ5p5ovYyztPqFD24MQ5c8Q
	Ck1t+ve7/wQv2ibKz1HQfg9Ev4L34eaWc+iC0VCww7qBySTgNagrTPt4iNksmBHjTRZ5UnM9DP9
	szg2WVLuQ7voJ2BNG/Y6qYWRHZnCvV9djjSq57NYffYXSX6jYPWGHU/3R3Q1KoU8nbT4kes65PN
	wTpONYVSVGBf8A6MRQY+PESOa/VDOPwCMuQ5sajJmaRAcOgYnrA1hcSzjsigOsWpcRvgFjE8k9V
	XrmBUPYtBN5NEvVYrPYUaUCqXOTEvxTlltGXmfvWQ8tKb9oIZtLvWHZVCZybtRmDU=
X-Received: by 2002:a05:600c:c0c8:b0:490:ba61:7981 with SMTP id 5b1f17b1804b1-492333e2958mr48897325e9.23.1781695616322;
        Wed, 17 Jun 2026 04:26:56 -0700 (PDT)
Received: from fedora ([196.77.26.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a96d14sm138192065e9.12.2026.06.17.04.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:26:55 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olivia Lu <luolivialean@163.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Alexander Clouter <alex@digriz.org.uk>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: rng: timeriomem_rng: add width and mask properties
Date: Wed, 17 Jun 2026 12:26:41 +0100
Message-ID: <20260617112642.1897096-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add optional width (8, 16, 32) and mask properties to the binding.
The width selects the bus access size for reads. The mask is ANDed
with the raw register value to allow only the entropy-bearing bits
through.

Update the example to show a typical 8-bit configuration.
Update SPDX to dual license to match kernel convention.
Drop the misleading '32-bit aligned' constraint from the reg
description since alignment now depends on the configured width.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 .../bindings/rng/timeriomem_rng.yaml          | 48 +++++++++++++++----
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml b/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
index 4754174e9849..636305f211c8 100644
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
+  width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 32
+    enum: [8, 16, 32]
     description:
-      Base address to sample from. Currently 'reg' must be at least four bytes
-      wide and 32-bit aligned.
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
+        width = <8>;
+        mask = <0xFF>;
+    };
-- 
2.54.0

