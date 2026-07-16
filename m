Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3D43C989B
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237771; cv=none; b=BXl6phQW8bivZ8zOLuTHQi9AKbJJc99Mt2TA6934QcdtFuglDOql+e2biTmrzqz2vhw2NWcKqheZ0piJv7h8AW3X7KM2bvzlg0TRqS34H4H6dK4YO9UZv7EqIP/hFf58hWF+DjQMP6BzGbTTG+UhAPFoojhlS/zHacz7852xdec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237771; c=relaxed/simple;
	bh=gYcmT5SJ16KzbPHs7e4lJ3zArzZ0tzAmOzulOMxIRpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlnKCRl04nEJIWdFY4H6tz0/iM9zpAr4j8X9iu7dTgQkwY1z2IoWe7BaKPICOxgJOgpp4OphGUHzcFXuskPkzntTUnHkFuemYP+prxuLJK4dOdapipVRudEsWmm1L6O94Vp+xU0F3iigElag8zXTfuplAJwCu7s7MT6Lbz7HzJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3yTOW8y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3yTOW8y"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47df6a5202bso4750341f8f.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237767; x=1784842567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DP6p2yHa/CcMRK7GLBZhA5Xgmib1P3Zs9Lq82vtGTA=;
        b=n3yTOW8yEy2W40F4wM1O+6IWQG1V7ivLM5moZv9/hxay16RfA2StWzGZSiD7iAplTK
         599GVsTtOpnCRDBJg3Jtusp5H5AmPMUa3x1wi7gHGdKfxdFG0h0hV1f2yw/n9Pf2YCPO
         G54i88SS4fI2QXXr8/s674xDCWLJ2G9GLZTFfLphqs21Qzoj/vuVpbIHFxxTBNUsJvOo
         wwzSAGgKPL7uS5DEiId/U6xDQc/uJT2Q/46vpqDOzmOyjLJU0PBIjewy6AI9sMm6trH9
         zDo8tPRFanc9yFjxc4pLT3Jsfsq7unYXZqMWVwe48njUJ9CZPB1LKNXAwQooOhmkCt5N
         V0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237767; x=1784842567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DP6p2yHa/CcMRK7GLBZhA5Xgmib1P3Zs9Lq82vtGTA=;
        b=R7dF1XMBbGVS5ASuYpN9nAtsUv2tuhWimSyNVWdFM+gUCNgHkMpPzsJWZtQytd2SVK
         mDWx4Dqg0n7vtgBVXQZDc+PYtc/4M6OP+T3uijotLdT4wuM43lNG5qigXXYksK7Z7pe+
         Ths3A4rTeruIvd5nYgH4JWyOAeTPA8JUreTB11YCorijqFEAc/E4Y+pNPIh+Haw7H4st
         lofZArbV59n7P5RBkoIvelmXtg+QykPJZkwNcQZ/LLdWqUu3cIOWa4WlVPqqWv5SC49y
         5TCjVLB6jQpKT1k1vYD2Soeguoq/5RFH5aafrSx5l+0lG4th14AvffR4gbY251FTQlKK
         e37w==
X-Forwarded-Encrypted: i=1; AHgh+Ro5Fx2Y0susgRaE1Kc+kXMKJIWnZ6MChLvo4drV1Y6IHc0OXOZkvEFm+rMmm0V9Om4uYnmSom4WB34G@vger.kernel.org
X-Gm-Message-State: AOJu0YxDxYRFZ2nXllwjEKphABoDtUIhorVI40v4KwDX9fQcoag/ebHi
	YJiA41PD1LLwBjayH4i2vGkJarQpViF5V6vVakaOUx2n8TC0+OZJyMJGll5Do2FL/ssAng==
X-Gm-Gg: AfdE7ckw+Y77LU5gQXUON1mQmjO541YJIlTjs/zqHILRxN4mFMzBOXueysXFoVZx2pe
	TEm1Kn3+C1Z9WEDnyCox+1+dhJ+dkWFLRee4dr6MAFr58vNbQixsLuVifgBxzb3uXt5QwpZteCW
	QOUQNAiH1D/7awCgFzrSInUhW0kGEQJuFrTNOq5H//0aQsikwEITDX5SN+YpoICAOqPA5j/fCD0
	5yTMOdZMxttNyDvrkLuDvyg4lMQYNQbUHld1fFpxB2IleDHThRcyehvZlKnsedI0a5kdCFGVZ1d
	t71MnI6n0Hhacl4MOiCwjqY6pB9aKryzqi2FwFvvY5wciy87dBnvVkD8UnGV7ufUsYsrMwDOgZz
	uHLmoUqXmiqmhSontQ2WkqQWxW/m3AwWO51P0EKxLl1USs6LPWnPQ8go3OdYdb8CsxUovxJat1F
	7/B9fuRwwyyo5o
