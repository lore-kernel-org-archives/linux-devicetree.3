Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246482;
	b=zyzw8R8dq/NpggqP5NuKZi2LwbGsYY5WynRE7jqsEQkMpzl+V0C7edv8rggrNtZKUq71
	 0TFqfegEh8eAQ2Z1osfYusW/gF+oyXdj5MV+Gvc+8Sf8vgcb/J60W4/O25BdL0IywbQlD
	 kX9itGkhg7kvNoAOOQQg79MNqAz6r9xsJY3p0224zQr/swPEvokW0aQTL8jZaXVF73Wlk
	 5OLOIdSIkhR6XxHHdToA1K6qJ8Zg8S3rmaxPd4UinbiIK/cNH/80W1w8UaKC1VbAEaSjb
	 6M4DXm9wQpd9mH26mw1m6ZBuPbL4mPZ7NmWZCMM5U2m42AeTGxmrQ+c0XYvnEmDnOZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9tc6qWhK3kP9eo7gTGV93XNa5b2XRSF41IUa/oigVXY=;
	b=Ove8hlfUJ4y3+AoG2vU8vfAuQeLmKUaYmTM7PDGGZnYXbp2ajaF/Lv3kPyoNE/UnrMOR
	 ZYfGPYPnjV9HdDXIrdXeZVFOsFE+gGR4Xgfr0gPrjc4weq24rbnQZAWfVNOv+6ZgemIIF
	 uRDc8okG2VC0/nc7nUgHzfYU+6GQBRtEGmbDb0AbrJcw95bJPKNK7ZupLFEjN5KgSljNh
	 dc7ioJXoEasXnAyy6PAnituzeqDIcXZBWmqFXF406T+ayiH6h3thTqXnJS/I2tNIrados
	 RzFeeD/AkeChScR8eCT3ggypXYQLmQw6RlSWOMTUxgv4CfkOk/V0GYIhcZ9P71umTFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=VyphT7RR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4993560A2619
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 17:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4993560A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=VyphT7RR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so11928065e9.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 09:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246480; x=1794851280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tc6qWhK3kP9eo7gTGV93XNa5b2XRSF41IUa/oigVXY=;
        b=VyphT7RRWxe3Nb1j+alPv1dFVOBnnwvEQPNnZN2sFTR8QsulknKhLeTyqfbw9gW9+a
         9Xq7JqSTvF5dBdNVk3prQv9Y7ONFhmZ8B3gnBULlkZApqHaw/z9zfEc1itHBIsFQkuB1
         hf8S3ZiaT0v9xdzx8SrZprURp9Sbl4tuVF7UzubtEd2BAGQ569RQmFygxzTvNzk1G3UQ
         Km+Edbqsq0Yf0Av6+MPgPZssJmufla0V3Zq6RSF9U67PNnInd3WPyUVYg3ky59iILhcB
         kRYaoAulGxYaPwoYWLUKJZ7IURSzvgN+XcSBOIiXPt0ALFryznT8mFshQrFTDKx22jY7
         DpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246480; x=1794851280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tc6qWhK3kP9eo7gTGV93XNa5b2XRSF41IUa/oigVXY=;
        b=zNHy/MfT54BtRt1vAGHl91wefwpHUjfJkpIUTZzEFMuM7VGw11ZDeg3PnYJrc3J9Wm
         MznTJZQkqczwA8xXqsLcB+NE6oFbvZll5QNC9xCcQyyLfsoXLe9XJH2O+BpptdvtRuzL
         T8hYC/xuQ6mfmSSc8/dppow30mruQ77SWex969gdnfn/Mv92a14I9o5O1LZ/2r/vKgTF
         ZNHJveB5Z8PGbkABJVGSMS1P+UVZuFd/+SbHvSWthncPSHocK9u9sA7brUTlzMXPpbmk
         JnKt6n+ZUwZGQRmbZlLTbjU+TDZBA7ihZJyuvcnRG/H5GH8nZODtFOLrHhwwuGQPRiyC
         Hc4g==
X-Forwarded-Encrypted: i=1; AL+hErGkvxdNCYMr0XFgzN61phCSxz6pcwIJ9lsaD/8s/Xos/BXstuaOrFS5ZC1VNE1MLXnPJLoqKMhRhpib@vger.kernel.org
X-Gm-Message-State: APuU4Z+syp5Ag/zY0phoRVxGa2AZwZCRlkDDnsJxox4+hhyzL0DgfY1P
	0s1xQBO88Z7buUXXG6h2qGHwe2WlBubk4TW7rbwGdA7C2oeTDa0TdnVWzBWKcWk6sTs=
X-Gm-Gg: AYBFou29tSHV8EmtgFEg9cKs9mDw/yNtJ4+MV0LrhcrIBxKIG+FhcFpHVuU2Ert81TO
	OivSITbuvzioydaiAgR2/dB1SQgtjaP1CJeCn6Ngy7YWHzO4RnOX6MiYV8HWziBcl+ihf0OIOjS
	P1uYh5C9WyvJ/9oOjM3QX4XTafUS/35z0rarU53CxQ04nTzGoITMcxYMsoVAEba9Jf3hduBkoWE
	LAT8BZW4fT1i5DJi0og0+SLzuWd3RsS/mfFS372V9Tmlu4W8B3jO4ItKkS+6LuZFprMM9ZTAO6L
	Id60NuXFfk98uwqcAue0/bzeZZbWst+u+d5DcgIOEwhr8LhjKhWTNzM9SXw0MioypxxBnlK3Egb
	010pYz5UCpIWhps0oHzhyHDuR9jtErE6/H3ihjqNF1ig7e+iNf9PIWlMddduJ5ZAHfNmgqooqH8
	eb8nSCk42YCCMf0oQcZhanQ1gX3AdZ3hPqhckBm9lUgeq42BWlI0FlJNs8RH/4dv73llx4efTPV
	5YyzduY9VDnoAaWHDGBuKSxjCh8LEnWYbalH4nGoV4CHgoLNtu61bc+p33BIyIAPmxfuh7czJrV
	cqVxttBxbSYMW4TvGUJnm/B1ioGdd1h2ByM9OBwldw7AMgyWEnqRS9o+35cPnx0=
X-Received: by 2002:a05:600c:314f:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4b963c73aa2mr94357825e9.25.1794246479866;
        Mon, 09 Nov 2026 09:47:59 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:47:59 -0800 (PST)
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Date: Mon,  9 Nov 2026 18:46:39 +0100
Message-ID: <20261109174640.96951-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109174640.96951-1-olivier@mgcrea.io>
References: <20261109174640.96951-1-olivier@mgcrea.io>
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
index c3e8d1a55d28..ddc559cac674 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8346,6 +8346,11 @@ S:	Maintained
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

