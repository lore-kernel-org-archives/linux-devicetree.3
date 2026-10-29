Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315652;
	b=B9w/eYxvGSoVdpqMyFlOBgbGZbwtcY3kUmNfU74f7ba4Ue8lcwvOYOyeNYeSetGQENJx
	 CXAv75vci2WlyzZXDTvTBdyKG1R+lspoMY2yy529R/6BBNqoADxYoANLcWq+2UDRzcieM
	 RC+waOw5EFut4053t2Fq2dlqLFzqgmOUkDc+JwHhwNVevF8BjlPFakqdt3h+///l/0m0Z
	 MkdWt0gUOT8o8CUzZlvGnq//l73navvJRHIoBME1ppZhJEqMuWpxlnfewH3GoKKAhcBOy
	 sszfo+RbSP2YjOGRANrHqO0yjpuqwsULdvlYT2MgMKMouYIIcd+YgpYj4XSIJjSjogw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LYtNSjgV58xGbyTo5mnS9fU4iYF6Ei0AnGKD6L+FOdI=;
	b=KcvGLZbyzmNKzIYs9TKxpj5KWWI/D9FJFD+Gi/jGPpAViIZC9uyExp0SUt7z0qk1GK3G
	 vZjnlThmwwCtGlsKVA868eIorzzxEksx+ztF5Ni6unLm8t0/D/sHH43pSkfNY5por1YU3
	 fll5oqlH8+yFTrq3d3toBMyYHQAr9sWaBlJ0lRcAfLyA8YKD/G2YMbSQyCUDSqNWatXwj
	 Nmx9F43K1uPpH/mZNW5zhDx/b5cUbrtkDa28ChXlYyfw3/APCkmPdfJRVtaNSJVMTq5hi
	 ASaDqH5bBukfEoldnwAKKqEJVJpvroR2sBWK2xOrh1MoPwMrnEW81WkfFEjP6EWSljQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxPNMKRO;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E33606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E33606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxPNMKRO
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso285798eec.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315651; x=1793920451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYtNSjgV58xGbyTo5mnS9fU4iYF6Ei0AnGKD6L+FOdI=;
        b=QxPNMKROg3UJDyzTY2R0+AN8muvIG9Gv/i0hQFMbvUHm49okCvqR5CRD7gavNJVsxd
         H09siu8SGFeMaeKwYySWQtI0HkjP2CyuC83kuPGZhVVkgRYzIPFNQqm7NQFaIdbDtd3u
         pph0fw/U2YR3JH7EyIKq4XiMJ7f9g2pfDHs5ToETpu43YKt5SI4LS6nl8p19kOFK43Dz
         uhCrfY3+s8JFv7I4xJEHcDLx9DABZw5VVJt3vYrLMluUmMhw/L6d9WD2J270Bossfe5v
         AlO1Vqp8dwtl2pKBJrfwFrAFxprFztQTfYVfTwPmGS44SxLUX5pxHrBCJTcAAL9s3EDZ
         9iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315651; x=1793920451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYtNSjgV58xGbyTo5mnS9fU4iYF6Ei0AnGKD6L+FOdI=;
        b=p+dNcCVCcgtdPMLmTX+tZpzhKWcx4pDtKEH3jHNgkFQoUbDZ0PKpzkXVI146TsxnFf
         ya9fGR3OMvesrMGHzjMevvWTX9REuoGzuWp2o0a/L3mVJXKQAAgtLOy+I8Sw1KfAEH6z
         WAQqJMm8uZ/xqMEFIH2P5DT66DCl1GSfwG8aCvHNHixAZ9INDH98MuoIovkHYWeOJrr8
         HsRDX+hXtXPRTY0QWQuFX6LskQ8FNq81AGNshP2D5ZucsNsou40wCVghLB1iMI5/EApf
         NarykUC/9t8+6TA/aZKynwYwTaCwPZBLxewWb47KJVoTkkKCmti4WLGPdeI4JRqh4876
         ACkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0WNogPPcu0dyo/CNU4q6eNR2UHY9jV12Z4IXRVa2J9YW/c8UycB2cP7PI5ylVrSZySIM8DCWar7as@vger.kernel.org
X-Gm-Message-State: AFq9FYL6BmXxDhX9+wOOLs5KLwLRoyIc7/R67dIhhoEmHibl9yB43iup
	535pFDgZCXAqJLnZDFgjq9naPK/2W2NBTUnClmtPZoE237pICmOqMrJm
X-Gm-Gg: AYBFou18ePWfDdj4Fd5hXsAPdeTVndPo8gQE0Gw6A37nTtkuNl1CaFfuQ5EgtFldksW
	l3gKASyQxDLXiVeYgjGzMibNtTspdp8nsvMypB3w+VV/vO6zvEl00UPgf/eeidDIMp3cEaVpK8f
	113w2NIHGlUbXXk550/lo0I0Be1D7ldkW1dWTU2kRABiJogSYeHI7BqvW2h7JtucJDEj2KU3oeA
	azz6UOmUMbuKduVPVC5r0Xm8+c2U9li7dMrpfkiWhsH+91tB0rcT0hZ/jO7+0kRzDqVeczZwfgY
	9ft5edWN+Tc2kVTJ3lLHQA2DnzpH4Zt8VNVEozMR+8pOXSeqJqv/BektxmbuECMcSiViNOSVIXX
	N0wjtBinpkKWky+v79ljx8eBHMIOf/3ENtBu2kuA7fNOlubvEifGUMOvb0DAbdLXFKXKwBXdcH+
	u3AVCiRi+lWhSDYcaO0vVNNatfdrQh+1ZbWflYan7m74Zj/nsv/RsgwbIjIwWic6ons93HAJiae
	WZVmVVSONrGvu7RSGNVVTQfTZNZPWnhQ7gn61+X8JcYxbdg3AgHBC5ecBkAxQhCezpm7hTc51KW
	DpeqvBVPCdIlA3HLfDuqBhen/Ykp6RK7u2udGJyrO3GSYw==
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr1174193eec.38.1793315650617;
        Thu, 29 Oct 2026 16:14:10 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:14:10 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v10 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Fri, 30 Oct 2026 04:43:39 +0530
