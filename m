Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A120345736
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304863; cv=none; b=eroUFIS08rf0gj9Pexa4sq5AFMCTL0X9R/x08xRBXzesO+DzU1SH7WU0fD/10rLQjLlIDoXeYCAQEMK+h6zAP71C42GnJxLbULUl5WdQfZ/pK0yJTXyoZcoDcqHbqJIC/1t4HWqwqVIGPd1GrOwMzZF6UNh1I1WBKkCMINwaKJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304863; c=relaxed/simple;
	bh=Brhw9cLH5ylmQDDlDuI16ieR0V8mAKyLCwpMqKfdA7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VL6IJqIYG385bynPTsjCMqLp5OMjD0tu7ESvQQH3OuANjbZPcGW8+dRyuxOVsb+ATXKgP3ZTtIaqLA5drRzZ9r2xW219Pu2A/Q+kGtPDk3oAuosS34RUl5TrB8MuHgzenocaL0tmVR4fduL9H3OEv6ahTZ+ps93SkCEZkNFEeNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBlLoQ4S; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBlLoQ4S"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7cb345cb5bfso41155317b3.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779304861; x=1779909661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5TTDq02y3Gl4AgphCYbWKzZgUrY86RmMrga/1rglYM=;
        b=ZBlLoQ4SgWl/Zs1Y5ySFU+lPw/+FrYhRk+SgHxY1Ka/72BbbQkxPFKe/4h745K0L4k
         AAeGK9ZbUr2Wmvc2bvPJrCf30t6ai5gjpFVC8qboK8kocMB5Uf/8rshp9jJtXEO/xGbb
         Bin4HFQHDTSZjdsVZ450Hk0SaujTConmaDDGxOkRnXI5/Hn7wvsAb4YjFkEDMfYkNXRD
         qILNmjTMNjFcY2jz07tbhARoq05jKkgjXI2kg0vmVuZX3dzwEOCx89BAVpsFEcdd/8nk
         I/DY/RLHUWpZ8Tj6h+rLGJTxZbG9fyKP1gSUttiGRvlICkGZxWKGTCWKIqWSWfiOgePR
         X/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779304861; x=1779909661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p5TTDq02y3Gl4AgphCYbWKzZgUrY86RmMrga/1rglYM=;
        b=jUTDVSrMqvn/RgooLJskcRCKOqFlS4fPNQ0+t9Yd2bBPRiQ8L1zPP3kCmreL1au5DU
         0hs6XyI38zx75G0y5ECaYFrWz6NBkBgH8iztAO7mm03tO7ICtyaGUfO4a4vjXQZvXj9r
         T/dLkbA+pK5xSOOfW/eyHW191WfCtrwdB090jno9xZRpgVUSBLIx5FyrDAk8hWeTpVpl
         1Kq5nYj7OmcjJj+lcTWmMRZC9u+c87YrbCySXTd/cY7D3P9u2fKzDu/lrKZnFPgGINsU
         LsMk6z9y0d3TpzBym0LK9Pb0gwyFS6i2+ZCj4W1MsjPxBZdYenyrpBotRUN0FpbQcC/o
         S0aQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Tc2NmdLtqZhR9tTW8I7tq3SnELuTblvieKy1EaSbI2fC/BBsWL7ZzKhOfArMXTLFKR18vWRo1l84M@vger.kernel.org
X-Gm-Message-State: AOJu0YwzIoMdTbRnL7eH3gsiw0wiM+g+y9A6vRFoN5mREiLzVGPAj3jG
	aTq6BKvhAbZw31vIPo1XDMnNZYvyXt6D1Q53poYZPpkhV/OusfMGQco=
X-Gm-Gg: Acq92OEZerPOz8QgwSXsxOrxmOYcnmAAGTCNr+hPiLlo1RJAmBLx4e+XD78iJPu/WM0
	WdeyHgbMuaNL6UCiGodF3DUcFcvpQgezGxXgwFLkDwyg35+iF/Q2Sdl0/23g0nTWacktZbd90Zt
	IEcYnymUd6JqWL5y7hwPGxOwFkwA3RCIcNaThOyvM94e5/ltkU/v9YkFZJ6yprxt5WwYe54N3yc
	BjdQoxeRkNq4m+QQAQXZb8S7NOXVwUvfUwB7Q8CneK8/vUFAmwMut5HiQYY8fFPPKimltxWZSja
	Pg0TTrAhkaoAG7bW9mmInuaEcf7YP5UQxNKxW8m4cw3Kw0uBAHHw122iM1SO7E1oN6Gt/v0YtqO
	drBfRBLCzIyEPYPiCSFvq+UCGfI4nYueAIQwAHch1eUcZx7bKctlBeXOKzp2zZkY30RN/IRULBx
	8qOmBGVfrT0ojkkU3zGVqEN6CmFgOyzc9laDHmeUTOVvy3FoiQuvY2jN1f
