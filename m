Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59D374A17
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375361; cv=none; b=JmyQX6x0csAMJsSV1SYAMl8h3eh7oMZ4PTeL4w1O+KL4Jp+Z94hy2GUwDYhSYBSBmd8USB0A6boInj2h6HghqBCo04fG+eUt2rgsdxWyA5+KuUeonE/JzpS8RQ1kVyA0zjyMucg5YHujv+qfZ3sbsHTRBjKXGCZ+QkJm0garIf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375361; c=relaxed/simple;
	bh=3FsZ5EOWNSqtTNJo5ZjfqWqOVA1HZTXxoLvf10ooP8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8mFsBoPxOBUKL/v48zauEsKgAh0J8V6yBdHfAL8Ixr57n9RGsdCovIeSRHSSVt0Y9Dl3jWOlVRFDkEx3sxUWoLjFmEQ2bHEQ0+rW3RUisUm5Nehc0VtkdnHRpABNkF+71iZzRU7PrF3jNuHNn5sCfaQmfO8CjXF5n4zlxOrra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4X0Eotq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4X0Eotq"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3998ea7847dso17593511fa.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375358; x=1782980158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AB/lGNPBN5uckN4odzlPN3QWXl6kpX4z3NWF2IlVP4=;
        b=M4X0EotqJ18M8yivbNAFyz8VbH/WXcLy46RK/5+aIMe5oS2C6b2pE8AsgZdaBvC0tJ
         vYJU1vQmD+NUzrygHOjxQYWmPhqtRgToBhbECUOBVkLAXaLtIiMlI8PhWNjqj6hP21it
         8GgygGJSjjLLfyZSFCqp5eWaagSgb/aPBIMQrEelKwgiXRBCPRM82AVeH4if1JTAEWdS
         w3Ya4KEB1NSnw4ewixI8zYivC6299ia/IbXVPY8QdWJJm61oaHJR2Uu9ocPNXn+bjc/Z
         fbHVHzFN8KL0iyRXmQ9T+gHI4sRAG20V4t6s8znBZrYX7KB/LP1d8aVaCV4swE72a2Jz
         d2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375358; x=1782980158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AB/lGNPBN5uckN4odzlPN3QWXl6kpX4z3NWF2IlVP4=;
        b=IAhGnKasuo/xF2eNrVk5KFzDeXONngPcl0ZYL8pvJN/svv7Eowa590uplvHqKS0fcL
         DdXjNExACMZLfDNs+tUyX9Pi+i6A+FSxNLQVqFzQREPRyuBgBpWYamEZZ5gxZifDqi5/
         isfaO19DQFyt3Aozo1lQbgxGFw+mfm0RrDzYQeYmGahxH2XhNwatIIyzTkxwdtj+oGat
         nRCu50Wih0n4jRAou9+0/X2mGotonCQg1TEq2CW7anT2Ks9bk/jik0BatZcWBKtBIIJN
         hOJzLl9/JrX2jtLQT0W0shqsy/HE3LD9CVXxNLSXTsYRbVGgYqoCRSIoDMnEH+Q2m4r8
         0dpQ==
X-Gm-Message-State: AOJu0Yyl7XkBGqdTQa12ux1FdHppSgpXiFls8TA1OpkDFD/2GXvlSYOj
	NUe7AeNxO8+Vdjun0ScDqZGaJozZlIwlKq6s4goePZ5wnJkT3TgxJXCq
X-Gm-Gg: AfdE7cnrx6LAjUFgiaIKIIvYcN5wPBUGz6k9KsuSMtVGhWkQNEor4sf5r6vU1xtopCM
	fKhg2ieWDAXjREFphqtulS37coTm3NdYFiHneviQycrmdx5sPtI0/smfp8oeuM4kgGN6FDBg83Y
	Q+LbrYcu7aVYzqzxgMj5JOV3R1lvDHphz0qGmatvYUA1xBgMzhhuQzOKfi5lUh+OzbOzvJNkYb7
	reDgEm4jjn8si68q9q4g1OyGqknkhQaIqXh/IPa1DWwpRI1WvGpTinDEpu9ApZVsT+jXdRrsNit
	tiTtWTha5Iqcl6KRRCHdjqtx6zQNywUh82XMTjmXmRoqY++F9Y1V/d4jOaDC4OYgu836iQka/hY
	kSIKE4usY53u60XWBvs1SUJ82p+4t0Qs84fWu/nAzDo/DeTbPO6+8RY/3IRdEI7rWntw7IhJdQ/
	Qadwi1gnDh9Iafy3PSuY9ybglhBAMVsPS30w==
X-Received: by 2002:a2e:9acb:0:b0:38e:d3ec:4f91 with SMTP id 38308e7fff4ca-39acb55f8d6mr2989861fa.8.1782375357649;
        Thu, 25 Jun 2026 01:15:57 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afce64dsm39162221fa.14.2026.06.25.01.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:15:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v9 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Thu, 25 Jun 2026 11:15:23 +0300
Message-ID: <20260625081529.22447-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625081529.22447-1-clamor95@gmail.com>
References: <20260625081529.22447-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 000000000000..60b6375864aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.53.0

