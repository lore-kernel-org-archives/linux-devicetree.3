Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65481375F81
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307354; cv=none; b=CkI1dLl+m73LLlRisxWslqQrN0N1mBctAbxHe1k4iyHhS1/au2Y8yF9g2HEElI/g3zBpbh8fLIRAqcv+yl2WZHnvYvNjE9XUcdK9KznW0yOjBi95oKupIhlgbVeYpEbNTOYrzRPALIdNTEjj44g6/tBrPLw5G4zDFEuun+A7AlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307354; c=relaxed/simple;
	bh=f16CR4wsF11AJHtigJu/UDcYZkiDz9qNNN8F9f7jf/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VE+UqFkWXm+SrmL+wrq6I1zi2sywFA8U8+d+4yokPsc2s4egigIvyURrAeoGLNsWid75B2jSEsdyicy55ft1y9yKI/YEzQoa8QPX2vNHjyvpS+eFzFbskAfTS0sJ+poWGVUbQmDBQtoNGwRZV9xQs77Z21c8tdRaRMTtCHVR19Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXtc1Yh7; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXtc1Yh7"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-448de0cc236so724946fac.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307346; x=1786912146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4H5+HCVFStmSzg+aAxnJnPK9AusNX/B0D2xVSvE2xvw=;
        b=cXtc1Yh7QaF6Ne7a9nnCTZCxgkPxi21aLGeev/dqeKF9FxIePJgcCcNf+yYomelN1E
         10kpBR0mz01hyi1EnnB2uNNwtwwJmQAYGnOWhBA5Axb80E+C6KbmswLJ1wElwhFy1lbJ
         kYL+8g2SnAqXYs1MIZD+3mS2pbiaeGhTIryknVJlMDJXpIOpu0qUkUzUp8gc/4/tqE8g
         8dCNVvU+xGWMmf60er79UBej3F0+LyZpT6oqng2jbPWb+PGwlytGHIgtcBuhwcwlOTyq
         6MGffAZ7yR2ar+84GntAStxudcV2LQ+UoC/EtQvV2yroftZmkrs9yHLVkKaRV8jN3bFe
         QeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307346; x=1786912146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4H5+HCVFStmSzg+aAxnJnPK9AusNX/B0D2xVSvE2xvw=;
        b=n7fHaGrpLm/Rjb1LjP4dzWv9apWllRs6RBxFnBYd9duOgnGvW7bG/QeThhsmMrxC37
         Pr0okk+lRrVSpv5huCcvR+3Md3CFn9f+lxgDyod68E1HkwoVdQwL9RHV8yRhvRUxnhIs
         59rpmhtDvoAmxrUuP3ha1oaFfYXvTwTAq4gEu413NMRMAyCorlPiV5BW9FcNPPgqLKE/
         G+vYgZ0vOY+2KET2nFuKLxgmRB74pIlZ8+fl8xPugBZy113FPDPrdNTdzrBztSezxKy9
         ycSxxIAbW+0c9U7vJbMPlBJ/Qn7rzda6A7B+4qsmJN9XauWvtqxs4Lz+8CcVCiYdqg0d
         641A==
X-Forwarded-Encrypted: i=1; AHgh+Rrsl+I90aGbiKW8gpUco8uQOQneJ+XvgCNA9WTpxxFSDYGZbBpOT3U0/mt7oXILcqiGLvhnkLtsSzyK@vger.kernel.org
X-Gm-Message-State: AOJu0YxH4BT85Nrz0QOSisDGJcgU/zNHKJj94JWyM4UW/f/PeHifCWPH
	DT4Bhg34WL55v1O5bRgeJ0v7/U8NxiWIaziL63XKVNqC6Uen9/Tu5YKh
