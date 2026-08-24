Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0000394788
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 22:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787611872; cv=none; b=ZBqHgqAbT7w6F6fAPkMd/s7sXg0yQUzW8kv32sDB33pvlMtzl5vBwiFkHIHBHoyz1aOmpH/vbS4aKQ9eFYbGkdDd3WWqwV8Ek2c3294quZ0lSDuaSQ0LG97IlBCOCTcH4BcPbi0JasPfH3iKyXdwdV5MfSREqR6gV2zQ+S/5obc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787611872; c=relaxed/simple;
	bh=d7wpeYINO75rh7RrX66552vMRjC3ZH4Po6MNzX9XkxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUsdmkf345s/9cRQGI9AzgY9Dz8JtH37RO9hUCqWlTxv9VlEUDnMRBLNcrGktNML5qw46PNP7jrLkkFERm9CfXZVCxjokmEJenxZViBwEdviDZbzKBKZMi/Vva/b5BBHUQBM1YDX5cMCQXq5vRS9voZNoiFGpszfYK/27D1lZ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3pZpdOm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3pZpdOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556361F00A3A;
	Mon, 24 Aug 2026 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787611870;
	bh=Ei5Fyz86MWeIapWv6dEee0OMFSzsg21D3RKFdJFLZyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=T3pZpdOmoQ0bgEWTdJ7Q2yrEagsWEk6U4nWyaUPPtWOEZqHCv43JIZU+oD+QNmB4h
	 JQht7oRU0AL/id0lb5m2QSqyOuxqZDNS2ojpf18PdgWbrBXn8x6gUgQNgAlquc1V5N
	 ZvT2ga00L7TUj4zg3fN6XaZJ7+QYWZWh0stiafjahxnuByBcLwfSlLSFdLfO+3zYYp
	 u4W97IYh93N7RcRyV6H6SBuS+IrR+1I8Z4enDBbhQszfs7IG1jCXS6EH5/spGC2as3
	 cwrwjUO+dTcqj+AceDA/PWToF0y20TFkgHtHB0v/C5Mnr/BG0IeZk5BGOiCsJ9Lfzh
	 QRGF7SyjxZpCw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Aug 2026 00:51:03 +0200
Subject: [PATCH 1/2] ARM: dts: ux500: Add the Imagis ISA to Janice DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ux500-dts-add-imagis-img1200-v1-1-6319ac50e3a3@kernel.org>
References: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
In-Reply-To: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

This adds the Imagis ISA1200 haptic feedback chip to the
Janice device tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts | 56 ++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 18fb7263058e..1f47d5910c9a 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -360,7 +360,38 @@ i2c-gpio-2 {
 		pinctrl-0 = <&i2c_gpio_2_default>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		/* TODO: add the Immersion ISA1200 I2C device here */
+
+		/* Haptic feedback unit Imagis ISA1200 */
+		haptic-engine@49 {
+			compatible = "imagis,isa1200";
+			reg = <0x49>;
+
+			/*
+			 * GPIO194 pin HEN (motor hardware enable)
+			 * GPIO195 pin LEN (motor LDO enable)
+			 */
+			control-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>, <&gpio6 3 GPIO_ACTIVE_HIGH>;
+
+			/* clkout1 from ACLK divided by 8 */
+			clocks = <&clkout_clk DB8500_CLKOUT_1 DB8500_CLKOUT_SRC_ACLK 8>;
+
+			imagis,clk-div = <256>;
+			imagis,pll-div = <2>;
+
+			imagis,mode = <0>; /* LRA_MODE */
+
+			imagis,period-ns = <13400>;
+			imagis,duty-cycle-ns = <100>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&isa1200_janice_default>;
+
+			ldo {
+				regulator-name = "vdd_vib";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+			};
+		};
 	};
 
 	/* Bit-banged I2C on GPIO151 and GPIO152 also called "NFC_I2C" */
@@ -996,4 +1027,27 @@ janice_cfg3 {
 			};
 		};
 	};
+	isa1200 {
+		isa1200_janice_default: isa1200_janice {
+			/* Bring out clkout1 on pin GPIO227 pin AH7 */
+			janice_mux {
+				function = "clkout";
+				groups = "clkout1_a_1";
+			};
+			janice_cfg1 {
+				pins = "GPIO227_AH7";
+				ste,config = <&out_lo>;
+			};
+			/* HEN GPIO */
+			janice_cfg2 {
+				pins = "GPIO194_AF27";
+				ste,config = <&gpio_out_lo>;
+			};
+			/* LEN GPIO */
+			janice_cfg3 {
+				pins = "GPIO195_AG28";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
 };

-- 
2.55.0

