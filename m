Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6F4468C22
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836575; cv=none; b=MnMzGdfs4e6E9Ip0iBNfyC5r00tgqfHWG76LgREcoSure/b7pBabdaYsP3TYNa+cUHNjTGNnOSkpoITxKoGYEwZG1IZxYV72W0coh20x6u3on6IbKltX39osA0OgoZSY/FPIupCDM64zzpJ4HSJYKrrlcJhH/x9myVGxQhj2jog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836575; c=relaxed/simple;
	bh=cfYLMttHm5lYFRShaioVB/9FzuF8nxuxPzPW7wPQFvY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYhZNob6zJTi5r/bUjkIQgzXldf6aEPQuVDlu6hDfmjo+dIZLmy/NvI9vvCsasZ8j7EDQTRvgig3hTxzhibC2PP0T7i4fQsf05UcYP/nXIAH2ydZgqd0vGY+y8i0XaZrl3iohi+gi8h53PcJMz6+3CkOargPWGwfiWyJpRZcgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNddpMjm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNddpMjm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49557167508so7410795e9.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836561; x=1788441361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XDY73W5+DrXEydXQR2nkbVBUMArg5jEL4W2f2kgOO8w=;
        b=CNddpMjmPnV3DrhHV6NZetJs7JJCu6CCehp+OeHjbTFHlFFMQuUjLgewaMCEx9h1q+
         9x/0EhI2UbXgKzxXFf2xcjXQc8UungWx310XAn1COzuOCySm7RXB5wixvb1Lqfi2f/BS
         MlhMTXN28RU6GbwhhcJFLFOZIncM5NzivLkZ7Edu5OgnXweuj/n0Cx5Rn16QvzX2h1JI
         +N+MtqJsiVCH4c5ODEP5HuQrAfp4VaTZbPGJWzJB4IZ9bouwvpbv6Cfmf30ncZqy5uZf
         Z+iFhUUbj0/8Nqar36V70SYiXx7io/7xqOXTcNJtmjcYQWWJ4nBV8hSndRduQ10ygZl9
         Cp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836561; x=1788441361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XDY73W5+DrXEydXQR2nkbVBUMArg5jEL4W2f2kgOO8w=;
        b=pAUT1ovr1d45OaV9pUwIcZqGfvN2vngKgUgXvDunNJp+eRRZEq7QIni8WWs616s1r4
         8Ln8J/zPLXR1ifvPFDkaUonBnHKfl9chiLX1npoxeCNtW1AePTPmR7GASgf4kRwFpqLB
         sHNySr/rKlewNN5O5GeRJdVadbRutUxxKI+fcit/PLu1FMbcKeIxrxFUXM++ZI9zk025
         N3qTMsNMzqs/ThS8BMmKNkxfJwXlAThPUsrqv2tmUBfZAy6gXYyN2Q6aJY0H7hMNVHTh
         UGEBT8lhD8kaKntOWrfc6XgsleFQz5Cqt3JqWkrERHWZ1F+gshpseiEukgiEyDYCgzui
         cV8A==
X-Forwarded-Encrypted: i=1; AHgh+Rpt58/Zpev9dMOyJQhTNSHh+n7n6HIgxYo0CPxIfwLwKxD3wXvm1/sT+l+zJdzpEgY1fYGy4/YFYOHg@vger.kernel.org
X-Gm-Message-State: AFuF++m2oNddhzG9jpyGMk/CloZkiYCw66cNDfP1IHl9JSTlYmAGryY5
	em43Ltm/HxlkNSaHx9hTIKeax1m3p0DdEjXSr6o97bTRLUvQ34qFGzNf
