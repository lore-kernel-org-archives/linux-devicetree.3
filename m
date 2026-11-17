Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919236;
	b=WkasQsp7Emd1/hP5aglRaGiewe9M0t0zgm3aredNO8P+DHxpo7fdGC1YmERenWpBqnty
	 OqiVvDnCn/iCA/vB09H2c3VcgG43TmqTIIrMs7b3QTWMCCErBc48xaRytYYtQ4KgBGnzC
	 bA//SYXv3hCXfrIGiiORaMBLHsIJgQBLaizLNfZ+LRDdrhc+IpUHrZpgaeAdTFHOfjz5o
	 1hjAQ7twSHjFvej0PXQQYEGegDb9AYuIUouVMv6GFjQGswS7qG9h/rGX5sqswut2KLNTk
	 gUS1PR45/TuI0/jFDZpFKczUUSgbsvprElib/2fh4FyI7cCtQjySTMZF0CvisbUUi5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZuODRaJ5G8FoGrxxTCkHxBbk35bvVff0bzp5O328+D0=;
	b=eF7C+6jKjBCMmoMK8+hRcHejxzoqBKr/C88StniEuf6v2W2eTC6Fwiw8WBT1NjKVXeas
	 oF5ZaGeItUJST2zrZQgPXYkNFzQ5eokO/Pvs0NfCAfAyq7C+f+F3gYP1vrBP7QG0QHkr6
	 dqhXjoSGbiqMi8NzHlQ4TQLMs4uEkXJV8LN/m8y2rV595iMgEWN1KJlE7RdnS7UWieL6q
	 SyFqKGB02Zfa3ngnhwcKFxzpYOJg39wBx7tnHJvwaAQTsJP8LMrKU9XXXBbJb+dcqsbgV
	 T20Agp4pc1xZY+i7j0f4AWOY35cqjO4uX4JujMCUxnMLEDRW2qjrZxerjdUzmVOOvHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtDkOsEm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25556606F8BC
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25556606F8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtDkOsEm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so27913595e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919234; x=1795524034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZuODRaJ5G8FoGrxxTCkHxBbk35bvVff0bzp5O328+D0=;
        b=XtDkOsEmTadF33XgiUsDnVFzKO9k5PUUfQ9jDQEBr2h0+U2qovyCDbHzUHACBE1Hul
         lqRvThuoZLi1CmhRbi6pAuyVOU5XbM9+nOnYPfo6Y1pSLD9gxgN/ZkOJoyyofDD1fa+g
         MqX/+5YsIY01eaUuynfa4wFDP+x3bd5KOp43+aaCh0Dvifkv/KyeDWKZANLdGs7f8Ag5
         fpZ7AwD/8WFR0DuVReYzChAF1c/T3oHGKgka2rkkU9n6/L8QeY4txn2pzmyf84eKwYKp
         0a/vpv8CVypHFyQKhKKDaWvEg/ZSOFqmEs6g4TTt1b4iErZetwGiHMqxt1vVHF7MHrJb
         vsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919234; x=1795524034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZuODRaJ5G8FoGrxxTCkHxBbk35bvVff0bzp5O328+D0=;
        b=2Na6wGZDt0M/xNm13sz/OoSL87w2jlnlS4Z3WcgWVAd4iiz9Bq/WmLn0B3BIyves1L
         AfTloW0rF5dKUScrZuymNgTTIdJxM5AHHARXAhWpgDIGVE4ao3OiXi55MA07WLZ+lyIR
         XbiUkUsVea2qfOD5TtbFZyeEbbD/zIMzf0F+QYjQwqe88WVHVkIfvZriEgOdY1khKM81
         g9l/WXrT8p7oGvhm/MDncwmzRwcW4yh49lqA6qwvMLZZX8wcUkydPPwRZN3gcQ8sMYBK
         WlE1uJbJPrT0UbNv4tIiWV9POt8QMTBoSVX9L6m3HZsE5RDnzMSECYvAAk73zvA9U+jo
         j8QA==
X-Forwarded-Encrypted: i=1; AL+hErG6df8uTfyJrgbmydXafV3SF7v/r65iYsBIbY6PgXlFHa6R4ubmXs5uomAgnSIiVl/3pRqAn3Vc/i7R@vger.kernel.org
X-Gm-Message-State: APuU4Z961klVARflhaPw4GgRTO/KSc8VRYq2rpILFeMxIWrFPfSDHzen
	H47ob8RrL2OuAyd8vndyjs2k0FZjIhwXm83x3ZIsiOf4si+ugwD4klMu
