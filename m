Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D3E38F252
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479320; cv=none; b=X+i8Iso93nCw2CuKHB/+9eeT2SJS0wVkta15B9iiXTaQSaCKxbmHssVWYxA7on4UimqMBXZNPfEyRWgTB2/VkSMWaJhGOeKtRK9Q+JW1W9inWEOzuyRoKx4TNu0MV7DmQwzpF8pGnRGTCifFW/6sABdxwAQz5cL0ZT1mW4dTfpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479320; c=relaxed/simple;
	bh=AQUJxL2L5GcgSqJ2CEzHjvO1+q9iYmuUod/pdFtmzrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mi3dhnGLCbRslub5k/1BE30qOV76DnpbYqEAD7fZud/5rka9QD6PKHnNn04uUHwAEylkcZSmLc5idd1XiDMf8Kj7e7bFZvLgJDliSEj1ROIz4uQd9gRolfK6Utpcovkr0yDi4wG0TB3u1pGGKfr0sfBuy6RcNdKSCFbQNbuCRnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvP7w454; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvP7w454"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so405602a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774479318; x=1775084118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wv2DcvHCHOF/E7EoFtW24rtKQvZLplUlYnPmwDgOOxY=;
        b=WvP7w454qmzeROu4nrEEY97NzJBNYBXyM7tp3Z08IVotNmHa1ljIBtkjy1CA+BdbG1
         uHZakHWHRAlpB3vBHPOdPEke3CrSyXRrPJT4/LXt6TkEbbhJlqNZx7AVjNLqdWzktSDy
         D/0Nk9TW7cn7ZbJZtIaz1js1V8GYi7etWVSXwiD/O47RpnMtDvFu4j4Uak2/IJ3i5f1x
         ro37DDyXoLM8l+zDIGabmL4SXXqyiyX5ATkoo94CrppxqY+i7JNhAba0FMKBss30xGNj
         1JQfJMSOM5yjnkJBBiv6dNDecNon79pzF1cOuOiRHkr6bAF6ZnPZ7ZshHL90iEhu0kZR
         hweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774479318; x=1775084118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wv2DcvHCHOF/E7EoFtW24rtKQvZLplUlYnPmwDgOOxY=;
        b=QY4jhsjIiMvWK6KsmhAaMLBpoqWNzID0+F72evW5Q5E/y2hYAZntaH987/gDW3whsD
         9mIOQvZQrRXfFrLl46C3orE0hYbJyCmzm6uFL1C/hnH+sIrWLaA+28TcDwf1pUqy/gE5
         DdHcMiN7AXWPhuJ5tTW2v38Jnuku42gyJTJQ/GiSPW4FcfWRP4qFmCFA1pxUJ9QOnOTI
         ZQbpRWrmhE1Uszee7uttS2tgyE7XWe4eX54xYM61h1JeJzJ1P6KRD9NOMiomjpzSXQdT
         U+gMoZJIWWN4r3p2aupwjX5HjBzxf71JvqRLwgR2QEhe/Tq2PiNMnnrpsq08Esog9mhu
         OMLg==
X-Gm-Message-State: AOJu0YyC/GmMGBQ40C2RYrOLdPw91XINj477tfWSdxQ6CV9f1gVWXtx3
	Z8lXQokdjsQCVner76QJjodTRuHPSFkKrh+Op/5bsFzHp3L45tmuKwquEaWpIQ==
X-Gm-Gg: ATEYQzy7/khLzLRiAZTrvwvZ30A0q6PpeqQXmjfT5jEWP9+DeB1AgA2Ix5KUG63VgeS
	X41k45TiRn54/BobFPjsYJPF0jTOzjUPfivc9doZRJ984XtAm9LDlE937M3QUIUmcl+206HHLr5
	Lt86LSa6rr/Vk9iZJMJm5lBrJtHAE0YSdrDF+sn2cb62/7FQnMG+JOWNxuwqNt8/MeeZ+4U12Ym
	cUwztQJaXdktjTQzNbis3Y8iZyFwzhb3tKl9yOBzA/6fsXH6qB89I8AeSG3N/AlfD3tFvlDO3bd
	cXT+T4nSJQ3/XMM6XefZuC8wk5UouQ2RMcWjhMYbTBKInL4zAAtq9RMXB9LwpqGXt1eDsWU2gDG
	yOHEnyReKQLtH7sr049azTRMOpZPBjGuxvYXOLKqvAc/INhu8hENMjdfSuWcwjOr3kuOWgJQ2Kb
	IVV6JT3pKijfbMG/5LC+AFnmxi
