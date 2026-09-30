Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF97241C2E0
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752720; cv=none; b=gD+oIFKE74HLXbkYZhqasgMyil6c7fOadYmk5pDo62h+b7CEjfJag3jXPU8fOTbKkiEXS7RNZh/sLgT6CM0E2pkCqSVxP5bB9ahRxD7ighA92TPppvWocsVn2iBjhEKYL2atvjl2x1Bal8adyGx720awX0VSWyescTIB0JMFv2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752720; c=relaxed/simple;
	bh=US4suyzb7iqrFEMUJT1oJzU7R6rONpG5+lHGNHKX9cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mM/9HpIKIDbaJk83R2KuLwGFTFcREJ2AO66FvUkF20YFD0K6UezVU5HHORkyokzzXfSfQLD3EL86hbkNgzKqueKXtPhLDOO7TlLszDC4fP5rljInOo/Bh5eCNmuNS0O1etaULVlYcX0bpTnc/r9xMCqjPVMUUhLfS45HU2J+UwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXOrCaRv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXOrCaRv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so24364975e9.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752717; x=1791357517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaOi9SgQBlcEjje0pSLuoVl2zNe4f+4W9jub/av1TQM=;
        b=XXOrCaRvS8dh81r/B4kFIDK82EbgtoHOk2+Sf5/c7R3Ye+uVWTwEJLfjrK64vPv35x
         brKtj0nwI4+jv3gD8yAXBkfIX/1QNwsz1CKluH2kj4J+Su0l4kx0Z8ClLtdtBWhzD3MQ
         0A1kG/bDnXjmXI3fyfR1K2Z90F6h7AcIPAUqlyfmD6omQROAk0NMpegsXAvRBhpoxdcm
         W67tFvzuuDckgN29QoXuaadB76QlNMTGP2O0DPp2VCXHVsYFIj2Rk4F1SmtTElhLQEdG
         no+cbyQ+GEMCCX7wxr8cWCCO4m51xe3KO6MwrGYlA1GkZdXwvkwyed61wSg54cbqc6IZ
         Fwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752717; x=1791357517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaOi9SgQBlcEjje0pSLuoVl2zNe4f+4W9jub/av1TQM=;
        b=qFxnZ0Ekt3bWIiUeNwwCG1lvFA7CVRyOoPvPq6lvyrsj21a90a6cW6KP0Dus6pfH9U
         UQjWgp+46fn3JJ/esVXCfHuerVe6IESrhYlUfFIqXtdfrH3TZeUYgMLwopXKboolfOTV
         ZWisSRkNzG185X/LPkW4QJINmf8UKZhLnZpOVQQvBCfUxqU/hHIMb/NT29lIiIgZ//8Z
         GM4Fp675WNmZh7CluORHAE9vwQneWI5QyunZm2Wx8CfC7i6ckVzo900kBf0E88uxX/4I
         5zULrySJNnSXzui/p+rOfMKsv+EG4OzKKsaHPsVWaZ7saJwoHUxQ5BY2WFDcXtGDd3Ci
         HioQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPmbRf+fHGZUZlE6yfesx48W7xB02y+gBMRqUXjxRToF1QRPm5wdhsLZ60ZpZ5mF4QZQ1jJbGA1GYa@vger.kernel.org
X-Gm-Message-State: AFuF++m62mnpzhgOxplpqd2MjBnM+DGpNB2Sg9AQwPhDbgHgJdnsZWmX
	RoVcpW8m8wrSjgHrHiACE4VtF6mUhURb5Z1E112fASPD/al2XIu0zevm
X-Gm-Gg: AYBFou3sH0Bcb5y0iHp/bLGBEOEzo+FheKgxxIkik6vaWCqdhoRNyCI2rp3xT6jc7bo
	W1Lx6uSQXZtKpl5XMakcRh9dSGTfluduayM6fdhevRcduSZ9vaDwDeGOO2E1isPBmUDp4KNeNeK
	0z4DqRuDi1vUgih3BzDuyZT1LKdqiJPg34b3yJVGdZZQd0ODjXextQ3lYLjLy9P2kzNunGWznVl
	Axaik2EavE3M1w+vjIx9y++25ZQeHRZJo6H/QQON3Qvi9hxcgZWrvYGmbm57Pd63iOwRJ6frHZ9
	VpVudXA4m8SoynU/mo3EYrmMl0fDqxMjXH6vX6Ns141YHxAXk5dA8Dv8QvAWRl8wkIUtgjKn7Ib
	nYRW3rIfN6TCdVcxqAVrngMbP6x8TRaEYLVue50Ky27vMZH6xn3dqktJ++WvBLsdG8yoZNcww2n
	4XwW6/hlZKHWOMVdzVzUVGZEE4A5WsWGn9j4ASJF/0+l7fKowpPi/mz7WkcS9yRqMlvOzURD9pa
	MqHCPKJioxFk8zWhwD56y1Y5XnJGdi0svx+J4jjylAll27mN9JG8UuHNxoJb6jg
X-Received: by 2002:a05:600c:6815:b0:49f:f963:7093 with SMTP id 5b1f17b1804b1-4a01b00d679mr6300785e9.23.1790752716700;
        Wed, 30 Sep 2026 00:18:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e79e4sm10590905e9.2.2026.09.30.00.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:18:36 -0700 (PDT)
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
Subject: [PATCH v12 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Wed, 30 Sep 2026 09:18:17 +0200
Message-ID: <20260930071826.48811-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930071826.48811-1-ansuelsmth@gmail.com>
References: <20260930071826.48811-1-ansuelsmth@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
index 70a11f2ff61d..0b9946c532af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -785,6 +785,12 @@ S:	Maintained
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

