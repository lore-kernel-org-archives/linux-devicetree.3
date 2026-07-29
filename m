Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B04477293
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325392; cv=none; b=Z7cReVK7t9tN2nPCpNILzRcd3o0CkBks7EnBbtrU/AA54YmpYlLqa+3QrdhmDr4th6tZHuHMoKwUMIa61ADuZklqphVCk/nBokoMVe5+DY1LcdeWCwsT5JjiFLEIum8gFtFSBbC0QwTmFUAF3HbnwmGTTQRMXdjnvxqubylNHrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325392; c=relaxed/simple;
	bh=0u6v79Krh5wgu6ieg82TJioz7VCyU2eQjOin5lWXN1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFEVozc0ffW79dLqAPSUQ6NoBPXYjsUnT7vp5gG6z1PqZGlrur6PZKLYQcq5qa4wCmD2SRLQFBc2PbX8M4Qi5UG3Wv8jyyqxRMWgWB50CqdpowCUnCsNINjdM/CMNBmHYj61VpafR3kytNh76Xz8LRRUwMXzKlIqbWGdcTWJi8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKx4k5NI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKx4k5NI"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8486ac3f347so1975521b3a.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325389; x=1785930189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCnLVLhWtVLLmpN3x9fjuaEAEUhiKYtsxACEAQQZJ0o=;
        b=jKx4k5NIB/QHgQfp/pUaJirIjhoZgG7M/w2uVpqOdVcP5atIrHhcl10CExYa6n6mzw
         zDCpIUksgkVlGMD7e4/b+n/SFcU7AWJrm3eTQC9Q+lCdsYsTOeFbSREyPAuwmFVR0ZRp
         Jlf3n82UMPOm/Tdwuy7Q5Rcha/ijf3bz9LQrA03H9nc7yWDnE2H4vZGfAO+Gyrpwuvv1
         Opdng88wCPY3WUEvDCpfpj5eQvzqC5MYi8KixKYyw5FGUNgJbfdQ6x/pf7rUxAmRkrXf
         rREFdwl71LEFiwpxyche69vjU1Bg5nEfd73MA+z+lDHY5lKAmzFKG7bQZzbPEOUg/vAY
         nkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325389; x=1785930189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCnLVLhWtVLLmpN3x9fjuaEAEUhiKYtsxACEAQQZJ0o=;
        b=PWX3yDAreD+lAn1pAMzbmZcxR1A+8qzxLLsOEhgAio6kueyyoKBVcDFp22nbkWgUT4
         LCNSpwBJrYknKbNDlkkteTkWWkc+YufTknO4SL++4ewlcEQuAenZuAImRtTw48X5OWGB
         8YMMWgWWCkAmVY13arZ4BFXJ9ZY0v49FBCBenrIcNXfeFzSIa5eVHBRkAVTY65ySHtWm
         FkE7uKccrhMyPu3Oox8Nn2VBGCyxdniI3xIZHWsEbNw/TaMHnAqmJ+YlcvYgjwo1JsWI
         5tFAN3YadTx5EiYMO2ojaU1TlpFy59Pnn+FA0yOr9YUi3nnBSL2TwNacO2SXYJ65EZ/h
         pjxA==
X-Gm-Message-State: AOJu0Yyyg5PjNYl0ObMmRfqNLV1INTFiLpijiV1TGrRfoUPXil2kRCzW
	JKuoTdK7Qbga8GcuPZW6OHPftw0iVVHlH5I+KfkHt0gB+mhLHBNRcjc0
