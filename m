Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BCA1DF261
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883737; cv=none; b=RSxiEse8zeomADDGuFt+4BTwkc28aZ93fQB//bN5+aDx+3pd4757WNqIB02ohIqIo/l9NwiaCyHuwqoVj2kG8u0+/UqYdQClPdYJR5d/Zzrldsq/6zvsxzQBpfyJwGIvz5gVY9pVXeiAW61kO3+9dYJ53SSdsKVDvRzATBTVSXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883737; c=relaxed/simple;
	bh=Yc29TTeopF7GBGZJDILyfmE7Cm2PTK7KPtu3Zc9tXfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPtdonlV6qhP/gj6xpLPV0Ss2juHoooFxRX9ZpOqAj97Q9tsQvVydK2YaRtKEOUWdaxiO1xTLRrbQaA+6V4SR5RE9tFa8EgIRvYWSKGFCzMxxwwa3YLEdu1SVXQUtnp5gKa6UjKvH3T4muzZwMBZl3gdUmXdmUqscnU9pPtwLtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icznFxov; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icznFxov"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-439bdb1d75bso220926fac.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778883735; x=1779488535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWRRU0GvDFaf4a964FT+cr5rSIOhJbhEFzH95X7dSHg=;
        b=icznFxovqwqwmEPwWx11jsmfS3vGUKkz0dXhYH42YD9aCPGatU5auo0ipdubkUj8FP
         x7jVM63KMvA9cmvHE0zdOboOuw37uHX0swV2QPe4v/b8OJMjfXr9xUqwq2M067+oBwzC
         VhNxMmOWH+umBsiYpmpobeauYIPk3ycw19UWZQjW8WxArpXNA3aNoOS8AGL7PEw0cl2b
         nYv99s81w4W7b2VMTOgFCbaYeuzD7MdwPJaCZSQv1N8uufRxKja4UvXWrz4ERDdNWF/1
         ObLmP46xa0I0Wpq+4pV4e/+9dHYo75MoC17GN5ea4HPGBTb3DkxilevwMIwwXZ8torOZ
         FaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883735; x=1779488535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWRRU0GvDFaf4a964FT+cr5rSIOhJbhEFzH95X7dSHg=;
        b=RXyWkw2KMzUhbZy4czqN7V/FFP2rA5NKihLDikjQxsibC9w1vi89RT7V6ChMBB0eyq
         1MD4ZHnHlxv6iucfErX3eLzIAbcMMdZ+eIt1VOZFsXhycQDDPJkE4CfXwmjpuJGPHHJb
         YQdNCgEOEiBpzNFn0Bxp1nhog7xcJ3rS67Kx0qe0cbYZdadRWviuUek5rfdpWQlP2sl/
         aILLOnqahI47TRJVY37se7MG0wnAbOEVevat3GxuodBpHNx+WgEgf2fZHBJdQ3YdvXjq
         njZbf2xwWjQkzVGIkR6/guhBsHnheZY1jTuwnC2mm3XW4TVlzqq1bC/UlSYReLG4j7Ik
         ksQw==
X-Gm-Message-State: AOJu0Ywdy/HliFa1NWdcRuEsMN76xk+rcZlg8oB5YI5TxunrfDB7HhWG
	SKTn/C3XVOC6kI9JIo+icpzK2gpG3pGwCa10Obg+ZzBhw8U8vHcHvSBJ
X-Gm-Gg: Acq92OH9MrzmUYYrLc5D2KDZ4ZSSeQt8xlzqKZdNYJhvRZ5IvvI238WTyZiOGe9fG0S
	pZLb/s/K0rfjWWGlaKliUfDTCFI9nGz2z020TjXvrmZXhdHKjsxtuU6+0XRgFeT5fRzrssUMqQB
	2Zg8qVgcgYcmrRHsP3L1Oc8aB6xYJ1Uh5NaQK1ItDrpwLpHAetp770i3z9dpnrUSDMTAEHolQN4
	YV2jUHjX4qLuJ/1bAYY++HUsJ1OfEB8D1Odmocnol8DP1tZj/GiXhyplisbLR+oq2MhQ7+EBagS
	RcJ58sAaUy+yfDP0Wtw08WNMhVmCSju0fNRU8qq1Q8lEGilnCEJNoevc2d57kVLN6UHfwfygIyv
	/7NqyEUgF3LEBDi+o4/SmKxAorhUVgLpgOR/bJ14jM8PV2DfvbpSKZnQ5yfQaT7glHmSq14R2fJ
	gNoHY2EpXrXzORoZD0ejnR+7p57/rECo492g1TMwP9hw==
X-Received: by 2002:a05:6808:3204:b0:47c:6c9c:607d with SMTP id 5614622812f47-482e55a978bmr4321044b6e.2.1778883735358;
        Fri, 15 May 2026 15:22:15 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:8c2e:6a8e:445a:9169])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e568c0d889sm980764a34.9.2026.05.15.15.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:22:14 -0700 (PDT)
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
Subject: [PATCH V2 1/6] dt-bindings: power: supply: sgm41542: document sgm41542
Date: Fri, 15 May 2026 17:19:42 -0500
Message-ID: <20260515221947.299229-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515221947.299229-1-macroalpha82@gmail.com>
References: <20260515221947.299229-1-macroalpha82@gmail.com>
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
 .../power/supply/sgmicro,sgm41542.yaml        | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
new file mode 100644
index 000000000000..fa0d31e496f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542-charger.yaml#
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
+additionalProperties: false
+
+examples:
+  - |
+    battery: battery {
+      compatible = "simple-battery";
+      constant-charge-current-max-microamp = <10000000>;
+      constant-charge-voltage-max-microvolt = <4350000>;
+      precharge-current-microamp = <180000>;
+      charge-term-current-microamp = <300000>;
+    };
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
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

