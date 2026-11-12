Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494298;
	b=A0cmue1Lj0sNHKn9xY0yNHut+n0HSvUZvjivF6MCX+fw5olKPExVBHhmfMZ/OZ9FLtSq
	 BGgnmmKnT+uT80/iQ0hb7Rviea3kQta4+cCf8U0pK0fp3D5CPZHECsL0vxn0llLMnImRJ
	 dIwSQAnqtntoYF/JBAPcBIeVpc/7dJeS9meTJXhUc8XCnWWL4Rofshh6F1t4dRcyg6C4K
	 LhgZPyrY0EqsOQiKjEusgSR7uZCOsYTIQn7wohUB/e3HYL504fYQ3bIl3P4BIZO1pBm0M
	 snDMsLZ8bWNESjxTKEaQ5N3TuX/N7EpsK0+tj5XBdLtjltyXbyl+MR2M0nY+8U4mKlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
	b=Qu/5mHdwj6atLPr1nrAhqvS6xjcEOIsqzz00N8rhZhPvFHmp56BIvDj+0OwHGNmWVSUs
	 Jw4CiD88GlvFudtIL+4XzC+8cAnZK/E4r+7NDrz7fQa1pmuWghtRy/XqZ21x92ugWKZfE
	 k1FZ3Ojw6IOsXnA/XzCZVZoRalcvwVPm+g27btymeTxphnbMBB55fEEp19w74N8Du+ang
	 AP52K8Ehsn++AB5PZtgEZMbW4iCkXiQyBMWqTGNd0+VW7y3OzDMObfCNgnoIS99gYg4an
	 N1y4WvSrAAz5Eu1ex07L+39eII8v0k3r5mrqgaxcbA5c842MLFRFZm2UdmBZ7h8+9oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JO7lYcQL;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00AE606A8A1
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D00AE606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JO7lYcQL
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc91ddf447so1703218137.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494297; x=1795099097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
        b=JO7lYcQLJt5UJkm5+GVxyPeJX84yxzbD0FxSFeMQ9kdlLif6/eW6Q+qhEDIC02SESa
         H1fG9rAjjWGL1SXzojIs9HlG65mPyWLPxT35AoeCI9k+UhCTjT6qyi9Xn5speIMzdGbF
         KS2YjZ3mPEMm6vNFQITUIqH4uHU6DrTp+2pbmjw7AXqufi+M4BUS0qbrn4Dweu8Z5tnX
         w5z3B+fu/FcpOQYEYxQmLLBTqeEI8B92SLW8F98BApbgeiZuoqCXD2bWlEtC5jnevUdd
         Iwx5WFg2XeFYECOvklFcPp3YqxwCDoM3Se151eSm1d6WdN3gIBmprJLSst1Vpsqcr2Y/
         LHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494297; x=1795099097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
        b=VYVj//PzHjWevMBXPumlcp/B+NoPWc7XANG9uGre3kURTca8yVPnAA13dG7olsodnu
         szdGEkAbBGSg55jQBCLl4m5cAXQWI6P1hisbNHQzavmbhAmSNbceqcDTf7M9bwLAka+B
         jEI0krQ9d6bvMw3xSzFzwmqveU2n+UDmm41i1DcIOXtijiFtndLh0BbzKxvMtG0PW8J7
         KIlNQQ6oWVcn9TZYGVBIsZmR06fdXWvBIGsMQjFW4/hBtGW0ITd296Ki+EH2MfHifQNZ
         T4lEmS6An0M1F70PJVIsVLlv75GXpIRpc2WbpAwAfm4r2n9MWuy0ar6QL4o5uFPpTxMd
         NCSQ==
X-Gm-Message-State: APuU4Z9GoNpjMP5NCztSu2j0kBi1i9b1+ex2qEwujdyaYYTY2W6L2JXY
	AtE4iFiJsPmh98g95xGv9jd6h16q3+h0fh0RALNi8scK3vLJS8eeCZWH
X-Gm-Gg: AYBFou0e/i/jP3j17JdbTROsuxoz87xhPFn+ZAOyyNkLwh80YUtfRzOnz34BLpKVBFT
	F64sdGDcITZ5oVpM6j6idjO0pO5AtzE6WAiVWzsNVHXgF2VBQoEqCH27M4UUZljW8zwArxXZRxS
	MjtHy/VmRpyMHMjTf7YBjtGB5BsG7BNi3fAEHcOqWN79SaMUD2JS4xWBGqYbAjNrWfugHWF41oP
	z0LfP2xPbr3XpOgVXnz5lOlAtJhhffCpzZvppYk3Ks0mFTU5C7qM4R3MkERk/rBE0BqQm6HLvrH
	hyVXX00d8tZhpNGgmy2M2Rj4U9ECtfDRr2dgm8BAFszN9QuypsR43qPMbv/CGRmPbcxFkeh4bD2
	zyfH7O4j/4oCCj2/29FC66NBBq++nmyIBaH1hLV4Yk1gUk/TnqbkNuc1V9f4d1fQJqM+ag7MOND
	XoYpNEf4nY5oDZfyawfB/tYpVJF4qT1Smp8JNukPEWwjovPzIBiTBuQBLWJ5C2mm9vEeUmSQH/f
	QdrjUk3uNyQiSyH73Ls4k9dYYSwf41COsPkYhe+ZjZjALwbz5L8OvypqyVhfM5fT7WL7BO3OvCf
	IrRo/W2tcvYeFmC++kR8IIqdV3LbS4EfPhdgLTHSP9YPM/4fMReUAzE=
