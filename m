Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744ED3F7AB4
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456066; cv=none; b=r/vpG/aBsqarWf9Jp3HBW3qfIOS5+hFxfP6E47cR5Ynq2ylsLeqWk3hRjnVMR3RL3jtcfsgGukSueukqzaY5iuuTUYESyrfAZ+E0aCTiS1ou1LqPtc7MPKnnPstBZVo/Tc1YWxR1Ec7mcnp78rK8LZ8wqhebGlMKqY4iRhiYgm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456066; c=relaxed/simple;
	bh=mPX6NAeZDkROhXMP56+7tMeFl2KtVn3Z1ugGBvlUIgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrB6JgEBaTDsR35i8CLHF5+agbeYpsa6cx0EF3gMaxZsGCZb5Qx4QVyg7ejZYYkfMFK/vgFxlJ30yRIYP6xjv2x3pZnDeU4+jvAddh4CAmT34wGUUcZMf4CU6Eoc2Y9E22Ee9Hfb24/ujDSA4fdiRvAxLakyjKsT44VUcLhZc24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNr+JrzQ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNr+JrzQ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89a6ac6f389so29723106d6.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774456061; x=1775060861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2g8topQOvfOO8rlahI8ziLuuIYQbiMR2HTZw8FnPzWs=;
        b=dNr+JrzQiEjNtXNBio2QY8lVT2p7s9GrH6Sa8T6qcrkyU6swPUNXx3dkCRCL+leA8y
         qnBkU/Z5gMz6rPjYILRaJKedyhiyHu9zZXi0+i0EFlx/24l/GnJhE+6Ol5lgUDVOky6D
         P3WHXKFcaN+UmfBhTFgEPesMsAKQ0hgcWmmFK4KHzvHW3Ggy9XJNDKtzW/mHqyMhTT4m
         gJAgMNWFwCqyJaIE8MRnNy+7ASkYIwtxBZyIhBnkw++4cB2MjNO5Wee5VwIN9MzLSCE6
         0lkv8+g6Rv+fT4Ov6WypwtVyU5fta0O8S3psx3iT8vj1jGm0HbdWcaEgZNcF/JikSkhO
         vv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456061; x=1775060861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g8topQOvfOO8rlahI8ziLuuIYQbiMR2HTZw8FnPzWs=;
        b=L6qG1BzUekL1RYdXbnlMXd9We6Q2i2lRTZriQJMWZspugiSe5fBs2Ddo/wOhu6f3Hl
         WZbHCMv6Cu4gbB4F8TQDblCxrNbyFIqgmi7SDjfKKovKFxDYaaewm4WzJZaFyLHUJNfl
         zXp+7CAjpIZcgBNSH3dcuceCgDHrx87cNoxE5/NKMRBYH3Cuw15JSaMumUvCNjHT/82O
         vskiLOX6EwXEgZzUt/9e5ZJgtd/Cb1GRErFEe33h/ELwVlDKDmxiHhhriKzF7OF/BpAo
         6YfSGbDgkCISu8cm2uCjEPOsOtKtFIN6o/OL1hOZZ23CXUpPXUWZ+JTjjBh9CAoClMXE
         i5Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWXhnX6331rvp2+6AAHTF0ntYXcEubW+0BdFTQCZPArN5dR78XeVnsdxr6sIxuNZGGQdJ8fQEmeRpke@vger.kernel.org
X-Gm-Message-State: AOJu0YxXEnGlMI47cldaumzIHXajK2NlQhX+Uf8m9V9GZUFtNJhr3u+X
	vFdkrJtMWTN8viCsBcEErupAhMofv9w61dhcHFKmaT+g90UYfElXHGFU
