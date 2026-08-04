Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B52A4457DD
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833556; cv=none; b=TN/xy5wNMWnKQwnWwKD7p0LKXIia4Pp4UYjF3hMMRxnKYxKGNedHMxbq3OVno9TXeRfja1S2+QfuJenj4Xz637+ePeFDEXu8H+cNrQYIA4f+7UjDn9U9TB4o9iDgbIbRC/QVe/TVj5Q2jiq2TSZHinZiBCAq8x85/3r74mRklaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833556; c=relaxed/simple;
	bh=O8MDKZM6orbok+3kIkwxaUSh/e4nFOYJeY8hZUI/E60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sB4WsayRUWfJo+m5i73DDE2eOl5cF814jhv0muFxhBcS/k+iOsS7nG35uavelIw+OT95N3UznvJNsn5wlWCfU2SPX1xnCoOJSNqKDnF8nEhZ4kUlf4dhuJ3iurkisZ89nyx8d298Z7KQeI8rHwwMGvGylxfK6ZCSw4cM1Jzcqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkTBn/jN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkTBn/jN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3971027a91.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 01:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833555; x=1786438355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=DkTBn/jNPLWCBlZOtiGI6Kko8xSuApXrwBGBxx0bVArBSBLaIMCYU3J2+QLfhwdzX5
         d/GsE0xsk+4Ah+3NARTemQrYKYz7Gi39M8FWOWp0wCM3+as6yR1julVV6QOKnAVeLwy5
         FTj+Aa7Q3ewoRFPm1uys3L1QAugF7kX5H5KbkIbJp2QZBYawJ+uVUQNHUBIkRccgwX7j
         rqaKJkePK+2J+HxgZtBZ9GlCnVv+7bG4gduSovwveQK3Pe7AGvTM42xRp4UNhANFy9ly
         OpOph02ttWXmp5CVC2bDmadgOYehU9VZbWYPaDsMflT8b3qIYXXgbKR6btK+/zqb0C5E
         RbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833555; x=1786438355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=TIycUvfUPXsQmoClnfQX4PT7k/I/NYLKQnIOxis90PnLv5J+rf9W2XFP5ZkctlRYMh
         uceSYdO9Fwq5JJPZ+fytsVWQgXjFBPApIm4j3o+jgsIiPjptkZt2Lq6EX1ZAeaCKXr1Q
         ayQQvQDxZFy3HLd28P4ZAah1QVyOTuLIoEny8g4bTK4jSfiMwAVbqkWSF2K67sRvG2We
         TUWIzwp54BF1QRxwddue4z9i+9TEncTIn98Sq9INAtj+vtzpIW9ED2sOZbTG6zK03iSK
         pyl4XjEcWgXzeGwgDnO3I48vUJCZkpGd6OYq+vTlYUh8F0eHGy/fEMqXhGws4w9H7vAw
         jGnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rptf5bU7jU+cmav3ri1+aqxPDv3tsVqeu7bNWJ6RKrtMk9CUlkw+/WkxxtvKUKZJehdNzeswDx+Hyg5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa4W+D+Ytz/DHw2iCN82kRs0MsbhnGxhAEWCxGjSTWAbUdziY6
	MlTlLy1B+Df9HghRk2PyhymSeDrS8DHmHQiJqjWeqh72rbncqf7pV4PzumZkAQ==
X-Gm-Gg: AR+sD10umMbwQUv//rEB+luUavlQm7MuDGy7mjhOmcCWLJ+Oitxvcw05b52oegDwMwx
	ydu5XCfJTAAIeX89HbpAeYlCSE8H6GEQXFyLKiHVLCAYDjrezhzSpaR5m9z2ubMW1t2sQWiGMEs
	jvokSl7Hx8G+zSfLpdSPD/U38COuwy2ynMvZsQw7e/mUJ42bLI1aGX4yfdDkkTJh5qTnAEbM3rL
	GGENuq+KsUtLbIu2CT+sSD/9+ouaZXcllD78DpJdpjJUVsxFtx9a/MhPAhxaogx2yj4364sPlyV
	maJ/iq5/MsmKhJmJQ3Jz4Lm3+RvC8MMjZQGunooHmIPxMvCiNbawS42w9+jYO0gL+zLH61bLNun
	/AZjAmLz0Qz0XaJ3Kewt0BG05hf7Y56aAMoeWaq+V1Pe4Sb8rmmmdC0T6JZQmoJ4FM5+8kWrVzx
	Db8VfTHLs8fOYRh9sOnBImXkm5RKds+CWkhyAtYHSWNRpEJRTVEEEOnJpW+60BPp7c2jDeR5NIw
	yrQjpYaOPDBDtUFzehalBCG+oHwD5so3yZcPBGRGVZHrpM=
X-Received: by 2002:a17:90b:2dc4:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-38fbc3ff292mr12609070a91.1.1785833554854;
        Tue, 04 Aug 2026 01:52:34 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febffb36dsm1012000a91.7.2026.08.04.01.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:52:34 -0700 (PDT)
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
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Tue,  4 Aug 2026 16:48:04 +0800
Message-Id: <20260804084806.1846570-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804084806.1846570-1-zychennvt@gmail.com>
References: <20260804084806.1846570-1-zychennvt@gmail.com>
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

