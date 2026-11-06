Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964081;
	b=3nPON94PX5RHIIBhuwELOw5gVBBRYq79haIObQDE9qvpQgrjSc3DFelRoRwN8/CCCg7r
	 oWlhpnbTgHUHJsb2HsBP9DbJ/f2W68OBtVH+PmzMn/I/TgeFIt3C2J9T6bViZ7ViMiAHh
	 thZmqfQvGOpEXbp9T47bAW0NoLbhCRiW3cvS1oIk8mCi4/sqZhNhE0JnXfBhGrOpTVLm4
	 5JLKYp4HytK/zdDmrQS+p9mNHewmFjf2bn1bjMqJWJvvqvu7AgJQX0CXgfL4o9fqcy7Py
	 JY0YgkKJtqhrDyE8KwjZQz1r1jQUxCyfsl3Q/9iTg0wR4LPo7Q6U0KqjUnasyB0Ip+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uXU0cGie9RgBAnl9s8QiGJKFP3ILXbj0HPLmva/mBOw=;
	b=W6pdYSE7SvtovAxloEo6KHrsp7QutWI2GgjHNAnSa09T8lun0OaqzGdtOlNQmXkfWnR8
	 Nw+RyNp25BBEZBX+/4IbnQvZa2hcKGaF/Aan/XKuYqS9kDi3DSLPosKa58mXAKqUjCsts
	 2r+EEkEi/LpFqU/s6ssDtnLYUO4COwpdvYESqOlh4sl5lQ54yBDOLkQPqGeYXZUsd+PP0
	 kCCUFGzbMXtitWSiJhqvvaeEzNozQDtQ+Q7rc6wofesPa0n6CaqMXrVWVgA2+ctWRhQVg
	 GBYx0lK1mfwCvlzR2HJsIHe5jPngReGVCFQ48N1BLqRf5S2qsMV1ed4R3VKH8ShDk+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m+dGSZY8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85051606D801
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85051606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m+dGSZY8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so3397085e9.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964079; x=1794568879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXU0cGie9RgBAnl9s8QiGJKFP3ILXbj0HPLmva/mBOw=;
        b=m+dGSZY8I7BFHE9ZqLrBdaji+3TUwf2E5oxwOjMXV3vQw6gBmFHgHkX5RMiUPTOQJp
         aligg5TaGhgbBl/eEUJCSmnZs3Pa813OCUNLwvGhU4y7UwiDDxxObJ4Grte4uUnAuFfO
         udvGdfgXID2U0oFAhDhS57IlLal/Rg/kQx1B7KtnBcNXQeMW1YGsN/u9oFYC5968jNFy
         ZxQkiLwa8oZ5kVM3iUuLUNRqP2S+2Z3s84XG5JtHg6vz3AaqS20tu+rafvVH7UmEAirL
         J7jNcX+/98pfrWcfATNKcvfj8vSPOnGH0D7AGOXQblVdeEvlA7CDazpm4jaoNolF4I5a
         W6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964079; x=1794568879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXU0cGie9RgBAnl9s8QiGJKFP3ILXbj0HPLmva/mBOw=;
        b=lQrJa7gjgw7duSTB5pMvGHlf3+3i2CS9uif8P/nKiIvmRZSNej1fhV2xcePrCWnmeJ
         HY1Nt1FP8Q/Cej/jyxkNczg6inbjYLsUMxRSmht0EhFSOsEa5v4DkHg8nGbULFnWNO6V
         ZNbcMjUsDdvQWetfH0nFPWgYoiLPbHw4ShcpVlmPeqK1IUNZTMeVe5qAy4qkuaX4X5zs
         +SXykgD7wdOvxLw7R5Y223dlwgJ/MLOOca+mdymcL+Xeo1hnjUtFdj1lX5DzLoLf/Tcw
         AuPh2CMq19i+BXmVZjrRXdTamhvlQ+fy7ypdq+rJ0QQQN8rI87qfqEGd1KGw5kihNnd1
         6WJw==
