Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436501;
	b=GPVYr/I/wDLJnEgMZT65lnlhYhqlpzVqBhwIAO+IxVYDQooiNQ8D2xCouBaqR96CWI0d
	 OTlyPWmSUx9lcbYBNQWd166PgsaBdethJB/OKgu8L/QkBOVqlUOjIIXASkhM4C4yHot1v
	 3iaiQjgs59qbPYQ22WDG8vtJf9Ydz61YGASjjgfDp8wDNcrBFM0RapNynbIdCOPbNPKYE
	 a88OaC8qjQimWSn3/0Bbt2ZNtrTD61XI/HN0DZxk6dx8WIM4OL6/WxkSV2qckjNzkcSof
	 Eig6Cx6ZUy9Wt1Qexvtrk0aw3MrvC4ZSOfmcoRrJTg4kbU8lmAY3alhGbZRO8mWEoaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=F0ffJvvgOrYCYreXinduE/MSyfEkUTiTaHiJcqh9oWA=;
	b=LKJYrG1TCK1nL559bKH7VpgcCnrMJ7KXdYjxeDJxVwVVyMNiQuOIS1Q/UKEj1dVcYlen
	 emH8yJSJE8yTLmqIee2NoXJ0H9j2XMaEuUAuBTUzHbVNQdLopYbvaAhDNrpe1z+t5NdAg
	 bdUeOIifMXSqaqpy5D2PUZVEo+QkuNe8qDDSgDF00/GNz5YMC9YPyWwYh7dvE6Mpi1x54
	 bryo4Y+x2wCa2zl8bB9AfaPe4YhK3IAVVCh2WBNRW01IQaLmeOpXbjdkw9JtmERve+Dde
	 Gk7mw96r/mQe7usjdlw/EuHqxKqr8SgrgGs9nAG9UrTctxYp5LoThnickurUI1lhtHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FKnZBbDI;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B256F60A3836
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 19:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B256F60A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FKnZBbDI
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e977109392so10892185ad.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436500; x=1793041300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0ffJvvgOrYCYreXinduE/MSyfEkUTiTaHiJcqh9oWA=;
        b=FKnZBbDIYTQBI/lm+RY+U0oRYalleczJpRcFVNg7bCE7Qdwt7SyYO3WqHnsbyAaa32
         7hQkmNUlpgAif1RNEClPL6RePrsQvCrylUliDxJ9SLtq4RyICURi1qoyaumv6THWS/pe
         2q30JOR5An753EDkakfdafMgwkUS2CS7EzlXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436500; x=1793041300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0ffJvvgOrYCYreXinduE/MSyfEkUTiTaHiJcqh9oWA=;
        b=JYMdhWFSnaUcVXpGj045nW93mah4WDDRUj1QsDDq+/TjRC+ICPqI/ANd0+l2cxL0rJ
         PO9Uq7fePWwniLHe7gacVdX0vwJZnD7ECZTorXQTJCyoPVNmExoXKtaqJSDgykcJuyaA
         InlKtY5fqkPbrTOb/ktJFXr0i8zPidQj6lMnDVPoW/TeRL//9fq2EgT9UgUMdD0Ig262
         n0vsbtevCP2/6sI3Xb1ocffjIEvOIyLcv6JSgNqYqwmudddP+qwYL3Q9i+06Hm3twn9m
         xu4CnL4rtticyo9sEFNF/27OuIHZgThJFJE7awe+ApIrwT+ZOmeLzvbBRUMGSVvNvS8f
         o9ig==
X-Forwarded-Encrypted: i=1; AKwUvBxojrTqlmx3HAFnWAOLFQaZsdxNs9Uq7KYy3XJtGJtavbjgHgJ8B/b+Y+tSqEs0qUXF/ww26JefA7VG@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6FrVocahLLHUgNQ8EFtdNVHcl3lTRsGwSpSQ0cGv1miDWp7Ca
	+ap+6qDKB3NtgELst17lKqt+wjAs1borK2pMhF43Zo8HXm5irxgwEGQ2pO9fKbiWCQ==
