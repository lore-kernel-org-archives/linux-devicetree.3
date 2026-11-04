Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790417;
	b=B21IvolzA799E0Kih9J4GtgNJ3MYPgmzchRtua0+AKlZQ95UmEZHADrwMNShGGtctg65
	 PYkKcfoRr9Kj8+SYXvmUJC0sNAc+I4XP0N0auothhTzPXiq1WA7wbhKYit3a3U8YfHlCF
	 E0jREo82jGDdd9E20S6L+1AtNVz0P5TCUJMC1mMAnkq9mzYwJiJ3MPML0JTd/LY3Lcb9g
	 UNxsFztiDkhPmtqLK1vR+1g5elFefwWOdl1tHLFKSX8zKqCBaMTKSITx/RiKu6DQYmLLJ
	 U4FSXvQ7SPgUNb/9ix/COKck1vP9yoULqXg26g5QpcQfTXbqdd5t0j9UJt3odA16Rog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790417;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4CIuy+PkiT+UL1hCEuwA9BVJ0GmEQ2NY52OWjxnzAo=;
	b=rmEFBTPquvq7Z6iy9d/CF1khvx0N+oxfQgJAvMryjQVj68d0BS9Z8TrHFQ0tpEmztsPw
	 WRheV2tsLVv1o85yZquWmBM4bd/rEq9bboCTXbv8BsA6jT8ES8EKlkinqqJn3Z/W8E5y7
	 qft5l0tNNMRxvrBPZbMwUHMfKnSd821qKybNlR0McJaaTpHxAbgoukVDfNVpaG0mOsRgf
	 8/z+kBGKcJlZgSIb0DlpE458OsX15xZfJ4cMorUJo/RX8iLmaYtM4Zu9sOvz2hU5zDhht
	 Rw+SyBvKDpXHZJ+dsQ33WY/grU4EJDuUXhY+kYyMewLyZPotKUScbfwGiTYQRG0F2GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=Usi61I2E;
	arc=none smtp.remote-ip=91.218.175.72
Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523E606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 11:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B523E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=Usi61I2E
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rnqNfzNHS33ke4zcO6y3Oh6VMVuv1mlxjr1t5iFKKLk=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790414; v=1; x=1794395214;
 b=Usi61I2EKaXcye57J7LC8+XF/ZLPorol8lgrKj5cx8R4WOThTd1paLWgEE1sVlhlU6FW6YL5
 pY2+J+ZMTsBqUrdLu+XqaJdAa6b7q4RGNFVy2GMOKxP6U/ehVAwCvywJx4TOKIlrEz/+6z8pvnw
 hxq4K5wiAjmqeHys4MJ9XKbDILPUcwj7FBX0xXas1l83Eg24i434V+JjH4uW7EfiCH+QC/GgT0I
 gbxByvt3BdIwZaWDqhaYIzRNndzCge4s61MjglxZb6hCZyeTxnjDd3Y6P7ay3xk/z7Oe4feQagx
 f1VPL5lkK4eGyQgHi2aELq9u3MctcOQiLBoWMA/b1ofGw==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eeae194fa72656f1;
	Wed, 04 Nov 2026 11:06:54 +0000
X-Mizu-Trace-ID: eeae194fa72656f1
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH RESEND 2/3] arm64: dts: rockchip: Move sound cards to board files for NanoPC-T6
Date: Wed,  4 Nov 2026 12:05:05 +0100
Message-ID: <20261104110640.1132917-3-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104110640.1132917-1-diederik@cknow-tech.com>
References: <20261104110640.1132917-1-diederik@cknow-tech.com>
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

The NanoPC-T6 and the NanoPC-T6-LTS both have a Realtek ALC5616 audio codec.
But the NanoPC-T6 Plus has an Everest ES8389 audio codec. So move the audio
definition which is not shared among all boards to the individual board files.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 39 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dts    | 39 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 36 +----------------
 3 files changed, 79 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
