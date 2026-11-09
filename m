Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239108;
	b=fzTKPRudkoFg4HdAs7d1ujmQE3ChGsYRt6ZyiZ3p3bRXkBrk/KxY5+ga8rTJYMZq9rBH
	 ua4sCgntHExHSswZ+mDIROYmK6Tb0A3zRVrSHhM3khQyiDKk/6INANa8kP+CG0iScetYS
	 +LVWz96e0VJ5FHfY2wXC9WarzjdQ4GsSinmLU5F1oSEH4wBkz2z9lHJdS0rAoyIe8SZtj
	 Y5mX7z5XILVzVGuTWGXyOwDZmMm9Nj40nD2+qp1a51DKCsrAZoAtTLTC4ZjS+bvZPJ5Km
	 jjyqManjPXiEGxo4dP1bbEC20lVdRtGsaOqDdts0+bxf1VenOj4xOnS9O2Hubc5gKwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rh4heiROTn2BTclkUIfVJAc7WlFd4Gu+0wgV3dS1bGw=;
	b=b2mz2qR1xHufdZKQahHZzvrrClZ/9OKCBAiPK3qDtSKXrxgAI5paqA+V2DtyIa8OXTES
	 H9uLAhZYLMSpzlXnf/bxyqJIeDXyRmHRe+mH2X+16r+4cW3/vhqbdopMoTguGggVOFjTA
	 E0mLV7pWE3IWUO44Qk648iIs5Bzthf6/YrlCT5RyzAMTbLv68J6iM4+cwiMxtz5+y3KU4
	 HtncjDsFVLpqyKxLBuUYLYVl94g1LmcTHjbiie+Gy/httez6XHTdOdkcxvOqIrHp7lyGr
	 kzoIfn92WdZWWgScRsoq0kotXFOHIx3winqMKYM5IiDHsLsYgfhIovsdPd/Yh39IGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSpB7hl6;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A0606A33B
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57A0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSpB7hl6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6108575e9.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239106; x=1794843906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rh4heiROTn2BTclkUIfVJAc7WlFd4Gu+0wgV3dS1bGw=;
        b=hSpB7hl6GglOFC9dYLzfjOBwjg4JCNsk8RMTZ8kM0fRTiy8v1TqKNld6fKK000xvpR
         FjjkWf952OWkh1CA3KW8y9zklJlPMaq8OOHSN45xHkqgbLYU1MD51r07ihcFCr3bGFB3
         Ufx0KCej+O2b4hS4QXhcbfqmawsmwrXOkbxpdZ9SrafrEE5ljpA/vNbtxqhrYUUInaxj
         XWRkXCZf1r+BbeMXQ6y1xlzWlyhHiwv1kM0VT6+Fhi9pVNr38I3ZkwytekdxryBVt1Ka
         VaUyzqS+8P7yHo2eTvh8jc5qN0bwWMCe/f2h5GleUbzX8FvvpRWYKcyQ8CbRMmFLGcwo
         gA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239106; x=1794843906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rh4heiROTn2BTclkUIfVJAc7WlFd4Gu+0wgV3dS1bGw=;
        b=zU9vw2V6POW/6l6LG87d3f8jBg1FkxUYkANl0iYljwYmwlxh2tHeE4tMQXLLKM4Ezi
         lfdy3VDFurxQK3evMXvRZakBHNZK8UGXKauFGhtCkhO22ORqaqCnPLmKPEpqjwOz6Rbo
         mPaMQNWVw6oY8+NsK2FHjP3lJlC7DGt5Q4klMM+MQq+sevuPrXxjpAM+kb6BdYPWna1a
         W5pauiBteJq6IWffWr//UF8sEjloVlNDMteGnKJ9tvli67jICflZpUmttWuJ97JBa3FS
         VLjZ+UZrac6cwhpV/Ch7BDiEFB87yXEdeHogCVueHtQOkVbEP8Y8NxhIHw+NG9bVkZZe
         fa5w==