X-Received: by 2002:a05:6102:c4f:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d4edd1c21dmr1830857137.1.1794494296470;
        Thu, 12 Nov 2026 06:38:16 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:34 -0300
Subject: [PATCH 2/3] arm64: dts: freescale: imx95-aquila: Add GPIO
 pingroups for the Lotus Carrier Board
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
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-2-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=3366;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=E6ByCUL0N/O7LejHb/X4auWSlo2ji9+18EP0glmb2AE=;
 b=kfiguU1plVyEnzHlHbVhmFtsvSJI1nrPiCltOAJzbi1SapThDG0yPx+EWCJJJBvaKpqrocvLg
 RtvqJCcTPwkD5IZL3ScBoHZCa8ifHFmHWe7d6TDcrTjEJPFevtjwiEb
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The PWM_4_DP and I2S_1_* signal pins, except for I2S_1_BCLK, are used as
GPIOs for SFP+ low-speed signals on boards which contain an SFP+ Cage.

Add pingroups muxing those pins to their GPIO functions and update the
gpio-line-names properties with the newly added GPIO pins. Additionally
extend the modified gpio-line-names arrays to their full size.

Also add the I2S_1_BCLK pin (AQUILA_B20) to gpio-line-names, as it is
used as an Isolated Digital IO readback on the Lotus Carrier Board.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 61 ++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index dbb0b44583a55..369d5aa469ce7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -277,7 +277,29 @@ &gpio2 {
 			  "",
 			  "AQUILA_B42",
 			  "",
-			  "AQUILA_B43";
+			  "AQUILA_B43",
+			  "", /* 10 */
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "", /* 20 */
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "AQUILA_B58",
+			  "",
+			  "",
+			  "",
+			  "", /* 30 */
+			  "";
 };
 
 &gpio3 {
@@ -323,18 +345,20 @@ &gpio4 {
 			  "",
 			  "",
 			  "",
-			  "",
+			  "AQUILA_B23",
 			  "AQUILA_C22",
 			  "AQUILA_C21",
 			  "AQUILA_C20",
-			  "", /* 20 */
-			  "",
-			  "",
+			  "AQUILA_B21", /* 20 */
+			  "AQUILA_B20",
+			  "AQUILA_B22",
 			  "AQUILA_C23",
 			  "AQUILA_D23",
 			  "AQUILA_D24",
+			  "AQUILA_B24",
+			  "AQUILA_D25",
 			  "",
-			  "AQUILA_D25";
+			  "";
 };
 
 &gpio5 {
@@ -1041,10 +1065,30 @@ pinctrl_sai2: sai2grp {
 			   <IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_BIT0	0x11e>; /* Aquila B22 */
 	};
 
+	/* Aquila I2S_1_MCLK as GPIO */
+	pinctrl_i2s_1_mclk_gpio: sai2mclkgpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_RD2__GPIO4_IO_BIT26	0x31e>; /* Aquila B24 */
+	};
+
 	pinctrl_sai2_mclk: sai2mclkgrp {
 		fsl,pins = <IMX95_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK	0x31e>; /* Aquila B24 */
 	};
 
+	/* Aquila I2S_1_D_IN as GPIO */
+	pinctrl_i2s_1_d_in_gpio: sai2rxdata0gpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_TD3__GPIO4_IO_BIT16	0x31e>; /* Aquila B23 */
+	};
+
+	/* Aquila I2S_1_D_OUT as GPIO */
+	pinctrl_i2s_1_d_out_gpio: sai2txdata0gpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_RX_CTL__GPIO4_IO_BIT22	0x31e>; /* Aquila B22 */
+	};
+
+	/* Aquila I2S_1_SYNC as GPIO */
+	pinctrl_i2s_1_sync_gpio: sai2txsyncgpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_TX_CTL__GPIO4_IO_BIT20	0x31e>; /* Aquila B21 */
+	};
+
 	/* Aquila SD_1_CD# as GPIO */
 	pinctrl_sd1_cd_gpio: sd1cdgpiogrp {
 		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0	0x1100>; /* Aquila A1 */
@@ -1070,6 +1114,11 @@ pinctrl_pwm3_dsi: tpm5ch0grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO06__TPM5_CH0	0x11e>; /* Aquila B46 */
 	};
 
+	/* Aquila PWM_4_DP as GPIO */
+	pinctrl_pwm4_dp_gpio: tpm5ch3gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO26__GPIO2_IO_BIT26	0x31e>; /* Aquila B58 */
+	};
+
 	/* Aquila PWM_4_DP */
 	pinctrl_pwm4_dp: tpm5ch3grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO26__TPM5_CH3	0x11e>; /* Aquila B58 */

-- 
2.43.0