X-Gm-Gg: AR+sD13AHAzXgfPV2x9xbAiKUH6WcdZrcN+8lNew/ZKiEEhN+Hv0/TI1i/cZ6ytZ9uy
	Xhr+HVbChbNO9VvFZY2cRvr3OpLBlP/hYyp3Z7dFUhKO5Ox1PCSAy9UeaOP92uSYQHpKZnXt0KZ
	xs5l/8o2RTMUBmyx0d9k4M8xL/ajPQMtRLbI0KMARrvgDBGruCQ4RNnD9RNUlo1Ms1pKH01sL2w
	X4Xu3BoXaIocKBHmjyjQ89h04ADpuqloNk6A0gGFO3WlQbYuJBAU1lkpj0rk1Mna21FUZ7NzRY/
	AONmuPLgj/iKkD8aX+UDVNbigR5uRth72SG5JmCqpaojGQjoQ5zxkrRDVoI5Q/+s32XcAEV0BAZ
	Li65FqyPJUbL/mGsIYBrAPdthm/z23h8NEJqm7IihgC/9yW9s0mLXiyKrtD3FOOZJhH/tu6WwS0
	anwysBVVRXZmAl/UsadA5xCk0M9Lr96nOOQyN5usDyouVTeUJ6xwH7tdNbHiVJuNGISyNndBpfF
	nLfQLmd2c474M/o3gKjVlpYskaObUDyUpuG+I5trXaX5g==
X-Received: by 2002:a05:6a00:3d42:b0:848:420a:9ce0 with SMTP id d2e1a72fcca58-84ea79472b7mr1947737b3a.6.1785325389498;
        Wed, 29 Jul 2026 04:43:09 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03cbd1csm1263532b3a.53.2026.07.29.04.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:43:09 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 1/4] ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
Date: Wed, 29 Jul 2026 19:43:09 +0800
Message-ID: <20260729114312.3947300-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729114312.3947300-1-chou.cosmo@gmail.com>
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder child nodes in i2c0-i2c6 to follow ascending unit address
ordering as required by scripts/dtc/dt-check-style. No functional
changes.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 430 +++++++++---------
 1 file changed, 218 insertions(+), 212 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index d1a04b63df9e..b022bdd02c1e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -343,10 +343,25 @@ flash@0 {
 
 &i2c0 {
 	status = "okay";
-	ina230@45 {
-		compatible = "ti,ina230";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
+
+	sled1_fusb302: typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 0) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled1>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
+		};
 	};
 
 	mp5023@40 {
@@ -354,11 +369,6 @@ mp5023@40 {
 		reg = <0x40>;
 	};
 
-	tmp421@4f {
-		compatible = "ti,tmp421";
-		reg = <0x4f>;
-	};
-
 	sled1_ioexp41: pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
@@ -370,20 +380,20 @@ sled1_ioexp41: pca9536@41 {
 		"SLED1_CLKREQ_N", "SLED1_PCIE_PWR_EN";
 	};
 
-	sled1_ioexp: pca9539@76 {
-		compatible = "nxp,pca9539";
-		reg = <0x76>;
-		gpio-controller;
-		#gpio-cells = <2>;
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
 
-		gpio-line-names =
-		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
-		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
-		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
-		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
 	};
 
 	sled1_leds: pca9552@67 {
@@ -401,13 +411,33 @@ sled1_leds: pca9552@67 {
 		"","","","";
 	};
 
-	sled1_fusb302: typec-portc@22 {
+	sled1_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
+		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
+		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
+		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	sled2_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 0) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled1>;
+		interrupts = <ASPEED_GPIO(B, 1) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled2>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -421,39 +451,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled2_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED2_SWD_MUX", "SLED2_XRES_SWD_N",
+		"SLED2_CLKREQ_N", "SLED2_PCIE_PWR_EN";
 	};
-};
 
-&i2c1 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled2_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled2_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED2_SWD_MUX", "SLED2_XRES_SWD_N",
-		"SLED2_CLKREQ_N", "SLED2_PCIE_PWR_EN";
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled2_ioexp: pca9539@76 {
@@ -471,29 +513,18 @@ sled2_ioexp: pca9539@76 {
 		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
 		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
 	};
+};
 
-	sled2_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c2 {
+	status = "okay";
 
-	sled2_fusb302: typec-portc@22 {
+	sled3_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 1) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled2>;
+		interrupts = <ASPEED_GPIO(B, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled3>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -507,39 +538,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled3_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED3_SWD_MUX", "SLED3_XRES_SWD_N",
+		"SLED3_CLKREQ_N", "SLED3_PCIE_PWR_EN";
 	};
-};
 
