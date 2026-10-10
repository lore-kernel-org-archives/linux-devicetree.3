Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C734AB1BF
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637252; cv=none; b=UBf3d1ER4Ka1nwql5v4rOtCHnkZwsOBMUbcxoIxZQpDSsISmnjjomPUQBaSgJY8JMlhyUyWWbMOLS6KiZSvuUQdMcB67pY9sqxwVOewLGD3xVMFo5MDl0uKh0A2DY2V/Z55nmGzDRedWJ0pL+QwXlR2CLTaw3JhYIasjK7894Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637252; c=relaxed/simple;
	bh=GabFKJ1EikIatcIw9grczmA3skhOW3B9YOrjGPqa0wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUVevO1255GpY1F/PuJy8meuJ3NXLTqu1iXg98eooaQXJ7ZM0oQp1vlV1jX8pyhJpmeE0lMCb8jq1AdVOywNOHdg0NNRlIj0P32lMv2Oj0GZskT+H8qlQeu7MhfE/YKiLApMx9lT3Pt4L8phImniNb7ccVzlIQ+r3hWPBmJklLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlPjjRwp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlPjjRwp"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1741805f8f.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637247; x=1792242047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZGGWiHspaUSLm7YkvfnqPFJNEs8gUx31Fh9NnvvTUo=;
        b=TlPjjRwp0MBhG3r8H4ZrJziW8cE8kPQLyx1k5o9QLSQID2QQeFvJS9r+qgD84m5CuA
         2Ox5BgNEdgwu2mBJYk9P4zlBjqPxbsm7nFcW8WIyZhGE4bGuHB5i4htU0FlUPaR9LP9X
         69RIup/9VGZvU6e+IVWuUuUFrDO7/gegU9SPQKI1is/krWFqRD/eDMBm4o9UlLaJabJd
         CX8p/VKNDhpqKOeEqWzVkkMslg8RE0oQj7t7vYunhlWz+Ui01NnT/fd6RaTx+/c0qgM4
         +p5X77ieTu+CkwMSltmCGCnhnDgic981ZW1peeS2fAVXaEC6aocpAfOGezvz+vlw4IkN
         LkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637247; x=1792242047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZGGWiHspaUSLm7YkvfnqPFJNEs8gUx31Fh9NnvvTUo=;
        b=J6MQBQyLwVNJoxu9njcKUOIoPiXLnff+0KXS+ee/0iIjJcnlTAkh3vBxu3XY1SqVLE
         2Rnta3oj/CdZKOgjMUv0HWdr+9Za1oHzpFzWE82S6GXqZ0u2jIzFRgBFhUJHEVXCBFlc
         YcUi3vp/SqQ+QkRVYd6G4mMfhy6ba3R8I9lO0I0e8S4VK/FuekwlmW43/45qspVCohIT
         hRJ1LNLq34tkleM2T7GOw+t9HTnDTL2sd1LEc0FQ/y4On3U5yjQNwi3sVizhKPdDgmsD
         9yiA3ciqgHVMv4ZaNB5oKkhS+/eTTzEkvZY4JH1/9OaRkkseoIAMhHJ0hWA7ucrEf0FY
         nOLg==
X-Gm-Message-State: AFq9FYIxpmjSOScFNxoAerOlUsNjOIX/gIIR4JW/Cy0HYPZDhVfZhZDR
	UY3r6BFd/SQQmzjgpJ4j0xNZS+ykSjilIxkCvs+g2y2HoYhgg+Q2BP23
X-Gm-Gg: AYBFou0gfXNdXCZVgkhj7h4iUbfGrI1zBLpiPRgpduJX81Lc2H1BNgIzCJthw7P3Ep/
	yL4JRYnGoRAdnbTqQVCCDBvEALLQX4s6MwnoCOr7c/OB/IGDPbMypmVPReOda1KcfZZ+cfXi69b
	FOq+OdFMShhk6Ki7inptCkEzF3v7UJs67/vUXHpmnXe+2xmI+M7GsT2QA18AorIx7N2iDvGLX+R
	8yBMxVWCzZeiE21XvArGH2r62wmloFt7IWjgRskwsQogsBd67/zYbLE/7HwHoH9MxTb8bCZ2Eyq
	iZ4eCQSMbLKfZS+v8ehn//+ywiSSLABlglos527N8tJK1xV1vqK8eJ4vIVfrC4kEPSg6T7ZRwPy
	KoTXQQthppVphdyEyi8LGuYNv/WwfO/dulcbVu2jQtS9a/r6XlLtj6FlGj14D8HtThmF9JJWqp0
	22F2jrmFQQ5JP+NgteK7iF+coWyWU6wjfpqHzG9GATKHV0W79yKyx8niha/6wWk+k2kb5U8s+aJ
	VNUbh4uEieZzQkeC0DWYhhUDa678lldSAxbMcl/SlO+gaiXeOHU0tznioeqbR09YVaUNWSqawsV
	LcOJxuEku8Uda+QShOQF58L+fdpaBSlI7eyIYVQ72Rs3nyulzkWQOIN8Q+VAyQ==
X-Received: by 2002:a05:600c:810a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a18e3ef100mr78533535e9.0.1791637247192;
        Sat, 10 Oct 2026 06:00:47 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:46 -0700 (PDT)
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
Subject: [PATCH 19/24] dt-bindings: spi: Add ZTE ZX279128S SPI flash controller
Date: Sat, 10 Oct 2026 13:59:57 +0100
Message-ID: <20261010130024.177503-20-ghahramani.navid@gmail.com>
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

Describe the flash-operation controller and its work and register
clocks.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/spi/zte,zx279128s-spifc.yaml     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml

diff --git a/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
new file mode 100644
index 0000000000..967d460ec2
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/zte,zx279128s-spifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s SPI flash controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The SPI flash controller of the ZTE zx279128s runs flash operations (an
+  opcode with optional address, dummy and data phases) on one chip select.
+  The data phase can use one, two or four lines.
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-spifc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the SPI clock
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spi@94406000 {
+        compatible = "zte,zx279128s-spifc";
+        reg = <0x94406000 0x1000>;
+        interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_SPI_WCLK>,
+                 <&lsp0crpm ZX279128S_LSP0_SPI_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
+        };
+    };
-- 
2.55.0

