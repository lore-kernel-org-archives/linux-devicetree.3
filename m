Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166187;
	b=Xp10vqQpNpj3FbGe6JQof27GHO6mnOwZObQJkh5a47dyAgK9fD9mY4HEMvRNOofPtK/6
	 zRoOl3z2/ktM5x0M2sVVo8N3Y22EtcFeNkb71TzaUyp/sD9GHSDuqIiseF7HApEzra2vE
	 FyQAd2UvRIwlS/N/v/opU83sEljGajQO7A5eWPTwsXrY1fcx2QJDxh0PgtsjcZ8SNz7m6
	 OMd+PWX4NezT0284U+QszD3vBYWp4yW9tMjfvrRi5ZaS7mj/0WFjXgkvcKTmN0kL/Ff14
	 0+cWtfter0errBo86NhpKlqXrHONTZ16ROGxHgKIMHlyPIcsATCbiRYBEWsHcgS/mmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6UKVF1iHp7lqvxGLRS0YlyJBvqOEg+SmNvS8fWsdmow=;
	b=tm/z49bNaFHFJH72mH8mH3bNZvRxiFwuSWIPuBKVlI4SrguHjRo5l+q4B/HyRksdGCox
	 5kfp4x3J6AOY4Wc9pURDvWLIud+Up9CE5FilcAiGsnWWQHapsraSt+K6YhfHvbKrsZBKB
	 T4+QYowMqy60xoesOHbB/plC2lg7ESs6KkWc4xGgEFj2bDwXdBJwQgFhCyZ23xGmXlWmp
	 7PNEtV6HXFxwaPvKM2RZdp9xLBkROjre8yEQ6pgggPKyHkYDiefnoZEGthlg4IYehH3/x
	 3EeeTfvwmkTcAFp/RIn8jswlqFGSBlEB8O75XfYN8UlyZ3UAzJ2EkbEzM7Xxz/8xXlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYyjDE8Y;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07BE606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 19:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B07BE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYyjDE8Y
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ac926f28c9so12520c88.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 11:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166186; x=1794770986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UKVF1iHp7lqvxGLRS0YlyJBvqOEg+SmNvS8fWsdmow=;
        b=QYyjDE8Y6qx/3YIQveeXYvFlrAE13E8t4YClOXKlUraf/sbjtDrtw7SbHDQjymdjqj
         R1d9E4TkjSlN+jz0JMSj7UemHmzWyESZ5OiPLLCcHkFK3E9MMDzjwykfAw3Wj+1Ypy/Z
         69mgRE8z5MVeRUj413Fjnjd98KM3QWe5ZSE501juI6SnuifRRv4hsGSi2c5BP3nowLBf
         cUUt48zcFbR2eVcYv8x48qzY7UltY2qlzJiCMD8ZOkk/dRBIqJTktsGnPKIYlvKEOnZM
         9FIVl/H2G/n1BYKJfRsJYDVQQSGt0Xkt95p615L3rZ/hHayJ1JCm9fvDXDB3csw9qQRd
         n8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166186; x=1794770986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UKVF1iHp7lqvxGLRS0YlyJBvqOEg+SmNvS8fWsdmow=;
        b=A4bR8y1TahZZLShdUVljHXjz1WIruFxAcJA1NMnCJS9swVdzHjEguDBUsfgyLOQfRP
         2LZCT3PR1cn4sm8U44abi9dsMNkb+RvHlqFMZDPONxv6USRtg0wdffgNEbgMBkf5o7fy
         d5ao7FnTOpNKmyKiMfk3sdrfYKbDU33b2U/DOpNmLYXi4MxNgvxxMtd8cvXCQHkmrX4a
         13Kjku8rj/L8UtB7dv1ULNm6Wo9FQi9HGTgkWsXUC9Rtpc0uMMX9aFs17K1G036rA7mo
         EFfdx/iE6DfqjjyfVPmTQ4Xw/Ml0bgXBEmg+RCULEOkehZD4UStS3/W6ileRiqMVH3vA
         cM+g==
X-Gm-Message-State: APuU4Z8PvHay3JGdgJJQGflbNN2eiB2SA37PMIQFGx1yxw2SitVZnwOD
	vtZyr6LIvTFNTnqdi3GCKzcfzxJ06OEHicas0jr+UqZnSnVeXRvHBGrP
X-Gm-Gg: AYBFou2U0fQl20AWO5VJT4mq7siEmimxFyY8W6qHSJ4jo62HcI+wZ/h8Iigr6tYkI3M
	75yjjlobTt+KTIbkPNt3kgKbcx9a7ItLJwf3xdDjiUE6fYz5QIC6IIarqGRzIXIk6pMHSo09biT
	UclVYeAh5VUpPDBNB5eHbDa84b7jhh2T8yLitjFYYWgV69QrMWkQgjxNj2dS0W/x5qIlxGmJIwy
	9OcR6prdZMKWIINwk0iR5uzRcqIWh5Y+eect2iTU+e/9lSGl5twJoMQhw7r0qw1zfrv7e6hJHMq
	r9EQAGkNsXtFdGByd8hOfyHuok8kNYx/kUemstv+Gx+HnbPawmkSlXQT2QSq9wk6R7yjNLUGvHk
	krd7W/lWeMCDozrbdobCoFVBz3eVYYKBYq2v1Rq5sMn8mpwC8mzfCPmkRimVJ3hvch9FxO+BTZg
	hWhEoj7KmAPr0svoQK//+pUubvdIT5+fMymWDREAjCKf1kf/mDiqpm6XGRLmhUs2LGTSrU0I/S+
	tWJ0tQnyKQ1TgRDpSOlAizYN1rDWwC8Ed9VJsbZG9aKNWmkqD9iJlRyHFx7KoojkpQaPzJ6pfpW
	oNXMUhz7i8JRQuHQrz50cC5GfFsCfm2gwkTuXm4D6KiZxtYQ/yKqLs4s8BZy
