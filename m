Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843191;
	b=lKxME77KZgorwx9+hqcErfBofzypM8e51zRWuo3BN9m6Q5sEGQe+v/6OMhoYaNgNVQ2l
	 mRTBSq1p2Lt43faTOjPYYDRpLS9cqRda/sgW1xmObxNrPWkQ3JTIH7KKXy9EanjvNljTg
	 yQdpY6RIFRvw8eDgXa7e05HOXw5wWbPlEUNFSBglEX50kXoj031T1hphr7NZzD9dxGy/R
	 F3YAkQbz5AEHG0x83vU7MyxlNksrT+H86mBwRvr+hunNoItUF2RFs0XE/qMBMJs3MrBDu
	 wXDUQ6ijwrztY85IeL4S86LT0H9YMM2Gb2+e457IsSnFr8/iUZXFhVj3JLdqQFNBiYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=e/ThZEAwDdMnIObWDz3GVS4c78zlGkgBTeVD6XHYglY=;
	b=X7QlMlAqhjZIVnsfQoH+v4gUTXrI2C7ejbYqhEuVLt9gcwZXZVPCXuIURciG8ryVWD6q
	 /Cfuh3HgEe+oweEVRtLFjkOdVCtG5x2OMFscLCdD9GPo6ILKAw/9ksRGprX4uMJx935va
	 HI2Vjmg48aXa5FgMoZCjppQowVWnaO280Ud94tg59urZnw27eAC4vh4SFMzEIfOUJBVFw
	 M/x5t2hPlSo+z5FfjFgJbVMLxPqecTiMTYka8npOyJJM2FXE9Tj+XSJ+3azom2Uj2Jucz
	 6Am/rwar3Xnj8oW6NyCcKBljcTHzRhkebku8QkXWm1T0wE0f9H687yXbZLE8rzNT3dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUYELq1S;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7DA606A88F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7DA606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUYELq1S
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso13096795e9.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843189; x=1795447989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/ThZEAwDdMnIObWDz3GVS4c78zlGkgBTeVD6XHYglY=;
        b=oUYELq1SPtFfNTxWfBeeumYdjCkNzVj1iSWVVpu9Uc8hStEZTU9yVTMC0rEvBGhp0z
         oqISG4ts1WI2TMzmV/IzCrfohGqLnTOE1t8hGEAXOQC3QMvPtADUtIuEDu1LS9c9NuIH
         P7A6Tg5cn4YMb7tCOaJ+yqdpFjDdHCqlV06maRe/TiYdhXZOltisdio5ng1r2d6WvGPc
         WlaKCAl/YtWeyLHyI7s5sNjvudIgxLqhnCFo+bpPHSjBUbTyy6xr8poN+MQI4f1Zk54h
         VS8FLdpGFg8LP64gnw/m1IJ3LMK0WiOpWvnL/nXS1arotJwqARJs8NSQ0yhZMcgAh8zu
         kIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843189; x=1795447989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ThZEAwDdMnIObWDz3GVS4c78zlGkgBTeVD6XHYglY=;
        b=QfwTZ5Dq7O0nhby9ySI0Z1h7AIPJ6B/YqhKHBFYO9yikuXPXxh9w78QOKF4ktvW2NE
         N9+wlengN7HnY5pBLBibusPdAHCLsRTQb6LbGZ5SB/eX0i/LFHPXpXqmchMPe+a7iAOA
         qq98YxHDNrryrMXexZq831zEQQZITU7+wzevbiQqNnxrI0kUHwAKr8W13vfQwKEtOcih
         Hy8zxz+MAFfAN1zxmDgWTZ2f/UPEbdHITDLc5/v7P8XLNl6G1uc2WHVoBa2WsJvRS4Pr
         cEfWwTMzwFcXdbQmEYgIG0DqqgnbknMm2Fbchw1N3sXRYi1zYGvlK6smzexqCTSJqjya
         3FSg==
X-Forwarded-Encrypted: i=1; AL+hErEFa76+Veml0f6NTFwecdu54h7JezQMNo2MOUhBtO5DeWQvW8Vg7pnN+1E5wunhpMbfEUW7tBfmFgBF@vger.kernel.org
X-Gm-Message-State: APuU4Z/mhHhQ3rzx5QrEh6moMvdu+e3MgSmD6f6g5kAmdr+f6c7Thktm
	sOhaTLwufiJ2yHRR4/cPGuX39U4y0UHvGDmi2i+RmlPGfLSDQ2JwoeYp1VzIVQ==
