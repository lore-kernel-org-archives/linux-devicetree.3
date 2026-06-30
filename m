Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3234367B78
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782782488; cv=none; b=UwZSGBfsapo9Hz/fPQ4eInZBpP2QIzKh2nL4xKp5tFjBGwEWFxoFtCId+/fAtwmC+0ON7NDulVhIgpo9P8/JkDAjdoOUoES/BDU0+SdLWHeo9gsSAsnIL/Ohga0WZscKMJlqKtzpr1dz18bwJI2H8UQfWdTALH1vHHUixrf2TIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782782488; c=relaxed/simple;
	bh=O8MDKZM6orbok+3kIkwxaUSh/e4nFOYJeY8hZUI/E60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mrK4xml7VlZy/F61XBrpo+OPHl8QfcISMP5AjQ8+vx7icgWTV5A86Dt0Ls0rnTfmiKrq7ewkJAr+zE1sTOI/gbftljjGKCL1B6YGfKhB4NstklTZgDZ46XrFD3LiB+/V+z6S08MKyOvf9FT7lyuL3pXMcPbZ22Et5VQsbFYkinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1RpE15q; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1RpE15q"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso1098095b3a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 18:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782478; x=1783387278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=d1RpE15qeQRQuC+ysuyZpmbCbGMl4AbY42a3g0LAtcJFSE/IyIdnibKa5mgg61B7F+
         mI5Tswu+t+b88YPmYisRah7jSiNedI7xRTkfxYJwGNyU2qGWjRjmINveLXMsJyVBhkc2
         IYmbmfrUAN5amPjKuCTvVxiW9lbS+VSq7ada9m4rHQ0Envgz1u3MdVXBFXaJxK2sjHfv
         r4yKlZG8tocuIL4O9kr23j/mqmb/ACRGLzDzvHeACZmXkrNE85C2nJeZLHxr8k21MaHA
         fJjCgubisScmOco/T3211kMGTaz76IK5/gs0I2e2dtgl1DGK/JyYi4tTBD5GwXKP+X/v
         26Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782478; x=1783387278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=MhQ9T4Wa1oixGdxHfKChBvFKnxkX0GaHboV/c4r0j+7LqAW9ISC4jY9umQ1+mUe4uq
         0PiQecDQNHnDgn/DPA24ShMarvXH1AO+itiSyEttWtiOU1ugI/9RTPCJS4YwRBvZ+N+A
         rzEZjWLlJVzHyLa1hzryNyBBeeiX8ILIwvhFE/kurjNoQhm1KWoBfz0BspoegyF7cP7L
         s5WCCB2DlwCFiVIknVQviVa1dRujSX1bwYZ8Drt79AuMfl22ljEgTGA4xhOZ+w4razcO
         dG8a/RqrVYHxC86+dgBuIFrCrs1OzFWUoHf1KYuTBrIZM5dahOInzoNjk4ZLTmTkGDlz
         waEg==
X-Forwarded-Encrypted: i=1; AHgh+RpXIPCzf1+dcCZb+HPlxiJ9Y3dNGXUuHOxhLnKA3eOjfVB0DBs4RXlyMqwDsERP8i5kJl0CaVjXWtBs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu18nf+zgc8d5AUlpNAC6lhuenu4GMYJm4tl9mAytDQQM/xgJb
	pfcM6eeEk/2YAts1qNfzi7PddJMzvhxDl7JOcMIeufFnqqqlFG+8p2Q2
X-Gm-Gg: AfdE7ckhnYQSeKZ47uj1vVAxUdecUNZs+ZpMUz3+OFA9Ph+7jPKwze51Vy9HgiLvqXa
	PO/zWxwbUTMPHvfMOqcYAQTaSGrPfOCscwjFtfrOc0/jiEi03Ad/a129/Z8xofFXmfcbvIhFpCH
	rsWz4osFTugj3XAEQfjZtKlL+6ospNiusea9IqFJ29kDJUl/JO+jm6JbkCBXt/lr51esIENazBd
	OtvD9OziwGz1bOQ/IqjpPgwoXZzOp/imtkZE/7hjJQ/hEPhcUv+7M1oH8SipL9cUHbql00lkKLa
	Fh3Uw6phlmpAX48fOxL5Vevv7Me/M0ShzkYvsAZd+spUrYvbGnBzyuOjRe5tC1/76fujrumGgly
	QthkFC3Jb9igCJYqzmsPXo9VT5iOimPd8yCY9X0Gwq4ysSlWiEb5M3nXz6sJ9U1JlcHF0Lv5Eyq
	SkJFTqD8yMRA3+7uOxw4uh0TzcKEOzQHJ7Ejlc/A3lTEfgy8m5w9gx//GSI89TaPB0wRDO9Dk=
X-Received: by 2002:a05:6a00:94c9:b0:845:dedd:89b1 with SMTP id d2e1a72fcca58-8479f27ba9cmr1237175b3a.34.1782782477806;
        Mon, 29 Jun 2026 18:21:17 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm654503b3a.49.2026.06.29.18.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:21:17 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Tue, 30 Jun 2026 09:21:04 +0800
Message-Id: <20260630012106.3616821-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630012106.3616821-1-zychennvt@gmail.com>
References: <20260630012106.3616821-1-zychennvt@gmail.com>
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

