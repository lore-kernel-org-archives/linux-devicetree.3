Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF1F35CB6D
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 17:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261006; cv=none; b=P7WZpwIz4RcEe7Xh3srO4R8OnH6a3ZZXfBC1JZ4+s+yvS3i+Mll5kvEkMFKQ5x/CX2NBXUzKj7fKw9gjCkIw4nYtsehvhLYunSUu0BUY355JE3Zyfh4zoAi9ZUbZJZt/nfJbgqf4L6v9RPy05DF/qW5Ts/LAlwILjL//NeSYVvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261006; c=relaxed/simple;
	bh=/N9shEYpuzBmz3d2S1zCxWvYnr9A/2N8v8wLaRysY8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcX5JpxMiZtdJTfVz+NoN9crgMngrWOUzcXhwkE6DtaInU5zv78O1o+nG93Wh9n+3CetnvDypLqhhZ20+XVCcznBEZgDJb1lX/TvBvR34lPFPyTyg7T8fnw1oXYqaDSFTjSYtloUMkze+lQ3tLAlpFW5C8kesgWjpvSgIrQ8Buc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBIfmC3N; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBIfmC3N"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ba0714574fso13799915ad.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778261005; x=1778865805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFMAJRct5+Ew9bo4NrSDVyJ5C+wmVXcn6c9x8tk7NTk=;
        b=hBIfmC3N3GqMnKrKapnFDD3xP71jfHJCzcmz/6uz0fFwzDQOffeNRl6oBdAhjkN+Pm
         swezXw9XXsu6y8urYHK9oOtMag71+0nsgevLECp+L67TEBO8sp+XXdAR70756mzXWn+p
         PPa/kfzJN2u5MLU7sqgCTubLUENhFNfWy3S4e4zSxtc3roDAJno7QNvMsO9JtCpJcPmY
         r6ywjOAHwM2dAYu3qIv66BeYdNVIHuKvTJCDIpMMpJYuZxOnWzhWNx/NVNMyNwd4RWmP
         N3pnCB6o+Nh2MX76FkVbEfM+nQHu+YHY67okx2aj9gCxSs79A76dLBYeOG1V2J+6WOwI
         C/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261005; x=1778865805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uFMAJRct5+Ew9bo4NrSDVyJ5C+wmVXcn6c9x8tk7NTk=;
        b=goKjMswyvCG1RCnwDjJwve4oLcRq8otF9CtxbqfOa2EmI4QtjcALc1AKDQAs427sek
         Nqsks9ZTIG72jlZEB4THNWMKzLvskn19mOZ0R3qiIWgbkD7pCnYbSc6cc8LfFzRQ5Jxb
         sKhmP0NqQ1qsOp3JvDEaN9cNivYwtMW83ADBl/ZUrAnX5Kkdri/zWX0awPA9n1QvUeYh
         LGr4RlAdXjlzMsDXA3A+lrfKfNITUY3tAwQqtZQ+Ig/wMgwfGPr/emDP8/rt6ftiq0BW
         +QS+r7IrvfDorY0dKBmW+37aljo0veOaUOk0GU6TqK9XZYSxt0Vvaws03fNJysS9JOqC
         wOvw==
X-Forwarded-Encrypted: i=1; AFNElJ9F748alI2jqYHAPq2E01Y4DX4+cY6qjgBjHWwIMVbjNgdijfU8ktj9+lrPRyd17Qx3PzmWBFzlGLqa@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJ6HEOQPZw1D+dHChtXiVXbQhV2Gy7rKODCnVDyDPIjLDNQnY
	26feJKNFUUMdEmV0N4xC7rY4lLDzZ7HlTORszKXHjO715AXmbBgzLF4p
