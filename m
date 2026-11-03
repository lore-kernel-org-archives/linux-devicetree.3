Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723845;
	b=pPiac6+r8Va5O2RQttWRe0N/QbI3eoRpvQNzGf5OqupAMBkjtnoUSV242sLWS+ztGSS6
	 F/Di5h+i8bHr5YrENPafwmYr3vU8Xa0t5/9tIHbOlSvAlJPiE3BVTewI4KquGWZBKKtmk
	 WcAncxToM3lwMT+cnrPLp25V+VfNXtTGun/0JcCvb7pQbcHu3ltxhX4jTGjRocY48HrSC
	 CY9Ue31Wthua9McM0Q2OqF6z8bCtY8XDwOhEUUyBPfEzw5R15hjVuGUqEyi7aQznpMGHV
	 PxTBRh+OF6epvJ2yhiex0O5BrFBgVCGhGYCtDqjWsYACSBno7mSbT2g3KwB1EkpiT9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723845;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
	b=03xBJw2Ymnu0PIXvCTbt4KzLs2Qsv5Ue3bfrnZFusS9pOq3KX/cu6DgQLe6Jn8Gy8AIl
	 NkH+62yFG0sYwztvLO7JFPdERSdlWCg7nRpZVyudLWwubp7cpY/HtEX0UBTKDTAfEGFqR
	 W5MAsmJVSwcpZ5Xr0CasVQkPJ3b9eLNzmWeWuVPcjsX2FH3TPTn36S34rD3ihrzwAcsCx
	 uMOs+c2/mL0djz/wQ0ZUaA0aTxZyZo4DIJaYS+GME8jqABefeQ9duun3d+hiiokCu30Nl
	 d4wVnavBWNpod0FDgOHSJ+OB2bqbhvqgpeC+Jey/JVI33ff/7P2pIl1qv5VpFFb+ACw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538776082BCF
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538776082BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so28463555e9.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723844; x=1794328644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
        b=AdydZ3Dk2IVcxI2+qrB+9XI+kuLQnR2xt0/ENeGCj/Q+TUflVwP/L5s8ZOHowxMIO1
         XcfINaQ6wSRJho8FwvufCrnyzYZyYodr072s99G8j4hNdJJt990mR7WbgzUdqaVl8y6s
         5AP4jCnUy3lrY8G+MxN38Ua0P+TXxbRMGf1+/ML6JdAkxIdRl0wrXz2RKXjnnqpB9eRF
         yQJVpcdI0XTIf7MByy3VG7uTPO25T/tcMXk1OT2DNUfE0eO5EoNf/9vDEEjRz/N7orfz
         nNvnf/rT0CsyOgROEYp0UF/E7aNTrHENRIZklnq+TCzG4K+w5y5HwHROxeFfy3tK3fAZ
         2s3A==
X-Forwarded-Encrypted: i=1; AKwUvBy1mqHMqNrr7+vY2SAYqRbWKsOCvZceNbGiI3LRYpnRARQIcgmN5v/QHLbbTf9CBTqI326vWjnYoR7A@vger.kernel.org
X-Gm-Message-State: APuU4Z8gtX1bsrV+ayeWL23dAwhMbfRJOJ5BpuQ2EDQo2WYKX3BU9iCB
	aDG2p8rk+LVIPa5RbfPQlgORQF4jqXDrw1nThGxHRkpqyMm7hP4ry42J
X-Gm-Gg: AYBFou3fjxhBfaxVc+fGc3jX88Vdmu7y7eBnTH006EF4r4IHs5i8JHkpdb8hDXL+3Rx
	CkoPMzGC65L1EkdsE6DbneRVVTRwZqNgi1ARTL14bSLfdkXboO+DaUV+55kp0Tpv+r+FJKB8oHG
	6tlFfuWulNe+XglJo0b3qMacTuWUq2GE87r3UztOnN65HNYtdanRq4VCC4gyLU3VzeiVvo7GiWa
	8JadTE3+/vXYVgoWMhA9aTMEvRX4SJ2Jz2EAqUWGZbuI3UuXUBg/YXr2ni5i0fPPiL00jHcGjcX
	QupYBLpGYFREl30l5I5An1uQZBhuF5At1tbaG8Fo9OgVXNfHU0Wjm7MPAtw0hWQWk8OrOeX1q6h
	8Jtv7pQXbFqn3yILoYUiXszLbZUBs627kphWH93n1QMXWG21P0eV81DLjk0y5CFZVBjwljm2Vu0
	tdPK7iWZzXb8cCD8ILBZOkrHlhGyXWEcXjxWmaDVdCx9HgOhcGOlk0Pxk6OuJyyB4f1UKQRAmIE
	MAls5Zwu8//mwiUuErMFzO7OOMRdFjE7mpbw1cQNHVaTFyKbErxTmucQX2G44BTOo9l0reLbDaG
	Je4byy0S0lU4jLPeXpU1NnNbqr/I8lV22+EGALAxVHNfEmgl7zoaEVr82t71z0dKpkgkuAy6o2V
	fIn1/zFnqmmZ04mc9B9qRk5idew==
X-Received: by 2002:a05:600c:608d:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ac18b7dcdbmr311763505e9.19.1793723843721;
        Tue, 03 Nov 2026 08:37:23 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:23 -0800 (PST)
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
Subject: [PATCH v5 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Tue,  3 Nov 2026 16:37:14 +0000
Message-ID: <20261103163715.385394-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
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

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..f15fd8f6cdd2 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,33 @@ gic: interrupt-controller@fff01000 {
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac",
+				     "snps,dwmac-5.10a",
+				     "snps,dwmac";
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
@@ -645,6 +672,39 @@ gpio_intc: interrupt-controller@4080 {
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
2.56.0

