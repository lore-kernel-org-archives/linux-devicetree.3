Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152C379C34
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 21:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784411825; cv=none; b=GtgTVMfE1dfgU+f6UK8ForgEvaTQIHzZsRWOTZLlIQva5e10dyTlm0WpPeEzo+8TvwUoIFbXbHwCeifgLB0T89mw3PuZ1kZijZm8rzmXphUJpR/I5yCyC+STwp5HJ+m+5dEzbqw3msSkK/5hlRAIAu2UOuG52M5IyHWE0JA8gmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784411825; c=relaxed/simple;
	bh=e8EdoxkcXCLGue3RMjSGCqAcggnaqiNqZOMtkWZQElo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DjI7rnNqOJtj70g001pV/iGecf7udV9nOTcZD3fFYy+1NQjuJMZREJfGk40MO4/h+wNrjT1QboYl75O/NqfoGFtulS3rXKfSgtYIeYFWim5f8+LqXFMxlURqjB1C5NZM2rkmzgP+x7Veors6jeZDKFQ9dDqk96RVQlAyKSTPO40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oR0l6BlS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oR0l6BlS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so10762145e9.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 14:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784411820; x=1785016620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpxItdTSSRPz8qQrNM+YynkVLo80ONeSs8p2LlFqFRA=;
        b=oR0l6BlSpb8sfd8K2IAp3PJkSsj01jSmDOPHtuL1Op/LhltiA/F5g3LAtb9KGibvpp
         MKej7qZurmoaR93I6rgUnvIe59vvCD44CXgIpvgLrVYJo5UO5qtPABhZJCo5BZ8mMCLz
         8bw+lx0u2r+aDI+ZW9nE14nC6IaeTA5uukUtt+SyFkLNtntui0wycVmW8YnLT97xTC5d
         0kGnUth2teEFdHth/9gXLKxn1RHoxF+ciDayX56iNZjx0hyZobdg8jRqwJOuN2LpDczx
         O3obNIHRDCATLnk/oGP3POJUbrlGHIaNyn7AiMNd2zUCivmS4IWae6SfG6MDWkiPq9a7
         IDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784411820; x=1785016620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lpxItdTSSRPz8qQrNM+YynkVLo80ONeSs8p2LlFqFRA=;
        b=RHs3E4bzYK7Klf7q4gyOnjrUhSivA5f+fzz43+yN/SgeRODX5CdllxtCVAH7dRStvM
         VWz82BOmoSAKKWgdkxT78guLexe4bzKyZAjNXW10gIMI9ALc4N2WsUnGmtgH0KilBF4C
         X0FPbMjRxE1VYNc9ZtPfb21nY5fn65eVD6XdkUIKszCYX6aN8s3WHB4M9VdH8XUJZQlf
         zqdpCKSx24c0OsyeotGF59wgY1i59Tnw40qdv29azRCpnE5fopgshH5fPUOePsh58P7I
         ubwgl50xgh9G2t7lwRMw6FsrOliN1OLa6uQKX+yIOLEZPwFbASkxf8eMBVtw1pOJ40zG
         sgtg==
X-Forwarded-Encrypted: i=1; AHgh+RqrGKgetGwQIK97ZnNv7Dgdx+65fobZnBm9bJDIfplM1XUf+pt1f8yjK6UfpDkFnz29GiHufHKq3e76@vger.kernel.org
X-Gm-Message-State: AOJu0Yxntgq7lZDRUzrrtCA0x4j9heCO4ihgjZOVdoiV/g7VvP8L3IEH
	wnwP8PgAuo+wtlf5wsFAQm1Ay3+nWHG/GQmdsAFSNUY65WyjSJiB9IxQ4w20etqZ
X-Gm-Gg: AfdE7ckBLvDU2sS1MEhWOR9y/44UgmSOnzL2qrbCgDBpBawz/6czlx6pSamoXpMy0aj
	zQu1Cev5JOuyE4FuFoFtUJ0YZ7DvRnQ+EyQeNz3t38QXY4HSMeDz7CRHC3mWZKaPRc8NhPkVJLw
	EFgfLKh6qEJ/SE0b2NGyXYbBgUFoVR7JUcZvHzYnAE301mqPCUNWuexMp2uTHh9uMzm8GlKQUEV
	jvCAAizwodVq+WjzgUveYTFAKP78WpNt1rouRsr5UCxbdmELz2doi15tBal0MRRCdFoeFNV7dcn
	HjKnlZWWn49jCU58SOV4HPqXcj58adbaaw3LyoJjttvvZmdUQqMupTPM94N94oNpUYJRemDxNbZ
	T/yA19FPS7qs9lfKXqYfztFzBB2dj6e2bhz0EtaJz4DgVdMMsKMZxgriPaX4f93RRCONa6FtC2M
	1bDyuT24BqkPM9HNjMPAJX1A4U+1ZnvMRlPZd+dfPYvtpy
