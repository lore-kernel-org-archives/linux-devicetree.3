Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D559A3783B4
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785099325; cv=none; b=OXWUVRlGfG8LgxjbHrIY+Vwn+QGY7QU8HLRJ1FawhSeonhttnNKGKxFahcibgEcYHmLgPBbSj+tE1EGSdSH5EERe/pmfNyEjH3oAtKi15ELBETt1r4aQTJQq500qxup4Ov3ecAEHPFo4VSMePS+G52CeC82nWLCJEv3xZjYLcw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785099325; c=relaxed/simple;
	bh=KQlR53OyW6JZNFhAqSrmPUBDzkmU4+N5vwxETGNDUPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B+rDYsi3tkRKZDrBSmxUCufDLjKXLOQMIUBTBp1qmRQfWYt2H/jezwVb0IEMD5309K8abCigraQxr2PWXzsoX7G0acxh6QmF3YbSXRiIiEUZ8nEEqGWv2Fh2ZSJbnFemOfEpnswK85NDuP+dJCmMg8yztxbDY1oo5Qpe8VFKGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGxcr6jF; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGxcr6jF"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8487088510aso1668070b3a.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 13:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785099323; x=1785704123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EepzoYZxOFEggeeYOzqvu73HZybh7IAckzkS7tAN8e8=;
        b=mGxcr6jFIsJAJVffIDTJYQS2sIkjhsnBpceKBPRMXhBZD+ZVd9EsOoR4r8goJbhCan
         16mBuAykOAtS8EyiI17wrw1qrAwMoms8DqM5I6mxhYaMlOazbeDI8eVP7CCnHxkprpq1
         tXNUDHe1yMBf/ypoMocZC4i+nPoBoz0u/qnryqTCc6NbdiDiJxyuC013+QNrUeFOC+K2
         wjAcRbBC7bC/ie6ydQYkBagYdsn/i2NlUGdvIYISTJ+6L+ARBrSJvVy5oWePwd/7eTLL
         t7RcO3Rz7rfQ2V5G90UmbkpsZHEL9ceIRsZ/apb2egkla9NgUOZawdP+XxYQZOiMPlSk
         1rKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785099323; x=1785704123;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EepzoYZxOFEggeeYOzqvu73HZybh7IAckzkS7tAN8e8=;
        b=O1SXMdr68ElEQkcrvZ//f79IgUfKxpgkOVzUN1NOZbUr7wsNHjM+OPG82EaFhurGka
         +mtBrODcYvc5nND/THqBMxqQucN4eqazwn8s2OQ96DIZlA59+AKe7YPbTbbqws1zsW6S
         haPZEywQWXdZWuOvtxj2K93cc2GuR2Dt0sWF8kBiaQCtq/G1rJJk6xm7tnxyQAVlNQRk
         BBv5RETgZEyKFDihuD+epRarcOelt9Jyg2GA4vFMOCRcawPSeSmLlxjNctMKB6vfwU6e
         z5WArvGTUOznFhgmeFgRgVQPWtDhI9vCEA54MMsRIg5njlSc7CGKlEly7ZI4Zj+rQUr3
         qyGw==
X-Gm-Message-State: AOJu0YypfA+lY6KmNu7xrcZ4SSQzX2Ft54vv2hyycLDcqFzblWzvWGWp
	7XLPu78qktp4K6tEhGT1BtSJFw48zXrHrrhxMpWAaqC6b3HXdDjdD/C3KMs/ug==
X-Gm-Gg: AR+sD11qyJ6Wx9kXIybmVWgVLZgp2RuD/5YCotn++kotZPEk9KMB5cEVpP9LbgqoVJP
	JF+RJlrA+Qy+jiSgz+CnH9CGSWKWgtHpmlE78TyraPnp5AwJ0vjhRN08cdzct47xU/ZiQVcjbgG
	j+BjN7ax7jMMES/XYMpKEr74bNn4ZpciA2hpCfxCJUwT3WD9OWkpEXSbIblQ4FUiRiB0xi4wF8f
	v+RffdamaNKKHedIEwm7AEOK5MeROgU+sRkNd29xHflvJlBB7kPXmjIVHvPZ+5f0z+Ru4fimuNf
	hwmgpBApIIjR7gzyElkRHtwgMQs+iBpLJKrmnozHX0PqqZyfkOhOJyBBGXP2nqymYh+gLyBFwVu
	bHTJL/pxMZxlVGNSt4WKMKrOQpNVN05DNqTlvxouLS1jcvslC1WWULRAnjHiMg3/1ALXV2xmuo1
	84ES/Ls9dypJOqn/mLAIKRZ8Uboz7ktCQvnPptfWTBZ0mrH21BNMTLDo9Kcbf+KCGZPJbd1kDYk
	18TtDWT/heDWiIsF3h7tf7G7TueXUSBgZd0cB8Pb2B6Sv/aBi5ukhY=
