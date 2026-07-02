Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0083AB291
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 20:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024157; cv=none; b=J3wzl/5Yo+Kq0qUYxhP3i48KQ39KLtzvV2KYFXBh17yFvhXJx6gU17pOCtxDyO7vnohSQlkIDdeGnP3Rgr4wwI/vRjVPoBLCkVw9l+JyxG7WGacAHLnEf0It5CJeuI3hdoYkhJBEyOGDVXpjA8lhfwc175YA/oO+oEY3TDpDSgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024157; c=relaxed/simple;
	bh=faC2rNsCyS4fzK9rdzROl4YJpwDdrx5zd46qIG5QV4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CCnYk4gxjcPkarmFg/X86E1Brze7bdIAyeRP3BLk5IcLl4mspLEZvi7Xo8OB77EswMF46zwuEAcbKZ82g8k6vqXH3GV1Khtn83ody6IVppE5cRkKdcLXB0u4TYfRGF5nDpHGZogtM+Q5OfWOm1twVR7+bIHy887wwTH61Ye4Qvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhSD+mt2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhSD+mt2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b7612475so19282365e9.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024155; x=1783628955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rJRppchV2lXjZrCYlNbI5UPHl0Mh3nNk2j/gKypjio=;
        b=UhSD+mt2yNoiMoLMsy4v0bDQCGlHVI/XrYyukSpWtYd1uzQolo5uAWpIbVMMlQV1uE
         rn0m1xw/C24i9k1zd/mWJef6il1BxEGnEtw+FJl5YxD2IZgAA6WZsyX9SpH4iLjCBo9b
         4xE7uuXEW4YXQS/aECLH7NH5eDMvgFYcbbo01hwflHH2TTixrZblGKSX/IEmhcYQJyem
         7ySIMGfjgvL8VXFxvWjOJHKhRtnlxUVRHSp4NVDg4jdUgRo+2i1L+mBGJezeUaXBmGzx
         vDbVNhf+WWKOYG7aE+Y5heuBfKmgdCKpr7m2LAArDIim/VW2A+baL4UdLde32FSvc5eP
         9pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024155; x=1783628955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rJRppchV2lXjZrCYlNbI5UPHl0Mh3nNk2j/gKypjio=;
        b=WT8V4GFCy87jXcabL7gXJL+CH/DS8X8aOAD3ekEQPd7PYFw6Z178/s74vCMJumrk7B
         CgNn4jQU7krs92iZHU1z8id6WTnx0AZZZztpBmM3gAA+QRewbfTH47VsVRU5n2EWEobD
         F6lgVT6o9RblcHl4YcoFlmkLbyB6HCmDur/9W48vsAP0IB36H7Msitfq4AVaM2/7xEYd
         6AgbSz/1sAF/Fz+dD4SyRWPn3Am/ywDqg2ppht04E2vAIYuy2B5OrvHKzcUEhiq7t64Y
         RKUGYft6YUVqGCczgHMS7YlWr7tc6BxA3gtCl5hG4ffih985n6j//C0o2OU6YpFeN+K0
         eWUg==
X-Forwarded-Encrypted: i=1; AFNElJ9ftmQZgZwO7IwxiEE8EfJR5tQxGcd3WriiOSsufnlM7fSbczxj7urOIox05FYwqt0ZqBP9BuHV87/1@vger.kernel.org
X-Gm-Message-State: AOJu0YwJbUjaePHVbGqGnOs4UUfj4wNb0ESEMAsejy4CD4geFwqPm/+Z
	oXX8aIl+qSl2YYWkhqeOU9NlL5m4dS8LkTKaiVYzM5YT9lNh3akrrgdF
