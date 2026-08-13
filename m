Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA74749C2
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658064; cv=none; b=Q+az/WnmljQ4R95FPHulQrDAEQkwBFxDEBR/r1oV98LP4cNRinqPxrZlnYzFaPF00l++qE4krq5zOL+ihBbzJkf/uX/vE7Ur19PKfKivwLe/9Ig0kdPA7eVKQDlVWqVPuzRpkPoFz04TAMfRrmrk3lERTjg+B3n+c4bBds5bY2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658064; c=relaxed/simple;
	bh=K2e6CTn1GkfGdLspHg1NcJnZDZzj2Bxvj5lfPzA/Iro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tP79EMnfdDcV2c7ReC3e5uOYPNYwHSoJDkzP6Osozl93kR0RfamaO5fzcpbAXOKmX28DQ47QYHo2LUftZVxi9r8IRMAN6zOzYQX/NYEtQIkhCGXFDRnwLbj2IRAntDVh05gZxAq6W2GACG5NNZM2ODi7CweC9zye1jCWjsT1XFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8GBEt8o; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8GBEt8o"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4a416619cb2so200843b6e.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786658061; x=1787262861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=am9igonUTJ1uS9VlVxbC/D+A7OTAqghtpVanYEf26jQ=;
        b=J8GBEt8oqA6/0RG5dCE3qyqqi3ReTABFotcWSfbC9vPcUt5+HaFNClgn0/C378MOml
         JS1c40bZpAScevgFznZM6UzSDL17uDHw/hQwDKDhFeBZ0i4JxvHT379WwdtTAZ5JNuug
         l6gNipB72CCX0cetJV4LXC3SGZQo1ogDdBdXRlAe+X2NJPlhZYTtFwJX6V33GoazvnvZ
         ffNUj/+efZx+S5Ek5Lis5mhCyFP3fjgwKf2X1/+j3g2r4RzPqxSQyXjkIF/vYk2Bhn4Q
         DfC/2FM0k6zkgZAh1D4cysMuYmWCjqNmOkBwn198AkiI6GRSEFu5jKSuMA2VtL0DTHGD
         u50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786658061; x=1787262861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=am9igonUTJ1uS9VlVxbC/D+A7OTAqghtpVanYEf26jQ=;
        b=jYuCIu4X8yjTkhZuwd2joALlLHdwWLODdf9W3FAWiRUzOXsqxCXikZ5R2uPW1UdwCx
         k098N3P1CkMBLm/9Ik5HjW06XER+eZPDLxljutteq11T+uCvsHzkuHAC95CRiTGC8qgY
         QN3ZQ/b4mUeEbvlIaBrSNVK3sZK6MX7HAwn842GiCfKDpAGZmpqdQiwx0FN3gjmxV/Fq
         +YAB+yidYwY95vPA65+bzdKOmA7RWv8Obd+Ftu0BDkZb09ZwT0wOgU9CMLnbBMF/sg3b
         vZNwORyOSTILJre1fZX+t/Jeq+fCqwXXhjEIxeSbQ0GECT4i6gN8Aj7JK6Lfsghogw0D
         JZzA==
X-Forwarded-Encrypted: i=1; AHgh+RqmtN7ieeBLL8OuMuv6UnHkIubuQdOaheSz0TGf5QZno/w+o0fIa9gj6w/BkKQ0kVRvsAEvLKWQWYaV@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbMe3r71TnsYxO95qnb30hVEVdquUvbCEjEVFjmfWmbjv8JRo
	OyEhl04nqCW1RFcmYGLTBcr+i3KS88JB+euz35o7d4UlK20ZGYgFopEL
X-Gm-Gg: AR+sD13AFmZDM0pDXV7hPJ1wJr+0XMTemQYo4d0s1xe9SkzoWst77IRY3tuYhsrIJpq
	datMGz7dYNNrCSeBU9WdlkhFpVYf05Di+bUxCraNJJ3PemXZ8h/XhDkfgvvIC8/iZ250sI83M2t
	d57OY4rL+elO0DSxb0QYqhesP8Q7UotPWcbgo6H5y1ohs3VjZuaZckxP7ybsxOP4O7xfTImvvjL
	Vch1ktDRHJW1+3zSuhsLFgakXDOolCnFLMUPJcNZyvWR2nz1NStKYlSEINrlvBcv6YNFTKPWF36
	zDj/FQOlOgkEIzgKoOnrD8qaRewV5kSk7K4LX3qBjlHTl19I2AoarXySNUecfMjZXGE8OG5lhko
	sLNEnlSbKteZPjc3dMdXw8oEd9GRCtizfl17mblqtFgmsM3/RchbN+5Y/yr87KoLmNhn5YONlon
	Ur/xhtI4rc3db/Q8NQCzMWA8a43fCCE0qmpFYZ2nrB9GsSkUmbPnZVpI7Wic0iXkEij14PC125p
	E335QWjQytk8j4lq+KbcoyaJkSeQ1H/pvk5jyP4Gzli7Ht1MTWIPWoAZrwrJu0G3ATPA1G0F4+l
	YmVrBctVgDr3Rech8BQM3RzAF6zRVYvjPtwUfeMRVQ89BPcaXPFHkseJYmhII6okSSeht009ycl
	ZKulR6YOQpz2SKCsP
X-Received: by 2002:a05:6808:3502:b0:4a4:adaf:5570 with SMTP id 5614622812f47-4b2412a4b5fmr1083414b6e.4.1786658060785;
        Thu, 13 Aug 2026 14:54:20 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b22ccbcca5sm2813956b6e.2.2026.08.13.14.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 14:54:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Aug 2026 15:53:43 -0600
Subject: [PATCH net-next v8 1/2] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-submit-acx00-of-dynamic-v1-v8-1-d2f1c52e87b4@gmail.com>
References: <20260813-submit-acx00-of-dynamic-v1-v8-0-d2f1c52e87b4@gmail.com>
In-Reply-To: <20260813-submit-acx00-of-dynamic-v1-v8-0-d2f1c52e87b4@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 linux-sunxi@lists.linux.dev, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
report the same Clause 22 identifier and use the same link-side register
layout. Their package control paths differ: AC200 control registers are
accessed through the I2C register interface of the companion IC, while
the AC300 control range is at a second Clause 22 address fixed at 16 plus
the link address.

Describe both variants as Ethernet PHY packages. The package reg value is
the link PHY base address and the child supplies the documented PHY ID,
because the identification registers cannot be read until package setup
has completed. The AC300 driver reaches its control range with the PHY
package offset helpers. The AC200 package instead references the
companion IC whose I2C interface provides access to the package controls.

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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
new file mode 100644
index 000000000000..afe57bd163dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
@@ -0,0 +1,154 @@
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
+  package control paths differ. AC200 package control registers are accessed
+  through the companion IC's I2C register interface, while AC300 control
+  registers occupy a second Clause 22 address fixed at 16 plus the link PHY
+  address.
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
+    description: AC300 input clock, running at 24, 25, or 27 MHz
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
+    description:
+      Phandle to the AC200 companion IC providing I2C access to the package
+      control registers used to power and configure the Ethernet PHY.
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
+...

-- 
2.53.0

