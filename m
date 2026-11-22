Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378483;
	b=zg9AupqiqKF0Fmip3xmGOJVnBG9U8qe9NY31/7kknty65jz21RxkuN4+7gh4HsYittgu
	 UyZ9jxpvUn/CM6yL/pHg8/YT9fxvkHKU+WfGPBl4u1WYd/Yc9N42ZZK2lMgs7YIhJMiq0
	 FKg37vNXse0Do1VkoXf87mjMjfsisLPTerlpAPD6UsMP7lbsI2C/Ox3yeujtkEqcYeCmX
	 OPkJe9xWZi9HTm0/SoixC7ou3nSAc/iY+ze24PixKV7cCGFN0+4DQj6/Tx+JI46Okodvk
	 rwZLSBOxONNAXZPWXnFGmn4dqW69oEC5pQ0lxb6YJDiXHJrOV6bT48MsAWWoHQfNoVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=avCVUDrooB22hMBb4h+eP/HEoR+1Ep1WqePqDENU9wo=;
	b=E/GP6ZbUWmczm/6uK754cizo4p041L2gv6R6wNYUob2Lhwgw2cip2KASOn9WpQkDy12Q
	 zSObN+3lr+OxAuln550RojT5vdXutPN4ZqbkCAizhzL8E6cgzlnMesB+0+c71nzDkglMl
	 2IDS0Q1Ozc3p7KNJ0h4x5yoTZBpXcRkTfffaNcanNC8Un52D/XJe11XSca1lIVU4DXy5A
	 /AKOHSsRlkkuNdw4Y/7N7EQp5jAn96esbfk+VPMU4PQAk+5Rkdo+4fJK5BvzxeCNZB5Zk
	 3a885NUTdi4TPqGBHeyb08y54UMQvMZ9nvVriSHK6YK3TK87iNIkccRx350NHFKJBEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWuRdJOL;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A4D606A696
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A4D606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWuRdJOL
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so597971a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378481; x=1795983281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=avCVUDrooB22hMBb4h+eP/HEoR+1Ep1WqePqDENU9wo=;
        b=wWuRdJOLTWSRrG1GN35fu/fJ3O+5Fiywjt/Z/wNz4rBYs8psR24yswJzDPArrOAuGW
         yrTcDQt63ubedRyHEupTeThX9GRQxRhcu3x/qbroPQEG63NPA6BkfyRqEwgMxsNXB0Wd
         ezkaosIDpVWcEMV0PxcnNci8R3TUTGT6GiBig5Ubn3xP77Ai9VzNGyK6DVmn73muH4vq
         NehEO1oQfHb0M2nyfyo5Jr4kAs+vTRP4oMqYhD3J/IvpiVxIGNu6GUUlATBrUSkboeS9
         6kNDEX4AQRD8wBE0NcbM1e1WCEzbkwaktRYLUmlLg7+/WZuh6Dovp2vXNr55YI0RzKyo
         nmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378481; x=1795983281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=avCVUDrooB22hMBb4h+eP/HEoR+1Ep1WqePqDENU9wo=;
        b=MJ26+ax9+i9/Pq9HWztyIKAglmApbxSgilQGukFJuzcPkUVyG3vW2EmWrFP6dwDEPN
         0p1+srS88JIliIRKMK+bWKcf+13g4m1H3+PCm5XMLKX6OqaRcB4Es8RzTHpdN9l3z0m7
         g+ESSmbXxCWp/0scFyNnj834rTRnWkk1yRZb8TxR9U/Ku0lDG4fnobcApdUIuWmWsL5v
         fova3sNqrOyx+Rk48DWJPJdGPN7G7xJfxEju8a0oQKKCbMFXbYQYoaGz1LHI6cYUFyKO
         3Gz8IXHIBe7EPolFks3ZTfnwUHH4mO5BB8Bz1esVse3lAV7RLXNXV7jb4Lwi0bInTmht
         kNtg==
X-Gm-Message-State: APuU4Z+Nz12wAIuweMf7gOuC3ncjcF2eNbkb+YKFLW3m5nbVqIar+/p3
	71F1R+i+8/TvzbScnqr9PiF306Lo3K1sM2KUApQTXvY+PruOMEC+kpll
X-Gm-Gg: AZFdTZeJtaGy+Ug7v0q2etrIbAHlqEQFMztfvuyDhf6GrjshOH0Kc1xe8Gbuju0SD4j
	uW3NeNKhsubq2bPhYE4zeqeiOxaSFLUQfPF7ky4Ja8LQ6puHiFqV7Br2l0+kUbIWw8sM8lcCysM
	Xt/wJCwjGOZEyC1It2L1c36519LnVWOb+7Xt8NZTEnKXH/z+b3/qmVk8skyx1aamFUbvRCbJ44V
	QWwa0GEaHZe0KF1cG4tpZOqgtZ+c/nMO7iSGB+WLiMVV0ZqUUV/14g7hmxm5p0TDG55tuUkzchs
	yzQFcSjUyRfb0IGDxTIju3xgewQN+E3l9GLPzRkKCmlUoND1Ivk4dhOc2NPyCn5bTKlovH9Fyk1
	BVxtYgc9fMF/GE2K1sFA1ZzNR5nNqb+Zjx3b+DDXkuGulOnDlY5VYxQ20lOMg06PMAppOPAc8K+
	qV+xyTxwswF1dlbv6pJZwf3jBdSCvqbVb4etqHwouLCCHLR2wXYNUY/e/9a2beUNeDiYg30tCVn
	ocBbJQrkrkcIiFGi2mKYveBAcV9nTCsyJF+ocHwGPHGXsUBFrcVXjA2dFK+RI0WqhLiSUFrfwiO
	yW24Sqq5FxCVb3On6L4iAD7miYZz+bitGJ1lFwElpovoru+lacIjxYtle0N+QHBYE8QZk7QULSH
	1qdfrvekWAWzuJvz7x3gwZI1iy6yuIxc=
