Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380B1429811
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107712; cv=none; b=q8REN1szX+Is0XlSJp0ufr/aFJtUT1eueMVgnv117XhY8Z4SQXpUD401B5Nf44w77N8g8OPcexF2WoQZfUjcvKOV4JO4WLiFSEAHbOs8X2VkI+ExscISA9BWGKbU/1HWSiqiRol0YVJnEgotXytuKmhhIV1S9mfO/Xe6fKFtulw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107712; c=relaxed/simple;
	bh=4pLPCcZinmhfu4KYZH2JtYrkwOv3dP1jixT11hG+8/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BIuHvBqC6SmtJVxSqj0Gkh9Wl1Hhubjjnxce1YxcsJlHwIkVcEluzJlSKAjQfLRphpGNx3s32FKD5YNOiO/Hv3WQyQXPrbATTEMceknJcrXbv5QhYwiHbTDxt3gIiPko4uzqa+q34u9lm1kzuddhfDwERZNpak80xtPdNL3PCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBezH2fR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBezH2fR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bebb72b845aso1107436166b.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781107709; x=1781712509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTXGHU/oEkz1moSyTioSxdal8lLGUBzZP39XpVBmETQ=;
        b=GBezH2fRqji3LhdzmM4OoTqMIv5e8eZi3iPtQrToAp2V5wVUlLBVDk90SrJMktwY4r
         XePTgX4rgACXetHO6F3z6gDDnXoE0Fihx3UPYRU6qf28svtQsHv8sB8YL53goO05JiOX
         20NJ2PU4wwrX8qq46CUJ6zbP6UBmF16+aTbJNYAzk1Wp83NSqwoPBrzpL2X8TNB12vUG
         yo3oloWJnhDpQQEf4WQa7R07sq2FpVBR8S4F/mzWeDeqRxS1MhNag191voXK9iO+GHIs
         Zi9jU+0Be/9jUXpkPZplnO4WEkmVSIdn4dU2Gsn7rMZCRcL1CmeS2/k3ls6ipT+l6YM0
         OQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781107709; x=1781712509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UTXGHU/oEkz1moSyTioSxdal8lLGUBzZP39XpVBmETQ=;
        b=EcRgsFmL1Vnzk+AA7gsFehenTAqyGG0u6Fm3TygU8KSWKE/8AGy+Ku2/mnpuQCjz2Q
         6lS1hxVYrsGGAjdO9Y7NBrwwckY690Z+scrPvdh8Ftt7Y1UHUu9clAvDgJ1OC5nP8w+7
         1OAzXddwwn60m7EFd19OQ67v0yK6DfLRFwd4RnpQugHiJ3TNMXbIGdWO/NbxhcNb/e7b
         Dk6GXMfKI0n/51kcZPhFwlb7qrAGTLACcWBddhejtM1TX2AM0F1yd4t4uwGtfD1b6dZB
         L5bQ2TgVz6hXbAcecUv67ZFmKghSfxr6JuCD0VCbl0B9ezHTLi9BYLJce3R95lxV7s8C
         Wnww==
X-Forwarded-Encrypted: i=1; AFNElJ/0RsOOt1wR4HO8ZptEyEsZT+XmXNX8OQ8UXSk5WFqhTkmd2dP8xUS9Rf16uh71u7zxVpjEDfNfGVGt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4x/66sjUuPriiZAVBP0VtwogxMahgOUFGtyfucqLZ2CBsJF2H
	w96Cb3QxVUUXCVQB1W+bSN7EwnWSPZiPgsGqa7L5l534sSAqArXW4Ci+
X-Gm-Gg: Acq92OFmz6/Z/triPpW+X49AoC5VCAu6J0b3Y5OFIeg81QdWT/35gC1+7PdQMj1qpON
	k+Xp1DYMujvOLIb+yeKu0ttJ6hmQstJB7pr0+IzfpnYwOavtvXawDB9JcdcFgRulQpMgOAxiP7L
	BLqGHnqYb4fJ1UGkY74j9LXr+xlOn4JgM6qaSxUcurZ+YfGJnfD5ZhNwI+vcNg/p4EapQ1xQYQg
	77cPq0Npdi22knv3u0lT5h9/TVn57PITRJa3h0BAi/Th8XjFP6yVWa3KJY0g0VaGXyOjrxN6tSD
	7xv+aw5G/VcLzSIb4TDmBGUozASPERv0TCxY8pZanlnHDjVeLHtyr2omKogKTkt3jhlxL27jTBV
	Qp+GwAjKndLcVjY+l1gQKeNWnCeuURLFME8MfUF2KRStq5tZfvqzNU5NdnAPLp4mP2fW+Cv2onQ
	exzumzaAEgllwBprsI7XYp/OXLu0e3ShyOwWVvzi25nYA3