X-Gm-Gg: Acq92OE1c8ME+KKDJxpchZ3h8sIHR0eDLieb5malggt1KVyofv53k7uVPS9dpOU2c1B
	8wcZRmSu/Nu1ngGpLp69kZnJu4klOy46KeTG4dQ6cVBwpydhKJvNt2VsktNtrGh2mjVn7CcfD4g
	UGmMQlT+GVAcfF/FhyAn92ACaeKquidD8iTyfTcgbE1r68nyRBio216843wD2CMMcb9TyLNtdF7
	h0qOUUxwUZlkQGURgFvMZDGq6M/YgXY7QWkQGJ6xGUh8ibn3op+iARvgmPBXezm7pfFroM9MDSB
	Ij6Brq0zplKiHdVqGTyik+oP8XMgjMNcMyQye1ZEk5F4cUefiZICLrho2OyaOBNu2QS4Wjs1iGp
	cAXHnsYiIacYhCew4hax5i+O3XTArpm/yEZAThIqIOfTgeQRNBhxYUHehlSUW60/k4HQ+vi/LR2
	4ZGZS84h52HUKDwEY/zcaP0oHcTe/XyHUqf9hb/I4qFBt/
X-Received: by 2002:a17:903:1ab0:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2ba798c0a22mr119825725ad.24.1778261004803;
        Fri, 08 May 2026 10:23:24 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2baf1e35487sm24907985ad.46.2026.05.08.10.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:23:24 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 08 May 2026 17:23:07 +0000
Subject: [PATCH v3 2/2] dt-bindings: mmc: st,sdhci: convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-st-mmc-v3-2-81c329ed28e8@gmail.com>
References: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
In-Reply-To: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Convert STMicroelectronics sdhci-st MMC/SD controller binding to DT schema.
Changes during conversion:
- In the legacy text binding, 'icn' was optional. Keep the clock list
  flexible to preserve compatibility, although all existing in-tree DTS
  files already provide both clocks.
- Document the optional "top-mmc-delay" register region and corresponding
  reg-name in the YAML binding, as existing in-tree DTS files already use
  both "mmc" and "top-mmc-delay" entries.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          |  91 +++++++++++++++++
 2 files changed, 91 insertions(+), 110 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-st.txt b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