X-Gm-Gg: ATEYQzwuzclIb2rpxW1PVOBS0IBLNNJZ4jNvdeS/BB166aBdb1HgHxRJypu6GoWgToF
	D1/upoLuiWIyd2P8NfxMTPAt0DNUxYk7jqsxV/B8woCU5/Z4BioMX1OfBSrNePifIrOZlvmqUmR
	KBxBF8kc0kq0fQ8h4VDiZwbH/JuczZUE/FNxJc8T2cxCVpKLw3WeXR15tjC0ctEfY5lVcfOnogj
	SlONN+t5gDfzuarV6TppcRbWkeE/OrPeYb/Q0GUfF3AmveM8fwBw9QTUFQbTakzPIcZPmG6600T
	RmoVzehUYL16DEiXkKE0QGtIJU4UEX3g+uzZ3HpKutMiQgfEMs4lBGAmUXGNG35z8mgtS9xJtA1
	MNXrrDG48ZqiCLK+9nvFnm6cLLnCej1Dk3rK7Nyh3vIZ5xV0mYKF4raeko0FWJvU3vFKapg5HSf
	DHd9u4jj1vFrkUCka4BqRm8pOWMJL5xwqbP+FHOP5x96ni0Ea2fpB3mB+gOEpIWJt7+ZLSsViwL
	w==
X-Received: by 2002:ad4:5ec9:0:b0:89a:14c5:f74 with SMTP id 6a1803df08f44-89cc55000fbmr61189566d6.54.1774456060874;
        Wed, 25 Mar 2026 09:27:40 -0700 (PDT)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd5a197aesm1167936d6.26.2026.03.25.09.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:27:40 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: marek.vasut@mailbox.org,
	Adam Ford <aford173@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
Date: Wed, 25 Mar 2026 11:27:35 -0500
Message-ID: <20260325162735.24467-1-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LVDS Panel was never shipped from Beacon, and there are device
tree errors, so rather than trying to fix them, remove it instead.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Add LVDS backlight, some power, pwm and pwm pins all associated with
the LVDS panel.

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index d55f2d7066ad..62ab0a3776e7 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -8,15 +8,6 @@
 #include <dt-bindings/clock/versaclock.h>
 
 / {
-	backlight_lvds: backlight-lvds {
-		compatible = "pwm-backlight";
-		power-supply = <&reg_lcd>;
-		enable-gpios = <&gpio_exp1 3 GPIO_ACTIVE_HIGH>;
-		pwms = <&pwm2 0 25000>;
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
-	};
-
 	backlight_dpi: backlight-dpi {
 		compatible = "pwm-backlight";
 		power-supply = <&reg_lcd>;
@@ -101,38 +92,6 @@ led3 {
 		};
 	};
 
-	lvds {
-		compatible = "panel-lvds";
-		power-supply = <&reg_lcd_reset>;
-		width-mm = <223>;
-		height-mm = <125>;
-		backlight = <&backlight_lvds>;
-		data-mapping = "vesa-24";
-
-		panel-timing {
-			/* 800x480@60Hz */
-			clock-frequency = <30000000>;
-			hactive = <800>;
-			vactive = <480>;
-			hsync-len = <48>;
-			hfront-porch = <40>;
-			hback-porch = <40>;
-			vfront-porch = <13>;
-			vback-porch = <29>;
-			vsync-len = <1>;
-			hsync-active = <1>;
-			vsync-active = <3>;
-			de-active = <1>;
-			pixelclk-active = <0>;
-		};
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	rgb {
 		/* Different LCD with compatible timings */
 		compatible = "rocktech,rk070er9427";
@@ -164,16 +123,6 @@ reg_lcd: regulator-lcd {
 		enable-active-high;
 	};
 
-	reg_lcd_reset: regulator-lcd-reset {
-		compatible = "regulator-fixed";
-		regulator-name = "nLCD_RESET";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 3 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&reg_lcd>;
-	};
-
 	reg_cam0: regulator-cam0 {
 		compatible = "regulator-fixed";
 		regulator-name = "reg_cam0";
@@ -480,18 +429,6 @@ gpio_exp1: gpio@70 {
 	};
 };
 
-&lvds0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			lvds0_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
-};
-
 &msiof1 {
 	pinctrl-0 = <&msiof1_pins>;
 	pinctrl-names = "default";
@@ -562,11 +499,6 @@ pwm0_pins: pwm0 {
 		function = "pwm0";
 	};
 
-	pwm2_pins: pwm2 {
-		groups = "pwm2_a";
-		function = "pwm2";
-	};
-
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -617,12 +549,6 @@ &pwm0 {
 	status = "okay";
 };
 
-&pwm2 {
-	pinctrl-0 = <&pwm2_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
 &rcar_sound {
 	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
-- 
2.51.0

