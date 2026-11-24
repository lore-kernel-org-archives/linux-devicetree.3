Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795528877;
	b=dsZeBD2kreDZo8g3YOa0QMkAKBmeHKholWCLV78GQFCcSrarMEDDIENJOHd9Pp5UQMAD
	 JpR04Zk9Em0QlviaZh63JYx/OkG0TkJPB6XcZ9okAi2YsS79SCM0T2dMcfuEO0sJrbry0
	 o5RYxYL7bcNmrTt0F9U2Myj0IryrM7KKZc/20Cs5x/2tqgSNcpwHnDOj2lshmEblZhgeU
	 I7qoIdORljEOx34EZjb85SaO6Q41RtI4k9xMfsc5VQ1DKGevUky3/FawAykeYGZSbLlQd
	 o/9LoA9UPtvkRUU7/JkbdTw+nOO82Q6hjPQkhWBxxicdihlrpRBO8sAVF/T9jlmjNRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528877;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bOCOQuk/Yd7z6Fhvfc4YdcVatSmsmrYRAVs685pqp2o=;
	b=fcxxgLEgDfj6B+vVtOMy6WY4Q7DrFZSjhTLc9mj1xG0s+eKgN08lvxrJZgbR9H6tqxkU
	 SoBX/NdghTmiM8IZqPTzbgFEia27sqcjp5ZRdjbX/QOgNHjZZuAhnoRh3KjZXHA8cIdpG
	 wVwDIVLGhtIN3lnM/dTbLON8tlVEt6fJM+kRQWEDdHRI6apPbhDZ0cCqNWiMgm8wRjm0f
	 80c8LhGSzujrJfd7vs8IzKjgPSNfDQuUKvSAwng2nxiKZK+Q+OISXbFIw7ImZzMpBgWpe
	 IcOAroS1OgZRY/vfppp17XOXTyEMajVK6y+W/2uzHqC0zNgG/Us2yxStoiZ/HDG5nlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxPjG6LZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A82606A336;
	Tue, 24 Nov 2026 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxPjG6LZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795528876;
	b=EKW1w2WOzfp6K3Op9ojlOZkqNdIqtcwyKRyHhtfa39My1tqz/fKKhEysk97SrQooCu92
	 rPVtDE4D0BgCp14dKGOntin2QwJ44LNJhkHy78v9z2fQ4vH1J1UQhP4N7htw7RGoNjuv7
	 T5OpCEcWdo9zCv0SbbzH0QzZrro+ft5kvQhblIpM7ijg+xR4Ixv6jCnCSmxFHCxdUf8wb
	 M0UBJUDuTR3z/8dje84VHpk6wwNNa3A7dAayMU7PBbGuoaMcLxSuhyp4YxBMkuhhTGklB
	 nZKQhBVmwwz+HMvuyFhlbGC+OyyzSJVE7k0Eq/n/75kDsP+jym6AWmyMZLkOcKxzBHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795528876;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bOCOQuk/Yd7z6Fhvfc4YdcVatSmsmrYRAVs685pqp2o=;
	b=f8QvN7Xiwg0ysZv7UEKZla6k0ugEtiLULjOSJf7cLZ/CpFgvWDO+BxjyGqQcBQjZzEYq
	 nsqeKAyWrOtpqousnMslrvo+7FSW3JGoBukaJ4Rw/W8YEWZciCoOebA8PLO+QsHRpJx88
	 PVB3vvaNm5FhZX9hmbNvwagO+E94RR09nh+ZUS8JiY69Kp1fWtFR8t7tx3uKgg0XBlqBp
	 bpyX8uBnv3rXByVuMTs59ffX4WyB+gfHszq4c7t5biH1QJz3nBtOB0G9Cmfft5Zsu8Ksv
	 F9NS/q1KS/yeH5V2cWyBbAjDBShcU8dwah9alcZuRjy8S7XzfK9Lm/qAxB5443rPjoA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AC981F000ED;
	Tue, 24 Nov 2026 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795528876;
	bh=bOCOQuk/Yd7z6Fhvfc4YdcVatSmsmrYRAVs685pqp2o=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=GxPjG6LZKa4JuVWu60wKt9Ea9b/xBYAmG57nUb4cW/RytL0S01dCmMhMnplcdS5tL
	 k5xM3/sz5MrAGWgu1HgNc7hJvfYFIic4bJWTS9ZaOZ530u2Ae+PUIlx9UtNSzxbyYx
	 s81hHBvjd2oYIfJxmVa2qLqbZCc8bo3aNDNFAEFyWp147hDx7k6+NrQ0fueOyc2yIp
	 N74roeblECyx6ftUCFrQWjDZRh0aVoQQBc1I98N/IHopmGRyuhN8ou5IXsN+T3GCHq
	 xR+lJWGuuu4SKeYdgiq5IEdQBxz/DT8wTwNglst7s/QOHsvU4P5EG76TsEqiCEksL2
	 GrEpM0PO7YoLQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9A2724CA63;
	Tue, 24 Nov 2026 14:00:56 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 19:30:48 +0530
