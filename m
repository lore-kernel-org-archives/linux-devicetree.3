Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209484A99B6
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637250; cv=none; b=D4SmrX35LwPentwTFmJf6L23m5SHabzywx58CqmKvBQcBi3X8dMvw/CP5iqDJa8MyLgdJslvstryqxiJnLTwXcsa2lsLXS3xBaVVg8N6X/AG+0dnmwqTE4Hz7+f4EHxIsPVNsJ92+T9D8Gu6RnCQFIlThpnbAlR1AYzRfQ5CPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637250; c=relaxed/simple;
	bh=2Iq5URQh8j2cslcdrK0rHb5Ovhb0ZDxTNezfsgzf7F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0k1InmxJIb4Zifs395y/W85hmLvCx/HyIaDDqP1meNjUxhi3UKoSqKlYO9ADgPGm2Ct51DzuNX+vAB6Zxa7Du9AEEFqoMoNgvAKIXNL8h7LJqNBJj4p52YnxHnAFaVLnCaB/vuo+imYvMeYfmLJ1MY7fM1jxrwuWqTD0C2QMQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQoKGILb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQoKGILb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so5476945e9.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637242; x=1792242042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZRXuafeSGm7SScy7RMeNaydNiquq0qtlWJM32llwhM=;
        b=HQoKGILb6dCVDFNnZdynmwig+/qTr+oECPl8e6x5mOIRMJLrSlQYRO4oaUUJVNjCoK
         Ve8K/Fmze5Bbtcm6qfd4O9P7HzwogRzQQ3aPnpgVZHYUXgoMi48O7H6PbjVa4A2itkaD
         UTwB/sexWVnrH9tO7Xw+pBk8g3U6t9HfTbKTdjUNsAoRoLq7M5xSfsumyNX85gnJXsrl
         L/5L2rDjimjeU0c0rrMbvjA23TcP3JjBOOdLZUi5wZUBZK9x4nPTf2xXXQ1OAYG2zo4n
         4RCmeEU4PLRz+i4EPsRYn0di0a2P7dQ6zMai1cfO6O4tLJcAhhFcDEQ5kR6kK18mTSpV
         VCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637242; x=1792242042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZRXuafeSGm7SScy7RMeNaydNiquq0qtlWJM32llwhM=;
        b=TpulPOzXu3teRSZ4El15c1q94Hhtmq/29aWjtOnyFzxV8rK8iWEoHJpepG29JAFFol
         hjp050f0aGLp4/fMXZTynjXME0lfhMqcXBVeiEo/Km+gMBu+SrerIxgGyI0WILi7wirn
         TysS0WXGkR5pTiBdex+9ObV7p0K5cEdRDBd0x4l8w5KyCkv1WLmTlvbTRe0diaSUPJj2
         1isC3RxiZ6P4j4mVOb/KzkcueNEvy6gmiM079kl8MnA2a5IsmWigQwHNh4oY47cFJW5E
         5kZreNoxWsulsaihB/+pLn7+m1Csy9boKVsqZfLGhSfhuuKrLmfefeeob/KB+0E64xSV
         imUQ==
X-Gm-Message-State: AFq9FYJm1plCs3XtVCCEl31DG3yXucEC2SteQ3VNiq4z0hD2Gztyi8t0
	LAzZV19FBPVN/1c9JDOFbykQd7X5XwcEZtZQ4DQTy62sPgKCy1+61Mg2
X-Gm-Gg: AYBFou3udz4Sb6dxTXubLw60Kuaf0ZU8u4xtg97/Ix/SmDC4uydDFKJXAJPIqMIkqgJ
	rESUBSM8LVTnNsT4V1YADO12yapE+kTUErBRaIV9sK0W75ZnmXMriefuM1K0v0s0T0jAhYadjDR
	EYqqRdSg0KEB9I30CEdgBgbHj2dFEXVgMsC3kKIsyqwNYfg+fZWpN3QIvnQ9UMWJoOSjmj4B06D
	gVvi00SZM+PyFmFkXsSDiLxTtF7v+r+B1ovzWR0zYGKaRK7FzgUZjhHgh7yIsbP/Kvg8pg+NEsK
	ohjVWC7Je1WIJwUi0P7jS3IvZdldw8pRjoy6Z+B11REOkuB9X0MXqHXl0/ioy24X0TJN/HOjLHm
	UpQEmrlOX27nceUdGZBYClfuLt6WC9Clzs1+8iiYXjrGCe8iL4UuXWF3WcdJz7gb5xTwUSkAwej
	/2GfiKg6kq9b+VdWhf2kLGKgHf4pwDH3fVhWarZ6Su8fH3ZkOA6csH6ZJQHW3OloyJm/3B3P7wJ
	2uu2KOJ+Wat0iCVhPIlTmE7QO3rJTbpQXUwLPjBoPXstRpBxTJEt9rCCUwGRNY6uY8srjHVZL5j
	MDRtgWpZDWqqPSA/MzMR28/q7CsnszQtGMFy6ZnGZ7BvNwW4G2Fh2CS336sBQw==
X-Received: by 2002:a05:600c:4ecb:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a18e4a510emr95532245e9.11.1791637241030;
        Sat, 10 Oct 2026 06:00:41 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 12/24] dt-bindings: PCI: Add ZTE ZX279128S host controller
Date: Sat, 10 Oct 2026 13:59:50 +0100
Message-ID: <20261010130024.177503-13-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe both DesignWare hosts, the two control syscons and the shared
Wi-Fi reset lines. The shared-resource model remains an RFC question.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/pci/zte,zx279128s-pcie.yaml      | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
new file mode 100644
index 0000000000..57a4e96610
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/zte,zx279128s-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s PCIe host controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has two PCIe host controllers based on the Synopsys
+  DesignWare PCIe IP, each with one lane. Their clocks, resets and PHYs are
+  controlled through the SoC's Top CRM blocks.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers
+      - description: Controller wrapper registers
+      - description: PCIe configuration space region
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: ctrl
+      - const: config
+
+  interrupts:
+    maxItems: 1
+
+  zte,crm:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The two Top CRM syscons that hold the clock, reset and PHY
+      controls of this controller.
+    items:
+      - items:
+          - description: phandle to Top CRM 1
+      - items:
+          - description: phandle to Top CRM 2
+
+  reset-gpios:
+    maxItems: 1
+    description: Board reset line. A device connected to both controllers
+      (the MT7915 Wi-Fi chip of the ZTE ZXHN H3600) has its lines listed in
+      both nodes; the first controller to start resets and releases it.
+
+  enable-gpios:
+    maxItems: 1
+    description: Second board line that is driven together with reset-gpios.
+
+required:
+  - reg
+  - reg-names
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-map
+  - interrupt-map-mask
+  - zte,crm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pcie@f000000 {
+        compatible = "zte,zx279128s-pcie";
+        reg = <0x0f000000 0x4000>,
+              <0x09500000 0x1000>,
+              <0x1c000000 0x200000>;
+        reg-names = "dbi", "ctrl", "config";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        bus-range = <0x00 0xff>;
+        ranges = <0x82000000 0 0x10000000 0x10000000 0 0x08000000>;
+        interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 7>;
+        interrupt-map = <0 0 0 1 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 2 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 3 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 4 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+        linux,pci-domain = <0>;
+        zte,crm = <&topcrm>, <&crm2>;
+        reset-gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
+        enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.55.0

