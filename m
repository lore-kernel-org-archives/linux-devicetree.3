Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378476;
	b=Eht8ZbiKMg9V4CUDkr7SKeruCCqM4w4p9sB8F/EeBG+8bni6QZ58GI55cKctf9v1RCau
	 rkjiXEf6QZlQai+2Qy8jl72GwwzwxP4FyZNa3VyZxJuHFuRGoumPgm29+b/rdTcF5SBy1
	 w/YKFhZAmutqxwCs3e6iLNj9oLgJ/XMdSCtOLnwyOsbESgNciwIbk4nOzml37/gREu4As
	 3A5rC2fOoQjN31EIAkiGoM3pM6DJ2lc+z/x7+JmjiZr3+1eONLuQkNTfoWt+JSNjEXcJm
	 JLTd12BP1Z2PqPWyqF2sZ6dSVTGZUQcVaXCqC+ipLTdXutG4qaEqbaitUGx2dP6qwIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RufxsIcW9PwsTJgDAnL+Gm8bxlywiO9GN5kbFPWmMeQ=;
	b=12M2RUlnk84riF1T8kyPLG4ciHdPn0m8hgHccQgO9e3ZAbCSUtZNnsVW5kpHsbm3dShc
	 hcxwBBl8CEvP1ZJITR0/hNd/hYEj/+iiZMzzFPWY/puaY4aNj4wRf7Yx2ObfgcfwBWf6g
	 oEmBjDf2Zoe85FruUSFZtEn97r4eTC7vmDnlIqLmYSumlIj0UF9iHEjKu8ALMsY28Gz6d
	 o4mQG/5bmsz8yWuui3a3qPP621vUuKlfisp0+ewsEzkB3G9W7zluLHxGE3/65KP4k/3id
	 w+n4790HhoipJPHoiR9r3F0Tqlw1qeonLjrNTiaTvQ5vabz3kWPCfVPX3xrXxyfhH7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4hkw2Ed;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A50606A333
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A50606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4hkw2Ed
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso3408509a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378474; x=1795983274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RufxsIcW9PwsTJgDAnL+Gm8bxlywiO9GN5kbFPWmMeQ=;
        b=v4hkw2Eds+StnjJ3VJsvNGsVQxq3ls/Exom0sE5UsmnH+Lq65XiEq2nLlksZVKtta5
         y86YOKENYFVDrEBdNEZZiGj5XqVVgeAKI1kNIbyjb3vGfAOlExXZiOznrQxKlL99oPpo
         C1zrxg+NFlGqSd73tO0xBSlUrzNmU9riYpJe+tgVQNXvPhouo3yvr7fWhYunHSHi7NgY
         JBnV8vZGfJKevm4jXn/Q3vOnp1A0WP3l9J1U5I3C8Bkx5di2D+TNZ2YvoQFSX6tMNpuP
         YJJC4UW4RJ20Sk0G5iK8O6nlilKolJbvTrp69HEQbQXP3JjtUByFdisCRyPMYwc5yn/g
         rR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378474; x=1795983274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RufxsIcW9PwsTJgDAnL+Gm8bxlywiO9GN5kbFPWmMeQ=;
        b=ch4ku2NvwjCNTkqf3IkMwXFEQOBnowBfWMJfDv67lND7OQRCwevp2O3eS6g1rbQ7lg
         u4DP1035czwKaYLs+roAPpSVNqJijND1TDhYgszuCd4qyl6ya74Pe2dfchQGeOUh3/6u
         e/S6Z8EaBioySVwsSysLjoNb2RGBb3DsD/Usp0wQbe+4px0cd0VJlJgu+loR2/f6xc5O
         lfQkIj3U1Y5IQQ++PF+ro2ROGhQLmXwW993fgVxtx3RkQ/+MY8czbYl3Z8ZKorSPflU7
         PMhaoXOL6Ykt56Elq2AS7kB+yfzIoXZsuyXorDmfRk1QrsF8T12Uy3nAWjkK/0bQVFhA
         3T3Q==
X-Gm-Message-State: APuU4Z8YO+7txdwmGg5Ig/x134C2F/m9DqyqdgxLdxWx1KRE7P/iGIJq
	9xjtvM7Yts4HldjfSBHyCwAOPEiOosIUD67mtzG3/1ZBASOTYmVMf+rYrvgZ0A==
