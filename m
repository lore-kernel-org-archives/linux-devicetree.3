Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE63486424
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962603; cv=none; b=lAbTBK3PNF2WMyAnxBBZ32ku3y1ZulVRC8hck/buZT8RQbMqwNMHHrhtGeKHXz8N+6aoGIp7GP4RcX7ombjrdQKLcdQMwwgrg5y9Exvwm+EpCu/GMUQftB3foqpU1QCsqNd/Ss0ybXiZQbxiM9QDVbDhRZF6PMuEoSzBIdebfhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962603; c=relaxed/simple;
	bh=AeYQ6bYHaMT0p/kFWJE/8MdQoDiA0voWCHbJpcoug5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmubF6GyRe3OF85+U0z6A0b9q1cwPkkYY05qcM23+PU0JaMoMtI8c+7CLJtlltqGHVVLQbMpaTxt8DCBdjUJKMC1mXbcnGNsf468iNsIvIA7nVPRETGZOpHcyVUQRfOtt7TWzdoVl4tcwdosqlycshV9OT+4xbTSDI5TgUjcgEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8kIWwvQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8kIWwvQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2667172f8f.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962596; x=1792567396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mD6uhOC25MC0utvblQcaawGrjbm/zqFeoGXg401bJQk=;
        b=E8kIWwvQULsySlwroE72e24FpkTRxN5fawaXylenavv6N6jwkPO7N3jUqPsJ4ocNuX
         vWzXHGf4az1F0zrYdgQq6AmgOoECfVZZTzP2DJotbp5i97wMrfepdtBAyYncJ/+Drdff
         mMEFj0y+ZEnoPawbXHaPOkRaeRJXn0Iq0HpHvkX9Lg2H17K797RZhLHg44iuSI6s2+T7
         sy0JagSoy8f5CRHvAWQ6qC88KH1cWO87wenyjvyK+prkf7WbNUzOCcRQlMi5KrhT1D0I
         iQbQgGNfLZTJk0a6+GASUJ37xeIJeR87mSgwFNb720fvb6X7fL4OrYvQ+VbL/hibJhVg
         VfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962596; x=1792567396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mD6uhOC25MC0utvblQcaawGrjbm/zqFeoGXg401bJQk=;
        b=hv4FtUH3YYV6P2epHO5X4QYmI7Eiwh6hJbvsfhlzEd1BOlXjs8fAJsOe576B5HhBSq
         YWQescq/p6yD5TGZ9OgjMiaaEpWum3qLaQn4O0LEabgIbzNbQNf9HD2XLXrC3Fdkw2wW
         L6tEEM1lzk+8jUyA4InIRTVqg4jX2Vdqmm0bK/O0K2ZrHId8YFCQmlcg1IkZDcGi1JKO
         4d+wWcZY99jbCfgt8WKQ1uydQlD1k3WPrPbS5ZiHTHJdvFgCPwzNk3NIB91KZRwyZRL6
         7dDmZ4I+UwWdO+a7BLStk2b3zaAhQGPMG5+UEEtRhE/0HbMcVQn0WoP3FylkvW/iAyn4
         1DiA==
X-Forwarded-Encrypted: i=1; AKwUvBzf1sRFDz+Fn1bz1g9eqh3VPp9kGnVPrVzMEMecIL4fIDnVD5gzMvVrOuPCNGrekuBIPEfKGeCMLPnX@vger.kernel.org
X-Gm-Message-State: AFq9FYLM7Wl4O5TkY4ocxGtyoHmAXzVmFEEoFw4y0NCm7JE4BJrUlt3m
	BXJUWSCOoHB9v3pfr/W23cpUU4TOYvmwRgh09OO+FWeEihUfX2D6ZPtg
X-Gm-Gg: AYBFou2VDcwh8njA2CgxFcRlgOUjTaaOdtIudSEthB6aiEs1OocrwuKvCem45cuRoa9
	Bk2qALKFzlYv97tyUMyB1gNgH/8TZ0sIWN2UOsnT23g3rbHkMjJNbOtv37AFGdmKp3SBBsGRQWf
	4iqn9UVCnEm+9j9kxA96T/LmUYAwew6GDr9XETuVD+AXl05G3Zn6I94SvzMamuWPto+dr9MKWza
	toVJf2YsyyRK59gX6Dlxi0s6OZoTX7siXH5bsSQ7rZDEPSR2v37wKNYqDjJgDdcaD1bjzLxPklP
	raQ1/8l/4p7fEH+eQWBMqTDG6tB/vs36QV44lyJvUzBRXJ8v2S8lAVSapyEQ2SMCtiYs0q6TnGm
	SAGUViSrKlO6BssSge1bLjOeIPa2XTo4ULHeQKb8MXcWVyQ+MijN3xFV8sBaZ1FCJqlEhRbjy1L
	mFODbjD4jSD8EB0pNWTePHY/4XZk6ywwHKspSOAeyEn59zGJcWOnMzl1Pr4FZpH/R0Dt/jnyVdu
	ALcTEXoh1JtqAROj7Vp3z2fosrgzxaEwzJONt9JLdOkIskZ8sTdGRGziOZ2BCfV7qWKvAeTn0gZ
	8ymv/lJeZp0D5oH9rkMFsaQeucFKkXf/p8gXI1MxHIMeb6QAOfflN3uwAbjg7oAM+D9lULk+
X-Received: by 2002:a05:6000:27c6:b0:48b:11a5:d42 with SMTP id ffacd0b85a97d-48dbacfc1demr18369617f8f.30.1791962596282;
        Wed, 14 Oct 2026 00:23:16 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:15 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/24] dt-bindings: usb: Add ZTE ZX279128S DWC3 controller
Date: Wed, 14 Oct 2026 08:21:01 +0100
Message-ID: <20261014072109.1759502-22-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the USB host integration with three CRM clocks and four reset
bits.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/usb/zte,zx279128s-dwc3.yaml      | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
new file mode 100644
index 0000000000..2fd9fe0cc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/zte,zx279128s-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s DWC3 USB controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has a DesignWare USB3 controller (DWC_usb3 2.80a) with
+  integrated USB 2.0 and USB 3.0 PHYs, used as a host. Its clocks and resets
+  come from the top clock and reset module.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 20 MHz reference clock
+      - description: bus (AXI) clock
+      - description: 32.768 kHz suspend clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: suspend
+
+  resets:
+    description: The four reset bits of the controller and its PHYs, in the
+      order they are released.
+    minItems: 4
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@9100000 {
+        compatible = "zte,zx279128s-dwc3";
+        reg = <0x09100000 0x100000>;
+        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&topcrm ZX279128S_TOP_USB_REF>,
+                 <&topcrm ZX279128S_TOP_USB_ACLK>,
+                 <&topcrm ZX279128S_TOP_USB_SUSPEND>;
+        clock-names = "ref", "bus_early", "suspend";
+        resets = <&topcrm ZX279128S_TOP_RST_USB_B11>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B14>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B9>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B10>;
+        dr_mode = "host";
+    };
-- 
2.55.0

