Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EBD3A3E91
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 04:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078322; cv=none; b=unkqH5DMXAX90DJlMpYCT3wQ5qSWsSerRC5eHkop83c2yAa/GmLvuY3/eC/hK5p7bdo211JB4VdiOlXeLsINWIVdKErj+BUVfH1sPJIORHWsD5n4oCvzKowU9VhIWyQs1wCsiq45NdTPdgHrDoruABriJtPELKDt15pGaE6iaWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078322; c=relaxed/simple;
	bh=PQrmptIkB9+FHFCt7654nCnkDwp4ijPJju9VLqHK+oU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5NGEQOHZ2bS8GDSkGZxRnztU4N/cB5zUYkUkpqwIkreHCIRiK4W/C79G3P2+1wdloB0Oism5U6H6dcOPhYzMGPT0jtD8nKKnXDs2jwmX2zcb98shwxpwdEnr9xkUR/hdczfGw915YbpSOm2gZ26PzjqWdjSM2rvKTh9LTxy7/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGOTj812; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGOTj812"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6ae8445b7b6so1142464eaf.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 21:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786078301; x=1786683101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKnDaJp5ZviVMN/jgF3Auq00JWcI1+Cd7CJPkOYq6WA=;
        b=PGOTj812feWXTUIA0b20qNu4rIu6f/JNC5wNYKLR86pdVgM4pBe7vuOCdAxuzhySyZ
         Wxm0j5TRZ4ECuPQchwI1q6J9/6rv2ZU9RyyJKHi35Dc4UbKc25ZnQWmC6JVRZTy+fyeh
         4JLOz+oBThy1ZA4dvp3J0iUTNESlU5bFVK2+3yoTnSFVOaZq8G0QrtLQ0be33vROMDb4
         dKiUgerE58wijzObOv+nc9neK4STGj6qRCZ/JCquB9TPQ552bVFWCUPrKPnWzIvxWO+y
         m6rdoDsnbFOtqz7Dndx5we8tP28PWnjBxWj3y6nSaG6BtWVWHJ4fOy6l4vd1WHGbFM6N
         jriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786078301; x=1786683101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uKnDaJp5ZviVMN/jgF3Auq00JWcI1+Cd7CJPkOYq6WA=;
        b=cQhcJUygUfE3bdM1uB5/7h05lEHsZmhLb/3dXhcLE6fCObqdv1ImdhWmF3L5TYP+HO
         CKFWuGuUyBl86nKGkeBjQA8I5rsVsv/PmxglSsDupoGx8GxEScSdf92o/5jwJWm59A7W
         XUxZv4fQeJmEjtGwPFHBN4jUEGE9IlL8vccXVB9Dr1IiRob/VF7VI6cMw0MSR4qO6Ihq
         0xojlmo/3EwItC35RQHs367oWayTi4xj6Qid3ifRQsmz+WmtUyokWD6vk78gTJ7i8TRl
         LKWEYYQiuDv41UyLkCu3NuqOMskQ28U1W7ZdA+7sTjrQqkmkTWISyGi5I+YBdvpDCkXh
         y8tw==
X-Forwarded-Encrypted: i=1; AHgh+RrD+xAzmX9H2CIkekKXO/bza+Dg6CFLEGrtR6yTKEEtbi8/zuOhc5bIiXhADeQvglA7ehA1vAb2G2V8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8v9WCIFlCe5OTcSpD1Ie6v2h8IMxo3/LSp8M/PUGqtGJN08F9
	yzDaTIDnbeAAilOIjpWFJyu5u9EYX/lcaW71ven8fnCk5JVbplZdXU76
X-Gm-Gg: AR+sD117KtQi9IjP/hu8dKYEkKXih0YA2hMbR6AgKM0wrJAVyQmi7v0zBDh90wse+RF
	2K6NH8eTrA0hdoJ81iqZp63h9U7a0ZCpJeG35dRyuhgQeDx8TaegPCi5XJrsOMHTNUieiwb8fNi
	IDsbFhBatcvThb62U1qqizO8sgFySwFU1G+AZzPIuo8IsjXEaca9c289DGgiuv5OvDrbzmmYMPN
	3XzNKFXilrS/sB2luc/bOpBzHyU8QiHY9ZSX+3SDC0TfnCp7PBrAP5AuSTEBZf3eWz4T6aWmRq0
	hr9zFLKuNiYhFuLL3FjgijKaO4nkVmlqmC+ltXaz7McbN/KSBSW8evs0AaHeBc60eX8njAkN2l5
	kpHn4/xenxfK9mH4neW1F6SOeAtC2AxRZqRcR8O783RWZAUDqNQd+88XNHTWl4mgkVmf2vJDTzb
	epZvf5ralSPk02F9GlwG/FrA7qZGNFzzY9FnsmA1izg17PQMH4G80LFRcV18r4pPRPC6UkVK7bt
	3ERNNu2+21BrcoZKI34+nqjdJ8R+xZumShlcbN5lp0Hs3FeZfkDcV3XmV5hz0eKIP9wZGiYoUNd
	9GZb8zdQBYQpo03qAiPT9acP4dA8qtzYIJDKqO3V135tr53OLzOPWuHCPiEG6xl/EzmYVDZgqjI
	E7Eef0jPCGAVYuNvb
X-Received: by 2002:a05:6820:4d0a:b0:6a3:c5:30ca with SMTP id 006d021491bc7-6ae97025da8mr10409051eaf.31.1786078301063;
        Thu, 06 Aug 2026 21:51:41 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02bbbf755sm1519726eaf.2.2026.08.06.21.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 21:51:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 06 Aug 2026 22:51:28 -0600
Subject: [PATCH net-next v4 3/4] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-submit-acx00-of-dynamic-v1-v4-3-9bf2f7441632@gmail.com>
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
In-Reply-To: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 208 +++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
new file mode 100644
index 000000000000..22bddc7a2f94
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
@@ -0,0 +1,208 @@
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
+  vcc1-supply:
+    description:
+      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog front end,
+      and internal digital LDO
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
+        vcc1-supply: false
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
+        - vcc1-supply
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
+        - vcc1-supply
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
+            vcc1-supply = <&reg_3v3>;
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
+            vcc1-supply = <&reg_3v3>;
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

