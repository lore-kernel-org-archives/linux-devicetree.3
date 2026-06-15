Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4F121D596
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546226; cv=none; b=p7zKD9VoSDl0XEPkw4D7KO628acpjCzHIE7hJJmN6fyIA3SyJPjXtzoviOa7Cz/ELLi5XNTMvD7IO4a/Hm9rstLljgYMbMxn/SxNckJvr0PurBCNWDaRpUVwLpGauvE3mGvZcP0pkCv6yBsDtm4qMKFC+50x5vuX2YU2shU1g6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546226; c=relaxed/simple;
	bh=rOPdLVNQAp1nTGnlUwqvlLWVZujALkOGb1Bxg9QpYI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYvzR0//cHdX4YtB2UP3hHMx+ft964H7OXtRaNgyS3KV4Fnt+VpEBQPaohtDWgfp3N3wr5Oc49M+6kkg2lcUxgcGRxY8oZRet+XCFW9slFY4abWzAV3pWAvIUpiGp5K6E10lI4gijgvVRrzJX14DWxjRb1g42703R5pT09URYMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUe7FnGZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUe7FnGZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1719791f8f.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781546223; x=1782151023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IObpZGW1nPLNyJWjL4oanYTX/zkpr/Wst7RNFyVlhkE=;
        b=HUe7FnGZDafgfEGhBgBA4QplhSB1yfwOewQnV/dlLSmzUI2+3UIJUwxAH210gtYTeR
         jS09SZdIELL/M07e4KvdLgsuQIGN1EtU4xbnBIjjVTFBf98Lh1ylIpXG5OWuVHHz9xSc
         ZIog2RCUijrLDjGacHKl5h2kICmlJddVEx8CkZoUMKYIcg8Oosa2bHnhW88iP24Ox+7h
         5DI3WdMzPY9mmOPe+/2myJwt3nYf1kOQ59wgexyP0D7fe76MZRz5olf5X5aNpiOH2vPY
         +ALTmGdAZOOJUz5MJZAx9S9bP7olMhrLXQdDhR+286hpl+L0HJSo3O2YN7CYgv/Xi++Q
         stKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546223; x=1782151023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IObpZGW1nPLNyJWjL4oanYTX/zkpr/Wst7RNFyVlhkE=;
        b=KkIFeqNl0kWakpnYAOs7MijA3RBw6k1DNa0AseTjcXdZ8S1veqdxq6svPp+mRcVB9O
         l7NjtlJOJv96Vd/rOSUmQ3qQQCoywLAOKrIZi8sQI0gSOQYXCIbo9nXvQd1RFxC00ucT
         P2CrKPWXYAUATGnmM32iCv+VKXOw6Qwzx7ej2dbOKGN5cEZPf+NPlahMLFRNl7pR6IhW
         I0A8cbsUDgIKHE4A/AnyE0DUVon+B1XyxLMSS2PalDC7wn+1P9C0C0TaWYY3/etp2Mux
         1A/UjuOoQa07xNC9PHKlDeXyc/xT0kbwh4gn/gLgLcMv1NAO5eYklsVTBXMcrAOumqBx
         s98w==
X-Gm-Message-State: AOJu0YzHHaXCs7ISu1XjAI4hn9Onuzvb2bMFqo3HeWCM3l8CSmMusy6K
	DS4wRNvSurNKG7MTayAskykjB5pulDrrGRdi3GSvO/jYEyR0mzfr4qwA
X-Gm-Gg: Acq92OHj//uXaQNSfFONBmmx4vMSn2BB+UtH8GfvAJAeyG+hjbEYYnged+3RhAODAFI
	mrRp6VfME6iT336VBX9AcBV9Nhq6XiGTF0H9JAu92ovAe6TzAXqSPudwQ6JfATucxN8WVDFthzt
	MByBLe3nblUt3IgttiFx7v9TDqYRM5/oyOoRaLW1zhAsx9cKUY9G5vEvC4xYGOitFFD/8XPuHlk
	9P8oRfNgYv6ltv0Hw5rKdqV7Y2SnXX+wkDvKAAsRbL3nxgd9w3oYXtNkoARDis59D4Oclazs0QC
	nafHyJ7R9bQq3PkFpu7ukmS+bm71D4wXlr7qfXGWBqxesUTPD4Uq7xkn6AZpObSu9rrJEkGiGDt
	nWCji5L9sfF8f2QqbYE5szHB67OsoxRvipd0jS/ROVsP7hV7mLvtX+fZx0eFylRzt7oVYVWtC7v
	knOe6TN7qex7Bja6uxsj0q0RGpfMIr/g==
X-Received: by 2002:adf:e001:0:20b0:460:71e6:e3b with SMTP id ffacd0b85a97d-4619f3031a6mr650368f8f.27.1781546223003;
        Mon, 15 Jun 2026 10:57:03 -0700 (PDT)
Received: from anthony ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm38543721f8f.5.2026.06.15.10.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:57:02 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	javierm@redhat.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v2] dt-bindings: display: Add Solomon SSD1351 OLED controller
Date: Mon, 15 Jun 2026 20:56:20 +0300
Message-ID: <20260615175620.88828-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
RGB OLED display controller driven over a 4-wire SPI bus. The binding
builds on the shared solomon,ssd-common.yaml properties already used by
the other Solomon display controllers.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
---
Changes since v1:
- Drop solomon,width / solomon,height: both are deducible from the
  compatible and are already declared (as optional) by the referenced
  solomon,ssd-common.yaml, so a local override is unnecessary.
- Drop the rotation property: it has no consumer (rotation is being removed from the driver).
- Use dt-bindings/gpio/gpio.h flag defines in the example
  (reset-gpios active-low, dc-gpios active-high).

 .../bindings/display/solomon,ssd1351.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
new file mode 100644
index 000000000000..39622d74a41d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD1351 OLED Display Controller
+
+maintainers:
+  - Amit Barzilai <amit.barzilai22@gmail.com>
+
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1351
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        oled@0 {
+            compatible = "solomon,ssd1351";
+            reg = <0x0>;
+            reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+            dc-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+            spi-max-frequency = <10000000>;
+        };
+    };
-- 
2.54.0