X-Gm-Gg: AZFdTZf/PgV9eGEhAHsLFDk2fg9E++UAfZztwdPCQBb/RkTfbTkfoajmTcykpWQKYIp
	ihrktJxBLcFRWkC8pdI4/yQJqcv5mbRR4/9kPVnYA+EQBREjEVNdoZor4CaFopcLoPy9tlZ0Cfh
	RGd0rY3OSIqlGckVLO6WieObLVvZHYousE664Kj0r8KzV0Q8jiEo4y3g77107xp6tX0SRShLYlA
	2wRtZJI3PTQWhwhSvWySSDMVK1kszZ66mK7I7vCLE2FG1IsCHisQCW5BNUezeA+W4k3nbHGQuTb
	MH+ocgks6WmN2166LhkvyT+bKpgVLKg+4uthQAHv1/sr2SXwcVUEpGq2NYSNuUSpSFbdaPPR7Iz
	hCUHydbufB4I0XHFRSpsO+mRbUWgwKM83J64oqvdha1wiiy5yPKn5hQkQXrfoXSGJpghqr23bnS
	46UaFe8ZCu+KSSaJSOi1JBxPu6LFhk/F/eQG/TpXQL7YE3MawrB5vKl5CbPuSeZJS7Ow26ZvvOs
	9ZAv0Pu6Gs/csjlTJ/M6MvuQfXkZFFVKBbXuc73K25u8Jj5nJItMQoc3whWKgRo0ZDqrDqsYm2S
	rpqok9rkYC6Xpj1zNXtmsoyU1+w8LUsD+jqey8wvWQx0LeFCVQa03tPCJuX5bt0LVm8eaXHg5vo
	WVN6Jtp2ccA==
X-Received: by 2002:aa7:d353:0:b0:6ba:22f7:189e with SMTP id 4fb4d7f45d1cf-6ba37d63cdbmr4612308a12.7.1795378474325;
        Sun, 22 Nov 2026 12:14:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/18] ARM: tegra: tegratab: Upgrade powerlines configuration