X-Received: by 2002:aa7:c513:0:b0:6b7:f00e:5e56 with SMTP id 4fb4d7f45d1cf-6ba37c788f3mr5002752a12.1.1795378481168;
        Sun, 22 Nov 2026 12:14:41 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:39 -0800 (PST)
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
Subject: [PATCH v1 06/18] ARM: tegra: tegratab: Configure USB and power supply
Date: Sun, 22 Nov 2026 22:13:55 +0200
Message-ID: <20261122201407.23742-7-clamor95@gmail.com>
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

Previously, USB was partially broken on the Tegra Note 7, as it supports
OTG and requires proper configuration of both the power supply and the
USB controller/PHY.

Configure the power supply by adding and linking the battery cell,
charger, and fuel gauge nodes. Configure the USB controller for OTG
support using the Palmas extcon for ID pin detection and the charger for
VBUS, and add the usb-connector node.

The device now works in both peripheral and host modes as expected.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 98 ++++++++++++++++++-
 1 file changed, 94 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 26f1f7dbcc4c7..2ccee3b70aac9 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -940,6 +940,48 @@ pwm@7000a000 {
 		status = "okay";
 	};
 
+	gen1_i2c: i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <100000>;
+
+		fuel-gauge@36 {
+			compatible = "maxim,max17048";
+			reg = <0x36>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(Q, 5) IRQ_TYPE_EDGE_FALLING>;
+
+			monitored-battery = <&battery>;
+			power-supplies = <&bq24193>;
+
+			maxim,alert-low-soc-level = <10>;
+			maxim,double-soc;
+
+			wakeup-source;
+		};
+
+		bq24193: charger@6b {
+			compatible = "ti,bq24193";
+			reg = <0x6b>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(J, 0) IRQ_TYPE_EDGE_FALLING>;
+
+			ce-gpios = <&gpio TEGRA_GPIO(I, 4) GPIO_ACTIVE_LOW>;
+
+			monitored-battery = <&battery>;
+
+			omit-battery-class;
+			ti,system-minimum-microvolt = <3100000>;
+
+			usb_otg_vbus: usb-otg-vbus {
+				regulator-name = "usb_otg_vbus";
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+			};
+		};
+	};
+
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -954,6 +996,15 @@ palmas: pmic@58 {
 
 			ti,system-power-controller;
 
+			palmas_extcon: extcon {
+				compatible = "ti,palmas-usb-vid";
+
+				ti,enable-vbus-detection;
+				ti,enable-id-detection;
+
+				ti,wakeup;
+			};
+
 			palmas_gpio: gpio {
 				compatible = "ti,palmas-gpio";
 				gpio-controller;
@@ -1210,19 +1261,34 @@ mmc@78000600 {
 		non-removable;
 	};
 
+	/* Micro USB */
 	usb@7d000000 {
+		compatible = "nvidia,tegra114-udc";
 		status = "okay";
+		dr_mode = "otg";
+
+		hnp-disable;
+		srp-disable;
+		adp-disable;
+
+		usb-role-switch;
+		extcon = <&bq24193>, <&palmas_extcon>; /* vbus, id */
+		vbus-supply = <&usb_otg_vbus>;
+
+		port {
+			usb_in: endpoint {
+				remote-endpoint = <&usb_connector_out>;
+			};
+		};
 	};
 
 	usb-phy@7d000000 {
 		status = "okay";
+		dr_mode = "otg";
 		nvidia,xcvr-setup = <7>;
 		nvidia,xcvr-lsfslew = <2>;
 		nvidia,xcvr-lsrslew = <2>;
-		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-		/* Should be changed to "otg" once we have vbus_supply */
-		/* As of now, USB devices need to be powered externally */
-		dr_mode = "host";
+		vbus-supply = <&avdd_usb>;
 	};
 
 	backlight: backlight {
@@ -1235,6 +1301,19 @@ backlight: backlight {
 		power-supply = <&vdd_3v7_bl>;
 	};
 
+	battery: battery-cell {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+
+		charge-full-design-microamp-hours = <4100000>;
+		energy-full-design-microwatt-hours = <15100000>;
+
+		precharge-current-microamp = <256000>;
+		charge-term-current-microamp = <256000>;
+
+		operating-range-celsius = <0 45>;
+	};
+
 	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
@@ -1242,6 +1321,17 @@ clk32k_in: clock-32k {
 		#clock-cells = <0>;
 	};
 
+	connector-usb {
+		compatible = "usb-b-connector";
+		type = "micro";
+
+		port {
+			usb_connector_out: endpoint {
+				remote-endpoint = <&usb_in>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
-- 
2.53.0

