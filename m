Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64773386423
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918739; cv=none; b=r6sj50ca9kSKH/9kIvEArpQjWcoF6CHljUhKvN40rQdN6nqQLZqtCpM7UeJgwFvnUvi34iDmhQHMfpGZ9uVN8W73QEeGC+HTDB/jm+j2bi+PM83qv+5KY4Hi63nCx4px2u/643+puM6t1RKR0amlfp7AYuV7UANBKdhLC+fBt94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918739; c=relaxed/simple;
	bh=ynuOULMP4iOziuYv2J6d3jxrIlvxTnPee/5KsaaChHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbXrpA/KjJ6oE0Ex5W5nEIS+hjDxMSl9QnrQgsSUKhqHUmwX7cWBvmsZ6AB4QNAW/uQG4Sxd22HFfNp23fDWBO7VWNDPYA6jdn2j8Y8vrJBg4rrC8SLw+CpTZmUAT9KfWD1bJxHkmr4URAH3YsUVUX9PtYRUurgZC2kV0yvqrOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oh7mCA6D; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oh7mCA6D"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so4346625e9.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918736; x=1785523536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mb7TOOIuiwseKoR6/vRO7kfdbaChj9w+25XESDqQWTA=;
        b=Oh7mCA6Dv/dApP3tGEnjl5Dmns7faKQb4Q9GHr+nAONAD/SgH6XapzEHNtURUzNxqy
         0VA5s36RoMY8sLxvH+3tJ5f7c5QQOQYEfYDUfjMsVhOcB8oMz4PPDR9DXkMXoBCANace
         Y9leSQlADU9dz6/t9aTECAkKwBi+0XWZKZWSQuIVjvRu37xVAVAs7lECLmYNmKahlpaz
         s0u73ru8w1lF4gwDoRBTbmcX4ET+CbI3wxDLSJK2AjVOfRxb/KbFPW28jAFNC9mwaHeW
         c6GdxcrZyrZ9LavKubOJ9SW7ali762kGrSJuHbVXaJw/BZTjbJtR7yn6aW6Wf9snNJLd
         OGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918736; x=1785523536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mb7TOOIuiwseKoR6/vRO7kfdbaChj9w+25XESDqQWTA=;
        b=tViGe01GPVhq4sBBD7QdxO8Xv/KRkIJfrKuslfBEwxMvSj0JjFgWVgOPpKKQOD2d7g
         eOURelARU0yF9+nIZn+ZdUbrDoNIa9b0lXlbkH7yCaD9uveJcPYbTfRgjfMi2E63Cz1Q
         ssyGFVShCglIYJlk2e4nX5lDETdDlZBIRJpDWIoihMLOxhFhILjsm6eUOewiALX9Fs/F
         k1RCx0zYVBGcfwsjkMGQVblSDul+fbZYEYAws9Xp+QBH8r65q5+gRSGhmLRlM6UeWbX0
         qQTjpOQCUoXqMjpF3Sb6lJoyigsDSVK4dTtRDXK/xErPY4oCCXF4IGux1Dud8AXl1awK
         Z4jA==
X-Forwarded-Encrypted: i=1; AHgh+RqGeO5wb39KBiHbTexQ+28xt3vpbs14//c1v38/tZOM38Alt8Q6jzXRFWICo8Pc2Yzp2xmFH88jGXnN@vger.kernel.org
X-Gm-Message-State: AOJu0YyVpBcnV5SuPBcG1Bi9xL3VS7/pd+vQmlvykI7umytx6W/s3GNT
	JJ2hwaw+PLfdDc7joygYS7FpDfDKi79FWjzXiUc2Dk8ifyTrBYVp54Gg
X-Gm-Gg: AR+sD11fu6TIWkbQOE/3p9ZN8SwT5/aWrHcdtrU0rcUk2Cx0/wS+55wFEgY0kCqgfRx
	w+QASkmKTwEsvAYuf2wqWMTtO6kbNr4vGUBfpbV5ge0paGSb8Mo+9Pp0lF/jhqpo8PDEFu6Sj/r
	sJvBbMYECX9HMyK/sSRucC3WiFGNJhWD7kfDJxySKbXm2r8UCJtjhOpVhf549mzQaylz99BsEpB
	bFRzdekKDo2Qh3kMaLwqwzPiCtfJtwtqwB9AVd9tf1eJQKSxQdiORwRKKHnTOVY5W7nvb+Ktez0
	37sEvyT9tJvrkKdARU468irnKPn5vT9l2rJJ/ykNpReESBpCEN/pV0Afhs2KQbBshUbO/qD/1sq
	4lfm4RlGpLI5cc8Oc3NE0IZ6JNmglq3Z2YIS2n1+XwP3VrKvIk6L6k5bFtgq2E8D35rrsk4Sy5f
	jOwg9qqs//J8Msf1OUlSfgSR/5PAmZJCq2te/vO2m8Z3Pvrd9cGao5IV1Al8tXvAk3h5JFqSzRH
	Kw=
X-Received: by 2002:a05:600c:4f87:b0:493:df5d:6ca6 with SMTP id 5b1f17b1804b1-49573cd8a8emr108469545e9.25.1784918735024;
        Fri, 24 Jul 2026 11:45:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4858e85sm11278335e9.1.2026.07.24.11.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:45:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Fri, 24 Jul 2026 20:45:20 +0200
Message-ID: <20260724184523.193661-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724184523.193661-1-ansuelsmth@gmail.com>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
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
index 1705eb823dd0..05e90c3f7fe0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -777,6 +777,12 @@ S:	Maintained
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

