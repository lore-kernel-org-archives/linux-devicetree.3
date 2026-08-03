Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3903FFF85
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756093; cv=none; b=cFpuj0KSM8pZ5geeQIQ6HmTxDCn5EQ9Pt5QSntkWohrY4GmflnFuLcuFjMkLSXDAa1eqxYug8bw5LaAiCNm49Hs5/PEfZhqfz3vp/ZGXcLGVqff29LG+SeT4XD81RdAW+ucBBUdG79Lj6Ums1+YfcQHuK1tEDYQ98cTcRPD9EUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756093; c=relaxed/simple;
	bh=qwJgR8YtPYnDszheTMpyH4QeZ61nZUCcuQbRiZGQ1yQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rhr6GXO7zFMevgbPGLA0nJ6cShaQ6e6q4hCIS9Abye7xJeQhGTSjuPO7x4QSTCey5NK0EfQ3Vemayob4JVrPx/zTzFJ4WnUeZKfBkuWZ5Vf2TcXnsZrSnfjPWvYt/rrz+azLPtexRTgfWqSmdxoyCnZB9Vm9iuZUvWV1bLeOhKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELn2v1+x; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELn2v1+x"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f7854678cso1571892f8f.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756090; x=1786360890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwAojWFj1FaBqKUS949mqDER/OD8Ai/Ip7436rIkcQQ=;
        b=ELn2v1+xi7eXGoyUOrIa/8We8GyQhzVbvegpd5wvlKgsIGLlLKto1DH13GGXfr86P2
         POyRU2HHPTpM9rLpYITTYt8CLCzJwP1eieff3cFdIcgf/njOjf2T0AQHtOanJAU/Kh8D
         sjzkOwt3FYqzh3DWTZqXDF/IyeciUIGt/pIhiU0psCacUo2+dZI+MeR9tJJD9sZ6BtYC
         BVzFiij6ZcUADNGqXknOlHwKv32xG6KSabHuyBuMrFyYz8VEjvrqkoQE3ks+Q+GNZ6a/
         b+U7VQIqKVC5jZCnmTxgPAGw5O4VFGtNf08iwk4CVJlGFoDw8cXL3O/RbTTQmiL0n1Xh
         AgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756090; x=1786360890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IwAojWFj1FaBqKUS949mqDER/OD8Ai/Ip7436rIkcQQ=;
        b=Hlrw8pTUCSUDGUKUFjqTEcLCOJ4o1gvoN6Eu1xgWuCy4kyFwIKAsoV3fx/gbB1PywA
         u/V8lzFOZ+QYHSGMNyszNz67Hna/d+YfD/SfBQ4tmpl7QBJjEBChCoiJCzyvU6ssoy4J
         d0jBkgxi5QJXNxOzXkM6ROqaNDvQEV8QmaMBbvcbtl22Q3K0+7xsXHMzT/fA6UWMZHRn
         bWhjL1Ia2OwN7L3xNvLh5A0S5+4f6gG/T2asZj/8ysj9SzMY21eLJqi4NYC9ujGwgBvw
         7zY42AE2z/PZ+qNyrW2q8MM4JiEhXCiXmUjOcEYpzh4ZQ/Inm3MfJucIYOtQVPsOPBrm
         ScqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCt62VSC7dAkPZYQHSg7BBnHuQ6PaqnKAXXvRse8NslLAzomaFZOg9YJTv292SuYFwIlkNFZd7gsEY@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPE4RCmK1cNLqvqmt9tYMGr8DL4NGWE5D493zNwK8DWZBY6wT
	OD0MZvCt021hL5qCTZBO/CUWGyyoeBeBbieo3RGNZ1uRseYm7LrKSEMl
X-Gm-Gg: AR+sD121cPlHOcF+0VobPRMepVU7TSKZeIOvayLMLsedhzuXen7R/b8ThINZ1sq8ORi
	V5VFSyNa/pPuFdBLZLZvZE7/iHUA9Fsj6CwBq2/ESiROqfi6eGcqY6uoXAnVGUqmZluawPX83ST
	iUMazgwbj/XP5Jv7LDDcDf+HeBYEXq6P5U2wjiiI+IDBPUvz6oU41buc6kh2z1EUQYZeS3VtyaP
	amJ5kiVxS3z0kRGst10Uzbot+3MMnD95t7H8eaIP6rwJE/xN5ROyILs+zY1DqXcOdbAv569GZC3
	cFGHI4+NxlRcq+F5ZGpiXHwuzXKnJXZtTxnHA2Y+J0MUloRNgssZ3uDPHsZALHRRpr4IrW+z+ev
	3sNcqouZNmdsvuANDzaEofjScJFOJattVdeNmOMis9dcIfAtbbBo6vpN851m3If5aYt4YmjzWFk
	WX8TDYj0weKBSuKDId3LyFwfxM95/DB7C7Z1PP1mma/fh8YffLzxbAqdnCTs88MaQIsqB/Je4=
X-Received: by 2002:a05:6000:50a:b0:47f:cbbd:30ea with SMTP id ffacd0b85a97d-47fd72a8d0emr21385657f8f.14.1785756090134;
        Mon, 03 Aug 2026 04:21:30 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:29 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v9 5/5] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Mon,  3 Aug 2026 14:19:06 +0300
