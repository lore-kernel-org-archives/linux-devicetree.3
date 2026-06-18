Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723DC2C236B
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784087; cv=none; b=Z08FyvbRfU/OYhzLLJ9Z9MB1TbQGsJCPXwyPTPFFplHz+IDn2oBu5L/IJMmVTgY2qI2h3erojr2+xVdd71wDL06Uo92ZIoqnJqY28aEQI+M5IHlOh1ETbia4ZdlU3AizxPQsUAdmGdl1fF4nVOJJdyNf3RsWE3ZTz5fhAaJnvT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784087; c=relaxed/simple;
	bh=0eiZHGb9KKIgUxkII4zJTF+i6GeM/3brFI9yXSPJloU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/q9r7RzTotLFzi8cKyKXKRkEl2LM+1COIbPTSbi2/ocmD5GJ+ss+GlxC8zmYXcPHQi+wGDyOe7x4Mevdy/frQit4NMGpFUsdRY/voojhDaSN7QW+SN7BJRCCzM/XAOTIp2NsfqXK3Z5Eh0XF+Yh/HcB0tk7P33xenSSHSNh92U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSSWBYSo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSSWBYSo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ac357c55so7633535e9.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781784085; x=1782388885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNIuXvhlBD5VWoUVh2+QzcLjcnytf8FvE3IBj55kuEA=;
        b=GSSWBYSoQqK4YmcTS3CeTWNxlFcVCsPkUFWQzlujYE2RpvWrsg6X3sLeYDhKb9sc/H
         MEhpFJNOITGdg4vFdxm8SDVhU3hQ0bab9X8yhv6vTjxa1VJkbRWLK6FdQBzuyWQQIlv9
         grOEZTtQa98UzXdrZdBcQX5yFTOL4K5yi+JVzphapUwxY5QWq1Y0AQ708szMt67JmiZP
         JRZp9dJubd6c9Jfu+OI59TVLEXIq7x/QS1XukGtz74vff9EMqI/GYuBDYcKtdzalkYMh
         jnyF2T0lwKWgUwaN6tX7qmPmUng2hv1TVqBdLfbFEMVP/OADq3C6TiigUFMIK7ydrRTt
         j1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784085; x=1782388885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNIuXvhlBD5VWoUVh2+QzcLjcnytf8FvE3IBj55kuEA=;
        b=Ay78rocCnXsPTUXCisUC3VcFCYiVpuE3iUQt+jMSmdDziNpyGsZszE1dU4MoIXThK7
         lCleudi6E/ZZN1OHFcCrRHVAQwgrbaZYhDme3EDBjIcw02tMgNbkcGv1FBBlIPwEoZas
         gGCxW+U8iwx9QtqM/FXpCJxLZ17amGynNfVpNIMd/wkvxiekaBYJVw9D5EMpxgC7he72
         9OO5Cy+RZORdOUVQdi3uxC2foo/FZ2Y/8KXnTI/wPxzNstwGRkqXfn8Mi0TpwkohJTzf
         +JN6PXO18I1S5lqt+rFhtebwYTUMfKl+1exXncduFrwUx+eMVLWfjGPC+RUL1/QEdlP/
         r2QA==
X-Forwarded-Encrypted: i=1; AFNElJ9oiKxreVSeX2jLafSd3Jpo5ZSossNDX60CsnYIjh88ov/bCgV51sljxIwhX9XHWhwB1N+8MVhbiQgD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+8lsFcyp9I0Nbx0wODqvPQIQCUP055GOBnGGKmaVXhoIZQAo8
	NAM5doUBmaddHeZG/fdFvUdo43Kxt65JX0sgEjf89OUB8OfOcQLfS0vn
X-Gm-Gg: AfdE7cnmj7VAcCN6ZLZTjPTfpSLV/zVIF0nTDS3BndP9bds35aRe8NK4BpIBETU55Za
	zQHdOGLYVRA4CgleRfsmuwHZ5we0vc1ypqoDRoev91KjhXNo4qQzDQd9bMfmgCYECHIIQWVOtJc
	mVqaSuNVV87OCdXQjGVqWlm/x7XDeoZ4ZIVhQiVnHJftwwrIGVaUIx6TDZXDT3c+nm8FRzvyQ2g
	2+vBdACxmmO+eyixRHwwzYWnzx7qkfSpEGfO/iEWVR1oOwgcYwl2ETWZqZBwSRlpTsEYDFR3CGX
	VMEs9VX3YGOWacb9Yp0/aPZytAQkPjExaWP3nzb+bbLu/VaYqZcdUIg06VEReC4Wc8Rh9FL1arw
	tB3CvuxF1cQ/sa9LWE1d93DgeZuCx/A13qibWrdGYbC3h88z50RuNiGIx4TL6xhU4j9/fE5F5K2
	2Z2tsBDHtfQC1Ux109RtJdBzR+TufcWc6HLzTP+GJUX9YVDtqTtYNkO5eLAjoWgSvqQ5M=
X-Received: by 2002:a05:600c:4c09:b0:490:b355:9c8c with SMTP id 5b1f17b1804b1-492333ca42bmr93315975e9.23.1781784083060;
        Thu, 18 Jun 2026 05:01:23 -0700 (PDT)
Received: from fedora ([196.121.162.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a8ec56sm218506175e9.9.2026.06.18.05.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:01:22 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: rng: timeriomem_rng: add reg-io-width and mask properties
Date: Thu, 18 Jun 2026 13:01:09 +0100
Message-ID: <20260618120110.36439-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add optional reg-io-width (1, 2, or 4 bytes) and mask properties.
reg-io-width selects the bus access size.  mask is ANDed with the raw
register value to allow only the entropy-bearing bits through.

Update the example to show a 1-byte configuration.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
v5:
- Fix description to describe hardware, not the binding
- Drop SPDX dual-license change
- Merge examples into one
v4: Initial version with reg-io-width (replaced custom width from v3)
v3: Changed from custom width to reg-io-width per dt-bindings convention
v2: Split DT binding and driver into separate patches
v1: Initial submission
---
 .../bindings/rng/timeriomem_rng.yaml          | 50 ++++++++++++++-----
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml b/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
index 4754174e9849..7f0068f785b7 100644
--- a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
+++ b/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
@@ -4,7 +4,11 @@
 $id: http://devicetree.org/schemas/rng/timeriomem_rng.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TimerIO Random Number Generator
+title: Timer IOMEM hardware random number generator
+
+description: |
+  A device that provides random data via a single memory-mapped IO register.
+  A new value becomes available at a fixed interval.
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
@@ -13,29 +17,47 @@ properties:
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
+      Interval in microseconds between random value updates.
 
   quality:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 0
     description:
-      Estimated number of bits of true entropy per 1024 bits read from the rng.
-      Defaults to zero which causes the kernel's default quality to be used
-      instead.  Note that the default quality is usually zero which disables
-      using this rng to automatically fill the kernel's entropy pool.
+      Estimated number of bits of true entropy per 1024 bits read from the
+      device.  Defaults to zero which causes the kernel's default quality to
+      be used instead.  Note that the default quality is usually zero which
+      disables using this RNG to automatically fill the kernel's entropy
+      pool.
 
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
 
@@ -43,6 +65,8 @@ examples:
   - |
     rng@44 {
         compatible = "timeriomem_rng";
-        reg = <0x44 0x04>;
-        period = <1000000>;
+        reg = <0x44 0x01>;
+        period = <50000>;
+        reg-io-width = <1>;
+        mask = <0xFF>;
     };
-- 
2.54.0

