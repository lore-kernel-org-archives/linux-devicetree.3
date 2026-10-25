Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918703;
	b=NV4NYwOi64USUPrvv4iQ3kY5/iOs4RcyscthHd4D5fcyds1nmBlWWr8pejHOhYheO4Vs
	 U/Nen9CR9sv6krnyhecwrV4Yv5oW2/eC2GUyyUiBJ2MIEvWSkbTj5xhvztVlAskFqiS+L
	 NQBHyeUSsvqdvPBzP/vwrNC9u7GZsOAWV4Q9CbzfGQV8UuTBxDuxYBjQtLs4J03J0E4kX
	 ejGBXVM6dgPxbfZEXS+u7auScH7l/IJENbN0bfQzUECT8ajNDPPrQNNAl6y2rw9umeunt
	 WhQrxyC0n8crCSNxrq7gTf9VZ+I6fTMSmwywa0Iz3zuVoiNZbqAS6sWoD35IfJgPpUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
	b=HLvYElMygp//6O2c5I0PsZR1TpvgntdN7rp72NmCHr9i6A5T78v9IW0BdhUGRwsTuxQU
	 pH28FuvPxILUxY3Nk4NF/maYn8UBkA5ixQQZFcpCKWBQTs9JIOxMbb6U1waucxBBPRrLb
	 puVemCrq+ba3nvHRavn6rhzQNpUAUctxC6R+civUhmRbnZGTV6Kh1FIkHMXORa0DjXqSe
	 IQKj6FEEORSiHCcIbRG7F2jnDgUalh0Z/TQCEapkEKQcY0bB2E++eqeIwr3sa+f/e/BjE
	 Iiw+G9h0+YOabm1ogmHjT//sVHq2c3Ur3swMqzbaljUgGnXvkDSGrqDl1ql1aadXneg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WCYC2F1e;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE81606A332
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE81606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WCYC2F1e
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1247943f8f.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918701; x=1793523501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=WCYC2F1eL7PSTWTewswlPoV+s/3gV54ijZwZdUij9tzdzSwuD4nnatlbxCrf81nbEk
         oIJ1zjY9a1cDZOeow9P71jiNwROIRl+li5gpaOIiLJi0oniTVzlR9HoAFJVhtBoLb5Pn
         YpeU8U2oL+HtPzoWnIKREM1gvua4fvpBQyrRmpt3L8z4VEzp1XYixHT7My0eFUBDzCSd
         zJwa4SdBL5Z/iU6fc4CcMtp3aEBHE7K3ZBFuYbz9kIneycZGlp2nbzR3f0zV3H0VJOIf
         AKX1CdPahbGqTRh99OIi5cJ1O/owNP0wKyMT53HVMZFBd22fwXeCu26pRB1j9ehisTBh
         TFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918701; x=1793523501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h//NBrBlTPDZB+A+b6lIo8U4diDkuBzgaFKaw1cfgXA=;
        b=z5pOFmCO21KBw5OFf/WbHhwQa5W7e0++iU2DS6LgpiUN4QYk+xfAZlPxJjrNR4XffH
         FQe3Wa3pMcrsYXbP0VHFgoxBNKAV82yGsVecYINxgpwlLpiBq7ACSMzMf+Db5ok9XQun
         V3OMwJRjNFcZwNOVubrzdueTNryUdcuzE623GUik0Y/uU1KitjXhWFsQtuwt/ZGiZRyr
         Fh4XoCZg1PTDfBdIi/Ky5NRQDn+hHspuvjmsamkYe2vUYxybTuJgjw2eG+MO/ocSH8ya
         Ay64AW/q/QSYIXmFzcv0bE/wxDGlIJZhEFfRioK4NW3jyFKK/j1l0bngP+l3r0+hE4HZ
         zVZA==
X-Forwarded-Encrypted: i=1; AKwUvBxwZ1jbvpH2yFhumjQ5HASgFCkCgTm922pwLUuRuKKg8pOCwCbc9XBNG749cQafpdEw0GLDxq47Ovda@vger.kernel.org
X-Gm-Message-State: AFq9FYIxhM6zNJdHgMZAyCHq5WlVEQWSshLJRp4EmoPaDn4SEl6Kx5cA
	BrIgDAoMdamw55KneHm40VxDi6EO6Zsa4Q+ypEl6ZjH8uM8CeGvP0kdXxRIfwShlK0c=
X-Gm-Gg: AYBFou2QXHyye4zmgJHrmiODskV/3Hxmy57gbmYVYj3XTlDPIrZfy1ANogQ/DWFrXWT
	Prx0okHENw7OfqXe/JDV5/2xtg1hc1FinfSOEVJQIYez05tUnvMJ20n+ftvRLa7le6bZ6iKsHKa
	+vTTYBay9SKAalCkI4wEKULUzSdNxLF3z7aO9i29G6A1ZNgGnkgL0bMu1cg42wBOWSsmCT6eUJw
	bdUriXXnXRJ5lgYsX175iSkPfEhj1Uhdg1XkduybILHMwdnVN7ZJNNSTaxeNk9Tke5cFaurgB5t
	TQwS/cVbtWh2YUGj/u+eHJDGXTBt99fzodtA7qW347rHvBnz8l6nw5GenYNylwFB3Xt1H+3IZtj
	nlppLhxj8ulgsUkS/5i0au5x6wdeYp+IFKEDo444AXdKllttntBdLlhuK8a38EMm61nb/jU9x8U
	/nSD0gCNQ3OYfrjl3tpFXSeAr5hooajffP28AWHdYAHRBF3tXVQpy5lk/m1N3k0LIMh1UvBRuAj
	X4J9KFivbmvPzMlUu4MfUtXQ4P35Z62hzxfY/sHQ3Eaa0dKpIlpqmr9t3QJDXicqkDlu0bPQkJ+
	sY8VYFzkoUJ7DAgxTomTn/fIMwY+p0sadwz16IAtf0lbZt8KuOf78U/aDPGUKCr1lB9jMrss8A=
	=
X-Received: by 2002:a05:6000:4a0a:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48e3eac8e4bmr6815931f8f.0.1792918701100;
        Sun, 25 Oct 2026 01:58:21 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:20 -0700 (PDT)
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
Subject: [PATCH 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Sun, 25 Oct 2026 09:58:15 +0100
Message-ID: <20261025085816.60405-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025085816.60405-1-olivier@mgcrea.io>
References: <20261025085816.60405-1-olivier@mgcrea.io>
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

