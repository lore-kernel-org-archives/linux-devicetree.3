Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2524048C3EE
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912364; cv=none; b=bzJ9aBg9nj8Y4gJ/ol0WwAki5Q7y9J6W079mtL/6+aH9owrDQvfp5WzKgVvgC7dXXI7PSqaNBAw+5HUfL8FiPizyOx1+WP02OpNvUYJNj92ezvO0gxEZoz34ueCoH5Xg77bBkq5jKobocwk+ctT6QSj9aU7W25u9CdBH9ybSu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912364; c=relaxed/simple;
	bh=Ae9AMDIuH4WdZ5Y6xC6kHLWOwFsVUmvXthvFalpvORA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2EHpin0vYOCncImS1yDlTbMDYeDMHhFNWlp2Q6iY1V3XCtF4f4A84A1R+BZnOU2CcUB2451laqurNRtVTaNyt1YqU3PIL+UBhP+KpX+aSAZOZk4t6XfY37jclD9ownfdNuwlTQBYw6h/Q12V5fZ0DkPHWdaK41K+uDuPE8zRZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtfbZn5Q; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtfbZn5Q"
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-6a0e02bd6b2so71368eaf.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782912362; x=1783517162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELOPtvzNiOcxwPccfGZqo+Tk2G5SqUaj+xktV7uuecc=;
        b=XtfbZn5QmXxB4yDtQR0qqK7IO1UEQUULih0K8xym1WfcNvv2gYSIL/2rZedOqhVhur
         ZVIXGvVaKH7L7d0fIab0+o94XhDwNmseSVBYdNaoxC0qcYOoe7uHNwho9j5HDLsIDK4S
         BLtj2JOgu+KvxIrJ9ZZKtzpU3ON0096biNJND8RgL80f3DnQvN+FNj+GSGPW9ptGanNt
         /NVx9aLkotI1PIbs1Vy7C+dvCQ3weIKWy8iGoOEfnO1TVAGnxzFmvNPoSdT4WwX/lNbK
         2+pc7SNG31bokQSNQAzOgpuKpDipPjWjx/DSixUL1ggqIhhZYe4AHuo8VM0nY8hT1I9U
         /dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912362; x=1783517162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ELOPtvzNiOcxwPccfGZqo+Tk2G5SqUaj+xktV7uuecc=;
        b=D5RCFbxu5Xo9+G/3ctQhDftIS3ao/6tQI8G5Ptt1FEAvecIXpG65kqSxB0GMPZGE6P
         yX0Rx7R/kWeN3iJmMdScStB2zok0z9YVR0zuYT2vn6yps6EkCeRqZIdPc6/y5EOeyKGL
         fDbbkuz9cYY5mda0Z4LP4SlJTawi2ldekW1HPfvCDk/RMeirPQYs6uG3WFWtIv7DFxmP
         zdLLCbZc3LEvic5q9ErVO0Z0c7HTr6aw94eUW85KSTf+cG9jOzrhLlHKamRo340RAZJV
         ZRkO0SPFciNpFSYtlqIYFuN5uEyycNAse+FCpkkZ73q6ENuQjMqkPc0mAH5ePGYSCMqm
         NJKw==
X-Forwarded-Encrypted: i=1; AFNElJ+pyT7pY+PZBZSyAyI6K9ojYSMJXV74u2ISBIf+r5UH1JFt4Md/kz1JlfBEDOw1WT04C/e2KyhJeE22@vger.kernel.org
X-Gm-Message-State: AOJu0YwhfOIQdXTF8XzGo/Pxqxkmdv/IJBlfafHCrKnaSakodJCOrjQY
	ujIxvSXl2/p0AlVbFF1c/3IU4eZA0oQy88tjbXUDh1Im7uMaeG70KVPY
