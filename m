Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37C1478E41
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529995; cv=none; b=Ca9GJCejQ4jcPMWtST2q1/cN0mDid1r4tQpa224fCCly07f+SOeFe2Y91RWJKw1wQOvuScM6UWXKd9gInGOznWVSJLDRv5eFiA94vgLK4LNIidSPt2FhhNvat8jOSLPwlHLClY49/EmMx8o/4hGRTBN1UPsmxKwQFnhSgFen1a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529995; c=relaxed/simple;
	bh=Drk0K/uRYJeext107bjG2LKQPGz3AB500i+fJBzlQsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RsRmVOXix8yqsk9M/A8RDcHP5n+x5v2EcUFfAHMyhYX5SafvIeLcT4uuE4QXFTYu96iNIKYFPY213PXcXdF/xk9xcA72WSmxWZQdlwtylMxr11/5VItE6NcuJ8QOrdj+mUMAMWfuvdq9ByvKR9XMCFCrGBi6zIKfgd74sG+NF1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEbat2X+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEbat2X+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so7227505e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529989; x=1784134789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBkRK4qvw3GAK88j75HJZJSZl22o0gWGNwof6GHgXyo=;
        b=sEbat2X+1nbawx/NzRTvTh5Y5Zasf7eolG9qC01ssmVi2ed0vNUiXz5g/C5VNMjT5Q
         4G1FnaGjauuzKYrD5uM3ClQVJpZYnbOxdXWAXpzPfHxi5akZUFfW/OLKB1t4ECJ+lCIy
         npQ7TvLYZqY0JjKmf0lOYGIPNkdUbsLGr7pqYfjo4nEMoUXTx/+0sOfGJW3Y6/ZRftES
         vRQ1WFJFBPVnk9zDQMYSMLpeiEidXcjvriKBYMTntXx7njT3Q9tB+cSQ5Ip+vIWUT6XU
         UCEMFixLbjSkzOfYkmf6fjG4Wa6EZ52yGy+jQmhT/KSq4QPOYeMApKFgil6uOBD+U3BG
         Ktzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529989; x=1784134789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBkRK4qvw3GAK88j75HJZJSZl22o0gWGNwof6GHgXyo=;
        b=NsfAJ6P+zQ6/clPvZA4RIUadAYV/lVRbpo5Bx8GwHc2G0ohukHT1TKu/+St4Glzpqa
         fBQfFGA/at+xzr+vuaJ6Kceosl8kHJgBTkxwqGvt6Wo0rwi2kSz2CIoBm2gSZana9xzB
         Ms24M5fNx23yHLFqtxpWjHd458iLAjHOgesB/B0gaYwHESkJ5SxP+OkBhWhGtgkIOne/
         x+Tpo23wF7w4vIwSkIn83GgibtZyd1HsEa5LqRy5RqnXbDU1HAe9zp+811OiKqrgQO+B
         M1ybTSfClkBYSFQ/mQZhhKk9c0mT/9eMJ8yjuKm0jvTCsPTYOhmK0kJa+cjpYfpnqtqO
         TFvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBY0X79F9rWB7WcY6cNZpJVknH6ytZWaySNKR6zXFCgb8UbQrGiFqO6AJtM1Tpv7/0QrEpLI3rLJuR@vger.kernel.org
X-Gm-Message-State: AOJu0YwcJnFzJA2X9VPosCR7f9wRJxiqdZRJ6530Tf2XxllxmMKNcnZx
	+mv6S4mnRotS8gOnjTn04Ucnw7X3gKL+JQmBNDE0l3EjjCodF/B5i7CA
X-Gm-Gg: AfdE7cn8YB4cxs4hxOqcDfojmJ79s0wfkwXHMPka1zh4TIUpE02tITTaob4SCc/LzU7
	dgiDTjHUbT9x4bOxc1JwubkWD7aaLXF2qZRlv4cOBG3sHcGpHAnhgFI6DCQg6HFVgh9VLb2q0X9
	9TpKlWOPS6Nmmi0AHmHPqolzYfQTLpKGZTWLBsHenk25v03wG0MmzKfUqdcv8FtB9ANvAh7rqdq
	+aCx7jzdfSht2LcYbwazJkqnosoHsPWLD5731KZpKzv1nsfdhIax32icxa95M55YbXL0OBctD74
	E3CM0FF4tdPFDqa9AzaAAo4uEbpL3AoNuPcMQJgRIT0sCOkLlbJfF27WeE6mnfmvtE9giDJc3SX
	oBu0xoIwVAxjuAiHb5mrhjg2AT8Gsz+OZ7HCeBOQDoVciNj00n2eWWKq7fbuepjMuwOcDwSX7EE
	jfC7dnDHuyNLHPIzR++/jBXaU=
X-Received: by 2002:a05:600c:8a1a:10b0:493:b646:dc2f with SMTP id 5b1f17b1804b1-493e689fd8cmr27584755e9.13.1783529988806;
        Wed, 08 Jul 2026 09:59:48 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed92sm141201035e9.9.2026.07.08.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:59:48 -0700 (PDT)
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
Subject: [PATCH v8 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Wed,  8 Jul 2026 19:59:29 +0300
Message-Id: <20260708165929.2233934-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708165929.2233934-1-tmaimon77@gmail.com>
References: <20260708165929.2233934-1-tmaimon77@gmail.com>
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
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 404 ++++++++++++++++++
 1 file changed, 404 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d133..7717c3a8f 100644
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
@@ -26,12 +62,380 @@ refclk: refclk-25mhz {
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
+			no-map;
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
+				compatible = "fixed-partitions";
+				label = "bmc";
+				reg = <0x00000000 0x04000000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				u-boot@0 {
+					label = "u-boot";
+					reg = <0x00000000 0x007C0000>;
+				};
+				u-boot-env@7c0000 {
+					label = "u-boot-env";
+					reg = <0x007C0000 0x00040000>;
+				};
+				kernel@800000 {
+					label = "kernel";
+					reg = <0x00800000 0x00800000>;
+				};
+				rofs@1000000 {
+					label = "rofs";
+					reg = <0x01000000 0x02C00000>;
+				};
+				rwfs@3c00000 {
+					label = "rwfs";
+					reg = <0x03C00000 0x00400000>;
+				};
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
+	status = "okay";
+	nuvoton,spix-mode;
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
+		fan-tach-ch = /bits/ 8 <0x0 0x1>;
+		cooling-levels = <127 255>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		fan-tach-ch = /bits/ 8 <0x2 0x3>;
+		cooling-levels = <127 255>;
+	};
+	fan@2 {
+		reg = <0x02>;
+		fan-tach-ch = /bits/ 8 <0x4 0x5>;
+		cooling-levels = <127 255>;
+	};
+	fan@3 {
+		reg = <0x03>;
+		fan-tach-ch = /bits/ 8 <0x6 0x7>;
+		cooling-levels = <127 255>;
+	};
+	fan@4 {
+		reg = <0x04>;
+		fan-tach-ch = /bits/ 8 <0x8 0x9>;
+		cooling-levels = <127 255>;
+	};
+	fan@5 {
+		reg = <0x05>;
+		fan-tach-ch = /bits/ 8 <0xa 0xb>;
+		cooling-levels = <127 255>;
+	};
+	fan@6 {
+		reg = <0x06>;
+		fan-tach-ch = /bits/ 8 <0xc 0xd>;
+		cooling-levels = <127 255>;
+	};
+	fan@7 {
+		reg = <0x07>;
+		fan-tach-ch = /bits/ 8 <0xe 0xf>;
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