X-Received: by 2002:a05:7022:c86:b0:165:be2f:c56e with SMTP id a92af1059eb24-1b39fe8709emr5185189c88.2.1794166185651;
        Sun, 08 Nov 2026 11:29:45 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881e:93af:b6d8:a723:b13b:3c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm8800387c88.4.2026.11.08.11.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:29:45 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 09 Nov 2026 00:59:18 +0530
Subject: [PATCH v2 2/2] dt-bindings: arm: omap-l3-noc: Convert to DT schema
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-ti-l3-noc-v2-2-509e8485a1f3@gmail.com>
References: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
In-Reply-To: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794166167; l=5555;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=V6xDIpNqnztXWcRk3NMINnD1f76BA7CWhqVK8M03U1Y=;
 b=05yU4urWD2+/64OMT9PFCCNt3uSmI8hp0xTnByhmUBySSU1GixyctN9oiO+WQMVQ89NhFZPUw
 Smqhp5KcSwfB8lhOkAMP9g1iYOva+XTo5HBARxzDufjnw6kAxBgsMoX
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI L3 NoC binding from text to DT schema format. Older OMAP3
uses the SMX variant which also acts as a bus parent with simple-bus
compatible so child nodes are allowed using patternproperties. Mark
ti,hwmods deprecated as it is no longer needed and only used by older
omap3-l3-smx. Move binding from /arm/omap to /bus/

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/arm/omap/l3-noc.txt        |  23 ----
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 153 +++++++++++++++++++++
 2 files changed, 153 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
deleted file mode 100644
index 161448da959d2..0000000000000
--- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* TI - L3 Network On Chip (NoC)
-
-This version is an implementation of the generic NoC IP
-provided by Arteris.
-
-Required properties:
-- compatible : Should be "ti,omap3-l3-smx" for OMAP3 family
-               Should be "ti,omap4-l3-noc" for OMAP4 family
-               Should be "ti,omap5-l3-noc" for OMAP5 family
-	       Should be "ti,dra7-l3-noc" for DRA7 family
-               Should be "ti,am4372-l3-noc" for AM43 family
-- reg:	Contains L3 register address range for each noc domain.
-- ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
-
-Examples:
-
-ocp {
-	compatible = "ti,omap4-l3-noc", "simple-bus";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-	ti,hwmods = "l3_main_1", "l3_main_2", "l3_main_3";
-};
diff --git a/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml b/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml
new file mode 100644
index 0000000000000..7dab336347b2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/ti,omap-l3-noc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP L3 Network On Chip (NoC) Interconnect
+
+maintainers:
+  - Santosh Shilimkar <santosh.shilimkar@ti.com>
+  - Sricharan R <r.sricharan@ti.com>
+
+description:
+  The L3 interconnect is an implementation of the generic NoC IP provided by
+  Arteris. OMAP3 uses the SMX variant while OMAP4/5, DRA7, and AM4372 use the
+  NoC variant.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: ti,omap3-l3-smx
+          - const: simple-bus
+      - enum:
+          - ti,omap4-l3-noc
+          - ti,omap5-l3-noc
+          - ti,dra7-l3-noc
+          - ti,am4372-l3-noc
+
+  reg:
+    minItems: 1
+    items:
+      - description: L3_MAIN_1 / L3F / SMX domain
+      - description: L3_MAIN_2 / L3S domain
+      - description: L3_MAIN_3 domain
+
+  interrupts:
+    items:
+      - description: l3-dbg-irq
+      - description: l3-app-irq
+
+  ti,hwmods:
+    description: hwmod names for each NoC domain.
+    $ref: /schemas/types.yaml#/definitions/string-array
+    deprecated: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,omap3-l3-smx
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        ti,hwmods:
+          maxItems: 1
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,omap4-l3-noc
+              - ti,omap5-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 3
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^.*@[0-9a-f]+$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,dra7-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 3
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^.*@[0-9a-f]+$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am4372-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^.*@[0-9a-f]+$": false
+
+additionalProperties: false
+
+examples:
+  - |
+    l3-noc@68000000 {
+        compatible = "ti,omap3-l3-smx", "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+        reg = <0x68000000 0x10000>;
+        interrupts = <9>, <10>;
+        ti,hwmods = "l3_main";
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    l3-noc@44000000 {
+        compatible = "ti,omap4-l3-noc";
+        reg = <0x44000000 0x1000>,
+              <0x44800000 0x2000>,
+              <0x45000000 0x1000>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.56.0

