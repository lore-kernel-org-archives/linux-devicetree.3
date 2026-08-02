Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C93133F598
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702910; cv=none; b=MVwhPQruIZh+/fOHzHNbWBCcloO9ZpMkhnt7r/i3hls6S5iO+m0H/gDewl66Z99x6ujOxrvgByi8shrrmMPXD3Su+DdiSpV9MI68c5O02+YTGJGTeS0QMwLM6uTv4JhVqkhLk4D4t01e26a9BDkseJn+v+rhc3Q/G9duXaONX7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702910; c=relaxed/simple;
	bh=IpNPrcYTLAqFJmETJtmAVtdcREnzQQbvbMDwDDk/4OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OUDxUmTrFRp6t25LejufK0W5eQyeRb4loHSW78xtV+FLd4XS9Waqy32L9bO8Wd0iiY9pJ0q3MNkjnJB4a32g2VbaqNCs2/b3WNSEHvcNNg2STQ5Vk8lmjPVXIaZAxEeFoLqhRfBwErdVLx7qgilAJ7KoR2VxnDswha2Hl/zqZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSRvVVrR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSRvVVrR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495437bb891so10672775e9.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702906; x=1786307706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvzEYaG5KL1DCfKUfT9u24qjpaGL2kBtVkoPG7vk0nE=;
        b=XSRvVVrRCXer1VctXmQgdsR+jKByATuZPaeq6qnM7NtBccbF0JwPNi5SGkCe6Rh4Av
         G9yXsuehUMwqoW51JXVBJfNFRF1khuFEVOLmaKZyuzHTMO3A5+lM+wwGfuK/Z/8MX2gF
         OIXitJH72RPi2qS4+Dzzpy0v6+98l5FkwLHH/9o9VuTIUpnoubE0RM5JiIiOmN15+6vb
         f4yvRqeNsljwAuIexijzRKzRw7kTVL1GdUSgjkbyWZMmWP6mocqBKbDQGP0OUIarx/bF
         EYnohr/9g6qEaBWPylHlzxiEhABr4CCt5kTZc7QyblN8WD9d2wkNHMUPGUfnwDyt5k3X
         ZInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702906; x=1786307706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvzEYaG5KL1DCfKUfT9u24qjpaGL2kBtVkoPG7vk0nE=;
        b=VKEmYKtT5idBK510kVfdbqb4k9sFVLXWWqMVedeQQ12Lj/8/BUNmYAbK4lET3bSMAF
         sJ0zdmhoPrFuGJPsaGNlOUjq5Qs0mmbGryLcsyDHb7FvDaqurcwOe7ppNZUsl4hf1wtC
         0PvnND9xfK4p51vM7UvTgElLiZEQEAsQpMaLVG1Bun7P53EC3sGolJUnSWpN73n1B7Gs
         rwAAxN2gMDKH1p9oC++UYGx8OUosZD5rnQsnjqzS2y8WOwbbM8hwb7v+2HMyoW34UG48
         hliZCC5SeZSnHQrTzo61yc33obay/C+BBvLwXzj47Sfk5zSYl/PDbX82nlyJe8aVItes
         +ykA==
X-Forwarded-Encrypted: i=1; AHgh+Rpd/WYvm1J2RYyDIYZQXvlSU5MldPBIQrjAmSmWRUJmCG3D56R71BzUMrgy4XFKDuvXG4WBCJziqQW0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/2X+2+kzGnX9nMsePGvp+TFgQc2aNkJ9JzoUPasgv2bHgxdJz
	YBtNCtFpOoTaoL9WMCEDpABM9ng4ojpETr09PqQXfoK1c83LXCJXnfyO
