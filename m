Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964082;
	b=BkUaSm131tr2Zof4HPmx8JJL6icujOspjrDkAJRrTER8GHFEOWWXwh9PoSSB4NLCJaqE
	 2dQpB6Dp/GSM8sPg4p66fwBvmzmCiaUUhGBTxIflYI7UIlMdXgHK5CWIJICCMENDEDwQI
	 U49bsb/lDZOIHL28z5fbBz/uFugQi/nxnici8dCj2fJwnX4vSkJkp+loSJmpOrH0mO1Rm
	 V4lvugCnJaunFEQmdJDN4DFV0mkoGxdqexPfBvc1puaARmxix3xSv6l+a34CyS+1UXozv
	 T5nF4VI9wdRGN9euAWzvKfCtNaigzs8Odg68I02f3X6Kk2LS0YPOJ8+cWUUuCRIosBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uzrxba9r6cfMWSMaU1sgfqwYz4SAWiJlh1jtjdSz0cQ=;
	b=efen5K4ijGAzEBc9OjRfAaQknGybdtpsDhusfJwT1y5BtDmJ04h/tOBbzd+oeXKqCc4F
	 N/tNIKEV81n5LRieRfPU3PLJjZHT5Pr+nk1SsHCxrFuYWoGxnH093YLgfrIhwO1a5sy9N
	 R3bo+Exn1UHSU6vzQVbaW6X67OqRLY7k552jM1A0PzmFz1K5nRWYtg4j5L6/bFM0xKC5q
	 dIMNmUheGi6giTNZ18fAkJsoUaYKxho/zl+cc0UmFsf5bcQFn/8WJT1MM+xa1JQgt0Rxo
	 UbosWfxrb2Ly9eRd3PItvrT+b3OO1LUpij4ips8zuXmQ17tkJQXcFeLTTpOBhe/eBsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y3uOXXJt;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FED0606A333
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FED0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y3uOXXJt
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so4130165e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964080; x=1794568880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uzrxba9r6cfMWSMaU1sgfqwYz4SAWiJlh1jtjdSz0cQ=;
        b=Y3uOXXJt6+tH3QGp3g6r8xYvBOJniVgX2cbEOoMDsbIbVBvHRzjbXXE/r6+F1Yn1kh
         A/sFnKr8lqQZrz5LfOs+bS5HMwJdqJvTA+9pix82d90eff40rCL3MSViMsC+cjWdrl2x
         3WlslaRNATiW2QFb9HnVSO+ApMLqaOlKjCqnNUTJZG2PCPXGgNOEk6AhMOiYF4eHLX3S
         RzJZRKo2/BmJOHmAYZm991LP5xW9BzqDEkLUtHTe5zySxY4SMxlm7H0PTTx0HaoPBh9B
         g9wJ33+GKh5eWrsteKvsf9JW2QSsStz6ZnhS2wlU1YkXrjnsFMcFR45w9ZBRNybsYgEg
         OJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964080; x=1794568880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uzrxba9r6cfMWSMaU1sgfqwYz4SAWiJlh1jtjdSz0cQ=;
        b=gwj1Mv1ZTPicls/bSRshZoWOZ+itS2QwJTQAm+PyoPkQw/tE+sveKnrsBhAzcJTb77
         JF7gldh1kJKSnetJPDntJ/2abFhFvAYuB/et531CGnS/1mHQ07WMVVdIKe4kd+AGYzTV
         M5Ax6cUQ7sdxoCEviocRkkT1+8hG22xHsupe7o96o2lvR/wV0p5dQDgG3RiJUb9MApOJ
         dlj2NplZ0AaLAFG6yxxq7xDrpTxkdBsXCVQgcukGwJLlbX1dUt68191GW0jyITfQVIg1
         sfzKjSUOn15DSdgeNrW3e2HKu+sKePW4MYJDCIdur4UiHCDigTI9a/ebreXhjANOHpXE
         altA==
