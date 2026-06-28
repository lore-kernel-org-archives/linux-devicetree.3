Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BB3B42CC
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676806; cv=none; b=G7C9dlCdmit2uAcRGQ07BXLyO+8MBX9UoXPXIvhAtHk9tV55fEKel6OCqlUBLcgkwC5MWS820S3Yq0dqNSXsRpWJV9aTmCwV/l8/7T124AyHICeo6YJzyjGVqa8cQ0sSoMUS+bJZe5b+eUhLSE/le1E6Nk9ujRS81QUx9jZ5nj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676806; c=relaxed/simple;
	bh=yZupSlYaBF96l0nMGSeEbOxCyUX4xyQ8RZvaSmIUkDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYvD/mXmsIfRKxCzNXWKKbwF7mlTP7hxsb+zZfEs/4ClDetD9T4ZkRIDamlB0co1PvHEzi3YXeZk5Jlh4FwRb4fkb56eH1LfBGzh6yvn2VJdzB/BzW8HnxUod02+cjsoLc30KNWnAxUrc4wTOSwHmkJxM8ayMkXVNAiclhsk0pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2lwSwHr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2lwSwHr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so23811035e9.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676803; x=1783281603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve6ycQgrO4HeOCYbZzMNkFtrxZ2ddrP8G6fNlKk1+AU=;
        b=Z2lwSwHrjwE6kcexX1xgxCNRAGknVqahfG3ksub9c4+1Du+CLeINo6WxboRIoxgtpz
         DRyEKlpf0iY6rXESceTNqMcT4Wuokly/YKhJ8z8ykEA2AlxbFo+uSK1FGaL5zLK8FMpH
         kR9U469maeAd7DZieQUhGfmE2CnSA4ULlnR0wvw/LcDQnzWNI9nAVyBffe1ssNFvr9aB
         wgLXaK7HMTz2ersgo2M4Ro3fIiG39cI0ggN+gwEYN0JtxdSobr2ap4E9B4crkTBVxtBJ
         Mrxzj8qNdxXdJAoijIzGbx4HrYkfFcOEpHpZnj/zBLi+M21uXNkYtSOTrkx9WRn4P14K
         sVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676803; x=1783281603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ve6ycQgrO4HeOCYbZzMNkFtrxZ2ddrP8G6fNlKk1+AU=;
        b=Kvty5tbM9Lwdg/f0FersX0L/T/IBHGz+tsEy9CuY3ntin8O4vp5ivuq2PPjOzKijU0
         6PwXoIxChGpzBJAiPj2cR3wYEhsARLG0UbyC0+kabMHl9ozOVUpS9tBqClK7IMKO/LUt
         QTRzh5FEZM34TCOw5/w63S/nfSS5nm0FCWT9dMkb7DaV4P2MjIZbgCo61tYSFqKoKqSG
         VLbWN2HRR7NV2k0ERVsMjEOmXB+ILB+chSeENv66hZJisybsjhYI4xroWPvov9XwfcFv
         ZYt9Lu49KyC5M8KLR8dH+7pwQ9boJEejIJoGBSSvvCvNdt1K7iwopKwH8+dmZ6l02+6O
         op2g==
X-Forwarded-Encrypted: i=1; AFNElJ+5RT0wCtgANss1asA84cexS1PoYHk6CtryVwpIG0hSpCn7vueVdbbgSI27Nln83GWBd9yCzwEu1FfY@vger.kernel.org
X-Gm-Message-State: AOJu0YxwBfoGc4+Nzcr6J7c3vbTj35ObTsJSScaHrQAcRjEB4CVAtc1C
	+OpRKkvkG/EyDQ4szcEcdLTBcFbH0Pg7xFB5fyNR1mRQxO2+5SDHFTaB
X-Gm-Gg: AfdE7clogJPlaHIVOz7MpacEInOjj8sREhm94/7BTw66Ii59ej0OkSmceuaIHFCT2aY
	Y2nuXOvvOiLcLx66jvnxQxnBfGKxm6jC0dXJnHa5tKiucgo9fjg9ld5CupYdBFXMiA8p1ZglVGJ
	4rah+yX3rdZg8Xkx2VAPgMnimVV4RUmpvJrCZ28XKF8g+np8ozeOk7clbCO+D9XtVdKMVqrH3PW
	wFNVZzEwG6arukyfBz4jhKnazA8cb7X/2vjSY83o1r7wsalf7waQsWA4llECOU6mJZGbfyJsZyM
	jXOz5OnHpqJD+yw/O2DV5pHG02nDdeyoH6E8eTzIEL3M6fpiwPWrMZzd4w338RvB/7AjKanAfCZ
	kVz7/uLqHxfxozlEOKwGmbNnUaPPtQlH2uhTXhThUBogdxMCvbGgpRAMv/JKPx7uXgPLrbtlDud
	0p6IDzLOayNWlMxSU+ZTF17jk=
X-Received: by 2002:a05:600c:8b13:b0:492:3316:4b34 with SMTP id 5b1f17b1804b1-492668554afmr215573395e9.2.1782676802578;
        Sun, 28 Jun 2026 13:00:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:00:02 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:59:07 +0300
