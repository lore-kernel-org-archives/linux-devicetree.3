Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413620;
	b=DaGr6RuhxwW7dZ5GbAd9NzJVKuf5uy5eMnIm98lvxeGwOD2KrB+Fc01rvlz7hvTLFwgj
	 raZT55R5Fq+DHhHLX+jCBnblzh7n1/p4TITHnJ5nuYQriDLBmWYfwZqy87wIurUL2Z3qb
	 KRRpr/hv3CVHvkj0hTvUaHLXMsTLM1th15EZxNsElvHapakaXmDfnn0ZvOcbDZSTuYGaq
	 RNqbbsL/UIuB7jv3NqFJwmfhB/MrkZRQfAvemVYcHbgFnRCWvqygVv4wjPbsSg2yYShNj
	 u8jUBahtDm+PfxjPf5DngONvFCkrqtNkcmrAF7g3gi02EhyPUHcN1NO2qtUL2EIV9WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
	b=MDaILlVya22zV4qaLkg3uvMzMZrPPZWwx7cBvWCyuQiBpX0oWf4XyZBI/kBrcAJIHKwp
	 qPOgTdvvg/suFT27mE6MYWKMA5CnXOYTAredGF4jVrFVbr1BIXJZPqAo3d75bo6ivOdTk
	 WVDsy9c6yREURMAOzwcVjOeLA5PnTyexyRF57+2tAGp2yPnYNBsb3Bzb6avsrs8fzZc+z
	 R0PYiwZaZc8anpHySVyLsw7GhrbGnwnxIGKZhlBoy5mRuSEvNjaZjm/57DWtiD9ynOROG
	 a7IaMi+Wh0oKtWuML2pGgHfw97vJ+ZgDXPQ2q7rWn9UbGmuzXGNIUvr4hb2DjsZ4Www==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVxOmS9O;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E6606A31F
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 02:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6E6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVxOmS9O
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6f5a0893610so1061586eaf.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 19:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413619; x=1794018419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
        b=XVxOmS9OdonU/MYcK+/aI70tR+rw8NSM9QLWa9a+f5NUja5ORZb2x54RN7lUY0p6sA
         s0WctjX2akC11IgSWYpJ3T3CxqvnlfLWeZ/hvBZUT2vj6slFW8ZE6Is5cwb79QhM3B9i
         r66W8MEXRktgyZozPRkxAlJdGVv1M4SdIHrEDErG/OXhNtThhPo087sfpXO+hp6uMwX+
         YYnUG/quz14XH8pRO221mxx9A5w1P20ym3IZExCrgoHYj0eoKGc0fdhKQNRhazAg769+
         WmhzyJ9g0MXQt+Mz7H7KKNHjGFeZ/dP3Em5GLkI0fwgBeTNaVldC1zW5OtuZYgOnU8jg
         lCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413619; x=1794018419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
        b=xpIpVXcnIG5gK3Kg84xuTzXz9E/lknzzVsoidqfIS1A7A2RiBvMCxrtPPkr3F6YPVf
         28bqMj6u6PlQPmkXAko2ST/R+Bf5ye52jx3cmKgRAYsumQMOZIzcpRh1o2kI/PE8BDu4
         5Lg3boy8V+p4uoMn4YgVxK/rFVL0rViskEFrN1Quxrf1R6nsKTpwVUKmgQbgFwddFhRQ
         ZbvQGVWkyXVosdFG+XyEUhnkFrcs0QHNa0syHR8EYG4kWpxtvsFnglhRvevObxfAv/WX
         wzf7kgzV6GFy8TNlQLbbe4QyV1wKL5RLqP8JW67FIdm3s159RGglsrn7lD69pn7qFYPq
         166w==