deleted file mode 100644
index ccf82b4ee838..000000000000
--- a/Documentation/devicetree/bindings/mmc/sdhci-st.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-* STMicroelectronics sdhci-st MMC/SD controller
-
-This file documents the differences between the core properties in
-Documentation/devicetree/bindings/mmc/mmc.txt and the properties
-used by the sdhci-st driver.
-
-Required properties:
-- compatible:		Must be "st,sdhci" and it can be compatible to "st,sdhci-stih407"
-			to set the internal glue logic used for configuring the MMC
-			subsystem (mmcss) inside the FlashSS (available in STiH407 SoC
-			family).
-
-- clock-names:		Should be "mmc" and "icn".  (NB: The latter is not compulsory)
-			See: Documentation/devicetree/bindings/resource-names.txt
-- clocks:		Phandle to the clock.
-			See: Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-- interrupts:		One mmc interrupt should be described here.
-- interrupt-names:	Should be "mmcirq".
-
-- pinctrl-names:	A pinctrl state names "default" must be defined.
-- pinctrl-0:		Phandle referencing pin configuration of the sd/emmc controller.
-			See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-- reg:			This must provide the host controller base address and it can also
-			contain the FlashSS Top register for TX/RX delay used by the driver
-			to configure DLL inside the flashSS, if so reg-names must also be
-			specified.
-
-Optional properties:
-- reg-names:		Should be "mmc" and "top-mmc-delay". "top-mmc-delay" is optional
-			for eMMC on stih407 family silicon to configure DLL inside FlashSS.
-
-- non-removable:	Non-removable slot. Also used for configuring mmcss in STiH407 SoC
-			family.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- bus-width:		Number of data lines.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- max-frequency:	Can be 200MHz, 100MHz or 50MHz (default) and used for
-			configuring the CCONFIG3 in the mmcss.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- resets:		Phandle and reset specifier pair to softreset line of HC IP.
-			See: Documentation/devicetree/bindings/reset/reset.txt
-
-- vqmmc-supply:		Phandle to the regulator dt node, mentioned as the vcc/vdd
-			supply in eMMC/SD specs.
-
-- sd-uhs-sdr50:	To enable the SDR50 in the mmcss.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- sd-uhs-sdr104:	To enable the SDR104 in the mmcss.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-- sd-uhs-ddr50:		To enable the DDR50 in the mmcss.
-			See:  Documentation/devicetree/bindings/mmc/mmc.txt.
-
-Example:
-
-/* Example stih416e eMMC configuration */
-
-mmc0: sdhci@fe81e000 {
-	compatible	= "st,sdhci";
-	reg		= <0xfe81e000 0x1000>;
-	interrupts	= <GIC_SPI 127 IRQ_TYPE_NONE>;
-	interrupt-names	= "mmcirq";
-	pinctrl-names	= "default";
-	pinctrl-0	= <&pinctrl_mmc0>;
-	clock-names	= "mmc";
-	clocks		= <&clk_s_a1_ls 1>;
-	bus-width	= <8>
-
-/* Example SD stih407 family configuration */
-
-mmc1: sdhci@9080000 {
-	compatible	= "st,sdhci-stih407", "st,sdhci";
-	reg		= <0x09080000 0x7ff>;
-	reg-names	= "mmc";
-	interrupts	= <GIC_SPI 90 IRQ_TYPE_NONE>;
-	interrupt-names	= "mmcirq";
-	pinctrl-names	= "default";
-	pinctrl-0	= <&pinctrl_sd1>;
-	clock-names	= "mmc";
-	clocks		= <&clk_s_c0_flexgen CLK_MMC_1>;
-	resets		= <&softreset STIH407_MMC1_SOFTRESET>;
-	bus-width	= <4>;
-};
-
-/* Example eMMC stih407 family configuration */
-
-mmc0: sdhci@9060000 {
-	compatible	= "st,sdhci-stih407", "st,sdhci";
-	reg		= <0x09060000 0x7ff>, <0x9061008 0x20>;
-	reg-names	= "mmc", "top-mmc-delay";
-	interrupts	= <GIC_SPI 92 IRQ_TYPE_NONE>;
-	interrupt-names	= "mmcirq";
-	pinctrl-names	= "default";
-	pinctrl-0	= <&pinctrl_mmc0>;
-	clock-names	= "mmc";
-	clocks		= <&clk_s_c0_flexgen CLK_MMC_0>;
-	vqmmc-supply	= <&vmmc_reg>;
-	max-frequency	= <200000000>;
-	bus-width	= <8>;
-	non-removable;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	sd-uhs-ddr50;
-};
diff --git a/Documentation/devicetree/bindings/mmc/st,sdhci.yaml b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
new file mode 100644
index 000000000000..10e0e1ee6d5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics SDHCI-ST MMC/SD Controller
+
+description:
+  The STMicroelectronics SDHCI-ST MMC/SD host controller, which is
+  compliant with the SD Host Controller Interface (SDHCI) specification and
+  is used to interface with MMC, SD and SDIO cards. The ST SDHCI controller
+  extends the standard SDHCI capabilities with platform-specific
+  configurations such as additional register regions,clock inputs, and delay
+  control mechanisms required for signal timing adjustments which are
+  necessary to support high-speed modes and ensure reliable data transfer
+  across different ST SoCs.
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: st,sdhci
+      - items:
+          - const: st,sdhci-stih407
+          - const: st,sdhci
+
+  reg:
+    minItems: 1
+    items:
+      - description: MMC controller registers
+      - description: MMC delay/auxiliary registers
+
+  reg-names:
+    items:
+      - const: mmc
+      - const: top-mmc-delay
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Clock for the MMC controller
+      - description: Interconnect (ICN) clock
+
+  clock-names:
+    items:
+      - const: mmc
+      - const: icn
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: mmcirq
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stih407-clks.h>
+    mmc@9060000 {
+        compatible = "st,sdhci-stih407", "st,sdhci";
+        reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
+        reg-names = "mmc", "top-mmc-delay";
+        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "mmcirq";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_mmc0>;
+        clock-names = "mmc", "icn";
+        clocks = <&clk_s_c0_flexgen CLK_MMC_0>,
+                 <&clk_s_c0_flexgen CLK_RX_ICN_HVA>;
+        bus-width = <8>;
+    };
+...

-- 
2.54.0

