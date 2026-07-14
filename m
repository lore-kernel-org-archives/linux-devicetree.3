Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529139A040
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030909; cv=none; b=p05/gu9NPPZETOn5lZ1mxuj6mqx9BDSOsb60p/3tg2YuRquUxZNwBvyPOhA8ZZxrwOrQWVVs5D040qz89520nDmPpx0+l6bBqUl9oaVcZyWHtCRxMf1o7GTF5zoqi6cjXVQM94SavkMCBS4j9opeHtkMvin+voD16rLgt1UQxRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030909; c=relaxed/simple;
	bh=PyTLKMJXGuF1yHpJqcMkOWfcnQ1F3RSW5qywVPrYbhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucgKptByVoE1Du27pGvv5lbGf8CfrQfnNb3oowEYLF4XHiCWOHfoMU/tSwgTn1EHdPA+cTSX5L7yoOnB4f8I1Dy+FwWh8/CR0yhamdtjXOQFAa7AMAP8DajgtIY0Hl4SSq6HZ98Aqfxxr+4gnPXs6Dz62ZvtoPg9Uqc4312AWgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeQ02lUh; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeQ02lUh"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1583246a91.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030908; x=1784635708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+sHQh7xsIPCcx3DDu2sbd8ZKJKkQ8GLklEL0hevIC8=;
        b=EeQ02lUhYd0UlYeNJQyg0EwTTYagTsEKaUhYjiiuNVro+9hJG516ifzAFmdzSFNMq8
         L+tkGmMa4YVLLxWVJnzDCGumhmPOihFeG2GK/YUJiVXlv4gne5zdCpqUh/6nmoqs6CmK
         F8tOpj3e2USy4iqxuvWnqXijwyeIYOi4fkJPWyGph8TOUH90GoYH+fjyql19FpyL9oHe
         cvfVgcmulT15u0yfBEeRctckTpySW0xOmiANiT/GUpCZPm3O0rlcGDiU2xtKhSptn7ez
         ZIgQBvqNj2Nix2SlM9PMLv8hK2dfqdZO/eb8cxSGUVHlyhweNu9AJ56/kcyyS+3OipIf
         qD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030908; x=1784635708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+sHQh7xsIPCcx3DDu2sbd8ZKJKkQ8GLklEL0hevIC8=;
        b=MVkHis9tC3/zsjWqSnYJkJZ7G+5Np8yS0BvNAlxvgoESpSDoX+iMybObJCHBGOeMsz
         duI5HmP202JSFMEfth/oTQf7wW8cYdXvqBo0EcUfsdJjuvTri1Cy/17yRXWRLB3Qga6k
         ENn4pSqmf40AQGHP1SnEYxakxL+v7Nf4sD64CVv/n7UJutUeS39jvXr/JX3ZCf30bjkG
         CE/H8GpPViH93uYyCSaGmCPfuqdTMQb6hLCYoHqcBmd04gT8WMcFKUj7dNt5xpcLG1Mt
         aP7s8QvbjmUXsjxZLtjXgJmNwWUa5gMmBQv8SZrVNZcrS7HinuPjD0NOhPKDmQli7R2K
         qx2Q==
X-Gm-Message-State: AOJu0YySCqD+eguMUXStrP2uYHbUIHuxI91krCX8W+TKwHcW4eNMmR+8
	KBWivGFt2lkMundWptTHjLOu1ZaXIZrHGC2cztHxxCFTm9NtrE051vs1tEMYsQ==
X-Gm-Gg: AfdE7ckFBr2oHkV0tTU6ojD9KejbhQBtLW5f9h2/Xu6QQN6SxlU8kBolgQ7/xckPwT8
	rQukIE/c55Axdu20ML8D41etO43DyOfqlrdr/Et1YL23h5W5dyE/2+t9r1oUdhCofPh50VBpOdD
	RJyxE8SaevhC7fEgwqXNsux07LpN7G7AB38MlQ0E4cyhmoA5GwRQ6AiptLNY8MbVmXfpN0DGA3W
	aTg8UqsAsTqtfWu143GbAWQRxTFo/+bym5RJqD3y2c0yT2fZ1NFI/1abS5FZ30tCyS35grFNrWW
	DYBRFxFBYsU8SB6UV4U9pDwfSkeU6CN4L/j8ehL6mhlCzgN+bzo2jejz1pYg1N7xZJMghtGZqrg
	wFYvANw7kzZbj9z5sny8CndISq9gjK0CcjX4oUNwvFXp08x6vHtG/qEd65KYT+OMilFyCTsVODd
	JWH3YV9lvoCw2Wjcp5mzyaR7eGi13GQgyyOG9oDwCYe7G0PTOhkqdjlVAqv+4=
