Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FEB39E6FD;
	Mon, 20 Apr 2026 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776686313; cv=none; b=pj7tX3/vVVRcl7MFmFK2IlkL3csmyfxGn/hX5CMKIQ9yE9LAEDwPmTkTmrG2Alwlx2/hVoy4Njw1jaNjpAo/F2ttWxgSTddfXszMklErMNSjPiCNFmaysyUwxjNJWnG7NYkdJfBpOIX5XqxX9SY1un6a+delCVZehDew/uCPaqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776686313; c=relaxed/simple;
	bh=1WmAgn/FyzsKhMv+YbDwDX6oHzK8g6LX2ZrR/tJNlRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0mHSNRkDnJdjuC22P5G38pUbugJVm25RD3xTyUo0pD0AQVQnL6uV58FKywkmUwsbA6aWuNjRzX/5x/3s63BUnO2Q24DrD7jcubr+qKMvsBA3ezFWbwlIwv4jZcDt+wXienxP/xx8rzYJ18bRc4MsXon9FYh3jLmfKzx5uMEgcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=Zq0lQpL0; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="Zq0lQpL0"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776686308;
	bh=1WmAgn/FyzsKhMv+YbDwDX6oHzK8g6LX2ZrR/tJNlRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Zq0lQpL09erDcI35QsWMK54O4QwcsaBe2uGoQdyutNGi53llGlJ21VdkkRI8E9BHv
	 9brYw4ssMws8HsGwnojT6P6s18STJJ7mAQzwoOOBblzHgAm+yr+9YNrUIkUxukDtxm
	 GDR5d1Hvoe5qWUs25YFedYj+A3xnzliLjTXLnG8g=
Date: Mon, 20 Apr 2026 13:58:10 +0200
Subject: [PATCH v3 2/4] arm64: dts: amlogic: t7: Add UART controllers nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-add-bluetooth-t7-vim4-v3-2-669cd2530ae5@aliel.fr>
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776686306; l=3650;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=1WmAgn/FyzsKhMv+YbDwDX6oHzK8g6LX2ZrR/tJNlRw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP01c986XK1M73imz/pawPqggaTpTWUHpjx/8+Yxoykf0MdHPg0ep6+sR3mPTxJBfkWZfnziwOX
 hld/29NENvAg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs

Add device tree nodes for UART B through F (serial@7a000 to
serial@82000), completing the UART controller description for the T7
SoC. Each node includes the peripheral clock.

While at it, move the uart_a node to its correct position in the
bus address order (0x78000) to comply with the DT requirement that
nodes be sorted by their reg address. Complete the
uart_a node with its peripheral clock (CLKID_SYS_UART_A) and the
associated clock-names, matching the vendor default clock assignment,
consistent with the other UART nodes.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 61 +++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 4a55d9641bc9b..81c26b1e3e7a4 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -577,13 +577,6 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
-			uart_a: serial@78000 {
-				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
-				reg = <0x0 0x78000 0x0 0x18>;
-				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-				status = "disabled";
-			};
-
 			gp0: clock-controller@8080 {
 				compatible = "amlogic,t7-gp0-pll";
 				reg = <0x0 0x8080 0x0 0x20>;
@@ -713,6 +706,60 @@ pwm_ao_cd: pwm@60000 {
 				status = "disabled";
 			};
 
+			uart_a: serial@78000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x78000 0x0 0x18>;
+				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_b: serial@7a000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x7a000 0x0 0x18>;
+				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_B>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_c: serial@7c000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x7c000 0x0 0x18>;
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_C>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_d: serial@7e000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x7e000 0x0 0x18>;
+				interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_D>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_e: serial@80000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x80000 0x0 0x18>;
+				interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_E>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_f: serial@82000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x82000 0x0 0x18>;
+				interrupts = <GIC_SPI 173 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_F>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
 			sd_emmc_a: mmc@88000 {
 				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
 				reg = <0x0 0x88000 0x0 0x800>;

-- 
2.49.0

