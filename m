Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680413;
	b=CtDDzTMvoK4K8AF8O8x3vAz9Cm9OXQtNTrpefaOpdtRpku6QpboSPovK9k6NGbQA8J8P
	 DfooO9C+NrcKht6oa+qOLYfBNKGZjQ6lL6Z8a+b9RMLP2DYWu2NKYwzFVlPesG/xsirKo
	 csrsjqEGVR4BjnyFNZBQwYvJAUEkWlVKDXTPwbKmJa1JJ6ZXpIO3+RX95hqNOD5xfvOqL
	 Zo/rZj+ZlT9D+5/91pgPTobBqMH1KRn+MkZo0ijlsKxqKVSyE+WRdE62XVj/74wMmpHQ+
	 +DkrLOGCV5cbgcKSa1Pf3uWYKaK+fT6HKmnTZgKz2xvUPSeIiVOMP6X9MBiHzDU5sjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
	b=zM/JCc7xC2dwxyHrd3MqwseMVMQ/SzwvDs8Qi8OmV1hDx6R6pRxVkanpl1xYP4hjGB/k
	 1XmOEFQszdSnC/raVN8lT17Fbo2sj6iq9hWvbdrSjh/prx7w5dX+vez+CxlnShgEG808Y
	 PJTGcTfqSETHnGVXZvBiJnFKgS+0suLD8VphMU+gcr2b36lrZx/jVWLD57uROADRiiDuG
	 lvzUOGYORFrUwibnTBumWzeuO0fXRWk3ExNZDOBpwWA92Zr1GlAOtgb0XB8XAwa1oTljD
	 NCDBE/AkPBxjnEk3eaVO+7h5YFnzPvuAtERyGFGicu8P4LuYFoK/BesEleBegvk7BKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GZ2SPGAL;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226B606A325
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7226B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GZ2SPGAL
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfb76b304so269071f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680412; x=1793285212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=GZ2SPGALuWUI6MJ+Gu5jkSj2P3tt/pSOxejns+quWcJWBTQVLktPVimrPvQEe5WgRq
         VrvCID2/cZUhNklU5EyRaGuIqOL7+NMGTzOsDe1LfnzXk/3f0HDUPCgijY2ZwE4siLEo
         WAEPyxdAQOpRZfpE5111YeBo3CTv7z23EVdSfI/11VX8iYOndcrNDDorqHxwP+NdSsuq
         cVYBtfPpBtuBM1J/BXRrJy/Z2jVBuEa05SpTcYgxHQ/ukBjDJLCtjBTWVdNWEzwL9CYk
         uXEQMjOijnJJOtMF0drDtmbc7BdEavz3RXQ8dmD3vCZpA9i6vryZDwxRrAtQrnzKpHtj
         q1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680412; x=1793285212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=fJXJuby11my+8hJyx5Byr7c8zRdXn+TJXMfL8qHl2ekEFmzza7AV9FxYWQltUlie7Y
         uwGlBvBfTPuTb7pPIQJSBQIXvJVA3jDbo27JdvVfARrSHKysqjKsoed7g8qRr/k0ieym
         L/G46EyotxlHVqMIgGzhKlNmLyi65M8gaTW6yCLO/MB0Nt1tJ4+Um1NFcb8BGiTSwD04
         yJw4o4iVLeQTx1TyihzwrkYcDb4+p68qLyspRWiS/iU2kazH5PAnEWIooDVx3hwWlCAl
         fzffmyTFE+LLZGNulQ92Z/WEWGu3jjHI64mASur1xp7rvfLnnGe/Shh+N951R7uffI5/
         jsZg==
X-Gm-Message-State: AFq9FYIYOCyuDDXpY3fjw9Nx6I/FRdyVsjorAT9HkL8r+LorkW8+UTbi
	J01NMa0IAq3BDKL3sbXkR+urUB4kOHJ5XZKm9HBnKGg5TFZ96SAO5kji
X-Gm-Gg: AYBFou2z8Kz9C91kV9sCBWi5DLFw8FQVJTsKuLkLGJ0WAoBI63U0FKkOdhRZ3aA2he1
	aFZ+UxW5x3ZDvLqiFmyI07wgH6D3z6kWUqpjeodafIGu5ntbaAxmaNE4V5MvzHSZZ4RHPhQYt1b
	RWaF2Iwr1aDFFfam2HWAxqx9f9jijbqlEO90+7E+9iXM4sfOl6ZSI9IzYjjAbMimf+RTaAqMdaZ
	TiJzq8ZeMMK2vZ9xqSYk6CLTWmn3RDP3KyV/SYKYLCsn1KSK9GJFNzYP5O+446X2PV/6lwR3zhU
	1qkyU+Vj81cmqKLl6CewGDgsR1eyU45V3RLweqmYFFyfmlbEQIjO9/PQpY8v2LiMmEkgD70Z6oM
	Q1d+rEy200ksrCtBYbr/dtX2M85q9BBqggiJUOm5JGel+9Jq68ZthHJgLbCmeokATI7xwJP0bL5
	iT+MwaZoTIYdNLnN0cljP+OdT1RfoESnJ4MzajTAu5G5eRBBpauJ4toy055Juor+7xVJjPGax/3
	Sm7xzShgraHGAU8ZGi7DXuN/v2IGwWx897X0pBtJTMHzhnGT6yqS6UN7r9ufcjSbxDhpr8tsHTM
	spuOAQa5oeQXJOax5UzF/80NO+ofT2VmrKDL5QqRzJx5RaYwU1vOnj1q
X-Received: by 2002:a05:6000:4b0a:b0:48e:1080:3a92 with SMTP id ffacd0b85a97d-48e264c9785mr11826653f8f.32.1792680411774;
        Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:45 +0200
Subject: [PATCH v2 2/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 camera connector nexus
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
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-2-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The SMARC Development Board exposes two 24-pin camera connectors with
reset and power-control signals routed through the SoM GPIO expander.

Describe the connectors as GPIO nexuses and add stable labels for the
camera buses and CSI receivers, so accessory overlays can use the
carrier's interfaces without embedding its GPIO routing.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 26 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 +++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index c28d63293149..e0096388fbfe 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -13,6 +13,32 @@ / {
 		     "toradex,smarc-imx8mp",
 		     "fsl,imx8mp";
 
+	smarc_csi0: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_0_CON_RST     (pin 11) - SMARC GPIO2 (P110)
+		 * CAM_0_CON_PWRCTRL (pin 24) - SMARC GPIO0 (P108)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 2 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 0 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
+	smarc_csi1: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST     (pin 11) - SMARC GPIO3 (P111)
+		 * CAM_1_CON_PWRCTRL (pin 24) - SMARC GPIO1 (P109)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "J64";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index eb8b9db7e3cd..e8e718ef7822 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -587,7 +587,7 @@ &i2c2 {
 };
 
 /* SMARC I2C_CAM0 */
-&i2c3 {
+smarc_csi0_i2c: &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
@@ -616,7 +616,7 @@ eeprom@50 {
 };
 
 /* SMARC I2C_CAM1 */
-&i2c5 {
+smarc_csi1_i2c: &i2c5 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c5>;
 	pinctrl-1 = <&pinctrl_i2c5_gpio>;
@@ -655,6 +655,12 @@ fec_phy: ethernet-phy@2 {
 	};
 };
 
+/* SMARC CSI1 */
+smarc_csi1_rx: &mipi_csi_0 {};
+
+/* SMARC CSI0 */
+smarc_csi0_rx: &mipi_csi_1 {};
+
 /* SMARC PCIE_A */
 &pcie {
 	pinctrl-names = "default";

-- 
2.43.0

