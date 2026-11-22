Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378486;
	b=PjLgRdILbQpCN0RrRw75c6WJjJeJos//Yj66VssfHBTRWpCZzeADXGPvIqIPIJKcGkm6
	 RRs5ntNlCy9aLxKYm33RQNRe7Xp5a7spUSVFQ3yUJGSdMGmn05C9+xZyhQUnU97w5wNZX
	 OIufBIY1xU8MqwD+/BYT2zGCp8EAlBm1hk4Ibxz5wHL9LFz6Bdppug9iPQCvsqiihkiKQ
	 hp1gpVeOFkdlvgr4UHhKEIZJ+fPsALnZpwaGo8akWBTPDzuTkVqjMGL7sCoqsfVrHm8sQ
	 wgG1Q5j+4IbYn9LmJBtLhoCqYJUxRNLEasXTncIRGTfji+vSXhWPFiXGx94zlfbMpkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tqLwe6+0JoMMxyiooOlwMvbknZ3XaI9g0cAtNiC83UI=;
	b=4Vk4R8wsHfLS8WCS81gO5OS+S/d9/omEkf6oscbFfUV2Yt4AyNCqlIpclvPfhTZWIoE7
	 J0xi/+pd+npjFiaJRyhUKye31xAvw/i94cMzZq2wC7cvB5D5dnkhoDaGyQTmKetK8rbAd
	 OuSLJXaua8m740L4Iz5sQ1ouQCmskfMZiKAlCHEE2VIKsG4L7gm0IpPWyxczE8qWUYNFG
	 c6A+aJaT+AxDy5eylcfFap+2l1bpbkPE1eFkYvVfhbTUJ79o4QG8oW9psnTM3O7Ibv6ad
	 Us8Amtvl1ws8JQD5j8z5LsE6KhQ1lE0Q4Akr6tC6IAK5JYaGql8jBIo2l5Afjdvr4/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yppbj1xt;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C63D606A338
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C63D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yppbj1xt
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso3408654a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378485; x=1795983285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tqLwe6+0JoMMxyiooOlwMvbknZ3XaI9g0cAtNiC83UI=;
        b=yppbj1xtN75l6P8tn83PjOJ+DLOquw9vfG2lxjJU6n5f3ReTDp4ci37K+B/XDneFhD
         LLhMUDlQf4scGGD/ovVz6/K49f7XpVv0s6vMhDIbHwU61h0zMJb7qLd7r+QrzLrL47Rx
         85KjLrfTeR8WXAr/Ic/cpkIAkATh7teZpGgrlwxn2aOQVRVVWL/TeU/NcQMqxXY+MXsa
         egDDPEekksEMoLWpMJhCfWhdXogMWeB5EBWDdQsOe0c5ve82c8u60DAGmQN47aPQMlcQ
         qokJXzr8b7EfqBgVequ8+UsRj7L+i1QsV0NMrlJw4yMLUMlMB0ZnOs9jH4p3Lm1AXlGQ
         9diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378485; x=1795983285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqLwe6+0JoMMxyiooOlwMvbknZ3XaI9g0cAtNiC83UI=;
        b=ZLyTn6wJS2bSLIGtvmtPl+tqyL2IxTzPtFAQMVbqrdXs8E7MG5HKKawUeO4HyVj8PA
         MBhsPVaScEYxnovtZ4xCZwm7TXcUgHdsOBQbJ9FZJ52XGG00p8/MKEwv2c2hez4WOKap
         1YbSl+Ci06wY65pIptXnvx3jNgX+gVg+WLRY+Y0olXmbEyB7PEsUXTEUYURoEzoRlFAo
         XnVNjrKSoaCy0QZd53LAserGvvaaNRj8jRgsY05MjnAHeJBMVar+/gZAiGSUyX/+A9Yn
         mmZlmZX/hSnCodcYY37k+oN+w0755TnKtQZfkdyAXvu7LKkKg8kwN5oim/rV/Gb7bTHT
         jRow==
X-Gm-Message-State: APuU4Z960nSvmcyOOKNxHivNcS8xef0Ore1vQAD2eNOMBEqVuD/svUnc
	6oVV5Qcn/oc8Uk/fkwkTMwnvEeUiGFOz88VDQCUPePi4PUiuzVfxZSn/
