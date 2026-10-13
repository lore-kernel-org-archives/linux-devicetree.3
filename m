Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC9C52FE36
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914991; cv=none; b=cCXU7j0EcgZ9spctAIMY1jfqd7EMepfTLCY/KhulrAbRmBqy+q1O9KChndRQyNg294cewBpxUI4ADYccn2mJMbLQxuq0W7zCo1gXClMUtCltR55ulhZQyh8HylEXjLaYCTOAYnxta3oEv4Z6qsmO2Srvk77k9HUAiyjUMvGcMfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914991; c=relaxed/simple;
	bh=c8FdsNzX/r+VvGI8eA88a3FNv7vM9GF+GuD03DVxxgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRAgoZtIdJlXR48DZCIeyKEkGkpQW8MN7d7AYeAaQx1F4tLR8RepLSTFCyzBi6f618FD4/n+kjcGf42mWCCkRAlG8nEqQBH3eH434fKb5kT03udsvIn3tCi1ihCee40g49pukxZSR3bXU+7Q46VvxPVAyWchu5j6yZY+xptoZrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIh7wYZ0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIh7wYZ0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso3420415f8f.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914987; x=1792519787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz+S9WWYS0rGAJFtNukpledNMiYQuQWNPssN/kQCQUY=;
        b=UIh7wYZ0oXXw3g5+6CWkbN2loXAB/48LQ3uDJnvgjng6QC7/TaaYQ81cBpSb2i+y4L
         oMO3N1W6pu6SqhAca+eeYJkMwIwJxkkywR//KNXlxRJpsSkrmq8qKwn2Q8UC2994sfQc
         sADzpC2rRiOg6uMuOJvRlBPTgrD+JtW27ool5YO6uXVJJ5zFo7L1Orrc7RgUDcz8dvdr
         S9yjrIjOB/lqV3mu704+PgGdnfKJNtKxBj+dHFUnE9TyrO+1NZasDt59VuvaPdY+zHxO
         Lmmnpd4dD8f6kqtN2ekYjAb/+TN1mntIaS3F3w/HF8o+lnvnFonbnqtGoj3kfRrCako6
         UtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914987; x=1792519787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tz+S9WWYS0rGAJFtNukpledNMiYQuQWNPssN/kQCQUY=;
        b=KNtP+Vmw2CKe5tRXTU/wff2ZjGzYNMLXYXdXrX+Qd23N4Y0lfOKCZUYD8H2VWxcdIL
         0N/Bjvmj7ZWg+Z+EabOJsXInSBJQr25mEOhrxyGMq/2omRPkLG2TF/9F3yhmybXpw8Uq
         DWlhTEmtu7Y4AWkPvMmpq2hAkX8BWxho+zl3o6nHN10L+eEkFDkVh4sgr5we+hvseVut
         /UuerwOf7xZQSV1zCvXvMeBqRQ9Rqok+KEWr0iL6EE10jXUFTJzIThoP4ks1Hlm+xvPs
         Eupj02UUyvyhNqZQKJKtvLwGhu9XW2bAQfFsSNxjteWGAMigty0Eptjl5EsetE+IbsZP
         f/pg==
X-Forwarded-Encrypted: i=1; AKwUvBwl5Q0axru/4OPWe0c9DmU5XTV9rg9jVOJOwA5Aw2N0Ankr5byygJOTo7XndlaCgEEQETy1zYel58kc@vger.kernel.org
X-Gm-Message-State: AFq9FYILHtsmF12IjYjb1+Rzv/vHSvLOGfjPDaKAqzEYToBXJdjUCxld
	stdRszGds0QQfk2E4f+g0X5NAx0GKkNUgfmNAzrm6U3MfyjsDdACPlqS
X-Gm-Gg: AYBFou0JH/YgBWG46mGSJgs4Rly9CXHs52l+V5RFi+cUTS6MqLu81XcYpDvWK2rYGeW
	/tcOoJBDbqAA9lPjNwDh9pz4QtQGG1OydZnyWrE0uZxnkrVEUGzZbF64F4XmtX2CqfG66L5z57S
	LJ22BmqAAEaCcpdw9SgxA1ur1RYz8tj2AHrTYMuzxtOz91qjaAzD60E0q/G3UkFtY6oAVt/Nryz
	HNRMvB4Jn4ha/aGO5GB2WtXRQ4wpk/sp8li18RhwcKGrr/Ma5vmnJbSb0MZ4ZlOWw+yfsrByX3y
	c1avJgMtotqNsp2eaCnLTpTc3yhDftKktYhd4ECyLsMgkgk1wf376IIf6QbY2qgR15nyO530tTg
	WgkRl5xcZ8uywi/6SOqNV0J3vMsjeb89hjhhANKoYXJcDroLg3fYE93Abj2Sm60FwHs99FbdZpK
	quvTsTnL/cO7ngEcGbZvFysXPbP//lYo0PWel+EK5kS4vxKJHYastYHeoXSjTkRGPQBXZXJNw8Y
	ao5FsEzPlDn3F3y+KI=
X-Received: by 2002:a5d:6a0e:0:b0:48c:6566:9ec5 with SMTP id ffacd0b85a97d-48dbacdeef4mr20658640f8f.16.1791914986751;
        Tue, 13 Oct 2026 11:09:46 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:46 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Date: Tue, 13 Oct 2026 21:09:30 +0300
Message-ID: <20261013180933.487013-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180933.487013-1-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

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

