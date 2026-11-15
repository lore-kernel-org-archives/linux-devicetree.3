Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762716;
	b=tlKwdIL2mGG4UfsRBQIvibY471tFpG1uHvv834hHRXhICKUD/Yw+xhbwsCw6CybXs2lU
	 hTCgtSU1Q+ELR/lQe+ptuCHzH2DFCVIQeYD2dYKU68EMMAxo8UHeUJ6krgkCRX3N8gbXK
	 wrx5JJGJhFYgjdv0Cd2iTqjkwcsSpBAOx+hgcncXX5MEZ5rwYk+XlNzlV0oo6DUXvrm0g
	 0xd7xONfOy/mCkjN8c2ip4A2V604HJZNNC+CesDhLS2dOR9PPxWNHYq92sm1f+q6ZuaSi
	 d6lYSLrf8VkxXRCA+bf7cucfeJnTlCZsToaGPLVC6G1mek6zQDVhaWdnUYRG2fUA88g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
	b=qgeJc6byVfo+buGQ5dL4kiJbp5ozmOf5ten2rNboQJQ+OmXUeJS/u2r6+emQizFobFLw
	 Im7WM+svEakRcF7vYhpND1QuZS19McVjeE0j7M6G4c0O3ZZ6b9LOKiEBMvf5w25N6k80Q
	 1dR+bCZERrrDVy+VSxXXinlPUE8QhwGu7PNR0Jwvduehgkbom28CZ0cpwPbZ2K/Nk6moW
	 2sGkOwhu8fzGAqilPVyQyCYrp6hwabb1WBtxUpkI5xceMxaEiMo76rqhfRUWqhri1llW5
	 1HugdUeHFTPo1tKufqQkywK3hpu2ZTDRZE+DHTl8pGdgmwUXqAT3KBFaYJPr8Wfm7FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtUpyv5H;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90059606A899
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90059606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtUpyv5H
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so26560185e9.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762714; x=1795367514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
        b=RtUpyv5H1PxH9F74rpTsQi5KXEP7mRFeo4yHiNn4VjUREE2t7fvJyGMv0JpMOBfYdY
         LgtkVAb8x1RCGQGRmJYeDEYqMa8VSbQOAZPNZwodhFVBdpGGYX6EHzNHUDUzr7R2jIly
         Q2fi7fv0pQKT9/xkOoQpwtCKxX2V2zSupDJ8BXAWpRw15wyDqx9BkA312fOij0Dt2vEK
         MTr7n4nVZOC/3t2dD4Gg9qVy7DiBqglUko+e8N/9ZwQEKgvCU+7HdhgRytYIDkVTbniI
         5U5jSwk3lNw8S4eYkLI5boIAtHAbOKoa7pOQU+BSKIjFUE+B7eruuTkKn77dIzS3/Rb3
         59WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762714; x=1795367514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
        b=h7Doq/rFysJuueDw9Yig/zmYUCqKS85y5ofIFd38WwgTbq7eF/k/j2xc/pJN6VrFG4
         vvCC3m5qB8yNC1skXSeV4FCJEim+fo1l0So264rp0MTjubV2d5Q3J0XsPbiT54kQalBN
         0HV2FM4k6Z8QzoUtSZeE/73CnrOD59lJY/4Bh9vXRkj9GPWngQORaPkNyVwN7ns4l7my
         SWT6OPnUdbmBPNPvFn/Adt+vnkkngjhIipuLY4jESKEIs54pU7/ZklhLVfiompL9xxRH
         HetfDLDmf0Q2TziMVwASeYvlTK0484+Jm9qld1P8CVBlp6e3TGiTq5IHTZu4da3zhSkc
         0QuQ==
X-Forwarded-Encrypted: i=1; AL+hErFKt2cnm838PCMhTHNPjZdaDr/Mf3utOIgSkW1MQvRXYNqnMWRmQQl9CxMuj7qh3tdzyerBrgYcrz4u@vger.kernel.org
X-Gm-Message-State: APuU4Z/1PKaY/ig4rcX+yR1iLPXD0SaVdFx/aOZ3wxwUTgE//ABfNi2s
	cvVWvez6UABrK6SanbzO5w4Ob5Z3M8tzrIXL0O68YyXETR+Xj0z+dBvJ
