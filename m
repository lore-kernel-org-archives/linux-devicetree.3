Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547D7394788
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641659; cv=none; b=hp0QLsg5fNUkRl9sqTdk5g9eFRFf+Of6wxnxyj6nP0WT51yl5X+LgMS8Vww1QmuAzT8i0JTx96nTdkAcVcyvX1+d9x0pZAaHaxAcAGh1+euCkbLNqvMvuVsG3YaUnodpxyerNuJs+ShuUCWDLSgKPILu2fY1AjaLTC0a0tRPAko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641659; c=relaxed/simple;
	bh=WCM0t2tSpKbIjViogFh06SwJ0ZwBBkr30bJ7ePaJsf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nP76tHSe1w0wrA1nhO6AnHPRXDe/+QUAJzF5JWumsSMF7CYbKOrUXnTBX0LynwVU25HqH7DZ8Q2TWFcEb0KmMYXiTT9DJLQfaCEoPhpozlD0QmrOxqFYYOdR7E2drvHKPPon/5j3dym/La1dBtu/8ZkwPgtB5yE66Qj98I55DFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k18+5I7g; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k18+5I7g"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso62623365e9.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641656; x=1782246456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ltlo+66CbkzQq4Lsr4cyfZ7a+2/NQVI4939KsTGc97E=;
        b=k18+5I7gyirNJQGqxBAD41ARjG3k3jceQck30BQMSQRNe0Yb5FB5jtqvc1mmfYxbav
         lbeCdVldE04+BLc6syy3wDu6/39PDWGowAaGh1vXNO0A/FJ3kWInDUKITDBgv6ujtvGh
         zDOvNCAjC+lmEOU4Sj1OOHuY/k14k0Rh2eZvL/Kkem2p6tFoqfjaTVIk5auHvVtEZVoK
         Fbw3UIjkROfk2i6Qek0VfNBkE4hG+uU3u0cIGdVFT726+sR5ShAATnpdRWMvoa3ID2b7
         GXN/RiTdyO0jcTRl9DPENawVLp9UMchsz45nMtXtkmSPjtnq1fvvfP+Ge9OwLApLLheD
         36SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641656; x=1782246456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ltlo+66CbkzQq4Lsr4cyfZ7a+2/NQVI4939KsTGc97E=;
        b=oNWgsswBdEUVXGLWTPvYXPbS/0l6t9UgAajSlLAVnwI+uq5KsQlYbUt6g3jIBqiyTv
         WgZ3IPqtHQPoHKOphkLadIGVikumt1lGtfcpSzhCuF9LNG6TsvmP1wfut8Iob3kzWFRM
         pqlXGxnzXKo3ga+vmOZFjeBY37MjaI6kpotaqK/z5/XMFvnPYovjMlGYp6jG1Vd6sU/p
         JCQifW/ERDKZ7Z5w6l0hj22FHvlarjAeQlLqR2DG3U5NAPogxpas+voT5A50uXGoJW+D
         o4whuCidxbWgXgrtl93+3UQXEDh3O5u0Mw0UUfR4cvUIktuB3gHsmOngaq9JTaRhKeKP
         aGug==
X-Forwarded-Encrypted: i=1; AFNElJ+5zBFGf3zPCze1XsFL8dlDt/AfETbAOn+vya5y3b4fxl5vqHZN5eoDMbDfFu5LYOjN4iyb8jQ801Sk@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTBUuUJhyaA0hPEhx9D8CrskpT2xYMljVLqh5gS9tY8me0VVc
	xIdObvCXTzeXIz4kdFMaVl2KyeEfWtSKi5/6GsXl9s1wvzLK3US7SgiH
X-Gm-Gg: Acq92OHqRihp/TkA1Fn4nyU/BxaavfaQNw9BLY9/NyA3j02j2f6MUA2qy1RUKZwMGAX
	u4hqnHdOZJjTpMtotm831MCZTRwatV52NPzoyO0/S3Ji0Zl+hMSxKE81L78heFU1dF4JH3BJ8xl
	hMevdMl9nnkCrDbVoHZjfJxYBGfqlPk7ASE9CJMZepeN38Uxn8oxtM15U4a9ze4XB5+1rGpq4bo
	QNdle6pqVRVn9OGD4pHQSO9X2GC27LCSYlseH4OUGZIoKfrobZFxkd++Ghwzj3kjyNL3OdM+1Db
	eM0ZJfHjHrO8C48M9IoOMcThqLqW3V4XOmvp+kChO/U8PgPb2ffJoAi4Fq13GT2q1jq7taDWJqJ
	SjBPNgiS5ylkchlTDu0jrnhmS65vA5txUHqE96Rnt6aZ+OqniMcxVKjpmf8a7QK1UBeCD+Rcxxa
	SwnRAhiSR8/6dOgw4nFe39TjF4e6gVheP99A==
X-Received: by 2002:a05:600c:a104:b0:492:3347:12a9 with SMTP id 5b1f17b1804b1-492334712camr12197255e9.26.1781641655477;
        Tue, 16 Jun 2026 13:27:35 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:34 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:31 +0300
