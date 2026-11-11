Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395309;
	b=Ynw6DdBnMUjUpwJrfumwuGFwsOJSEBI5Gg8kRrumxW93qXxng8sOa1xQ2mVAwN59MVJg
	 M1z12H1DFTsfumAFPgEuV9d0NK4YdgxpU9cX6g5ZgfzZujLezUFwaMUhFcACDJh77QiPI
	 KlnKlGzYFQzBwMu/6fz8+DT1qE+k2GqQv+cJA1IlyQ8HGqSLpwYXbL1q4zaquMLAcCoAG
	 9GVb7dn5zWkmJ0ehreWDaFv3OPPCE4uiEDfhgrM3r/4EkRoQNoPvIH1rcpAUFtQznAq+w
	 +p5Yli0qhG7PQpO9RuZj4BGGafQjgkwRlcyqNfm0UylKZSpGtTsjk8nyK8unDZbqF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VViZS2bb3pZ4FEd6v4FhPEGdFU0OwPB+qGWSqpoqEsA=;
	b=QfuZ1mDAtYI2Xj3asNEBKjbEgndPVIdIbo0sc3qTXNTn4Gg5GgpBhZzGpNMup2i7Ovl/
	 fT0md/ZRUDaP1rXm//9L863VJPQbB2yNkxk5JubwStnjyA6uaVgLJ2V0tnrp+Rbz7CrT7
	 K19p4rcI1yTuZ1Rh2YqRLACsvaZbAkbz0VvMC/EsoHmq8JLGjVJVm7llett20rBbf7UXA
	 G1rZij7mMwtcgLI9rHWAAYS+xKlLQNgw1qGc0vFV/9OSero0Ta/P4/vhpF3B+bNGtxYQP
	 FTxkbXPF8YaaY7RRt4zuGW1Ot6VG6BM2KL5lwtQxQbtAW/PWA5r2zX9wsg6zeh33jPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EpeXEmP0;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D360A382A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9D360A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EpeXEmP0
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso17285185e9.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395307; x=1795000107; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VViZS2bb3pZ4FEd6v4FhPEGdFU0OwPB+qGWSqpoqEsA=;
        b=EpeXEmP08j8JChiCWtRYUhcOpi8IdhmZmPs73BLe56ZxkjkEB83UseUavbpqJR9eLD
         0kXIW5q3JDOjEhGz7oOlJahhOx2aOfYqoMXpdtdjn4hauI0kd61D0c6KLgnB9USwlbt1
         m+DwnOib5UkiRbnOyVb446NeGUd2sYRiRE7KeQfwS4xmLTJ9GB/GprAUk9jG12yw5MEh
         9yfRgOPb/EDF9bI5j2du3/vpkQMYg3WfX50/5XtY3I+KV3bi0vOvclmevzAwG9VPy38l
         hqw8JvrE4nWyTBq/KP06IMADNRz5jX/9eSuc1tpoZoTD1AmzTQgmpq/3LAbZF+mdhn/f
         pLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395307; x=1795000107;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VViZS2bb3pZ4FEd6v4FhPEGdFU0OwPB+qGWSqpoqEsA=;
        b=NjEhuDWQDfl+sSKaSJyHkTyce/Tqe1FZaaHBilbeeUBnAcpmynfsQbUmK9BH1Oy64r
         q5d8w5ZNgkCudVQxgujS4zvqA3vadJPbck+MvQaoG86qzDBqQ8vmvi0K02ja6rkkAuoy
         dMaq7ei8U2Q596hbkYpdbzRZpPAqOFe9Odn3HBZPCYIFUNRKaxEQLb2JLl3mVl/FA8Q+
         4gwPSUd++AcMGoK6eCbBulerIEvvai+icx1Gg9u1eGhB3fS/tKolPbMUatWbsDsMf+tw
         lNyEfDaZwz0poS7Ml2X/AbGujrew4YARuz88jCcerAJYozB2Gy8o7kLEUtfNgaVKpQoH
         alNA==
X-Forwarded-Encrypted: i=1; AL+hErHPaGgDL10lJxoOvt3n+DQQm0J7ZSJWgx4DJ/B+2+nJutnIhJyyu2GqLenXfD8fIRP+zclOWEYFZzQq@vger.kernel.org
X-Gm-Message-State: APuU4Z9ROvXTA8facrDwUKbL8vo7wGOQz8kNPvkPKXcfFxKag8lq7e1R
	c61toQy0JzU/QtHtwHImFMZDNV8WwoU14Y6N82ZxleuUuf+yoAVpzIB3XnU2Dk4erzlZcX28nof
	kXx9yS5Gs093WLl3/lb1w8g==
X-Received: from wmgb22.prod.google.com ([2002:a05:600c:1516:b0:4b8:b187:f0cd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b83:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4ba0935dbfcmr39556605e9.10.1794395307014;
 Wed, 11 Nov 2026 03:08:27 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:34 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-5-vdonnefort@google.com>
Subject: [PATCH v3 4/8] dt-bindings: reserved-memory: Add lendable-dma-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add bindings for the "lendable-dma-pool" reserved-memory CMA pool, used
to dynamically unmap pages from the kernel direct map before lending
them to a secure world.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../reserved-memory/lendable-dma-pool.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml
new file mode 100644
index 000000000000..0b924d941b4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/lendable-dma-pool.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: /reserved-memory Lendable DMA Pool
+
+maintainers:
+  - Vincent Donnefort <vdonnefort@google.com>
+
+description: |
+  This indicates a region of memory meant to be used as a pool of DMA buffers
+  that can be dynamically unmapped from the kernel direct map (e.g. before
+  lending to a secure world such as via Arm FF-A).
+
+  On architectures where the direct map cannot be arbitrarily modified at
+  runtime (such as arm64 without BBML3 or without rodata=full), the operating
+  system ensures this pool is mapped using last-level (PTE) page table entries.
+
+  The reusable property must be set, and no-map must not be set.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: lendable-dma-pool
+
+  linux,cma-default:
+    type: boolean
+    description: >
+      If this property is present, then Linux will use the region for
+      the default pool of the contiguous memory allocator.
+
+  no-map: false
+
+required:
+  - compatible
+  - reusable
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        linux,cma {
+            compatible = "lendable-dma-pool";
+            reusable;
+            size = <0x4000000>;
+            alignment = <0x200000>;
+            linux,cma-default;
+        };
+    };
-- 
2.56.0.542.g3ef89b7020-goog

