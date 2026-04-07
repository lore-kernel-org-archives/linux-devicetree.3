Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251113A7F57
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550379; cv=none; b=XKeJj34pvEEQNaLffubzsZzPrTbv/iFCiES2l8fX6+hqjvB/VwsyEUh7S59Dro1N1ipLQU0ZOGuSYrYO61SvyVF+4NC8B7erau0xnMxF6U23ztoVj5q9zAgcwAaq9Js7PtvzcYSP/3cwsHAXiAKjdJSPk/N0NjtNZKL7IR3wFy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550379; c=relaxed/simple;
	bh=yFIoW1VgE9eos0drC7//IWDtDDzHIJ65CgsEt+Mqivs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=niPwJfJr+CODU0IqD7K/clrJAHSY32o9mw/6oJJ7vodPKJJAEvkACMoODHPf9+nAVxhK6zWh635Uo/ZrzLmDAEXhPjJwq462coVt3F04pa0gy+A8iuG8IFEd1tk+ZeAD47QmMfrCkuAsR4mzIIDNSTKKB5WJi+9JmC2Ivi4/JhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKu1HGC3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKu1HGC3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43ccda008cdso2867711f8f.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550376; x=1776155176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kN3bcWaJsQHhIwZ8SKksLHpWgkJwI9t6gAAiBuFLbmI=;
        b=VKu1HGC3OAH15O8CsrURvx9Mu3TOHcbLL4dwTo16iznbNCbrFv/7avKMYMGqXzcxwp
         BKT+TiEu2rtaxuP/coCJNkKndTN5Osg+cJYpi71deQH+p7YARXAFyj58L7g3ZrLuQzwV
         wgkW6MMzgzqhAac24xw7szhGjfW95n7IOrqLJNPzVGaTCghkgzDoEo8oVCdHPxinjujf
         va5/24B+JDJhrW//mP1zfwtdrWm2OwhJdCIopGdSozW8M+lJWxjRfa7UZOmv/z7MRsG4
         DdGpf0Osj+rts48AuY/IPo/6bDAPgHzXNFi44jRBFlTQ/5Wz8Rf+0wIKGCB7th5XYG+J
         r1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550376; x=1776155176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kN3bcWaJsQHhIwZ8SKksLHpWgkJwI9t6gAAiBuFLbmI=;
        b=mkX8m2VBSzmZgyGqAj7CVjQid4Ww8MeMdap3wDGZm0juHRcUhG+CDXgdo6NceN8WPW
         PWcITmHS09ZHl4CFNDVjnGg60Fp4QvXfmcf8VGDkiK3T9XXZGC8yC4wibrV5DrKzqEG9
         ZNFGStuchbUO6EnchPMBSUNWyT4sXVGpE6tZCD4pKciKmGR/r/6Gz7wnUxCcD7hs2bDI
         tBtVa12ZHAo5yNjIEPORNW+qq9AL0/Qte3xLVGC0sJ9fHaM9k2Yzi7DbHh/0YSe9Qra0
         XCmYSNKYFf4+kPxMplcmsFIGBP3V9gGkAQIUC9xAhscG3WQn+kKvLZpK96Ei8EP3al0F
         E6TQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0oCtj8BvzIjLTXUAf4ifREc4INrAZIV1jbffykPTv0ivR7mVXWZpkEs2JHPsWX25yviHL5558p+qM@vger.kernel.org
X-Gm-Message-State: AOJu0YzLbxfTHakknQYFnGSiXf51M3C56NdV2AaNnYBO/3vPt3PSl39G
	rPTK67bqj3H8hUi2SIAz6y5yfBI+mi1wNmACQN3zGZiusjnFFJR9MvtfHuW06Q==
X-Gm-Gg: AeBDietedYihT74cmxaTnae+eQQFOPQYqcpV0kzTkVPYp7/YiMuObfz+OSaognGDhhf
	TIYrsTE1t65/rXwvbNGOz9vOvtPn+mAFe+YGS6+Ly3hWXzSM4AE9frYLlLmwoziZ7u+/8EmfKH2
	eCPwBnAXcG72z0dWxeIaVBpYczv5/o+qzP4e7IDaI9EUGbKM9ypUR7/oTsdbBfdvAnuB8yJvGdm
	pPnR5Desixe/C7ImVNRU65S6VWNtuCLpn+4lsL+4hy58hl9QUlHnFIox+7Hg50Q3j26++ehzK/D
	Bv36FYQSkmJW3Eqp5Bv4jNrs3d6Y7A9l59VhTMsWGTTH32zF5WmP+OkLvgIaMyU5acZY5acMPm7
	52DJOtIAvWHATgVNFwzEFxLJsmqAGTk2PdAdQDo8XA9SFZ+pF102VDJOCl84KcK0bt+PtelQB+/
	+su2Kl1ql/fcR2t0ibD1mgO548ssoWIAYslYVzT1c6B9NZ73Dm947FEv+ZH2R0VFY7
X-Received: by 2002:a05:6000:2908:b0:43b:9d69:43a with SMTP id ffacd0b85a97d-43d21171c88mr28578084f8f.8.1775550376299;
        Tue, 07 Apr 2026 01:26:16 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:15 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:29 +0200
Subject: [PATCH v6 9/9] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-9-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf0a5c4ed852668460db475b9c44cb..774a4640f06562b5632c510e8961e3d8f60a3b81 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -18,6 +18,24 @@ aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
 	};
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 
 	chosen {
 		stdout-path = "serial0";
@@ -77,3 +95,51 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

