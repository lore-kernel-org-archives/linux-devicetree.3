Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D8B430CE6
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 23:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786490929; cv=none; b=UgFhblv9BUFRg24B9L1kEkqtmNnX1uYnYNF/pZ6wDHIsRcagRhkTqmqEhnblHhHYkTJ8ZhmW8SkYu2oCWa69LBiflhpByAlY7T8n7sRt9hcHLD5ru06dRAHxeUHt5YWqSrq2mrmFnS9KTHGnLW+ePZrWI7NxZUlRsjIJLKvAAjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786490929; c=relaxed/simple;
	bh=GK/B8pOwlGpt6eA1invozWkbmKYokLi7estcfj50KjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMSOcAzx4ulMHRvf6uA7pGvQeysrfA4QC+NNrV/qPgmZp/3StB6DX8VbLuehkOJjtq7Hybrwi49D7ikixDjIs4Af0jmBcTPWBkiH8yqvjb3mL8MTL/7e74C2L8bErMJdHz5DZK0BxUi0luFHb11llexZN5UNy3eQ7ZT1StxWsPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hK+iKWfV; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hK+iKWfV"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-45171f2f608so180522fac.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786490926; x=1787095726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63zdf5RPhbrqfdDiAyDgjJa82jjDKftBr7Y+b2RfV+E=;
        b=hK+iKWfVy8Y7eIeSZnR4En37HeZ6lOr/CsVEZm/JpccI+3xNYioeJcLG8j/RT4B8Df
         pLWSVgVNDM4fR2/LGiU0Wrsg6IyEvPE8b2LYD0naEy+5D3N7d5RsCeBeBzheOyDw6Uev
         uSTXAZyiEWZbH0UCxgf7FTmLglDQbdZjc8P4TzgY4iqeoAT863nrJM9i3m6KVZGvY9AZ
         VyM6VDcmk6ZQSbvvZcJ933dKTUUn91VmwDrqd55a0qLEQ/rWH3SUbMbJvHIFEqwekIB0
         Wnrb6qYxT+hKQNiQbHVbFSWCQvGDJ9SONEBcWxS16mDFqEauHiGVg7Cz1uA9oB6l9XXi
         BDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786490926; x=1787095726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63zdf5RPhbrqfdDiAyDgjJa82jjDKftBr7Y+b2RfV+E=;
        b=BLq6Hu4Ggmg5+aZYrkBby2scwQ/UqIuJYOJaCQ81Of8DomSbemZLxxqSitSl8wOn+d
         6ASrfc9ZsY71Sfs9YN6VzGSHssOnhBOLU9RwOk99ruYJhTQ5AshpKf295JPIZZyom4sK
         7BLqO3IopeQFHIU0UDQXLmYp/ptP737SGi4Igm948mwrn4F9MOaz254gwmTkEmScxNjB
         GZdt8pai6cJQb1KQ2MpCW4UdheyCA1jnctbhmi3zLCYekdsgNwhbbkMvUuYthl/nqMEb
         JAo5Rzo05rvkOzmaOq27d4VfTPl2s0ZCa9TNwgtYuQ8VjhftpcoqGtnJle92JH4Va5IM
         DVLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3yL+WkwNmbtyf8jsfWVy663L5SglWsYwhDyDOBAXoEZwlYYz5gYNvbGBUimUxctvPkXMgT8dW9EGF@vger.kernel.org
X-Gm-Message-State: AOJu0YyDj3LrU1hMw7wPkBEB1rCP6+8U/iTsF9LvoYbNqWZjUGmf8O4H
	JSmVRTBPK2vXlddsOXMPslpUTZX1FZAdlFZf2bAx5VcThfIGAqS72AZc
X-Gm-Gg: AR+sD13A3UldXqin2hESmTeXKCX1v6N/xNTiX1vWILX2NW9d37ycPwHlOjTf9jBlydZ
	xY0OiaHJhgNCkH61lWtEIExpFq9g3JN7cjRT6SWbE5MN/uhljFBfEYCvH2JGwgIWEnbFUT3/ZQc
	cGLQQ7lb+X+8RdoMwpJTnNgnpA5etfwd7w9H/eJ69hIW/H1zCGiUgLWpk/FEjah+9/0KkTQAIjs
	nox/A1SjNi9WBfY9+MP1ub9jUE3u9sYGWebNcZWEvPSLTDN6kXpZsjWKIiZgjNiDnM4cCuVYL/J
	c0Sk22iHoaO1Tro/CTk8eV2UxNAik0FT85Sf/GT7IjrZI7ACrVk2/vSKO0G/u2kcYrNiqz0kpDs
	Jo9Z2idl+lBY6tuGtEqm9lclvlrlgJTPFifaMXbgDqDkITIwolC4hhP2PEcD+FCMJK8KpP9EZCu
	KuvzgQtoPTIHOPQ2Qnsu5kijlQH+V8EuXc5ABVaF1SHPcYhJfhZzaqRD9iLF2dUdpv3dHj5U3u6
	oTF5dwx1J43CmFQYVhCbzmV3irbmWSujnMrP6gwUeGsLzGIN8W2nbkAB0vCvWY+P2cAL2yO0+UE
	I3OBsRzGzomytI3h92sm+hj/wVPw73gCRXrALecR4RoF2bxTR2j0+QAh7Kf6yZiHnZpO5x28/Ib
	BbfH4beLA5X8Q2IJh
X-Received: by 2002:a05:6808:1795:b0:4a0:cf55:3cf0 with SMTP id 5614622812f47-4b210a0b1d7mr754020b6e.9.1786490926121;
        Tue, 11 Aug 2026 16:28:46 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b20019e83csm1888484b6e.16.2026.08.11.16.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:28:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 17:28:32 -0600
Subject: [PATCH net-next v7 1/2] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-acx00-of-dynamic-v1-v7-1-03f5b91775d5@gmail.com>
References: <20260811-submit-acx00-of-dynamic-v1-v7-0-03f5b91775d5@gmail.com>
In-Reply-To: <20260811-submit-acx00-of-dynamic-v1-v7-0-03f5b91775d5@gmail.com>
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

