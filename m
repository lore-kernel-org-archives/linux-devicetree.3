Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100776;
	b=JAry599kXjrBWfyEiakY8hpiCerSnnNYvM9pe/eQIEduBjNabHrHBJ03V+wJ/ox8pV9a
	 2RYxrpWz+8Sohdz1tykKWdZ972lrwQKuI88lzDRxf0RB+DaFMMMktwlOkzuo3o3FGA9sg
	 S7prU2stQ0iBalDGMkRTKT7kMzHDeMW5hS09hRIsIv+jE/yQk5mo+qWrsujD8JmkcGQHK
	 Bbq14pzdr8z6Ukl39aVx1R3WIqhtlrRWdxbcw4ekji+Vs/lKT4lmwnWLf4/JqNeL6bTjF
	 I3EpQsdfm9vARKzl1N1AnSunC2sSRm7zo+XlWwtxgMhnVzm7w5cozm1F11S6boCUrJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
	b=McNSXKJmesZNF/Ej6O9ZR57TEy7eiAk0mIPOyqM5yW7gdQYGt6gT3W7POq9wlcOp0AxH
	 sNiJiCy2gZ/RNZpFttYJdKgo5SniZ6sC636SQC9NHWzGINUwBdbERovEEI6j2IrmDbqfX
	 T36mmB331fsv2QWGeSR2S+A6V8NDctTKGoiRMptuMF9w7+2QQKC8aY3uBlk+RVXBjsTvN
	 rCqOs+nuYM9YSSXHB4sdIrl4OZ4SAsW9G7mwUQBYoP/nu74qqbp22RO8ZyNSEyw2IVRwL
	 1PgYQuOCYdxNiZ5bIeV3b8mdTuiW3HlFo0dLFuSmYoJWmLNuJ/UyZq3R/dEwHPv8lXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Oy/3KG5W";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860960A2622
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2860960A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Oy/3KG5W
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so4385030a12.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100773; x=1793705573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
        b=Oy/3KG5WqtvrHjqq1wuaW48vC3gsYJBtBXLHxWy7q1M/Haq/6EVU7ytgS6OBQjO5Eg
         XN5CqyDgsGYRw95TTKHft/iIcKiLv0VrIINjBHOyAGLbjAIMMYkeqRj9xOQV4rXcO8av
         lVGiZ6tA/pcY3MYlU4WJuBR6IcfK5EOweDwNsCX3XFQKerkj0E2DW1eUQKlWMxmCixPj
         yzAYQqJV+sq7fHRvtnzQMwZqI5qlOZZmpG0ERzkab5d2VG4pkSilpBqTk80qh5Ee6iIi
         8hX6NNQm8aC8ShpfLPVblX6PHGe4Zk+jEu9XIWHHQu/FBKNMXa6+AFYNPrjKDZzOcsH2
         Jf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100773; x=1793705573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
        b=1e9aQFbGWU0w80QKS1j1ps2y3Hg/YNjtZ4/7W+JQ9qhMKIV43paU3CtAkHeDEDTM/d
         ojyZ66QywG1eBSmyMgEDd0YeF2DPXob7j0vmWWGs7smB1CiE9caXGnhEBA40G2lIXain
         MmC2IEbr1/j5nmLNOg/14rU4GxeuK/Dkld3ItAZsIb4IIx/BkC5nw8ncUIlOGHXmL+ee
         OlRCXEiKGkcYqb6fLyVXqQVMaYm4GV8fe8hqGWGL7F8FY9ShHgXPJLv/vjoKH+AtTbGG
         MVKuuDvyqBCIbfH8NWB0re8xP/Uajt3bLXCjeqzvzJOu7aSpkWrHh4ZqeXQyqosa+IIX
         GDCg==
X-Forwarded-Encrypted: i=1; AKwUvBzK29G266oQ73xJp+c7KpM8vIwUcJry+7ezLr8d7x8NCJ/YGEepaPWkplc9TGgL08DEYzfZK/wcPWEE@vger.kernel.org
X-Gm-Message-State: AFq9FYJbSIumMMp1uWaBvAYFwgThDfJALyP0FqligWbfqj4fnELq3N9A
	yKbba/5sdnQFpSELF+MNpc3VrD1K2EcaqTsR/18dnvhnXVF+H2IORTMI
X-Gm-Gg: AYBFou3kf4IH4N96DPs5Ao1s47bQpzUi9ceVe32bryABs/8zO2xfqYyvCF9wgNX6GR1
	VEq3+H9GItmhtz+6pGYQn5P66PYWzTzqLT8IjUNdhdQRyY6z/Ek/GAtVdXHA6I58TLxoHagD19Y
	jnGrmKqC00US8Jv+YLO54xkbDh0Hy4RyfDoHNNBoMGlL7qtSG/01xRzgZ+bWSFbZGO25AkoaCil
	0LKFyjZjUj6emNvFrRk1hPUA6HXRyf/lJjQclfbRauEYLZ+ph66tuy/5PXh2pXEigtNbQVUYhU6
	Iri3deBj4O7hXABa3SKny8cJ/HfWtq5c+j60+4CrOpX+E/+WBd8yN3+eGH7H1c2CfM2Tjp4om59
	Rmd2Ld0GNxmH0mevYF2PJshPOKjo1XE7CYDBYD/ZYzFvt3npj7J5C5ps/HhczJT+tYTWBxE9/30
	ltWp1LPLOZjtuFNNhf7thFqmu2iu8Qn7Crm6WqWZMO7rnmvUD3hEXdQhBQSk5B4+784N0qM9duZ
	eYnRCTo3cfN4d+B75sD0tZ3uFam0y9T3Zg1BVSQnPQW97B8tm0wTvl17bJ7eDzWgk+9QrXMgNzB
X-Received: by 2002:a17:907:6092:b0:c31:82aa:dd4c with SMTP id a640c23a62f3a-c46bde48accmr960707066b.24.1793100773381;
        Tue, 27 Oct 2026 04:32:53 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:52 -0700 (PDT)
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
Subject: [PATCH v5 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Tue, 27 Oct 2026 13:32:27 +0200
Message-ID: <20261027113230.47538-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
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

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

