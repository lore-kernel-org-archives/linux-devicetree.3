Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCB4429CD2
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440066; cv=none; b=W7Y5dL+W78kzr06yAZ6zPecziIy2/eWNPXhvBdPBC+qt6VWx23y6F0MUZfnUCcQLYtMuPvL3ubi1Bds1UJl3gzOImLe1fuPr+b7qZHljsvQMNkf7o5gSfiAcNINFkipUxY0mwhraX8eSXZGdEULi6PANGfFPgZ90mNe2aeOx4vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440066; c=relaxed/simple;
	bh=isBQF2c+d1pfd7SjWUxH63IYxbSEywyUQ6cp2unuDRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m99KCOifbvOjJkDyejWyW66EH/8Pxwz8IUW50yN5/4mF8WzuKacHizK0Q45HK8XlV8s1spO4WmD856yCYMk79iolV4hTm+NDjor2LmOgB7bmySODyOT/+n8MgRz2i8ZlVlbvJNhCSvo93+mMVXDhBE/D/DOmw3QUWVqo2oI8CME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aa0mvXA4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aa0mvXA4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48000c5d6d3so1270933f8f.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440062; x=1787044862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+sTsNWNEbGad7k8B8n61NKX3WkNF/1NgHNb6RMZaeY=;
        b=Aa0mvXA4HMVpX4mWoGX6SnfBCYC74WPwebpl+Srx1GN33ezRSGQVN8Et349jfx5YZV
         mKaOAsBoTPLPSU+dj0+rPQcK+IoO+LY+jo2fvcCZi4hHjkfLo4MTDk9ywTnhiBuSDPqv
         WwHG6ZzrFviQZYTcZBNlaIYujJqQ7a3df5dC3C21nWFgUDor6Wi4WwAO6cushpmnr6Dv
         jdcwtS4Qw2X8CX2dQ+YQ49HBowyr13AJ5Lxb6rjorRVtL11B/YQzq3rI9PcGGbTJuPkB
         9Lgx5wpZDA+1RVKKrkzoKJAFZ2psSt6o/VvXQjNnkcDnqPgYqzt5ipy2nJkTt6p2c56a
         6E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440062; x=1787044862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+sTsNWNEbGad7k8B8n61NKX3WkNF/1NgHNb6RMZaeY=;
        b=Y1w49I6BCjZkbUBbRtieiuVzCv/q7iv9vkrU2J11BN3czwYjfDfXlPy8gQgQ8XDv8p
         LHqjBKDNJN6vFvS8s9IbUAzkCZBZu023op5PMxPK7XurlBsTKNwebRmX5e63dB2LH0Ba
         Q4t7Q3zMkkwWScpj4W5EbkJnyhS7dtnkpCzh84aNrnwvL79tiO7Z0KBMvYQqC8drfXWO
         x0jbZjW6/1twew7uyzHVlz9fmYXSpoKoQYPrAQJJSuHd1FM4zJjkU4HUmNXSCySO2jKq
         WjpU+r5NZbpElEpK7x4ZAt+reSa2bi4+VWQw+mKCcgEJK7R/3FRvlUnRHzfcfUTPtgWf
         9lmg==
X-Forwarded-Encrypted: i=1; AHgh+RqunPtnH+NtZ26X4/JP5YJvymSG6rsZrWJw7nXhihc2o8RKt5GpFbQcTJnbazf42s3NPJjo/7zT0veA@vger.kernel.org
X-Gm-Message-State: AOJu0YzZdc3r349DHfDY4WU8n+/HpiPtG/W3bqZlcrxm/WXL8XvDaKzL
	RhHZl2k64nzyJ/ONlfl+HEJA1KXFNkfo2aFSVbs/e/LFRix1CBt8Zf+c
X-Gm-Gg: AR+sD13pxaPdtWOm9gNLmbQr2wjat0Mm1zfPtHizyaW4GxVQI3001u+m9/tZQkQv/o1
	9p0859Fd2KzTfU0F9KSlXU5+xkx4CDeXF08B5nLeshNk8/TcZEDyQsV0ROCchyzBvu4h8uSOvFb
	zAyNV5YdqutDGDCznrZFKxEWZc7iDWkw8J4JP98qJX7Fi/bHQQKxQ0+TFaQF2VjUA6gfJwvgJ8u
	xRw4ZpCKwbnB0Zow7HmCgBBkyN4rOhIeZ0GcPFFGU6dNM8noPZS5xrcpoZEM0wXFist6ITKDNrg
	Kle2EimVFMOFZJKHwWze/fUUu++QaglJM7gf8oYxIzrh7lFmp/lieWc+oSWov9WqHGU38ydNGSu
	4abwhBuzV2O6O6McUx2SEfwYoT3BRzhw+X1DJr3haT4pW+7xZXxaGD8RfJGHwJTB/0PBHkC3XRq
	G8RXLdTShtWNam3FWnZFuGRkgfA0GtifTTRXkmUvf4fj9SMuPwzmpW9tLV84g2E9KGTagG8dGMG
	keyS9mZLV1P1YVZ0K+iNCklyCrbaQ==
