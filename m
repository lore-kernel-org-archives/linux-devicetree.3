Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285928;
	b=uuA8y49+5Rm4hsIp0Tv6LoAwwLt5iYkMVh8t1jytrZnC1ExuzxPnWHd2zrCjwLSGbw4g
	 4DIwNsk7DOdloNG08IM+c255okhAAtNbOxH5WwOEG0lyXNnEuImcFJ1qD3JkeTFD0UhLo
	 B+adYz/MNLuW+5RB9LdwxGqJ8KuKzKQ9w36+BZez9IPvFcemHnsxwqOvmg9o8fH2TP5vj
	 sfeirihaTvQjXr/OsdiX0bRvfHmTB1MO0WPLu8VU1ebElpGT1KVq8fZeBlcJ89YMXqs4Y
	 ArO3sSusSr9+zfh0PoxxYpgCp29Edkz6xZaLgY8sL2n8LKKJ7ha8ZFbCy9UAoGSwFVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WI5auzUgMsI7bnDaCKGTvoflozZvYIXMyJqprDk664I=;
	b=yIFwaLxt66UbOtGXAzJSVIyG5LybuNqjIg4M5loGk4Ohr03FsQ60ftfAje982zoOsWEj
	 KC2Am/zddwCnA3/umh58xPfhNoic8QBCXGcxVPkpvdB5EhaJBKyvl+oqdsBw/XJX7XDYx
	 NAm8FWOLOMHqfpOWMeljm1pKmKLjAmWvc5gcxw9snir/H18cFpGRUPUPqCV+kHp1N1Kys
	 I5ByAXXSyBGywE16VvDyf+irB6i9Wn8tB7YIDKqXJl69a4qvtXHpIfCd0cD5cD3bwxkuY
	 +crZKR4fAYJJi8fOyzBmHVDCaqcwlHBVF0VDUf5qmD6RTbmlZ+WJbfVIkSsNoV+5vxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNG9tPvU;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0660A261F
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF0660A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNG9tPvU
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53ec92375d2so620876b6e.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 20:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285926; x=1794890726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WI5auzUgMsI7bnDaCKGTvoflozZvYIXMyJqprDk664I=;
        b=nNG9tPvUxLtyBo5JXF2SpEOGOJur3gKCIPfZx5/vaIQkv5fB1NG9oHct3On0Ac24fz
         ZvFTbkVJsaVuh5IGv16bEPfqz2/X/+w0s6V1tlXEBBXPvxx/pJqsfOtbEQsfsaKf/Mbh
         XmKtNXNX32QxgtJKZbBwbhrHVjpbw6UqBGfaVpxDkHzWfK20CHeWlaeiAyKfoviEDlNc
         NGu4k0iZpZBfYlbr9ESkx1ZJIY4T3Sy5UohOsdLmOd4l9dMg3wZV9A1VTfXC+BRRpQry
         wFAvoSzR5g0JiTpvUWODd4B38xxPNM7KoBvir7tN4+plteDP1ujg0DlO4WAZzZrKl4Hm
         zK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285926; x=1794890726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WI5auzUgMsI7bnDaCKGTvoflozZvYIXMyJqprDk664I=;
        b=ZQxukCbpUsK1tqrqtou9xDDCaov35iaeAam21uf2K5bOYzmJj8KxzdLMc3GQQ0JfMn
         wk4PDSds2gndbht8fZuE4XV6nDGUrbWUJ11vOiKzntkpbtD37R8do4IJVKZNxnqKmMTl
         FZYusQ9Ud4cCXePDRr7VqZWo01IrSQLxjckp4GMTLCXotDE1OEZhT0q9CMMzYJAPNqYL
         jPs0LafwRfgxFGO0feeM1ESin3wqi2TuKUh9Gk7rZfY8OM4Yy8KMapit6J0XoDIy4P8l
         StFH1hoywdYO0Bkn7xANXygZAiIjKJ6ty3/cyiPAAsLJtcry0JINVnefuFgObfnlmQfJ
         a2Vw==
X-Forwarded-Encrypted: i=1; AL+hErHaw3JstZXZ1joBvNe7ja3BffmEBmVi2kc/lGFyPdcoiQebrryNvYqxsF79Y1PzK8VaJeJuFOAR1gmw@vger.kernel.org
X-Gm-Message-State: APuU4Z/a7rpwQ0pea1Yuwj4GAIArzcFkbyg7+pV7cWwbhMNAJ6+Jj5oG
	6kUKySFT1sXgpnPik+ltm7c5J5zuM3Hf97eUUjJGRfc+QLpELmPlCwmd
X-Gm-Gg: AYBFou1MJ/0I4yH5FnptwYDc/beoVzC0pcm2iNFdwSgapzvAEwz7CWqeN4WOwWyuAst
	jIphUzWyNPrafJdwCiQI2PA9xdYgzkcEOiW7srUUfZzyoIxyt20LbN2JnZE+YZh5h19TZbzPTgI
	3yhb2Lfed6OtCXj4TolPip1Xyq4AkdhPEr5IhndhuXMLcEHUeDjAoIe49r2uWyM0nfATf0/Eo/0
	aUpmwVhZYe/mudwj4P9mle1CZ0kWpL1WmzbnPObTkFciT0yTkt52CRkqvQhyI7LCH/PG2uqOIcn
	Cyd6q+9d0RfTg9KCGnECS0w+VVStun9Ip/KWnE9Pqnwio1LnXYRGNkSMOVt+aljXrK1Us+MfbrS
	/N27eCfSWQy6yXY0yoO892cpKYCl9lqF9LcTs3dproBU3RWoJaJ7KFKPX2s8Fdy8FIG78Gwg1rW
	HOmk1dCjYejhk3dtue1KX2hYW5SKjd7R9AWFKb1UHZjl+hsEzGDOi+YB0YZaiQ6qnnPe1pE2CAg
	yyegvyvd466/iKoLn1CYw/XEOCW+EcY3DS4vZkyOGa9JLJKVgg0DBlAmrcfFaFLq9WRBqbJddnR
	DwH2GkZE/8+aPTWte+oVl16kl13471U9SSF6MCuVHZG2STOg3tkZrDRGc6GsThevmm/zUx76tAL
	ZqnIErw==