Date: Sun, 22 Nov 2026 22:13:52 +0200
Message-ID: <20261122201407.23742-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Refresh existing PMIC configuration of tegratab according to all collected
information from downstream and device experiments. Complete PMC node
according to tegratab/tegranote7c board configuration. Add missing and
update existing fixed regulators.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 278 +++++++++++++-----
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts |  22 ++
 2 files changed, 228 insertions(+), 72 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index e4ba975fcc3db..9d18cb48a1e63 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -33,7 +33,7 @@ host1x@50000000 {
 		dsi@54300000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_1v2_ap>;
+			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
 
 			panel@0 {
 				compatible = "lg,ld070wx3-sl01";
@@ -77,61 +77,129 @@ palmas_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			pinmux {
+				compatible = "ti,tps65913-pinctrl";
+				ti,palmas-enable-dvfs1;
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&palmas_default>;
+
+				palmas_default: pinmux {
+					gpio0 {
+						pins = "gpio0";
+						function = "gpio";
+					};
+
+					gpio1 {
+						pins = "gpio1";
+						function = "gpio";
+					};
+
+					gpio2 {
+						pins = "gpio2";
+						function = "gpio";
+					};
+
+					gpio3 {
+						pins = "gpio3";
+						function = "gpio";
+					};
+
+					gpio4 {
+						pins = "gpio4";
+						function = "gpio";
+					};
+
+					gpio5 {
+						pins = "gpio5";
+						function = "gpio";
+					};
+
+					gpio6 {
+						pins = "gpio6";
+						function = "gpio";
+					};
+
+					gpio7 {
+						pins = "gpio7";
+						function = "gpio";
+					};
+
+					powergood {
+						pins = "powergood";
+						function = "powergood";
+					};
+
+					vac {
+						pins = "vac";
+						function = "vac";
+					};
+				};
+			};
+
 			pmic {
 				compatible = "ti,tps65913-pmic", "ti,palmas-pmic";
 
+				ldo1-in-supply = <&vddio_ddr>;
+				ldo2-in-supply = <&vddio_ddr>;
+				ldo5-in-supply = <&vcore_emmc>;
+				ldo6-in-supply = <&vcore_emmc>;
+				ldo7-in-supply = <&vcore_emmc>;
+				ldo9-in-supply = <&vcore_emmc>;
 				ldoln-in-supply = <&vdd_smps10_out2>;
 
 				regulators {
-					smps123 {
-						regulator-name = "vd-cpu";
-						regulator-min-microvolt = <1000000>;
-						regulator-max-microvolt = <1000000>;
+					vdd_cpu: smps123 {
+						regulator-name = "vdd_cpu";
+						regulator-min-microvolt = <900000>;
+						regulator-max-microvolt = <1400000>;
 						regulator-always-on;
 						regulator-boot-on;
+						ti,roof-floor = <1>;
+						ti,mode-sleep = <3>;
 					};
 
 					vdd_core: smps45 {
-						regulator-name = "vd-soc";
-						regulator-min-microvolt = <1100000>;
-						regulator-max-microvolt = <1100000>;
+						regulator-name = "vdd_core";
+						regulator-min-microvolt = <900000>;
+						regulator-max-microvolt = <1400000>;
 						regulator-always-on;
 						regulator-boot-on;
+						ti,roof-floor = <3>;
 					};
 
 					avdd_lcd: smps6 {
-						regulator-name = "va-lcd-hv";
+						regulator-name = "vdd_lcd_hv";
 						regulator-min-microvolt = <3160000>;
 						regulator-max-microvolt = <3160000>;
 						regulator-boot-on;
 					};
 
-					smps7 {
-						regulator-name = "vd-ddr";
-						regulator-min-microvolt = <1350000>;
-						regulator-max-microvolt = <1350000>;
+					vddio_ddr: smps7 {
+						regulator-name = "vddio_ddr";
+						regulator-min-microvolt = <1380000>;
+						regulator-max-microvolt = <1380000>;
 						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					vdd_1v8: smps8 {
-						regulator-name = "vs-pmu-1v8";
+					vdd_1v8_vio: smps8 {
+						regulator-name = "vdd_1v8";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
 						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					vdd_2v9_sys: smps9 {
-						regulator-name = "vs-sys-2v9";
+					vcore_emmc: smps9 {
+						regulator-name = "vdd_emmc";
 						regulator-min-microvolt = <2900000>;
 						regulator-max-microvolt = <2900000>;
-						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					vdd_smps10_out1: smps10_out1 {
-						regulator-name = "vd-smps10-out1";
+					smps10_out1 {
+						regulator-name = "vd_smps10_out1";
 						regulator-min-microvolt = <5000000>;
 						regulator-max-microvolt = <5000000>;
 						regulator-always-on;
@@ -139,90 +207,88 @@ vdd_smps10_out1: smps10_out1 {
 					};
 
 					vdd_smps10_out2: smps10_out2 {
-						regulator-name = "vd-smps10-out2";
+						regulator-name = "vd_smps10_out2";
 						regulator-min-microvolt = <5000000>;
 						regulator-max-microvolt = <5000000>;
 						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					ldo1 {
-						regulator-name = "va-pllx";
+					avdd_pll: ldo1 {
+						regulator-name = "vdd_pllm,x,u,a_p_c_s";
 						regulator-min-microvolt = <1050000>;
 						regulator-max-microvolt = <1050000>;
 						regulator-always-on;
 						regulator-boot-on;
+						ti,roof-floor = <3>;
 					};
 
-					vdd_1v2_ap: ldo2 {
-						regulator-name = "va-ap-1v2";
+					avdd_dsi_csi: ldo2 {
+						regulator-name = "avdd_dsi_csi";
 						regulator-min-microvolt = <1200000>;
 						regulator-max-microvolt = <1200000>;
-						regulator-always-on;
 						regulator-boot-on;
 					};
 
 					ldo3 {
-						regulator-name = "vd-fuse";
+						regulator-name = "vpp_fuse";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
-						regulator-always-on;
-						regulator-boot-on;
 					};
 
-					ldo4 {
-						regulator-name = "vd-ts-hv";
-						regulator-min-microvolt = <3200000>;
-						regulator-max-microvolt = <3200000>;
-						regulator-always-on;
-						regulator-boot-on;
+					avdd_touch: ldo4 {
+						regulator-name = "avdd_ts";
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3000000>;
 					};
 
-					ldo5 {
-						regulator-name = "va-cam2-hv";
-						regulator-min-microvolt = <2700000>;
-						regulator-max-microvolt = <2700000>;
+					avdd_2v8_front: ldo5 {
+						regulator-name = "avdd_front_cam";
+						regulator-min-microvolt = <2800000>;
+						regulator-max-microvolt = <2800000>;
 					};
 
-					ldo6 {
-						regulator-name = "va-sns-hv";
+					vdd_2v85_sen: ldo6 {
+						regulator-name = "vdd_dev";
 						regulator-min-microvolt = <2850000>;
 						regulator-max-microvolt = <2850000>;
 					};
 
-					ldo7 {
-						regulator-name = "va-cam1-hv";
+					avdd_2v7_rear: ldo7 {
+						regulator-name = "avdd_rear_cam";
 						regulator-min-microvolt = <2700000>;
 						regulator-max-microvolt = <2700000>;
 					};
 
 					ldo8 {
-						regulator-name = "va-ap-rtc";
-						regulator-min-microvolt = <1100000>;
-						regulator-max-microvolt = <1100000>;
-						ti,enable-ldo8-tracking;
+						regulator-name = "vdd_rtc";
+						regulator-min-microvolt = <950000>;
+						regulator-max-microvolt = <950000>;
 						regulator-always-on;
 						regulator-boot-on;
+						ti,enable-ldo8-tracking;
 					};
 
-					ldo9 {
-						regulator-name = "vi-sdcard";
-						regulator-min-microvolt = <2900000>;
+					vddio_usd: ldo9 {
+						regulator-name = "vddio_usd";
+						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <2900000>;
 					};
 
-					ldousb {
-						regulator-name = "avdd-usb";
+					avdd_hdmi: ldoln {
+						regulator-name = "avdd_hdmi";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
-						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					ldoln {
-						regulator-name = "va-hdmi";
+					avdd_usb: ldousb {
+						regulator-name = "avdd_usb";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+						ti,roof-floor = <3>;
 					};
 				};
 			};
@@ -230,16 +296,28 @@ ldoln {
 			rtc {
 				compatible = "ti,palmas-rtc";
 				interrupt-parent = <&palmas>;
-				interrupts = <8 0>;
+				interrupts = <8 IRQ_TYPE_NONE>;
 			};
-
 		};
 	};
 
 	pmc@7000e400 {
+		nvidia,suspend-mode = <1>;
+		nvidia,cpu-pwr-good-time = <300>;
+		nvidia,cpu-pwr-off-time = <300>;
+		nvidia,core-pwr-good-time = <641 3845>;
+		nvidia,core-pwr-off-time = <2000>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
 		core-supply = <&vdd_core>;
 
-		nvidia,invert-interrupt;
+		/* Clear DEV_ON bit in DEV_CTRL register of TPS65913 PMIC */
+		i2c-thermtrip {
+			nvidia,i2c-controller-id = <4>;
+			nvidia,bus-addr = <0x58>;
+			nvidia,reg-addr = <0xa0>;
+			nvidia,reg-data = <0x00>;
+		};
 	};
 
 	/* eMMC */
@@ -271,12 +349,13 @@ backlight: backlight {
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 
-		power-supply = <&lcd_bl_en>;
+		power-supply = <&vdd_3v7_bl>;
 	};
 
 	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
+		clock-output-names = "ref-oscillator";
 		#clock-cells = <0>;
 	};
 
@@ -303,35 +382,90 @@ key-volume-up {
 		};
 	};
 
-	/* FIXME: output of BQ24192 */
-	vs_sys: regulator-vs {
+	vdd_5v0_sys: regulator-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_3v3_sys: regulator-3v3-sys {
 		compatible = "regulator-fixed";
-		regulator-name = "VS_SYS";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
+		regulator-name = "vdd_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
 
-	lcd_bl_en: regulator-lcden {
+	vdd_3v7_bl: regulator-bl-en {
 		compatible = "regulator-fixed";
-		regulator-name = "VDD_LCD_BL";
-		regulator-min-microvolt = <16500000>;
-		regulator-max-microvolt = <16500000>;
+		regulator-name = "vdd_3v7_bl";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-boot-on;
 		gpio = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-		vin-supply = <&vs_sys>;
-		regulator-boot-on;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_5v0_hdmi: regulator-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0_hdmi";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_smps10_out2>;
+	};
+
+	vddio_1v8_cam: regulator-cam-vio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_1v8_cam";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&palmas_gpio 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
 	};
 
 	dvdd_lcd: regulator-lcd {
 		compatible = "regulator-fixed";
-		regulator-name = "VD_LCD_1V8";
+		regulator-name = "dvdd_1v8_lcd";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
 		gpio = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-		vin-supply = <&vdd_1v8>;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
+	vlogic_gyro: regulator-gyro {
+		compatible = "regulator-fixed";
+		regulator-name = "vlogic_gyro";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
+	avdd_hdmi_pll: regulator-hdmi-pll {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd_hdmi_pll";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		vin-supply = <&avdd_pll>;
+	};
+
+	vdd_3v3_com: regulator-com {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_com";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
 	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
index 00126da319ec7..f461a2c492b1f 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -6,4 +6,26 @@
 / {
 	model = "Nvidia Tegra Note 7 (P1988)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
+
+	i2c@7000d000 {
+		pmic@58 {
+			pmic {
+				regulators {
+					ldo4 {
+						regulator-boot-on;
+					};
+				};
+			};
+		};
+	};
+
+	regulator-gyro {
+		gpio = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	regulator-hdmi-pll {
+		gpio = <&gpio TEGRA_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
-- 
2.53.0

