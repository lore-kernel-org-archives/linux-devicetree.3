Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AD23C5826
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 04:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780980099; cv=none; b=hAaHW3xn080zZf5qaSRgtYy+u3awI6CDAfp5X600wBY8Do2l7ukv3mQKydefZQuSMAUJbkLmqrG1W0wWmbZR0cxnRVw92MaQAcQ3R26Z9PAS+AqFqOvtlZz8/YGgDa7TZvT7jUUZHHkbcLF3Md3jV6Y4FEsQNOvxHbgy+xJvIOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780980099; c=relaxed/simple;
	bh=xvf6N522rgUwygII2E7FT/nV/spP4Oa82Sd6W1WQORk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSbA8v9LNmttBQ4srXdC6z9jhd4MDc+lLKOz4iA1DohQMr3GU9ZiJtkoX5mSTt0fbSAkuRbXmXO9m3wfpFCVUtDCjluzszewE/9vAxNYJBgQ2QIvfjCnU+dScLXW4QDtOjffNTCPH93gVRT81Xqj356u4rLDPLIeKcwmxyLnTTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kyJX4vS9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kyJX4vS9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf36a6905cso35186405ad.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 21:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780980091; x=1781584891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrAqGvulCN1vkXijFyEkWAFvyvd9/cpcDbYQDOTqkK4=;
        b=kyJX4vS9fBPUICTwn+z4Iy6rPgELLKzGMg8FcLqwj83n+XTrJS9ZJuD3oj8qrMMZ6/
         CYbOyEo0VVYtACqW1/zsMSRnpEU2ahHdHt3ei2L2Rai+Q285CctGfmE2lqvKgZ+twc19
         Zw4qIN/PCEQaUlzG2aecc9aREo3lcZgItRTdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780980091; x=1781584891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mrAqGvulCN1vkXijFyEkWAFvyvd9/cpcDbYQDOTqkK4=;
        b=FaWgCC4TkdB0ugbn1BAnf+4xM5h4+ezeDweQAmBfeH9n7brML9CKuGHY+UKHlxx1wa
         m12+JKsFZWSdOBzFVKR7bjEsAj09jd/x1Urxs8BzqANa6q40MKYguzkq8dohSbiwiyJF
         zY4Nu+pbTy7t3c5ZrNu0iyrtWdlJyME7Uz6Ol0a3DxkAn6cvKbxbAoCYyLAUwlMDiuix
         xQstSnuWj3W17sL+RdZq67AZ1s80BuF7A2lwPSIScM54FLkzS2i/gDk/aMlXXCpa6C2n
         ySH4lz2U0qGIHfLY+CKWhrSOmVybWND9E+4l2TIL8i+Vbjgb2MQowUSabhNUk3THkeA0
         Tvvw==
X-Forwarded-Encrypted: i=1; AFNElJ9MWgEY0xp9TjecxQr7rDXr3O1+6ts9bCc8PtF7A0yJjjU04Rj11nObtGfVO7E/2vhLJdxi/OC1GqgD@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEnn1wk+0LLzK1p/b5JfcX+H+/HKgs5CkPCRMZWobAY4AAm2+
	2eLPggXY8z3k8L4imk5DaQ5BEH0/fGa8HlIQrNGO25/wqEG2a0uIv6X0gPB5X1vAvg==
X-Gm-Gg: Acq92OG3VFCcG9P+sM3B5ga9Zb4ZVmFF99i8eNieYE+2qJpiKFaQnExGyOwZqAgiDU4
	FRJcD9f9nWcfk6Jk2SA+XlnRhTUFb2IAlh0/cAI7lw9M9X5jtWVA8p2h8aRrRngtbF7ITfoF5qt
	lLYPPs+1fUlQaSJwuDuL1W1/RByhcLuLYSWT24TVn2Td1DQsj2N9kr2McN9qBRUFpS4ckFix1UV
	TAt23/6A4YwpVLA+rj3C0ki/ehMEmjrhclDepDmSfzmdUN0DJPtmizKe0YS66p1jXMimb9EXUyC
	EdC9hzQsqj8TU76AwDe8b+ssowXRNS6r4QuPW7hYWKiAXnvWbcPD04wsHDEfsRd9/vKy8JlrI3K
	R1FA2uSr6QHF0Kx981Jo+jCFOGy7Czvl2tyjTdWQaSyMK8CAND5KYtjB0rzBbBEviCxHz4x15YE
	c53bplPoJeLaowLF5tiwtYtCnCcny5naw/XcPZ8aQc7MvUpDqgpif6x/xJsHMe+DeZGj9Z01uuc
	H6buHxtGL6e6HaHhxHEYPTT1TtD/6A4qt3YMynUOKI8Gaae16g2oJ8=
X-Received: by 2002:a17:903:2ec4:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c2a1bafb3emr14638365ad.5.1780980091392;
        Mon, 08 Jun 2026 21:41:31 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm200736065ad.80.2026.06.08.21.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:41:31 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 09 Jun 2026 04:41:00 +0000
Subject: [PATCH v4 09/11] dt-bindings: input: Document hid-over-spi DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-send-upstream-v4-9-b843d5e6ced3@chromium.org>
References: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
In-Reply-To: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780980084; l=4888;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=xvf6N522rgUwygII2E7FT/nV/spP4Oa82Sd6W1WQORk=;
 b=lzd6q3Zwv0Xbtt1uCAylUOu0Rv3Lnnpd4Kb7uh/sIxxS9yumLPROty1vgqdCo2GhrgoVHqDhP
 45iDnwdhGOZD0ByMsBZNOQdx/b8PNj9kUpKTTvkwYXvRRVVIPlpBDLP
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
 .../devicetree/bindings/input/hid-over-spi.yaml    | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
new file mode 100644
index 000000000000..27cf311e0aab
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
@@ -0,0 +1,128 @@
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
+  The Microsoft HID over SPI specification explicitly dictates that SPI
+  opcodes and register addresses (such as input/output report addresses)
+  are not standardized. Instead, the specification requires the system
+  firmware (e.g., ACPI or Device Tree) to provide these board-specific
+  parameters to the OS. Therefore, these varying parameters must be
+  defined as properties in the Device Tree.
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
2.54.0.1064.gd145956f57-goog