X-Gm-Gg: AfdE7cmOQj8fBtjeYAbXF65Oi5OTw9JNklorvA8VgY8mCd10fTR4KLPGS/oVzGvssWB
	DPNg4yBpzh5NK35frnqxEoqRA+EtnXPol91IL1zb9OiGnWg610olGOokI+DjpusShJDdaD3hZUH
	ZrIBapEmLCudSZ2e5zggYs79rhFLmg0xU59/vtiWxj8r3SIFOsiFE+MnZJMciJ2fZlyORhj5Nxa
	WBBTe44ChO2y3ZGyyOMcSUshV21FKOiIvSLtNJXFMNPT1Auz/uxx8ZmtAeWni1v3GTndE9ZyGYQ
	CiiQZLEe/TT37SeQQ6iKGWSIYgV02k9z6JtAi4fNLt0PzkPLk29Kbx9avIrBZfot1Nd7LY9aYXE
	1ICFtm8M8aXsIktGhnWYhB3a3szviGEtjg61NPIikTa18+8VUc3VHoDinKmkLQexHqtpfUcUY5s
	g7uhZTe0q7lcgq3iEjYxFb1gA=
X-Received: by 2002:a05:600d:111:b0:492:4717:59fb with SMTP id 5b1f17b1804b1-493c2b5879cmr88197495e9.17.1783024154621;
        Thu, 02 Jul 2026 13:29:14 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:29:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:07 +0300
Subject: [PATCH v6 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-12-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6047;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=faC2rNsCyS4fzK9rdzROl4YJpwDdrx5zd46qIG5QV4M=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnqPX05lmKhOsIKvfmM8irTzTVr6ZJTn41wE
 6ikPNN6TSmJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKXnA/9FiGMNIejgvQ6eaNSyM/0/Hl6NAV9mWm
 5ufQbut9ku/gtLbF6MGBW3yAtCrO5Hz5xxjGjODxAjVuLS9a6fpR0g0Dv5RT5rYaDKD2Id6C8Vp
 XkkHIjTyF5jdT7FTgFOc653YL61tROU0TKhuGk6syXM0Y1zb5LRCbj4bULSX/kBR3JIk5Ug52c0
 KvSHUvfE61oEGLAzy6jZpcSWfX3TmtPEC+tkPfXEqdbfnKaiPAW8+leayYZl6QOZmNTZ6O+Xna1
 FR3jN8BNBukV2PSdysMBKQ2A5c+2PJiEL8MUPIeZP8sd7iYXTZgkQ1eNrVGDkyizF6BirhQ4J4g
 dwInDblk0jdgPi9Mov+p51o5W5OETERf/NAvd+YoAYwLsEmssIsO7p7Ub8ZaNU7TUa9mFVvlC6d
 1Yhav5XhiRSXpH6vSAJpAWqC2JRePG/rpcEaO54t989iSRTK3TPXsgkX7ULE8Ha8sPJ5MV+2p28
 rYrANxLCoE1v8epQ3udZLkWe4BJGojCg6YZENWPeq4IhtmJHKUPwDM+Qf1eG/ir3mIQI84V/KU1
 uslBpvZGZg6zsY4EUQ0WpljNqgLXOkNqocrTni65yMvqbi6kAnLLCvtl7xRUkyfN8Jv7c0v663I
 dnyUNoBecXj50ZZTl94yB8omMO9UC3JY9FqwRZajBAJ7aYx9bqlo=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 6:
Add syscon to matrixclk

Version 5:
Re-name from *clk to *crm
Add the syscon-reboot node here because the binding requires it
Re-add accidentally dropped uart2 IRQ
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 98 ++++++++++++++++++++++++++++++++---
 1 file changed, 90 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..e3f698e28b49 100644
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
@@ -70,13 +75,88 @@ gic: interrupt-controller@f2000000 {
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
+				value = <0x1>;
+				mask = <0x1>;
+			};
+		};
+
+		matrixcrm: syscon@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm", "syscon";
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
 
@@ -85,8 +165,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>, <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +176,9 @@ uart2: serial@140d000 {
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
2.54.0

