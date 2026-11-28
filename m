Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850177;
	b=mYsH8Pr7DTvSAXMsVBe6yqJtjTr3Z894++c1NYAhauLIy6yFQKqJost+JCatPT5NSYum
	 5riQ5i0JW8yIrh4b8mAUMSIwk3GT3h2ARWqnf4CpcNnEqnQPDq5Slkx8a+s57eluarTpf
	 tvojmYgZSNy/BXoEtEp5pg4QX2vozmJmaowKhSSJ+BpFfNl/+U/xRuh4f0PrbIUzIO9JK
	 kZlHhdKjhQWSsqd+m7hXrsLOvEEy87C3LfdPOPLSEavRx8V1HKZxYG7QHM0MKvU5Q/yRe
	 ap312q7lSBE9KPfZ/Vokw4yyK/t69pJy9FnUlJeBxPQTjuCWDsgAzPUvDsA/Ix3akKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850177;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
	b=XkDlo8SPctPqx1zs3RMbBOyjj5gMwfV4ZOheQ4L+5RT7E9HoLwDdBxLgnOA8Aqqls3yR
	 MScypeJgJqsCXxU8mgMmhbYwR/f4e0tDPhROSBq/ECm0PZImynqqrFhBBRxGsWHpsV1sT
	 UFgyxt8w1G3P5KV6dsyb9JoywJ7gGJs7D6JVxXVYgzpzHgj5z91PD5wBUM7rNE19jdCVb
	 YxH7mW5JmAg/iZna3SAaI+8x7ddfWzeyqOE/dP9Abc3JkLgV+ghBu1XHP+OBRpDwLu0/z
	 zcxsX/iWfRa+wFLafMCy6gqfMcXl21WlTXYZTDyfVWzxUQqtEJvT9RL8DKlroQ/h0Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD201606A6A2
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD201606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so82957685e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850175; x=1796454975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=gmrjBv5pYOf+DkA4XJSDC/I9j8DyEBbIQIRvYRFAqemNgl7rTwMAT6jfe8BfV5M2HA
         NvCUrWUYB7RkL/MEGUlbSSzbXm9FTb5+7QWLELTJBGcLThX99u8CfIACYX+AD+VVvp2P
         XLWptuL6P7pdQTK6yqV9s8lss+aRm79yhkfUIvspnKBtv45/Wn3oc8hVI2tn96LZU3Eq
         2mvj/R9lJmxVPnpBfM/kT8fmqi2fisVJUQgscH8UD1hRxIesWoENXMc7TngMadQUacSi
         C4A4cVvDQiyaoDLrrCJpOza8a2AaFcHVGJLiOVqDb3Z4wqmiOi2IJOXHQ3I5eXSuGWhG
         F4Vg==
X-Forwarded-Encrypted: i=1; AL+hErELzQms8wYpQNmJj9MAMncCKXYHErSRbVvYttnTMUfWZJjv4BPjUDDq3oYzYKe27Eel5+wBV8uNGTpb@vger.kernel.org
X-Gm-Message-State: APuU4Z9UVDzXipqYFIQTYTuN7KAK7udlbIns9wWN9HBpZJyMlfaIZ+k2
	ky6jajWi6f2aAT3Tpoq1z4ODgTM+8MFqXK1ZzlPRnscjnNGWdr68m+BX
X-Gm-Gg: AZFdTZd4evRiUkMRYnHW+hieFB/pnAbMgJwkPGO3gYrA0fm+07z+hZl0Vce22Yl7GoI
	mlE5gYK9qrim3G21i7rTRIyWydAOGluF3jbY9Lofz18GiiKzY2wPhNCoB0BoWeqjcxjgoY14M0T
	Wr1TPBUe5oNDiD+8ENmVPlGaaUU8Hckh8mweX535EOXammgL2VuGkq7Yi4cKL0E+HWPceugRk+A
	R+jNaY1kxJGdtGK3Swus0sWmIa9tsOVhoKAzqRgfWJ4pyGAuwn5ahM+yfpgcwCvdATIhZzoAHP5
	uipVshljcP45pfAJle3GTwTnZ8JUjmx0hqj61T39Y0MV+/i9kNcbWuF8+B2l6pIkFlSpTqSewtb
	6Ec7v/OI2ivGi8lrkg88BuyXAmF0irNePk+DV6JbG8Qe9Oc7dH7xjIlwehMSvaqGuDuK7TNNgg8
	vO3QH7r7SZl1AyagtLuRR9M+e+OWuO2KetQP+9eAGEsJ7eOdkKcgAAMvQeaaLmrvwwCOX7shCV/
	yPEowSzv05/frq7r+xj3GLV2c/3u0A/UduFpnP3EzpRtSWcTZUDNwziO3Ge+tSXNDX6MiedU9dM
	SUeek0dh7OW/3/uon+2/h2rg1b+lCXg47atsbFRsqlc+rdMraqaQCzaW9/V0vtNNN9B+eEPly9s
	LKZwjcUarZ3tyKq8ClxCs/56U
X-Received: by 2002:a05:600d:1c:b0:4bb:9dbd:feb7 with SMTP id 5b1f17b1804b1-4bb9dbdff35mr278936495e9.9.1795850175157;
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 28 Nov 2026 07:16:09 +0000
Message-ID: <20261128071610.27855-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoC has a Synopsys gigabit MAC, glue registers for the interface
type and clock timing, and a multiplexer that points the management bus
at the on-chip 100M PHY or the external pins. None of it was described.

The controller reaches memory through a pipeline stage with a gate
nothing else claims, so it is switched off as unused. The
glue registers share a clock with the multiplexer, which probes after
the controller has programmed them: unless the controller holds that
clock, the writes are lost and the port keeps the
bootloader's delays.

The multiplexer and the on-chip PHY bus start disabled: a board enables
the multiplexer with the controller, and the on-chip bus only when it
uses that PHY.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..eb7f46c98b0b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+				 <&clkc_periphs CLKID_SYS_ETHPHY>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline",
+				      "pclk";
+			power-domains = <&pwrc PWRC_T7_ETH_ID>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
@@ -645,6 +670,39 @@
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.1

