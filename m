Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E9A481AB6
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492394; cv=none; b=Z0tHhZ5ZGyVrIFBkftBrhrxTjJN5sol36vg/iErkgxg29k+YZJoUl6LpljfYZqd8sLHVrkiwwE8QfY0XKxtlStSgHC8HwPwryWqDw48H85XXIAypwZ+4sjjJsS70Ki2lni0luo8f3M70s4puoJM0VYfx9SBmeSnqnL03uuWoJqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492394; c=relaxed/simple;
	bh=Sp+VruQEzl3HcXZu88N2hYyC3gVZFm6gEAemuO8HUqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXVevVTsmS8hxuTJP01dYkPRitqnDFJ4Lh0QUssFQ6lemwU2i5MoEivtY1LiXtfaUAv3CKfWWxHRYm0M+UV9S9WZ7d/WDy+seECQuGpvvyUdjKoZlRBUjG8SymG/keTmkO7d9shLiFnvr9hU+eZRBahv5LGMltekimcdyR94vJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0e1Srm9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0e1Srm9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eec22fab7so3510660f8f.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492387; x=1781097187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKKJfzXLLkRH7XSkPhI5X70VU7gNsq42WXvtDW5Ht6c=;
        b=L0e1Srm9cGhbqdSG9C+yv3WVaikzBA2k8H0PI/KnTkjHC4EZGvtM9+oYfqHS405Z93
         symfKDAs8lyw5nz/GcD75enuWnvMSE95YW/Gu48pqlnKMpNMTzWnVzDKLXlJmF6mOnTB
         peGDFGmQjbbCvpwU+1serCnXYjYZNuh65aQPMomcN6RzwkGBwTq2Go+FoJSC5Q1BW1We
         XC4Av8r0yXoc78eCknSOUhI9+kxT1rqzKDtPI8HHhH6A1J5vP+RN+4sWkXn2P8X+7GrS
         fV++CXbIUWXO3Qg4+yslZAh2yrjMVp15hdHL0HBC7pHHWmfNtZVGGZ55ZhehHcqk56Ou
         4Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492387; x=1781097187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKKJfzXLLkRH7XSkPhI5X70VU7gNsq42WXvtDW5Ht6c=;
        b=FEzaLFX5IMNfM/IX8Bk3T6e8vraa2NvF0ZXMwNPtZ3w+Mf9xesnUDOSWu4Ep9HoMqS
         /NBpc41MihXRoque/kQkJUlw8qRHrEddeKbe9m4NWbtnzaj7JPeBtOwAyyXq4V9Suf4c
         uCgA0LqlFIbPwLpVHn8f3bqkHQgSxs5F/le2v8JR7n/RxgG9aV695/HBf9VmUQtiATHQ
         ZIKNezykkj3gEXRmY6TcXgT4yhb/2BANc/iKho5jTX3FUIFy8iGfnMHXmyw++1TGqf6X
         BqGKFMpBYK4yf3FFST6TSngo241OzdELNtYpKxCa6L0w0ZZ4YBi2fmhir3o6hkfpIH3F
         atTg==
X-Forwarded-Encrypted: i=1; AFNElJ/x29+soke17tDkAGS3cRLjkCkF42EkSCiFRVlQvN97MBgw8/JFqoqfhbfSu8mwjd0WK5K9UASA8JF4@vger.kernel.org
X-Gm-Message-State: AOJu0YyOCelkdC8bWdnPA6/dUv7GB9BJ3liXTaX1GqIpvAgCRLTrMb7H
	74YFfxVeVeZ/FaF6Iv6jzoR3ovRqyB+Q7SrRQJvTH/mnUsHhZaAdw0gP
X-Gm-Gg: Acq92OGrHTL3PsdX+2kAbyTqroxuM/Y3/HPp15ZoOtIvlU/rgvBFzWK2NU/0wS+WW9U
	dCa0n/6b/52eu4ASFEoGokxXSmzAKuyQdWKIukKCmEcsncTfbDRQV8TCos8Yd3pAFe1NwmS0+qM
	w0G1RpAf1CIt/CnQLR8cnGtOnEKpHxwJvNhlGLbnTw/NKs27z/tfSDLnp0nQCykpZcyUqCPROWw
	I5suW9xL+Esw0txm+an+7mYiTgoDTOkKrDLf8PXgmTxBIewqqbAF3mU/GalCPYy197gD8XuLpwp
	jPoC/RMEAVsT/NVQcnnXGa29OazWXxOtU0JDRpasleLKhFsGqXm9VXIeNMnJkz0YDuEIYv4E/zJ
	gjnrffPwY+xNMhrgNlSTSSUK4Nv0eXNovu92eytZGrGlC+UgR5Q5GIE1N+7zc+rUxeruolYY45k
	yKHpwyUuEQrQjqXo0ZLIvxavisD/TvO5emXiwflRTw4lkJ9vqO+HvJHMU44u/4uVAV2g07VK+dg
	zZCbWsfXOWtK5Z8oc4g0BZZl+uKCSSCxDJI9+fb+0hXfwue
X-Received: by 2002:a5d:4384:0:b0:44d:1338:46b4 with SMTP id ffacd0b85a97d-460217924aamr3428115f8f.9.1780492386487;
        Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 12/12] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Wed,  3 Jun 2026 15:12:50 +0200
Message-ID: <54a90899d068a4281cf57d2b17bee4616a75f6a2.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the GPIO pinctrl state and GPIO descriptors required for I2C1 bus
recovery on the VAR-SOM-MX8M-PLUS.

This allows the I2C controller to recover the bus if SDA or SCL are held
low by a device.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 49467b48d0b0..61786eee0e82 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -180,8 +180,11 @@ led@1 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -415,6 +418,13 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3

