Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EE6395ADE
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 22:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787611873; cv=none; b=GO+NedYF8G2FSXU5HW1X9H08aVpn3lR8hsITn8nZaQ90JHj3RTVAx9nSV+iCNRSawWGYfOYoDLTI4QTTsHyQhmf/cldDmcVvrPJOHgGMGWw+UToAnAkbLvdva3mUTVebPxblHUlQL89kOqGBU42e+7mxl3VShq2RnDDbcJ2bQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787611873; c=relaxed/simple;
	bh=pjd0I5flwLDJ/mvt3Jx5EDFxb34do/KG1KAHf/QGmto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANWAoSqFvBuqyiS52dofJ5dQgjQarNVvRJYW2hnk8wjFjJXxMMWI6W4rx30vFQDRuP7qofmC72pOD+ofGvuLMOuMbJOcifYEvq8jeCCQQTnxhIlcNAyAC7LP/G12wTDO7ZT3D+fYMYKUG37Drhy7pt20NeQDmRhr5NafE923FyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxuIIXMe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxuIIXMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014E61F000E9;
	Mon, 24 Aug 2026 22:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787611872;
	bh=eVgJpTkwEbcwWgNGbcQgLPoVz9aODaMiBF7bSyMrtPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TxuIIXMeWQBB/0kKmZu927VGgyBMnpxbnavBFpfGXIHjZFbXkI1OV1XVN9h/XOFmR
	 1B3LmUyAzC6FLyaXCsAMiENv+gcKd9/p7wpO88eV/h/F1XNh/1OQtYft6KNE3a7CAa
	 79xLKK+e9smMzGtN+hEsaj7k5KdGQuA5K2tzH2rgP/lcls6aahp8ChPs9jNGuXDvgh
	 qjVdZ+MBKKcfYzrcepGT5tuAAIMMmTWhiToy5+ucu+cGQ96F3NLFNVoF7yXB86pE5v
	 98+BzZ2NbQd6WlGncoOrixp6F4Re+sesBn40r9iC4Kkhc++Xp3oMLswQuYNTJNV+0a
	 uOu3ez/ULjeQg==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Aug 2026 00:51:04 +0200
Subject: [PATCH 2/2] ARM: dts: ux500: Add the Imagis ISA to Gavini DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ux500-dts-add-imagis-img1200-v1-2-6319ac50e3a3@kernel.org>
References: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
In-Reply-To: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

This adds the Imagis ISA1200 haptic feedback chip to the
Gavini device tree.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 56 ++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index 0c3eef7a294a..3d1c31a709e0 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -329,7 +329,38 @@ i2c-gpio-2 {
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
+			pinctrl-0 = <&isa1200_gavini_default>;
+
+			ldo {
+				regulator-name = "vdd_vib";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+			};
+		};
 	};
 
 	/* Bit-banged I2C on GPIO196 and GPIO197 also called "MPR_I2C" */
@@ -884,4 +915,27 @@ gavini_cfg1 {
 			};
 		};
 	};
+	isa1200 {
+		isa1200_gavini_default: isa1200_gavini {
+			/* Bring out clkout1 on pin GPIO227 pin AH7 */
+			gavini_mux {
+				function = "clkout";
+				groups = "clkout1_a_1";
+			};
+			gavini_cfg1 {
+				pins = "GPIO227_AH7";
+				ste,config = <&out_lo>;
+			};
+			/* HEN GPIO */
+			gavini_cfg2 {
+				pins = "GPIO194_AF27";
+				ste,config = <&gpio_out_lo>;
+			};
+			/* LEN GPIO */
+			gavini_cfg3 {
+				pins = "GPIO195_AG28";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
 };

-- 
2.55.0

