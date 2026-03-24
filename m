Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56B3C7E0C
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334420; cv=none; b=OS3M3rsV5f6xmG1Uxztcc8n2hCsxXMV0uhiOvSId/TnLqI0rDhNOnrRbjl0kjJyC1YAwQZAQIYBVGGQkxv0kA0y5+i/tHUDeEXmCe62We7IEhIYffUJCzSuknZ8gzNR8LDoGSOswiL63Ii+7P3gj+L/3kC3HJx0vRQujG6DoekU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334420; c=relaxed/simple;
	bh=I0x2CYlsya/0TkxpZg4isJbbaEKJvgNnG/ZcBXcqYso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5PaYTlgMupP1A/T6FKFR2VlK92oVq9WrVHC8NN9NPK1Gl6OrI8dkQjHfDFRdVoTSIMEq3W6r5hugcHz+BZ515XUeT3J35jeRFUusQK87x+3XTbomjts28Wv1ljQ9Yuk7IwOBNaQ4NSAlKpVQ4hdYUwz1AsSCP4ygyqruGw0gd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JPe6YGcf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JPe6YGcf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a8fba3f769so23101165ad.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774334411; x=1774939211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmfN5FmsExdbcn4DHUdyn65cCMHIcyMfjFNYjbqU8ZE=;
        b=JPe6YGcfmma5p1cUw0WFcKwlKmvj8pYDCH9sodtY7xVmMA3Oqh8rBuk6Rfoe9cvwCC
         LAxHmZapOrOX67nhBrj77UOb/QWaGDsjjiBsoH3pmgsrP/0bp++l+eB2E+5DjmuJkvPl
         Tv9KT33Fo1kmQ+s9AHnqrONUAcQjAYRnKfT0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334411; x=1774939211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vmfN5FmsExdbcn4DHUdyn65cCMHIcyMfjFNYjbqU8ZE=;
        b=XouOF0y+d4CNwPgB4tNM+0HITQj1laJyIHwBzRMrCK4jdU6gQbJQOupTf84oBd6+dM
         rWYvsPiboPmvaXgR2f/Xi8tRpBcJF0bd8Abl29999ETYdOiLao21OGUm+mjVxflbeBtX
         LRz8T0j11FO3sy2lfdoMeDElBPRW8p1k3/P+UdYHQPLmy6y5ouK6pmwl+bfr0j1wJuEM
         cTRmsddFuwA/xBiwOMMkiKJvK8Ah/D1wcW8rS1mGfjiiU2LJTwaxsmvvEUaTDc+Rfcr8
         Rt1gWgWKo+PXRxeRa4u3BECy3g+/k/fHxiIhgoSdwyw9zBne5C9wAG2JEsPRT6SmJHjQ
         LFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9ANrc4Zkiq3t/80vlxno99N8NHFTrsVjZhxZvPRVp5pYHE9hnOl2mOKRC1lb7TteLvudLnoGHt61R@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0NNgXCowPi/NE8cKhJFj7/msuCwW4guWbozED28pFgvAWwuL
	470v5F6SBOO6vp2qyrdEksHb44ELGul8489aI77eX/OjLks/YB1TN0Wj8K5CX6VwsA==
X-Gm-Gg: ATEYQzwMZyMutjtRUagsYmR9k5ORsp2CCxJbmbcVzDxEIB3DfhlsuIYxzK3YCOE0sQy
	NjI6eMEke7AX2F/73vkbrjvwr+O4dG7o1tUW9gmpbQ95KfNK+fRag3siePEefJ3Kgw+CHcrQdZD
	06IL/63DCtc2+u24f2GWer6CPuSDFf5O1pH6//3AK9SrM3XGZiZg5+ArR5/0ZV1bczozXVDcT0I
	jFK0CT+QY//jd3HMjuUiOAX+PaM5ylhS0D9BfnD0z70N1NbHqDhLJZs2py1hOBXqWfUye9IC2eO
	27QeTNSG7sGHhmYg2fOw7IBiWBUNjVFwmCobgOIUKjLfbLklE1EWpuda/XElD4bcmxgrvFMKwj6
	JCVmMru/8B6i6EW9BGv2Xm11WwB4yZKp+wHViZ/CIVUi9VyHO8zHebdGBscZkeX4REJ07cL25OE
	NmHbdmxId9RYLXHQ1sBiFHhQPPxh5RhWL1hUIsbMUO2Du/cI2J2B3+2l9TphOIaeJMcDoyTtzxH
	3rIZOXrkFpQOEKfm39hBIdIa47a0LwHJdFEPH5j1auE