X-Forwarded-Encrypted: i=1; AL+hErEcsy6j17q7C3bybPZFIxbtt2V8CajLBlCA5jESIkkk42aPdFFLbhjo0zj7yGtd3zqAf28jq6AQBD+o@vger.kernel.org
X-Gm-Message-State: APuU4Z8WbBZp/G66sJSDVPLJVmcGCH3GzVfBnazbUomA7CCbnyjTvLT4
	cRRZDDF/braH3/yZW8WZgZi/P9UNem6EbajPhikndjIUpc51147+Lvp0
X-Gm-Gg: AYBFou1giWLzVrCvKdMDEYnjHmKckJCNP16JPRG/3/d6nyQFNSfTxlWb6Yk+Z7DCohG
	Lrh4LQq4xzadU2hSSumXawX3/3vAPuKB6gwFDdxrmQA2Jux5p01bDQ0lMZm/5V6S9s7T55XWz+D
	MmOdgroWuzsqaVocEOZUn7fYmNrk+VLdC6CGkylpU58GOv9b0tHtS+d2yzXyxqo3VSM4dDw9MHO
	GZJKxQ/QFRfbGkdS9/j9Y4tztJV/6L7/xnxepaVlS16vhf9L1+qGwf3pcCuOjIzwOgD20UZzLVy
	gPRKq7SJjHc+fhnef+qKbfU5V4g0ArDdoVJwGFZY0onn1iJBXZkQERbdcOOr7tKuoyDZD+xZPNP
	C5FAs3V59y/Kpa0XSH9hW8J+6h+BhI+FERIReh+UrBqQis8aY8HFoIDUXSw9xr36GFrGyE/BkzC
	dhZNOY31L2SXTYnaFLHsqdlIOuioiAEKSevoPFg4irOYMh3gbQILsvlqesTistOaRRU68RcROP3
	OdRzRr560vjBYXAf4FQaAOTBIA1yyTEDN25QoCQ4CW1/A2fI4i5ipQ/muvXfXJg0lu4LcLFk4uh
	g4oZYOnsngCHjq0G92m8WomyiPch1d7SkA==
X-Received: by 2002:a05:600c:811a:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4b963c82e21mr76267775e9.29.1794239105633;
        Mon, 09 Nov 2026 07:45:05 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:04 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 1/4] dt-bindings: rtc: Add StarFive JH7110 RTC
Date: Mon,  9 Nov 2026 15:44:58 +0000
Message-ID: <20261109154501.63762-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154501.63762-1-oo.hehir@gmail.com>
References: <20261109154501.63762-1-oo.hehir@gmail.com>
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

Describe the RTC in the always-on domain of the StarFive JH7110 SoC.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rtc/starfive,jh7110-rtc.yaml     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
new file mode 100644
index 000000000..a88ab91ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/starfive,jh7110-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Real Time Clock
+
+maintainers:
+  - Owen O'Hehir <oo.hehir@gmail.com>
+
+description:
+  The RTC in the always-on domain of the StarFive JH7110 SoC. It counts BCD
+  time and date from a 32.768 kHz clock and has an alarm, a frequency offset
+  adjustment and millisecond and one-second pulse outputs.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Millisecond pulse
+      - description: One-second pulse
+      - description: Alarm and calibration events
+
+  interrupt-names:
+    items:
+      - const: ms-pulse
+      - const: sec-pulse
+      - const: rtc
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: Calibration reference clock
+      - description: 32.768 kHz counter clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: cal
+      - const: 32k
+
+  resets:
+    items:
+      - description: 32.768 kHz counter domain reset
+      - description: APB bus reset
+      - description: Calibration reset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    rtc@17040000 {
+        compatible = "starfive,jh7110-rtc";
+        reg = <0x17040000 0x10000>;
+        interrupts = <10>, <11>, <12>;
+        interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+        clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+                 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+                 <&aoncrg JH7110_AONCLK_RTC_32K>;
+        clock-names = "apb", "cal", "32k";
+        resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+                 <&aoncrg JH7110_AONRST_RTC_APB>,
+                 <&aoncrg JH7110_AONRST_RTC_CAL>;
+    };
-- 
2.43.0

