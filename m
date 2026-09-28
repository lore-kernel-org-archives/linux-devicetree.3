Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4C64A13B9
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594358; cv=none; b=S2XWJmoMXh6oiBS4p+UkQKGME8P4rYh4Z9HZzml8ulapvwFN812tM1CvcxWXFzshWdZC5SNq17UjT+9asw2fksPnRWGfbr9mmblpRkz2MMa1EV0v2O2K5kK1wZV9zcEhQTUNB2OWFNQFZZLiNuArmvPPjX6MuMbU3OU571f4kpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594358; c=relaxed/simple;
	bh=FAC2S2BY98BVv7gueQcHZnYUQ/AZfH3LCfnoGMI1YY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bwdlQ/j6uKedTZDvc/ndqBlfjYN8Kii4outqpFQOhyLDceSROIeNHG70X5Ki/32Zhta3l7FZ5YiTbMRdtghGxupnffTHbucGjaGJbI00xh02O0iAsDRQaOC7HyRcxGaUGRBVyPzL1fAU3wCZc2D6+i4pOVuMOKwseq4U+kXZJLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDOmDtd6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDOmDtd6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so27915765e9.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790594355; x=1791199155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+Oi9Zm5MO73aOHmV62OPpimFIugGeyR1K/lg/prrUs=;
        b=NDOmDtd6UNdWj81OAx0NJuN/cl58zPJcT4EU9N86Y3uFyGbh5GaDG2aBp+FRv1LiHB
         ZHFx7Iaw0dNU6AGJumRw42fFQ3dj5Y50ax7cQ/Mt2lwQEAmtamR8TERa3COJ+3KFkxBN
         vcEYFjy/oXa1jLRVEMtJn9WARArpW5B6aieSidYCKzO9IumBiaeLxVgrgQns2AOgJIWJ
         vZrC4Z33FtZRlCXazfm4aZivsY2SMGrNz6cKcftUL9+0wmQtcE4etZzYBs81rkG9yfwL
         V7Gy4ASiTQoYfavuBzmRXAM/Wy7ceP5naQ5Cnu86NcTCWonVFu7tAszGV3NMDRbLipR8
         vBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594355; x=1791199155;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+Oi9Zm5MO73aOHmV62OPpimFIugGeyR1K/lg/prrUs=;
        b=jgNsS0SIwQJzJeX2Cr6T5gOGWrVEbPM2WSy66gyfiaFJIiAZ14ZDNgnNzGaQ50X4gh
         Uust4gIN0OJ8Q0ciZPuOeG9Lq3Em3PpwsMwxolhHXLaQnr7P8fSdiAk7G6Sq9gpg9g8f
         rijhJSsxlVCKrwryeHyeHfVeVhQdNY2ldZuoIEIC3TN27QSL1HhKA/7GCqENiDpls9l0
         mZSFs+AWQiHoSJKJmBsd6sojGX1kWyOJko93Bq9haujr4/gw9JBAV7vaZ3KUrTUMXlVk
         PAdsDWUth/DLKuSD/1LY53DrN8pdECTkPpP4oVaJ+KrlT+jewvLzjCe9yGYFTPHHH5It
         8vSg==
X-Forwarded-Encrypted: i=1; AKwUvBwHqk4rBj9PHYN9QXrdcA0CQrT0wW4nCfjRh+BTNOouXVMWVi8/JLNet/WLaU2zBEv2U0gWJShkmzB0@vger.kernel.org
X-Gm-Message-State: AFuF++ndn+MZ3W8s4gfz5Dslulx2NuUiKzoePYXG8NkH8RpL7PyNJgDz
	yfH1PlVuuQ+2tjnsn3Vs41a9YKScnrd7+mkrrSG0JPISoEwMuURfGuC2
X-Gm-Gg: AYBFou2EV9prNZ9p6bhjs24fAUXyShO+vwIubPjtVEgPtRondUFNcgq4TYGA3eW3rNs
	qBhucWkOhEhuFDZyhMfxEc4wljUSWkyE8bTlfVEZ2v1MMTNQxyyxmZRaYwfKwoFeEJL0rCRxD2p
	GstTYYC4056C8NsdfR/EcIw7tlLBOCDo0k7Pf5dwgnMW9Z6FDBEbeBCbj6DaSl1uDAnXXft8laV
	vuZp/7AtaBpA/TV0jnTaCYrbYBr/eFt4iKoEvXsachBP7sxZlQTpqrUh9+b/1B8BlYAn67fIdwl
	oqWVVTnarL0KAbL1AJHa+nmOo3yw0ysTMpMrSj5utW0+Vqh3bdsWM3Ee419BTYXdpRUs1sgdXRG
	M7uw4/O0yX7rzQjgG4rwMyvaVcDl5T+uGOAFb3V5C/G7uaevrj/ZBMhMR685QzMfSArzTtJP5Ij
	6m8yztrzTuf3HkLRjdPLqhpVBQEc+HicTStghuIrZXT2aoHe3luE/niVtHmmKn1c0g8W+dmwYsS
	uo29TWgEj2e2JUSwVGloZ4aust/ua1OUEvvHqEaC1TvhEtqtIYJZkrOr0ljp1IwwDBTG9O0qVYY
	FEMiiXP3qpVXjv139S+Klr/iIs+XK6wq8wChixj1
