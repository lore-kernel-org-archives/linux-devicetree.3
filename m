Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052854229C6
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128607; cv=none; b=a0aPWQXTxHZE+cQVCtxUD26B+a5DJAA3gYcmFA1a+m7WW4XZKHjTd08bmucfYRkaqE22g6Un//rk9/meUnk5Rtxp71r0diTHGPXNFfuiGcsURuSgwpz+iQoqY1/6YtNnuHtN5SoNLT5qHpkT20UQDY/0jOEFVyyIDCXpT0SXmHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128607; c=relaxed/simple;
	bh=P8ZslpnwpzWSGlubFgJm518h1JGOYuAU34Vm5b4g3LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dU7kq7v/SmOAdNbsbxfY1XAFy4xLMIyWli13XTyO03QYmkXYdcbJwsW6kHsRBao2ZHxz5ylS1tCq3WOGgwo8za6FbxZFlqrNM6QnfwCyPuEc8lSJtbOv3cObj3PgKVtOMcAOFaUNt/bheYxHwQUFc3zSWfBNEnfB+x0LgEwqJKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIsrl8MF; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIsrl8MF"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so283343a91.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128605; x=1787733405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/nqPj16def9ZnxDQwFpTtIBuj8LfIQAUc8OONxlNco=;
        b=fIsrl8MFRSa3fHYBxoXOEB/hfEcO3T0kp9IwlIuPtnRw51ylszUHp1mBSVxQua2Ts0
         jitkwfSaENl0kyRaTan5gcdTexVkZZVLZLfFp/y5d/y895h1BFJrNz2zkv1l9SwtnKVc
         0iJ/un5F1CW0QhbU5YTWOYhNwNCZ1ImJMs2MuVg+iR2SOKy8cPsoqzfkZTwqqrIhJAtP
         +MSyVczRHY76KHXZxvT6qOkP/6gTvpgQgXt/0sL1X7e+U4CtWURDfYFa0V6doQFM+pZu
         ZW9hWhKmJfuvNYrxgpnSRhUrMr+zNOUK/oAd+u/K8Ntg99+1XNzLQLfV83PFnRT8Oo/S
         4jRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128605; x=1787733405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/nqPj16def9ZnxDQwFpTtIBuj8LfIQAUc8OONxlNco=;
        b=F5JGMZPa2SKskjZgxIxlhVNuIo+KAiG4vahWDmHozEyN3HcvbigzVh9Fzy7tssX/6G
         7l9EOTyyanWd/mfOYGpFrJie44lDiZJuzvZPw+Ygrlpwaik/qO1rfdq68JxXQxk2nDMQ
         eSo1/0ns5HGRdPN/gXF01kwyBLHNDLr8EgQes8LZ1zcyq3oLtwwb1xmixtPYKArHbTGO
         tyuYzhFKZhOY4g6uQ1wh/+zAaKuymuw0xBDndKAqvzDl5U0brFsWKFKjuwOQOwccto83
         OZ5PMXsAs30WtzVQY6xFfq6+M32xpzTjeKzq6JKL+ySNpss4wOMSIlR1l+q7bxZigpUC
         2L4w==
X-Forwarded-Encrypted: i=1; AHgh+RoJ98tKPIEdkIH5AfIPoLaXrP+toI/633Dv6yOViDcpk3G8grqDNpirkNdqM9rjHIJXJH1eChgeC0dw@vger.kernel.org
X-Gm-Message-State: AOJu0YyGoPYbwYxBnr3/GCBtgJ3orLX7QJmbH5wcFl7z2obR2wW0+hK7
	iYco/iX73f97fWxpAWocBv1Q2V2/dn+N8XOIJ5ixeK7atHtFZHfDe1Jj
X-Gm-Gg: AR+sD10Bipo1UaeZa8kJIkeotBBnzKko82EWqzSPAh3slI0CpYAg9E7vzQkZrlQeW68
	5BgJvI5OQJWM+HOkdOO8LAAMbzAjkq5F3kCahbEcIUWyXmFyZUX7FahNwclyuBY0F4D8Hya5XZ3
	NKuJCsMlGHbNwEmV4F3jJ4kC644rZ8Xy1eO0gLwGZqaM5MUy5xy5ocpbBSrXwAhv0/mjnAfAjg3
	A/15LCvLlUdvOXvDZGGTk3tl4llFGFk60/d6iCQDje93wk4012/Z1i9wP1pYsu81aspJwcofrF5
	PKe1bGeMmPz04SZmP2hHp+8gyqktcQMnuN2Jh2uVVGYGgUhp1uND8qixytTBG61U+WjD1buriG+
	DBAhBn97z8OF33jilTfuDpstwfesTEmKPsGZil1bfbEojtVDb7/mr4ovBiRkqrrTYFjpwBZ8FIW
	8FEe5Mh5dt0tu2eIexu0Zs1VngBmF7AIqwKEkMz5ZV3GXzFyTWkWHVEsVxu3zkf+M=
