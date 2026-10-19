Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB64ADD97
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404586; cv=none; b=YAYV81IkuOifUgFTIGTis/xA+Nt1EXRcfRApJhyLmYRtztBhTbi2Meg9PvoEVMDaOiev6MCyZ83Lt4IJZeAoJUpFW9v0nGQpvPljGQNGId9xnvt79oilXwimN6j3jwaS81tE34rsbvGfYSeQIg9pL7+xMKJkwccXggor4wNLXB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404586; c=relaxed/simple;
	bh=uckZyXVLlKGBcOMrrx1IvRPD9w3WkL3fsgBO4V5Ixp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=et3DxiH6e8JAObqiM/xAh/ddIq1xL3LIzG79OFfjtj336bAzZfvNab2RCCZD8K54lqrMDz9l1r9jSB1CgCkyQODye8hqBF1KLfvcxX0xAEzqF6PnsugGqxMHcbvOE4tfyHJdA3UXSjNywUeGRnHbpvChA7adP0mczcvlx89CM48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsFFxPoj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsFFxPoj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso648085e9.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404583; x=1793009383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWZSnVHau6Npi7hsSuIlFMNZUS/p2QupozYmLvTM/rg=;
        b=OsFFxPojFn+sx11Td6WUfDZkMG8RVf4y8u8NUGbT4SRsgdMAp79yIDmPJ8FGT5OzFY
         Iq9uxiUOtMFDkVRQFMh5NlcuVWpofsgz+MF3++z5OVfbtf+bWIMhC4yimHtpoD675RD1
         iZyBpUWI7qaKSE1WWupMvdtxykUp59SKNCplNZkFGMbLHDVvvthZRxPehRc4tBHS2JHJ
         KFbAIvN79Zcw2l6y9ogr2Nm3ErAYYQjquUJi707fRD10ztkujGLHLKAmSl8D1IO4js2A
         OTnGfspvLvHZiRhyj070jhbiSvOL1ldeE6mVRsKt9htHuWwLIIaK6JcbXOCEDLrUgWS7
         N8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404583; x=1793009383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nWZSnVHau6Npi7hsSuIlFMNZUS/p2QupozYmLvTM/rg=;
        b=Yu04iwpuUEACozbEIRew58ioFGzHsvwiRizq1gsoRey6r3/LlS+y2oPINlOmQ/QFgh
         7YtG535etMAvD+Ytz/hFVcMLdzjTq8a3WwryTq1DuWFS2QufPcNxYDH7BS0O3WwbQmU3
         ahLyFt2AmWu4Y+i/qPaPJp9DPRjYXem/isGkW+xosOqM+8Gt5NwSrJXa39IIiL8UqL5z
         ixFmvHIRmvZoakAG6nsgOAPk4Q9YOo80pUhehpN17zb0ZOJIQffFgOruQBHZAiu8qQFe
         K0VVStKw7QAzmvj6flStGOlWCI9ePmyx/5PRtj7MZqhAMw+kauVfZ0bWPYVsHQvfvNMw
         Cukg==
X-Forwarded-Encrypted: i=1; AKwUvBzSFLbZch89Rq8AP6pEuxo82cI92ZzS1tKK4+C1ajXxEgcDdaTp+ipTe9qvuRm1EdZ0OZ4ocEETzjvX@vger.kernel.org
X-Gm-Message-State: AFq9FYL4kvIGSQPYQp/twAA0pBvWXTZR/gSh6ppCWFSSp1jon6RIRA0x
	JxCkG7twIyT1AhMYXKfmUw+PUu7Xkd6EwPVBSr1bWXJOL7yEsrGSJRdN
X-Gm-Gg: AYBFou3tLjr8mTW8LDiFJyLuEokqt8VeWUbt7CRymDuwXpIocozMDYgP5Ce9/ftY1T6
	2KZY1yxqOwWGwddwew+xWOXKkjrtcTlLggmMhqlm+9F70A50VvuFRUuiJRpCy/MgcSqrVFGvkg+
	Kr1Q+KWLKgBSxfdTLpmi8MuTTLtFB3rcUFFVjBRcr8s9OC79GcH2m4NjBcYvRcLMg67jw9WR5sz
	UNvZ6FzVm/+rnh4uz4iDoKISy+vN6kgU6sl6XLoMET6EW/C0Fne55WJH8ZCTao84JV+k3K5adY9
	/PAR+5XYMzu61FUxHDZj4eGmpS5NJOvQnau27HyxQSl2ymN4hAG1LHvo8QAXhSJ33JniUSWZIrW
	Gve9fYkciWx8sCDiLj2kzlOeqXPdLK2KvKgviFYph2ETzJfzubbqmEI4vyl3z/g8YiAKdeZt8Lw
	aPE7z9yfwOM0TeOASL7vqLvBET2QOHz0jgaOn2Dz/HRPyNId3K6WN/h//18X99WB3pvxi+vfDys
	FZaOcK/97iWDW2ybXJPF/hrz83Jwg==
X-Received: by 2002:a05:600c:3484:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1d7605e04mr153405815e9.14.1792404582625;
        Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Date: Mon, 19 Oct 2026 13:09:27 +0300
Message-ID: <20261019100930.110954-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..0b4b8be9015bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/skyworks,aat2870.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAT2870 LED Backlight Driver and Multiple LDO Lighting Management Unit
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: skyworks,aat2870
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to EN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Regulator providing power to the "IN" pin.
+
+  backlight:
+    $ref: /schemas/leds/backlight/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-backlight
+
+      led-max-microamp:
+        minimum: 450
+        maximum: 27900
+        default: 450
+
+      skyworks,channels:
+        description: layout of active channels, where each bit represents
+          one of 8 channels.
+        $ref: /schemas/types.yaml#/definitions/uint8
+        default: 0xff
+
+    required:
+      - compatible
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-regulator
+
+      in-ldo-supply:
+        description: Phandle to parent supply of regulators populated under
+          regulators node. They all share same parent.
+
+    patternProperties:
+      "^ldo-(a|b|c|d)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@60 {
+            compatible = "skyworks,aat2870";
+            reg = <0x60>;
+
+            enable-gpios = <&gpio 139 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_vbat>;
+
+            backlight {
+                compatible = "skyworks,aat2870-backlight";
+
+                skyworks,channels = /bits/ 8 <0xff>;
+                led-max-microamp = <27900>;
+            };
+
+            regulators {
+                compatible = "skyworks,aat2870-regulator";
+
+                in-ldo-supply = <&vdd_3v3_vbat>;
+
+                ldo-a {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo-b {
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+
+                ldo-c {
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                ldo-d {
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <2800000>;
+                };
+            };
+        };
+    };
-- 
2.53.0

