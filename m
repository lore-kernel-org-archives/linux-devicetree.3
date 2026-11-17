Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919196;
	b=RutHvWjwUTEB+m0hU5Uuf2h0Ij/hgevackApPl2gq9yH9Rn6hSkG5tdh4lgayQhcXGQ1
	 PZw23/aVxat79BJNxco17q0v06GkslWacqTiHbYtxnpgrFEqfniHYJLJTdvuF0YCt/xzZ
	 YXny4Cxw31GibTpiKe6SMUaDnCIxQ8+y6OspN4N3wRMJtcwFNWZkkBBAj1Nu2ftjivkDK
	 /AgiEcM0/HArgsHXFUI08AeeAbeXCI4BFSM3xyPt5iTUT6WQTroNzhqOLQSzypoo1Ej7Y
	 /C3tWG1eJ8vRjAKJHjJ59GWvaQ7Fk06CtXrdWxNQtvXMjBs9gEk1nAD0xMpguRrwnVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=acRH3NbgLkYCK5iiPRFwHw3LXKQX8KfNDsHlQP+4/XA=;
	b=sbYw4WxCfFZlewTPAdhTuz++OBGc9KZwOXEYD0G+GErjskNczIkBF6PmcZIUIyISi8n5
	 bByxwP4Y7G+IE1MY6k9NAa9M5uU/jHvIJSaMzdEaqclIsFqeskJ4GSNKp1fDExOBEGbwn
	 EzJi/qyyQKS30Xd7rqlWOPhK9xkzCbv9YOcCbdiaXzNJO/qlcq/kK4GI6fjCqKJ68JiD4
	 FPibwUIbbwXQPWPsEfNDzhLC0cCJcK72Cr41YerRiPmbti/zh+TbSPukB31F5AfKaOABk
	 J1D3evdAmiad1c95OGR4B3mQ7+2yLarnWOhjd19I7axsmJsb63hSYzLd4AU5j9H6A2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y81t6W7a;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB7606A8A4
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAB7606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y81t6W7a
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so11252775e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919195; x=1795523995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acRH3NbgLkYCK5iiPRFwHw3LXKQX8KfNDsHlQP+4/XA=;
        b=y81t6W7aTl95C4y9Rf0QU2nrD+sHK1morXML7lei63TX2FL3EWpNkN9I0aknlqyqK4
         gqHGoz2NXR8U0/otEEzXPgPNGzm/tI0i3FS0qTz08OkkknigPevlog1Q6m3RP7mq4xh7
         0RfSrVo1lbYrDa/L8TWUkyhwAHxnVHA0nNsFgAgAadTUbVUV7wpjcy+WqfOsafTXixTA
         A0Ksby2GTQifFsp4kd+zFwI7enrUtCAQxXxlWM3SNu3pqse7KFQHusE6UEAgcGgQRkpW
         PUcxqKnK+MccmXMoCZfVKYkegfkG4KcED9/9iyc1OUoDzS9PJPfwoWpqUo51uQ0qjeVK
         Tiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919195; x=1795523995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acRH3NbgLkYCK5iiPRFwHw3LXKQX8KfNDsHlQP+4/XA=;
        b=XBRuC8DY7NiyA1c4fQH5+SAHY7MTBdj9ooRzFvZtLPprGMtOGicBVfdzSDTdkPkAEN
         eqTSNUed/GRvUu4DU1tmVDgHZmPGbMhoMkNBboeDzrQ7gTF1UmlIy6xx7+Lk/j99+Hyn
         /qQrhXc66Vw+H435Xeef0lRaH2kwXgEfunqO2WnoQ+yox5gzFwTvcESv/Oj0QbqJPuuQ
         /I/jf+aMP1uVJ4xxJ9k2bD28l5dmbiSUL1aeQvOx0Eb3Xj+RhiRycXY6rGkTaDrbvn5V
         q+H2sDAEbgVy3b7FqzQi6SvzPkqdNnVRSW+xuCZdezUAaeBeB/gqmez7AHwwXIi9sK4f
         t/6Q==
X-Gm-Message-State: APuU4Z8PhpDQZoXhYt0H0EGpRWUhzjFaTS559Rl4Ww2xvFGs7MOhXofJ
	HjO6LV04XnNRaDP6WNX98IEHHDVx866a+UxOkMGIl78MoFbINDHJL24u
X-Gm-Gg: AYBFou1V0O8Yg1upXTaQqBTDNfLg5xocYoJFgZ0XDxqrWn8G6tTsI9BxK+nvWrOE18K
	NFVMT1lbmiWCZZg6kBUOrHhSVzx8LMWi1qG4t7EGGxx+WEtFt0Zih1Ab2nASUt00Yk7myStG4Gw
	g4KAQYFttwVdG21xcDjVnMQCeDkPIq5njpxS+n3JLQndJbIgwy37lKiGqQsvpN+XjMEulX8gSOx
	iT+cwrSknHSnFvlKhtPwdVaQSQGHRKwaFULaf7jHZSFQNXp0dUgj06tHnGbmbUtNIilwZ6Hxeun
	oHAQboYIjeez+VzuwKzt1YRRcVvkzPvHTt35mhSJnqhpk3WbPMlvxI9GuaDRcmvulBIX3nmmD0c
	H1Oodj9kf/xOtdjGpMD1Q00iLckSsU1DmXpLR8v9fP09kwNxqDvujc9YejD7VrGGdMxp9XlE9lY
	5Rqka7PSfjn7dT4D3MGlFjNtBR90J0E32567nvk0dH+zgsYpBWeiJk1zL/+kswI/q62Qh2iYrbR
	t6zxvppSqtHXHcT8u34aXqcKjBOgvgkGRJ/rtr0/Zwjb/exD+vY9+3Y1ylr9W5Z84txwADsPjaP
	xfDPrciAXKZP/HOS4TUtq14Tf2c5T/8fkaXft2wNMQoctCv9AWxHAgpvgK+kEh8CD/4vZw==
X-Received: by 2002:a05:600c:5012:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb7837264cmr55075555e9.3.1794919194974;
        Tue, 17 Nov 2026 04:39:54 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:54 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 06/11] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Tue, 17 Nov 2026 13:39:41 +0100
Message-Id: <20261117123946.668557-7-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Document the I2C touchscreen and its interrupt, reset, power-enable,
and panel-size properties.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 74 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..c56cfb8530eeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Works SW42902 touchscreen
+
+maintainers:
+  - rofikkerneldev <rofikcoga@gmail.com>
+
+description: |
+  I2C touchscreen used in the LG V60 timelm JP DCM. The controller boots
+  its existing flash firmware; the enable GPIOs switch its 3.3 V and
+  1.8 V power rails.
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: lg,sw42902
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low controller reset
+
+  vcl-gpios:
+    maxItems: 1
+    description: Active-high enable for the 3.3 V rail
+
+  vdd-gpios:
+    maxItems: 1
+    description: Active-high enable for the 1.8 V rail
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcl-gpios
+  - vdd-gpios
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@28 {
+            compatible = "lg,sw42902";
+            reg = <0x28>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+            vcl-gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+            vdd-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2460>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index abdaabe16ed53..f4c54d7d86bd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25835,6 +25835,12 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILICON WORKS SW42902 TOUCHSCREEN DRIVER
+M:	rofikkerneldev <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Frank Li <Frank.Li@nxp.com>
-- 
2.39.5