Subject: [PATCH RFC v5 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-12-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5977;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=yZupSlYaBF96l0nMGSeEbOxCyUX4xyQ8RZvaSmIUkDc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UvdGJ9CmBOwRNtJEXpIKLgNC7poT5oFUiI
 TiabV8KmJyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKArg//RadVWBZNwbVkd4kayIvg35Jj5OC1Z46
 9NEgARBDbpqLs5gvIFJ/5oeQ1YizYlG5T2+Lpf/119n3hkOu/xNxdUFcVyh8m0I5Gh8eANvyLWk
 LIJuoKqMB3rz7MedQg6PVeib2MVcPd7sn803dRraNC2oDfWJVEhSmgQtcfkE8acHrLRVgtuXqtd
 aq9gx4mW1P/SdmhK9iYCjeFELVgSkUxYLqRR4NMni9euhtHBVmdcW9RsvVBwfqzrv95fDK8VsL4
 jwp0lYt/gke+FLxlHuiGnBLv0RgOf1tT6Va039NMHE5yEJsqy63uSzewwjJmmLdL+IKbZttu590
 so5pi2gY/qNK03Fbzw0nkJNbCwGRTqJuo1oO+f6xWirgBxVqOWFel2wHD83YAQuTYMggfvxVEcB
 1JMoj9318cBhF5l4sg8ivsDwS2lFHNWEwTleO0tbavhLs7U/ko95YhKIdR6vfRs9A5A86rH4BFx
 LFJeyWGm/X/zUC8u6mUZAdAwlkolPdEXQg3u1RARIPrtKrfVI9QeCZ6k9xy2/N6nEDpIdI2we5a
 CfcBclpco0eUzWu6cnZRMCt0IhGZp2mCvByTc9OhJTR2KaO2djrK2OC3mGXkG+K/EgZpB9XOOYL
 uILZbq6Yw2Wzm2Z6SR25J6tnW8gaZKSu4mD/hd13rtDmMg6GXSd0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 5:
Re-name from *clk to *crm
Add the syscon-reboot node here because the binding requires it
Re-add accidentally dropped uart2 IRQ
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 97 ++++++++++++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..2ae6b78bc034 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 
 / {
 	#address-cells = <1>;
@@ -20,13 +22,16 @@ cpu@0 {
 		};
 	};
 
-	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
-	 * been added.
-	 */
-	uartclk: uartclk-26000000 {
-		#clock-cells = <0>;
+	osc26m: osc26m {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	osc32k: osc32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	timer {
@@ -70,13 +75,87 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
 		};
 
+		topcrm: syscon@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+
+			syscon-reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				mask = <0x1>;
+			};
+		};
+
+		matrixcrm: syscon@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D2>,
+				 <&topcrm ZX297520V3_MPLL_D3>, <&topcrm ZX297520V3_MPLL_D4>,
+				 <&topcrm ZX297520V3_MPLL_D5>, <&topcrm ZX297520V3_MPLL_D6>,
+				 <&topcrm ZX297520V3_MPLL_D8>, <&topcrm ZX297520V3_MPLL_D12>,
+				 <&topcrm ZX297520V3_MPLL_D16>, <&topcrm ZX297520V3_MPLL_D26>,
+				 <&topcrm ZX297520V3_UPLL>, <&topcrm ZX297520V3_UPLL_D2>,
+				 <&topcrm ZX297520V3_UPLL_D3>, <&topcrm ZX297520V3_UPLL_D4>,
+				 <&topcrm ZX297520V3_UPLL_D5>, <&topcrm ZX297520V3_UPLL_D6>,
+				 <&topcrm ZX297520V3_UPLL_D8>, <&topcrm ZX297520V3_UPLL_D12>,
+				 <&topcrm ZX297520V3_UPLL_D16>,
+				 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_DPLL_D2>,
+				 <&topcrm ZX297520V3_DPLL_D3>, <&topcrm ZX297520V3_DPLL_D4>,
+				 <&topcrm ZX297520V3_DPLL_D5>, <&topcrm ZX297520V3_DPLL_D6>,
+				 <&topcrm ZX297520V3_DPLL_D8>, <&topcrm ZX297520V3_DPLL_D12>,
+				 <&topcrm ZX297520V3_DPLL_D16>,
+				 <&topcrm ZX297520V3_GPLL>, <&topcrm ZX297520V3_GPLL_D2>,
+				 <&topcrm ZX297520V3_GPLL_D3>, <&topcrm ZX297520V3_GPLL_D4>,
+				 <&topcrm ZX297520V3_GPLL_D5>, <&topcrm ZX297520V3_GPLL_D6>,
+				 <&topcrm ZX297520V3_GPLL_D8>, <&topcrm ZX297520V3_GPLL_D12>,
+				 <&topcrm ZX297520V3_GPLL_D16>;
+			clock-names = "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3", "mpll_d4",
+				      "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12", "mpll_d16",
+				      "mpll_d26", "upll", "upll_d2", "upll_d3", "upll_d4",
+				      "upll_d5", "upll_d6", "upll_d8", "upll_d12", "upll_d16",
+				      "dpll", "dpll_d2", "dpll_d3", "dpll_d4", "dpll_d5", "dpll_d6",
+				      "dpll_d8", "dpll_d12", "dpll_d16", "gpll", "gpll_d2",
+				      "gpll_d3", "gpll_d4", "gpll_d5", "gpll_d6", "gpll_d8",
+				      "gpll_d12", "gpll_d16";
+			#clock-cells = <1>;
+			#hwlock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lspcrm: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspcrm";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_PCLK>,
+				 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+			clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+				      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+		};
+
+
 		uart0: serial@131000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>, <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
 			status = "disabled";
 		};
 
@@ -85,8 +164,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>, <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +175,9 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART2_WCLK>, <&lspcrm ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART2_RESET>;
 			status = "disabled";
 		};
 	};

-- 
2.53.0

