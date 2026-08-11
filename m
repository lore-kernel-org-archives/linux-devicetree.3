Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5942B31E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786446639; cv=none; b=iwEzXmXaE2hHRQxt0gVgp9ivzPECXRPxLxSUNuy5sNt8bOVijkQuQFqeshLB/p/j17bVaMZWOUm1OCGAd9fD005GTUF7QUucSvixn96xgCaWNL4XfPYpBIQdFcxVymVamn3udj1gju+9erfokCgoNf93E8Yf7c6gPbvjIWfJNrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786446639; c=relaxed/simple;
	bh=6rZ3mfhDGKX05Rlz+nZ6HYVUNrw2v8ggiqfc7/1++Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ikCF3uajhJvTeHfJGvI7I5XafMNkJQq/OmDTBC0VOWat6T9wIfUTT71whnxELkMgFCsIqfmo51E5sRcElg3ggPRMU08+cf8UyJKKnauEsDyotUyZrbxWLMx/mPr9GGLANfyyy3ke1NPLcu0F/oXshcx0jl8zK5gJYKxpGLvfxZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWGU7CJ8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWGU7CJ8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49954b88fffso31909595e9.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 04:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786446634; x=1787051434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5Gfsr1BRyTWUvkjYrx91YwKhmyq/zfL5zpExYSPVmQ=;
        b=JWGU7CJ84E7XzQDymrjSP8KFAN2o2RL9uqx5us0J0DcFrVmAZ4ePzWGn+FYj+a7caE
         8GLqItgRI1zqmR4KrED/0c+Bmp/nv2bLjaTVm0d0QNr4MViYnTZN8bDhpCedwz0gIN7R
         JYzbqLvzrtDXEfLWZhhubIIvrYA/TE7sLwb9oUoiy/rBKUL93A4WTmYj9nlJkturRN/M
         tsUGIksbiZLjGZcN6ms+wrfoRVEPKbXNgXDeXtU3tZ1QtENLUVbG5/3Qjq8prHhJ9bsX
         izG2r9KiDV36Ng7EtJmkjRJnPK4eap4SElI0K/BrlCrZScbdRWW8eEkA3B34qDEaSkCr
         /2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786446634; x=1787051434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5Gfsr1BRyTWUvkjYrx91YwKhmyq/zfL5zpExYSPVmQ=;
        b=fbe2v626t9M7H5xGSQT8EY/Qc9/FdBuLi3DneO2DdEVH092KHMYP/xhVq8oPzFT5kk
         8Z1zxIddssrf3YLLn5DmRgpft4l4FxHTiD6q7H5rKsnjT97wesnEHJEjKgKBn87tnpbL
         Jom4q6U8rNjTW+ScKUeiv6NVusuCdtUMJp8LHHpUfNU3NekO3usLqKC1OYFxXtWaSbkC
         yz/Y3BqxP4Atu3dhEvVIxL20bQDUgCKkDiROkF4/Bl2gQhZWTHaaMg0/wT12iIdk8iqL
         q4TFhypdxcxC7aZUVLo1qvQxoHBuQAt/M9HRbv91GLA9Ob0ZsLy8pCdscGcLbqzzuLb9
         7Jsw==
X-Forwarded-Encrypted: i=1; AHgh+RrjS8na3wBLUEUqAVWuEJaaEi4OVthsHDZx3ITeZIfKjVUTANF0HQLzlLqN9gEDfB1BoLBYjV1zRC/I@vger.kernel.org
X-Gm-Message-State: AOJu0YynFazzGYY++RttiU8G4VhfK2kNBcEBjXKXhL3It3KLO7CuOZaT
	K3WP0rRe0ca4E3gcAGEFWk/Le12dKa+g3rgh5rsZNmjMOP2mtWHccUkQ
X-Gm-Gg: AR+sD13DlU6Au9URZET4Dl4u65zw0mLp0ig7H0PQ8XftfSmHokuC99sKc6PwBg0jXIa
	TNcoD/YEAbwhDvXRno3Hm62gBevPGMjf91X3rytFx9jc0sHQerAA/zq7VCsJvAQlynyLWuPdD4v
	CI1oxNr7sL+nfpvkNI9v+AOCagzoQTrDqhfIuLePqMjKXApIn2RiT7F50T7TReXf203fmx9PwXC
	ZOb3oAhOIxBnPAgw9MYraOIPLfnhAN1RQb0QqOdBqvcgXWcFGkFjN42KGytLad2QvNUOPOiaUja
	Z569LcGsDkdhE10AaxCy2yloYtGQyC/X4B/LetwWpXsfjoB5udN371Shnz07Wf+omxRazPLKjlA
	oZr83+ySpUEHjvTu6vdIpeFlTAKTM7bHV7JVYIEk1UkwrvDQ91AJKBc74H9AEn208ntmNBYxVdw
	F+bzvij//iEykNp1TsGBsDSxfiwZlhlyP0etWJbQm311YjAZ/xEdUfvtqg7gBig5sffC3Wmbw/p
	H6pKiAJMOml0UHIqfGurB1LscrhtC3N51UMrV3r
X-Received: by 2002:a05:600c:6085:b0:499:728c:4704 with SMTP id 5b1f17b1804b1-499784649b5mr38456575e9.12.1786446633700;
        Tue, 11 Aug 2026 04:10:33 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4814a7095a0sm3570044f8f.17.2026.08.11.04.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 04:10:33 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: pinctrl: Convert TI DA850 pupd to DT schema
Date: Tue, 11 Aug 2026 11:10:23 +0000
Message-ID: <20260811111023.721262-1-egbostina@gmail.com>
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
Changes in v2:
- Excluded the 'phandle' property from the pin group node pattern so
  it is no longer validated as a pin configuration node. This fixes
  the 'make dt_binding_check' failure.

Link to v1:
https://lore.kernel.org/all/20260811092057.687155-1-egbostina@gmail.com/

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
index 000000000000..059da050e611
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
+      "^(?!phandle$)[a-zA-Z0-9_-]+$":
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