X-Gm-Gg: AR+sD10RpBPjx49q39ghaqrhBx2NbyPgb3J9FDTOrmDPdLXpFBNib3ixRpG6qpmP5ex
	gyXgapcHQoO1kyfpcp4MnDP3Cqs99CqNJHj/2KXPPOzC5XeQZCA83PavnUctXOharHO4UvZK8PO
	c3FEybeRl3jLESr+eKugnfwx4EUhLd8J22MGBbz77pMzlc9g2U8I7UxTG2iU3YfmNY1KBuyaOtS
	0T4ARYWaRdHmFKgCLZmPHzqosHqTP+1jKmrssba12G05PXKaEj0LihLNa55eAH+at7lBt2kYrLp
	L9rEzxYy/9OYdNg22vchq4utjnpWUfVhGIxzKRfH3kJgqZutjnGzb7pflaS+yNvS5Jauk/iFavx
	X131sTjQ5dBgIjErKQWrSqyliCDMJKloOeYY506gVQNdYtRgkS4k4jQaTiNgKoh2EwAmvUqVOGe
	R0m8Lje1f1q6bp0xOOxJ2qmuPxqNJ1LZEEyyusYBvczOEeLn1AZiTd55bb8TrUfeCgCtV2E65gf
	ZK437ghcjH83TH+YBNqGMsw/7y2JBNyimh41BANqLOJBdI10D42+O5FEu8i5Og3sjjAqZd0lH8e
	G9Z8KgPlXID7Avndh51Hrv07E406Soa1HNVi4NqRobhBSUKQTaRb9Zf3FeAoHfA648RZEHDXWwq
	n1Zr7Pf6v9zoDCf0zAbz2sMPArE8=
X-Received: by 2002:a05:6871:79c:b0:451:ca3d:4b0d with SMTP id 586e51a60fabf-4599ebf1927mr18411696fac.9.1786307346168;
        Sun, 09 Aug 2026 13:29:06 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f19fd31csm6975362fac.1.2026.08.09.13.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:29:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 09 Aug 2026 14:28:34 -0600
Subject: [PATCH net-next v5 4/5] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-submit-acx00-of-dynamic-v1-v5-4-bfa1f8518b28@gmail.com>
References: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
In-Reply-To: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2

The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
report the same Clause 22 identifier and use the same link-side register
layout. Their package control paths differ: AC200 uses registers in its
I2C MFD, while the AC300 control range is at a second Clause 22 address
fixed at 16 plus the link address.

Describe both variants as Ethernet PHY packages. The package reg value is
the link PHY base address and the child supplies the documented PHY ID,
because the identification registers cannot be read until package setup
has completed. The AC300 driver reaches its control range with the PHY
package offset helpers. The AC200 package instead references its MFD.

Give fixed hardware variant-specific compatibles. Also provide an ACx00
compatible for systems which can contain either package, with one packed
NVMEM field containing calibration in bits 3 through 0, the AC300 selector
in bit 8 and its low-calibration selector in bit 9. Such a description
contains the potential resources for both backends; the driver consumes
only those selected by the configuration field.

