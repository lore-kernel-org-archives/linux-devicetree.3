Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955806;
	b=ee4SJ86xw0vGgcIR03nyrD2YtDofQYk92DGzFlxEQZkjMHhyNO/Zi5hOZbQPxFKOPCcl
	 /xLPNJoFOseTNKdrgWyEz3inmOXb6RFw8Al7mypngIYjkrcJKUE3QZeDCBi64FtI0cJy/
	 vQZYLsHQI60zQz7Qm8rUJAiVV5Ec8bcQnJpiWG03IXjy48XE9TE82/Pzdp8yjhV3nI/ht
	 nml43TJsUP9d6onQkNCl2PkN2xzLZSxPcL+KXZjGRIkZVdp1o+19nskfeCcEkmMWwW4gQ
	 a5mfJqytNAmQ4JTg1T90KhMoJbJXKoYxbQzRAfvI0a85DUeKI7tkkFXYIsDNCXmXjHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
	b=XNMpSFFqLx64U9KaiF9kaiiU8tQCOTPZ2qXapOFsUowroR0/bLedk8YopOl1+vSILQW6
	 Cbd7SeONtRoQwcEclNF5PnyBukBPpXBnZN1IVp4Hi5Xr1+hKWh1aXBFkDAVnsbRS0Qcbm
	 R/5etUJ4TZNYz/QV2GOGV1Plrf6URZJmrlYzqpZB2vpUauCcMAbCY7Wd9QmPZrkJoPx7o
	 lMmXg0dorFUOfVElGyac+McfjGGGWzQd9ZNbRyk5fIYWyYupOWJouMTzhxLmV9q5+q9iU
	 MzHZMmCeAIaeDsgHll5xI3mmt4gQnbxvpaNuP4N1GgJHI78s/w3II7wXLYDGWWVUAIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jLcw8MKE;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A01960A2604
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 19:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A01960A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jLcw8MKE
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8403135e9.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955804; x=1793560604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=jLcw8MKEECxPP/fvZs+TLnDQ/K2gjaiQqLn+wRBL/sxRPZAPSkkvBZaiay4WV+wvGj
         rk/6sNMK4yf54QbHOLkqaOVXOO7Je7cbuY3UzZ48soEXpYsbEAOxD8iN8JDqt3gZzjHJ
         NgOjQEfOfC9Uhnh/x7fBCzRW7dC0LPsgeF2gy5guiQ6QUYCCgQy+XgYfFKiaaYMQt/4T
         zR2kmAud+Xj6092+odPwAD3Rwfy8BUdKVo1wx6SsNSMv2HX6snwx5TpVtGETvfZ6KBHM
         c4swCNAsbcceUGK7WCWIBKwcGHM1lzH2T5zA6Ak3kfj+LZ6uqAfyh/eQojjbXWFERhxT
         8U1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955804; x=1793560604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=ujEp5N4Hdg6YnldrnP4cnYhT6/KxfHLG3RjZhG18elrdYwS0fRerqtg0F1X8pkSIDf
         WzzETPbkR0ku/bzxTWKbYpyYiFbXrsg2YeSdm9XuNnuoQj2Q8wU7q4F1EryupUVtzooD
         qmbnShDCU3BDxjcj5Q4BsC1/hv57XoP0wnQhai3b0/owgtdMMm1TNmgL5KEWCTVoZY8n
         ksvtq6GEjtfEhJ9vp+rlmUTWabP13DhK663EZ5dlvNN1oMFEQUyAnRfmtmse3vXP8tzf
         9aeCqUfvWhSAjbGrhX6vsqHnVOJyb8PFEEIoksQ8eVyqwiFit4oUP84KW9lRreyB232c
         p58Q==
X-Forwarded-Encrypted: i=1; AKwUvBzbXR8H9GZKu5ty73PLVsiDnaCadpIqAW3Vn17Iy9tnHCmKXSWEIPaAHifeuK68HPvbQOGPRfz4M4iF@vger.kernel.org
X-Gm-Message-State: AFq9FYKBxNJbrLk94TB0MV32tC38+UiKNrYysLB716eb8R6VEhXvTL5N
	nXIYqFPpV4WnXt4R3Wbu6T1qSOBx5n1lBEGLOeJw/ATaCKLW6mR29EGoXDoIikidGcw=
X-Gm-Gg: AYBFou07EbJOAZnRgt6NaB/h2Su+LVXdutfyv2ICQf0DfvkMGHPaaX8o1IFLN7Bzroa
	QygwYsZ0sEmvML2gQxjIoXLWSxsC6Kudx3b8FYqmerW768sNhmglZI9nosnMMMjq6BVlekBu4ip
	O7OL+sAM3YHs7WHWEEkzd7zvBOf19sD2UakwoAsN4GEV3ec12XnGI4S99GAB7bDNqz5frofh6fE
	JGKtJT2Uxa2XeFzq6h5i7MgQelHxjTeKIEfEt/VwrKh+bmIPfxSPGpSCWsOXf0THSg1ip9IcUjH
	/dlpyHwuajPRcNonjVqguoU1ktAw0dwlFsFrkdgaNmQ9+NDjw+tIMIRU5q8WUtg0Vp02TpbgLTy
	zf9LbpOchUPG8RJh+GWJHqtTeyaHTcpOrkuToBJk5iM4sg+jWAUTnF3ishxoUuATkVVmOWK08n5
	cfInWk3ix6MDCaS9YEZsdl3PZeoJ3ZmCeIhwhGOygDny9ytwmMNvy3I0GnV3+2lUFnCUTK9yCeb
	pzKHQ8Zn3EH9xo0BaNoF0W9D5f0zfCAuaFs97p50RClheWUbq4VsF2TOgtAntWleCSevStvr2NN
	lOl7fxbBeqFeKQ==
X-Received: by 2002:a05:600c:5397:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a35ac99b8fmr81985055e9.8.1792955803985;
        Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
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
Subject: [PATCH v2 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Sun, 25 Oct 2026 20:16:39 +0100
Message-ID: <20261025191640.13592-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191640.13592-1-olivier@mgcrea.io>
References: <20261025191640.13592-1-olivier@mgcrea.io>
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
---
 .../bindings/display/panel/hiby,lg35583.yaml  | 71 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
new file mode 100644
index 000000000000..19498910629c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
@@ -0,0 +1,71 @@
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
+  reset-gpios: true
+  backlight: true
+  port: true
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
+                    remote-endpoint = <&lcd_out>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 57313163e59e..e65500a70c9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8152,6 +8152,11 @@ S:	Maintained
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

