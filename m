Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873015;
	b=T/Z9HvibPSRyHFZ2NQoeJtbAWKk5JvqbzG7vMAiT65qBVu6o8/af9QvM2UlU2tLY9VgN
	 JZaFs5PsCKkYYAhpsx85rtf5bbZYz0DS83xHVbLe7cne45d7nv33QuNLgO4lNeAR598vh
	 l0wXHtyL0LfN937SFJhWgljJt2+OCnw/W7bHbw3wmTJxFGFxQ7WHGTEMaQcHMzokIROCm
	 gHqyY25XPfJP2sG/3TpFKPmI46mG0azrCSB14J+eH/kZPEm9NCt5E3btISVs4M+2BbKW0
	 YOzSaNrZf5ecbRZ5btH/ALdbZsfWTwLven7nz60rcDdhD6zODOq1TR8IZhf36m6h1Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873015;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
	b=g2pRsB9TD1ljMMl8+BOucaG4/fbT3EMs8j3BINvTp+SACowQO0x2EjhPFcF8l+IGlj3o
	 C8vo+RETTNNyOS9PF7IWApwcuTfUGqlsd5mxkFN3MiF9/0Q5xqO4KcYTzPvoasdGLgz3R
	 XR+8ZE0Gbuc6Q2yzRvJG8DUySgBKr9d/jZjcY/0DbXovZVyXW28zp2mxfbhO1d/zfMaG5
	 nVJWvouYgCcmw1Yq81VCsNjUTyKKd8AtD7mQweY3gDSkfgPoZ32oOjFdKkzn72lQHQIAG
	 lIeGeGYXs9h2xfxvXMWAMdMFzAhfn+hb2nJFkOQTqIcm2aovG/0OFu5H90yPPD4c2Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BFA606EE9F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40BFA606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214af2076so11827575e9.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873013; x=1794477813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
        b=AYI72Koj16LfJIBhGyAJh/3aV0D59EVUmdYEkrWx+fVCcLUClDBGQHxQ0ndavmYz4J
         OXKehm9T9vYckhnz/lX5jfH5tduNUEJ7HSnS86Xo5AOYNE1+SXHC2wb7A/pB7fTmnGFF
         evn8eiSKzp/Lx67wwh96plek3EqGQnOUeArsAEqNgm1Kf7mPlPku99BX2x0ay9GbRGnY
         9ve4Vncx6pMPHkt8cSCZ5UeibCv8sa9HKScfUdoqkou4Xx7cihV20exgXXVLwowTAHJU
         KZqk2K7kvl+GC5M63X43uKABKKzKajFEmdUx3K1NxLY1EmV/vtWahFjC+PiAWIxk1Ut/
         y0Tg==
X-Forwarded-Encrypted: i=1; AKwUvBz9f9j8fgpNIevkl+mrskOuC2BEn/0MP8HEgmUbV5FVESqTs2K5u8/aJ35AhvYS8O3yqLcAVFFNU159@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wk8BDaaSQOV9/403jP+XDQN/AiLIpzScxpRsTEywoKOeCntZl
	MY7o+kblt9XqcHimMX4rxNdPGjJeo7ZLcpFz49v46oYo8KCrnUeC3/Vo
X-Gm-Gg: AYBFou1K0UUPj4NXkkvWt997kQywfoO0psXx2VO2IIdPFxue5wIqz/A0zmeVqZsoS5b
	PTIA9BbDdNNCSXh5ZWWanfT+8RBVWDBfvcrj6YLYtk5zYrtQJNtaQ9mjQBSwYd5WnQRUNk7KSVV
	ANQeqegDc1JEapKMUkw1oc4j+Spirl6Fja3mS2QtkP7TtalCFHZIbPTGw7nJTmJ3zxv35AZka2T
	yWtIzHFjPfEr+ZVJEDKMOWTM8xNFXxBhR/X4XW0pFxIyaulYvKYx5/WUStCv0+UYyf4lr7Q3tbK
	QND1Wi6mvPknPuqhGzqTQgVoulzBP0GCVp3JE5uykbnmoPhaoTpfPqzSsjxnB753mXPbQ4vfejc
	bUPu8GFS6UgpAKc3IruoVILT5NqfbCKqw+iJgak0AAWdmPQuw8Tq9CBjNUbNMKuGkTyJ4tN1jwe
	WiQ4GPgI1sSTWc/jQ7TN+mNBGesgLXsoWlfXlVrWn0ZCvQ93UPwv6BI1WnvslQc/l7mt+PkJEok
	OBguAeuDeNLogyBEvDUNZw0q4ubuZ5Q9N/zBedZ3i/lWPtCkF1+3Ojk1BR5rgV3F++1PHWCu8jM
	fGom7eXy4EE0mjj/1Z72ypX46MnPZxWs36+Nhn0KARve8aW9fJraw0xY9P+45nblFyH/1CT7iek
	C1FD64pdO37HHaXCzrCfSNHTyeoI=
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr364050625e9.22.1793873012541;
        Thu, 05 Nov 2026 02:03:32 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:32 -0800 (PST)
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
Subject: [PATCH v6 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Thu,  5 Nov 2026 10:03:21 +0000
Message-ID: <20261105100322.37816-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

