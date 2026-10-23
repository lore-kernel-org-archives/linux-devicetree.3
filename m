Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788133;
	b=cfa/mNlRM7tCpxrIJnfMO2DtYhHIOB5es3WXFiUtQs5IRgnPO+wy120CAdjTRCIEUItp
	 UkfFygLjSSGU5crB1Pt1UpS2L++wlsapLN5INRuNe+GwLJ7GNBVp+x6rZWuxENQQgiUgu
	 dBJ8NYxNxww63lUZJt2AQEGHXyxLCtkg3T/7KawiR5esq6dpqshs4Ykk1jbVcwuoV0nqN
	 qhMXIfMRnyqS1lP7/aoQh3HZGyWCM5TcPUNpO3a8gfzE5bkGl5P805wDr+HFku7e+1Xio
	 zm3pr8lkQ0dzpnDYXxMRdofe/v4MsQ043Z66FO9+BDbItXos0A73t8zWjNUW1jKhc8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CltLoSVZI1vl9e5Xk8AH5ABIellf5efpdTrcem8ydxA=;
	b=bGCMb0p5eZgdqGxW9eL1uMzY+Le6lVhzFGqnXK2vcGGJpWy3LrEO2w1PWRswZJFeV2ai
	 TLGT+eg7IEnQIYan6/1GYQHSRcXNUymGSZQ+2bVMbkCw7mW7EOWINqEXhHHS42mUEKnRr
	 YkjJ/1aZW7uboDizBfeE5FNzxy+/uGOkuAAFg0RkidJRiPy+9nRFAvEjDIjf12Xu9JMiS
	 yK1VKDYNDNjJJKOlA1zMVKJFXmXz+WHdRlOBvVMaIIPOPN7jEA/4mRb6R5ZXPzLoddCXP
	 CnXczEkCdMNJybN71/0b/Kynx1buvtVoB33MISbShdrbqKVawpQOj8zxNy34ss0mdug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oBwgfwHm;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266D1606A33C
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 20:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266D1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oBwgfwHm
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1625385f8f.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 13:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788130; x=1793392930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CltLoSVZI1vl9e5Xk8AH5ABIellf5efpdTrcem8ydxA=;
        b=oBwgfwHmsmBxfTS5JX5faiudumKHXgvyGSxkRfoSfRdtoBdDGifQhNkwXDGZFrdbLM
         8cFvt7/panM+aqJVOdfJZE6KWSVNcByOIC/JoCTQZYTPP4uWqSRBG4PBQz75NV0Ipe9F
         wHUFc7co3li5NzRlwqZY6l3sXhtOW5hRYK3uT8jlE1HAFYYaOjOhoIum+LErH+ls1efd
         GmmpSqooWmac6Lpyas+yN0e+D5maG6px4YdIK/DL6dqJvU31vbeJwit18gc06ZkwjCk+
         GDffnYK0+S7/4E8YjhLF8buPz+z8XeTCz54JP+vYhxw/74iPIcDJKZXJP5PTVXYyitTZ
         wQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788130; x=1793392930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CltLoSVZI1vl9e5Xk8AH5ABIellf5efpdTrcem8ydxA=;
        b=O78puqXFqkeD6xJumMhGHFxzhYFbFdl6CFTURqMKx4wrrF04r3ZEzehwEay8No3vNk
         Wb8oCx37ugxnmD6KIsIFF8QpPSy8SSRPoGu8+JANLvVusYL3/Jov7Lld759cOjaTWWEV
         g+O5ew3inxIJINBvJ9am19owFOklgu3R72Wl31l7LKZ8KeNygxK80vCWpVVM3u9zkbxr
         oIp6V4CO/69V3F+Uo1uMcSbYewrLe3e+AfCikBJheq3sQPkRIBSU+vi1iyutSQrnT5Su
         GTZfxaJBZ0ukzroKr1qG3d/c6ysJjsDxMCkakeYhFjPkETg/UGTcD6pp+i6ahXWc+KH7
         r4mg==
X-Forwarded-Encrypted: i=1; AKwUvBzD7/Y2ahhw6jcFF6LUzNh6QYYYhUpjXLObqYnHOzjRdlFiF/MAW/a+/MGSqUPi33zPUjfrVi4suNnG@vger.kernel.org
X-Gm-Message-State: AFq9FYKR9acDJJ7BslfUxJqfANY/ilou7OUdgQ69u7ZYqNPF1KcHoVgb
	xR5L+EMTAZOVADOXferv/9IylhTvuzMlPLC5oQHFdgc7FCIwKXq5wrZsQGeqFkMhrtc=
X-Gm-Gg: AYBFou3ETs+UM7BLr/igXjEkEtIWcPwQaJVoaW37lx9UB273A2dvDd6jS+vDpoMcWp+
	qW/LjHkVt6FTdmO4gVWsa7fbdJR1vX3+wkn4NA/oAZPxBzwhmzio8z8zwU+WRHMfoSZ/TP1fCS5
	TNKrgfQMbPsInNRkUGFoiZikJut2QuU1n/lMR7OVNIUV2iu3qE3kvsIUSJ39hf2EDt+bmi7cm9C
	PIHLuwpHg3fWWzAxvIPRaXZauVxzrdszhw9eJBFNrBiuPvBh5kn3dWau6XF6Q/zy3Jt2jHCMx1e
	vWaH3G/VuEiy5VzQ9/PAQZJrHWgenA8UGR3+Hq4hwBSQ32iWBvBMKkE1Fxna0xQEUI/CauZmgL3
	M31w1hzsNSjd6P9a9VHizV6Q0+eZf3BG5WYMjsMaxiYD5yJyzFnxbZPKe43doWgAxyKlqedyS47
	hSLwiwrHQkEb/q/NGmyDCC0ePGLzlYHHp4g0yyESRt2eKlImGKYuEQJK7iMk7E9BEJeR0on5DHv
	wlX/LAeDnfwbPUEDeN00x1FnSxcWPcR2gTjaggJdYmkfYTnmv7ruBC7DCsztP/O02ODefD8oJQb
	0EMngLmkeIQ=
X-Received: by 2002:a05:6000:470a:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48e3ed1ef39mr167225f8f.13.1792788130622;
        Fri, 23 Oct 2026 13:42:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm200998f8f.33.2026.10.23.13.42.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:10 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Fri, 23 Oct 2026 22:42:08 +0200
Message-ID: <20261023204209.48556-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's SAR ADC has four auxiliary channels and none of the
touchscreen or battery engines of the JZ47xx ADCs in
ingenic,adc.yaml, so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..7886836b10c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ingenic,x1600-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 ADC
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The SAR ADC of the Ingenic X1600 SoC, with four auxiliary input channels
+  measured against a 3.3 V reference. Its clients select a channel by index
+  through "io-channels".
+
+properties:
+  compatible:
+    const: ingenic,x1600-adc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: adc
+
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x30>;
+
+        clocks = <&cgu 28>;
+        clock-names = "adc";
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        #io-channel-cells = <1>;
+    };

base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.39.5