X-Gm-Gg: AfdE7cnhnIeujsWPuATG/fVJguCRIbcL4XP9azVicwXN9YOfv3cUe+xalorjxtHtdgl
	tDk/TCIQoEHI6iBN1N12fTmNt92RSQi3u5UdGPfQLHTA5j6u0GfjCoGCN513c2dMxT28bpEtIdb
	SXog5UQX6sZXn6RXe0CMmVyHdOiN1E8rSHEiUNjViSAFJmDZ3eZ3jW5hZxsqUe1yu6sXIp0YSL7
	9UZ14zQGiSicCukc9u0fjU+oJzp09QhTfnI/FiKZ/pNUs7Fpwo83CcjAAU7alypI3egxn5nymif
	HhAUY8INZQMtSS6zb1R6b0K+U3da+eJs0Qbr+EYCV1aPd9kUf/4sGjFVQKMo3F5bRRDDMFUNd6D
	+KXKeFBMMK423xoGmAQgJgC3EPZF18kwA+pFpECr4qR2iBXgOoDmytjSzxVHtWHHFQ2yne5Zu9Y
	doclX964PH9/N1Y14dAkWwGZi+vR1ySKto/QWjBV2yWkvi2pUrE8P0hNA=
X-Received: by 2002:a05:6830:3e01:b0:7dc:e336:c828 with SMTP id 46e09a7af769-7eb48af3f30mr859806a34.10.1782912361959;
        Wed, 01 Jul 2026 06:26:01 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec34f898sm4938144a34.27.2026.07.01.06.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:26:01 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH 2/3] dt-bindings: firmware: add mbedtee,rpc binding
Date: Wed,  1 Jul 2026 21:25:13 +0800
Message-ID: <20260701132514.186953-3-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701132514.186953-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML devicetree binding for the MbedTEE Trusted Execution
Environment driver.

The binding covers two platform configurations:
  - ARM/AArch64 (TrustZone, SMC): two reserved-memory regions
    (rpc-t2r-ring and rpc-t2r-shm) plus a GIC SPI edge interrupt
    for TEE-to-REE notifications.
  - RISC-V (IMSIC): three reserved-memory regions, adding
    rpc-r2t-ring for REE-to-TEE command submissions; no interrupts
    property (T2R notifications use IMSIC MSI allocated at runtime).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
---
 .../bindings/firmware/mbedtee,rpc.yaml        | 221 ++++++++++++++++++
 1 file changed, 221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
