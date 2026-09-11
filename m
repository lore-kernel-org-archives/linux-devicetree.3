Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D735E1A4
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164915; cv=none; b=kjeQmNHKIP4wfRC8uqkO4JfjbgfTRWxnzrohbqu3qvlNxqO7/FOU0DwpNjBqBYgexvVRP8bnec0rlutM8g+gG8Vrg3d7X4a4yueYSGn6R3DMNLwKTyci/M81sOr0a/+in0MIRmjo3URWa1sY/5WG7UoLSYW17bni75VpscjW9G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164915; c=relaxed/simple;
	bh=i49CtTXNdvPDqvnQKB6P/xRaXz9o1Ta+9uCeSBaVc0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OhgT39caY7A8/y/6MkjdPxVoBbJjHHrsb0ANHeBes0YBUJ4yq2b4Uf16BusQLEEvuRbTbsavUWb92PejewsaJUdHOa3CrHINB4O5EtHV6rpNVh5zUJNQdWzUi61ZOFAGpB/f2LKZGUShzZMCzQbK/3pzDeG7aSqvTxQB+TSYz6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CBJLMmwJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CBJLMmwJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b965570d7so17464115e9.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164912; x=1789769712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jhj+D3u1Hdp6k7FiJv/1raAGblq3kkIePMv8OFR20rM=;
        b=CBJLMmwJtHq/Fk3YzPtsrnM01ebnUXPL65AZVeOkFbfoI+IpK9vxIdwq78zCV5Vqun
         UdetxTX8e02zPBwuq44+MEoqWG5QpDZjFQK2kbPoEUnRj5lzI7FT6Oew7thOePKQOIcv
         uCTV5IgUWgwWCpUrTmeA+tRFp2BfQIMX9wlfEkTw6kx8iUAPwYWNwU4aEfghN4D77WqJ
         OXGMQdU/Bink6Vg3t01LLH9CrDEhW8Q9m7CF14Xzqt0rIj3u95cPibUFVtAG8/AYlp23
         RCgxzqmO1EUKqJ2iq4uHC9/kqPeBiJvAeV6HKHkmd6d/quc8ikJmrlzLQUIupNea5RNS
         h3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164912; x=1789769712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jhj+D3u1Hdp6k7FiJv/1raAGblq3kkIePMv8OFR20rM=;
        b=rn2BtV7Z1VHiRRePyBzOlcTkZwrmZlgwuCa4h/jDkh/QREWc2qXOMayzwfZIC1irFs
         s9JKGuqrc+LcfKn+95IAm26izVwG9G6FNMNl/SHbGw5P9e8PuuvHTgHnx3/pmG1TXVHp
         Ys6FrTnR9Lr3J5OKgKTe9fyq5Qcyh3H9gIVv+Gg1dFAmfsdfCeRnx8mj+PMLLrY2Ritb
         XtfBp2kBSGANKWUtESTWozdNwlE45TbiZfRFROWTzl2b4F+lcXM8vZDWFLytjGAQEPB/
         jq3E0YYdiPMYdwH25ejrXAN6onP5FFus6BH9ZrtrNweLqEKqiBcFVtq+mr/T75hbsXwC
         bieQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6BetZn+Amycu5b6u/M4T4OeNf+t+gEL7ne1t5/ucl/IvcCteHFmAsj0AqU/z1cO888fZGIwP38x2P@vger.kernel.org
X-Gm-Message-State: AFuF++mAApoWSZ3BBRCNARqn8vzpA12y4qtG2PfaD7MVaIpsZMR2NO66
	hsdJn2HtLEh5jgbGdUkBc3n2GKX54kqp8XGM1i8bIV6MaEMC1MGsjNRdEJ8RBvTl5mA=
