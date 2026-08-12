Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195A34252A8
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530994; cv=none; b=iWKYEMrnrXAApfC+RHB4WKaqcvyQAg4RQhTMkADCjxmSVCh9CRuYqakuCbqKKHom1lR6tIa6EGVYvUT+PaHyNhf1+BcpdqHpnd58U2AmBwUz5avjhUc3G+bJh1oM3ZJa+ic7xrVBRcNFSFoRz3NjUUQoAfmYEZD/iq86pjMTDys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530994; c=relaxed/simple;
	bh=sClagvUmiT6O7bZETDOYfatHR0ft7cNK5RMWLl0HUkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HkrlQCLC7QOvgTRhJ74FtDmG7Kv6rOeOctsjWUFK257axHSaDnJ47TAIf3Lwa2MQK53Je6VfNNheHuvnbN/elHF4arjyG1lzmngwnbEU8pV3POMqfpZlT4DDW3oTteAY4ImWnaqiE3RByIZfomT31LFXdHDZR/Qb0i9WIyEyR3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANQLT/MO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANQLT/MO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so4057245e9.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786530990; x=1787135790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzmJJY1tPn+fmrketi6Y7iKwO+sxC2jcdTbCz1Vr//0=;
        b=ANQLT/MOCYWpNgnMRaHiZSq8jwJFnNDNuPHnokm8r/NHfVaRQabzaMwB9XRBlW+5bW
         D6mGEEj7y9Z/nlW9qKbDq63LtH/PYeRBYsUcsDwxI0EXXEE/kz7u22SqzGvyEw9sMG5R
         5Bqe6DWnxoNd+3K9hau35kOHscTgo2Pp8PY14D51h46nGW+pQBezRPBBXDgzA7r6DxMB
         ES1YDpSb+QxsvAHtlfkn1bjWEY+mzGRFkmi38nknHBxG2HssC3ygiDT77+/z8SQ1SXTj
         bj5JHQsOegHyPKNEUMkppwzWtjvkwtSZ3QtkyhwTNpaf4nf/Qx+uYAQ3EM/ZOfyqzffK
         fyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530990; x=1787135790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzmJJY1tPn+fmrketi6Y7iKwO+sxC2jcdTbCz1Vr//0=;
        b=YmxYN/RZs2KTV1Jx69ooCKZOUu8oW/VDWXq5/6R+gRDHoHApYZjMTpHi0p0rQhL6nL
         uEwBjl9JX/KhFacSVmUXEQD7ZuC6CAuvGbor4hUReghjF3W6noqy9x7ePj52CCqQxBpi
         mfpypUlx7m+FXjf9PPjUZBh2YcN9iVG1sLJ+PbbSJjS5VjZQ8j1YcwtQdhtQ4powHE0e
         RohlY2W0cGgvL7HsWRt9Ip2ThDFLZ2Vc3YaBGFAnFOIyMxDIu5j8uQYxNjmrcJvCHUqn
         VwwItd49ISBiBKtsF2dGgaQ4QgHgBGAsQ8YqvB7tvQCj5F8RVQBVlgKhteFOpq4FBZPx
         Lpmw==
X-Forwarded-Encrypted: i=1; AHgh+RpmJBhmPQZxRZ0pI8fscuYL1CS9KtdWROKL+P4bMqIGzMUTo8sXUzZGTAQ6tLhQf2L2lFY4kIFCPBMH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3sWpjTa2Xtxbz5LPNrtK09BNUqVqp0aqYC+dDnMx9lypYchW/
	LCaIM2MQ51lvsduBvM/OOU9VyKL+LESF/Ykcz8mBl6Hws5xN4TV1p9/2UZ8m9Q0GCBj9iQ==
X-Gm-Gg: AR+sD13DhuLQirjIqLz6m28APBJemTjOoT0DgrfFEJW4nl17qkfzLSASEd7Fz1chf8P
	fO5euorZM9hTPPyyGFkRUvJRhOwOzR08Khvmsply+g3szaiYZSeL1ZeNH21a7FuFviCgexJDFGR
	l48LCYnW/UjBI875fB2z+lbf1IPILCeSjNHfDZXoZ2Xy2d80FB3dY74AhWvn10LjUj6kfL7eizW
	JKb5GIFK3hlLvtP1uwp/MPkR58ShI3uur3MXRdDLrrieSD6/g3GCHCS3CWiJJBNMIy5jleCkxsH
	M+0b9lu+F729GHwhqCCbzXNlTc4akfpOQfrF14CClGExReX23i+jtPDPKsTML13pQ1tgJrL0Qvu
	dTN30md7iRT1fC8levKJRH0949mdyi9jAGx9eVvpdNiEX27AgHPSaxSMm7lDddumAsJrll3WIUc
	KOWTu7MBaoaPPfbDLPE0aq+KJWGiNT5JZVvyRPrCLNbx+P24MMJnhDaT7f1IEJSitVxlpvECBSZ
	g7M1glm7Xl3JsA53pR4j1OtaRH2Yn0=
X-Received: by 2002:a05:600c:2e11:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4997c0e2ba9mr30935055e9.6.1786530990191;
        Wed, 12 Aug 2026 03:36:30 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997b15b807sm100146855e9.7.2026.08.12.03.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:36:29 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: pinctrl: Convert TI DA850 pupd to DT schema
Date: Wed, 12 Aug 2026 10:36:21 +0000
Message-ID: <20260812103621.1096140-1-egbostina@gmail.com>
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
Changes in v3:
- Restricted the pin group node names to 'disable', 'pull-up' and
  'pull-down'.
- Switched the pin group nodes to 'additionalProperties: false' since
  all of the valid properties are listed.

Changes in v2:
- Excluded the 'phandle' property from the pin group node pattern so
  it is no longer validated as a pin configuration node. This fixes
  the 'make dt_binding_check' failure.

Link to v2: https://lore.kernel.org/all/20260811111023.721262-1-egbostina@gmail.com/
Link to v1: https://lore.kernel.org/all/20260811092057.687155-1-egbostina@gmail.com/

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
index 000000000000..21d439e08d4b
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
+      "^(disable|pull-(up|down))$":
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
+        additionalProperties: false
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

