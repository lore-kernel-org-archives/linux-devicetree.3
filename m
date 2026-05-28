Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9EB36680F
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 21:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005319; cv=none; b=ksZOVdq2/bTiW2xLepzO15XmIo7fgbAdnpQoUdQUUhiqs5lETcMOSDxAq9+LdtGnP9NaJpGsrxZkPLO6V9qTKGgR8o6P28A/gCu8/ie16DrNZRTZvN6ZB8y/p9X+NFKg83L2AX8UYConH6XD2e+M+IqyBt5E41gaenLtmkG4PQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005319; c=relaxed/simple;
	bh=eKCYysFcPuaXaoisFpLloAByZzjH3S4RlmU0j/f/7Ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOWloYvi3/EYdrmOKgsvalhzSLqHLzStpmf6tvDLJSWQtGS68DTZSuEFIwCPGjLVD7pu3FN7PwTV8R7xjkNs9ZWKsUsR3QeWPJvg/eSfp3OCP39oi9XK1gThl5GlTyxnonBBdCQKGHtIs/F+8qvhM830K+CuziOU8T/PpWM7EHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbXng5le; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbXng5le"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso71787015e9.3
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005316; x=1780610116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNQvp/eWwkD2QZuuf9D2poX/9RA0ShD7oqYYx3ps+FU=;
        b=AbXng5ler+qLJM94n06xjUho1Ac7izmgSauyXnUrlfu7guWRbjXBtEGhhpc33nOhOZ
         YpCxCBRh67P3XV13HXB2ClaRNUxRGQv6RWf8/wpqiLV8dw10X4PzSVHGVw+sBe12G1s+
         NxsK5+c0bmvcQsQGuJkxw16DCGeZJyUFpBSDqR0GkF46NP1vDE++9RPTz6GIJ3ZpjJCg
         25sL+NluK9LQnmnw/TyL81Rk/5sJu5+3jp/TlFrUgRcncCCXZzCsNQ4R3vOlIPwClcd2
         zLbPGyO3dTMBx4/IBlwkCN1O2i0M9nWhElg7OqO+9MwxRq8X1txfs2pGezghc23+MzxA
         4Ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005316; x=1780610116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CNQvp/eWwkD2QZuuf9D2poX/9RA0ShD7oqYYx3ps+FU=;
        b=VWgNQKkeSst72mBiugqf1c+i8zDgSKaN/DRqMFA1a+tN0FK/uwIi8/zLkcnF6EcYgp
         Htfb+wIzbp8sWX/dGSBLh+xrpw824sebXfogYQ+JwRIB/gZQF4HSwEtwnFgIjtWGnrxO
         zK8nPePabWh5NzyyTFyCWXmHVKgavkmyr7FSmiNUqJ8wrUKSC+witr+sd9hifZHe1ZOK
         //4bXXUldZNA9a3yj1d63ptq0ZCLvpqV+c15vX+Vn5EpoDuYtp87512nxlzwO2YS8E63
         ODxZsBXz53BTo+KBncqdzy+qMxA7ZE8JEcInm+WaR/poy92KcUfO+E+SdXn8e6+rwAeG
         641w==
X-Forwarded-Encrypted: i=1; AFNElJ/YVBivKnceKheqMu/tLMBvSX8clfxPW0RT38MC8EVY02m5imR2AVUH/+azK7NN+UYO0IKWyMeGlv1U@vger.kernel.org
X-Gm-Message-State: AOJu0YyfRcEBoOWWO10yuRqoHDDqrHfjh323ts+d/GVH8eJTsJM2VJWX
	vcb0zeF8n+ZY5+GcYlKw+K/0GwhtHfyrVjQ+BXis1Q3nZxE9pvOKlPFW
X-Gm-Gg: Acq92OGi64B9oMvbCiYFFE25bdduITf6SVja+Eh7VDxL7mdyg9ar5AtKfvEn7cPmeDU
	qxXNvBB725Fjf2Y51k0NTaFEdoiUiRZNZMO/YB7PT4rUB2mgS8N+Y/TSSYSeeVltAHPti/X1s3m
	I/cmA2A2Do/fFtw/XZoRvjBNWfAbO6hBRXD/xVqCOFOhY5NmR285ux2rzrTVyMr9Wj5MkkQi5+Y
	z12EgcLexFetEJT9oCEcBymYnEZjBs4x2VT+UvKv6slIeIhr9qySzYcE/Fk0KL41gW8Cdre46gf
	llZ36/hDvNWx5bUwN+hlD5V+P0N+yusx0BzEcDIUvMltGaji7KZ2QS/jse0siGy0UbJZ4wFfGBn
	F1R4EAclewSZAn0bHHOPThSAZ5kqmI9f3nwiEmoAVcmNUJaMRHjTIl9mNQP476areQE/PebeatB
	hWdgzy71tV2rS7f6xlY2pJvLbAPWMYmYmkWt3dxVUGw1fu
