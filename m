Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072979;
	b=aiP9DYgp99BaoSZREF7FmnwRCOrgg9yGgpkRJOkN25IIq1B69mYCSF8BoBnr+6VOey4H
	 0QhoamEhmxoeHT3Q6sHJQjHJpwtqaKYVYbcLQwmQK6/yLWxjlionJ6djfAoKmXpM2Y+z6
	 7aZDgyLs7ExxSH0WDZv4K2R3CIkatZI3waaW8hPmF5A2nGqp/38hrnA+gZr11w2FTYTEK
	 fv0IzF4kZKvqsVHSJOwthsG3GI7qK2JpuqE5jSiUX23Wxzkt9dhh+rhtJtSL1Vo/oZhIv
	 CiFSYQxjIW44pOKt+vKpfghd0oaZL+aDInf3X/fSrQZEZ8FeFsnyGQ42dq0nXIOK5pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
	b=2YMquFh4SVpOTISh30/pNZ2H3JdhBiHP6ce0aYC4cbiPsD6+9U8RO3EKlJUKE71GXXEP
	 WLKeFqaVCaqAU64QXX9rmzP1hjdr4I5Lgb3hWcwh6vUi7J3lbv2DeAvQMG9DEcEquDWW3
	 Pwo2kj536cUq64Iz7s0zqk0OlziTPZ4clitcTKXaMqOaBUbkWnEb9DXCG10fuX6h6InM/
	 lVE6X5tpfb38yiC9LfVf2A8LGuWZ9Ieqt20ofYoH+AAf4JwkmU4BJaPPE3qKnn/usEWng
	 CFSXXtpTQ4X9And1VXa3krm9vX6bJwi4lrhAmFC0ft25W0mAzuNiCE5CqTu7G89Ba2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R9zqUsot;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D7606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53D7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R9zqUsot
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-185fd3a4ca3so3166034c88.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 20:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072978; x=1793677778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
        b=R9zqUsot1/CtmT57G/TVnh6derzSzSReMVWeJiJ3mux/Q0vdlL5dHJb5+tJGe0TixO
         5US1XUv26gM2Fdv5TBPbySP8eGPJ2juba7xUvM/Qgj/gXI23VVPuq0HMpeyi2GSO1Gpd
         A/vx/xos/NiNtO3bescC98W6NseXk4R2RRRqZwLuSHnJS1L43FMPobhoq1NOyTBAZsn/
         0NPKRKZloZtNm6YxE0SiTJrL7KNYV17/SNToM0XZdf3lhvAeOirT2Vuzl8g+pqMjXi8D
         JEjcA46QPdJdsOnr6BmHAl2PDamVP0mWNLM4Pkrj95jja9df17VBKFbUrsnTACKxguOe
         QwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072978; x=1793677778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
        b=R+Fvah+Ulc4KHgll7Rv8wyTtoBPYSmTlSOVmbMCRAdBnQ5nOfYt48OO1yJYyVg2HI1
         tvPWh/ddwengPK6YtUbqCfsGtJ2cV19rFEs8woDpZSftNeoG3qTWkjzFpaBeSRfDZzmj
         W7dUEPFE1pCLlR27jpnFnlKrcN6/45AeAFzr9eWD3Je0MVNRyZTkeuRmCRNr6SMWz6na
         GUpCv3g22TyC2zLMF2/b5gX2Pgzf9j+HYpIoXJtnMP+a3L9jfmXfrn9P+g0YPnw8LPy+
         ffuv12ub0IZroCTux8Os0Nig5v3TERkuM01TFVvNk16AAcwpz1/VQgD/ydwyyBQ2aAq8
         xEbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxJJHQjJJHAh63YT+QPB4q+KCyEyZ0n+VQRqh9/AipDg/z/KMJwzzqrh6ufmmofWvlUzs7a7E+pgYK@vger.kernel.org