X-Received: by 2002:a17:902:f651:b0:2b0:4d7d:fbc8 with SMTP id d9443c01a7336-2b0825e0b04mr139394415ad.0.1774334410624;
        Mon, 23 Mar 2026 23:40:10 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835429afsm128416545ad.26.2026.03.23.23.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:40:10 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 24 Mar 2026 06:39:42 +0000
Subject: [PATCH v2 09/11] dt-bindings: input: Document hid-over-spi DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-send-upstream-v2-9-521ce8afff86@chromium.org>
References: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
In-Reply-To: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Dmitry Antipov <dmanti@microsoft.com>, 
 Jarrett Schultz <jaschultz@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774334401; l=4683;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=I0x2CYlsya/0TkxpZg4isJbbaEKJvgNnG/ZcBXcqYso=;
 b=Wd4UHeJCa7yzoQMx8kpcrdTRh9ZPmUZ2TgcHdNkjZOoJrOu56ULT4r/WjLCmtbtGg/Lffo9HD
 mwgl9wmJhmvBIaFZfYBBF7eQ+TVVS8ocx+e4UQRW6+Wvcw0ow6HtA8N
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

Documentation describes the required and optional properties for
implementing Device Tree for a Microsoft G6 Touch Digitizer that
supports HID over SPI Protocol 1.0 specification.

The properties are common to HID over SPI.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 .../devicetree/bindings/input/hid-over-spi.yaml    | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
new file mode 100644
index 000000000000..d1b0a2e26c32
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HID over SPI Devices
+
+maintainers:
+  - Benjamin Tissoires <benjamin.tissoires@redhat.com>
+  - Jiri Kosina <jkosina@suse.cz>
+
+description: |+
+  HID over SPI provides support for various Human Interface Devices over the
+  SPI bus. These devices can be for example touchpads, keyboards, touch screens
+  or sensors.
+
+  The specification has been written by Microsoft and is currently available
+  here: https://www.microsoft.com/en-us/download/details.aspx?id=103325
+
+  If this binding is used, the kernel module spi-hid will handle the
+  communication with the device and the generic hid core layer will handle the
+  protocol.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - microsoft,g6-touch-digitizer
+          - const: hid-over-spi
+      - description: Just "hid-over-spi" alone is allowed, but not recommended.
+        const: hid-over-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO specifier for the digitizer's reset pin (active low). The line must
+      be flagged with GPIO_ACTIVE_LOW.
+
+  vdd-supply:
+    description:
+      Regulator for the VDD supply voltage.
+
+  input-report-header-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffffff
+    description:
+      A value to be included in the Read Approval packet, listing an address of
+      the input report header to be put on the SPI bus. This address has 24
+      bits.
+
+  input-report-body-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffffff
+    description:
+      A value to be included in the Read Approval packet, listing an address of
+      the input report body to be put on the SPI bus. This address has 24 bits.
+
+  output-report-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffffff
+    description:
+      A value to be included in the Output Report sent by the host, listing an
+      address where the output report on the SPI bus is to be written to. This
+      address has 24 bits.
+
+  read-opcode:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Value to be used in Read Approval packets. 1 byte.
+
+  write-opcode:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Value to be used in Write Approval packets. 1 byte.
+
+required:
+  - compatible
+  - interrupts
+  - reset-gpios
+  - vdd-supply
+  - input-report-header-address
+  - input-report-body-address
+  - output-report-address
+  - read-opcode
+  - write-opcode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hid@0 {
+        compatible = "microsoft,g6-touch-digitizer", "hid-over-spi";
+        reg = <0x0>;
+        interrupts-extended = <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
+        vdd-supply = <&pm8350c_l3>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&ts_d6_int_bias>;
+        input-report-header-address = <0x1000>;
+        input-report-body-address = <0x1004>;
+        output-report-address = <0x2000>;
+        read-opcode = /bits/ 8 <0x0b>;
+        write-opcode = /bits/ 8 <0x02>;
+      };
+    };

-- 
2.53.0.983.g0bb29b3bc5-goog

