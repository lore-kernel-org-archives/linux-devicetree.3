Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C1E3D79E2
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140407; cv=none; b=paYO1qzCBYvpiF/y0UTGtnLxdr5fKU3/3hjSYsW8xLi2Css4o8HyO5un46705FviAEW/5l6FIXAs2BqZDV0a0+/M79MNPHAu1nqTVs6MhA+kjQrbB6QnP5EJEPh/yan01My+OHZYaGSF/N3a6sY+sG4zRHd+I2SKYSQLBq2Z8ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140407; c=relaxed/simple;
	bh=O8MDKZM6orbok+3kIkwxaUSh/e4nFOYJeY8hZUI/E60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lMvu3VkA5uQI5Bf40zecjLgrrw0p0eMSQKzPAM7fs3y1eCHOWUiJpmkezaxe7os/fZc94+0jp47NFxOF8u4kdHkIzaBiFY81+L6TNtzLvJ7VFBjxLIixIarFpo8bCcGnwuc6BsViwVBRlHVcEbzoQTLJjSdcYnjmFLkp3chdAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jf80d+3x; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jf80d+3x"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2009993a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140406; x=1785745206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=jf80d+3x2edMcu1gqTiRf+D8mFjsPH16yL7qnVs429bWAuVpNuMqKRBw3vKSDru1Ur
         7BH6SwYatW9qjOvo3nIQBZ/ZFIIIhAF1gJNFk12uITdivuCbyB2Fb7eIfhWDwp/VDWwt
         4ub13CJo+4ul40L254hDw48/2rgNQNXoRWdyxREAqeAyqeJA5ABZeKBqWLScTuucybAw
         f+Rr05ENAQ5KZRuorf6h9MLj3SJ6Srw0Ht7tv+XZ33vcQGs19Z10owMXc2X/iJfuTpem
         N/822fO6bQSGEU9gKu8smMbxCaU1+qjy8UXyT4WOfuDQwHWsoc5IRX9AeGjH9ly/G+tx
         Lzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140406; x=1785745206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=N8+5Dp6eB5M1zmzLVXoADCUsrVR+vly0DX8PS+Q3VipHIU0mS0y0PRywnw77z7+ieX
         UdW8BpTXY5Ze5xPdNQN8uSVKzPVwFcIL2l4f+Qt4wBjaK4VrC+ZfrvaonMcR4iIHXXJX
         0nbjs2+dHBsu4Z1vFnv0aBKB3cPoN/sT709j2ecGmW3tGcM91hB/L6c8v76QUUO8Bccx
         TWXkyUJyxhr4voaOsLu0CCe8kKNpfXjwqpnlrXoWh+LcCxx7fYb2zVpnKjcmm034WyyN
         hSBlQMUSBMwZpkiscd6/LrK0spWBhqDM4nNmbO6AoJ8bIcFVjgC3fhcgCeDwZLEJd+tv
         BU6A==
X-Forwarded-Encrypted: i=1; AHgh+RpX+98xiwKAymOPR22JiXksRR55+EVm1cn8brPBpeaMeFNoWxISsw66fsv5+BG3fhxgLyjOIpc7osG3@vger.kernel.org
X-Gm-Message-State: AOJu0YzhqvBlf+iqjxEtizoYwxtHEv5ariNgegZL9OyYI0DSox8YyyC5
	WKZcyhVZ0weE5JEMRmMDFdmdyW2EORaWakpqk7n7eG0UGd151ojLYSI1
X-Gm-Gg: AR+sD12MXuIAXOd+QZ01siR0dtX0hMnazh28A6jKbI7f9zj0M1q6PqC8KuSr1P32Bvo
	NygBbk1ZV9rLJ0oA6ibP+u8qgajNtO/XYfpU7x7Jm5FuCrxUF2ACI3TzCSJbYf/C/dRo/9s5LCX
	I1CaRmjJjHspFN+pXSVH7t++e3Ch4DsElYwn4vGld56BbZlrDRmFMlb+r+E1SL6buV1k3KDCrhW
	4H7SZPyYiG1asS5WkfWB0IrHccqN5mQB3VL9jIvNz3N/fnLe/8nf6CoX94sYHE49L3p+C/ucZZi
	UpEWjX+rp6RXEXWdt/xp9of27/RvNXuz/ZVnW0Bwf48+0hqejN+gSC8vvmjlTSeW2WIfXyXwl85
	x5sLQrgmckwITKRmBSwced8/IxBF6gLGMDH0NevzsrhxuBFwWLLE372QIbKdwasZcxmvfVO3jy+
	FCgUs8eXCy1crtn2hDhs0Z2Y7BkkPaddpS+YI/uayZ0W2HbCML+1/XDfO6zEnd
X-Received: by 2002:a17:90b:5586:b0:38e:e9b:ffa7 with SMTP id 98e67ed59e1d1-38f295bd716mr7559866a91.28.1785140405661;
        Mon, 27 Jul 2026 01:20:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292aed12sm2629156a91.4.2026.07.27.01.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:20:05 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Mon, 27 Jul 2026 16:18:57 +0800
Message-Id: <20260727081859.1737223-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727081859.1737223-1-zychennvt@gmail.com>
References: <20260727081859.1737223-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..0713e1c1ecb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description:
+  The Nuvoton MA35D1 I2C controller supports controller and optional target mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x1000>;
+      interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1

