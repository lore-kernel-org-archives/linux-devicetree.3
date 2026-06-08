Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B393CFF4C
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913396; cv=none; b=lPkCd73FndGjPqDca5rUaMazlAWeFamvGbKWTLY2wQx4wRpHsNQym6xH24yubzM7N4xjPOvTG/RZ5Ug1U37wTfwhym5Gxj5fr4Fk92q3Xhyh+gZnWSOu4XeQnA42FagG0vlaD7TruweX7wQSOLF8V6qYGS0rvmHi1sEQYdkty3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913396; c=relaxed/simple;
	bh=uiq53YdN9mD5KH9bgzWCxtVQkc7NMgMKrqahaNEO2OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBbyFuIV8j6R0uk/hZU0DJFdqPVHAWiM0sUl9dL8WomDHZ08O+SjT40wGXt+ntrnF7LANeNUWUJzQfyhgjjbH1Toc9Cox/RWBgGqSngrIFme+JCXM+Ifw2JjPU0lqhju2eOMgz2+0O0aVyqzms4adCX3jXeNb9uMplFMmFgQ9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaHVTH4J; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaHVTH4J"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so9915585e9.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913393; x=1781518193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOMpLGsu1GWWWZlLzdQ6mKdRcaKS3cPpX8tZ/ShuVaY=;
        b=OaHVTH4JDXYra0nen4CRFyxnhk/FGacPs1coYATIrjJjBoLJ18EHRX9Rq8qazh+TqZ
         c6yJgKjApXnb+aVgItKv49noj7bRJ3GFDa0g6mg/7T4chx5UUB7xaww/TInjEd+7gNNq
         hejB4GU/GAsXg9aEf2Y40X7G6Gq/Ro30X59zA75gQ+iFy9r3ESuzzSf0DA8uMAilRTvS
         SD+NZw5wwH5qEH5Zz2yIXQ1CCCvJMZe9bvk/EHEcOnwW/wvaDdNLD7AG7pe42wx8o6OF
         IQrTgJvfPElqQ7gDCgJLxMj2Ao7TiVe6x2Z+vxUnvvvHyGgED8sokn1IiWcn5B8z+QcS
         gQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913393; x=1781518193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LOMpLGsu1GWWWZlLzdQ6mKdRcaKS3cPpX8tZ/ShuVaY=;
        b=EL5eoCGfZmY5dS6C+9uUCp9oIym9sfzeQcEqroE81ASkbUY7hl6aumc7CS2IG8C6TD
         sb2QvjUsKZFZ0TE37rSH177koSloNi1C99LkolMy+xBf/ZlIF1RUl59ONBkW7Pby8Ab+
         hzlMaZXXcEuq/HA1bD8i7RIishFoiANBaRcgQNGNxOnQAeZqnPBLIREvo+AtT1F6faTT
         2G7ZhgJLxDNPUBry/Rvik8gM/UzWnXdWClnGb8Tp+2IdzkyW5vjBzCAOWEOc0PQ2wiEC
         YK0uFagDThZxFx9iIzBnGzCFP3GYgWly7VnchoVRXBd76ffls+ohlsuVrPM9bAeT/1qE
         cLSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fjHzITVR/+EdnID1O4mXxXjZT3UeD7drL2PwoV0BlqERuuypOZlFZQixPUr3IgvKv/bnKYPmlxxnk@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKVJx6O4ZWSp6hs3Wpn1QliFriKvKm+tD2JRCAh3fxSJ5GygO
	/BvLS3Ij4jgaIHnBzSoxUw9natNh3exPgF39QQMNwf9GpEx1CTR/ryF8
X-Gm-Gg: Acq92OHqGYrw3PhELl3bVhvc9seuyoYWJIn854/9lT3RnX1FaLgXrnQ3qqC8ZXl+wqS
	4kjqDFCO/oWgpgRPIZLjpQWqxxzEAGZSYCZp4C+nn56A8cUwr8zIApZ/Rfi5tRqNcR3af1D9pre
	YhXF+ZFXzFoCVFsImp4yH3bMX5u5l1d0k5Oyp2sippOpEjPOeukewV8Al5fUEFGMWWfEGEH1jEi
	Z+G9caRuONllPIMDIxynJo2qW5krwcAJQ1mL0ORbKnHghdGUJkkTu8Nz1cuYhJ3URcAzUTMekKT
	A/uNWJifoyg7Lb98oZrwJXMZOKbO2YXuU3k2U1iB/0HBMLBdg1LDztw67szW1KBBOjGm1WtxTpV
	9NKlvTeS5D2zEbqAJSmgvHExNq7ZjdAEZl/+o7/tQDHEo87P9DeTuTgZ0Tpm/PqfXTqjDNHRf9c
	UG/X87qQBtq4IZ7jIn2W6wZx+EWYXB5wqMx135TTqON224hoYCM1uq3cQy5yWmvo71W2o1gOswY
	BP9HTIy1bM3N7uSONmNQBrSrdHldMvk6X1Gks5OU8Qbp39C
X-Received: by 2002:a05:600c:34c9:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490c25b3549mr258294425e9.7.1780913393254;
        Mon, 08 Jun 2026 03:09:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:52 -0700 (PDT)
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
Subject: [PATCH v4 14/14] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Mon,  8 Jun 2026 12:09:32 +0200
Message-ID: <cc46f3773655b49d5e2875b00557a8f81196732b.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
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
v3->v4:
 - 

v2->v3:
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