X-Gm-Gg: AYBFou0eweZrjUgXQ5KLzWZCSfN9K5osVTk9vper+myFs/GzhMkfZkrfSMPESQUNeaQ
	PzNiYCdg518ncYCtQWeRMwHetVyud2/YOiM1UdOEzoEdUbkLQ+E4UvBHajz0+PxyFCzg8B/eFJy
	GPyIkNsHztro4FR3obqjr87QP0yHCXgEhYK8h2D4mullNBahpt2BOdfTfcQ6CYJLvkN77lfD7aE
	vau+NKIRQr8y2P7SscBi3Hxho+x/yXX1MfAmg6YfT/89Jjp40Oy4qbauyWL6mGjcFhDs0maVik5
	PoMVg6IJiDVKEh3/a0HtCLhxHmv6xJURzZgRhrbUX4n9EiBaWSwBMHNZZSE4RXeZrIMqSVWOxIK
	dnl00Tlwa5aZ0Up2pS5sq8j53An2+IE5XwgZErvKJfEBTtt/A/nBknXph297Spe1fastSqDJvj3
	2joiXCDzNvXwakxXFyhqW2OZFBA0HPYDYfebs0qlosDT9YKstj3DgFAFnGJY3EfWqpccl7eWzJn
	gW0jSOYVkQKStV88w6qSbpAyHHzeofkxXtLY3O1QlfO1pbFLeHxsm0iYVdoDjIjn4HGYp0KfUU1
	7HTX2CodAoL1vfspRlGkns9vQNaCXX4Benu4/Uhw+kvbwnI+2hohJDls4mhuyuvY6Q==
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb605d90f1mr167039245e9.32.1794843188567;
        Mon, 16 Nov 2026 07:33:08 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm315407665e9.11.2026.11.16.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:33:08 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 15:33:06 +0000
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 CANFD
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-canfd_rzg3l-v2-2-89e06c46f40b@bp.renesas.com>
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794843186; l=2488;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=SlQdp/xtduEIxx0pMtkmUmj3788ItH7g8oWcHzROuzM=;
 b=paDL9ELG/I0ILOtSq6Lzvim+LgrEo7oa2/YsoCu9xRpFVnS1XLHyJcgKQcs0Mvbw9tfAqlFK0
 IjdxH+ShC+ABMnu6goPP7c8ajGkU1wBUGGYqJL+NHWSYJ8aj759wjfz
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable CANFD channel0 and channel1 on the SMARC carrier board.

Channel0 is always enabled, while channel1 is guarded by SW_DPI_EN
since it shares pins with the DPI interface. The CAN transceiver's
standby GPIOs are conditionally wired up based on the carrier-board
switch settings (SW_GPIO8_CAN0_STB, SW_GPIO9_CAN1_STB).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Reverted the order of the SW_DPI_EN and SW_SD2_EN, to match the
   signal flow order.
 * Added missing check for !SW_DPI_EN in standby-gpios.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 5f5441c47335..7804a903244b 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,8 @@
 #define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
+#define SW_GPIO8_CAN0_STB	0
+#define SW_GPIO9_CAN1_STB	0
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
 #define SW_SDIO_M2E		0
@@ -87,6 +89,38 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&canfd {
+	pinctrl-0 = <&canfd_pins>;
+	pinctrl-names = "default";
+
+	channel0 {
+		phys = <&can_transceiver 0>;
+		status = "okay";
+	};
+
+#if (!SW_DPI_EN)
+	channel1 {
+		phys = <&can_transceiver 1>;
+		status = "okay";
+	};
+#endif
+};
+
+&can_transceiver {
+	standby-gpios =
+#if (!SW_SD2_EN) && (!SW_DPI_EN) && (SW_GPIO8_CAN0_STB)
+			<&pinctrl RZG3L_GPIO(K, 0) GPIO_ACTIVE_HIGH>,
+#else
+			<0>,
+#endif
+#if (!SW_SD2_EN) && (!SW_DPI_EN) && (SW_GPIO9_CAN1_STB)
+			<&pinctrl RZG3L_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+#else
+			<0>;
+#endif
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -153,6 +187,18 @@ audio_clk_pins: audio-clock {
 			 <RZG3L_PORT_PINMUX(H, 5, 6)>; /* AUDIO_CLK_C */
 	};
 
+	canfd_pins: canfd {
+		can0_pins: can0 {
+			pinmux = <RZG3L_PORT_PINMUX(3, 2, 3)>, /* CAN_RX0 */
+				 <RZG3L_PORT_PINMUX(3, 3, 3)>; /* CAN_TX0 */
+		};
+
+		can1_pins: can1 {
+			pinmux = <RZG3L_PORT_PINMUX(5, 2, 3)>, /* CAN_RX1 */
+				 <RZG3L_PORT_PINMUX(5, 3, 3)>; /* CAN_TX1 */
+		};
+	};
+
 	i2c2_pins: i2c2 {
 		pinmux = <RZG3L_PORT_PINMUX(A, 4, 4)>, /* RIIC2_SCL */
 			 <RZG3L_PORT_PINMUX(A, 5, 4)>; /* RIIC2_SDA */

-- 
2.43.0