X-Forwarded-Encrypted: i=1; AKwUvBzl7Jx4VT7r9dmjqYqJ6pjf1mIPerOEenHBXhfX6uoXt+gZBKu02aWsFfOts0DOz0WNInbsJ/9IzNT5@vger.kernel.org
X-Gm-Message-State: APuU4Z9Eaym2VaDWwLklAnPziTLgBnvEEPaozLzV9Cq5ydXzbsZZo9RH
	p98s43Wt8RauEy2QLBtkeHWbJjzNlPC1Bq0XH48yZ+JO9gI+uoL1ZEbWUdea73IQdXo=
X-Gm-Gg: AYBFou18Y2GELXYF2uTf/O7u7Nvj10guIQchM/2eiHAPPMl5Tt5Cq1YWxCVFccV4PiA
	MIcCoZWCr7D9Dj6VfA8YA//UmcCT3ELjK1uh2tAnARKHeyrhrpmWKnqAmcz7VZcnpPvPePxrMS+
	waUH7AmQoos7KYJ76GM+I9+l5/ovlKx3kBQPjebrIJPlVyqA9HWZVkQXJ8EFmb7QQtgEd7Gy1nh
	uh7i88pGiLnoYJDCcgqmoPClDqZc2bDLwVYev+jEyj3m3wQJXMS+LJc/XDCuvpimq5xMqg+jOGT
	tirItfHsn8yTp9qCD42G2GYeY5tW3X1TKXOa+U2CRsqg9r2pNfJ+1+Xd6l63T6zEZshSSf+S3jv
	jSeZK9ZfnyijbmGkggmW7HoH9pyXAx7D0Oxa8nEkeMwK/RXg/Qh0tPNLqca2oH6vWLj/tcqIYTs
	WHPLYaaD3BZ0OaTMGQpm9fNiVXU1Uf+qO9IlqK2Wre2w7x8ZXlFeqJlbpyLol8H3JAkZdGzROPf
	6HmgE1Uulzxt5WFpzhNyiwtpjaCPk5Uhe4dGmMqgZfl3Nb5j4caPCcY3Pyx1fRirbTctX57pE8L
	ohLCR4MFDKFypk7WL/8/kx1nmjjEO409YTpz3Ga+g8gcOfeY1VAotZ2KwGATuMgR
X-Received: by 2002:a05:600c:4455:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4b6de6916b3mr36874875e9.24.1793964080642;
        Fri, 06 Nov 2026 03:21:20 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm102404695e9.9.2026.11.06.03.21.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:21:20 -0800 (PST)
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
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Fri,  6 Nov 2026 12:19:59 +0100
Message-ID: <20261106112000.1612-5-olivier@mgcrea.io>
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

The 480x800 parallel RGB panel of the HiBy R1, set up over a 3-wire SPI
bus with 16-bit words.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3:
- reset-gpios, backlight and port dropped: panel-common has them
  (Krzysztof).
- The example's endpoint points at dpu_out.

 .../bindings/display/panel/hiby,lg35583.yaml  | 67 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
new file mode 100644
index 000000000000..efdaf6241e60
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hiby,lg35583.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiBy LG35583 480x800 panel
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The 480x800 parallel RGB panel of the HiBy R1, which HiBy calls the
+  LG35583. It is set up over a 3-wire SPI bus with 16-bit words.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: hiby,lg35583
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Panel power supply
+
+  vccio-supply:
+    description: I/O power supply
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+  - vccio-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "hiby,lg35583";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+
+            vcc-supply = <&vcc_lcd>;
+            vccio-supply = <&vccio_lcd>;
+            reset-gpios = <&gpa 31 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dpu_out>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5d992133e0d5..474d8a597e1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8343,6 +8343,11 @@ S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/tiny/gm12u320.c
 
+DRM DRIVER FOR HIBY LG35583 PANEL
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
+
 DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
 M:	Ondrej Jirman <megi@xff.cz>
 M:	Javier Martinez Canillas <javierm@redhat.com>
-- 
2.39.5