X-Forwarded-Encrypted: i=1; AKwUvBxVBpLUAfOyIL251Fz+S3f5/bTnWe33lZDuvmUOexWavrK/YwplBIyYVbWzhF+TMmw9TyRpx2tYG+bO@vger.kernel.org
X-Gm-Message-State: AFq9FYLODp/4dbDAA2Sw65FB5Hu34/8MrT1guat0+vGYCnyqE39mkuGt
	j+UZJiYBtlc9tCNv9k/BNfEtsz6daD3KbgZcvHhZabb8baM/9LzoCPBl
X-Gm-Gg: AYBFou0wQKGFE7ZoS4jrTsc2dpMRBnFSzFGtfCH1waesldc8IWFGn8P+6JpJSuovgS7
	rkfrP0tpM/ItUtZvGF3hlBL/Ti7rwNjLaP77QZlpzVxeJvrS9LXyX7XvT582DnUoRMlaePs6lPb
	lYtgMgkY+pkH9mxPRIos85UIqr683Ol9zeqvhhU4gAqwIZuVvp8aNXSULOEAIpIqWbibm9QF1EX
	ZKhG8yP69YlxuoVmXdM8IONBt2zR4H5pSM0TWz1FYVWYt4vzWbn+fXiiYDWATb4A9g9q5UF5P0T
	BVX6hlb4jGruoEtXx2pKBNWZu8sbKUU3+Mvn9u4SiCC8ylx3zu+houIXOvzAiQknposhZrnVpHs
	A98iaL0ae7kXuKenJN8xx3kIaY4GYF8GK5xg3WAGX340dDueK64DRpMjxY2WaxhWk6rBXGCpaLU
	hrUewBMrl1gah3hTtEcCPmV7TsHRjgnn1TLR9V7vfSRFjQflTK2HqV6FrX+HKDRZHZN+bN573Nv
	vKBNgEI6kiDIGj9FC00sGXBcjQhAn3x+Q/jWGj/gvCNVmWSE04cka8Gl8ThgR4ktFNO3FowQTEn
	mftULLSY8PoW54YiEYEylZ+9FbME8ZaiIiYqCgPpt3U7yjt3MzFcJrusZZv4l5Zxm2Js6cFHfEU
	9SIoeTpyyGr+kVLZ6NIWY4yqem4A=
X-Received: by 2002:a05:6820:1384:b0:70a:12a9:c43d with SMTP id 006d021491bc7-714f2988c22mr2274753eaf.22.1793413619538;
        Fri, 30 Oct 2026 19:26:59 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354d12f2sm3401232a34.17.2026.10.30.19.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:59 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 30 Oct 2026 22:26:57 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-3@gmail.com>
In-Reply-To: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
References: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Supply the 26 MHz crystal and 32768 Hz RTC input, enable UART0 and the
AXP318W on R-I2C0, and describe the schematic's PMIC input/output and
CPU supply connections. Preserve firmware settings on rails whose
working voltage is not established. In particular, BLDO2 has no
programmed voltage constraint: its software 3.3 V selector does not
establish its physical output with the schematic's nominal 2.4 V input.

Describe the card's SWOUT2 supply and PF6 active-high detect with an
internal pull-down. Enable MMC0 at up to 50 MHz using 3.3 V signaling
only. Its high-voltage path uses VCCIO; CLDO5 also feeds PC and the PF
1.8 V input and must not be raised for SD signaling. Firmware must
select the 3.3 V PF path; dynamic voltage switching is not provided.
Keep other storage off.

Connect the documented bank supplies. PL's self-supply phandle is
omitted to avoid the PMIC/I2C/pinctrl bootstrap cycle, as on the
upstream Cubie A5E; ALDO1 is retained always-on. The separate pinctrl
fix is required so these connections do not trigger incompatible one-bit
bias programming.

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd6461d5a40537473fc62da6ba6a0d82c0..792152525b433b0caa5118ed2669f548835717e0 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 0000000000000000000000000000000000000000..341c24360ce29e29f8fc4631924eaf48b7b1f809
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
-- 
2.53.0

