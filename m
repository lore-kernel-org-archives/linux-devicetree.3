Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2B345CDD
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786576573; cv=none; b=uxABRJsaAKtN9JGoq6PazHNRMHdqXSvFXhxllbRxlVlATM4Q/0gydAwg6UwJIU//HjFXGWtycM8TgV9WjNIbPXPphoEFet8bxED3gnV0hw5YZDUegXyiRjE7WnvFoWsa+3yIB6Yd8YUmlVYttk5mEd3oZxXxY218Cyny1LrfDl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786576573; c=relaxed/simple;
	bh=28nvSmQhuzxo9NdZCT2MmQHIAuybjTPSR4bEVsU9NFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=szu53fqUAMNzn9VmhiNC0mgYtAdo04G5aXyUo+5qbhNwEGWcUqM+P6RlmUX5Y4ZSDO+CcBetrUjUlrSO9lpi2QPiNXGcr/7HaSj6r/q7zOR0ZI09entOOwJybyL1ZwzBrOk9P1izej5WJZBQg9CfVF8fP5pHkHjELA3VZqylfJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZQl7/Uu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZQl7/Uu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-384caf7b168so239870a91.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 16:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786576572; x=1787181372; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m/9HmuLc9TopZ/qMDkJCjv1g/q257z7cSIT+DhGXJXg=;
        b=qZQl7/UuXELJy7Oc5Pr084SDosKlzQC0E4IXOlfBTn5PPXa4VM07ro9y/jfPPe4t+H
         rreZs20aBWU3FV99p8ecQa55zmzaK0Fe1TbRosHpOnci3RyG7O26xwn0jyeUe+//UsJ2
         KEy9uweWbTsv330rxtp9coFkh7hS9UfpklPX6K/at6Ryjsdy/byicDJlnedLNdRozUlI
         MFXvx0sw+KAt+MRgJsIfhxC09MgvIOw4nVNwLTowlHgxZysoYAk1Wwe38hpnSDhXbc03
         ClVYPlEsgP6udolDu0gqXkGKwnUPrOmIg/hHJOqXEtRdbCUgiig52C+sIxERw1525IQ/
         MQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576572; x=1787181372;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m/9HmuLc9TopZ/qMDkJCjv1g/q257z7cSIT+DhGXJXg=;
        b=ns/ThMKGZyofUlJmSu+wHy9E5vFmgIR0OtV8eVH+bkJvVO5/axKoqpVd1KPTOjP+D7
         RODAKxVR6zilKBecE+ltIEpjTL/E9nR9PsRAE6Q2aG7u04GELq7r9SXiTx2WwHK6UbzX
         xhfxEoiLKDJWwZjm5//p1bVDeInu9QjNtIhSWhzMWOKLjRCMN47ayeGkJPz8z+JXF7JO
         QKiiDF50IUKiD4p3Ke1VrfoqwURTEt8Leo6XuaqplrxOfQg+ROef2EBR4tOmBZMP+y7L
         2aRL52lnbuVmP+dDEWIPxYmuDAvX6YPCCqXvOoWYDcJbuqP39GAWpiQoD+6a+prVoY6d
         N+sA==
X-Forwarded-Encrypted: i=1; AHgh+Rrb5I5MdKmG7bnDTuEI/7zegnI93T1H9GlUY1qpA/N6sjmf+/kb7GupxaFmbgZfzW2CNXRn0EkPmVqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrblzLKuKqiNSiBqo2fd1KOFOG6papUOUu+iU0i/oKSn3l+OyK
	6gfo+XFb3XAPXbUzhhp5ZeI0NhCccqviShC8DUAj2JpJEYChNsoNq2oO
X-Gm-Gg: AR+sD1004TYkRRaD12VQ64PlTebIJIDmd8adQfimp3uE3ZcTyywC1mGWVC6JS/tScGJ
	TXc4ENqzUyT/ifk051echkhtqNb8FSKFJyCEFUlJMwqZXM4c54MZZ6+Ebx1RS2OgeHcSQZ4a9oU
	UVGq/9kcmfMZWT2ZGgBTR3p8RG6zuFnVoocS0aQx9zxgrbapi+wOpBFYZsW3P5d6aKAfRz8vM8k
	lfgNrwsKBehkkum5tOOof5ej8h6qOHNGDialukkuNHDB50W+o6YeoQMcdZhUZdDwODfyf7hKlYp
	18HGF/iq5QJZWNkjlxgpn6+/c1GT2iSfhvbOXs65RjAz6DvsJKVpc1r1VjBzWShvonaKdIIUqea
	vwwku4KezL74FAZCPxFQLQkVZhrNvf7hl6XYLKoT3/mrZDPK+WUY4vpiOsAndjwogF62QhthwkS
	uThs4OOpf7CMhacAwyrpNTWz0lgqgWITbq5uyI2YjF69qPYzgHuO22fSdndzjkM5Uk5vOmzOQ=
