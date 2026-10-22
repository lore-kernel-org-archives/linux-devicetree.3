Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699614;
	b=2zWFcQ0RBo1NM68f7xGCQGf7D+uMgPaExeUYYVkMhtSG7K+2XL6J9BoucBZ/u+zHh3e4
	 6p8aSuxuiPXkDv1WyefkZSfrujUHgj2R2t6p0FI9EzSJz4wNHd6CZL3vOQRQQQogYeti9
	 x3V3Y478+YXyCztM4BtSpe8ND0bhiIHYnsvwT2xZ03EvnYitnAE5CqH+TQ2TOM8mzDS9s
	 XhznIKdoMv13UhHifUD/AgKIlikDQWfoggtHsSyV1YBzqQ5WeQUhWC1D5kthKKfE9BT8f
	 XBSpnyjGNWKupU+PTUVggyu2TOcqzZvM7ApZP8rKfaMoK1iI4s9WKW9wPqqTXlsvbNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699614;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ElpMWQpElxyvYVfod7vt+zc/cJPBYXPVQKctc5VqWXw=;
	b=R3mi+A/ifDbKRJzPLR5ZMgyj4BhhjhOrZwl6vM3CqNx5uQPlC4eB96cXwfrDmZKgsd4F
	 yKA2ZHfwF7tZ2Cd3OnQKW9uhmtg9tAyWYg33Owt18DUT8/X4EPY44K8eE9u/kl7nmNIwl
	 TE+8iYQxqZIaKI0mFcHwVzrxqTln2LHQzuhF2tyLv1z+wmXk6BONm/B9mQ6bSwHrVsVNb
	 cEAUGYlWZHQUVg9Hc6lepxgqdEzNTHQ94S44dmQG506Hn7HJy1ZO/43GZGTQXA2BuO9HQ
	 dWpk6b8+gpItj6WLfhi6fttTxHwgNt2xXVxy7ynA8eDQzZCtDbLkh0mltElaStdSE1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5160A381B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 20:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE5160A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20568c8c0so1673375e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699613; x=1793304413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElpMWQpElxyvYVfod7vt+zc/cJPBYXPVQKctc5VqWXw=;
        b=afloDaOMqpUVE3dyIXyFjTeG2a4ZOxbTtlVSDqRhURm3m3hKo8uXGPjhAWyPiTCIax
         XtYpxlgwbNkT71eFWtkTJ4xzDluH/qXfR1RVE9LGVWmGxnDcQnilkvflMD9Q7OjIReEy
         VGWcHTwv9Jzx1t6H/KzpsY8x24/nvfr/Evm6fdX43zJnBfGY2I1QpTbkjnP37bVYfYYZ
         jak3g7CrPnv4q42D1cvcOuCkxUMbNThBrvnbL4k16EgjuTtZkHmux7V8AcREh8t1m9z4
         bANrVmwvkcmKS0BuzNtf4UWcBlOFB9H6tnpOALGx7pzpupgYrIdTyklmOcl3bM1Rgz3/
         tlyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4j1JHj5mUzkV+md00SAhDGGdisqiK/beuhCa1YopI7MO8k2iTlu9LxSoiIeY5mQYPsWmddKbguPCx@vger.kernel.org
X-Gm-Message-State: AFq9FYJTTGBEykc4i5w+eO4xD89e2nZ3+7t91F4S7BspEyHpvtFrBaJr
	sg7z/CbljLe4KL/pg07PkphUOaa1F//jDYVRSTg8SCtsOW4li3NmgO/O
X-Gm-Gg: AYBFou3s/FFRDAtITpM4P5Hcw5W/svFlTM+4gurO56fb+5DdixwiZTNFGqz+hN4gbXu
	RVYJN5UJJqw9ZZ3fl1SswE9m8Gq6z2o/DhCCu2y3qunfhbnRHC63ds12vPtBgT5AeZbFTaFM2Wj
	9MhDdBPnBezSMgfHr/d8LWXCjSl5Q2zyTHB5Bxo6P0jRxSCm84f3QAYOTGb3ARXl1ytbfAYbnBg
	ukLdPgLEoUPyjf1nGAosU6OYEley2UIkRV5H3yJdqhuhN8IfxGdRGeszUbT1WNd23yAO5iyAUnK
	D5en4+LdRkci9lGXph17rmEZrvUKwHUg+6EZElYiyJPLthKy/m4sIu16qS2AZLXtt7PV3EuKaxZ
	lDjOHFZ5TbfKI023PLCNudQZR9b03EAZ46xZQ12ysZUvPAaY0Tm2s5YL56u2UKBFZwLGUadX8it
	ya8PzBhW8znzmXhcjnst80odyQkZcY/FWpsDBtl2bg6BCBzslJTXatj9Pdqj6n5H4x7PDDBHnDX
	eR9tm8fW3cCOPS9MYiD5amdRrCi7FjdbtabTBDEuQDEFLog1gyrK/9f0HEQWYE4SQKbQTM2Dio5
	o5UiNh6EeCuGv8Lz
X-Received: by 2002:a05:600c:4e43:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4a211ed57e1mr2298085e9.13.1792699612466;
        Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:51 -0700 (PDT)
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
Subject: [PATCH v4 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Thu, 22 Oct 2026 21:06:39 +0100
Message-ID: <20261022200640.3101932-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
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

The controller reaches memory through a pipeline stage with its own
gate that nothing else claims, so it is switched off as unused.
The glue registers share a clock with the multiplexer, which probes
only after the controller has programmed them: unless the controller
holds that clock itself, the writes are lost and the port keeps the
bootloader's delays.

The on-chip PHY follows the G12A; no board in tree uses it, so it is
untested. It stays disabled for boards to enable.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..94ea22514501 100644
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
@@ -645,6 +672,37 @@ gpio_intc: interrupt-controller@4080 {
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