X-Received: by 2002:a05:6000:4282:b0:47f:756f:9a8f with SMTP id ffacd0b85a97d-4814add84c7mr3006425f8f.26.1786440062012;
        Tue, 11 Aug 2026 02:21:02 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4814a7096c5sm2921744f8f.24.2026.08.11.02.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:21:01 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: pinctrl: Convert TI DA850 pupd to DT schema
Date: Tue, 11 Aug 2026 09:20:57 +0000
Message-ID: <20260811092057.687155-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments DA850/OMAP-L138/AM18x pullup/down
controller bindings to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../bindings/pinctrl/ti,da850-pupd.txt        | 55 --------------
 .../bindings/pinctrl/ti,da850-pupd.yaml       | 74 +++++++++++++++++++
 2 files changed, 74 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
deleted file mode 100644
index 7f2980567c9f..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-* Pin configuration for TI DA850/OMAP-L138/AM18x
-
-These SoCs have a separate controller for setting bias (internal pullup/down).
-Bias can only be selected for groups rather than individual pins.
-
-Required Properties:
-
-  - compatible: Must be "ti,da850-pupd"
-  - reg: Base address and length of the memory resource used by the pullup/down
-    controller hardware module.
-
-The controller node also acts as a container for pin group configuration nodes.
-The names of these groups are ignored.
-
-Pin Group Node Properties:
-
-- groups: An array of strings, each string containing the name of a pin group.
-          Valid names are "cp0".."cp31".
-
-The pin configuration parameters use the generic pinconf bindings defined in
-pinctrl-bindings.txt in this directory. The supported parameters are
-bias-disable, bias-pull-up, bias-pull-down.
-
-
-Example
--------
-
-In common dtsi file:
-
-	pinconf: pin-controller@22c00c {
-		compatible = "ti,da850-pupd";
-		reg = <0x22c00c 0x8>;
-	};
-
-In board-specific file:
-
-	&pinconf {
-		pinctrl-0 = <&pinconf_bias_groups>;
-		pinctrl-names = "default";
-
-		pinconf_bias_groups: bias-groups {
-			pull-up {
-				groups = "cp30", "cp31";
-				bias-pull-up;
-			};
-			pull-down {
-				groups = "cp29", "cp28";
-				bias-pull-down;
-			};
-			disable {
-				groups = "cp27", "cp26";
-				bias-disable;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
new file mode 100644
index 000000000000..1a8dca5aac20
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,da850-pupd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DA850/OMAP-L138/AM18x Pin Configuration
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  These SoCs have a separate controller for setting bias (internal pullup/down).
+  Bias can only be selected for groups rather than individual pins.
+  The controller node also acts as a container for pin group configuration nodes.
+  The names of these groups are ignored.
+
+properties:
+  compatible:
+    const: ti,da850-pupd
+
+  reg:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-names: true
+
+patternProperties:
+  "-groups$":
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^[a-zA-Z0-9_-]+$":
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+        properties:
+          groups:
+            $ref: /schemas/types.yaml#/definitions/string-array
+            description: An array of strings containing the name of a pin group.
+            items:
+              pattern: "^cp([0-9]|[1-2][0-9]|3[0-1])$"
+          bias-disable: true
+          bias-pull-up: true
+          bias-pull-down: true
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinconf: pin-controller@22c00c {
+        compatible = "ti,da850-pupd";
+        reg = <0x22c00c 0x8>;
+        pinctrl-0 = <&pinconf_bias_groups>;
+        pinctrl-names = "default";
+
+        pinconf_bias_groups: bias-groups {
+            pull-up {
+                groups = "cp30", "cp31";
+                bias-pull-up;
+            };
+            pull-down {
+                groups = "cp29", "cp28";
+                bias-pull-down;
+            };
+            disable {
+                groups = "cp27", "cp26";
+                bias-disable;
+            };
+        };
+    };
-- 
2.43.0