X-Received: by 2002:a05:6a00:4510:b0:848:8445:695d with SMTP id d2e1a72fcca58-84e5946ab47mr4600403b3a.27.1785099323095;
        Sun, 26 Jul 2026 13:55:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2066436b3a.47.2026.07.26.13.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:55:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-mehrtens.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: bus: brcm,bus-axi: Convert binding to YAML
Date: Sun, 26 Jul 2026 13:55:14 -0700
Message-ID: <20260726205518.6698-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Broadcom AXI bus (bcma) binding from legacy .txt format
to dt-schema YAML format. This resolves dtbs_check schema validation
warnings for the brcm,bus-axi compatible string across all BCM47xx
and BCM53xx ARM SoC board DTBs.

The schema documents the AXI bus node with its required compatible
and reg properties, address/size/interrupt cell configurations, and
interrupt-map for assigning IRQ numbers on BCM47xx/BCM53xx platforms
where automatic detection is not available.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../devicetree/bindings/bus/brcm,bus-axi.txt  | 53 -------------
 .../devicetree/bindings/bus/brcm,bus-axi.yaml | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/brcm,bus-axi.txt
 create mode 100644 Documentation/devicetree/bindings/bus/brcm,bus-axi.yaml

diff --git a/Documentation/devicetree/bindings/bus/brcm,bus-axi.txt b/Documentation/devicetree/bindings/bus/brcm,bus-axi.txt
deleted file mode 100644
index edd44d802139..000000000000
--- a/Documentation/devicetree/bindings/bus/brcm,bus-axi.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Driver for ARM AXI Bus with Broadcom Plugins (bcma)
-
-Required properties:
-
-- compatible : brcm,bus-axi
-
-- reg : iomem address range of chipcommon core
-
-The cores on the AXI bus are automatically detected by bcma with the
-memory ranges they are using and they get registered afterwards.
-Automatic detection of the IRQ number is not working on
-BCM47xx/BCM53xx ARM SoCs. To assign IRQ numbers to the cores, provide
-them manually through device tree. Use an interrupt-map to specify the
-IRQ used by the devices on the bus. The first address is just an index,
-because we do not have any special register.
-
-The top-level axi bus may contain children representing attached cores
-(devices). This is needed since some hardware details can't be auto
-detected (e.g. IRQ numbers). Also some of the cores may be responsible
-for extra things, e.g. ChipCommon providing access to the GPIO chip.
-
-Example:
-
-	axi@18000000 {
-		compatible = "brcm,bus-axi";
-		reg = <0x18000000 0x1000>;
-		ranges = <0x00000000 0x18000000 0x00100000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0x000fffff 0xffff>;
-		interrupt-map =
-			/* Ethernet Controller 0 */
-			<0x00024000 0 &gic GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-
-			/* Ethernet Controller 1 */
-			<0x00025000 0 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
-
-			/* PCIe Controller 0 */
-			<0x00012000 0 &gic GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00012000 1 &gic GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00012000 2 &gic GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00012000 3 &gic GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00012000 4 &gic GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00012000 5 &gic GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
-
-		chipcommon {
-			reg = <0x00000000 0x1000>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/bus/brcm,bus-axi.yaml b/Documentation/devicetree/bindings/bus/brcm,bus-axi.yaml
new file mode 100644
index 000000000000..951aa139dd98
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/brcm,bus-axi.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/brcm,bus-axi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom AXI Bus with bcma driver
+
+maintainers:
+  - Hauke Mehrtens <hauke@hauke-mehrtens.de>
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: |
+  Driver for ARM AXI Bus with Broadcom Plugins (bcma).
+
+  The cores on the AXI bus are automatically detected by bcma with the
+  memory ranges they are using and they get registered afterwards.
+  Automatic detection of the IRQ number is not working on
+  BCM47xx/BCM53xx ARM SoCs. To assign IRQ numbers to the cores, provide
+  them manually through device tree. Use an interrupt-map to specify the
+  IRQ used by the devices on the bus. The first address is just an index,
+  because we do not have any special register.
+
+properties:
+  compatible:
+    const: brcm,bus-axi
+
+  reg:
+    description: IOMEM address range of chipcommon core.
+    maxItems: 1
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-map-mask: true
+  interrupt-map: true
+
+patternProperties:
+  "@[0-9a-f]+$":
+    type: object
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    axi@18000000 {
+        compatible = "brcm,bus-axi";
+        reg = <0x18000000 0x1000>;
+        ranges = <0x00000000 0x18000000 0x00100000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0x000fffff 0xffff>;
+        interrupt-map =
+            /* Ethernet Controller 0 */
+            <0x00024000 0 &gic GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+            /* Ethernet Controller 1 */
+            <0x00025000 0 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+
+        chipcommon {
+            reg = <0x00000000 0x1000>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
-- 
2.55.0

