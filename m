Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111769;
	b=y5gzTPQSLv8xNgzj78EDlE2SMrOTQuQdCw9DEYGHYxm22imAu/lI0HpzSip/Q/A/xh6F
	 NZqtCPUUoIJ8t246H1pP2u5S25T3/hZbdPQGkaEjo2uhk59awJZ8mWurHwtXx32wpE3Wh
	 RzD405ITM9963x1DkvHU/jcn4LPyNO3L2q9HFVDZaOY0Dvh/iWTWP55R6wcL0Clw/dCVu
	 0n6G66eOdvaEmr9WCB4tXKnRMas7/Y0gAlkkl8LRiNBgQuktx5gDSi5QsmIFBkBnfh37Z
	 xrR1aBa+f0FuFGwJiTpuWbQY000JKWCBSonLYuo8nV8uOI0VQqQ4M7Av3+ZwhHgKhJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SSo4/Vqvvtb+KkXUpc2xFmAvZShGCLfAbVphelVFNfw=;
	b=KM2tUFEcLl2aMsD+WDi0JZHaqyXjxd18X02ByXxnd+t7RcFvDhHVCH8nqv+hEnY544mi
	 nbCgQag6iv9uMg6sP6vEAbOVtsHSUz2BYywyk+dJnG528N8Tv9959N4Oi0XiVYl5O1AKg
	 SRhrHs5u2EoTe4rKF9eU0bTvOpOE/l/ygj4mK6p+yv+ZdSfABQz0mzI6ABbPXYJKm/02D
	 xjduvaKy1IgNKBuu+KlVMCLR7twuMxEhw88EDyrOPYHMZBsKEc/u4gNadGDT0tYo8ftZI
	 wjrtvCIWO9puKchNmGPNI+zudqK6H1sDH3uydaZ5rnF04Hj/if9Om9FkU3xO63qmxcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/6fzd0h";
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42473606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42473606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/6fzd0h
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-5058b105df7so57412b6e.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111768; x=1795716568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSo4/Vqvvtb+KkXUpc2xFmAvZShGCLfAbVphelVFNfw=;
        b=U/6fzd0h3Wr9JF5Moe4srIDQB3eFmGmHyzvhXPcIYR1xbkGSkq3mvUkzNNeadXcJ1V
         NHdRvgeVaglKA5Tyn6OcHt8C3Wok8oSJcSt2PbzI5hsgQJYVsnzt6AhXr/Mg3H3vXRqC
         d+Ty3meUkeHhcBSPumHnMaVA32EwPSZXxIw+4zz1ZPUKPd7mxUYvE5a+oAvXbmQfaZps
         WSVgDVmza0hMbG7cJIvw/V9Mk0yoBqk3rRE+DYwYMxMtxlPjkqFvTDpdPK7fJmFxRgbU
         kX1LFL+di9o1AVnWNuc286t18VKCwi0EYojf4lIW5t6hKsWPT/KGC49EwOGzCtNxrC13
         rvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111768; x=1795716568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSo4/Vqvvtb+KkXUpc2xFmAvZShGCLfAbVphelVFNfw=;
        b=rmh8ZaRu0vBZvic/eB0oxZAMijIz3de3N33VqZRNmzHgnv0NsWmSoGdiS/vAqazRB5
         HfuHqK/uzAAdQiy6Zhgq1hIMcDTJRdmN68IYlZ3Lq+viZY/O0IvnIBlO9bCULuOcJG9k
         ARgHGfx8/VJo03s3cTMg4zOc0XMUxcXuDWr8ke3W35rrTSEtrlDWV1fKae+OOvt/nFnQ
         hUJXHRvvjL4aVofCa4SxZkQBaG9ZoHkyHE8TEuaqTjftpJ8FImaLI+66wX9R4cw+WH3s
         YHbigTy/sazflofC9KY1ilWIuByug6m80TyjkgkZf+ky1356WaKfJytGMU01okyoMq1Q
         dlPw==
X-Forwarded-Encrypted: i=1; AL+hErFzWA3dgkQmtw7BNSVCH3+WSgTb4p6yY+BNkkXf9REcLaSzSNmaQrWUcxt5+TxXp5LgamrlrVZp6dbH@vger.kernel.org
X-Gm-Message-State: APuU4Z9eppsw8f1kAV04bPrtEyNfrc4lTOXvcKQa+ALtXKKK3uRRuWbS
	JPlqU5TVXpEIquoi8Rc/50vbeihY8gzUJ/l7C36eL++U6UEF6H0NEi+d
X-Gm-Gg: AYBFou3howFvlWmJBnhGj2dojqWFLXEN6AdHYBkckUeyVUZ4ckdy3N5b9Dnn1TfIUdu
	6f9oVHvrMqyf4OdhTQv9XEoDA8CGE1me0Ix4IvUSpNHp3tHjPBXMxFlYV+PKXeWz1CXRQyWElK/
	kgZAtAOmjl95ZZ0bLaDKAWaRm/gJ5fXAZOM9miZpPoI2QW1Hd6UZcoz0jhCsPEymJv9evTL1zve
	oRUnOnjLHn4f0VaUqiJpmxkgG4AwYtiLk3uPkVuvYBNLf4qUkdt47v6GX5U/bYIS6uL1B4NwPIb
	cDLjqd33t20krQUsMQQRZRNLtwqCZiqUlbc/pAs0Ed0aoyXMrTr3+efHjOQFv5Zo8R1WwmHMTwp
	lFU+SXwk8a92cebbdmLFs2KpRuNJZHPk8PX0HfwZAupnZBb9A603u40yIPL6H/bnhFK2/iqQmSc
	5OHcYup7OGhIYjA2PDSgv3N5XiIzJ5ydHq6gmxcDZNzwtnLesms3tzLprB26JLDLit/iaL02HRN
	MQ8A/eW4468vyrmzOuSzBs5VnDnDyQy3Ae1wdTnQ0q2WNZQukGZvaTrnpBcsrm0IvnTcQelu9mh
	LcdOg28F48PNx5cZecmgvI7CQFTrb8ddXcrblP3OddBoMSIXgOO9MFg2+efbqVSuX5b0AcUBX8p
	E
X-Received: by 2002:a05:6808:50aa:b0:4e5:2f2e:45b4 with SMTP id 5614622812f47-57a0a30a0eemr760685b6e.21.1795111768361;
        Thu, 19 Nov 2026 10:09:28 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc61270761sm504813fac.16.2026.11.19.10.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:28 -0800 (PST)
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
Subject: [PATCH v4 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 19 Nov 2026 13:09:26 -0500
Message-ID: <448e7551a6f560d8b8ede245ccfbc74101c76ef4.1795034153.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
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

Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---

The November 18 v4 RAM boot on Cubie A7S with vendor firmware exercised
UART0, PMIC probe and MMC0 read-only transfers. PMIC/NMI interrupt
delivery, card writes, physical hotplug, 1.8 V signaling and physical
BLDO2 voltage were not tested.

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 287 ++++++++++++++++++
 2 files changed, 288 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index da39f02252d4..9d1e740ff19e 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 000000000000..9af9a68950d8
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
@@ -0,0 +1,287 @@
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
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
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
+	reg_ps: regulator-system-power {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
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
+
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+
+	status = "okay";
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
+
+	status = "okay";
+};
