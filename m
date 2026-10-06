Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28763E410E
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282591; cv=none; b=hCVtYmosvvrLUWesA0lQfN7XuAdWn22++UnLSjTODAgyrip6kC9Bnvdgw3uquYwrlhjg8Donll33zTFsAEJEX0PVjKB/JwXVn9Ug5EaE1qi4YH41iL4GxmusfRlnAsP9qB44XOJ/whJZ7/6i4FK5WYu9PwDmLq0Sq1Tzne9MLu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282591; c=relaxed/simple;
	bh=GnJ1XZ0QeiU/YTLEycC2Q+SFmPBbH4BNS6SV3ErRa0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxhpRLczONUvpIJ+J1hQDh4c2gErE3cn6r6nlEti/Zh8aNtz0hdXyKOUr1AfFs4ZV28/dH0btPsKuuafNUHtQObvADYYQbaXfV/a5knDBI9xalnNHVxZKJvZsa5u2iTdoNLw7wWzIomZQ3SAkMDLYieW2mNSvVA4VGrEv7Tq550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQE9Qz/F; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQE9Qz/F"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso26289725e9.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282587; x=1791887387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lg3zQibfNcBS7Sf0Juia6yunt6F/9FPxX2r5Kh6Q+zc=;
        b=RQE9Qz/Fghf0KyeuLjmJ/8RhkZZRwOpS2nomPtOqeYL/mt3igeACjgzROrFyAARL75
         iIvE4hoXWOBW9TY4lzvyX63FP5O5Lm6+x4ZaZoxy9YBGBN4QFPmABIbySDfqjZVDud0k
         c/aUBNDeYaJ25oAdfgQjIgpyQuQqYscxjw9M4tvSB/+LC8alVpWWJgFjUHT7WV2unUwZ
         lYpJhAmT7/vQZjLo9vMC958GciE9pPyiHFPTucpE9Xh6PJLxGuTNiNEHzJbXHX7wJ6/o
         4xWmMwhhL5wozcvqxmdlW4hDeaXzG/DtXy1IcSJPcP0Pmy7OnHa0NDuHhASsoD4AdScH
         6qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282587; x=1791887387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lg3zQibfNcBS7Sf0Juia6yunt6F/9FPxX2r5Kh6Q+zc=;
        b=klj9jPg/JJxyE9lK19CNgZqp8x+BofXX3Cqytr0vTpsAsOpm9QcktHiUtanKGLQXCH
         FiGdUGiQFUf/dO0YjXtTunugBxzPyOl1NHJ0XKEG0vGEVm1+VCTtBe/RGC5JkyvdDM4q
         9gZVDPhVZOu/uPH0YmzF77zCmo9Iax2mCX0EDvGV5LQDld21XH6zxWMLyCjEX3CnXAJ/
         2XM1uFkpZYl25DXSFtC9vtoxc1Lo6qnPaeQ0bWAJ3caTSywkSO0YHkbB5PvZ+y0aTcDW
         81faDp+pdSq+UlLowKL21H1xGD3vdc4oISm2rlV67YgSXEdE6YqGiUDNYHrebP5qoqLc
         5qmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy//IqyYFbvHGFtKxQmfFk5cXXvQVM+PH1tWigqkWOVwQE6MmKrPS0NodGWkO1p1MJAWXm9smO/CDGo@vger.kernel.org
X-Gm-Message-State: AFuF++m0hXjn1G8MSpnAeXKDkhPnbJVIK6Kz9akQocm/uhlASh9k1TIM
	lqNelduO81zh8vqKKwcrO0SogXna/5DFdPm+STUIa0WjaaexWZU5atX4
X-Gm-Gg: AYBFou1omSd3qFb5ldZAM2zk74n5ATT1LvWMgs21Vki/3Mlee6qhq21Ma3jQUPY0zij
	iDDl4b7JFAonXe7Eswu2tYnEOzJwfOZNm6l0Wbs0O80T8R0/ZQCXRNsz4eFWuQw5Hv4ai6IYqtV
	vOXEJ1O2RZfhhj08wp9DdL8NbR0cTlCsqA/2A0RbjN5VRsOvAqlccDAG6E5Ji8i4+U66z9nlf54
	whwrueCsWFhCN51J+xvPrD6IC8lGFMds6bsVem98ZhqrgK46MlH9UwQf2UxBviDqFbj2TKsDHS8
	vbd0ZFjd8yJl76DTYxwbVXbz8aRRAcwoKTQGLuDy/LhavSbUjb6eX1ejGBFFALhFHyXsI9xVOLy
	K1YodDxmd5MyPmqVLe9Pz4ZLoKGdtdIoN2BDGPFrAdS2HPNN6XTqA7aNreERopbSIoIxe8EEnoZ
	2GLvGNCHaWmOdBWNFAGl7bX3WfrfJUndU/3Uealv7GtfrM5aiXI/OFcFGJqaoL7uuym3zCSTXAW
	Qbf1Fl4MNWjABNCCdSqbXSu+Hhu/6ctPvsm7dlq2GLxO7AHisg45lqkfysq
X-Received: by 2002:a05:600c:1394:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-4a17b551b8bmr15839765e9.23.1791282586565;
        Tue, 06 Oct 2026 03:29:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178c33091sm63427485e9.4.2026.10.06.03.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:29:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v14 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Tue,  6 Oct 2026 12:29:33 +0200
Message-ID: <20261006102937.10972-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006102937.10972-1-ansuelsmth@gmail.com>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 61 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..61a8d773f207
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,61 @@
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 0570815ee980..d8cf9722f76e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -776,6 +776,12 @@ S:	Maintained
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
2.55.0

