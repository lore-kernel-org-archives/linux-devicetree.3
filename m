Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064344CF493
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318722; cv=none; b=f3Q88FtpbcYxWJSKKEJDJgmyPfavT7xDfj2FFA2q/A3Ye15Zmo/3lumsFAPxgo4wA9pV37tPAsjfBCmn5/qfP4gZI2cpo+aQlhkkxjo6bwsdQsMYbCRvViVKBLRHmrUPGnWYcH2TMYSOtMZB30DaB9DGfL83wi7z11mUTUeyyHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318722; c=relaxed/simple;
	bh=I0qFUjuYkK/Jb+743ojJali2uxhCIRzSMoeKWGXcjcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvREtoH60kY5MsLLq6L3avE8KBsSm0MdmYvA/TZsy4lC3rFg0/SSswhaCf0tIA/ij7f74ZbJJB0JKpmvgiGz60VMghU0rU9Pwuwh/+cfu3K9K4+Yvd/atY6uST4Vo6MLYTgb0tdjIEsF7VQvuDjJ599gelsGv6comXVLTSxtMNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AyDg33gS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AyDg33gS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so6592165e9.2
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318719; x=1792923519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXUbYakFpTeYzMKXIFxmT3MjUgNH4qUmML0VWV6BI+U=;
        b=AyDg33gSRoqFZCXskkgZkl+5VraOIxcNwz6x2XV790rq3FH6zH91colSbQUCNMjSq9
         CoIr1MKSgQ+0aLqk8eOSnkRCAo9PR0KOILhVfQ2QmJVm2puxlAfIuy7nPHNj1AcTZiqw
         zxKYxFeIx32t57OJiyXTPPwjVWMkDTHl/m9xEUj65yRj9FKH+DvlmJRCFHpz8As5HTPA
         E3jERQWX+VBtSLvqEIerRywgXQ8Kr96JlQmvQGVO5TgE/0MfPlzDGtTG/u2CWp68aL6l
         nQ/MJrbCugUJ8bXzQ3BzfRfIv8vGsyFYKXXz2sYtnQsiu28AlvlNY8Km+BsUVNpSKU4v
         JbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318719; x=1792923519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXUbYakFpTeYzMKXIFxmT3MjUgNH4qUmML0VWV6BI+U=;
        b=RzSp3UEUP++62jZOThWBzwn7e8JwZS0/O2Ggf5DvqbQB1eETKwSyiCbk6p1Gt1cUbv
         3BAHYMFVxAhCBiq/ycy9eCWMloAcazChBeVN0DzDkdibEP4xo3lLadlvl7QGqzKCshMR
         0lADxwHMPxvgUHcvHgtcmRbkhoLJklL2WSI5UAxSTHe7ZNmuKKSXLYSXkTQv7GYqHfDP
         bE1gGCrvmZnDGl2xvKi9KanfmZjCvrR1WDBVtmorx9OdD76ZeZnfAoCHjqgezujD5sAy
         fNUhfC+MZ4ytLphKJ9xj4VKt+HayFW2/7FKGdknXcRCTABiLqtmge/jmDhyNoei1kVPA
         1QOA==
X-Forwarded-Encrypted: i=1; AKwUvByRx3O5juOZ/+Jg89wNyLA5wH3juOswjVzJYbGAXEB1TXNBGr7ufjqi3QmwIPRbzcUQ7gjGkXAPFCYu@vger.kernel.org
X-Gm-Message-State: AFq9FYI1EMoGPKmqpdCBc9L8gK+WLh2S1DLzLNfJScLlyfTq43j7uXjU
	BHk7v1GJrMTVFVswg5nqsnaSpx+FuP4zmVcG1B0tZ+K7mQKLs1UgH6uJzIVlW3hdwqA=
X-Gm-Gg: AYBFou3os5uaPqvgz4su+tV4pyfI9fgBV4/Z0CSKAN2h0ZWHaqJFlb3NpKgqNBSjAF8
	KBgSRUgQDlU7X4n2MfdlirczXu9lrXO8VlZzVL6mfrgpX6z8fyca57+eU7xStFbDwZkV69GdJAo
	t3uxpoznkP+vuGPUqmh6uMRg20L9bOQ08JtFQo52Auh1iduycSINUAs+RFWjA2+NyOfedifEXe5
	8fRjyNcFEdO8hluplxyYExWrnXhKBdY9larMyA6XVQt3DwGnARXGEEbbW/dgwCThMDCoiRsostC
	C3lPqgUk3eqj8m7MJ1rP/DBdt/BPiZz+ba/XCyi4z1r25fpL1o+xecVAje2FZFykHEcZ9BJEoMk
	4mbfv4EmXAK2V5XGwXfaDbOo1BhKjuxCgzxXh/joWC2Ox2W4CYeTEaoLYIaZD5bIr9YtcbCubSC
	WzdG+5KlDqXVckwy2MU5cD9K2b6naegzHBNEa9hJLOFHqGHk6Dy2qOITUpG3TxoJycUqqQ
X-Received: by 2002:a05:600d:848e:20b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a1e00ba2cfmr31307475e9.1.1792318719335;
        Sun, 18 Oct 2026 03:18:39 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:38 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:17:58 +0200
Subject: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2572; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=I0qFUjuYkK/Jb+743ojJali2uxhCIRzSMoeKWGXcjcQ=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vzeZOqjHL1cNE+007OJeYXVo+vrj3hZMBj8s0qwM
 qhi/x7RUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIkU9TL8lTBYekKvh//v5yMa
 eirsB7YxJz/eMyle6uSMFqPzIgGLgxkZ3q6189Y6burd1ncrbaWc0uRl/MKfn9lejFB68Y1zmno
 lNwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.

The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audin"
uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
added so that differences can be handled later if any are found.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
new file mode 100644
index 000000000000..4df4796623ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gxbb-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GXBB AUDIN audio input controller
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description:
+  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It supports
+  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs that
+  transfer captured samples to memory. The sound-dai cell selects the FIFO.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,gxbb-audin
+      - items:
+          - const: amlogic,gxl-audin
+          - const: amlogic,gxbb-audin
+
+  reg:
+    maxItems: 1
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
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - "#sound-dai-cells"
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
+      compatible = "amlogic,gxbb-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3