X-Received: by 2002:a05:600c:2113:b0:490:845e:3a6 with SMTP id 5b1f17b1804b1-4909c0b706amr2630715e9.25.1780005316082;
        Thu, 28 May 2026 14:55:16 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c6csm1191085e9.2.2026.05.28.14.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:55:15 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 29 May 2026 00:53:02 +0300
Subject: [PATCH RFC v3 5/5] ARM: dts: zte: Declare a zx297520v3 clock
 device nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-zx29clk-v3-5-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
In-Reply-To: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3665;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=eKCYysFcPuaXaoisFpLloAByZzjH3S4RlmU0j/f/7Ww=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqGLmonB1gQW4rZ70oU0qgrlZbtOo5IBUL5cz8K
 uiR7j+xheuJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCahi5qBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ44Q/8CIR9L5lArAiX4KXK9TNo8gozsOA+QtY
 xAaPTNtdFAYbufZxCearH5SOwIkECPWNXkoOHUgsqUkovgW9ytiFBM69T8PQHAbwEMq7tVnYFt3
 aE8SIFT7ExX5DKfG6TXFphrQcBkMoE1u8uv2d01pjRgs61xruYaGHsyIfjTbXn+4LIYpkGbZZcC
 p7O9mFhIkdna1PVWHx089Iq6jxx/2FOzfG0BdXVeTSNWwNhPE35VbGcTXxAIoFUECuoJZti/X6F
 zpr6kW8MY/kQ+ei71gaXAu2qrAPkg/W0NvV7owyKZAMYwGTbcDEUyxjW1yEqZSU5cGh5lpXJWjp
 uHJlsPCQ9DRQrmK/FcNaXRhE2GEMn7vZyKrKv57N1UogMS4ujjEBixkth6UjbC58nX4QNxM16Yj
 u/ctOLfzxCs5yjjvLMaTquro6kYv/Knh29PqekhtBEHq02JtZVFWUEohnBrzazD7WshWfm9Ng2q
 t5ToJPcsNzljawo7O9fBuuwqMhYqDOGhy1GZ+Ldq/f7Ft+/R4hb6hTqRREizKKl8+HhgjJQKOuJ
 pfYymxTsmB4iiTbEn4DVHLIq9DXnAQuL7Pztxvrfiq/du+2hgn2JGjSTj3G9pCbakLYCmV+qVCD
 Qnt1VogpwWWBkC2wl4JZzSECG3uiiam134qXk8hCLGtPbIBK3P2c=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 55 ++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..9d80740ccf8a 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 
 / {
 	#address-cells = <1>;
@@ -20,13 +21,16 @@ cpu@0 {
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
@@ -70,13 +74,46 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
 		};
 
+
+		topclk: clk@13b000 {
+			compatible = "zte,zx297520v3-topclk";
+			reg = <0x0013b000 0x400>,
+			      <0x01306000 0x400>;
+			reg-names = "top", "matrix";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+		};
+
+		lspclk: clk@1400000 {
+			compatible = "zte,zx297520v3-lspclk";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			clocks = <&topclk ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&topclk ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&topclk ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&topclk ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&topclk ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&topclk ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&topclk ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&topclk ZX297520V3_LSP_PCLK>,
+				 <&topclk ZX297520V3_LSP_TDM_WCLK>,
+				 <&topclk ZX297520V3_LSP_DPLL_D4_WCLK>;
+			clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+				      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+		};
+
 		uart0: serial@131000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topclk ZX297520V3_UART0_WCLK>, <&topclk ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topclk ZX297520V3_UART0_RESET>;
 			status = "disabled";
 		};
 
@@ -85,8 +122,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspclk ZX297520V3_UART1_WCLK>, <&lspclk ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspclk ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +133,9 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspclk ZX297520V3_UART2_WCLK>, <&lspclk ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspclk ZX297520V3_UART2_RESET>;
 			status = "disabled";
 		};
 	};

-- 
2.53.0