X-Received: by 2002:a05:690c:19:b0:7bb:eaf:5101 with SMTP id 00721157ae682-7c9599a2f1emr289856297b3.16.1779304860938;
        Wed, 20 May 2026 12:21:00 -0700 (PDT)
Received: from alir-mac.sitimecorp.com ([12.1.37.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9d18dcddsm56346757b3.49.2026.05.20.12.20.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 20 May 2026 12:21:00 -0700 (PDT)
From: Ali Rouhi <rouhi.ali@gmail.com>
X-Google-Original-From: Ali Rouhi <arouhi@sitime.com>
To: jiri@resnulli.us
Cc: vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Rouhi <arouhi@sitime.com>
Subject: [PATCH v2 net-next 2/3] dt-bindings: dpll: add SiTime SiT9531x clock generator
Date: Wed, 20 May 2026 12:19:42 -0700
Message-Id: <20260520191943.73938-3-arouhi@sitime.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260520191943.73938-1-arouhi@sitime.com>
References: <20260520191943.73938-1-arouhi@sitime.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the SiTime SiT95316
and SiT95317 DPLL clock generators.

Co-developed-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
Signed-off-by: Ali Rouhi <arouhi@sitime.com>
---
 .../bindings/dpll/sitime,sit9531x.yaml        | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml

diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
new file mode 100644
index 000000000000..ac88f2f0b2ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dpll/sitime,sit9531x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiTime SiT9531x DPLL Clock Generator
+
+maintainers:
+  - Ali Rouhi <arouhi@sitime.com>
+
+description: |
+  SiTime SiT95316 and SiT95317 are I2C-controlled programmable clock
+  generators with integrated DPLL for synchronization applications.  Both
+  variants contain four PLLs with automatic/manual reference selection,
+  DCO frequency adjustment, and phase offset measurement via an on-chip
+  TDC (Time-to-Digital Converter).
+
+  SiT95317 provides 4 inputs and 8 outputs; SiT95316 provides
+  4 inputs and 12 outputs.
+
+properties:
+  compatible:
+    enum:
+      - sitime,sit95316
+      - sitime,sit95317
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      External crystal/oscillator feeding the chip's XIN/XO_CLK input.
+      The chip's PLL Fvco is computed relative to this reference, so the
+      driver requires a non-zero rate at probe time.
+
+  clock-names:
+    items:
+      - const: xtal
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip's active-low reset pin (RESETB).
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt from the chip's active-low INTRB output.  Asserted when
+      the device detects a status change such as lock acquisition or loss.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: /schemas/dpll/dpll-device.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    xo: xo {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <48000000>;
+    };
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dpll@68 {
+            compatible = "sitime,sit95317";
+            reg = <0x68>;
+            clocks = <&xo>;
+            clock-names = "xtal";
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    xo2: xo2 {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <48000000>;
+    };
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dpll@68 {
+            compatible = "sitime,sit95316";
+            reg = <0x68>;
+            clocks = <&xo2>;
+            clock-names = "xtal";
+            reset-gpios = <&gpio 78 GPIO_ACTIVE_LOW>;
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+            dpll-types = "eec", "eec", "eec", "eec";
+
+            input-pins {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                pin@0 {
+                    reg = <0>;
+                    label = "clkin0";
+                    connection-type = "ext";
+                    supported-frequencies-hz = /bits/ 64 <10000000>;
+                };
+
+                pin@1 {
+                    reg = <1>;
+                    label = "clkin1";
+                    connection-type = "synce";
+                    supported-frequencies-hz = /bits/ 64 <156250000>;
+                };
+            };
+
+            output-pins {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                pin@0 {
+                    reg = <0>;
+                    label = "clkout0";
+                    esync-control;
+                    supported-frequencies-hz = /bits/ 64 <156250000>;
+                };
+
+                pin@1 {
+                    reg = <1>;
+                    label = "clkout1";
+                    supported-frequencies-hz = /bits/ 64 <25000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

