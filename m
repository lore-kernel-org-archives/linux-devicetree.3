Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A84349BC
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787536; cv=none; b=ju9fvOMUV6LqAwBpWFVv33sHG7pvqW2yY0v6x2hlss6ol14pVm8OZMsAFIgw27HXmogbfltzoX3WcILZsIvgpjVmtCVzkwcRsnEFYGGIvHZ1xetATZSauKGO8ALpVPyMwyHyBFDJ4zlEsb6gWIq9+LJ+0mUqovmzbXK5pVB9Btk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787536; c=relaxed/simple;
	bh=PmvQc68Z/dISRF+he/+mFZ4P8H3prDncQ8jHX64rQJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxtebUxMG2YPVviLavF5eC6maxnt9O8d1vZlHX/hyC46YcSxV2qpsqhhKe3YxzxDDS0fO+VNjAi0Y+aWvQRD1NZqnvA+SnDcrZERef2CGoeuwUTOQBA72mp1kSEoREdW3rCgXPhKxhYaa8EOuRELOlz+sGa+aNnpCWJ+jRPE93w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbQ+afdV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbQ+afdV"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2db3728f0c4so1391315ad.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791787533; x=1792392333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUR3aroC7QKMpKgOnRgDOdhqgqz4M+XtodQ65N8R+f4=;
        b=dbQ+afdVRZLblrhpPv81kRnOAh7sfRtXEb0kJrD2/GMDimwXbUpZTao67RrSK/cO/K
         4WBiBqOEpwz5STqGBk9ctRX9hU7F079HRsEovSIP6tiSYilwXtWtyskVlWRobcToO8wi
         OWnflcERf3Rx8/CE/GYXsw3ck4w9T202Bq9F8gvWzQlZ87Dgj28U6BGaV52EFIEzeqLR
         +kL6ryBsIvDT9imQGd5oWG/qA0NHeAxQk0r/kjgXiETh52gHhZ5LuzKkxJN3YyqauqXZ
         Tp2ImoX10cgb1Nv7oRlYPd6ov8HW63HP+2nLbFNYp6WA3UwR4fgIMAdggMGmpCCR+A7U
         l4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787533; x=1792392333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUR3aroC7QKMpKgOnRgDOdhqgqz4M+XtodQ65N8R+f4=;
        b=k4NNbzihc6e3xUXU0RwMl0jrltF7S9U4nkViNNO6zHzQMkz3WBfHSB+bZ3M48neNb7
         AZpAcuG23lqJKeyatR6EfisljRYUm81CyVtJILFCtnskAt5+eBj0LjCwASMjhU9lS0P3
         +Kf/kmjXmX/pASW39IFcTidcJx6nRVUvok+XoIzBHZNuVAYbf0t3o+lS6UtK9qsKke28
         0a9+kd/Aj6XG2VVZn6Y5bHrXPqVR3DZA9gkutde6SYnq2WGWwyyR+QoJmzcYSWXoZX2g
         qA7NhynhMKN1Dx9JNKIsyEKdEWbu+wD02m86GhWrW+QDF87vs3tYcDapyMPTubiFworP
         3j/g==
X-Forwarded-Encrypted: i=1; AKwUvBzzUqQXVqANS5L1kXD9QWj2x82Ycgy7+jQSU5tp1u2hQj2MavQtiBzvnLavWfsYmLRuwo6H1XarA9Ei@vger.kernel.org
X-Gm-Message-State: AFq9FYJyjHH6nc2GmWHud8mrjqLQbcMYIAtZJYs+LoOL797RIuEQTckI
	1mtK5s83s/OeqzBlrIQUx9F1nV3jd6utXqY43ynwC1kGzBaFP7wGGJtl
X-Gm-Gg: AYBFou1ZBjhTOAWW9uYFZdo1cdQfNuaw5myBzIN8SdbGxx2V1Y7jnUcVHv0KCYifiA0
	QEZDw8Rtf4tIfI8KoC0Um+Z8b/qgVpDiaJQ0e2JmnkKzO845oXO5J7NB1XDp6aRck501XIzx48r
	tM2PSs7A7YlB562t9DHK1zLZ6EBryevTxLH73fx9m+bGwXYnfPOEwt9YuKPhqpZJoKy0cKVRGX3
	oHJgUQ6fx5gTCL/BuAZ5/Cv1DuVayt+LHrfg3celXqOjKAQnj02ioIt/kEaoKgRAWe00KkBhmHm
	L1S0kJ0fEuxPs3SPJtyELmgSihrBTZY/EW8GWH6P3aolVbu96BbI4DCNOcBHBhJ68+T5IOlY5+S
	ny6Gg8h6YGtLiBDD/pwsDGsfQPlWpwcwVpFQtMMUp9f6aIsVD9/I8Uo0E8Va4XhBn9h2CEDN8Vu
	4WR66OZWCrhE0TuKO2wavR/GYxE0yij6vAIbLCwmsJ5BXMuLoyDa9esAXwoho6u3PRYk1Xdf0bM
	Il4OKM=
X-Received: by 2002:a17:90a:d49:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3abbe66df3bmr3052672a91.6.1791787533505;
        Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
Received: from marchy ([2405:3800:8a8:86f0:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5fe84dc3dsm870713a12.13.2026.10.11.23.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
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
	azuddinadam@gmail.com
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Mon, 12 Oct 2026 14:45:04 +0800
Message-ID: <20261012064518.3497285-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012064518.3497285-1-azuddinadam@gmail.com>
References: <20261012064518.3497285-1-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RA8875 is an SPI-connected TFT display controller by RAiO
Technology Inc. It supports display resolutions of up to 800x480.

Add YAML binding schema for the RA8875 controller, along with
the raio vendor prefix for RAiO Technology Inc.

Assisted-by: LLM
Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 77 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..86777e2cec57
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
+  SPI or I2C.
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
+        display@0 {
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