X-Gm-Gg: AYBFou3PFMCrqK8k9xsk2GQdEblGmINWZIrTkdzQddI0kbiXICZGGdbHM5gzR7JTVe8
	FGTMLOEjKp+aJc9mS6qYHYGx7/t1G6hl/xZsP4mQ75ksLAk01qB+1W9EN4+bmzaOesfoPqy7/0Q
	ivFdOQ9BwmVRIF/daz3L+rw9DrZLbUI3bqLUFLEvGcai5Fc8Aw/i9DiOPjc/lB/qszJdJbRFm5/
	b1oEWN1nzC8Y/rfBZQ2gmfP93nfNW9k+XinSViORS3K6RXoqJ+hzBfBZH6Ei0J4A9EwJ1juNBvX
	l4zu87SQzN/eYNpQNxMiXS2t+zfE5MdeyTXog+Px4AiBk/RlvDZzLPL3o3CrevraD2L/7JEkKm5
	25yE2DWth+4KZ1i6zKc80IDGmm1OMvV5X1nEz3X6ImsVwGTFFyaiQk9jMz/1yNlioALfzMF9eZC
	fRuREUEnlcwYcylAd5R+eiqmffA2hLiaR8dfIqzrmASSbXnQPw5YK5iANtRUcNa+WIt55iIjefz
	nJHlNPhU4bb/dBCV3RSIKr9NIbBqKQU47sIRRgBD1EtldKCWSYEmM8AaAN7MpkqMlWhxjHyvfEE
	9And66jmIVLqRmrH4MU8GLGDkkNck4k5a8QzAKxvBu6guG4rGEIHdu7g2vcj+nxGSFoIVlodhd8
	fiEhy/S/Ykacs44LHJdKFGGILLS0RZ7vGDA==
X-Received: by 2002:a05:600c:81c9:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb55a65b31mr279103555e9.18.1794919234427;
        Tue, 17 Nov 2026 04:40:34 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:33 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 13/15] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Tue, 17 Nov 2026 13:39:53 +0100