X-Received: by 2002:a05:6000:186c:b0:473:1089:154f with SMTP id ffacd0b85a97d-47f4fc51420mr10659026f8f.0.1784237766986;
        Thu, 16 Jul 2026 14:36:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:36:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:40 +0300
Subject: [PATCH v7 04/13] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-4-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8283;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=gYcmT5SJ16KzbPHs7e4lJ3zArzZ0tzAmOzulOMxIRpc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xOb3DS42wYGwsdjarwcr/mneZNil63T/4W
 6o9UDh/HuyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLlUw/7B8NHuS3CQ4Jg8Utn8bD8c8ESTEyjkhw
 BJQL3pXovBw22uKXEVinoBrVTuV7hmoWmszohC8SmhHu7q6dPnrNXPZ5zLeYtQFiZCGrNLbv1Ky
 TG+CjFIIhfPqZWTWP4FhBHjerLMTYFEkq6vkLG04Xz/fW0I6X5sD+KwVJin0sH+qTC+zfH/UN5w
 5rbankHqxVw8BYyRKitRduCoAXoSbuX5W6eyvE2ltCeiSW5W7aZTixIG0TxmirB9J7BoJMaG/Ly
 JNqk/zfaMwIy34srMdPa/OxV0prFYw4PgYXyz2ke8LFTHmlsTENYPsv20Y6NjWF7tqUhnjepKTo
 wSNLO5JjCRqXPyG9URkDS8K2FOnKDkUf+NgsnbYFs32sCq27ArageaFMNvGCgIesaPxAsvsg8Gd
 rzT4bkKrVeeGu1ZHmGPhNPGjHNokBbO8e8iAFFIX7NW8Bo4kQMoCFPF1TdBlOLLw0BTS9c4bDXU
 eiawR7GNl2enC+ktT652nSzAut3oMdjInYXIW7JqK9WaVHjDkihcDU9QEP+jjwPKwiZL4A+SwAs
 4jGP4w1Nf9kTRpz+0W5CxYXoZ3ICY8w7t7ZZtjgtNtREWYuokPEHewO2DEo3w2c11ocuYrr4jWQ
 YxBHOjX8T4LrMRvfdzs9Sq/GyBtRVyUxItK9hwGdH6rlxzLSublQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The clock controller of the zx297520v3 Low Speed Peripherals is
relatively clean. One register per device with gates, muxes and resets
and for some devices a divider. There are even bits in the matrix
controller to control propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
device list is complete. There are however a few more registers that are
likely extra dividers for TDM and I2S devices

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:

v5:
Rename from lspclk to lspcrm
Remove matrixcrm from example

v4: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  37 ++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  19 ++++
 4 files changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
