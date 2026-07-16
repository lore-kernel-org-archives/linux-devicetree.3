Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620613955C7
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784239250; cv=none; b=sYK6VODzUeZHqhC/PbcPvFg7V6QevCrLwNvqQV3ih8pMidM8H4tQv+SFbpKKLLS0d6EE/vprMaqruIgQSz7dtOXaskeKM+INZ5Ys1LxIuBV6moCK9p4RtpWVQCyscNj30hykYPHqIUUtIiUdznZNJm6hGiHEtK1YV59D7KaxvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784239250; c=relaxed/simple;
	bh=jNStNYlUyvLHR0/UDAvVkBhd+bjfRDW4bFuonzzF/i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iRyZnQEW1jYvg9uTaAhbTsWFDScjRNGxYSB4ZR+JnA0jqy1+caGiWZApV7mTx+X3P2HsOfklfXHgv/Gn5fUgKnbJ7eEx8CMKMjcyJvDUzrkszP9yBit1RmyZ5lS6nNr8PlF+murRGRuR+AlftgQ2fEP7quEEFlH09XCJ+0XXfC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eihM2E+0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eihM2E+0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso4273307f8f.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784239246; x=1784844046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WzQRA6RSKwvE9p9fmXPG0emKpd/WfAVetFz3/GIIivk=;
        b=eihM2E+0vnpdJ9KU3yR1faC3TvRKIKeJc1RUCn/8er/TXDbxyJoIMVenk0T9upHOb5
         faA4p092OyaXNM12purrDLs16Vouelnppi467J9udBxP4Jh3+Uz9YEOT596zG3zCass+
         UoedfSS45A5niUZ4btp6i4IJtq0FklUNCTHhUElxKAXsBl7Wk4cL8Ya3n20IojGVwtN+
         jw0BzARF5wqa/P9HIEi8ooF5umrtcHM5x3nnolf25vMsm1uMYIWIqf2+UGq6emJkIK5n
         LFnaDzN/41XN2ldRvQvIoLOCIOLu8ChkbxGcysHoAqAU//tuT1B4W0wLQP+40CbmMzl9
         0VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784239246; x=1784844046;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzQRA6RSKwvE9p9fmXPG0emKpd/WfAVetFz3/GIIivk=;
        b=MMWr73Gs2rdlGSObzblhF+3uOD+TnqO9mS+VPfEX8WlD1wxkVN4mwnsCvXyUTvi34E
         bgyIb1RXxraE++NSXcck67LHAnY8o6qYe+7c02jKUm/9PtfG6p+0JTJC/y2cJm1OcyIx
         WheWRKls1gH33Q4VIvSRVH/2PPIt0pWAnNZo1fk5gRx88imQNTnQAJLn0+oFUT3x1G5U
         ylayHKdxbzcTlFp7Vmumlvz8yObAM2JN7c3a8TIZoMcjzoS3bIByBjXE5RoZVD0QNsmc
         diPL6vMbi5O3qlHMcyJDIxhjpceREgFcKiKxHNqI09f0tU4pqlOAKIOvmSy261ii8099
         RdWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGumkyWQMdH/u7ISoqglHmsCnP5NjzI/2ndw4TQZl17Wq6ManTS4t+stHSQdgpnap+hk8TZ0gR9yZo@vger.kernel.org
X-Gm-Message-State: AOJu0YzWS9Ed1dg6WQffBHyWYfUjgm10D8kznEOdZUdhV1ZoxuDtg713
	G6N0iq3aOxUBLDQ0u8ryrGk+jOPUcyA2CJrWdQsyiQHQchh2rFDrMewD
X-Gm-Gg: AfdE7cko2FYKfmcuWdFIHoG3o+5wGeUQUSgrrS1OnVQzOwBmRz+18EvQNKhmRa/C4FK
	ewVrc0aom3VmGo6ZLzfzTqQv3d4Z7QPgYGMRh/zLcfk4EeQeD/6zIJt4rkAt7Y7N/oBLnzrktLs
	skLbg/5jp4jpfSC+XhSukPIOeBpFVyHTJK/x1t/64eqmm3J05nJjTd+xaRfNFqCzAV1CYBKKx0r
	Jo+YPmgWXu6uMiGAEUC60+o4cTshRbCP9I2iDF+3ptEc5+bvYmTL4DJXfTdPumoN6GQwIDDquw+
	44aW7hg3u7IpepzNcL7p7Hjdge2W+ro1RIpq4iGDOWrSpybmJWixudykd67ufKSBA7Sk71wVF5h
	AnmuXfpa32oIpQPGDZB+vWVZdFaPdWFhkedMWXUTCTmynuugENrQc8g1BiXb76toATEckhUvP10
	PJT4V3mSf+bZetUA==
X-Received: by 2002:a05:6000:2084:b0:47e:4379:a4fd with SMTP id ffacd0b85a97d-47f6230e6e8mr3191f8f.19.1784239246369;
        Thu, 16 Jul 2026 15:00:46 -0700 (PDT)
Received: from strix.doe.home ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm29949056f8f.18.2026.07.16.15.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:00:45 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/13] ARM: dts: zte: Declare zx297520v3 CRM device nodes
Date: Fri, 17 Jul 2026 01:00:11 +0300
Message-ID: <20260717-zx29clk-v7-13-50abfa8dd594@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 7:
Add phy nodes to topcrm
Remove syscon from matrixclk again
Adapt remove now-removed extra clk inputs from matrix
Add reset to LSP
osc26m -> clock-26m for the fixed rate clocks, likewise for 32k

Version 6:
Add syscon to matrixclk

Version 5:
Re-name from *clk to *crm
Add the syscon-reboot node here because the binding requires it
Re-add accidentally dropped uart2 IRQ
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 92 ++++++++++++++++++++++++++++++++---
 1 file changed, 84 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..b479d097f004 100644
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
+	osc26m: clock-26m {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	osc32k: clock-32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	timer {
@@ -70,13 +75,82 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+
+			usb-phy@84 {
+				compatible = "zte,zx297520v3-usb-phy";
+				reg = <0x84>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+				resets = <&topcrm ZX297520V3_USB_PHY_RESET>,
+					 <&topcrm ZX297520V3_HSIC_PHY_RESET>;
+				reset-names = "usb", "hsic";
+				#phy-cells = <1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>, <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "mpll", "mpll-d5", "dpll",
+				"gpll", "gpll-d2", "wclk-osc26m";
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
+			clock-names = "mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12",
+				      "osc26m", "osc32k", "pclk", "tdm-wclk", "dpll-d4";
+			resets = <&matrixcrm ZX297520V3_LSP_RESET>;
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
 
@@ -85,8 +159,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>, <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +170,9 @@ uart2: serial@140d000 {
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