Message-Id: <20260803111906.1931384-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803111906.1931384-1-tmaimon77@gmail.com>
References: <20260803111906.1931384-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable peripheral support for the NPCM845 evaluation board by wiring up
the SoC controller nodes to the board design. Add board aliases,
GPIO-backed MDIO buses for the external PHYs, a reserved-memory region
for TIP firmware, and flash partitions for the FIU boot flash. Enable
the Ethernet MACs, MMC controller, FIU controllers, USB device
controllers, ADC, RNG, PWM/FAN controller, I2C buses, and PECI
interface with the board-specific pinctrl and PHY connections they
require.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 435 ++++++++++++++++++
 1 file changed, 435 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 2dc1a4fbb..3d88af388 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -9,6 +9,42 @@ / {
 	model = "Nuvoton npcm845 Development Board (Device Tree)";
 
 	aliases {
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+		ethernet3 = &gmac3;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+		fiu2 = &fiux;
+		fiu3 = &fiu1;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		i2c16 = &i2c16;
+		i2c17 = &i2c17;
+		i2c18 = &i2c18;
+		i2c19 = &i2c19;
+		i2c20 = &i2c20;
+		i2c21 = &i2c21;
+		i2c22 = &i2c22;
+		i2c23 = &i2c23;
+		i2c24 = &i2c24;
+		i2c25 = &i2c25;
+		i2c26 = &i2c26;
+		mdio-gpio0 = &mdio0;
+		mdio-gpio1 = &mdio1;
 		serial0 = &serial0;
 	};
 
@@ -16,6 +52,30 @@ chosen {
 		stdout-path = &serial0;
 	};
 
+	mdio0: mdio-0 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>,
+			<&gpio1 26 GPIO_ACTIVE_HIGH>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+
+	mdio1: mdio-1 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>,
+			<&gpio2 28 GPIO_ACTIVE_HIGH>;
+		#size-cells = <0>;
+
+		phy1: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+
 	memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 		device_type = "memory";
@@ -26,12 +86,387 @@ refclk: refclk-25mhz {
 		#clock-cells = <0>;
 		clock-frequency = <25000000>;
 	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		tip@0 {
+			reg = <0x0 0x0 0x0 0x6200000>;
+			no-map;
+		};
+	};
+};
+
+&gmac1 {
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+&gmac2 {
+	phy-handle = <&phy0>;
+	phy-mode = "rmii";
+	pinctrl-0 = <&r1_pins
+		    &r1oen_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&gmac3 {
+	phy-handle = <&phy1>;
+	phy-mode = "rmii";
+	pinctrl-0 = <&r2_pins
+		    &r2oen_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
 };
 
 &serial0 {
 	status = "okay";
 };
 
+&fiu0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		spi-rx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bmc@0 {
+				compatible = "fixed-partitions";
+				reg = <0x00000000 0x04000000>;
+				#address-cells = <1>;
+				label = "bmc";
+				#size-cells = <1>;
+
+				u-boot@0 {
+					reg = <0x00000000 0x007c0000>;
+					label = "u-boot";
+				};
+
+				u-boot-env@7c0000 {
+					reg = <0x007c0000 0x00040000>;
+					label = "u-boot-env";
+				};
+
+				kernel@800000 {
+					reg = <0x00800000 0x00800000>;
+					label = "kernel";
+				};
+
+				rofs@1000000 {
+					reg = <0x01000000 0x02c00000>;
+					label = "rofs";
+				};
+
+				rwfs@3c00000 {
+					reg = <0x03c00000 0x00400000>;
+					label = "rwfs";
+				};
+			};
+		};
+	};
+};
+
+&fiu1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x0 0x0>;
+				label = "spi1-system1";
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>, <&spi3quad_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		spi-rx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x0 0x0>;
+				label = "spi3-system1";
+			};
+		};
+	};
+};
+
+&fiux {
+	nuvoton,spix-mode;
+
+	status = "okay";
+};
+
+&sdhci {
+	status = "okay";
+};
+
+&udc0 {
+	status = "okay";
+};
+
+&udc1 {
+	status = "okay";
+};
+
+&udc2 {
+	status = "okay";
+};
+
+&udc3 {
+	status = "okay";
+};
+
+&udc4 {
+	status = "okay";
+};
+
+&udc5 {
+	status = "okay";
+};
+
+&udc6 {
+	status = "okay";
+};
+
+&udc7 {
+	status = "okay";
+};
+
+&mc {
+	status = "okay";
+};
+
+&peci {
+	status = "okay";
+};
+
+&rng {
+	status = "okay";
+};
+
+&adc {
+	#io-channel-cells = <1>;
+
+	status = "okay";
+};
+
 &watchdog1 {
 	status = "okay";
 };
+
+&pwm_fan {
+	#address-cells = <1>;
+	pinctrl-0 = <&pwm0_pins &pwm1_pins
+		    &pwm2_pins &pwm3_pins
+		    &pwm4_pins &pwm5_pins
+		    &pwm6_pins &pwm7_pins
+		    &fanin0_pins &fanin1_pins
+		    &fanin2_pins &fanin3_pins
+		    &fanin4_pins &fanin5_pins
+		    &fanin6_pins &fanin7_pins>;
+	pinctrl-names = "default";
+	#size-cells = <0>;
+
+	status = "okay";
+
+	fan@0 {
+		reg = <0x00>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x0 0x1>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x2 0x3>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x4 0x5>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x6 0x7>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x8 0x9>;
+	};
+
+	fan@5 {
+		reg = <0x05>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0xa 0xb>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0xc 0xd>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0xe 0xf>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&i2c16 {
+	status = "okay";
+};
+
+&i2c17 {
+	status = "okay";
+};
+
+&i2c18 {
+	status = "okay";
+};
+
+&i2c19 {
+	status = "okay";
+};
+
+&i2c20 {
+	status = "okay";
+};
+
+&i2c21 {
+	status = "okay";
+};
+
+&i2c22 {
+	status = "okay";
+};
+
+&i2c23 {
+	status = "okay";
+};
+
+&i2c24 {
+	status = "okay";
+};
+
+&i2c25 {
+	status = "okay";
+};
+
+&i2c26 {
+	status = "okay";
+};
-- 
2.34.1
