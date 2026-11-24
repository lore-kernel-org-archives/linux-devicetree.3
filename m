Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540980;
	b=1di0upwxuCs764Mh501ixuXIqd/4ePRWkf1F2QyygsmD7Ph12wVi00kLHYIxJRRDqxYY
	 KkUCyVHRARhK4AcpF+7gANSyRgz5uG7PzehbHj4ArvoQbXJtQSZvOdSAiE5XoxQIbTcL5
	 pqv0ql+4/NNrwk6UDIi/nP9FXwBxshm52PmR65YstiKL6Z1DzNAoKq4ySMZqpKAyy+5dZ
	 gR/1yTe8n1Oiemmsk2QlIfCwQRjad1SSKF4gHDzpb+svj3xvNa9AT0NtG8wIKWfJ6/jFK
	 swlrt/dU8EcZ1M+jhnTqYf8uVYOhxF6Fqu6NFwaswJjt+6fGV2fHqFsLYfl1h9u783A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540980;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b8ZLLnYaqHLGaBzaZoD6higfVTAqlS3NyUpOKVoiu/Q=;
	b=YXqVEpoa8mfI/iaToEXTtr0L8KrQsl/KqhOimUCm6o7eGIA2G2KPG6uncQepaQYN9Szc
	 OXakj5Iyix2tUIXoNh+JOhW0FVEduC2qvOSyr20ib90I0RxPoyznqhBJ6Y0W14VcQnbBe
	 K5niJPcaGxGcoTon5+YOZFKXdled7ZMfPE/Sxx5M4Sffxhb6cK/hp0cs3AqwO0YkWO+LL
	 XKj239pad3oZZebQRuoiJecbfNE/jFN2kT19gpgME8Aw5Offh/0BZODPUP/U4LcEZfqOl
	 BySsZgNl2Pv4QRIP8r3aQj80LZDcnqdXGxWFkMaJsgUylOwOMkuSuqbu/hydJjL6GbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NIjntsdD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE68E606A31E;
	Tue, 24 Nov 2026 17:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NIjntsdD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795540979;
	b=SPfhxD7kDzjKdbnESFF1zgHGnR9A8TZCY/D5u0faWuADKb+n4otJ9GC7twSbGf6qNjrz
	 SZt8u2dELYKa129seNz32Fg8TVEYrpc++wDv81DkLKLFBPZvX8WzsNPo4d76mfpH1OxjZ
	 k73rT0DnuSKRWX3IWwyR9Hg527eRgbW6PNne6jxs+/++OFvBr4NtYvqXLHhKxmZRP6xRO
	 nlnsiBjfGsKHmeWzpn1Gccv30Js/BRQO0JlaT3UiQz85KB3hA0dpnYPdHxo/klDk2nyPL
	 8u2p/U2W79ykESb82Rw7mOO0+Xf/AaSaTHaeO9PLLQaAa6IAkWjRtenpi+/ggzlyWxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795540979;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b8ZLLnYaqHLGaBzaZoD6higfVTAqlS3NyUpOKVoiu/Q=;
	b=VdH+CTsgLGTxZxhX8gTqAmzOQKw/gZkQMsDYVR6Tpf8ENiPDTKS14C0C6CuEHs650p+W
	 WK4XGpUaIpGFepIhVVvTlOjs9mT43AnbeRHVylRouuqARwW3E1de9fp/f2OIaI1+DpoR3
	 HQpPXifX8sycyxabwSlVHEXUAbPlAh4RM7sdHDH2dsV8wvcklc8b73iU1vuZt7sxEIrhy
	 zXCeSyKO0AIezzCZDOZifQDHqoLrj+uV7qIOhVHGrRdyOOIoXaJwKLQIiXHVm6QOc6NN/
	 HflXjN8by8KjHVlfv1iEwcmRS3yZ+TKgar5Mw0Gt2TchfyIwypVGG1ZeVwZlgNODXLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 774301F000C4;
	Tue, 24 Nov 2026 17:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540979;
	bh=b8ZLLnYaqHLGaBzaZoD6higfVTAqlS3NyUpOKVoiu/Q=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=NIjntsdDG/Snd2rrZiIOGvftQVgvfDAjkWKKCbLwS2J6udDPvvUZAalBLjBbiEKjR
	 zsdX0K9si0H9rSJ4ki5giVxoIv0p3k9P3Za+ppka2gGz1lfgNSPBxlsFLk3Mx3sj2K
	 QBnoKE2ieEbmFZq0btVajMF4bjHr9rjBnsCIk19O6j/vHUKdxrWMba242tjnLvoZra
	 +zDzpyLeQpwo3ywkW4O5m085eufBe1QJ9wxpKOYkaPMw/nnswg1VhcGWeBw6hs4pT1
	 FxmpyFQAOrHcTK7QZiczU+Yq0JsSfIvqVcFkCH3Z8iim4C6yX6Bcfp1hyCiMQS/faO
	 seLufbq6FMiIA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF3424CAFE;
	Tue, 24 Nov 2026 17:22:51 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 22:52:40 +0530
Subject: [PATCH v2] arm64: dts: ti: k3-am625-sk-common: Add TPIC2810 LED
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
Message-Id: <20261124-am62x-tpic2810-v2-1-91115ba8e2dd@ti.com>
X-B4-Tracking: v=1; b=H4sIAN/HBWsC/3XMQQ7CIBCF4as0s3ZMmSqiK+9hugBK7SxaGiCkp
 uHuYvcu/5e8b4foArsIj2aH4DJH9ksNOjVgJ728HfJQG6glKQRdUM+SNkwrW1KixatWxplBGq0
 k1NMa3MjbAb762hPH5MPn8LP4rX+pLFAgmftozU3qznbPxGfrZ+hLKV8nbhlFqQAAAA==
X-Change-ID: 20261124-am62x-tpic2810-5a8bebd6ba86
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sebin Francis <sebin.francis@ti.com>, 
 Sai Sree Kartheek Adivi <s-adivi@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540969; l=4368;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=ehVtq9ntD1a3UcuBE08CQeJf9PzsTkL2oMpSs6MAAtc=;
 b=tBbLfdDuHaobWR9sYvDmPJd8Y0sruMmEsKnGSRj8AH65Ihz+nauwVaoUUMNTGZFUQQ9JIYtpa
 tpTkypliMtoBqF47rJgMoM2WVdVm6nxrVC1vaP7NCsByHSaOXW5a29G
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
Changes in v2:
- Fix dt-check-style warnings: move led-controller before opp-table,
  reorder properties, fix alignment
- Pinmux alignment/line-length warning left as is, to match the existing
  style of the file
- Link to v1: https://serenity.dal.design.ti.com/lore/linux-patch-review/20261124-am62x-tpic2810-v1-1-2b9fcb76a3c3@ti.com

Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Tero Kristo <kristo@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi | 94 ++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
index 8e07d2c2e62fd..2d2b82b0de8ad 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
@@ -8,6 +8,74 @@
 #include "k3-am62x-sk-common.dtsi"
 
 / {
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
+			gpios = <&exp2 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	opp-table {
 		/* Add 1.4GHz OPP for am625-sk board. Requires VDD_CORE to be at 0.85V */
 		opp-1400000000 {
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
@@ -196,6 +273,23 @@ exp1: gpio@22 {
 	};
 };
 
+&wkup_i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&tpic_pins_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	exp2: gpio@60 {
+		compatible = "ti,tpic2810";
+		reg = <0x60>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "LED0", "LED1", "LED2", "LED3",
+				  "LED4", "LED5", "LED6", "LED7";
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


