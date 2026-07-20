Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F263C3F4F
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533008; cv=none; b=YjEigb7ZOW33tARopJZKNC8JM+wEMJFh/rVerESHKzVxoavEiOuEgeZyB9DIzWLYk8k57xsBFMC8muO50POD20o0V8aYMW69G0ty2XX9dnedUGRCi62Z5NCPjvmvZtYoBWNNrF4S/2ZGxSdr9zXjKmQGbt2cTZZVKDbTyocU964=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533008; c=relaxed/simple;
	bh=VKQ6HU0Rq+OxIUzgjiIiYCUiyJKhoppzbp6pXcHeQRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e22s5aNWnWhbnIXEdW91vJVDHuDUQ/ehGnoaf80fLbMM2U4puW0LlOKq6EgNR42mPHjMng+XrEsii+X9ULQctL4EDXNs0kLoDrecsauewkMKuY2mL7mh9fw/oVNLK+fbzdgyWh7ZSUgIcs+Ca7xsk2ffp9wc1hLAuR9RBvEMvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDZ1U/VG; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDZ1U/VG"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so6361172a12.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533006; x=1785137806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdaqGWHkjITQmhPR3c1nuJGM5fgMQJ2LTHjMaX1w49Y=;
        b=PDZ1U/VG3sdakb7/GLTjsbjN8V7hl+jxPr+OJUwWSSLNURE5g42WscZ2nZ9/M06pe4
         woZwpnCcUrAFsDQaU1rjfh5kjvZ5WlmmZtS+KZK0hebY2hpgon1mwZZx7xcD0EtH+nwp
         iq9lPe7d2nUZQ42iELWUBM8FQjxFuZBlD3VY6+oCMmmA8mWCXnWKkJJkAZJ/QLfZwQfO
         eQky70Tfbve/F4m8zTU6YiJLucLr+j2iPxnZCHM/xskDDjKo9uibbxc362fSM8o34O/x
         U8ki+uKKU6+SxPjMR/GDUBPYrlOBH4NCn3LRlMd9pZxXucRvNPsL1N2hsIL9XE84kwDo
         95Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533006; x=1785137806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdaqGWHkjITQmhPR3c1nuJGM5fgMQJ2LTHjMaX1w49Y=;
        b=UawGftTc+OS1oKoJVL5uUXGyrdLAMKLoRdT4W0ybLj9m+Yj4eTqBYjoEBJKlY61cnZ
         s9fyb9ylviWeD7NHs4PTBlys0H+gSah5mHLDIPrPaP2QyCXD9c3ebZm8WLT74nI5dAta
         flOU/DZ9zQ1iiA22K7ZIMZ8wT437p0doGQIx9cS0S1dvo1kkiSgof/tenx4LnYnomaQ5
         FF+ULIxWC5u96NbuhA9YTe6sDIm2VBfPehI7+GIs6Be62dNmbcT1IG3jVaSbaki1wIEx
         ffS6n8iH1H6CJhH9pKU1ncrte0HepnuWjfq5CuSz+wpD9k9///TwmlVThak4LNGa/Ncf
         eLUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKrBKvhsgWXsaVoVZxGUOaRw/BAG7fi4HVSkewmBm8RdUqnrfLv6kdS5GBiHmMg+q3W9qB1ekaRGQA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr0mHYzTf5r25ud9cWA6nuzQWYTQGlVCL3iDBsPPNBUdCFkqAz
	c60Ln4KAOwYDIgj8mdmyN5o8iyp5tM68659JPkM8qx1A8C9Q4RGmHnKX
X-Gm-Gg: AfdE7ckkxO3Hx617VIiyfZtdgNGp6x/gvvLZgHUP+zKPreaYWm7DboPDf2y9pTttEm1
	HO/vkDUVyO+XIjg2DokhwO/MpBg67dafGhPGgK4/sh0GxilfOpn9VQyLyhPP2PcJotQdxWnUEoO
	bUkyTiIjYzibY2ll/+qKUiJ29m3GiOXjP7W3WZc9JgyLC6VEIiczRxCDFQ6RTUKClWYXaKzqwI9
	HO4Q8oWCFBmHSRdUMIuf9fHN+t1ARh4hfmWlW5x2KqNrtJe45F9kNW4z+E9HFNw8TrNqq0a9wpl
	iZ+GvqnQOHHVrH0ipackr2Nq20/KdRULxo+RxYfop3CZo01qs4u4VzzEJjtiAKsdLqfoTksgmVU
	VygyrJTqPpnDKdqkFwC8/4JrR7andDz0yYKH9tiioo7P87Zo6ybEiz14iKBY8zpMchf+pBCS7Mr
	gaYBA=
X-Received: by 2002:a05:6a00:190e:b0:847:b16b:46d9 with SMTP id d2e1a72fcca58-84c292efc9amr12800371b3a.34.1784533006047;
        Mon, 20 Jul 2026 00:36:46 -0700 (PDT)
Received: from ubuntu24.. ([216.23.123.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm5210536b3a.20.2026.07.20.00.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:36:45 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: firmware: add mbedtee,tee binding
Date: Mon, 20 Jul 2026 15:35:56 +0800
Message-ID: <20260720073558.799755-3-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720073558.799755-1-xing.xl.loong@gmail.com>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
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

 .../bindings/firmware/mbedtee,tee.yaml        | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
new file mode 100644
index 0000000..a8f1201
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
@@ -0,0 +1,109 @@
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
+  Two or three reserved-memory regions are required:
+    t2r-ring: ring buffer for TEE-to-REE notifications
+    t2r-shm:  shared memory for TEE-to-REE RPC payloads
+    r2t-ring: ring buffer for REE-to-TEE command submissions (RISC-V)
+
+  On ARM the transport uses SMC and a GIC SPI interrupt. On RISC-V
+  the transport uses shared-memory rings and IMSIC MSI; the TEE
+  polls r2t-ring for commands from the REE.
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
+    minItems: 2
+    maxItems: 3
+    items:
+      enum:
+        - t2r-ring
+        - t2r-shm
+        - r2t-ring
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
+          items:
+            - const: t2r-ring
+            - const: t2r-shm
+    else:
+      required:
+        - msi-parent
+      properties:
+        interrupts: false
+        memory-region:
+          minItems: 3
+        memory-region-names:
+          items:
+            - const: t2r-ring
+            - const: t2r-shm
+            - const: r2t-ring
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