X-Gm-Gg: AR+sD11fGHT3oAzms61nslsBPjQhUDbks9uM6DoDwot/l/pu6AwyTjtHfDkjd/sHZZ/
	oBp07QR5J2+o9bUNPhcQWycChA+a0r97BdUM/azK/FLuZOCdWbvTWqkZE5/zyqdJbD51FQ7vjjl
	EUE2qd3U6AqAFw8vVYV8nyWLIGyEgraxnEA9XJjxTP8gfix0A40fHj54sVSfVFwRLEftjKE52Aj
	uZITBXzjDw6MRLAviBt6AeV1yj7YaKXrHe5eKucCS7xmSHIg2av3lVRjjtA3O5z6FDYw4XN9MHW
	qM0J5FyZTxDj66oiQ9Qp59l+LxM9dtm359Yd7cthf1fpA8DtpAgUj93p5xyi0O5imveulZCx9I3
	/kqDyQ2uBGnt89ViZ+E4j/wsOQN0Dwb3w+MXK5EDFBFXpaOLGfE8hIUtprOMAPFOYchlXoHvxcH
	ZrpDRRF2jkhITK/AVeXdZH135DLSIV8x9wgN7wyBtFZlkCR6Ka7eJrbaC+7V96T7CV13OXbYDz
X-Received: by 2002:a05:600c:6298:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-4980ebc216amr136052085e9.9.1785702906383;
        Sun, 02 Aug 2026 13:35:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:35:05 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:44 +0300
Subject: [PATCH v9 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-12-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5251;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=IpNPrcYTLAqFJmETJtmAVtdcREnzQQbvbMDwDDk/4OY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6my4F5YNtlLMJvdd9J/r91nVBhltsGymwrZK
 o2xEn0+CvKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIWmBAApDEIYa96wbF3yvX0uqVAgKw6wkqgUYn
 8vhEtTrLxW7GM/VBsxk3ML3zaZMH2jKbBTqu2IiTxdDyDMRobFtEOjVqWE2u9FdDge6kiNWpDVv
 gUOotksD035n5N9tkYjARluu8hIEALSa2ZoV5IfqGViwCpP+WrlA3cjw0efI+ZAL+wa6otZ1mAM
 xroBhWmLkbrvflqiMnXfv5k+ZshECo1xpQTGU0eSklH7pOCtVJ//ExjwktCfDYf7tRiEAw6LCda
 6gUs2vUN5RnsLj6uAPdqqxInmxW9EXaqVvpNNcmeBa+8TCjSNxeFmOYIOFAZnY3vuoIJsXJwUsy
 PxVp242pqAuG/5EFwjTUl34GGaycJTGEphccECSpg+6Mimf3Wu2tbbBAJFeJ86CLcq57Gv8Xpkx
 ll93oxgU6u4FZ4tV7cUWduODvfpxHN2/tEgQwZL6JZW5tlliiMTrBHSaRkQmRxbjrsKm/W/Q01S
 AeqgLelaNL22KcX3+GsowLDkj6Hirm69uNzfNcpsPO3WrcK+VGhGZ2NQ95q+jQ85f5pWBMhz0QZ
 gDWxMGzjA5k79gXtI3tpVlzoaO3FOfRjPLoo4a6QrZbt0gxIgKPVaJvPXttiIatD7xSnD+iHiWg
 rKB7Ph6c+63MX4LufRZGxltAXjPEL/WJYZGJtqw168MOWxDCGoMU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 9:
Sort new nodes by mmio address
rename syscon-reboot to "reboot"
adjust to changes in bindings

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
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 81 +++++++++++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..579ad45028f6 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -3,7 +3,9 @@
  * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
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
@@ -75,18 +80,77 @@ uart0: serial@131000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>, <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
 			status = "disabled";
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+			#reset-cells = <1>;
+
+			reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				value = <0x1>;
+				mask = <0x1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			clocks = <&osc26m>, <&osc32k>, <&topcrm ZX297520V3_AHB_PCLK>,
+				 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>, <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "ahb", "mpll", "mpll-d5", "dpll",
+				      "gpll", "gpll-d2", "wclk-osc26m";
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
 		uart1: serial@1408000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>, <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +159,9 @@ uart2: serial@140d000 {
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