Subject: [PATCH RFC v4 11/12] ARM: dts: zte: Declare zx297520v3 clock
 device nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-11-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5713;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=WCM0t2tSpKbIjViogFh06SwJ0ZwBBkr30bJ7ePaJsf4=;
 b=kA0DAAgBPRO8yFRPGiIByyZiAGoxsYaiDmVa7tF78rIc/+Vl7tgrhQY8mQM5Yh4KGvxwiGHNr
 IkCTwQAAQgAORYhBEMW9LaqBVsnlTJdbD0TvMhUTxoiBQJqMbGGGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMgAKCRA9E7zIVE8aIpRhEACvKmqnDur7+8kPrK12EWu35XXeLXUinVJ0g/4I8QB
 ZqBj02ZtosMPs4FkVtdx2+9/iGDrf9cBcLN+YkzllQ+jP68E7Ps8GILZx0GqWZlMv9CeFz2DPZV
 AnwkfeuL4/9GF6rQXDdkaKa4bp7IFgnzkjvdgGzn4/TLoDQO0/YctobzHJZzAbOWra2gmdXqDuT
 G+RaSViXHnZZMjxB/UfBut8O/3w2IYUSnU7dnXCnAGJRMxoljKzDNXLSqzptpnvdQz5phTA3pTX
 nvk6Z5gDGgW0i1uCm+rwmBCUuZJWiFJ//A+Y1EcILgxaCsyP63gaxo/EMRKl+UEcLnxXMzB0vaz
 pWGDB+rOZwj1HBzc3khtcL68RO4CUHvAKlfmljai3o+B/RYrKRw9gu/TGyKkepDS2+xi5OzbDCp
 GCql6zX8Ig0DxNiU9RQ92P9Z5vcU1m/w2pq/UXy9xPUKluH50vKAQiXSTq/E8OnDMdTzJ9t1zKJ
 TapBwT+kd/UC/Ycv+38ci/h5lzKA/KkVkieL/1HR9pYokYpe/9sYTH0OEPmKoKD6rlegWD+s5dN
 wt104eqgKg3dZbwmXZ+cwxVO4W+Q5qeG7CkTrE+jOJ+1JTiwbapHBqL2SUyy/EAOoqW6HBVDKZM
 Cf4s78AXtxPhTrBhXYqLgUqvYTcSXtutnCoEMVmWDrg==
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 90 +++++++++++++++++++++++++++++++----
 1 file changed, 81 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..a2b6909e7434 100644
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
@@ -70,13 +74,80 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
 		};
 
+		topclk: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topclk", "syscon";
+			reg = <0x0013b000 0x400>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+		};
+
+		matrixclk: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixclk", "syscon";
+			reg = <0x01306000 0x400>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topclk ZX297520V3_MPLL>, <&topclk ZX297520V3_MPLL_D2>,
+				 <&topclk ZX297520V3_MPLL_D3>, <&topclk ZX297520V3_MPLL_D4>,
+				 <&topclk ZX297520V3_MPLL_D5>, <&topclk ZX297520V3_MPLL_D6>,
+				 <&topclk ZX297520V3_MPLL_D8>, <&topclk ZX297520V3_MPLL_D12>,
+				 <&topclk ZX297520V3_MPLL_D16>, <&topclk ZX297520V3_MPLL_D26>,
+				 <&topclk ZX297520V3_UPLL>, <&topclk ZX297520V3_UPLL_D2>,
+				 <&topclk ZX297520V3_UPLL_D3>, <&topclk ZX297520V3_UPLL_D4>,
+				 <&topclk ZX297520V3_UPLL_D5>, <&topclk ZX297520V3_UPLL_D6>,
+				 <&topclk ZX297520V3_UPLL_D8>, <&topclk ZX297520V3_UPLL_D12>,
+				 <&topclk ZX297520V3_UPLL_D16>,
+				 <&topclk ZX297520V3_DPLL>, <&topclk ZX297520V3_DPLL_D2>,
+				 <&topclk ZX297520V3_DPLL_D3>, <&topclk ZX297520V3_DPLL_D4>,
+				 <&topclk ZX297520V3_DPLL_D5>, <&topclk ZX297520V3_DPLL_D6>,
+				 <&topclk ZX297520V3_DPLL_D8>, <&topclk ZX297520V3_DPLL_D12>,
+				 <&topclk ZX297520V3_DPLL_D16>,
+				 <&topclk ZX297520V3_GPLL>, <&topclk ZX297520V3_GPLL_D2>,
+				 <&topclk ZX297520V3_GPLL_D3>, <&topclk ZX297520V3_GPLL_D4>,
+				 <&topclk ZX297520V3_GPLL_D5>, <&topclk ZX297520V3_GPLL_D6>,
+				 <&topclk ZX297520V3_GPLL_D8>, <&topclk ZX297520V3_GPLL_D12>,
+				 <&topclk ZX297520V3_GPLL_D16>;
+			clock-names = "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3", "mpll_d4",
+				      "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12", "mpll_d16",
+				      "mpll_d26", "upll", "upll_d2", "upll_d3", "upll_d4",
+				      "upll_d5", "upll_d6", "upll_d8", "upll_d12", "upll_d16",
+				      "dpll", "dpll_d2", "dpll_d3", "dpll_d4", "dpll_d5", "dpll_d6",
+				      "dpll_d8", "dpll_d12", "dpll_d16", "gpll", "gpll_d2",
+				      "gpll_d3", "gpll_d4", "gpll_d5", "gpll_d6", "gpll_d8",
+				      "gpll_d12", "gpll_d16";
+		};
+
+		lspclk: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspclk";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			clocks = <&matrixclk ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_PCLK>,
+				 <&matrixclk ZX297520V3_LSP_TDM_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_DPLL_D4_WCLK>;
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
+			clocks = <&topclk ZX297520V3_UART0_WCLK>, <&topclk ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topclk ZX297520V3_UART0_RESET>;
 			status = "disabled";
 		};
 
@@ -85,8 +156,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspclk ZX297520V3_UART1_WCLK>, <&lspclk ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspclk ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -94,9 +166,9 @@ uart2: serial@140d000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
-			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspclk ZX297520V3_UART2_WCLK>, <&lspclk ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspclk ZX297520V3_UART2_RESET>;
 			status = "disabled";
 		};
 	};

-- 
2.53.0