X-Received: by 2002:a05:6808:1206:b0:53a:ad3c:17aa with SMTP id 5614622812f47-5683cd9c0e2mr1116024b6e.55.1794285926367;
        Mon, 09 Nov 2026 20:45:26 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm1258723b6e.0.2026.11.09.20.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:25 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v3 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Mon,  9 Nov 2026 23:45:23 -0500
Message-ID: <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
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

Enable the Cubie A7S serial console, PMIC and microSD slot to provide
an initial usable board configuration. Supply the 26 MHz crystal and
32768 Hz RTC input, enable UART0 and the AXP318W on R-I2C0, and describe
the PMIC input/output and CPU supply connections from the Radxa Cubie
A7S schematic v1.10. Preserve firmware settings on rails whose working
voltage is not established. BLDO2 has no programmed voltage constraint:
its software 3.3 V selector does not establish its physical output with
the schematic's nominal 2.4 V input.

Describe the card's SWOUT2 supply and PF6 active-high detect with an
internal pull-down. Enable MMC0 at up to 50 MHz using 3.3 V signaling
only. Its high-voltage path uses VCCIO; CLDO5 also feeds PC and the PF
1.8 V input and must not be raised for SD signaling. Firmware must
select the 3.3 V PF path; dynamic voltage switching is not provided.
Keep other storage off.

Connect the documented bank supplies. PL's self-supply phandle is
omitted to avoid the PMIC/I2C/pinctrl bootstrap cycle, as on the
upstream Cubie A5E; ALDO1 is retained always-on. The separate pinctrl
voltage-mode fix is required for these bank-supply connections.

These board DTS bytes were RAM-booted on a Cubie A7S with vendor
firmware on November 4: UART0, PMIC registration and MMC0 read-only
transfers worked. Card writes, physical hotplug, 1.8 V signaling and
physical BLDO2 voltage were not tested.

Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd6461..792152525b43 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 000000000000..341c24360ce2
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Radxa Cubie A7S";
+	compatible = "radxa,cubie-a7s", "allwinner,sun60i-a733";
+
+	aliases {
+		mmc0 = &mmc0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_ps: regulator-system-power {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_ldo_input: regulator-ldo-input {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo-input";
+		/* ETA3521: 0.6 V * (1 + RP298 / RP299), 30k / 10k. */
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu4 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu5 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu6 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu7 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
+	disable-wp;
+	max-frequency = <50000000>;
+	no-1-8-v;
+	vmmc-supply = <&reg_swout2>;
+	/* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
+	vqmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&osc {
+	clock-frequency = <26000000>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	vcc-pf-supply = <&reg_cldo5>;
+	vcc-pg-supply = <&reg_aldo1>;
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
+};
+
+&r_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+
+	axp318w: pmic@36 {
+		compatible = "x-powers,axp318w";
+		reg = <0x36>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		aldo156in-supply = <&reg_ps>;
+		aldo234in-supply = <&reg_aldo1>;
+		bldoin-supply = <&reg_ldo_input>;
+		cldoin-supply = <&reg_ldo_input>;
+		dldoin-supply = <&reg_ps>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_ps>;
+		vin19-supply = <&reg_ps>;
+		vin23-supply = <&reg_ps>;
+		vin45-supply = <&reg_ps>;
+		vin678-supply = <&reg_ps>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-sys";
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-name = "vdd-cpub";
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-always-on;
+			};
+
+			reg_dcdc5: dcdc5 {
+				regulator-name = "vdd-cpul";
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				regulator-name = "vcc-draml";
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				regulator-name = "vcc-dram";
+				regulator-always-on;
+			};
+
+			reg_dcdc8: dcdc8 {
+				regulator-name = "vcc-ufs-io";
+				regulator-always-on;
+			};
+
+			reg_dcdc9: dcdc9 {
+				regulator-name = "eldo-input";
+				regulator-always-on;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc33-lcd";
+				regulator-always-on;
+			};
+
+			reg_swout2: swout2 {
+				regulator-name = "vcc-io-card";
+				regulator-always-on;
+			};
+
+			reg_aldo1: aldo1 {
+				regulator-name = "vcc-pl";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
+				regulator-always-on;
+			};
+
+			reg_bldo4: bldo4 {
+				regulator-name = "vcc18-codec";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-name = "vcc33-18-usb";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-name = "vcc18-hdmi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-name = "vcc-pll-dram";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc18-pf-pc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-name = "vcc-efuse";
+				regulator-always-on;
+			};
+
+			reg_dldo6: dldo6 {
+				regulator-name = "vcc-ufs";
+				regulator-always-on;
+			};
+
+			reg_eldo1: eldo1 {
+				regulator-name = "vcc09-vdd2l";
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				regulator-name = "vdd-cpus";
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_pio {
+	/* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
