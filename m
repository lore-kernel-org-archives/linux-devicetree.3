Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296671;
	b=FfOvZRMnKOzw3tf4YZj2yGM+QC4XVvVtF3Yzb912N4Ak2ihLAL/3rGraU2MbuPuetPck
	 nVw885VqUhyU0/7c/lB1Ky7Pl9mPTZu8owY5umJFdudq6kXIzRPsMzzAX/S/3BG4etwkD
	 KP2J6CsCprLcmPKlLZDePsyZYtFUOAEtH8b9CZGd5sw9tikckzkmvCLNjE0yHAnnDXiRQ
	 6sqoB+MTHJ6JrPW/uTZksc3D78buJ/3i2EbSvEj4qj7/+35vEUxLwfPtFJfq4k8ex0iIY
	 71YaDGArsUs/fOp/L1umePQ6sm7mPT79KlfOAD4tQXGRT17Et7i7Fa4Rr5WfAMhNfYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296671;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
	b=XJciRZVckMboG3TEvkq+3eDB5ddcYuetez1jtP6HGmgf1Hf/bnDML2B0/u/2TgggiSaT
	 RESotyCIiR+M9ZVv9Nc6LIbyqkgeT8QQVIm3ScfV6vwmVwG4LpY8Jn5+l5J3L6FEJKMtv
	 XSeLjGp3LvlzUkA6LRjPXexlJqXv2VQHiANCPPkPQHetl8qH4DHthHcixBA++F4y01/L7
	 ccyVRLv3j+nvu/URfsh8d10lEWBoe2jsAXu1jpgIXr7TdrIgRmRhvUn/348IfOsBgfUKQ
	 l7vE7pLjYJMAoX48ZP0KA5cQxLS/DKJzWsC5joATSbik+GezHCJd5aJFSEL4t42hsHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292CC606A695
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292CC606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso1475597f8f.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296670; x=1795901470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=vO0zArm6KfS+Q2tOKFFF+AEdnlqCGXtv9gJP6znfMOqWAkilgFsvz1SnKnG66/kyho
         iQJAEuAuDv8jtX9IQiWFKOoCzB0rJIKw8kwbqNkSJDaHrZMtHGgnFgSV3Yu/zGfj3o+M
         fzd7xxp1ffXvl33qQ2GuRJBbdnw+5JlHdEGW1SiH9zhO0Pmr9/RziKEb7rGt7Mtka7E7
         2IU53OzdRPXUl3sBbe2HXwkv+K5MZufaw6xB+bUtgS0LqkIqT9yc5MWZ+6er9EHG0SCK
         E44fkhVs9DTj0j8S0Vk2ABremP/QTlXc+m3aijHAnCTWTM0iHGRNc5ypAdib/wWtZklj
         B3tQ==
X-Forwarded-Encrypted: i=1; AL+hErE7EDkQhLmmgqyKWzjXrRZJPG1C4WFjUOT+RYxbw6np7JYVJUj2cszqq/pD5JtsWaTBFaqel7KInBV9@vger.kernel.org
X-Gm-Message-State: APuU4Z84/ZOeo1lGd41x/B4H+5S1A7vRvlILGDUGDBoSRi5pCaQIU66Y
	guV3ASefMhHqtyN9gCJxZ1SsK63LrKR5sIUwSkzIqUXvTsjriHC+pWE9
X-Gm-Gg: AZFdTZeCISPIaQ8J2d8o4GPSe7ZpDGj7dxLZgdK5+FpLBMrkCzyH5QJW3BTArJDHSSt
	uy2nDW4EYw2nmjTZ/7nDKoelEQHkbqa0Jh6FvG3haPapeZWCoOB1nVyUgIWgfDh5OQsEaQzbqN7
	B+PH2orqPhoKqjfYoxbpzB3IXpvxinKOfXCfP1mJwl8O4EIjKpmSBN/RSIFUvJLXpHHVa4NQWzW
	1Y3BAUtaEYw1uVI0YaiqPvDVdhwEF5s3M3RvFkC8qb99gjOHhktSaNOQh9ZlK1N6hSw5LHjO7iG
	TV1Hp4SlTcT4aVFF4JiCr0+jNhA4ye9LSR47x01Pt6lYIICHkvSK87z1zZhD+1EM3v3s1/D3F5o
	2j3ph5vp9UJM1jfm+uRhAy+itI39oyxhuDOFfqwIkodvj0zomOZIq2plzEM8N1N2AZA2G8Wg84C
	N9HLh7CIbHUht03CNjM906Qq/k4H4PzYmlFKgokTT29veQN2FSuK8+HMi3jePEeY/4EzWJPAW/c
	qIoMzBOENrhlI3MLuyVuL7irW0FSwzQdY8zIUUbJQ770sgbc03lCQ5RBF5zenc2JlTnHO7FDDIy
	cKUjoXXBM58EFIJqQONihJ1YKRY6jJzZM0PGXGo+hsWDjBMhPRVejwwKzfBr3YUghOJ4jpjsMvu
	fzPtYm7h/lGa1fx8NsvJfg18=
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr13243799f8f.9.1795296669533;
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
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
Subject: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 21 Nov 2026 21:31:01 +0000
Message-ID: <20261121213102.143130-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
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