new file mode 100644
index 0000000..08ae255
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
@@ -0,0 +1,221 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mbedtee,rpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MbedTEE Trusted Execution Environment
+
+maintainers:
+  - Xing Loong <xing.xl.loong@gmail.com>
+
+description: |
+  MbedTEE is a Trusted Execution Environment for embedded systems.
+  This binding describes the shared-memory regions used for RPC
+  communication between the Linux REE driver and MbedTEE OS.
+
+  The REE and TEE CPUs sharing the RPC memory must be in a
+  hardware-coherent domain (same CPU cluster, coherent caches).
+
+  Two or three reserved-memory regions are required:
+
+    rpc-t2r-ring  ring buffer for TEE-to-REE notifications (all platforms)
+    rpc-t2r-shm   shared memory for TEE-to-REE RPC payloads (all platforms)
+    rpc-r2t-ring  ring buffer for REE-to-TEE command submissions (RISC-V only)
+
+  On ARM/AArch64 the transport uses SMC calls; TEE-to-REE
+  notifications use a GIC SPI edge interrupt.
+
+  On RISC-V the TEE notifies the REE via IMSIC MSI; the REE submits
+  commands via shared-memory rpc-r2t-ring that the TEE polls. No
+  REE-to-TEE interrupt is used. No SBI ecall is involved.
+
+properties:
+  $nodename:
+    const: mbedtee
+
+  compatible:
+    const: mbedtee,rpc
+
+  interrupts:
+    description:
+      GIC interrupt used by the TEE to notify the REE of pending RPC
+      responses (ARM/AArch64 only). Not present on RISC-V platforms which
+      use IMSIC platform MSI interrupts allocated dynamically at runtime.
+
+  msi-parent:
+    maxItems: 1
+    description:
+      IMSIC MSI controller used by the Linux driver to allocate the
+      TEE-to-REE notification interrupt on RISC-V platforms. Not present on
+      ARM/AArch64 platforms, which use the interrupts property.
+
+  memory-region:
+    minItems: 2
+    maxItems: 3
+    description:
+      References to reserved-memory regions for REE<->TEE communication.
+      Entries must match memory-region-names order.
+
+  memory-region-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      enum:
+        - rpc-t2r-ring
+        - rpc-t2r-shm
+        - rpc-r2t-ring
+
+required:
+  - compatible
+
+allOf:
+  - if:
+      required:
+        - interrupts
+    then:
+      required:
+        - interrupts
+        - memory-region
+        - memory-region-names
+      properties:
+        msi-parent: false
+        memory-region:
+          minItems: 2
+          maxItems: 2
+        memory-region-names:
+          items:
+            - const: rpc-t2r-ring
+            - const: rpc-t2r-shm
+    else:
+      required:
+        - msi-parent
+        - memory-region
+        - memory-region-names
+      properties:
+        memory-region:
+          minItems: 3
+          maxItems: 3
+        memory-region-names:
+          items:
+            - const: rpc-t2r-ring
+            - const: rpc-t2r-shm
+            - const: rpc-r2t-ring
+
+additionalProperties: false
+
+examples:
+  - |
+    /* ARM TrustZone (SMC) */
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    / {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      gic: interrupt-controller@2f000000 {
+        compatible = "arm,gic-v3";
+        reg = <0 0x2f000000 0 0x10000>,
+              <0 0x2f100000 0 0x200000>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+      };
+
+      reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        mbedtee_t2r_ring: rpc-t2r-ring@85f10000 {
+          reg = <0 0x85f10000 0 0x20000>;
+          no-map;
+        };
+
+        mbedtee_t2r_shm: rpc-t2r-shm@85f30000 {
+          reg = <0 0x85f30000 0 0x40000>;
+          no-map;
+        };
+      };
+
+      firmware {
+        mbedtee {
+          compatible = "mbedtee,rpc";
+          interrupt-parent = <&gic>;
+          interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+          memory-region = <&mbedtee_t2r_ring>, <&mbedtee_t2r_shm>;
+          memory-region-names = "rpc-t2r-ring", "rpc-t2r-shm";
+        };
+      };
+    };
+
+  - |
+    /* RISC-V IMSIC (ring-buffer polling REE->TEE, MSI TEE->REE) */
+    / {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+          device_type = "cpu";
+          reg = <0>;
+
+          cpu0_intc: interrupt-controller {
+            compatible = "riscv,cpu-intc";
+            interrupt-controller;
+            #interrupt-cells = <1>;
+          };
+        };
+      };
+
+      imsic: interrupt-controller@28000000 {
+        compatible = "qemu,imsics", "riscv,imsics";
+        reg = <0 0x28000000 0 0x1000>;
+        interrupts-extended = <&cpu0_intc 9>;
+        interrupt-controller;
+        #interrupt-cells = <0>;
+        msi-controller;
+        #msi-cells = <0>;
+        riscv,num-ids = <255>;
+      };
+
+      reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        rv_t2r_ring: rpc-t2r-ring@5f10000 {
+          reg = <0 0x5f10000 0 0x20000>;
+          no-map;
+        };
+
+        rv_t2r_shm: rpc-t2r-shm@5f30000 {
+          reg = <0 0x5f30000 0 0x40000>;
+          no-map;
+        };
+
+        rv_r2t_ring: rpc-r2t-ring@5f70000 {
+          reg = <0 0x5f70000 0 0x20000>;
+          no-map;
+        };
+      };
+
+      /*
+       * The riscv container avoids a duplicate /firmware/mbedtee path
+       * with the ARM example above when the DT checker concatenates
+       * examples into a single .dts.
+       */
+      riscv {
+        firmware {
+          mbedtee {
+            compatible = "mbedtee,rpc";
+            msi-parent = <&imsic>;
+            memory-region = <&rv_t2r_ring>, <&rv_t2r_shm>,
+                            <&rv_r2t_ring>;
+            memory-region-names = "rpc-t2r-ring", "rpc-t2r-shm",
+                                  "rpc-r2t-ring";
+          };
+        };
+      };
+    };
-- 
2.43.0