Message-ID: <20261117123956.11981-14-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha Ethernet PCS for AN7581 SoC.

Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
the various Serdes port supporting different Media Independent Interface
(10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

This follow the new PCS provider with the use of #pcs-cells property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/pcs/airoha,pcs.yaml          | 261 ++++++++++++++++++
 1 file changed, 261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
new file mode 100644
index 000000000000..9c1d116c1b01
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
@@ -0,0 +1,261 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/airoha,pcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Ethernet PCS and Serdes
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
+  the various Serdes port supporting different Media Independent Interface
+  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).
+
+properties:
+  compatible:
+    enum:
+      - airoha,an7581-pcs-eth
+      - airoha,an7581-pcs-pon
+      - airoha,an7581-pcs-pcie
+      - airoha,an7581-pcs-usb
+
+  reg:
+    minItems: 6
+    maxItems: 15
+
+  reg-names:
+    minItems: 6
+    maxItems: 15
+
+  airoha,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the SCU node required to configure
+      the serdes line to the correct interface mode.
+
+  phys:
+    maxItems: 1
+
+  "#pcs-cells": true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#pcs-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - airoha,an7581-pcs-eth
+              - airoha,an7581-pcs-pon
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: PCS MAC reg
+            - description: HSGMII AN reg
+            - description: HSGMII PCS reg
+            - description: MULTI SGMII reg
+            - description: USXGMII reg
+            - description: HSGMII rate adaption reg
+            - description: PCS Analog register
+            - description: PCS PMA (Physical Medium Attachment) register
+
+        reg-names:
+          items:
+            - const: pcs_mac
+            - const: hsgmii_an
+            - const: hsgmii_pcs
+            - const: multi_sgmii
+            - const: usxgmii
+            - const: hsgmii_rate_adp
+            - const: pcs_ana
+            - const: pcs_pma
+
+        phys: false
+
+        "#pcs-cells":
+          const: 0
+
+      required:
+        - airoha,scu
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7581-pcs-pcie
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: PCS MAC 0 reg
+            - description: HSGMII AN 0 reg
+            - description: HSGMII PCS 0 reg
+            - description: MULTI SGMII 0 reg
+            - description: USXGMII 0 reg
+            - description: HSGMII rate adaption 0 reg
+            - description: PCS MAC 1 reg
+            - description: HSGMII AN 1 reg
+            - description: HSGMII PCS 1 reg
+            - description: MULTI SGMII 1 reg
+            - description: USXGMII 1 reg
+            - description: HSGMII rate adaption 1 reg
+            - description: PCS Analog register
+            - description: PCS PMA (Physical Medium Attachment) 0 register
+            - description: PCS PMA (Physical Medium Attachment) 1 register
+
+        reg-names:
+          items:
+            - const: pcs_mac0
+            - const: hsgmii_an0
+            - const: hsgmii_pcs0
+            - const: multi_sgmii0
+            - const: usxgmii0
+            - const: hsgmii_rate_adp0
+            - const: pcs_mac1
+            - const: hsgmii_an1
+            - const: hsgmii_pcs1
+            - const: multi_sgmii1
+            - const: usxgmii1
+            - const: hsgmii_rate_adp1
+            - const: pcs_ana
+            - const: pcs_pma0
+            - const: pcs_pma1
+
+        phys: false
+
+        "#pcs-cells":
+          const: 1
+
+      required:
+        - airoha,scu
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7581-pcs-usb
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: PCS MAC reg
+            - description: HSGMII AN reg
+            - description: HSGMII PCS reg
+            - description: MULTI SGMII reg
+            - description: HSGMII rate adaption reg
+            - description: PCS Analog register
+
+        reg-names:
+          items:
+            - const: pcs_mac
+            - const: hsgmii_an
+            - const: hsgmii_pcs
+            - const: multi_sgmii
+            - const: hsgmii_rate_adp
+            - const: pcs_ana
+
+        airoha,scu: false
+
+        "#pcs-cells":
+          const: 0
+
+      required:
+        - phys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    pcs@1fa08000 {
+      compatible = "airoha,an7581-pcs-pon";
+      reg = <0x1fa08000 0x1000>,
+            <0x1fa80000 0x60>,
+            <0x1fa80a00 0x164>,
+            <0x1fa84000 0x450>,
+            <0x1fa85900 0x338>,
+            <0x1fa86000 0x300>,
+            <0x1fa8a000 0x1000>,
+            <0x1fa8b000 0x1000>;
+      reg-names = "pcs_mac", "hsgmii_an", "hsgmii_pcs",
+                  "multi_sgmii", "usxgmii",
+                  "hsgmii_rate_adp", "pcs_ana", "pcs_pma";
+
+      airoha,scu = <&scuclk>;
+      #pcs-cells = <0>;
+    };
+
+    pcs@1fa09000 {
+      compatible = "airoha,an7581-pcs-eth";
+      reg = <0x1fa09000 0x1000>,
+            <0x1fa70000 0x60>,
+            <0x1fa70a00 0x164>,
+            <0x1fa74000 0x450>,
+            <0x1fa75900 0x338>,
+            <0x1fa76000 0x300>,
+            <0x1fa7a000 0x1000>,
+            <0x1fa7b000 0x1000>;
+      reg-names = "pcs_mac", "hsgmii_an", "hsgmii_pcs",
+                  "multi_sgmii", "usxgmii",
+                  "hsgmii_rate_adp", "pcs_ana", "pcs_pma";
+
+      airoha,scu = <&scuclk>;
+      #pcs-cells = <0>;
+    };
+
+    pcs@1fa04000 {
+      compatible = "airoha,an7581-pcs-pcie";
+      reg = <0x1fa04000 0x1000>,
+            <0x1fa50000 0x60>,
+            <0x1fa50a00 0x164>,
+            <0x1fa54000 0x450>,
+            <0x1fa55900 0x338>,
+            <0x1fa56000 0x300>,
+            <0x1fa05000 0x1000>,
+            <0x1fa60000 0x60>,
+            <0x1fa60a00 0x164>,
+            <0x1fa64000 0x450>,
+            <0x1fa65900 0x338>,
+            <0x1fa66000 0x300>,
+            <0x1fa5a000 0x1000>,
+            <0x1fa5b000 0x1000>,
+            <0x1fa5c000 0x1000>;
+      reg-names = "pcs_mac0", "hsgmii_an0", "hsgmii_pcs0",
+                  "multi_sgmii0", "usxgmii0",
+                  "hsgmii_rate_adp0",
+                  "pcs_mac1", "hsgmii_an1", "hsgmii_pcs1",
+                  "multi_sgmii1", "usxgmii1",
+                  "hsgmii_rate_adp1",
+                  "pcs_ana", "pcs_pma0", "pcs_pma1";
+
+      airoha,scu = <&scuclk>;
+      #pcs-cells = <1>;
+    };
+
+    pcs@1fa07000 {
+      compatible = "airoha,an7581-pcs-usb";
+      reg = <0x1fa07000 0x1000>,
+            <0x1fa90000 0x60>,
+            <0x1fa90a00 0x164>,
+            <0x1fa94000 0x450>,
+            <0x1fa96000 0x300>,
+            <0x1fa9a000 0x600>;
+      reg-names = "pcs_mac", "hsgmii_an", "hsgmii_pcs",
+                  "multi_sgmii", "hsgmii_rate_adp","pcs_ana";
+
+      phys = <&usb0_phy PHY_TYPE_USB3>;
+
+      #pcs-cells = <0>;
+    };
-- 
2.55.0