X-Received: by 2002:a05:6300:2284:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3cd00e24fb6mr6745037637.8.1787128605149;
        Wed, 19 Aug 2026 01:36:45 -0700 (PDT)
Received: from ubuntu24.. ([85.149.220.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155464a0asm332268a12.14.2026.08.19.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:36:43 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: firmware: add mbedtee,tee binding
Date: Wed, 19 Aug 2026 16:35:58 +0800
Message-ID: <20260819083559.1303348-3-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
References: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MbedTEE is a Trusted Execution Environment for embedded
systems (https://github.com/mbedtee). It communicates with
the REE via shared-memory ring buffers using a fixed RPC
protocol. Two platform configurations are supported:

  - ARM/AArch64 (TrustZone, SMC): two reserved-memory
    regions (t2r-ring and t2r-shm) plus a GIC SPI edge
    interrupt for TEE-to-REE notifications.
  - RISC-V (IMSIC): three reserved-memory regions, adding
    r2t-ring for REE-to-TEE command submissions; no
    interrupts property (T2R notifications use IMSIC MSI
    allocated at runtime).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
---
Changes in v4:
- Move reserved-memory region descriptions into memory-region-names
  property (Rob)
- Define memory-region-names item order at top level; keep per-branch
  name count constraints (maxItems: 2 / minItems: 3) (Rob)

Changes in v3:
- Drop all phandle stub nodes from examples.
- Remove redundant required: - interrupts from then branch.
- Simplify title and description.

Changes in v2:
- Fix DT binding review comments from Krzysztof Kozlowski:
  - Drop $nodename, "YAML devicetree binding" wording, property descriptions
  - Rename compatible string to mbedtee,tee
  - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
    rpc-r2t-ring -> r2t-ring
  - Add memory-region / memory-region-names to required
  - Simplify allOf constraints (drop redundant else-branch items)
  - Rewrite description to describe hardware/firmware, not the binding or driver
  - Drop all irrelevant platform nodes (gic, cpus, reserved-memory)
  - Add maxItems: 1 constraint to interrupts property (Sashiko AI review)

---
 .../bindings/firmware/mbedtee,tee.yaml        | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
new file mode 100644
index 0000000..a67ac43
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mbedtee,tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MbedTEE
+
+maintainers:
+  - Xing Loong <xing.xl.loong@gmail.com>
+
+description: |
+  MbedTEE is a Trusted Execution Environment for embedded systems.
+  It communicates with the REE (Linux) via shared-memory ring
+  buffers using a fixed RPC protocol.
+
+  We're using "mbedtee" as the vendor prefix for the open-source TEE
+  project at https://github.com/mbedtee.
+
+  The REE and TEE CPUs sharing the RPC memory must be in a
+  hardware-coherent domain.
+
+  Two or three reserved-memory regions are required. On ARM the
+  transport uses SMC and a GIC SPI interrupt. On RISC-V the
+  transport uses shared-memory rings and IMSIC MSI; the TEE polls
+  r2t-ring for commands from the REE.
+
+properties:
+  compatible:
+    const: mbedtee,tee
+
+  interrupts:
+    maxItems: 1
+
+  msi-parent:
+    maxItems: 1
+
+  memory-region:
+    minItems: 2
+    maxItems: 3
+
+  memory-region-names:
+    description: |
+      t2r-ring: ring buffer for TEE-to-REE notifications
+      t2r-shm:  shared memory for TEE-to-REE RPC payloads
+      r2t-ring: ring buffer for REE-to-TEE command submissions (RISC-V)
+    minItems: 2
+    items:
+      - const: t2r-ring
+      - const: t2r-shm
+      - const: r2t-ring
+
+required:
+  - compatible
+  - memory-region
+  - memory-region-names
+
+allOf:
+  - if:
+      required:
+        - interrupts
+    then:
+      properties:
+        msi-parent: false
+        memory-region:
+          maxItems: 2
+        memory-region-names:
+          maxItems: 2
+    else:
+      required:
+        - msi-parent
+      properties:
+        interrupts: false
+        memory-region:
+          minItems: 3
+        memory-region-names:
+          minItems: 3
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    firmware {
+        mbedtee {
+            compatible = "mbedtee,tee";
+            interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+            memory-region = <&t2r_ring>, <&t2r_shm>;
+            memory-region-names = "t2r-ring", "t2r-shm";
+        };
+    };
+
+  - |
+    firmware {
+        mbedtee {
+            compatible = "mbedtee,tee";
+            msi-parent = <&imsic>;
+            memory-region = <&t2r_ring>, <&t2r_shm>, <&r2t_ring>;
+            memory-region-names = "t2r-ring", "t2r-shm", "r2t-ring";
+        };
+    };
-- 
2.43.0

