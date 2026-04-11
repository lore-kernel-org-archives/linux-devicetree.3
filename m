Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6233876B3
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919490; cv=none; b=RmGR+eQk/t2Cy9kyRFXDAMjRo7j1PILKrOrdbGSetKUxcsmD6VyAfReu9SHtFYy6QUlHwg6/rYLjHyLAgtllznJsuzE3teOddUbRFwYKxUNiVc+Yj9Qo1sJ8f59DPIib9lN1wTI35CRbNwlYFF4ZykrFX3T6/as/BChZmKo8EZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919490; c=relaxed/simple;
	bh=PHZLLnMsIE8GpLnJkBykfRLhYRx2iFJYTw8nQWNaVlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZL7dHg/QRcIT1DYwMQtZRdi+UlTB/ZFtMhTBkMb6aeuK8q1WGQ/NOclnI5mcHr/bzgv1YbyoTuj2js29wXlmFMWuu/0VP7bQLKRPPYuBztYHZoaGeJJH+0G7VLdnFNc4ugcAk7m6kPJNyPmhZ/JEFiYgUspzHH7FgIech26vsyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=AyUM57Gv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="AyUM57Gv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfce3a195so1863012f8f.2
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919486; x=1776524286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqzpSMm9hvDl83iw/EoIWtzwO8VYSoc9MWM/tx+T2Ys=;
        b=AyUM57Gv9vSLoq9Ii6E3wjvJj/XUPV43J5G2JezgRJVup7A5Nr0uwkPQgTIU5ytsuo
         Vz9uYJ/xy9lRmKvYFI99Hkhv19yJXF1IEBS9lv/vaVS/F798qY+cUZW2Bft40zjQFQDo
         BXRih1V+v9B5XYyoZsE+ykVe6RtM7d53N0nqqm/3V0qNYRmX0yz2yMn2jhEuWT7CTvh3
         ffjmHPYhaEXCRF+ZAsUXvu8VGLUYa0OgI+rO6Uk7PRBIyRYT7kKio6UKzV7hN7O0Hl6F
         tD40tguiHbY5MA8I1ub7lpzXOtSwfPYgUfYAsShGVCKssdaW8q7QyUq304FnpHNGDDNe
         c0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919486; x=1776524286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqzpSMm9hvDl83iw/EoIWtzwO8VYSoc9MWM/tx+T2Ys=;
        b=GIg1V11gfYJAkadRqQpxD6CQFuOF9jHOpP5wDyE2RozXLndUmUKTq+BIbqDk0tPmMN
         Hu3wPcICkJpxXro4DOv+fqwH2uk09OI98Z2MoIhY+OcL8aIu2D88T73JuPH9R8B3Jimt
         DWEvsWrDXiy/02q+oj8ZEkL/NypvuyMldnoF5/icMT2Vk5W/HTiCHGTV45FS0xWUeDW6
         /5FQUtOH91L7oZ/l5YxQfqw6Jz9GUIXnoq7+hfFp+nq3P8kn27bEf08cjaIV/xFjCW5S
         IRHqIyQIXhSHh+DSEOg8chDarZ0sXqJeLEoVvKI29tdtWx3B0phjE7Efg1q7mqdCbgfN
         vlLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWLfTd71NJoSEGrUdUFUNbNt+NyF0Mrq9un6Ew2J2KSP2wlzLvoAPw+Qy3eRIe0bksXt562d7OGMVZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz++gcyNueQIjhY8ZWmyQUtsqzZyNOBalfSvySPYZlFKIMzl7nL
	JdGbST+u60dq5ZnRHxzHNG0dXV9X/PLRZBmuq/NBNSVjrB1muOz35uBRmeYuafLBQNw=
X-Gm-Gg: AeBDievGwUEnjyurwvr5MxKKRXwZZgXkr28f/u2pmn9j+b4XXe9ZKKQlD4SOvo/qPvG
	1dIdN4nhhj+6yf/PjHcFJIO0BE6sETLOGToFsfPmGol/9WRhil24KQRql5UPA1cPGLCcN1HfXlm
	hbDxDVw5LDxoRIOahoGI1OBmRXVd2nxSiAxFxVva0Y47l037IVf4iEAEjgSItDY2qe9c78V64He
	XOnxhifWNDd7W4tHHA+Pi7OO6HPSlYCz/ah99RYf3EDHzPSmtWu4PRYTLIBH1a9TObwzT40LgXN
	aJlRfbV19zl3EvHnh7LIvTolFkBrgD78xdSNDoD30niyhRDWgxv3XT9paVbvJ/YCvI57JkY5z5L
	SpsxA5U8eWtb+mOFGihCntg4SbvnXkohoFuypKO0kKhJ1klQH8P2Sp3YjKdxO+wWdut+spClZce
	mJNKkODjD7BQXR26yaq3yd
X-Received: by 2002:a05:600d:d:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-488d67b8da2mr72755715e9.5.1775919485044;
        Sat, 11 Apr 2026 07:58:05 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:04 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:30 +0200
Subject: [PATCH RFC v2 05/11] ASoC: dt-bindings: amlogic: add schema for
 audin-formatter and audin-toddr
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-5-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=PHZLLnMsIE8GpLnJkBykfRLhYRx2iFJYTw8nQWNaVlw=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EosN3vB9XsUdlXc2ZPYKzqm//naZXdxa+++XzbJXa
 oeU3lqld5SyMIhxMMiKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAih/oZGW5XMcRf9OW+cjjh
 9ZHd1bfZlbzfXdE3V9py4Hvh/HgjNQ+Gf8a7rq+y/5TKs7glY+9Okz8lsbHWP8yrlIVy3/OXiE5
 iYAUA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add schema for "amlogic,meson-gx-audin-decoder-i2s" and
"amlogic,meson-gx-audin-fifo" modules which are used to
provide I2S audio input support to the Meson GX platform.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../sound/amlogic,meson-gx-audin-decoder-i2s.yaml  | 49 +++++++++++++++++
 .../sound/amlogic,meson-gx-audin-fifo.yaml         | 63 ++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..eaf57603e1ecf5944ffdcf7a1b6146d1a0295696
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-decoder-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN I2S Input Decoder
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-decoder-i2s
+      - const: amlogic,meson-gx-audin-decoder-i2s
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-controller@a040 {
+      compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
+                   "amlogic,meson-gx-audin-decoder-i2s";
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "AUDIN I2S Decoder";
+      reg = <0xa040 0x4>;
+      status = "disabled";
+    };
diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4957c8711623ac45d2826ca96e6344d0aeac2735
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
@@ -0,0 +1,63 @@
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
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-fifo
+      - const: amlogic,meson-gx-audin-fifo
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+  clock-names:
+    items:
+      - const: i2s_input_clk
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+
+    audio-controller@a080 {
+      compatible = "amlogic,meson-gxbb-audin-fifo",
+                   "amlogic,meson-gx-audin-fifo";
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "FIFO0";
+      reg = <0xa080 0x1c>;
+      status = "disabled";
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+      clock-names = "i2s_input_clk";
+    };

-- 
2.39.5