index 0ee67ee24f3c..32f9b313b5d6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
@@ -30,6 +30,45 @@ vcc5v0_usb20_host: regulator-vcc5v0-usb20-host {
 	};
 };
 
+&analog_sound {
+	compatible = "simple-audio-card";
+	label = "Onboard Analog Realtek ALC5616";
+
+	simple-audio-card,format = "i2s";
+	simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+	simple-audio-card,mclk-fs = <256>;
+	simple-audio-card,name = "realtek,rt5616-codec";
+
+	simple-audio-card,widgets =
+		"Headphone", "Headphones",
+		"Microphone", "Microphone Jack";
+	simple-audio-card,routing =
+		"Headphones", "HPOL",
+		"Headphones", "HPOR",
+		"MIC1", "Microphone Jack",
+		"Microphone Jack", "micbias1";
+
+	simple-audio-card,cpu {
+		sound-dai = <&i2s0_8ch>;
+	};
+
+	simple-audio-card,codec {
+		sound-dai = <&rt5616>;
+	};
+};
+
+&i2c7 {
+	rt5616: codec@1b {
+		compatible = "realtek,rt5616";
+		reg = <0x1b>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pinctrl {
 	usb {
 		usb20_host_pwren: usb20-host-pwren {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts
index 40290a81bb9d..40ea1079a928 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts
@@ -27,6 +27,45 @@ vdd_4g_3v3: regulator-vdd-4g-3v3 {
 	};
 };
 
+&analog_sound {
+	compatible = "simple-audio-card";
+	label = "Onboard Analog Realtek ALC5616";
+
+	simple-audio-card,format = "i2s";
+	simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+	simple-audio-card,mclk-fs = <256>;
+	simple-audio-card,name = "realtek,rt5616-codec";
+
+	simple-audio-card,widgets =
+		"Headphone", "Headphones",
+		"Microphone", "Microphone Jack";
+	simple-audio-card,routing =
+		"Headphones", "HPOL",
+		"Headphones", "HPOR",
+		"MIC1", "Microphone Jack",
+		"Microphone Jack", "micbias1";
+
+	simple-audio-card,cpu {
+		sound-dai = <&i2s0_8ch>;
+	};
+
+	simple-audio-card,codec {
+		sound-dai = <&rt5616>;
+	};
+};
+
+&i2c7 {
+	rt5616: codec@1b {
+		compatible = "realtek,rt5616";
+		reg = <0x1b>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pinctrl {
 	usb {
 		pin_4g_lte_pwren: 4g-lte-pwren {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 13be56af095b..121ab2c467bf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -98,33 +98,9 @@ fan: pwm-fan {
 		#cooling-cells = <2>;
 	};
 
-	sound {
-		compatible = "simple-audio-card";
-		label = "Onboard Analog Realtek ALC5616";
+	analog_sound: sound {
 		pinctrl-0 = <&hp_det>;
 		pinctrl-names = "default";
-
-		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
-		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "realtek,rt5616-codec";
-
-		simple-audio-card,widgets =
-			"Headphone", "Headphones",
-			"Microphone", "Microphone Jack";
-		simple-audio-card,routing =
-			"Headphones", "HPOL",
-			"Headphones", "HPOR",
-			"MIC1", "Microphone Jack",
-			"Microphone Jack", "micbias1";
-
-		simple-audio-card,cpu {
-			sound-dai = <&i2s0_8ch>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&rt5616>;
-		};
 	};
 
 	vcc12v_dcin: regulator-vcc12v-dcin {
@@ -549,16 +525,6 @@ &i2c7 {
 	clock-frequency = <200000>;
 	status = "okay";
 
-	rt5616: codec@1b {
-		compatible = "realtek,rt5616";
-		reg = <0x1b>;
-		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
-		assigned-clock-rates = <12288000>;
-		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
-		clock-names = "mclk";
-		#sound-dai-cells = <0>;
-	};
-
 	/* connected with MIPI-CSI1 */
 };
 
-- 
2.55.0