X-Received: by 2002:a05:600c:1911:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-4954fd46219mr50068585e9.1.1784411819680;
        Sat, 18 Jul 2026 14:56:59 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4954c0a81f7sm101199835e9.1.2026.07.18.14.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 14:56:59 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 3/3] dt-bindings: leds: backlight: Convert TPS65217 to DT schema
Date: Sat, 18 Jul 2026 21:56:32 +0000
Message-ID: <20260718215632.3295049-4-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718215632.3295049-1-egbostina@gmail.com>
References: <20260718215632.3295049-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TPS65217 bindings to DT schema.

During the conversion, the following updates were made:
- Documented the 'regulators', 'charger' and 'pwrbutton' child nodes,
  which are used by the boards but were missing from the old txt
  binding.
- Documented the 'interrupts', 'interrupt-controller', '#interrupt-cells'
  and 'ti,pmic-shutdown-controller' properties, which are used by the
  am335x boards and read by the driver.
- Named the regulators 'regulator@[0-6]' to match what the boards use
  instead of the dcdc/ldo node names from the txt binding.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../bindings/leds/backlight/ti,tps65217.yaml  | 123 ++++++++++++++++++
 .../leds/backlight/tps65217-backlight.txt     |  27 ----
 2 files changed, 123 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
new file mode 100644
index 000000000000..9586e08f1b1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPS65217 family of regulators
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  The TPS65217 chip contains a boost converter and current sinks which can be
+  used to drive LEDs for use as backlights.
+
+properties:
+  compatible:
+    const: ti,tps65217
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  ti,pmic-shutdown-controller:
+    type: boolean
+    description:
+      Set the PMIC to shutdown on PWR_EN toggle.
+
+  backlight:
+    type: object
+    additionalProperties: false
+    description:
+      Node for specifying WLED1 and WLED2 lines in TPS65217.
+
+    properties:
+      isel:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [1, 2]
+        description: |
+          Selection bit. Valid values:
+            1 - ISEL1 (low-level)
+            2 - ISEL2 (high-level)
+
+      fdim:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [100, 200, 500, 1000]
+        description:
+          PWM dimming frequency in Hz.
+
+      default-brightness:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 100
+
+    required:
+      - isel
+      - fdim
+      - default-brightness
+
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      List of child nodes that specify the regulator initialization data.
+      Not all regulators for the given device need to be present.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^regulator@[0-6]$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maxItems: 1
+
+          regulator-compatible:
+            $ref: /schemas/types.yaml#/definitions/string
+
+  charger:
+    $ref: /schemas/power/supply/tps65217-charger.yaml#
+
+  pwrbutton:
+    $ref: /schemas/input/ti,tps65217-pwrbutton.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps@24 {
+            reg = <0x24>;
+            compatible = "ti,tps65217";
+
+            backlight {
+                isel = <1>;   /* 1 - ISET1, 2 ISET2 */
+                fdim = <100>; /* TPS65217_BL_FDIM_100HZ */
+                default-brightness = <50>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt
deleted file mode 100644
index 5fb9279ac287..000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-TPS65217 family of regulators
-
-The TPS65217 chip contains a boost converter and current sinks which can be
-used to drive LEDs for use as backlights.
-
-Required properties:
-- compatible: "ti,tps65217"
-- reg: I2C slave address
-- backlight: node for specifying WLED1 and WLED2 lines in TPS65217
-- isel: selection bit, valid values: 1 for ISEL1 (low-level) and 2 for ISEL2 (high-level)
-- fdim: PWM dimming frequency, valid values: 100, 200, 500, 1000
-- default-brightness: valid values: 0-100
-
-Each regulator is defined using the standard binding for regulators.
-
-Example:
-
-	tps: tps@24 {
-		reg = <0x24>;
-		compatible = "ti,tps65217";
-		backlight {
-			isel = <1>;  /* 1 - ISET1, 2 ISET2 */
-			fdim = <100>; /* TPS65217_BL_FDIM_100HZ */
-			default-brightness = <50>;
-		};
-	};
-
-- 
2.43.0