-&i2c2 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled3_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled3_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED3_SWD_MUX", "SLED3_XRES_SWD_N",
-		"SLED3_CLKREQ_N", "SLED3_PCIE_PWR_EN";
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled3_ioexp: pca9539@76 {
@@ -557,29 +600,18 @@ sled3_ioexp: pca9539@76 {
 		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
 		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
 	};
+};
 
-	sled3_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c3 {
+	status = "okay";
 
-	sled3_fusb302: typec-portc@22 {
+	sled4_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 7) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled3>;
+		interrupts = <ASPEED_GPIO(S, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled4>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -593,39 +625,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled4_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED4_SWD_MUX", "SLED4_XRES_SWD_N",
+		"SLED4_CLKREQ_N", "SLED4_PCIE_PWR_EN";
 	};
-};
 
-&i2c3 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled4_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled4_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED4_SWD_MUX", "SLED4_XRES_SWD_N",
-		"SLED4_CLKREQ_N", "SLED4_PCIE_PWR_EN";
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled4_ioexp: pca9539@76 {
@@ -643,29 +687,18 @@ sled4_ioexp: pca9539@76 {
 		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
 		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
 	};
+};
 
-	sled4_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c4 {
+	status = "okay";
 
-	sled4_fusb302: typec-portc@22 {
+	sled5_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(S, 7) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled4>;
+		interrupts = <ASPEED_GPIO(Y, 3) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled5>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -679,39 +712,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled5_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED5_SWD_MUX", "SLED5_XRES_SWD_N",
+		"SLED5_CLKREQ_N", "SLED5_PCIE_PWR_EN";
 	};
-};
 
-&i2c4 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled5_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled5_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED5_SWD_MUX", "SLED5_XRES_SWD_N",
-		"SLED5_CLKREQ_N", "SLED5_PCIE_PWR_EN";
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled5_ioexp: pca9539@76 {
@@ -729,29 +774,18 @@ sled5_ioexp: pca9539@76 {
 		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
 		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
 	};
+};
 
-	sled5_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c5 {
+	status = "okay";
 
-	sled5_fusb302: typec-portc@22 {
+	sled6_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(Y, 3) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled5>;
+		interrupts = <ASPEED_GPIO(I, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled6>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -765,30 +799,11 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
-	};
-};
-
-&i2c5 {
-	status = "okay";
-	ina230@45 {
-		compatible = "ti,ina230";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
-	};
-
 	mp5023@40 {
 		compatible = "mps,mp5023";
 		reg = <0x40>;
 	};
 
-	tmp421@4f {
-		compatible = "ti,tmp421";
-		reg = <0x4f>;
-	};
-
 	sled6_ioexp41: pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
@@ -800,20 +815,20 @@ sled6_ioexp41: pca9536@41 {
 		"SLED6_CLKREQ_N", "SLED6_PCIE_PWR_EN";
 	};
 
-	sled6_ioexp: pca9539@76 {
-		compatible = "nxp,pca9539";
-		reg = <0x76>;
-		gpio-controller;
-		#gpio-cells = <2>;
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
 
-		gpio-line-names =
-		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
-		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
-		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
-		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
 	};
 
 	sled6_leds: pca9552@67 {
@@ -831,45 +846,36 @@ sled6_leds: pca9552@67 {
 		"","","","";
 	};
 
-	sled6_fusb302: typec-portc@22 {
-		compatible = "fcs,fusb302";
-		reg = <0x22>;
+	sled6_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		gpio-controller;
+		#gpio-cells = <2>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(I, 7) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled6>;
-
-		connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
-			power-role = "dual";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <10000000>;
-		};
-	};
+		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+		gpio-line-names =
+		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
+		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
+		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
+		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
 	};
 };
 
 &i2c6 {
 	status = "okay";
 
-	eeprom@56 {
-		compatible = "atmel,24c64";
-		reg = <0x56>;
-	};
-
 	rtc@51 {
 		/* in-chip rtc disabled, use external rtc (battery-backed) */
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
 	};
+
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
 };
 
 &i2c7 {
-- 
2.43.0