Describe the package clock, supply and optional xMII receive-clock
inversion needed by some integrations. A fixed AC200 package may omit the
NVMEM field and use its internal calibration copy. Limit AC300-capable link
addresses to 0 through 7 so the control address remains in the documented
range 16 through 23.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 207 +++++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
new file mode 100644
index 000000000000..ae0c5e980c39
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
@@ -0,0 +1,207 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,acx00-ephy-package.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 and AC300 Ethernet PHY packages
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 and AC300 contain compatible Fast Ethernet PHY blocks which report
+  the same Clause 22 PHY ID and use the same link-side register layout. The
+  package control paths differ. AC200 control registers are part of an I2C MFD,
+  while AC300 control registers occupy a second Clause 22 address fixed at 16
+  plus the link PHY address.
+
+  Systems with a known package use the corresponding AC200 or AC300 compatible.
+  Systems which can contain either package use the ACx00 compatible and a
+  packed NVMEM configuration field to select the backend at runtime.
+
+  The link PHY cannot report its ID until the package control sequence has
+  completed, so its child node supplies the documented PHY ID. The package and
+  child use the same base address. The AC200 driver programs that address into
+  the package, while the AC300 driver derives its control address from it.
+
+select:
+  properties:
+    compatible:
+      enum:
+        - x-powers,ac200-ephy-package
+        - x-powers,ac300-ephy-package
+        - x-powers,acx00-ephy-package
+  required:
+    - compatible
+
+properties:
+  compatible:
+    enum:
+      - x-powers,ac200-ephy-package
+      - x-powers,ac300-ephy-package
+      - x-powers,acx00-ephy-package
+
+  reg:
+    maximum: 31
+
+  clocks:
+    maxItems: 1
+    description:
+      AC300 input clock, running at 24, 25, or 27 MHz. The AC200 input clock
+      belongs to the referenced AC200 MFD instead.
+
+  vcc-supply:
+    description:
+      3.3 V package supply. This is connected to EPHY_VCC on AC200 and VCC1
+      on AC300.
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Packed EPHY configuration field. Bits 3 through 0 contain the analog
+      calibration code, bits 7 through 4 are reserved, bit 8 selects AC300
+      when set and AC200 when clear, and bit 9 requests the AC300
+      low-calibration tuning sequence. A fixed AC200 package may provide only
+      the low calibration bits or omit the cell and use its internal eFuse
+      copy instead.
+
+  nvmem-cell-names:
+    const: configuration
+
+  x-powers,ac200:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AC200 MFD containing this Ethernet PHY
+
+  x-powers,xmii-rx-clock-inverted:
+    type: boolean
+    description:
+      Invert the xMII receive clock inside the PHY. This is required by some
+      SoC integrations, including the Allwinner H6 AC200 connection.
+
+patternProperties:
+  ^ethernet-phy@[a-f0-9]+$:
+    $ref: ethernet-phy.yaml#
+    properties:
+      compatible:
+        const: ethernet-phy-id0044.1400
+    required:
+      - compatible
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - vcc-supply
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+allOf:
+  - $ref: ethernet-phy-package.yaml#
+  - if:
+      properties:
+        compatible:
+          const: x-powers,ac200-ephy-package
+    then:
+      properties:
+        clocks: false
+      required:
+        - x-powers,ac200
+  - if:
+      properties:
+        compatible:
+          const: x-powers,ac300-ephy-package
+    then:
+      properties:
+        reg:
+          maximum: 7
+        x-powers,ac200: false
+      required:
+        - clocks
+        - nvmem-cells
+        - nvmem-cell-names
+  - if:
+      properties:
+        compatible:
+          const: x-powers,acx00-ephy-package
+    then:
+      properties:
+        reg:
+          maximum: 7
+      required:
+        - clocks
+        - nvmem-cells
+        - nvmem-cell-names
+        - x-powers,ac200
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@0 {
+            compatible = "x-powers,acx00-ephy-package";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            clocks = <&pwm 5>;
+            vcc-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_configuration>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac200 = <&ac200>;
+
+            ethernet-phy@0 {
+                compatible = "ethernet-phy-id0044.1400";
+                reg = <0>;
+            };
+        };
+    };
+
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@0 {
+            compatible = "x-powers,ac300-ephy-package";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            clocks = <&pwm 5>;
+            vcc-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_configuration>;
+            nvmem-cell-names = "configuration";
+
+            ethernet-phy@0 {
+                compatible = "ethernet-phy-id0044.1400";
+                reg = <0>;
+            };
+        };
+    };
+
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@1 {
+            compatible = "x-powers,ac200-ephy-package";
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            vcc-supply = <&reg_3v3>;
+            x-powers,ac200 = <&ac200>;
+            nvmem-cells = <&ephy_configuration>;
+            nvmem-cell-names = "configuration";
+
+            ethernet-phy@1 {
+                compatible = "ethernet-phy-id0044.1400";
+                reg = <1>;
+            };
+        };
+    };
+...

-- 
2.53.0

