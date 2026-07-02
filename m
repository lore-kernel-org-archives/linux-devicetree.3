Received: from mail-oo2-f1.google.com (mail-oo2-f1.google.com [74.125.231.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A535F433E96
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005134; cv=none; b=fTeUDQ72+klUWhJOR/Urriwhj8PS9JeFni+9lNoDPu299JB89KBl93q1uOCZfLAuatpus5k1OvdrGg9XQuf57vF8XciGQZC170RVzShCyMrR1O3a6szg6T25ZSUyWeo7RoqRr4TxgRhai2OQaRHUxVwKQK4pa9clL+fCK7uwPOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005134; c=relaxed/simple;
	bh=EMllpPReduF4xF9JY3i/M4ky8A9qb/2SY9VZU70ZYso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UzKw+nscqRKK9+GJMSDF77VNb1Bw2YMlXdR6naZ7Zveu5hXAhl1zkQ40vTX7ny0oSZ+ew4nC4GmefSVLykyCaXRmPcP2QQlKF/DMkQI/TZg2a439rz4AquN5OXR34G2AWcpTYlF8Uu/EmUKAI748l1zGGgNpSv4yKARY1fO+Tcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTOPux73; arc=none smtp.client-ip=74.125.231.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTOPux73"
Received: by mail-oo2-f1.google.com with SMTP id 006d021491bc7-6a150e793cfso411670eaf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783005130; x=1783609930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUdfn0E+HkL5zwEpZVP9/C/NdRDvTd2wtK5Vkg7/59k=;
        b=qTOPux73KI0+kZ4jyAY1I4v+szDNHkXYG3RQtYi2zk5LV3Bb49k42/yo4xHtmWCbc5
         esguO3txdmsrtE1I+C7xLZwneI9+z0CiAt1pH6CsFnKChjrRz+YqmevZM7v9zOpFFlNt
         /s0Zyn3MtRGn69KzFY4y5H3ndYocxE4H/sIuYLDpwTU0gfuz4QjSLS43r9PmnDOPcuHQ
         FqaZDnFUVMmUoBsm5qGx4DMMGZX3Al0h0HWT9X2NpPEFN/79+0eYbZAX8wYwh1XNeQQr
         Ur5ibjFUvMctEIIzJXnCSC/wSRcr0LjoxOYRETsgPNrHPdubT5EmNUEazGDqgJ/oYESQ
         V1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005130; x=1783609930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EUdfn0E+HkL5zwEpZVP9/C/NdRDvTd2wtK5Vkg7/59k=;
        b=S0/GkRhRpRXUtKsP3Z6Y+ozY0QspQapf3vCExymt8YyKi9THxaaldRsqBznyL5Cblh
         oFHECwMYx8GKXALsLNZbr5fTXIwrWA0wuHvgku3cAOAdiVGs7CB+Dt13Thr6I9GVY9d7
         uwh6sxN6CsNdcACD8I+O2hZ4fj7/WqSX12aeo4qsgtwtSfpLXHqj5LHsYA0sWhLXbUNP
         57fsO66x3tomTW77kYaY6vdKM3lmlHy6iTC4qipk8nrFSDiIzXQUu02H/VN37C0wcSs7
         B0ZorB/gU82ppwEfnt3Uy0kGuX2KTGD6+isLBVyvJyQdtEsDoP1NwaJjStQQsQw8cyHb
         CoAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oiKWlkWpF8UVslhNGcuCDEx6JJdWtcPHuN6ZvWruQC9NsRFy2aTNlG9hWa6qAQ1gxYZMeE87uj/dr@vger.kernel.org
X-Gm-Message-State: AOJu0YzeObcTVMu99K7KdX4uHw9gn31jszfRJGJPBXJ3kSMbJ6igJCo1
	AJP94y293kq08stBrnJGF5ttG1NZD/hY2hFfXpXy+j/00ISFUIjjNi83
X-Gm-Gg: AfdE7cnuUztsyQdUPXA6an7z6EO1bcx/z6MjUAY3f9vMv5NIKpGhDq0IOEn6/g1cBj7
	JVhw2AHePjm3mQd99zJnjizc9PLfxqCUAnPQpNi3A+XLgVMTiSEfHzHuxPgYBTA7Aav71grmI7z
	5/99SFEuIoX7h2q0CbmE9z7WxAuaXcyIcWnfn0Nrff9EoBhbN6X7HIV7667ABJrdFkdQFOb/8EI
	lbooyKW0aK2M3qsc5t+OvUzNNQUTjhLQ2GzJ0v/fwnR3B2khfbgLlN2ccftoyBZgxiHvfNTxd2o
	Y80QpC4YlquqaXyObo0uF+Yg0aPcbvoZapnd9bO+Eft95EtzIM2aC4hLyPEqAmitClAtC5QOsvb
	jABFNHPWBHzXSr/5joQJR7xTRioqUutJSWmd0GdQE3tdcYcY4/hxltG9fZbMdDGGpRW3MQ35SyE
	qwdaCXFAAzwTbdsqCY9gHSvNjBCOX23LH8+jFg6Bk5ChZBhY6zKhf2QoQ=
X-Received: by 2002:a05:6820:2903:b0:69e:98c0:a9c with SMTP id 006d021491bc7-6a30d747a2cmr3407719eaf.11.1783005130487;
        Thu, 02 Jul 2026 08:12:10 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbec9a113sm3094561fac.9.2026.07.02.08.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:12:10 -0700 (PDT)
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
Subject: [PATCH v2 2/3] dt-bindings: firmware: add mbedtee,tee binding
Date: Thu,  2 Jul 2026 23:11:14 +0800
Message-ID: <20260702151115.544016-3-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702151115.544016-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260702151115.544016-1-xing.xl.loong@gmail.com>
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
Changes in v2:
- Fix DT binding review comments from Krzysztof Kozlowski:
  - Drop $nodename, "YAML devicetree binding" wording, property descriptions
  - Rename compatible string to mbedtee,tee
  - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
    rpc-r2t-ring -> r2t-ring
  - Add memory-region / memory-region-names to required
  - Simplify allOf constraints (drop redundant else-branch items)
  - Rewrite description to describe hardware/firmware, not the binding or driver
  - Drop all irrelevant platform nodes (gic, cpus, reserved-memory
    containers, reg addresses, riscv wrapper); the ARM example now
    uses bare interrupts (matching arm,sbsa-gwdt.yaml precedent)
    with only phandle-required stubs (imsic, t2r-ring, r2t-ring)
  - Add maxItems: 1 constraint to interrupts property (Sashiko AI review)

---

 .../bindings/firmware/mbedtee,tee.yaml        | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
new file mode 100644
index 0000000..62f2522
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mbedtee,tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MbedTEE Trusted Execution Environment
+
+maintainers:
+  - Xing Loong <xing.xl.loong@gmail.com>
+
+description: |
+  MbedTEE is a Trusted Execution Environment for embedded systems.
+  It communicates with the REE (Linux) via shared-memory ring
+  buffers using a fixed RPC protocol.
+
+  The REE and TEE CPUs sharing the RPC memory must be in a
+  hardware-coherent domain (same CPU cluster, coherent caches).
+
+  Two or three reserved-memory regions are required:
+
+    t2r-ring  ring buffer for TEE-to-REE notifications (all platforms)
+    t2r-shm   shared memory for TEE-to-REE RPC payloads (all platforms)
+    r2t-ring  ring buffer for REE-to-TEE command submissions (RISC-V only)
+
+  On ARM/AArch64 the TEE is invoked via SMC and signals the REE via
+  a GIC SPI edge interrupt.
+
+  On RISC-V the TEE signals the REE via IMSIC MSI; the REE submits
+  commands via r2t-ring that the TEE polls. No REE-to-TEE interrupt
+  is used. No SBI ecall is involved.
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
+    # Minimum across platforms (ARM: 2, RISC-V: 3), constrained by allOf below
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
+      required:
+        - interrupts
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
+    /* ARM TrustZone (SMC) */
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    firmware {
+      mbedtee {
+        compatible = "mbedtee,tee";
+        interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+        memory-region = <&mbedtee_t2r_ring>, <&mbedtee_t2r_shm>;
+        memory-region-names = "t2r-ring", "t2r-shm";
+      };
+    };
+
+    /* memory-region phandle targets */
+    mbedtee_t2r_ring: t2r-ring {};
+    mbedtee_t2r_shm: t2r-shm {};
+
+  - |
+    /* RISC-V IMSIC (ring-buffer polling REE->TEE, MSI TEE->REE) */
+
+    firmware {
+      mbedtee {
+        compatible = "mbedtee,tee";
+        msi-parent = <&imsic>;
+        memory-region = <&rv_t2r_ring>, <&rv_t2r_shm>,
+                        <&rv_r2t_ring>;
+        memory-region-names = "t2r-ring", "t2r-shm",
+                              "r2t-ring";
+      };
+    };
+
+    /* msi-parent phandle target */
+    imsic: imsic {
+      msi-controller;
+      #msi-cells = <0>;
+    };
+
+    /* memory-region phandle targets */
+    rv_t2r_ring: t2r-ring {};
+    rv_t2r_shm: t2r-shm {};
+    rv_r2t_ring: r2t-ring {};
-- 
2.43.0

