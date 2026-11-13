Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572341;
	b=Y2VwY7Uhdytt6JkwUiXp1DDvQrMvwFXvtJLZSECfgiJ9M44xxX0owv+WvVs/lak4858i
	 Tgd5289USBjgcC3e3FIjcRxRlu/W9t/2A3dahzDIby8eKuz8MKRd3qv8m/MO4rJKCzk07
	 4XGPzStYNaNPhADMBHMEwvzwUdMYqf6k0ua1jhy3iHHBROsDCN44v+eqP92RN9QWIn+cU
	 VR5juLwW6Tj3z6EvSRXKfM3xGF2uT0MJUqA+8LMQU6wnGjr332gbG+IorK9ezqvaGd/Gf
	 h804/hTKIN9ceKOjsnItgXoc6lrwMhtH4QGFn3KH9MyICSygwGnqp9FD4KUJVca/E1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572341;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k8LUINT1uPJGcPtj79NOLQhhl8W2gjYoDk+VmjrsPuU=;
	b=Vg0j+ed4iavoNUtRu889C52/r+Zg/tXWe7qLRnTF/rmLwtwu1Y7iW2abN6Qi7GMQ7qw/
	 HO/ovVc2fmDQjcTZqfYVZIDA11/aoiJwKxL8m2xU/Yfq7JsC+pjE1Dc2gaiWrp8OgxTCP
	 jWp5Mq40etr3bxXiFDZxEO1aRWWNqqxFkWmSh68SusKjCFAoCsSxMcwrTMI5XwMwZ8pjh
	 Ow78ggAAEhpebQw2nT4Bs4pp2lDueRtyCTUxKkNfU9uQX1Eeyf6zsABrvVQKRSoIl3VV/
	 W3vzHv8ZUjzUUHtTvqr6J7na/jEYX12rE35eCteymQpZyPu6rbQK0cioi0fpXmGqDpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB51460A380C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB51460A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-497614c95f0so390334f8f.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572339; x=1795177139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8LUINT1uPJGcPtj79NOLQhhl8W2gjYoDk+VmjrsPuU=;
        b=Y+M0Qnx+5MKKRwhv7vEpmPWmI8DtmpXNQyeOICHRfwkK2BpmMk4pY1jhW2R70uDBhU
         o6QmmtpGuHx+1LYA7RaGU3lbUCD+OUKVuXx+KI9O1GsYxanWy2G5pdiddNhBTp82waRD
         HvqJZS301AKpY2TOQyUeL6FqASKt/nI711uO9vQmw4fN5RUTXwFXwQb8r5oUz3MxpvR9
         xSf7AlqU9ZDH44WmI1GmAANhZ5GYFTAOMYQZAw1EQHdgndRMgTfD9Ldee9dOB7cl0xqa
         NHR4zsfRR9RYvw8LkLOagmw4a/KYLJKNvGqmLmUrPckL9pcq9C5e4Ko+hshCh9ugrrKL
         HDmg==
X-Forwarded-Encrypted: i=1; AL+hErGLqD/MRNYO98ae4+QZ1r5a2qt6b/+ok4bRxVZHzFyg+/JWkxcKHdKQb0hsF9HjaiKuiPMizti5DTp4@vger.kernel.org
X-Gm-Message-State: APuU4Z9Dy5KiOLq4Ym8BTa4zoDNb7u1BX6oZ6+S0nearcEF8HYE7q+vk
	++Xp+Jh+o0Mvo9+ANByp5+GeJv/LgzxFQnk9z+rzIXMNkbcFQV9DDt3b
X-Gm-Gg: AYBFou1b1T+YnXB7y7cJAJRCeBiOxlEJ69GymHfQ6ubTEM0SxQJA7l38paNqLouTP/4
	FzTPlvrmOTG3lKWnQ7baZkB15gAt21qKgHG2t7Wl3IPeuH5oI7CtuIMpF0Lt7mpdhpzVIDTvolC
	PFpKIf7NypS9F6Hr9OZxEc8CBV+mAjCUgSVwnWTYC6k1dleA+MMA4W1HEShzqYFVqu57CeGxoeC
	VN0Qef9UGno84cbka6Bxn7mS6+u/PrRc1ZOINA4myR0nGrodMiTWPI/PLCwGuFThZ/vcW4PXLfj
	fUPfHcw6s0wclhC2I/hR2yfSb++Er52vuj89hgF+AKWibHQSHCHXz4tIISMxvJWWUy5kK9PgPHr
	MyJsO/BkNOMUmVeAwwjujTyFYCx8uZ5b3y/kBQkWiydefPiFy8lHF9ZNfmZrUSc4rPbPdUmERWn
	wvHzKLZe7zsS2mqnD8wKfLAOdNoXb7+Yo9/aoiRqCQvHeowWTKfJeG9RVnR/03Ip2XnG7Kr7g0X
	JDn9jfT3nT2s8GcCA85x+XKk6ed4bbZpWPkvafn2VqGTHNKq1Xlp745ZtNw05cinHEcqt+HzHjj
	By4f332EO5poS6IC1BdLShXzys0w1sS5G4lDc7zJUfXbdJw/T2QDaIzXKzMs/JgWh+OgvN6HqV3
	JMXcZ9ConPE+jg1N7XrqdAVwm
X-Received: by 2002:a05:6000:18a9:b0:498:88f:14c8 with SMTP id ffacd0b85a97d-49c73259e2bmr5745745f8f.9.1794572339177;
        Fri, 13 Nov 2026 04:18:59 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:58 -0800 (PST)
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
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Fri, 13 Nov 2026 12:18:51 +0000
Message-ID: <20261113121852.334604-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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
index 7bd53ec16607..c6797688805b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
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
@@ -645,6 +670,39 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,g12a-mdio-mux";
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

