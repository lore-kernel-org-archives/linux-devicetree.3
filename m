Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7195635DA55
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865705; cv=none; b=Vw5Q0pfPGt2qFUkR4mbjcDFcO+Wdd5Kxi5i9xJTfTt6oqeRqcZH8OOYH+gpT+0f6tFwrq7zKv1YnWJRdPoaGa0LqzAQoDZSkir2nQJE9/uGrfHobb9gRk/zJqKmGCKrV4ZUgz6vs28cMinbeHcLGtoch1UsQqfoJlmcsfgc4rJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865705; c=relaxed/simple;
	bh=XQlJ8bXJ1MTG275PpCHGbJLbyNdiVdRr5kgXXf3OAsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VHqWNQ83DdYu4yVE3zI3/LMX4vHDj7qHD+l4M5hXG4cKcTzkpdQbb8M9vBdUCv12nQtIOyKes/9krSsMEnqmmDH16bEmIDm/8cIREvXVySYxSND4cQ+4mA7q6njEK9QI5zaZ0Il2fNXGZsT1n3noExyKUIirCQTUQsi1tribr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/1KZ4b/; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/1KZ4b/"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39e57ee1cb0so999633a91.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 07:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865697; x=1791470497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Go8DGdYlWNQ1d6XhNdqWJy2/p+jQ4I2nLWIimGwFQbE=;
        b=e/1KZ4b/CUNwUTcavUYf2JJJi/aGda5CLybPmsc3aMTNBMjQhVuCCxqktXnj1r4MZd
         tk9ZEY3H/FjsxdGoAY+oUaG8hY74/8ESlPM4zw5Ioyytm/+dRQjnkL5gnsO5/FXELtOG
         SyJFK+QA5/5qJ2ojD26QpkMwFhO+oWadrIqlDv4YXYb2Cg/H/l9t0vFwDmk8pW0H/PC7
         XzQxy2v3zHNT3x2Zlh6pXap+KfITJUMHQDKPHF7npkR5hTHlMpcOpKjUiE/nB3qLekSV
         r0qNDxASvP3Nrzyiz/ScKGjLVf9Td1ccsT2ay69KG8Dr9QW4Ik93B7KNOtGuJCJGo9ws
         P86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865698; x=1791470498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Go8DGdYlWNQ1d6XhNdqWJy2/p+jQ4I2nLWIimGwFQbE=;
        b=VmMXoZzB26LLEpySVCAU/36ab7npAywLNp3Ad5rdkfE9XEG0Vn8Q9vJKt1YrkRuJ4N
         E0wkKg5C7xTKsdKzcBwyd0pUgR1yjbO4CdSUMccjLX2wv8BKTMlSM0Cwaa6yJgsA2UAl
         /zGfd1citzqhYLRxoyYlH2WpgPeOSPvhSRRnhuXMKwBV5bRu2gnnu8NCeNYHr28qGDiV
         qqL7kpGp57vRd2nx5P03qoLvM+yVr30s2OWwlcUhQAq5Iz1Br9NAM3ODK5clNnfaYRp6
         kbNx+vnGLaOGrS/KKfZlbBn/6xMmYBnGPylFnt985B/kimg5wUHaJujElAqQk9g0+RSw
         BxjQ==
X-Forwarded-Encrypted: i=1; AKwUvByE/wvD96q7/GFnG4OWhFS4zOnA6HViuHXfV2heAqIqTanaNo2+L/M9vdIMSNyUJLK9SMnym21lpg9C@vger.kernel.org
X-Gm-Message-State: AFq9FYIEXExx9MCRNb+ovN1e23CwYf0RJpgUrFWeUB1giOjNogtyBccc
	37dfcNHbHXJInw0KIfCwOIm2R5H3UbXyu0dLaAxvvuh46OKkWGhjWBri
X-Gm-Gg: AYBFou25ryS7W7eybB70Xvum9yFJQ3y/DkIsd+v0tDm/W9E7tUmJFjzv5QAH0IN/oOk
	pbF1dz+4/iSbh1kVDpDe6pYILiM139OGTHOZtU69qnEJySQ5RNUkBKpWqWloD3RGo9BscYoy3Z3
	TvQB1jqn9DWH8dRZsaF49C+6OFYrLlrJSC9gsog1J/ZAy+p8N4sUDKyOYe9QxzvsHCE3EbEpeMU
	HT+BsBO6hluP91Ro5mnmr/OL1fLGRbANJbT/Grf53HKLjwtERr1U6nNGSux7tEpLHsFJuRXrbB4
	d9WPuLGjmSRQF/2zlBRxxLdBWETkqXfKDjG4jVtka34+IlA5yCB+ZEj2I+n7mWw2JUK23qjlIPb
	Zc7X5JUbZsDxZFqNLgNOEXl5jqYpgBs3ALpkLRNw5HH5pmiq9EWMTT/7qq/L2qeth4xVcdtvLOG
	oR2cCvNdGjs5pkvfZXoHst48BkOAb0DaEom4CgyoOcSFyDTjL4eoqymeKrehNFjbkk8j3f1w==
X-Received: by 2002:a17:90b:588d:b0:3a0:e7ef:bc81 with SMTP id 98e67ed59e1d1-3a4d19343dbmr6803741a91.3.1790865697501;
        Thu, 01 Oct 2026 07:41:37 -0700 (PDT)
Received: from marchy ([2405:3800:8e5:44e3:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f445d356sm4976256a91.11.2026.10.01.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:41:37 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: jesszhan0024@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andersson@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adam Azuddin <azuddinadam@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Thu,  1 Oct 2026 22:41:25 +0800
Message-ID: <20261001144128.2336301-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001144128.2336301-1-azuddinadam@gmail.com>
References: <20261001144128.2336301-1-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding is for SPI-connected RA8875 TFT display controller by RAiO
Technology Inc. It supports display resolutions of up to 800x480.

Assisted-by: LLM
Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 77 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..4283de927b13
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raio,ra8875.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RAiO RA8875 Display Controller
+
+maintainers:
+  - Adam Azuddin <azuddinadam@gmail.com>
+
+description:
+  The RA8875 is a TFT LCD controller for panels up to 800x480 pixels.
+  It can be connected to the controller via 8080/6800 parallel interface,
+  SPI or I2C. This binding describes the SPI-connected device.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: raio,ra8875
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      3.3 V supply for the IO pins, the oscillator IO pins, the ADC pins
+      and the internal LDO. The 1.8 V core rail is generated internally.
+
+  reset-gpios:
+    description:
+      GPIO connected to the active-low RST# pin. Optional, since the board
+      may instead use an RC reset circuit.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - display-timings
+  - vdd-supply
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
+        panel: display@0 {
+            compatible = "raio,ra8875";
+            reg = <0>;
+            spi-max-frequency = <16000000>;
+            vdd-supply = <&vcc_3v3>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
+
+            display-timings {
+                native-mode = <&timing0>;
+                timing0: timing0 {
+                    clock-frequency = <25000000>;
+                    hactive = <800>;
+                    vactive = <480>;
+                    hfront-porch = <40>;
+                    hsync-len = <40>;
+                    hback-porch = <40>;
+                    vfront-porch = <10>;
+                    vsync-len = <10>;
+                    vback-porch = <20>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..99d5113fb035 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1395,6 +1395,8 @@ patternProperties:
     description: Radxa
   "^raidsonic,.*":
     description: RaidSonic Technology GmbH
+  "^raio,.*":
+    description: RAiO Technology Inc.
   "^ralink,.*":
     description: Mediatek/Ralink Technology Corp.
   "^ramtron,.*":
-- 
2.55.0