X-Gm-Gg: AYBFou39WGeKyZ65VntnxMEcsY1Jlu5YfFd42mHJuay87FLXXIBS8KJktyx5z86QWIf
	rY2boVixbf2/nqFLkFayQo57UmkvDx1yhE+RcCpWV7JWlIGlqZ7UEhA8Yh0i8UcJAAyYOd/VfBc
	yFe/VkdAR2Hd+yLjIxSRHx3/07IyArOzW7+wF+VDOdYw4OeV9XYQsDMcmmPZcLUzjfRJfT9GAtc
	xw4fZ+d1zokEcfe1CkYEJzk6JH+Lys5HoIOtuLowb0ZhQo/47NdxUMhflVkoODt52ibMfVXKdCx
	YiQ/LWk0W8ICfwZqq7arvFgfOZjDLqQ1TZqlKBooS5ODZfp/tVzOi8zzXTsV98XxDXCsBCnTFT3
	UNcK7VPQXXm6nbccmPxrLbgshVnreHD27VfEWPEguPtUAS5Atyg47SboqZT6gx82eEIjQe78ARO
	OudPD2ZIHa2vdoaspzq+OJAkszlkCOXYD0rmR2GfOoCP0OhiMVmuHFVi8bx6GY3ZfZSS6UFDEhk
	rQExp4mQUsVrhzHa2EwJzdo+/KcNTELwH/bYwDJ6Fpt5bN024WfYy7IPHfJWA9o6XOx/AfIYWl4
	DtUJs9QPINN4dYQPfFLr77vQi+p+w3buB9DzuVLhWVIu6LKi7ArCrwEt/QpH60U=
X-Received: by 2002:a17:902:ea12:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2e9a705023emr80598155ad.53.1792436500085;
        Mon, 19 Oct 2026 12:01:40 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:38 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:20 +0000
Subject: [PATCH v6 08/11] dt-bindings: input: Document hid-over-spi DT
 schema
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
Message-Id: <20261019-send-upstream-v6-8-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
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
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Dmitry Antipov <dmanti@microsoft.com>, 
 Jarrett Schultz <jaschultz@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=4977;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=3JV7SIx4Z2hhtNXaNrWUG27kANewD8ikLOOlV/xW+/0=;
 b=lIoWtzK94uJ2CVOcYas1knqxryWopuM6+bcWy1s2MFL43hSH7uhTVG2g2uPlgxQ4yidS0l0qV
 8EEWiL1+FpDD2WJlM4xKES4vF4ZWysNWe9oO4shLMegkzX5e2etMgEc
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
 .../devicetree/bindings/input/hid-over-spi.yaml    | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
new file mode 100644
index 000000000000..2a5fa0868a09
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
@@ -0,0 +1,130 @@
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
+  - Jingyuan Liang <jingyliang@chromium.org>
+
+description: |+
+  HID over SPI provides support for various Human Interface Devices over the
+  SPI bus. These devices can be for example touchpads, keyboards, touch screens
+  or sensors.
+
+  The specification has been written by Microsoft and is currently available
+  here: https://www.microsoft.com/en-us/download/details.aspx?id=103325
+
+  The HID over SPI specification does not define fixed values for the
+  read/write opcodes and the input/output report addresses. The host
+  retrieves them from platform firmware (ACPI _DSM), and they differ
+  between devices. These properties provide the same values on Device
+  Tree systems, so devices that fully comply with the specification work
+  with the "hid-over-spi" fallback compatible.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microsoft,g6-touch-digitizer
+      - const: hid-over-spi
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
+      GPIO specifier for the device's reset line. The HID over SPI
+      specification requires a dedicated, host-driven, active-low reset
+      line. The line must be flagged with GPIO_ACTIVE_LOW.
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
+      Value to be used in Output Report packets. 1 byte.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vdd-supply
+  - input-report-header-address
+  - input-report-body-address
+  - output-report-address
+  - read-opcode
+  - write-opcode
+
+unevaluatedProperties: false
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
2.56.0.212.g129ede20d9-goog