X-Received: by 2002:a17:907:9689:b0:be2:9d25:3da0 with SMTP id a640c23a62f3a-bf37234b5b5mr1414865066b.25.1781107709391;
        Wed, 10 Jun 2026 09:08:29 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm1188524466b.45.2026.06.10.09.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:08:29 -0700 (PDT)
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
Subject: [PATCH v4 3/3] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Wed, 10 Jun 2026 19:08:16 +0300
Message-Id: <20260610160816.2828713-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610160816.2828713-1-tmaimon77@gmail.com>
References: <20260610160816.2828713-1-tmaimon77@gmail.com>
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
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 413 ++++++++++++++++++
 1 file changed, 413 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d13342d..ea92888d9b9e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -10,6 +10,42 @@ / {
 
 	aliases {
 		serial0 = &serial0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+		ethernet3 = &gmac3;
+		mdio-gpio0 = &mdio0;
+		mdio-gpio1 = &mdio1;
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
 	};
 
 	chosen {
@@ -26,12 +62,389 @@ refclk: refclk-25mhz {
 		clock-frequency = <25000000>;
 		#clock-cells = <0>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tip_reserved: tip@0 {
+			reg = <0x0 0x0 0x0 0x6200000>;
+		};
+	};
+
+	mdio0: mdio-0 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>,
+			<&gpio1 26 GPIO_ACTIVE_HIGH>;
+
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+
+	mdio1: mdio-1 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>,
+			<&gpio2 28 GPIO_ACTIVE_HIGH>;
+
+		phy1: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-mode = "rgmii-id";
+	snps,eee-force-disable;
+	status = "okay";
+};
+
+&gmac2 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r1_pins
+			&r1oen_pins>;
+	phy-handle = <&phy0>;
+	status = "okay";
+};
+
+&gmac3 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r2_pins
+			&r2oen_pins>;
+	phy-handle = <&phy1>;
+	status = "okay";
 };
 
 &serial0 {
 	status = "okay";
 };
 
+&fiu0 {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bmc@0 {
+				label = "bmc";
+				reg = <0x00000000 0x04000000>;
+			};
+			u-boot@0 {
+				label = "u-boot";
+				reg = <0x00000000 0x007C0000>;
+			};
+			u-boot-env@7c0000 {
+				label = "u-boot-env";
+				reg = <0x007C0000 0x00040000>;
+			};
+			kernel@800000 {
+				label = "kernel";
+				reg = <0x00800000 0x00800000>;
+			};
+			rofs@1000000 {
+				label = "rofs";
+				reg = <0x01000000 0x02C00000>;
+			};
+			rwfs@3c00000 {
+				label = "rwfs";
+				reg = <0x03C00000 0x00400000>;
+			};
+		};
+	};
+};
+
+&fiu1 {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			partition@0 {
+				label = "spi1-system1";
+				reg = <0x0 0x0>;
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>, <&spi3quad_pins>;
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			partition@0 {
+				label = "spi3-system1";
+				reg = <0x0 0x0>;
+			};
+		};
+	};
+};
+
+&fiux {
+	spix-mode;
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
+	status = "okay";
+};
+
 &watchdog1 {
 	status = "okay";
 };
+
+&pwm_fan {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pins &pwm1_pins
+		&pwm2_pins &pwm3_pins
+		&pwm4_pins &pwm5_pins
+		&pwm6_pins &pwm7_pins
+		&fanin0_pins &fanin1_pins
+		&fanin2_pins &fanin3_pins
+		&fanin4_pins &fanin5_pins
+		&fanin6_pins &fanin7_pins>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fan@0 {
+		reg = <0x00>;
+		fan-tach-ch = <0x0 0x1>;
+		cooling-levels = <127 255>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		fan-tach-ch = <0x2 0x3>;
+		cooling-levels = <127 255>;
+	};
+	fan@2 {
+		reg = <0x02>;
+		fan-tach-ch = <0x4 0x5>;
+		cooling-levels = <127 255>;
+	};
+	fan@3 {
+		reg = <0x03>;
+		fan-tach-ch = <0x6 0x7>;
+		cooling-levels = <127 255>;
+	};
+	fan@4 {
+		reg = <0x04>;
+		fan-tach-ch = <0x8 0x9>;
+		cooling-levels = <127 255>;
+	};
+	fan@5 {
+		reg = <0x05>;
+		fan-tach-ch = <0xa 0xb>;
+		cooling-levels = <127 255>;
+	};
+	fan@6 {
+		reg = <0x06>;
+		fan-tach-ch = <0xc 0xd>;
+		cooling-levels = <127 255>;
+	};
+	fan@7 {
+		reg = <0x07>;
+		fan-tach-ch = <0xe 0xf>;
+		cooling-levels = <127 255>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <0x10>;
+		i2c-protocol;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ipmb@11 {
+		compatible = "ipmb-dev";
+		reg = <0x11>;
+		i2c-protocol;
+	};
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