X-Received: by 2002:a17:90b:2887:b0:359:7c55:c166 with SMTP id 98e67ed59e1d1-35c0dc626f2mr4849598a91.7.1774479317835;
        Wed, 25 Mar 2026 15:55:17 -0700 (PDT)
Received: from arch ([2409:40c2:5018:3ab3:ebcf:9aee:dece:80da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1e1a64absm84066a91.2.2026.03.25.15.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:55:17 -0700 (PDT)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xuwei5@hisilicon.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	zhangfei.gao@linaro.org,
	linux-mmc@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	rougueprince47@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
Date: Thu, 26 Mar 2026 04:24:38 +0530
Message-ID: <20260325225439.68161-2-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325225439.68161-1-rougueprince47@gmail.com>
References: <20260325225439.68161-1-rougueprince47@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Hisilicon DesignWare Mobile Storage Host Controller
(dw-mshc) bindings from text format to DT schema.

As part of this conversion, the binding file is renamed from
k3-dw-mshc.txt to hisilicon,hi3660-dw-mshc.yaml to align with compatible
string naming conventions. Examples have been updated to pass schema
validation.

Note: synopsys-dw-mshc binding specifies clock names as "biu" followed
by "ciu". However, this Hisilicon binding reverses the order to 'ciu'
then 'biu' to match both the legacy text binding and in-kernel Hisilicon
DTS board files.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
Acked-by: Zhangfei Gao <zhangfei.gao@linaro.org>
---
Changes in v2:
    - Grouped compatible strings into an enum.
    - Replaced raw numbers with proper flags.
    - Fixed property order and removed invalid hex values.
    - Added explanation for clock order change in commit message.
    - Collected Acked-by tag.

 .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 117 ++++++++++++++++++
 .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 -----------
 2 files changed, 117 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt

diff --git a/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
new file mode 100644
index 000000000000..296bd776488e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/hisilicon,hi3660-dw-mshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon specific extensions to the Synopsys Designware Mobile Storage Host Controller
+
+maintainers:
+  - Zhangfei Gao <zhangfei.gao@linaro.org>
+
+description:
+  The Synopsys designware mobile storage host controller is used to interface
+  a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
+  differences between the core Synopsys dw mshc controller properties described
+  by synopsys-dw-mshc.txt and the properties used by the Hisilicon specific
+  extensions to the Synopsys Designware Mobile Storage Host Controller.
+
+allOf:
+  - $ref: /schemas/mmc/synopsys-dw-mshc-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - hisilicon,hi3660-dw-mshc
+          - hisilicon,hi4511-dw-mshc
+          - hisilicon,hi6220-dw-mshc
+      - items:
+          - const: hisilicon,hi3670-dw-mshc
+          - const: hisilicon,hi3660-dw-mshc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: card interface unit clock
+      - description: bus interface unit clock
+
+  clock-names:
+    items:
+      - const: ciu
+      - const: biu
+
+  hisilicon,peripheral-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of syscon used to control peripheral.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/hi3620-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmc@fcd03000 {
+        compatible = "hisilicon,hi4511-dw-mshc";
+        reg = <0xfcd03000 0x1000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&mmc_clock HI3620_SD_CIUCLK>, <&clock HI3620_DDRC_PER_CLK>;
+        clock-names = "ciu", "biu";
+        vmmc-supply = <&ldo12>;
+        fifo-depth = <0x100>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&sd_pmx_pins &sd_cfg_func1 &sd_cfg_func2>;
+        bus-width = <4>;
+        disable-wp;
+        cd-gpios = <&gpio10 3 GPIO_ACTIVE_HIGH>;
+        cap-mmc-highspeed;
+        cap-sd-highspeed;
+    };
+
+  - |
+    #include <dt-bindings/clock/hi6220-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      mmc@f723e000 {
+          compatible = "hisilicon,hi6220-dw-mshc";
+          reg = <0x0 0xf723e000 0x0 0x1000>;
+          interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+          clocks = <&clock_sys HI6220_MMC1_CIUCLK>,
+                   <&clock_sys HI6220_MMC1_CLK>;
+          clock-names = "ciu", "biu";
+          bus-width = <4>;
+          disable-wp;
+          cap-sd-highspeed;
+          sd-uhs-sdr12;
+          sd-uhs-sdr25;
+          card-detect-delay = <200>;
+          hisilicon,peripheral-syscon = <&ao_ctrl>;
+          cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+          pinctrl-names = "default", "idle";
+          pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
+          pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
+          vqmmc-supply = <&ldo7>;
+          vmmc-supply = <&ldo10>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
deleted file mode 100644
index 36c4bea675d5..000000000000
--- a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-* Hisilicon specific extensions to the Synopsys Designware Mobile
-  Storage Host Controller
-
-Read synopsys-dw-mshc.txt for more details
-
-The Synopsys designware mobile storage host controller is used to interface
-a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
-differences between the core Synopsys dw mshc controller properties described
-by synopsys-dw-mshc.txt and the properties used by the Hisilicon specific
-extensions to the Synopsys Designware Mobile Storage Host Controller.
-
-Required Properties:
-
-* compatible: should be one of the following.
-  - "hisilicon,hi3660-dw-mshc": for controllers with hi3660 specific extensions.
-  - "hisilicon,hi3670-dw-mshc", "hisilicon,hi3660-dw-mshc": for controllers
-     with hi3670 specific extensions.
-  - "hisilicon,hi4511-dw-mshc": for controllers with hi4511 specific extensions.
-  - "hisilicon,hi6220-dw-mshc": for controllers with hi6220 specific extensions.
-
-Optional Properties:
-- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
-
-Example:
-
-	/* for Hi3620 */
-
-	/* SoC portion */
-	dwmmc_0: dwmmc0@fcd03000 {
-		compatible = "hisilicon,hi4511-dw-mshc";
-		reg = <0xfcd03000 0x1000>;
-		interrupts = <0 16 4>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&mmc_clock HI3620_SD_CIUCLK>, <&clock HI3620_DDRC_PER_CLK>;
-		clock-names = "ciu", "biu";
-	};
-
-	/* Board portion */
-	dwmmc0@fcd03000 {
-		vmmc-supply = <&ldo12>;
-		fifo-depth = <0x100>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&sd_pmx_pins &sd_cfg_func1 &sd_cfg_func2>;
-		bus-width = <4>;
-		disable-wp;
-		cd-gpios = <&gpio10 3 0>;
-		cap-mmc-highspeed;
-		cap-sd-highspeed;
-	};
-
-	/* for Hi6220 */
-
-	dwmmc_1: dwmmc1@f723e000 {
-		compatible = "hisilicon,hi6220-dw-mshc";
-		bus-width = <0x4>;
-		disable-wp;
-		cap-sd-highspeed;
-		sd-uhs-sdr12;
-		sd-uhs-sdr25;
-		card-detect-delay = <200>;
-		hisilicon,peripheral-syscon = <&ao_ctrl>;
-		reg = <0x0 0xf723e000 0x0 0x1000>;
-		interrupts = <0x0 0x49 0x4>;
-		clocks = <&clock_sys HI6220_MMC1_CIUCLK>, <&clock_sys HI6220_MMC1_CLK>;
-		clock-names = "ciu", "biu";
-		cd-gpios = <&gpio1 0 1>;
-		pinctrl-names = "default", "idle";
-		pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
-		pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
-		vqmmc-supply = <&ldo7>;
-		vmmc-supply = <&ldo10>;
-	};
-- 
2.53.0

