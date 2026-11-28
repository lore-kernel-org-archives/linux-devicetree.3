Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853925;
	b=1IA/j8LuvPviJj6leLCyNN5+y2wZ/U6d62yL3beP/0mWPgP0uMD06gbuzC7CYc6kRazO
	 yByWBY5RAlCUrhcgsiGNW/lYMKxakQimZ2L/66aUB9u2f+VUVrreQ6u8gnMvY+QsmAkjL
	 6u5YxzpYXyeLTQqJiFl3Owi2Sy1GwABdW64anmPCJd6adOc90leZNVAB7iYQb/0dAwTLR
	 Pi80Xha8MXvUCwVFtXnfVog5dD9y9d9o9YcNJrtRyrLBZVdWMcg7TLV2H3JG3EdoRy21L
	 Coc0B+tis7kPBM8tDsK55J5Y2qoES6/dO1e9S41sTVLoGT1QjPoiOKgGAxrLhYt3/DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OYxs5uDpKgH0xFuFCpWuT5JmihYHR57LmroU0k+TYNg=;
	b=R6gSDMa4wZEZUCc4PY/FMD5u+ylp/TNBS6efv33VW8HiNddy27K7Ey2ocP6bpfkMloXL
	 jMgCH7jFw8M0dxAC/8dcucyoY37h19ag/sG95t4+i8NGoqDLgLSlqEJEAfr0q78QBWVXx
	 l6yBAP+HodpEN699F4IADzMOkF71ooRlFcOn2PczJZzPWeauhoL0KsqI5C3Hee4lylq3G
	 +zTT7q1ZidDeajKZTIp8db/I6E3DVImWiX8PpdlhpzYa09RwzEo673dcqLaI5JQ65UB7o
	 Y+6Ta6IAVvC6PLG/mvLTLqXNsIzUtVWjkUjgNXa+uL7DZS1bLXYiG+V73fPTaTZ8ZYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o17SAo8d;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5B6606A33D
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 08:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5B6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o17SAo8d
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b6b22be970so3347578b3a.1
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853924; x=1796458724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYxs5uDpKgH0xFuFCpWuT5JmihYHR57LmroU0k+TYNg=;
        b=o17SAo8dtN6T/w6l4wPJRVwYOckpuXlc4NWF+jipEFUA8twjOrREZ0hhehFcC8+zJU
         9emERwxwuz1heHG3LMZOhvvQy8Uw3qrxO22p6mmvlZCI/69QyE3WJH9sdDj7csZ011w0
         H/+QPjZaXnomEG0UXFe2N3agZ+PrKVOgUhjTRFNnbA1clCjyXfOxjhpBkvsV4Cf7BiCq
         7ETfqS6aDMD+EFTRq70RCivbk25SKzQk75ikfhC+vQujmG9Xkqpr8qGyS71hh0s1jyZu
         55+bZ4cpVRK6hV0Mag5d9iSWUT1yNRQtr59o0GpRLDtWSu0ZX4TGaVEX8M16P4CfUE0Q
         Um6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853924; x=1796458724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYxs5uDpKgH0xFuFCpWuT5JmihYHR57LmroU0k+TYNg=;
        b=hnKj5S27em9+wpJRnRAIyX+4qHJuwvKHrp2AqZQc0LEii+wLFkpGgHuB2eV2U1Yff6
         qoyCEMs7nM6UbEYvtCVepVN9sK6hcQoby9PM8K5os5lVuPOe28+fjvm+UBkCEb9DZluq
         zLbrFAqwGYV3gLAFVE25GPjcNFoyA1RKoGSTwH1Cn2GEcgKOp08w25xe4+lJnCZltWuK
         HiKIVLOzq6TK/MqARxSStdZsXfiHzq61XT+8/D1IRkx9iLZes9q4lD+omNM7Uw6qVmgO
         W8pELCFkPCgyCWMLYJ+AiV7DtvWDN+jyPtPFRYVsf4MTF+IXd953FFGwOSTN/fphTKkF
         qzBg==
X-Forwarded-Encrypted: i=1; AL+hErFPB+RGyDUGbV409lOogFCWpUVdufWY380MMhWSw+DT29P5KHPShxl393GizjnWqJcEPRCKOQab9iyj@vger.kernel.org
X-Gm-Message-State: APuU4Z/2mzP1oC6tvo6c5FnJubmwTrvt/4JiB1xzf5qSme+atZN3Z3dQ
	+tXlqridddGHQr4jYJ9CM4l1XcMkizwmO0U1shi44MGzmz+NSW1Tmidn
