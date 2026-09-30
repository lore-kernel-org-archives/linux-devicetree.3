Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE4A4BEE3D
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767151; cv=none; b=mXOSfMJYcGn97r5al1lUyk8mR7mnOgvBx4uAENfqflw1sUIATP5q0qTykAgvG+fF4oKFNJVwiGJ9JyXXyi0b8cf9qgWjzD7+REym8lxKizONsiMaQAAkDYF6lgS3W59TXN9fhzmMzQoUNXbt6/dcreZscExPyKVkMZi7lUOCMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767151; c=relaxed/simple;
	bh=BxGOJ/Th4qshLRUnS1+0e8PPROYuHoc0czO5f2I3Du0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bH8sxBArUxLzzkcKl5BLwwk6T61kFjrtBGER0cWOWtzD9cBh69IxZZo/tzheIp13qmvbJqP7qg9BoJd2bIaMOmAyMuEmPrklVNrxGTUIiqgvYYmHs7f36sFDSB0LmWlOzLs0jrzzHqdcDmgzouV2/nvoPBB1ITJlbkyo5Z3EEF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFnbpscQ; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFnbpscQ"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881a3a28e72so1758442b3a.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767148; x=1791371948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+egFjTMnPYoDlT9Bcryc5S9/HI1Lw9q9oWEv1D5Tzbs=;
        b=sFnbpscQf59/HKmwSGDoXK0e3CnhMmQo0KqLmoqcDxy4BTdOkNpQphWUibytyNvNxc
         2T11lW03tW16ksbdZMdse0xM5+PtsNt6jxpUDBsuCYHUqvJcaYM2lR8dEqQE3SabETYM
         fbHezyFO5WVl6eeqrgv5RV4GH3Az3I5o0LBzrq374MMJ+jrLTxbimGowPuvZroPTYgdg
         PAdBsAb7CTB1IrP326vCeZXyKiEUhY+6cjb+kOHgRQsIllSg/UC7UOJg/85WS7RqgAT9
         aqAkmPsEVF3mTMkOyXSgV0GyeOARLYbzcsUEdxhi6gPwiZ8tarrdvTc9mkdl0wwRxnj6
         hpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767148; x=1791371948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+egFjTMnPYoDlT9Bcryc5S9/HI1Lw9q9oWEv1D5Tzbs=;
        b=U7rYC0lJ4sG6NWly0f8o9ajt4QFnLS54KAktoyz6uLq8YwMcdnhcn6/cS0xHZyS58q
         obKABTf0eUJXOzKwClACYfdtRS94pZprBXt1xD2LotSTqXzO3zetTRdFLLWe8gye9rBn
         I36vFNpBkulv4UL0PCFYnMj6TBaDQZ2Spdg1jpfVHmUVb2RdTeDHRMhP/LCSbwb6v/OV
         jm//8dqmRoHUCWYaGhqmYYVgpzwPvkXSV7WIuq8/ImGnbniOpUj6wyJ3vbuy+rjzU8nu
         LFQFBtCoLjoova2gf93SR83bYGl6qavW+96NErNI7IHe7neT9vZnXNxdWtr13MZWmgee
         9VtA==
X-Gm-Message-State: AFq9FYKL6Nbk7QG+bLWnqp4pBfzOrR/XLmvcfwZH+P6VRHrahWmOJpOU
	iL7Rqv8vYUqxtfxwDuaU49Xh0+Ht9wUbVRTIz41KMTGYdD57f0USlPFL
X-Gm-Gg: AYBFou0Bg1/o31PvvgPzaxT0fmDVoO1Ud3tvBrm+AR8eEFJb9fRLhp0KVsNK0q4bxNW
	5xBuJoFbOrB99YYGnqIxvByhy7GpqOxsoKxeQ55r/4hDATIM/wElpmysvLeyR6szy+qv50Wv9YO
	3Hr/JcDPT6ZyZWYkla9T2oGhZn+vn6Zthsrnz1jtAjNVanh8YdNn6IHW2URC5C+XnxAiAkPNKNP
	OMylB/E823CZG1bFQiRANK/RiL0ePgaYdToEDFBBuKOtF76OXU8b1rMmod/uKgbj4TnGwzYexSN
	2PtRHjKEYoVnyU34OOiKN1nUN3RVcDuLRDpB2MAqojIiqlGkSJZrA6yNm6gjReoXRoFU34REGUa
	CTk0Xi7LU0IoN33yjoluh9xJjXwUGlmcHlm2aa0qpw+mHdbX4a7jVsG3EL6oHzjxJvLhp5W3WHT
	ApP6ATFRE98EHOHZ5qnIgFfbEIGPKONRLTWb9bRygNB6Gto2TWfGdjtKV+wrTxxvxmcdcsZusjP
	Vlr6y8C5TJnVA4ytT+5Bidh0E/adjZg4aBPJG2VhXG2
