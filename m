Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0103358D6
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887024; cv=none; b=oSAi/5lVeAwuQqe5irUa7FPRyBZ4swu1HUifh9hkc3wez/QqpvmG+vzFqd3j+x3L+ic03/0p7RxvAfwwevi7VVZQvH17aq3PvcZZMQfngqLJnU8XlyZ4B79m3uPSAZsfkGTNkylysgX7NfhIwjG7GYiEesJtZxXG67XNBGiIzlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887024; c=relaxed/simple;
	bh=PXAq5819wTGn0F3nNVbrQuezlvNB6Q+Ykg24neiJW98=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IkF+JnNh8rdL7rujj75XwlWzibRA8VT9mAE0cxjmJk9Pdguo7mbVKd0uE49gTh9GG/dxMPmxfYpKgmBtrmEqREaKK8V3/HDPLco3HRRxgnlB3ngaE/gYTfRdku2HVQcYJhIwH2Wasgw3B4Jf9F+4yGN6nMKqkETj7hQde+3jh2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iju3rkxG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iju3rkxG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso25089055ad.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 19:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780887023; x=1781491823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVfBDie60n2tkYsVA0eLmiW0R8D3OP3qoUkg6UxA748=;
        b=iju3rkxGN39CQNVY9h2e592Wa18NSFC4oSmBa5FaitQrKhWx5k6zFqaz9emy5Xr/2a
         T1vcmHIxQLloWGDXStsBqJCAHt0bWAhHrQjP1EJ14JhvFAr6L2qWkaxec956BgZwexWc
         lGTdUjnnspT3H9xwJmSteRyWjptAnoo0gJTF1bzAmQ0V0id3Dudv/EgdHPJWc4Q1eCxX
         oG1GsV1/bBP6KkaAh2xpYaZ7P7u+lF4u6/uNzD+1u0mP4CsjSO7jIsP6UQhfSQQZRHnq
         dUK8M5xyS90IAK8NpMUtkDEaqfcArWPCR4y/Xon3FPEbgo3Gp0qBo9/QnCgsgQkClAPj
         CCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780887023; x=1781491823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NVfBDie60n2tkYsVA0eLmiW0R8D3OP3qoUkg6UxA748=;
        b=Obu4kMX7BdzvkQdSt9AvojU9UFPnGbZRxv3DyAalkQsQnrzAJWo/u6YtnHyLcK3xYZ
         BDnPQxiWByez6+ckrs4WxxZcFr61GX/TJCdXB6tW6lR8+QqTyaNuu+ffG9diRVJS30Bp
         occvifIj3sHCaBz5z8G8v1Bfd2jzrfGw/FHDcnWWwyzbeZ3fv06cK7y7HweIoAE2CHu4
         bWEts98js+2pxnpWiuh4j1cXgKfVh/UU/pX86eu5aHlhkwH7AvvltUu1Mvw/EQQWY3Si
         IW231Sp/ao8pyWf5ihi+pTmY+VhO2XuWdvieCXamVdesY830X7IS+nJTtOr6xDeBB6vE
         7bMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MgyrOHcEyJ1qjwSZw9xei4J8SWwPSqG5ZZBAoasGvPPOvStzqnB+rKX6E2PBM78hNvS6PmFj9chsY@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxs6ytbnGNMAMrsJ9HmqQjF+1MFzuCLO+uRhoAQ83QbbnWag5
	L3YVgNXQDs+54FiLlga9aax56b5CAT8hd9o3+bKNfrFRgLyI4clabSCf
X-Gm-Gg: Acq92OHSy8FltZOynRTqu614Cwxs1UM7d9eBERsuacdsC44W7TAhzw5PJlWyt75nVUk
	9FSBX1PLYTka9SzsgnxIaFtgUZbzh/ufRDX9mCvhsLklnezMe+RLqUMXlwWgqFcCPjA3axOPnlh
	IAhQcNLsxHB0uawbP8LeaKAti5McfAhg+DbTf3bypR0cUzeHckuZtsMu+75mbYvzOB9WqLWhM52
	9hUeGJinOSsy7pBlmGolEhnXLSN+200Kj7Gx0wJhGHDBAwm9CAsv6AEyBnPPYBPikbk1q9qqYVL
	JNj3Trq3zCCMGDrKTErDTksioxYtpCJjRblJTYYA5XV8XOW0kB++lubcIYaZc2YppezbHzbAdAz
	Nfsr1e+yG9wNvy1zr04P6TVPCYU8ishaCHEgVi2FzROO6iRuHOzJLBO8l+n5PmKDB9BHxcR0ghr
	dEDeu2FG1IvVjKVWG3gQQI5ve1nOPnl1CNRZBuGK2P8ahz9wlixbXbXuNk4DEc+8liWsY57VHiy
	hqHf3T8xCPIx0kqnO4=
X-Received: by 2002:a17:903:1965:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2c1e80edc5bmr144390375ad.32.1780887023133;
        Sun, 07 Jun 2026 19:50:23 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm165745555ad.3.2026.06.07.19.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:50:21 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
X-Google-Original-From: Chi-Wen Weng <cwweng@nuvoton.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: [PATCH v2 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
Date: Mon,  8 Jun 2026 10:50:08 +0800
Message-Id: <20260608025009.1504971-2-cwweng@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260608025009.1504971-1-cwweng@nuvoton.com>
References: <20260608025009.1504971-1-cwweng@nuvoton.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a devicetree binding for the Quad SPI controller found in
Nuvoton MA35D1 SoCs.

The controller supports SPI memory devices such as SPI NOR and SPI NAND
flashes. It has one register range, one clock input and one reset line,
and supports up to two chip selects.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
new file mode 100644
index 000000000000..68e6d79e6b7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Quad SPI Controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-qspi
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
+  resets:
+    maxItems: 1
+
+  num-cs:
+    maximum: 2
+
+required:
+  - compatible
+  - reg
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
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@40680000 {
+            compatible = "nuvoton,ma35d1-qspi";
+            reg = <0 0x40680000 0 0x100>;
+            interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk QSPI0_GATE>;
+            resets = <&sys MA35D1_RESET_QSPI0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+
-- 
2.25.1