X-Gm-Gg: AZFdTZevu3q45kC328VTyAAFPfLl6z6vQaBfQwpahCeCEXN0gZDluzgfGNpYwRAh6V8
	ooxQmU4IR++/c+FQ37LloWqouznlzeVa5KKe2p/so+IFp59o3JX6mfouQvwFj+kHnymxNVVhaBT
	ncMLT2CQeutIFuMJ4uoXCQIbTwI1Q3ZOPZI67slmoffPHLCGH5rasPrHeYAi6gIE5OV/zsd+VWQ
	Rdla2xAmF7VDJW7Y9t9pUjMhd1p/NN5Z2zYgAp00fbECQ6ll1MnkBGNwQPAZJB8bhwQ+AI2DCyo
	2mFOlOWjAYBZkBI4QUOgg/VqfZ1p8IGM2xBsJYmuit3cwn1J6oYQ0ThPKV+6t0XtRK5BtajN4qW
	F7bffN3ouFBBwTHv/e/VnL37OSWtKQqIrdjWlAjtLiDjGRvI782eIng7yacLFKtUPBY7zOfnfq8
	Vnb2iiAQS+AyAVzVCEMtukR4YDHNoUDRj7E6mEWvchi6QgQ1fwaPDwWkwnBp2ycxcyQitkDwKGW
	rSZr5F2V748dSUumi1h9q6bzn05tDx1ZI6TNpUwwdcO9HBWLIHEjh+Gd7wwdHuvcGvMn6O05U/z
	FWpszg==
X-Received: by 2002:a05:6a20:7489:b0:3dd:d729:c62c with SMTP id adf61e73a8af0-4014df5e9b9mr30546154637.54.1795853924162;
        Sat, 28 Nov 2026 00:18:44 -0800 (PST)
Received: from wyb-ms7e59 ([2001:df1:7880:4::50a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm11550749a12.27.2026.11.28.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:18:43 -0800 (PST)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v7 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Sat, 28 Nov 2026 02:18:34 -0600
Message-ID: <20261128081835.366128-2-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128081835.366128-1-wyibo6109@gmail.com>
References: <20261128081835.366128-1-wyibo6109@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Binding for the OnePlus Pad 3 Pro / Pad 4 and OPPO Pad 5 Pro pogo-pin
smart keyboards, built around a Tinno keyboard MCU and attached to a
tablet UART.  Describes the supply, TX-gate and wake GPIOs, with a
MAINTAINERS entry.

The compatible names the tablet project the pogo port belongs to
(caihong, erhai or iceland), which pins the keyboard generation and
with it the protocol extensions the host may use: the 0x3A general
sub-commands grew over time, from the caihong (sm8650 era) keyboards
with neither wake notification nor backlight, through erhai (sm8750
era, wake notification) to iceland (sm8850 era, keyboard backlight).

The keyboard is a fixed physical device, so the touchpad geometry and
the product names are per-project constants and live in the driver.

The binding documentation was prepared with the assistance of an LLM;
the technical content was reviewed, adjusted and validated by the
author.

Assisted-by: Z.ai:GLM-5.3
Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
---
 .../bindings/input/oneplus,pogo-keyboard.yaml | 70 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
new file mode 100644
index 0000000000..e76e82ea6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 Yibo Wang <wyibo6109@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/oneplus,pogo-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OnePlus / OPPO Pad pogo-pin smart keyboard
+
+maintainers:
+  - Yibo Wang <wyibo6109@gmail.com>
+
+description:
+  The OnePlus Pad 3 Pro / Pad 4 and OPPO Pad 5 Pro pogo-pin smart
+  keyboards, built around a Tinno keyboard MCU.  The keyboard is
+  attached to a tablet UART and speaks a framed half-duplex protocol
+  over a shared single wire; host transmission is gated onto the wire
+  by a PMIC GPIO for the duration of a frame.  It provides a keyboard
+  matrix, a touchpad and a keyboard backlight.
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    description: |
+      Names the tablet project the pogo port belongs to, which pins the
+      keyboard generation and the protocol extensions the host may
+      use: caihong (sm8650 era) supports neither the wake notification
+      nor a backlight, erhai (sm8750 era) adds the wake notification,
+      iceland (sm8850 era) adds the keyboard backlight.
+    enum:
+      - oneplus,caihong-pogo-keyboard
+      - oneplus,erhai-pogo-keyboard
+      - oneplus,iceland-pogo-keyboard
+
+  power-gpios:
+    description:
+      GPIO enabling the keyboard supply, held high while attached.
+    maxItems: 1
+
+  tx-enable-gpios:
+    description: GPIO gating host TX onto the shared one-wire bus.
+    maxItems: 1
+
+  wake-gpios:
+    description: GPIO signalling attach/detach, also used as the wake line.
+    maxItems: 1
+
+required:
+  - compatible
+  - power-gpios
+  - tx-enable-gpios
+  - wake-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+        keyboard {
+            compatible = "oneplus,iceland-pogo-keyboard";
+            power-gpios = <&pmic_gpios 12 GPIO_ACTIVE_HIGH>;
+            tx-enable-gpios = <&pmic2_gpios 6 GPIO_ACTIVE_HIGH>;
+            wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f825..7730128d6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20163,6 +20163,12 @@ S:	Maintained
 F:	drivers/mtd/nand/onenand/
 F:	include/linux/mtd/onenand*.h
 
+ONEPLUS POGO-PIN KEYBOARD DRIVER
+M:	Yibo Wang <wyibo6109@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
+
 ONEXPLAYER HID DRIVER
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
 L:	linux-input@vger.kernel.org
-- 
2.53.0