X-Received: by 2002:a05:6a00:b81:b0:874:705d:f649 with SMTP id d2e1a72fcca58-8874bffa3dfmr702163b3a.43.1790767148462;
        Wed, 30 Sep 2026 04:19:08 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:07 -0700 (PDT)
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
Subject: [PATCH v3 3/4] ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
Date: Wed, 30 Sep 2026 19:18:12 +0800
Message-ID: <20260930111813.52396-4-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
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
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 422 ++++++++++++++++++
 1 file changed, 422 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 4bc436ef3562..1883bfb850fb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/usb/pd.h>
 #include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/leds/leds-pca9532.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/i2c/i2c.h>
 
@@ -86,6 +87,66 @@ led-7 {
 		};
 	};
 
+	fan_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "on";
+			gpios = <&fan_leds_alt 8 GPIO_ACTIVE_HIGH>;
+			label = "fan0_blue";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "on";
+			gpios = <&fan_leds_alt 9 GPIO_ACTIVE_HIGH>;
+			label = "fan1_blue";
+			retain-state-shutdown;
+		};
+
+		led-2 {
+			default-state = "on";
+			gpios = <&fan_leds_alt 10 GPIO_ACTIVE_HIGH>;
+			label = "fan2_blue";
+			retain-state-shutdown;
+		};
+
+		led-3 {
+			default-state = "on";
+			gpios = <&fan_leds_alt 11 GPIO_ACTIVE_HIGH>;
+			label = "fan3_blue";
+			retain-state-shutdown;
+		};
+
+		led-4 {
+			default-state = "off";
+			gpios = <&fan_leds_alt 12 GPIO_ACTIVE_HIGH>;
+			label = "fan0_amber";
+			retain-state-shutdown;
+		};
+
+		led-5 {
+			default-state = "off";
+			gpios = <&fan_leds_alt 13 GPIO_ACTIVE_HIGH>;
+			label = "fan1_amber";
+			retain-state-shutdown;
+		};
+
+		led-6 {
+			default-state = "off";
+			gpios = <&fan_leds_alt 14 GPIO_ACTIVE_HIGH>;
+			label = "fan2_amber";
+			retain-state-shutdown;
+		};
+
+		led-7 {
+			default-state = "off";
+			gpios = <&fan_leds_alt 15 GPIO_ACTIVE_HIGH>;
+			label = "fan3_amber";
+			retain-state-shutdown;
+		};
+	};
+
 	front_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -162,6 +223,24 @@ led-1 {
 		};
 	};
 
+	sled1_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled1_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled1_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled1_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled1_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled2_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -180,6 +259,24 @@ led-1 {
 		};
 	};
 
+	sled2_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled2_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled2_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled2_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled2_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled3_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -198,6 +295,24 @@ led-1 {
 		};
 	};
 
+	sled3_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled3_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled3_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled3_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled3_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled4_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -216,6 +331,24 @@ led-1 {
 		};
 	};
 
+	sled4_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled4_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled4_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled4_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled4_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled5_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -234,6 +367,24 @@ led-1 {
 		};
 	};
 
+	sled5_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled5_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled5_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled5_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled5_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled6_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -252,6 +403,24 @@ led-1 {
 		};
 	};
 
+	sled6_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled6_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled6_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled6_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled6_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	spi {
 		compatible = "spi-gpio";
 		#address-cells = <1>;
@@ -430,6 +599,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled1_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","SLED1_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled1_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -520,6 +718,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled2_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled2_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -610,6 +837,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled3_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled3_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -700,6 +956,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled4_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled4_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -790,6 +1075,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled5_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled5_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -880,6 +1194,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled6_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","SLED6_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled6_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -993,6 +1336,85 @@ tmp421@4d {
 		reg = <0x4d>;
 	};
 
+	fan_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"presence-fan0","presence-fan1",
+		"presence-fan2","presence-fan3",
+		"power-fan0-good","power-fan1-good",
+		"power-fan2-good","power-fan3-good",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-4 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-5 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-6 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-7 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-8 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-9 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-10 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-11 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-12 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-13 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-14 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-15 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	fan_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
-- 
2.43.0