new file mode 100644
index 000000000000..3ef8fad3c93a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-lspcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC LSP clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This clock and reset controller controls low speed peripherals on the board.
+  This is a relatively isolated subsystem containing UART, I2C, I2S and SPI
+  devices. The controller is responsible for bringing the devices out of reset
+  and enabling their clocks as needed.
+
+  The controller receives its clock signals from the matrix controller and need
+  to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. Resets are defined in
+  the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-lspcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main PLL divided by 5 output from matrixcrm (124.8 MHz)
+      - description: Main PLL divided by 4 output from matrixcrm (156 MHz)
+      - description: Main PLL divided by 6 output from matrixcrm (104 MHz)
+      - description: Main PLL divided by 8 output from matrixcrm (78 MHz)
+      - description: Main PLL divided by 12 output from matrixcrm (52 MHz)
+      - description: Main oscillator output from matrixcrm (26 MHz)
+      - description: Timer oscillator output from matrixcrm (32 KHz)
+      - description: LSP pclk output from matrixcrm (26 MHz)
+      - description: TDM wclk mux output from matrixcrm
+      - description: DPLL divided by 4 output from matrixcrm (122.88 MHz)
+
+  clock-names:
+    items:
+      - const: mpll-d5
+      - const: mpll-d4
+      - const: mpll-d6
+      - const: mpll-d8
+      - const: mpll-d12
+      - const: osc26m
+      - const: osc32k
+      - const: pclk
+      - const: tdm-wclk
+      - const: dpll-d4
+
+  resets:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1400000 {
+        compatible = "zte,zx297520v3-lspcrm";
+        reg = <0x01400000 0x100>;
+        clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_PCLK>,
+                 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12",
+                      "osc26m", "osc32k", "pclk", "tdm-wclk", "dpll-d4";
+        resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 6d153d2cba79..a135ec070314 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 09ee3de679d9..2c947f467373 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -104,4 +104,41 @@
 #define ZX297520V3_SRAM0_PCLK			39
 #define ZX297520V3_GSM_CFG_PCLK			40
 
+#define ZX297520V3_TIMER_L1_WCLK		1
+#define ZX297520V3_TIMER_L1_PCLK		2
+#define ZX297520V3_WDT_L2_WCLK			3
+#define ZX297520V3_WDT_L2_PCLK			4
+#define ZX297520V3_WDT_L3_WCLK			5
+#define ZX297520V3_WDT_L3_PCLK			6
+#define ZX297520V3_PWM_WCLK			7
+#define ZX297520V3_PWM_PCLK			8
+#define ZX297520V3_I2S0_WCLK			9
+#define ZX297520V3_I2S0_PCLK			10
+#define ZX297520V3_I2S1_WCLK			11
+#define ZX297520V3_I2S1_PCLK			12
+#define ZX297520V3_QSPI_WCLK			13
+#define ZX297520V3_QSPI_PCLK			14
+#define ZX297520V3_UART1_WCLK			15
+#define ZX297520V3_UART1_PCLK			16
+#define ZX297520V3_I2C1_WCLK			17
+#define ZX297520V3_I2C1_PCLK			18
+#define ZX297520V3_SPI0_WCLK			19
+#define ZX297520V3_SPI0_PCLK			20
+#define ZX297520V3_TIMER_LB_WCLK		21
+#define ZX297520V3_TIMER_LB_PCLK		22
+#define ZX297520V3_TIMER_LC_WCLK		23
+#define ZX297520V3_TIMER_LC_PCLK		24
+#define ZX297520V3_UART2_WCLK			25
+#define ZX297520V3_UART2_PCLK			26
+#define ZX297520V3_WDT_LE_WCLK			27
+#define ZX297520V3_WDT_LE_PCLK			28
+#define ZX297520V3_TIMER_LF_WCLK		29
+#define ZX297520V3_TIMER_LF_PCLK		30
+#define ZX297520V3_SPI1_WCLK			31
+#define ZX297520V3_SPI1_PCLK			32
+#define ZX297520V3_TIMER_L11_WCLK		33
+#define ZX297520V3_TIMER_L11_PCLK		34
+#define ZX297520V3_TDM_WCLK			35
+#define ZX297520V3_TDM_PCLK			36
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 4682d4a599c6..69eef84b2f29 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -41,4 +41,23 @@
 #define ZX297520V3_VOU_RESET			9
 #define ZX297520V3_LSP_RESET			10
 
+#define ZX297520V3_TIMER_L1_RESET		0
+#define ZX297520V3_WDT_L2_RESET			1
+#define ZX297520V3_WDT_L3_RESET			2
+#define ZX297520V3_PWM_RESET			3
+#define ZX297520V3_I2S0_RESET			4
+#define ZX297520V3_I2S1_RESET			5
+#define ZX297520V3_QSPI_RESET			6
+#define ZX297520V3_UART1_RESET			7
+#define ZX297520V3_I2C1_RESET			8
+#define ZX297520V3_SPI0_RESET			9
+#define ZX297520V3_TIMER_LB_RESET		10
+#define ZX297520V3_TIMER_LC_RESET		11
+#define ZX297520V3_UART2_RESET			12
+#define ZX297520V3_WDT_LE_RESET			13
+#define ZX297520V3_TIMER_LF_RESET		14
+#define ZX297520V3_SPI1_RESET			15
+#define ZX297520V3_TIMER_L11_RESET		16
+#define ZX297520V3_TDM_RESET			17
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0

