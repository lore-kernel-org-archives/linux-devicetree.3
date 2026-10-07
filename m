Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF41448CF7
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361604; cv=none; b=WITQm9iUI0Rg97duppEK9nY9L4Y6BmuNw4AgJuWo1gavve1S9gaPSTIF+MFzsFO3S16flIrTpiBs6HJbQAvPYeCBix/FBl+APzggeNDOg774hW03x4VXe9wKSEH5m08kMx17LT3f/gl9ep5evknMCDxtWahzyjo+fBnwy4YCasU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361604; c=relaxed/simple;
	bh=c7GRPa1MRnZgahEhAkMuYW/f6BU8clPM4mNP2WXx2ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WofhJ51FAmIqcmRM8TLfnWBuxg/ytZa7zmRVet1BppKFPvoQsirCqYENoKy05T/EglTjhWnbOCGiwsN4pwJSej95DCTanlHHweI2c+ipUnTal940l2jsPO4SsV4/qwdvJELIRIubceUgjgxd7z0BO+Uiblocv+4zZVZtt4Jns80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso18185285e9.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361594; x=1791966394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKKIB8jplVEe3d7I5HpiWgRDARvx1E69zSOwXtBJM+g=;
        b=uXRMQLV+zs8alfPbm9rYGi02bGSIbcQKqLINN6ZYLOYBgPkf1vDbgDCSPIIhHg02Fs
         sDXQTWhp0GSBkRbNxVg1305fd4m8Zn0DjLxppNAY0VHaqxSqR7Qeven/3yaRNKsn8T0T
         NI1NTN+gFViKxgEOBsIi5c+sdSXsXGKtY5yEdZo9bcJavHryqNTRBmc7RmdSp0w4h+Fx
         zDBX27Y8Zak56uXCiXCc+qJ60ONdAcM36ZTubqK7SBV4aFnZ6A80YlNmlO8xXJkEGmY9
         wyFz9Omy01vUVH6eJmi7oSmOGfeLb9ZGEObqtI91sIc3p0DaGiVpCNRcn+2F6N7TzspP
         BAWA==
X-Forwarded-Encrypted: i=1; AKwUvByAfPkhc1eRbS+UESpoPiuex+N32Q1eOArC2hbiGV8g8VJGyLSSpHXYmI+sd+aRhTi0HM/oQEmSCVer@vger.kernel.org
X-Gm-Message-State: AFuF++m9BS4Dvw6u2xbWHWbYiRZ0vwO0QC09Ta2NyxG2iqYcbJ90n8cR
	hCaS3OdzFAStd8drb2kvE8Tiq/YLZjksjEE2FaoSt6TQd0aCjKQQiuMK
X-Gm-Gg: AYBFou3IQYws/k3m8eQItQF9GenGDfReOeV+5heO4OPLOtmQpV8DNLwhrakW4EKR7bL
	fdz+HBczj4rZx92FT2oDdbIC0Cc2Tv5fvqRvoaLalDuQMSSuxmhQX8BBWcKtM/0ZPmLxGs7QQls
	UaLrzR5irD0q/dAd1jkdunKwzX3splrxpnTMq4ZW1JsjzlMGqaa88pQPV79K4cjZseNz+JgNWsL
	k4Dy1KlDyVsT00zdtqkuyRsABzq+9VsJSjtUcq5k1TSXdzCLel2olC+MXoPaoeJg/VOgyjOX2NG
	AfFUsVJ/cmqFyERvwKzGtjt0W+/HrUpCCqLJTsYlDDdwjw3cQxYVxAV/DgU4ulaXsfoLMGcQ0E6
	pbXzxyt4eHCvcY21obd/vt7+cWM7o/QPV27S7eNEcYENJzPdHnonS4Fn7IZnbGJ78M9d/Jkoc1t
	s0Ojixf7ReNU7dtxJDHwwAnM5DrYFmO27kR1JKCJLRXOCXUrq96Uvcu5bzNEQveWcCvUW6RnY1o
	H3F/K0z3Mm0LAyWpkdzveYNIL5+0j+iMeo=
X-Received: by 2002:a05:600c:890b:b0:4a1:7e26:9a5a with SMTP id 5b1f17b1804b1-4a17e269ab5mr38619595e9.15.1791361594101;
        Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:33 -0700 (PDT)
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
Subject: [RFC PATCH v2 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Wed,  7 Oct 2026 09:26:26 +0100
Message-ID: <20261007082627.63807-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoC has a Synopsys gigabit MAC, a block of glue registers that
selects the interface type and trims the clock timing, and a
multiplexer that points the management bus at the on-chip 100M PHY or
the external pins. None of it was described, so no board could use its
ethernet port.

The controller reaches memory through a pipeline stage with a gate of
its own. Nothing else claims that gate, so it would be switched off as
unused and leave the port unable to finish a transfer.

The on-chip PHY is described as on the G12A. No board in tree uses it,
so that path is untested. The controller is left disabled for boards
to enable.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 57 +++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..140f1836f3dd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
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
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline";
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
@@ -645,6 +670,38 @@ gpio_intc: interrupt-controller@4080 {
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
+						max-speed = <100>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.0

