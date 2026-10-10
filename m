Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A0418373
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629958; cv=none; b=d+ulQAfWytDg96U62pOXZCfi8KieXQU7hi7bzCMHGOvSEgAwgFUOkaoW/o/RWZTGuqdeBYBEu7z22o+3hB8jT7ctQ33ApV8GHZYrWXR2BusLzlGaoxvyUhIH5bcnLnQMFsRK3I1FzBKY55xqif83TDWo5aLP/xMQbFWbmjji9rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629958; c=relaxed/simple;
	bh=E50djWjs9HzrIwMAPSAgWNboiugZf7l9Qt9MucnhH9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFz3xQ9ydCpjF4XRoAuMZfUFHYY1v7l7gzmtCojchAfDhsVKJtnUV/Db+FsL0HDb61eMIOy3ZNPOfwyFQRHiRXfCHXGYCuM/BwQ7/PVAp+6zIJcOkq+HS3XfNehkO66qF0CTlF5OUE1f0cN9NStsvoS3E3gEYKINiZfZbfSYH00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c6f764f82so123699f8f.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629950; x=1792234750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElpMWQpElxyvYVfod7vt+zc/cJPBYXPVQKctc5VqWXw=;
        b=0dTMVUVyFlwHgoquoQ0W1yzt1hGAg3APT6P17ixOVpjxk0zLJT6OcIUWezE2E2NWPQ
         1+zY+ULNlEEMIniGJzdzTcKPKEFCF/hCNSHTb/+sov+BADzYWBp0yrCApwVIdOS5RauH
         SohYlW56cI4cn1i7mTx2sTKd5LLCHmbLps2m+i0LS55NAS7s6hMNGFiVizbU1LWJybrL
         npbSIJb2L7mB/cK1/ZuXFO1NRK0e+rIccS5ClHxdbBuHtgbvUSzPPpewwioo/7TcY00w
         oyww71OslCCnqxnkkT5QYWwWugLUJ9kXd39sH9+jJvdiPbjuDynXhgupI3nDwAqBdCsM
         S8mg==
X-Forwarded-Encrypted: i=1; AKwUvBzvddPB6bNkoyEN824J0qyR1L5vfc+rttFaj+2BOm2RuR2UB4A7YmtoiAm07sa/HaxH88TvcAgvNkTo@vger.kernel.org
X-Gm-Message-State: AFq9FYJfIS14XT7zJq7mqPDCUrmusPZdngVxpeWlekBE1Ye3c5yQ0TgX
	TckMkXAqueIUdjqHAlvCzWnrQO90r6CjixGlgq6UOqvKipTdna0GH9GW
X-Gm-Gg: AYBFou343sNFJCl0YQAXvCKXbbkrjL02XfwPSNG8izp5oF9CHVlWY3KFcVOTXOIUPrD
	f1A3jdO/ynptgIAPetE35S4MIpukug7RqoDyyG0Xya+E5LKDuIwqf3Rh1eidFrdrOBxqeOXh5++
	4oRtnOrMVGKw0lm8aWh/fW2H6v9r+Nlle43o4P2X9ZQ1v0hXmQh3n9pd7b2mEuphKYhZsSHJ2Jj
	fuuIL5hKR1San5H/JQ2fdAf908Me2LIwOiepae+q7FwILnY1/g9IT59Q/QStkF0+8aD9NKdLMcr
	D/Srl9YsQBOc6mAuxld9W9i67gaQSBUpzLKbiSCCTpjlIGGnwIK0QvqYUfv496Dr0mLEYi1e2u0
	PfKCWvSLr+HxP2Ur52HlJ75mv6hOtTybK4eDaRIJgL0F43TEHk/XxeSjYlWVZSh2+U2Bg1ptiz7
	VzsS7p6BzE1fhRw3pAwXbj7mWUrDeCNpFKL6Xuikex27JBaMyhwkSegxSeGnI2fLmSIy+JdshqP
	GIt2xb01tnIYuP2AaTF6qxarA8arre15C0=
X-Received: by 2002:adf:e011:0:20b0:488:57ad:d5c8 with SMTP id ffacd0b85a97d-48dba787c28mr6104337f8f.3.1791629950054;
        Sat, 10 Oct 2026 03:59:10 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:09 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH v3 6/8] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 10 Oct 2026 11:58:58 +0100
Message-ID: <20261010105900.247342-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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