X-Received: by 2002:a17:90b:4fc2:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-3932333a526mr441001a91.3.1786576571778;
        Wed, 12 Aug 2026 16:16:11 -0700 (PDT)
Received: from [10.170.23.252] ([2409:40c2:5017:a6a2:eb70:cb11:a19e:bd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412da6b816sm1605799c88.14.2026.08.12.16.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:16:11 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 13 Aug 2026 04:45:52 +0530
Subject: [PATCH] media: dt-bindings: ti,da850-vpif: Convert to dt-schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ti-da850-vpif-v1-1-7779b1e4d6af@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtQo9SuEi2kxpqNiYYE0d2Tl
 m/x/wOFMlOBSTyQqXLhMzaoTsB6+LgT8tYMWupRWtXjxbh5O0isiQNKp401XpneOGhNyhT4/n/
 z8r4f4FE2WV8AAAA=
X-Change-ID: 20260813-ti-da850-vpif-092787a17379
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786576561; l=4771;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=28nvSmQhuzxo9NdZCT2MmQHIAuybjTPSR4bEVsU9NFQ=;
 b=7+ZyVfQrgV0TkrY8t7hVTVwGGkFNufrRx+GzIeyB9xomiPvZyYeNssEFYXaJspSWGyd8VBPav
 ew9cYwDwsxfCttRMim8Yg8v+ZqHgo3BVBl8bDWOndP+cnojxtih4mVx
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments DA850/AM18x Video Port Interface (VPIF)
device tree binding from text format to YAML dt-schema.
Add power-domains property missing from text.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/media/ti,da850-vpif.yaml   | 168 +++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif.yaml b/Documentation/devicetree/bindings/media/ti,da850-vpif.yaml
new file mode 100644
index 000000000000..77de70be807a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,da850-vpif.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,da850-vpif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DA850/AM18x Video Port Interface (VPIF)
+
+maintainers:
+  - Lad, Prabhakar <prabhakar.csengg@gmail.com>
+
+description:
+  The Video Port Interface (VPIF) is the primary component for video capture
+  and display on the DA850/AM18x family of TI DaVinci/Sitara SoCs.
+
+  TI Document reference:- SPRUH82C, Chapter 35
+  https://www.ti.com/lit/pdf/spruh82
+
+properties:
+  compatible:
+    const: ti,da850-vpif
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      VPIF port when the bus is configured as a single 16-bit input
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            enum: [8, 16]
+
+patternProperties:
+  ^port@[0-1]$:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      VPIF has a 16-bit parallel bus input, supporting 2 8-bit channels or a
+      single 16-bit channel. It should contain one or two port child nodes
+      with child 'endpoint' node. If there are two ports then port@0 must
+      describe the input and port@1 output channels.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            enum: [8, 16]
+
+      endpoint@0:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+        description:
+          First 8-bit channel using the lower data lines [7:0].
+
+        properties:
+          bus-width:
+            const: 8
+
+          data-shift:
+            const: 0
+
+      endpoint@1:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+        description:
+          Second 8-bit channel using the upper data lines [15:8].
+
+        properties:
+          bus-width:
+            const: 8
+
+          data-shift:
+            const: 8
+
+    anyOf:
+      - properties:
+          endpoint@0: false
+          endpoint@1: false
+      - properties:
+          endpoint: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+oneOf:
+  - properties:
+      port@0: false
+      port@1: false
+  - properties:
+      port: false
+
+additionalProperties: false
+
+examples:
+  - |
+    vpif@217000 {
+        compatible = "ti,da850-vpif";
+        reg = <0x217000 0x1000>;
+        interrupts = <92>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            vpif_input_ch0: endpoint@0 {
+                reg = <0>;
+                bus-width = <8>;
+                remote-endpoint = <&composite_in>;
+            };
+
+            vpif_input_ch1: endpoint@1 {
+                reg = <1>;
+                bus-width = <8>;
+                data-shift = <8>;
+            };
+        };
+
+        port@1 {
+            reg = <1>;
+
+            vpif_output_ch0: endpoint {
+                bus-width = <8>;
+                remote-endpoint = <&composite_out>;
+            };
+        };
+    };
+
+  - |
+    vpif@217000 {
+        compatible = "ti,da850-vpif";
+        reg = <0x217000 0x1000>;
+        interrupts = <92>;
+
+        port {
+            vpif_ch0: endpoint {
+                bus-width = <16>;
+            };
+        };
+    };

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260813-ti-da850-vpif-092787a17379

Best regards,
-- 
Bhargav