X-Gm-Message-State: AFq9FYKPqaPpWaWAhz79OqQw7L3sfgshM/aoyFJRrilaloJIcQw7jUJv
	xswG2k97r0xubO6W4AJUA22C94MsjevJnRU00+fde+GHJ1sTVYeGGKBF
X-Gm-Gg: AYBFou3xboJCjZ54dwTvVI0dbpQPJki0H8M/yLUf4F8iojPfEbycQEe0g4knD/kIZNt
	1dKS3Fk0J8bNV4Ahr5/V0XUYfwlxRYQ1j18e5ImPc0ANgyAbuEay01aB6JIKq+lm59lkN6JhfAA
	+fKxrtNXNqQ3pg6rabP7l1Ll9zfyr7M3BNTF886w7DYIV9MiIP0vpd5ieG8b9qBN5sq20ipOeVj
	SMPwKEOvtkD8zFGEsgMevZtplfBm+3dUb6NZ4B3hXbwcTnTWj22+5ocnVGHfRZFmTErf729xKXL
	ouvVwOqISgb/dabykyoAnW7DuoEG4QMXjXSpU6XMGVTBVf5fohirVxtyXxjsWwkPyPcTqk5wuKp
	B8+hxjh6XCSs4wkc30tczogUHnUg5ElvKcdDjgh3t3eTCUhkqiXdkake6wsjWXbonNqsyAMwayi
	q0vxpr8k5rSu9Bed2GyngFK6d+EyDRDBIfWyQU5s5xBQQk2hXUikLZNoT0I6RRJ3LSDcKmnhpvp
	c5/+l5QmiMlo9Y0zwvNuLLKE8/BdGGCwMz/BPBSIo2ofzaOaAWx5fb8MxsO/hs1LCTs1wdprS1i
	pYNVVeDq5zBW7c9r
X-Received: by 2002:a05:7022:1407:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1a21a289389mr4067703c88.37.1793072977517;
        Mon, 26 Oct 2026 20:49:37 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:37 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 27 Oct 2026 09:19:11 +0530
Message-ID: <20261027034911.99482-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
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

Describe memory, SPI NOR partitions, the UART console, GPIO line
names, framebuffer memory, and the EEPROM on I2C7. Use the EEPROM
as the NVMEM provider for the MAC0 address and configure MAC0 with
an RTL8211F PHY in RGMII-ID mode.

Enable both ADC engines with 2.5 V internal references and their
pin groups. Expose the sixteen channels through an IIO-to-hwmon
bridge for board voltage monitoring.

The DTB compiles with aspeed_g5_defconfig. Binding validation with
dtschema 2026.9 completes without diagnostics. Board validation
reports unmatched schemas for inherited AST2600 LHC and I3C-global
nodes, with no board-specific errors in the reported output.

ADC readings and recovery after BMC restart were tested using the
same ADC configuration in a locally patched OpenBMC image. That
image uses a different flash layout and separate power-control
changes; this complete upstream DTS has not been boot-tested.

Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 173 ++++++++++++++++++
 2 files changed, 174 insertions(+)
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
index 000000000..630588dcb
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+	model = "ASRock Rack B650D4U BMC";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
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
+		"button-power-n", "control-power-n",
+		"button-nmi-n", "control-nmi-n",
+		"", "",
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
+
+/ {
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+};
+
+&adc0 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default>,
+		    <&pinctrl_adc1_default>,
+		    <&pinctrl_adc2_default>,
+		    <&pinctrl_adc3_default>,
+		    <&pinctrl_adc4_default>,
+		    <&pinctrl_adc5_default>,
+		    <&pinctrl_adc6_default>,
+		    <&pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default>,
+		    <&pinctrl_adc9_default>,
+		    <&pinctrl_adc10_default>,
+		    <&pinctrl_adc11_default>,
+		    <&pinctrl_adc12_default>,
+		    <&pinctrl_adc13_default>,
+		    <&pinctrl_adc14_default>,
+		    <&pinctrl_adc15_default>;
+};
-- 
2.47.3

