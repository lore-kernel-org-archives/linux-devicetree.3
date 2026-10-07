Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E5A40BCCE
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358026; cv=none; b=MoCL+58/5sto49Trl3Tg3dafCwwlw7y8qQJx69w2V1m7VgYxOR/p5SPBtAJiREmjwDysX4TDZeQM4kD/nStog+lVRYm9ZzJVkuZOjcWp7zE5JjsgtTUm7b7UPBP/1ARrP9H+37gFmpERjwjI5mvBYwnJgVNNoF7IFBGX+JgHjC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358026; c=relaxed/simple;
	bh=cnL3wHabtvE75yselPI1gF3hE1XXXdyI+Ryh0cPnIWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwheYyGv7Gnr1gR2fRQeeSiaaUFSjR5s8arAw3YsCYoJLv03qgo4QFcQl/oekD3IVIN0QsTC59ivnh4ygn/WNpRetQYHiYFrjSk2FaA1tVSuiTQYTvB2VCCGZxeyLqmyxhBxD3TDB6wZccX3NTaH2UYeDHqJk2PPvdv0rlwiIB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFAAigS4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFAAigS4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso14980435e9.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358023; x=1791962823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1+uUeXQ7isnmGwkHOEGzJ/rbBiZI0pwst6VjBVDaKo=;
        b=eFAAigS4jgbETNPRO0FpjYS+0ykzkiMoKPV+03GL+WQ1tnt5Lg2o0Ag5Y+lmpsVHO+
         7u29YGrWxd5cYVuFZLYfLNauvFtuYUubEeUNOaYu3Dyv5V+fZdxIsU3NTBxgNU8NaLSC
         GxaTCbnUhbjR+NQhoP5wsiGGaACS+7K+H1mOh8omZnJvf8sv87JPtBU1m2Ln+XguLvtc
         JJ7Gk6ixQui6nfI1QWna82O+5yyUS5pYjdRyUN475Zxqmy4L8n2lYUYq6e1YAyhsKDtO
         3olThOaEbGSosmv2TRZThS5fTA0pfVTbpAjqZiRB+c2So1p/NXv+qPto0k1CfwHdIfBP
         7jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358023; x=1791962823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1+uUeXQ7isnmGwkHOEGzJ/rbBiZI0pwst6VjBVDaKo=;
        b=fvD9YxLeZxhRvxS1wswyZOyeMz3qQDnBjqDqtvxV6VyGQDntQAdxz3vASyn1pZtAIA
         wYzqGlW/cUIOxvuMk8R439cEl6Xn+wUSJsWVNWNiM8agJA+NxF/rvkAHXzp01KAYf2ZB
         9QmpTPW9fqWEzDUSh514V/5mssufxBFvzSEhIaxBmCt60qvCGwaA7bePABICrGDFWHFa
         wJiEd42sdw3sMrokvwK6gjsQhW4t9imqxblfs2F4D+3ln+nMtAiOKk2rirsxAQL81tbx
         H0c/YL5Bi1GGEHqYn1SotLf7PsyumIOy5Qxn1qZndb2PEV3eDO75V+QJJESnz2kkTba9
         MAhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaFcqlAkK4bKjz5ZrUzaqE3+t2M50vxIhRoL9c/+qCbNywGQCM7Z8r+DDi/D31OYhLW2gF7ITKEAb6@vger.kernel.org
X-Gm-Message-State: AFuF++m+RWI9TlRhP+fkvwdxlq85jKlo6U9MhaV/I41WRJwp4AoZ2Dul
	LQFhH/7o4liVEWqJ7WHT9p05IoEK2HOusGXV4glLVi/NICAzv2MC4dgM
X-Gm-Gg: AYBFou0hXUcXdfqBgLFncsplMENBznBfFccr0jrjUaflVDFovEruRFIzll49HWiD4BZ
	SxxGC/rYtpMAmeGW+yAnooys8nJMkpKGRIHXOTaej0Zcxa7X66ZHPGSnMYZOZZaE/29puZXwqvl
	jF/KGMmu6PJhxLqS0wJnnRfqA+Lrbe0OEN9pd/RD8iuw1+XaRPxCBHZFN5wl9ia5Uq9vhOcPfeI
	QsXLEdHG8ppxnVESUwHuweeqGEqd4Px8v89Fm3Kw6NTQR2OLbCqrzbZkycMLNVBc/aCE/bvdgWc
	/sGbL5E970S44PFlqDGYoWfekbSRK5kH3f8fYwPxSHP1GwMCllD354+5DohLk+/Ijh3J2g6m00H
	jPMCRoTTM9AHCbq99CQBE2B/qqwoshkdbMMZG6Tpha/I1kj0LwNjUuD0kl9RMKmAWn94L6vvFCP
	vG2DStbG92+UjT81EFYBpAfS16b2RbOQBLawbAqZdLhInJUFrXiO6Ll9dUIlS3wn35vO8NhJOYv
	iXVUDrNXo2jrqAoD3U=
X-Received: by 2002:a05:600c:a104:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-4a1815a339cmr7750675e9.22.1791358022473;
        Wed, 07 Oct 2026 00:27:02 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:27:02 -0700 (PDT)
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
Subject: [PATCH RESEND v10 6/6] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Wed,  7 Oct 2026 10:26:45 +0300
Message-Id: <20261007072645.1618147-7-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable peripheral support for the NPCM845 evaluation board by wiring
up the SoC controller nodes to the board design. Add board aliases,
GPIO-backed MDIO buses for the external PHYs, a reserved-memory
region for TIP firmware, and flash partitions for the FIU boot
flash. Enable the Ethernet MACs, MMC controller, FIU controllers,
USB device controllers, ADC, RNG, PWM/FAN controller, I2C buses, and
PECI interface with the board-specific pinctrl and PHY connections
they require.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 435 ++++++++++++++++++
 1 file changed, 435 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 2dc1a4f..3d88af3 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -9,6 +9,42 @@
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
 
@@ -16,6 +52,30 @@
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
@@ -26,12 +86,387 @@
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