X-Received: by 2002:a05:600c:3111:b0:49f:fdca:c34d with SMTP id 5b1f17b1804b1-49ffdcac53bmr98263335e9.8.1790594354962;
        Mon, 28 Sep 2026 04:19:14 -0700 (PDT)
Received: from localhost.localdomain (37-188-186-98.red.o2.cz. [37.188.186.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm26164969f8f.9.2026.09.28.04.19.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 04:19:14 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Rong Zhang <i@rong.moe>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: leds: Add CZ.NIC Turris 1.x LED controller
Date: Mon, 28 Sep 2026 13:19:06 +0200
Message-ID: <20260928111907.72592-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928111907.72592-1-pepe.schlehofer@gmail.com>
References: <20260928111907.72592-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

Add a binding for the LED controller on the front panel of the CZ.NIC
Turris 1.x routers. The LEDs are controlled by the firmware of the
CZ.NIC CPLD, which is memory mapped on the local bus.

The turris1x.dts device tree, which is part of the mainline kernel since
v6.0, already references this compatible string.

Signed-off-by: Pali Rohár <pali@kernel.org>
Cc: Marek Behún <kabel@kernel.org>
Co-developed-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---

Notes:
    Changes in v3, by Josef Schlehofer:
    - drop the file name and "binding" from the subject
    - describe the hardware rather than the driver
    - fix example indentation and use the merged turris1x.dts node
    - set Josef Schlehofer as the binding maintainer
    - constrain color to LED_COLOR_ID_RGB
    - list the required controller and LED properties
    - describe the register range and the LED order in the reg properties,
      and put the SPDX expression in parentheses
    - pass dt_binding_check with dtschema 2026.9
    
    checkpatch asks whether MAINTAINERS needs updating for the new file.
    The MAINTAINERS entry that covers it is added in 2/2, together with
    the driver.

 .../bindings/leds/cznic,turris1x-leds.yaml    | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
new file mode 100644
index 000000000000..ad7ef7015f0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/cznic,turris1x-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CZ.NIC Turris 1.x LED controller
+
+maintainers:
+  - Josef Schlehofer <pepe.schlehofer@gmail.com>
+
+description:
+  The front panel of the CZ.NIC Turris 1.x routers carries eight RGB LEDs
+  driven by the CPLD firmware running on a Lattice FPGA. The five LAN LEDs
+  share one set of colour registers, so they cannot be given different
+  colours or brightness from each other. The CPLD firmware is open source
+  and available at
+  https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
+
+properties:
+  compatible:
+    const: cznic,turris1x-leds
+
+  reg:
+    description:
+      CPLD address range of the LED registers. It starts at the first colour
+      register, offset 0x13 in the CPLD, and ends at 0x2f; the offsets of
+      the registers inside the range are fixed by the CPLD firmware.
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-7]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      color:
+        const: 9  # LED_COLOR_ID_RGB
+
+      reg:
+        description:
+          Index of the LED, which is also its bit in the CPLD LED control
+          registers. 0 is WAN, 1 to 5 are LAN 5 to LAN 1, 6 is WiFi and 7 is
+          power. The CPLD source calls LEDs 1 to 5 lan1 to lan5 and the WiFi
+          LED status.
+        minimum: 0
+        maximum: 7
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    led-controller@13 {
+        compatible = "cznic,turris1x-leds";
+        reg = <0x13 0x1d>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        multi-led@0 {
+            reg = <0x0>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_WAN;
+        };
+
+        multi-led@1 {
+            reg = <0x1>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <5>;
+        };
+
+        multi-led@2 {
+            reg = <0x2>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <4>;
+        };
+
+        multi-led@3 {
+            reg = <0x3>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <3>;
+        };
+
+        multi-led@4 {
+            reg = <0x4>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <2>;
+        };
+
+        multi-led@5 {
+            reg = <0x5>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <1>;
+        };
+
+        multi-led@6 {
+            reg = <0x6>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_WLAN;
+        };
+
+        multi-led@7 {
+            reg = <0x7>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_POWER;
+        };
+    };
+
+...
-- 
2.54.0 (Apple Git-157)