X-Forwarded-Encrypted: i=1; AKwUvBxUxxS4UxgMKWKptfPGDvAWfTeY7u+CmsJb9I7KZJvH89EE1qNRi89nOHMENVuzm32dTyjENT8SKWIH@vger.kernel.org
X-Gm-Message-State: APuU4Z9pgqj8R8z0ImsnKbsxiywxYvpFfVPSxiRZth+Un8BYtEmGHZOR
	2jxx31l4v5ZnSPwc3HdQc5U8fJm3BD58QZvLmHxlF/nx0Eq0XApL4g19LRZoBez0E08=
X-Gm-Gg: AYBFou2adUZ6TSGE/pIXgVboUuqq0TTdeRhq38h9QKpi93Udt7ptyBxWXErD3hNi2cC
	41T8wWrcA0mqBLXQsd7Pq/ObW5T2kMwI/C3HxO2QiP+uJph8ItvmxnjFxnEydUDFER3E6WOCivv
	G6sNdeGzVh/USI0ivJZhOhpHcx2ZvpwMGk+j08A/x0BzDvWQG1MPTllFgQ435VeXICIAZUWgqbr
	G56EzN8uXA0lOWuBkuawxIyMwNfgRUHZS75h4pRxhmk8U9iZu4YWmqPnJO4nc3bAElCv2O0Es7O
	9CeWqqJQeWiA2NAIwrohXSkDnOR8/ZW68D/yZU24F2PSkNWJfXdj/cRSpTc2kEky46SVs7weEBS
	jSFusKKkjCpQUctpAtg9dzRT2tD3NHVEZ05fj6zn04r+OhV9heUmExoeYupQv2ueFdC1TP4KJLi
	US5y0PD3Dwn7HliF2lzUj17H7/WzCnn7a+ZcQRERjI7Lkciy6fQoXFwsEfGAioYts0zcD1sFGsR
	6S4IPPGK6R7njr4Ug3OkycMVixWR0z3G48Hoy6sCcAQqegWozIUKOmmqmfi5+dNdogpCoCpQxPe
	Fbbmup/ySsSTZ7bOL2dA3c0tEum+99HqBWv+6bDjz1vxMjn3PIbpgtkmQ57aLFA=
X-Received: by 2002:a05:600c:530d:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4b6dd82ab4bmr29802925e9.5.1793964078897;
        Fri, 06 Nov 2026 03:21:18 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm102404695e9.9.2026.11.06.03.21.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:21:18 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 2/5] dt-bindings: display: Add the Ingenic X1600 display controller
Date: Fri,  6 Nov 2026 12:19:57 +0100
Message-ID: <20261106112000.1612-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106112000.1612-1-olivier@mgcrea.io>
References: <20261106112000.1612-1-olivier@mgcrea.io>
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

The X1600's display controller fetches frames through descriptors and
keeps its interface and timings in register blocks of their own (X1600
programming manual, chapter 10), so it shares nothing with the
controllers ingenic,lcd.yaml describes. Its registers are those of the
X2000's display controller without the composer, which the X2000 and
X2600 manuals call the DPU, as the X1600 manual does in its register and
clock names: hence ingenic,x1600-dpu, which an X2000 binding can extend.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
v3:
- ingenic,x1600-dpu, titled "display controller (DPU)" (Nikolaus).
- No $nodename, no clock-names (Krzysztof); example node
  display-controller@.

 .../bindings/display/ingenic,x1600-dpu.yaml   | 61 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml b/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
new file mode 100644
index 000000000000..0e9f4442e4b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,x1600-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 display controller (DPU)
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The display controller of the Ingenic X1600 SoC, the DPU of the X2000
+  without its composer. It fetches frames through descriptors in memory
+  and drives a parallel RGB panel or a smart panel; its registers have
+  nothing in common with the controllers described in ingenic,lcd.yaml.
+
+properties:
+  compatible:
+    const: ingenic,x1600-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The pixel clock, whose gate also gates the controller
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: The output, to the panel or bridge.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    display-controller@13050000 {
+        compatible = "ingenic,x1600-dpu";
+        reg = <0x13050000 0x10000>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        clocks = <&cgu 16>;
+
+        port {
+            dpu_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c10342aa32f3..a5160860ae26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13176,6 +13176,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 DRM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

