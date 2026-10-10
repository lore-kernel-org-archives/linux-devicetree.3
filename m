Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698B24A7C8C
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637251; cv=none; b=HVC3E4Rvy2b5bxPFIT0OBo+F40Ck9gJkkCLgH817an1ckIyL8h5CVKnUEn7NT1lB3wAnkWsuYGQUTJydKIAIRzL9sEySZmuODJEb6TcjHmYU5TzkMorQBCJcHvANh/O3hxkZiRl+HJqGoghOjbmcUtb7O+M8yYDckPE5KzWdMrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637251; c=relaxed/simple;
	bh=8cE+kRigrC2rLbTtNcE4tzjW4qt6M+Ijxp2hlZozUug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cd7VbhZpjZXiKKj+gKfKVOmon3+N5UfF/W4pQG5nCSXQv3eUR1fDLgqWjzAgZK0xo9aiU1+Y2g5jksh0PU8VM9xemw3ijeiF9xv+gSwzvvYVkPK3iiMBoVPbzLsrUPuRV9Wn92gjvg6uBt9JUPTFqglt2E/Jr1AIzhOw1QPWwwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6wvYjMq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6wvYjMq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so4928355e9.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637245; x=1792242045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoroDu6xICaIQCB3Y6XVwmspeLrCWXpr98G9YRTCm5U=;
        b=a6wvYjMqGOOiJx9fOCfWsGphAcSj2W68dynQ9WlLrvExRGKNfuMPgI+7rV5dmQw1eG
         WTVbFGiVLDn3k4l49u+HXpZ/Pxgp+RF+hWlWeb+QdMWFT4CkToXerOHa8K1kQ3lMypIR
         /AX2zhtMs4vXlGeVklOyQKqPCKAzvKnzBA1fDT0FZaJswcQ/Ps553F3VYeDs4z3dTQC/
         lO2nEX2y+ea1eArLqSuXBV+UdqptDY+s6AiYzwSr4m7GHyjhUYz5JJZypib9q0YXiESs
         IlTomIA47dXHwoT07svtdIQFNjF7x4naez6X9dsJd4xi/hqiUVjyfCayl30ESCvW9XfZ
         +weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637245; x=1792242045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoroDu6xICaIQCB3Y6XVwmspeLrCWXpr98G9YRTCm5U=;
        b=kjnflU9sKfbuxgAgb2Tc4jZPZetLmg6u3XqReY2X29/CZ6+xAjxMwo78kNAxj0SuQr
         X7Xu91cN/B9vmhtykV4HPk5UsyToykXJ9L7GjkosfcNGw6JMhIhYVXALjT3NMPZG7t2r
         DlYLv6DcZb6+xm8TcfqT5nCBLRsPXz8vmfOPNiIqg7KG12Ysc3Djr9yO2NW3IMM4NNDT
         bZA0eHGIxHavl1VEDqDP+P9w8ioqyHA3uPZuwJ7Tgwf6zVGY3VQYzHsd8P/rSQktoGEu
         bEBibShePVq8Xmy90G+kZFL3X0hhgc3AkxfreIdhJnvcZLECPJkbG1nOk3kStg/zcZES
         +4dA==
X-Gm-Message-State: AFq9FYJ9ebSXgI5wOse9IUFBXlrdOJXqo7OrXKQZ3M6Q2cvf4gpNuO7/
	iH/SgHtRoUvWARNJoKi6m97Ig4CWPiAq4c/Cx/tDRbsccTPcbdEqLDHG
X-Gm-Gg: AYBFou0b7prbc/+NRwt9ub7ohjb6KytJBbytM1ynpayeh8rrct38Vay6CcLk7Vbuinj
	LiOZbjEeqcXqmFGVTgLi8n4yyNUgIjhGUDfcWXg3iHGfbudHi1CyQtsLUrUV+qihvggd8oEZD/n
	xq2/oOnsjSo4BXXFBBzlAb9VrWjoVlwoPyXxnMFUgYA3YpM0hI9IbP+sJKE20o2Ywr9ib8HanNj
	uo42Co8HJERasHAvd1lRzih9b8ab4AI4RESHTyKiNaQN6Tejn3sSF1aCJHLgLrpmvIaaK/2CQ8/
	GELQeqITgXNQfWxSE4+NGqrmu2jV2zc78W3ihbGBOVD7qE+sU8pK7QCPXhP7TvsAPl/ljIIU3U8
	PGDlOZyqASRhkk0Za2WIgXhOyJq3RBA3jBxLWH9d6ET3l5Gs/5i9s/Ke/ckC5Whe/aZW+tTlu7Y
	IHGmLt46KQQsoJsGJZ+IMBsur9n49mje0p1iKb7dhOJj3PHIH8RRidcArErHIvhvKbHf3gIiNSc
	KTlCnYonlDg1aeA+Pst30b/kSYhfcavva0TlU21lH7vz00PGZHeSJZoRlFFP+3sVkAs5yCEBKmy
	Y+G/GTcAGxPp0jXxDCglG5N8PXEOEFfXPrJaQJEMh49IZMW6qpWFi1bcGmJ0ug==
X-Received: by 2002:a05:600c:8b06:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a18e4e0963mr91375015e9.34.1791637245361;
        Sat, 10 Oct 2026 06:00:45 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet switch
Date: Sat, 10 Oct 2026 13:59:55 +0100
Message-ID: <20261010130024.177503-18-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the switch, receive interrupt and per-port PHY modes and MAC
addresses.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-gmac.yaml      | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
new file mode 100644
index 0000000000..56c81aa6e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/zte,zx279128s-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s Ethernet switch
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has a five-port gigabit Ethernet switch with a traffic
+  manager, a buffer manager and a DMA engine that connects it to the CPU.
+  Each port is described by a child node of ethernet-ports and becomes its
+  own network interface, with the MAC address given in that node.
+
+properties:
+  compatible:
+    const: zte,zx279128s-gmac
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: The traffic manager's interrupt, which signals frames
+      received for the CPU.
+
+  ethernet-ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^port@[0-4]$":
+        type: object
+        $ref: /schemas/net/ethernet-controller.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description: Switch port number
+            maximum: 4
+
+          label: true
+
+          phy-handle: true
+
+          phy-mode:
+            description: internal for the SoC's own PHYs of ports 0-3, gmii
+              for an external PHY.
+            enum: [gmii, internal]
+
+        required:
+          - reg
+          - phy-handle
+          - phy-mode
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ethernet-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet@92000000 {
+        compatible = "zte,zx279128s-gmac";
+        reg = <0x92000000 0x400000>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-handle = <&phy10>;
+                phy-mode = "internal";
+                nvmem-cells = <&macaddr 0>;
+                nvmem-cell-names = "mac-address";
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-handle = <&phy8>;
+                phy-mode = "gmii";
+                nvmem-cells = <&macaddr 1>;
+                nvmem-cell-names = "mac-address";
+            };
+        };
+    };
-- 
2.55.0

