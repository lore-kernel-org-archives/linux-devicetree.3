Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612AE367291
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377820; cv=none; b=ao5lqiWcvyLIvKP8KHS0CkvHn7N+G9JzU1nyjqn6CheQy026opVjRE+dRfN6t6+pcUwN4eVgLb2yK/9cSSSU5F8ASfcrM4X1loTW64/jP6u8rwcuT8FlamUHbe8qsg2jVsxvhqAqsPayFk4TVYaWAuAvJD5bidUoyJHdiQ5+Vds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377820; c=relaxed/simple;
	bh=qnJ6lEJILLeq57ziFnJ/tdvg1mnErt8MEYpEx0zbJC0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xc2zxuZ/rQm/l4SjtUfy9QWaVXS34BQ6V2tHO51iHaFzBI3b9koJvuKP8RRnorYA9Vi5nc1Wsh2VEqRRd0h8lyApvaGJPhL9NeHLvw0ZCDvv/eX08vimaZZU7bFQo9ptF10J0fz8i/uXgKEoa1m6E4UOT2U4iAzKwT/fWfx/hVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMnKmljp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMnKmljp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903fd19957so1815975e9.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377818; x=1779982618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIXM1te+ieHNM+6xW1gwzAdkuvYjOEEfP1FJY4/MyNs=;
        b=PMnKmljpni5bSAgnAmd12bY/0kGesC+W0bZ7T/0tQ/18D0mNv17neyXjg6FuguFFfS
         o0J5Z4UmHOdaN9630DNQQuzGtUqj6oumbvXgmdLxpQ/s6YEFqxl5Y0yJCn5IjHNyMb8a
         2Kg8PUZui6kEVKMZ0k9T1JLq+GIusBpOLm6/k2auobsjPezHkfF/5N5ZR+xVTdhXtnoP
         z9pGYX9hlCwQNfixV2/UlMZ5RrhlBQXJnTqbZQBwr//3ZI2qrzfAIR41Zakq1DgphxEu
         IyDNetVvlznotNp5cU06F1xKTlNpbxltRtVZsYL69iA5LDjYpB2xprxKUTz44VIzFN7Y
         nQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377818; x=1779982618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rIXM1te+ieHNM+6xW1gwzAdkuvYjOEEfP1FJY4/MyNs=;
        b=Fz+KxmamSzRi9shqFemsHnGhIUl/c/b+x8bwlWcA+xRh8tuY/fY9M5fWDCYz9JKu1O
         jMuUecoCOYQL0xp6T6ciD7BF9mI6mU5undQtee0nNdjlsKDZUj3dm3Z062RzF8K6rkQd
         GgTcPHj0dz14n6oVRI1B086xXQDz3AupXdKJpouHTxokpgJSy4iuUAmSgDmy+QwJyeYP
         +xAe7fUNljfeWmu8wK3tmtdlMQAA38Ju3UhO8m+Xt/ee/yfHE0MnvrMHKpu92fYtiax+
         vLazLSbmiI++L6pKrj7TgRHKxgUXCuiofknnSRiAHJBAt1CtC2UwaQFserkIoahRDwDB
         eKgg==
X-Forwarded-Encrypted: i=1; AFNElJ/J98DOxSq6JMV292ZLqe9p3YfbqZ0B3cszcHpFjQ/dwNU9uvrEG6wR3vcu1+5NEJjQyFeEu4WFDGim@vger.kernel.org
X-Gm-Message-State: AOJu0YxHbKljYHLHZwbp9/cIzjNGQxUTHIQubfO0Fmth9HbBWEiYj9LV
	l+ktyyWr6sf/gBz6VLAVxWHfb14DXv/bkoH3VpCqW3IsHhScnJQrcLvv
X-Gm-Gg: Acq92OGMjypiR7G0ecjAKbD2BhmJvFV4Tq7bqMFo3TAWR/Hd3q424mVFq9sECN749Dk
	hMiwoVOpymfTE6eXUIypV7HnXE7TW23yF571F7IRREYHI+fR0u3E7YqRoScGNoh+Wvs6PANWY3y
	QBXO85TPciVooEHsXPj4A3RVbujygkHClifl33FZ3Jsv/+y9IWRtscnXZdaK8iQjeC8piwqa1Ty
	hXyftrMmpQhwW80Mwb/NNN85MkT25EUWlu3QiW9cnCSJuyx4nVJAXpkyCACUr+It8exrZYZK7d9
	MpFi2UC5JlCRu1jMg6UoT1VA0NgR86cuHGAuE40PF/olF5lJGo+2u2g9dQxvx5HFDWKtDT57Pu7
	p3N47EQSxs0A3DVXZFXv/g1YoDi9qX8ggLNuaRmJlWp+Y6tCjDa0VQu8JkEajoSx1Px0gGMxvQQ
	FIVPK8whrKGdUce/qs3wA8HR8nzm5Rz5Bmovok2VtzEjeGGHzCINgEjqalWOfU8U0=
X-Received: by 2002:a05:600c:1f8d:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-49036041cbdmr49662045e9.9.1779377817541;
        Thu, 21 May 2026 08:36:57 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm79159825e9.13.2026.05.21.08.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:36:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 2/5] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Thu, 21 May 2026 17:35:53 +0200
Message-ID: <20260521153645.7028-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521153645.7028-1-ansuelsmth@gmail.com>
References: <20260521153645.7028-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..f42e3d49a61f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0ef0b9ce5..932044785a39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -771,6 +771,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.53.0