X-Gm-Gg: AYBFou3t6Lr+fcY8FVo5GwpTjnDIWxG5jyLDxDGKmcifXGk4ZSJdB5b4ivyFU/OtyTD
	0e7gB1Hw+l1W1RubLTFfEShoii9Sp6pVFOUr9mhxLMkn7ENDKlCJGBehwYefJXgqdYLMfnE/gMO
	NUfkOqfoqxgFjFbkqbX4D2hWslZB7yg0R06C/A97aWRHMtN2Bjgfsm0XHRNY2FKta2TqycadUI+
	kCuFv60BFUGpR9prQWpJjoedFuKTOOUKW+hT35VgVOK7uSvyiP1dOb1wGftTwNlXPJfNKUAscN4
	urs8G/Dw7iiZLow6jcEGtkNCjqawPkyuV0HEEjBMORlpBBxHbndhEuyfP+2rpnpbSJLXGDT+uH4
	z8WOS8nZ4opVDSxgdlA/z6HpdGqqnLm21nwhXM6Q60C8j+OnZgl1vUg8ubQaHa5eOQBQJRkMcyy
	JLFNQXvgeuVeDlGnf76k18x0vy1mkw0DtD0FHPDoFyybN5s5td3TbT6DIl0+oSCGFETCUDy13+X
	Ql5rGJ1BbLr/k55HuZPdLoUBHua/8X7ro28na3KxjaLjHzp3TFq1Shd6u41TXjr0v+Y6T/zXY8H
	9pkdUn4lnUvGy3hK4JOyjhDUFTP8Ci4WOSG+vYVjBA2EZwoAMZEh2AO7FrBYAxcfD0N0ZvfXdhq
	wy0wP1007XRIZ/Sbe8ySq1W37rHIplz7WIucH3M6rs/pVLOiBOdDgxMBW1tws0vJQHrUQxVlxlR
	3wx4VmN8cWqiH9QEuRnNpy0M+xxhK/5orYVOvYvOOHIHeb8yNdsigESLx3hE6OefPUneN1wQDdi
	o6G9tkNr46Dkw==
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr189672185e9.17.1794762713782;
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
Date: Sun, 15 Nov 2026 18:11:47 +0100
Message-ID: <20261115171148.37784-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
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

Every H6 package contains an X-Powers AC200 die next to the SoC. It is
controlled over I2C3 (PB17/PB18), takes its 24 MHz reference clock from
PWM1 (PB19), and its Fast Ethernet PHY connects to the EMAC through the
RMII pins on port A.

Describe these parts in the SoC dtsi:
- the I2C3 controller with the AC200 at address 0x10 as its child,
- a pwm-clock that runs PWM1 in bypass mode at 24 MHz as the AC200
  input clock,
- the I2C3, PWM1 and RMII pin groups,
- the EPHY calibration value in the SID.

Everything stays disabled. Boards that use the AC200 enable the
pwm-clock, the PWM and I2C3 controllers and describe the PHY package on
their MDIO bus.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 48c771223af4..5e48b35d13de 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -17,6 +17,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	ac200_clk: ac200-clk {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_pin>;
+		pwms = <&pwm 1 42 0>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -314,6 +324,10 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@1c {
 				reg = <0x1c 0x4>;
 			};
+
+			ephy_calibration: ephy-calibration@2c {
+				reg = <0x2c 0x1>;
+			};
 		};
 
 		timer@3009000 {
@@ -388,6 +402,11 @@ i2c2_pins: i2c2-pins {
 				function = "i2c2";
 			};
 
+			i2c3_pins: i2c3-pins {
+				pins = "PB17", "PB18";
+				function = "i2c3";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -414,6 +433,19 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			pwm1_pin: pwm1-pin {
+				pins = "PB19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			rmii_pins: rmii-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+				       "PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC3";
@@ -626,6 +658,27 @@ i2c2: i2c@5002800 {
 			#size-cells = <0>;
 		};
 
+		i2c3: i2c@5002c00 {
+			compatible = "allwinner,sun50i-h6-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x05002c00 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* AC200 is co-packaged with the H6 die. */
+			ac200: mixed-signal@10 {
+				compatible = "x-powers,ac200";
+				reg = <0x10>;
+				clocks = <&ac200_clk>;
+			};
+		};
+
 		spi0: spi@5010000 {
 			compatible = "allwinner,sun50i-h6-spi",
 				     "allwinner,sun8i-h3-spi";
-- 
2.43.0