X-Gm-Gg: AR+sD13L8JcDczTTI7DTEYvxwKJQSDv/5/wfI86LNdAl4HOUuy2D6GhGhh/8R+DojP7
	lDPw6wQw3YeLYaFeXa5Hf91saa3MHY75lUn8D/UufXE1b76QZfSXXlI2vGFtUdaAHrxktxlT13E
	E7dW9vnVMBTm6CAbdr/vwMU0AudyenP8bOOyhOQ+FT4WreIO1p5HNy/vjh3EdD5KqasBdO6PaL3
	VOyKS2P3Jkw+gxT0oE3u2SeQst1VFGw5ct5uxcItxslLf7XVFrJRYoxeGu9nkkdp9DoIPLownPB
	vzXEYJBGsr0fnYqOK5tIJHnMUuCRxTXenQjj02OFr6sNOa9xQ4jKWcRUaYRPjD+L6T4lo/wkXEp
	jIGp87r5Flt5bXwkLhzuAMNmontZp2SkSKzmuiOZxpCfPIxUHqp/huyHIwqy5Xa2hqPAAFh+VgL
	6Cyv/sjEJ2c3c6NB43TmDu6gp5KWzvhepAe8xwQHGXypsAzmP1vrgmR//OmnBQsVJOCvlEfJ8Ig
	xC9a8MxIPBkWIJHuAt49ZkATUZRgZk37EqL+lDA+EbNvxXLJ8ft8BkbRgl4o6Q=
X-Received: by 2002:a05:600c:3b0e:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-499dc701419mr155135385e9.5.1787836560352;
        Thu, 27 Aug 2026 06:16:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e28dc3f5sm9367192f8f.21.2026.08.27.06.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:15:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: phy: airoha: Document support for AN7583 USB PHY
Date: Thu, 27 Aug 2026 15:15:45 +0200
Message-ID: <20260827131551.26725-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827131551.26725-1-ansuelsmth@gmail.com>
References: <20260827131551.26725-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
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
 .../bindings/phy/airoha,an7583-usb-phy.yaml   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
new file mode 100644
index 000000000000..7ec655253a8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7583 SoC USB PHY describes the USB PHY for the USB controller..
+
+  Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+  On Airoha AN7583 there is an unified PHY implementation where a single
+  PHY provide support for both the 2 USB 2.0 port and
+  optionally one 3.0 USB.
+
+properties:
+  compatible:
+    const: airoha,an7583-usb-phy
+
+  reg:
+    items:
+      - description: phy register
+      - description: ana register
+      - description: pma register
+      - description: dig register
+
+  reg-names:
+    items:
+      - const: phy
+      - const: ana
+      - const: pma
+      - const: dig
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  usb3-phy:
+    type: object
+
+    properties:
+      phys:
+        items:
+          - description: phandle to Serdes PHY
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - phys
+      - '#phy-cells'
+
+    additionalProperties: false
+
+patternProperties:
+  '^usb2-phy@[0-9-a-f]+$':
+    type: object
+
+    properties:
+      reg:
+        enum: [0x0, 0x1000]
+
+      airoha,usb2-monitor-clk-sel:
+        description: Describe what oscillator across the available 4
+          should be selected for USB 2.0 Slew Rate calibration.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - reg
+      - airoha,usb2-monitor-clk-sel
+      - '#phy-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    phy@1fac0000 {
+        compatible = "airoha,an7583-usb-phy";
+        reg = <0x1fac0000 0x11ff>,
+              <0x1fa6f000 0xff>,
+              <0x1fa6e000 0x3ff>,
+              <0x1fa6a000 0x8ff>;
+        reg-names = "phy", "ana", "pma", "dig";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb2-phy@0 {
+            reg = <0x0>;
+            airoha,usb2-monitor-clk-sel = <0>;
+
+            #phy-cells = <1>;
+        };
+
+        usb2-phy@1000 {
+            reg = <0x1000>;
+            airoha,usb2-monitor-clk-sel = <1>;
+
+            #phy-cells = <1>;
+        };
+
+        usb3-phy {
+            phys = <&serdes_phy>;
+
+            #phy-cells = <1>;
+        };
+    };
-- 
2.53.0