Subject: [PATCH] arm64: dts: ti: k3-am625-sk-common: Add TPIC2810 LED
 expander support
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
Message-Id: <20261124-am62x-tpic2810-v1-1-2b9fcb76a3c3@ti.com>
X-B4-Tracking: v=1; b=H4sIAI+YBWsC/x3MQQqAIBBA0avErBNyKJGuEi1Gm2oWWWiEIN09a
 fkW/xdIHIUTjE2ByI8kOUOFbhvwO4WNlSzVgB0arbFXdBjM6r7Eo9WdGsg6dotxZA3U6Iq8Sv6
 H0/y+HwQaJ2BgAAAA
X-Change-ID: 20261124-am62x-tpic2810-5a8bebd6ba86
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sebin Francis <sebin.francis@ti.com>, 
 Sai Sree Kartheek Adivi <s-adivi@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795528855; l=3619;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=/kJ/e4Uy/UPyHeMJ7jIEfjC0cSg4x5LGcObEFevGZNY=;
 b=x5aVq+vkKXct/6HmiNcrxjs/5fzPvK2EOk+DZo8nFvXPs7JJ/RuAYk/0Iwy/C5sEYPgxl4Zgs
 6CFUCTX+ilgAyO5ophtdXnr7bJF+E4SVU7I0B3PVNpTRNYoku0M5nfE
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reply-To: s-adivi@ti.com
Content-Transfer-Encoding: 7bit

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

The AM625 SK and AM62x SIP SK EVMs both have a TPIC2810 I2C GPIO
expander at address 0x60 on WKUP_I2C0, driving 8 user LEDs. Describe it
in the shared k3-am625-sk-common.dtsi, mirroring the AM642 SK support:

- add the WKUP_I2C0 pinmux
- enable wkup_i2c0 with the TPIC2810 node
- add a gpio-leds node for the 8 outputs

CONFIG_GPIO_TPIC2810 is already enabled in the arm64 defconfig.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi | 93 ++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
index 8e07d2c2e62fd..7d5b16568aa9c 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
@@ -91,6 +91,74 @@ vcc_1v8: regulator-5 {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	led-controller {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			gpios = <&exp2 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			gpios = <&exp2 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
+			gpios = <&exp2 2 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <4>;
+			gpios = <&exp2 3 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <5>;
+			gpios = <&exp2 4 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-5 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <6>;
+			gpios = <&exp2 5 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-6 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <7>;
+			gpios = <&exp2 6 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-7 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_HEARTBEAT;
+			function-enumerator = <8>;
+			linux,default-trigger = "heartbeat";
+			gpios = <&exp2 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &main_pmx0 {
@@ -160,6 +228,15 @@ AM62X_IOPAD(0x01d4, PIN_INPUT, 7) /* (B15) UART0_RTSn.GPIO1_23 */
 	};
 };
 
+&mcu_pmx0 {
+	tpic_pins_default: tpic-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x004c, PIN_INPUT, 0) /* (B9) WKUP_I2C0_SCL */
+			AM62X_MCU_IOPAD(0x0050, PIN_INPUT, 0) /* (A9) WKUP_I2C0_SDA */
+		>;
+	};
+};
+
 &main_gpio0 {
 	bootph-all;
 };
@@ -196,6 +273,22 @@ exp1: gpio@22 {
 	};
 };
 
+&wkup_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&tpic_pins_default>;
+	clock-frequency = <400000>;
+
+	exp2: gpio@60 {
+		compatible = "ti,tpic2810";
+		reg = <0x60>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "LED0", "LED1", "LED2", "LED3",
+				   "LED4", "LED5", "LED6", "LED7";
+	};
+};
+
 &sdhci0 {
 	bootph-all;
 	non-removable;

---
base-commit: 566085204d669ed4bd0d8d230b10f94f963e2481
change-id: 20261124-am62x-tpic2810-5a8bebd6ba86

Best regards,
--  
Sai Sree Kartheek Adivi <s-adivi@ti.com>