X-Received: by 2002:a17:90b:180d:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-38e1af3481amr2454300a91.32.1784030907614;
        Tue, 14 Jul 2026 05:08:27 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172dc530sm1384425a91.8.2026.07.14.05.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:08:27 -0700 (PDT)
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
Subject: [PATCH 2/2] ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
Date: Tue, 14 Jul 2026 20:08:16 +0800
Message-ID: <20260714120816.1504058-3-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120816.1504058-1-chou.cosmo@gmail.com>
References: <20260714120816.1504058-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative PCA9532 LED controllers at address 0x66 to support boards
populated with the PCA9532 instead of the primary PCA9552 at 0x67.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 289 ++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index a966be69f..86e2b5aec 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/usb/pd.h>
 #include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/leds/leds-pca9532.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/i2c/i2c.h>
 
@@ -113,6 +114,58 @@ led-7 {
 		};
 	};
 
+	fan_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "fan0_blue";
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_leds_alt 8 GPIO_ACTIVE_HIGH>;
+		};
+		led-1 {
+			label = "fan1_blue";
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_leds_alt 9 GPIO_ACTIVE_HIGH>;
+		};
+		led-2 {
+			label = "fan2_blue";
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_leds_alt 10 GPIO_ACTIVE_HIGH>;
+		};
+		led-3 {
+			label = "fan3_blue";
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_leds_alt 11 GPIO_ACTIVE_HIGH>;
+		};
+		led-4 {
+			label = "fan0_amber";
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_leds_alt 12 GPIO_ACTIVE_HIGH>;
+		};
+		led-5 {
+			label = "fan1_amber";
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_leds_alt 13 GPIO_ACTIVE_HIGH>;
+		};
+		led-6 {
+			label = "fan2_amber";
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_leds_alt 14 GPIO_ACTIVE_HIGH>;
+		};
+		led-7 {
+			label = "fan3_amber";
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_leds_alt 15 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	sled1_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -129,6 +182,22 @@ led-1 {
 		};
 	};
 
+	sled1_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled1_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled1_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled1_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled1_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled2_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -145,6 +214,22 @@ led-1 {
 		};
 	};
 
+	sled2_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled2_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled2_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled2_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled2_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled3_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -161,6 +246,22 @@ led-1 {
 		};
 	};
 
+	sled3_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled3_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled3_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled3_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled3_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled4_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -177,6 +278,22 @@ led-1 {
 		};
 	};
 
+	sled4_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled4_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled4_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled4_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled4_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled5_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -193,6 +310,22 @@ led-1 {
 		};
 	};
 
+	sled5_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled5_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled5_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled5_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled5_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled6_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -209,6 +342,22 @@ led-1 {
 		};
 	};
 
+	sled6_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled6_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled6_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled6_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled6_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -401,6 +550,24 @@ sled1_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled1_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","SLED1_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled1_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -487,6 +654,24 @@ sled2_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled2_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled2_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -573,6 +758,24 @@ sled3_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled3_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled3_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -659,6 +862,24 @@ sled4_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled4_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled4_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -745,6 +966,24 @@ sled5_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled5_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled5_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -831,6 +1070,24 @@ sled6_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled6_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","SLED6_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled6_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -957,6 +1214,38 @@ fan_leds: pca9552@67 {
 		"","","","",
 		"","","","";
 	};
+
+	fan_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"presence-fan0","presence-fan1",
+		"presence-fan2","presence-fan3",
+		"power-fan0-good","power-fan1-good",
+		"power-fan2-good","power-fan3-good",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+		led-4 { type = <PCA9532_TYPE_GPIO>; };
+		led-5 { type = <PCA9532_TYPE_GPIO>; };
+		led-6 { type = <PCA9532_TYPE_GPIO>; };
+		led-7 { type = <PCA9532_TYPE_GPIO>; };
+		led-8 { type = <PCA9532_TYPE_GPIO>; };
+		led-9 { type = <PCA9532_TYPE_GPIO>; };
+		led-10 { type = <PCA9532_TYPE_GPIO>; };
+		led-11 { type = <PCA9532_TYPE_GPIO>; };
+		led-12 { type = <PCA9532_TYPE_GPIO>; };
+		led-13 { type = <PCA9532_TYPE_GPIO>; };
+		led-14 { type = <PCA9532_TYPE_GPIO>; };
+		led-15 { type = <PCA9532_TYPE_GPIO>; };
+	};
 };
 
 &i2c13 {
-- 
2.53.0