X-Gm-Gg: AZFdTZfMLuHC+ieWQAyXuTrYu/+a6nGnmL8RrhAIilT3gnpRiGALSaRyEoqzVOoVoFC
	ow7IJmK5aOPcplzX651coENyWeahypvT3+Q5wbsWcatdDx0hcAsrCGuicZpwu6gZifOHPjfQLyr
	yLwsjRUA+YSw3H2wm3b9jNN5ej8/vYjNgkOjcJHAEqvPswrrWqLlpJIUlFD0+F3H/exrB3b2Xfk
	2+jqWmqgfy4IzGxz14oK9tc2Xke4MasIUz7mI78T3HVPLcs/kXaqHyEYfre3Lny8YvveIWuO8qb
	6eKlbxGxBJclJXmZjfB5IEkjq39teMW0VR/LZ3PuXi/kQsntKYgnkrpsI6xEXzB5olwBF+FOoC5
	B3TC6E+yr7Wd7J7Bb34XldrsSFf5aHUazeb9B0BSsGaWjqrk5d8jFmJ0/mZOoRyOTaJKqn4DGTs
	6O+Ofltm8wYhZFltLrvYNigqVXCxcBwFAlxKkX2p5djCAEaNRs31bLwD3xWZhEpsjsn8hVqZWi2
	hpe6HcR80HtwGHK2BUqD1KT8UvxpsftpwGbt7JknEVxRovVpJ8L+fLRwFyfFxFBvYpnSenXb0j8
	kQtwDoydjieMeD8cfFRwPHXZp6HPG3wm5aKUOwWj6ASnwiPa5ZXq7KYqwdoYRrB+pj5vWQv02gN
	rtIpCwUBtOA==
X-Received: by 2002:a05:6402:3222:b0:6b8:7e86:3e90 with SMTP id 4fb4d7f45d1cf-6ba654bcff6mr3922317a12.38.1795378484595;
        Sun, 22 Nov 2026 12:14:44 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:44 -0800 (PST)
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
Subject: [PATCH v1 08/18] ARM: tegra: tegratab: Configure wireless devices
Date: Sun, 22 Nov 2026 22:13:57 +0200
Message-ID: <20261122201407.23742-9-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tegratab uses the Texas Instruments WL1801 (WiLink 8) single-band
combo module — providing Wi-Fi, Bluetooth, and Bluetooth Low Energy (LE)
for wireless communications. Additionally, the tegranote7c variant
incorporates an Icera i500 modem for LTE support.

The Wi-Fi interface is connected to MMC1 (SDIO), and Bluetooth is linked
to UART-B.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 51 +++++++++++++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts | 12 +++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts |  5 ++
 3 files changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index b7a14e24df79b..bb5788b2539cd 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -18,6 +18,7 @@ aliases {
 		mmc2 = &sdmmc1; /* WiFi */
 
 		serial0 = &uartd;
+		serial1 = &uartc; /* Bluetooth */
 	};
 
 	firmware {
@@ -934,6 +935,30 @@ drive-gma {
 		};
 	};
 
+	serial@70006200 {
+		compatible = "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
+		nvidia,adjust-baud-rates = <0 9600 100>,
+					   <9600 115200 200>,
+					   <1000000 4000000 136>;
+
+		bluetooth {
+			compatible = "ti,wl1801-st";
+			max-speed = <3000000>;
+
+			clocks = <&palmas_clk32k>;
+			clock-names = "ext_clock";
+
+			enable-gpios = <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_HIGH>;
+
+			vbat-supply = <&vdd_3v3_com>;
+			vio-supply = <&vdd_1v8_vio>;
+		};
+	};
+
 	serial@70006300 {
 		/delete-property/ dmas;
 		/delete-property/ dma-names;
@@ -1015,6 +1040,11 @@ palmas_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			palmas_clk32k: palmas_clk32kg@0 {
+				compatible = "ti,palmas-clk32kg";
+				#clock-cells = <0>;
+			};
+
 			pinmux {
 				compatible = "ti,tps65913-pinctrl";
 				ti,palmas-enable-dvfs1;
@@ -1281,8 +1311,20 @@ sdmmc1: mmc@78000000 {
 		nvidia,default-tap = <0x2>;
 		nvidia,default-trim = <0x2>;
 
+		mmc-pwrseq = <&wl18xx_wifi_pwrseq>;
 		vmmc-supply = <&vdd_3v3_com>;
 		vqmmc-supply = <&vdd_1v8_vio>;
+
+		wifi@2 {
+			compatible = "ti,wl1801";
+			reg = <2>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
+
+			ref-clock-frequency = <26000000>;
+			tcxo-clock-frequency = <26000000>;
+		};
 	};
 
 	/* MicroSD */
@@ -1409,6 +1451,15 @@ key-volume-up {
 		};
 	};
 
+	wl18xx_wifi_pwrseq: pwrseq-wifi {
+		compatible = "mmc-pwrseq-simple";
+
+		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
+
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <100>;
+	};
+
 	vdd_5v0_sys: regulator-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0_sys";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
index 409df3de17a82..8177e4f7db489 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -6,4 +6,16 @@
 / {
 	model = "Nvidia Tegra Note 7 (P1640)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
+
+	pwrseq-wifi {
+		clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
+		clock-names = "ext_clock";
+
+		assigned-clocks = <&tegra_car TEGRA114_CLK_EXTERN3>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
+		assigned-clock-rates = <32768>;
+
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_CLK_32K>,
+					 <&tegra_car TEGRA114_CLK_EXTERN3>;
+	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
index f461a2c492b1f..9447203eeda36 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -19,6 +19,11 @@ ldo4 {
 		};
 	};
 
+	pwrseq-wifi {
+		clocks = <&palmas_clk32k>;
+		clock-names = "ext_clock";
+	};
+
 	regulator-gyro {
 		gpio = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-- 
2.53.0

