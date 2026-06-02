Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA633D51A
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 21:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780435669; cv=none; b=l0Z1ZaJSZ44QIeRdyhRhbxU4bVpaXC3g5mrYe08t7B7e6DhO+g53KFUBsMSyAM8Oigpew4g5vaR2+9uG0WPZch3kqbaLTTkyOozhC77FSJdliN+rEF5aoGYfNysepk9Tt1XFgR9Ufln9Wqbi+dWr7SBp0qOUFgHwEiTYzIzb5bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780435669; c=relaxed/simple;
	bh=W5m2lzvYLlw7r+o+e7AscuV7yWW+tXbCRyHIj9wK4BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AW3rM0Aw0OJLGPvR5rBbEvq8l2+1h3+uH02fybag1s7uNWTc6FNBhsMtf3gFSkl9ZQ9YSL/1mbvcDgUfhYb80jN3xLRYqOcbOVfdBqQEmHL0rpMuoTyCvSzLWKuFghvYVCi2Tkqpx6J+UwKlinyQJQclX1xc5IedmRsv9TNIXU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXvUqnLO; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXvUqnLO"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-486539875c1so351951b6e.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 14:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780435667; x=1781040467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASzuiA/oWwreVgFn7/8SW3dexF4emahYNJXfppn07Ak=;
        b=EXvUqnLO80/61J8Ax5Kw34LJAUvYFBytOabhXV51eQ7eZv+JlscJIw/g8lghZulbdQ
         XsE4b8OENrDlwQB9q9d7ZgV9pCQR4zP002+ynHf+Fc508/iZubaxgFsk/2Yxpk2+Gk6i
         w7aFiAPoRZf4CGI4d/xIvOtib6giVIQh2/cqvQO0jcrx03PhvvW5CbFpDUYdVo94LpmA
         A8BFN2sZ85s+uRfL3eLXRXkasNBjnm4s8LNUQ9Rhfjc4JiAYBkDWsLVu2oqC9yXTg0ud
         a6kx1z8x0KuoMsUFN9H5EGtOSLG8IKC7BoBaeC07C3iWoIFG29BYjr4hjesmeDDtWIFH
         jhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780435667; x=1781040467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASzuiA/oWwreVgFn7/8SW3dexF4emahYNJXfppn07Ak=;
        b=Hr3XjH8RxPa4lPOsY0bGHz0iynJVvs33y5vWxxbi+Kce5fPZT89FZ3BzgpyeQTjX3t
         XNQAo3CCvrkJ3OYJORXMlV7kf09OBkfWzcC/ma74QyfumdNBp2DKzHMIf0EWtnGFw4Vy
         egtzeXUtPLe+sm/CEQ7KafnGL9DcHloikI82voKNqGKOpP04v3aZpiP9mVx5L0bfV+yJ
         VAWOWDFpIqrmOUjTHtCmeVjyrW0Ghjm9hUUcI/BSo9ONkdaMXoxW5qMTvxpnwxCiijKb
         yerWEGxcS9yce6ZjNArPirl/9+2y0VsQMbL4RBZYF/DcNX0L3BfkKd7iJLFOhSNYk2zE
         jYLw==
X-Gm-Message-State: AOJu0YzNQhyNLd4/oqvE0BmLWJC6DA1LJGHCww4meVEemBMfjyI2KB1s
	D4BMI+slXObg2Nl6irbltu4uDUA6yF1dIpZboy3X15pQTu++fWfs0ymS
X-Gm-Gg: Acq92OG2shBDdEJlK+HlTD60vmroeU4jywiKmfuKQxvfJm8SwAqWWMH2ROIfhHkAq95
	9VeXbTnClkj/D/nSdMOx3wDR5K/6p+GE+j7k6fmKe7vwo3RvaL/H77lO+KhzoURzUf8iFH8apLK
	wgxAPzfWdy4klITzYNGISApDCVcgMGKG+busvS1fSHo4DS6vqnu6wumMxGafFsKSUVpfBxq3ith
	MYybg1rf2psy+6dVTYRfsUbkqUW/2lv38A+SCwIgZ6txFMEzGJiwkDDEkUE1KPFI8PVGlbTwwCb
	VrI1fm/QYwkkMPq+OAugwjCuf2t7mvXwK7OEMuHOj+9I4I6KkYsJe5uzY4NVpBQSUQV+Cd8ySfr
	zEcWi+bwI+iy8zMEhL6KQ9w2f4LoWXG98qaf6g09l/7XLxbh0/slLWG8LQL+xqeHkp6umWiUKpu
	odTgHUkKY6J5CEYwyACgRbJwgZ00ogUU4=
X-Received: by 2002:a05:6808:4fd0:b0:486:37ab:e80d with SMTP id 5614622812f47-4865a8e101fmr403833b6e.1.1780435666693;
        Tue, 02 Jun 2026 14:27:46 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a53bcsm216722b6e.3.2026.06.02.14.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 14:27:46 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 1/6] dt-bindings: power: supply: sgm41542: document sgm41542
Date: Tue,  2 Jun 2026 16:25:07 -0500
Message-ID: <20260602212512.418166-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602212512.418166-1-macroalpha82@gmail.com>
References: <20260602212512.418166-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Document the SG Micro sgm41542 battery charger/boost converter.
The parameters of input-current-limit-microamp and
input-voltage-limit-microvolt are defined as such since they are in
common use among multiple bindings currently.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/sgmicro,sgm41542.yaml        | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
new file mode 100644
index 000000000000..a97afea83700
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SGM41542 Battery Charger
+
+description:
+  The SGMicro SGM41542 is a single cell battery charger/boost controller.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+  - Xu Shengfei <xsf@rock-chips.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: sgmicro,sgm41542
+
+  input-current-limit-microamp:
+    description:
+      Optional value to clamp the maximum input current limit to for
+      the device. If omitted, the default value for the hardware will
+      be used (2400000).
+    minimum: 100000
+    maximum: 3800000
+
+  input-voltage-limit-microvolt:
+    description:
+      Optional value to clamp the maximum input voltage limit to for
+      the device. If omitted, the default value for the hardware will
+      be used (4500000).
+    minimum: 3900000
+    maximum: 12000000
+
+  interrupts:
+    maxItems: 1
+
+  monitored-battery:
+    description: |
+        A phandle to a monitored battery node. Values for the following
+        are used by the driver and if not present will result in default
+        values being applied:
+        constant-charge-current-max-microamp
+        constant-charge-voltage-max-microvolt
+        charge-term-current-microamp
+        precharge-current-microamp
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    properties:
+      otg-vbus:
+        type: object
+        description: OTG boost regulator
+        $ref: /schemas/regulator/regulator.yaml
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    battery: battery {
+      compatible = "simple-battery";
+      constant-charge-current-max-microamp = <10000000>;
+      constant-charge-voltage-max-microvolt = <4350000>;
+      precharge-current-microamp = <180000>;
+      charge-term-current-microamp = <300000>;
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      charger@3b {
+        compatible = "sgmicro,sgm41542";
+        reg = <0x3b>;
+        input-current-limit-microamp = <3000000>;
+        input-voltage-limit-microvolt = <4500000>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        monitored-battery = <&battery>;
+
+        regulators {
+          otg-vbus {
+            regulator-max-microvolt = <5000000>;
+            regulator-min-microvolt = <5000000>;
+          };
+        };
+      };
+    };
-- 
2.43.0