X-Gm-Gg: AYBFou2YpJ3Z+4OYoVw/XR5wFYRFPr64fJucaRHfQSndIqHT3vGV3w7Gk68f3V3yhWK
	kVg5FQyjguSTjyIWdg8D/+7FtlHSZmNYnmHZLdxaBFkEHZ4eYGS1lj/ms85u8F2JmcXFwVWP2qY
	05h13YYZQ5JkkkvqQYtosVq8mp88nP77h+jx5/T7Ragr1jO71JXZeDcEdGxAilE9IdHANYbOjDW
	xIM7gehufHeuCBbECq/wWpH1COloVSQeE93Kg+exbJz4N1CV8SU6NrFvYxsjo0v+zokzx0bEnvL
	BVudtQh20Of28iaaXs6GkloT3QwcykERhQFD+0Bbe564MmjK9td77JHTcrsuI8NS6DpL3Ay7Yms
	CoGoYQD9PLjhXz7efXLdBpRFAoxWerQGIzpcuceR+nud7iRz5ceXC9q17i0aCxG1B+XKQ0JaSW/
	wYfkO+ZPf1eISBfYYoov2r8tIQmdcMUmwxoFSPNafFuc25XlWpZqrTE1WyX+B4MDiOx0M=
X-Received: by 2002:a05:600c:3b90:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49e619805f1mr71228535e9.4.1789164912040;
        Fri, 11 Sep 2026 15:15:12 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:11 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:31 +0200
Subject: [PATCH 1/6] dt-bindings: sound: amlogic: add schemas for audin
 components
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-1-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4740; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=i49CtTXNdvPDqvnQKB6P/xRaXz9o1Ta+9uCeSBaVc0w=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanP2vC7jUtmx8nOMoSnL/n7eYv7T77p3MbO/WOa1R
 I4zY41CRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACaS4cjI8O2H11KTH4lLvz75
 d6vg/NE7jSITaxbxdc8+yuUbvl2vLZThf13JYasN5lfkroRGnjyXdSuEN6S8xlJh3qkENf4/OmW
 fOQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add schemas for "amlogic,meson-gx-audin" and "amlogic,meson-gx-audin-fifo".
They provide I2S audio input support to the Meson GX platforms (GXBB/GXL).

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../sound/amlogic,meson-gx-audin-fifo.yaml         | 52 ++++++++++++
 .../bindings/sound/amlogic,meson-gx-audin.yaml     | 96 ++++++++++++++++++++++
 2 files changed, 148 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
new file mode 100644
index 000000000000..a01fe22b9786
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-fifo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN FIFO controller
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description: |-
+  AUDIN FIFO receives audio data from backend interfaces (ex: I2S, SPDIF),
+  stores them into a FIFO in a configurable way and then bulk copies all the
+  data in RAM when the FIFO is full.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-fifo
+          - amlogic,meson-gxl-audin-fifo
+      - const: amlogic,meson-gx-audin-fifo
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    audio-controller@80 {
+      compatible = "amlogic,meson-gxbb-audin-fifo",
+                   "amlogic,meson-gx-audin-fifo";
+      reg = <0x80 0x1c>;
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "AUDIN FIFO0";
+    };
diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin.yaml
new file mode 100644
index 000000000000..d8dceaf28957
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description: |-
+  AUDIN provides audio input support for the Amlogic GX based platforms
+  (GXBB/GXL). DT-wise it acts as parent node for FIFO child nodes, whereas
+  from sound subsystem point of view it is a component providing data
+  formatting widgets.
+  Supported audio formats are: I2S, SPDIF and PCM.
+
+allOf:
+  - $ref: component-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin
+          - amlogic,meson-gxl-audin
+      - const: amlogic,meson-gx-audin
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+patternProperties:
+  "^audio-controller@[0-9a-f]+$":
+    type: object
+    $ref: amlogic,meson-gx-audin-fifo.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - resets
+  - interrupts
+  - ranges
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    audio-controller@a000 {
+      compatible = "amlogic,meson-gxbb-audin", "amlogic,meson-gx-audin";
+      reg = <0xa000 0x308>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0x0 0xa000 0x308>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+
+      audio-controller@80 {
+        compatible = "amlogic,meson-gxbb-audin-fifo",
+                     "amlogic,meson-gx-audin-fifo";
+        reg = <0x80 0x1c>;
+        #sound-dai-cells = <0>;
+        sound-name-prefix = "AUDIN FIFO0";
+      };
+    };

-- 
2.47.3

