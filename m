Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B13CAE76
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788519; cv=none; b=a3kiitzCHX2sqS4ivS2Hg47qIRQoKPusmRnbGwu70wVl/F2E1x3aLSDa7fqcNXzia2oVKL0LjeQzvkVHffL81HsB1Aa657LTXXORalLkPH/CRJuE4+KJ4zRu6JnXdiW07g/8gZH+IYzukUGOORxso48CUrWBDbtedEGS6cgWO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788519; c=relaxed/simple;
	bh=yVMP8UAtXlu981/AZfXfuu6ntdCZq3l09RETxP3vnIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WS1VeGpp9incUuYPxd/IxOzGZr0lbHMWDrEoTl7GxHiH/3+BUoFZzoZGnJTRuG4IWrMYvZehKsOl/31ru8L35IkpiKraN/k0UP14Sh12wsb23c8ajxyyXz8dcnoiCm6yffN4wcHrw+Fm+WYbm5dxaqAEUiQS0lP/5LNYYMcxem0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnb2V/4B; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnb2V/4B"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso18370555e9.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783788516; x=1784393316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDpn6H9slILEKuaZA30ay5+GU6mS2ER9t41k8f7Sm/c=;
        b=qnb2V/4BHecTg/Bstd2nMyetg96JxjdqwwEPGpBQV5kC4m6oim5hvw2ownjnEQoxYH
         EM13pqUiExGCOUWveiovV5Pg48IAbgut8sqqnJT1ALmvnN2KD87IcZCFd9ImEvkfXxmn
         Doi5wQsapjWOtcNS9F8g1TKg8Pyi1wllbLirUo2oHlNM/nli0n97PJydxOhtrLmE8wed
         hdCSoFHJBZWA2Zo0IDzpfwIi9CgJStbrG4wfrHeYTtW3TPyYJbZhXEhJ5SJgWmChmn03
         II5dudICvCtO3WqRhour/Sp9RQ/Apou673hl1XN0cR7SJPXMEnuGTo9+3d/XHS4k/ZAi
         +G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783788516; x=1784393316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDpn6H9slILEKuaZA30ay5+GU6mS2ER9t41k8f7Sm/c=;
        b=WcHDWV01bxxp3MX0U41BlcO6J08zfHlMItLl/oZoI3W1Htxljkl4nSnE/WrI7f9Ra0
         /4Pduyiw+/uf7AMnTWkxjzKOr1gfs/3z9Pea3R2PeRCvBj2X2HnEBmRe83xK6vsKCMOO
         N4FwRlGiyunQgpTXaGkq1B+IhNHL1Qefx1XprGJXRO5v0bLWsfgFF3LUSVk2epQKdnQV
         ++yuEPje6hF1oDj3uRMPuJZZKk3zzXYk1WkYf9iGe3BP2RKskj+ObDLXOdfJ8toWPeTg
         x/gucoDwgq5vbu0OE7NcjISpTTbFDHG/2xADmDtvUX07NotW6kIfwiGGBaDIeh9xb0xL
         8Q6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoCdfkkc/Utoz3nLGhHJC9R+xahvv7rs0CowvX8zdT7J8x1iS9b8LqX2FQmhg9E0nW+82oCVQAiMSWg@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/mVVHMZgjg9VN1aNLUKXo/j7AWrAEnhKh3KcHb7X+tmXFgj1
	MRjFreGQhpm07gqbazgOLyx/gQUmRqDIEjzJJm2F+5biqIETuUihJahE
X-Gm-Gg: AfdE7cl4Iv/SmprFWMhKIiGRIinrpTTK+HDwQ4tngzx8gDj1oPcOBWFKvMEGZk3HYvg
	2sRRRMdGTGsubi65VOrZlatKAG9H5VxqmufaHSEwFiqc4yTEk8sKb9yFH59/aY0NZROJzKFyoVt
	Wa4hNv+KeNWz0Xk4OLHWG2c0pKEq4hkrbEnh9/Muw6NsnQgRrU4cwVkjslZJNK7yllOR0QJHBgA
	7iopkUm2iEBoozs5vfIsskV+H8m3VuUWWYwSzyYxqW8DnDyvwmPY50jz4TW3NoWTFxo1UytUGAa
	EYNlOsT1nGIK5KWi7XUHGv6ofZyWQikxdVvVWbru0NYF09dUP25jRlXCTDA1g7zrqabowxm7dGd
	dP+uWO2ntP3gDCVK98BIHvuaD0ZSJZeK7PPrGo3NFxIc4g4liCLcjJewcGQl/lDU+boqI6r6qNz
	WGcI2+h+RDfvUzDptXaprYC5XxSSpemNsOmQ==
X-Received: by 2002:a5d:5c89:0:b0:476:cfa0:a976 with SMTP id ffacd0b85a97d-47f2dcb60fcmr3613474f8f.5.1783788515836;
        Sat, 11 Jul 2026 09:48:35 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm69152875f8f.13.2026.07.11.09.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 09:48:35 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v4 6/6] ARM: dts: ti: cpcap-mapphone: add USB safe pinctrl state
Date: Sat, 11 Jul 2026 19:47:54 +0300
Message-Id: <20260711164754.185565-7-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a pinctrl state that configures the USB interface pins into a safe
GPIO configuration. This allows the CPCAP USB PHY driver to place the
pins into a defined state whenever the USB interface is not active.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |  3 ++-
 .../dts/ti/omap/motorola-mapphone-common.dtsi | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 51a858021541..368cb539997f 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -120,7 +120,8 @@ cpcap_usb2_phy: phy {
 			pinctrl-1 = <&usb_ulpi_pins>;
 			pinctrl-2 = <&usb_utmi_pins>;
 			pinctrl-3 = <&uart3_pins>;
-			pinctrl-names = "default", "ulpi", "utmi", "uart";
+			pinctrl-4 = <&usb_safe_pins>;
+			pinctrl-names = "default", "ulpi", "utmi", "uart", "safe";
 			#phy-cells = <0>;
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
index acac3c243c7a..475ffe678e76 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
@@ -352,6 +352,25 @@ OMAP4_IOPAD(0x1c8, PIN_INPUT_PULLUP | MUX_MODE7)
 		>;
 	};
 
+	usb_safe_pins: usb-safe-pins {
+		pinctrl-single,pins = <
+		OMAP4_IOPAD(0x196, MUX_MODE7)
+		OMAP4_IOPAD(0x198, MUX_MODE7)
+		OMAP4_IOPAD(0x1b2, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1b4, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1b6, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1b8, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1ba, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1bc, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1be, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c0, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c2, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c4, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c6, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c8, PIN_INPUT_PULLUP | MUX_MODE7)
+		>;
+	};
+
 	/*
 	 * Note that the v3.0.8 stock userspace dynamically remuxes uart1
 	 * rts pin probably for PM purposes to PIN_INPUT_PULLUP | MUX_MODE7
-- 
2.39.5