Message-ID: <20261029231339.9497-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
References: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
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

Add the device tree for the ASRock Rack B650D4U BMC, based on the
ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART5 console, GPIO
line names, graphics memory, and the EEPROM on I2C7. Use the EEPROM
as the NVMEM provider for the MAC0 address and configure MAC0 with
an RTL8211F PHY in RGMII-ID mode.

Enable both ADC engines with 2.5 V internal references and expose
the sixteen channels through an IIO-to-hwmon bridge for board
voltage monitoring.

Retain the SoC's serial4 alias for UART5 and select it as stdout,
without adding a second serial alias for the same UART.

Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Changes in v10:
- Use the inherited serial4/UART5 alias instead of duplicating it as serial0.
- Consolidate root nodes and fix peripheral/ADC property ordering.
- Keep ADC settings and MAC0/MDIO semantics unchanged.
Changes in v9: enable ADC0/ADC1 and add the ordered IIO-to-hwmon bridge.
Earlier history and testing limitations: see the cover letter.
Previous series:
https://lore.kernel.org/all/20261027034911.99482-1-prasanth.padarthi10@gmail.com/

 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 169 ++++++++++++++++++
 2 files changed, 170 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6874b621d..fcb94e62c 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000..522c4d53e
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+	model = "ASRock Rack B650D4U BMC";
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gfx_memory: framebuffer {
+			compatible = "shared-dma-pool";
+			alignment = <0x01000000>;
+			reusable;
+			size = <0x01000000>;
+		};
+	};
+};
+
+&adc0 {
+	pinctrl-0 = <&pinctrl_adc0_default>,
+		    <&pinctrl_adc1_default>,
+		    <&pinctrl_adc2_default>,
+		    <&pinctrl_adc3_default>,
+		    <&pinctrl_adc4_default>,
+		    <&pinctrl_adc5_default>,
+		    <&pinctrl_adc6_default>,
+		    <&pinctrl_adc7_default>;
+	pinctrl-names = "default";
+	aspeed,int-vref-microvolt = <2500000>;
+
+	status = "okay";
+};
+
+&adc1 {
+	pinctrl-0 = <&pinctrl_adc8_default>,
+		    <&pinctrl_adc9_default>,
+		    <&pinctrl_adc10_default>,
+		    <&pinctrl_adc11_default>,
+		    <&pinctrl_adc12_default>,
+		    <&pinctrl_adc13_default>,
+		    <&pinctrl_adc14_default>,
+		    <&pinctrl_adc15_default>;
+	pinctrl-names = "default";
+	aspeed,int-vref-microvolt = <2500000>;
+
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+
+		status = "okay";
+
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&gfx {
+	memory-region = <&gfx_memory>;
+
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+		/* A0-A7 */     "", "", "", "", "", "", "", "",
+		/* B0-B7 */     "", "", "", "", "", "", "", "",
+		/* C0-C7 */     "", "", "", "", "", "", "", "",
+		/* D0-D7 */     "", "", "", "", "", "", "", "",
+		/* E0-E7 */     "", "", "", "", "", "", "", "",
+		/* F0-F7 */     "", "", "", "", "", "", "", "",
+		/* G0-G7 */     "", "", "", "", "", "", "", "",
+		/* H0-H7 */     "", "", "", "", "", "", "", "",
+		/* I0-I7 */     "", "", "", "", "", "", "", "",
+		/* J0-J7 */     "", "", "", "", "", "", "", "",
+		/* K0-K7 */     "", "", "", "", "", "", "", "",
+		/* L0-L7 */     "", "", "", "", "", "", "", "",
+		/* M0-M7 */     "", "", "", "", "", "", "", "",
+		/* N0-N7 */     "", "", "", "", "", "", "", "",
+		/* O0-O7 */     "", "", "", "", "", "", "", "",
+		/* P0-P7 */     "button-reset-n", "control-reset-n",
+				"button-power-n", "control-power-n",
+				"button-nmi-n", "control-nmi-n",
+				"", "",
+		/* Q0-Q7 */     "", "", "", "", "", "", "", "",
+		/* R0-R7 */     "", "", "", "", "", "", "", "",
+		/* S0-S7 */     "", "", "", "", "", "", "", "",
+		/* T0-T7 */     "", "", "", "", "", "", "", "",
+		/* U0-U7 */     "", "", "", "", "", "", "", "",
+		/* V0-V7 */     "", "", "", "", "", "", "", "",
+		/* W0-W7 */     "", "", "", "", "", "", "", "",
+		/* X0-X7 */     "", "", "", "", "", "", "", "",
+		/* Y0-Y7 */     "", "", "", "", "", "", "", "",
+		/* Z0-Z7 */     "", "", "", "", "", "", "", "";
+};
+
+&i2c7 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+		pagesize = <16>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
+		};
+	};
+};
+
+&mac0 {
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
-- 
2.47.3

