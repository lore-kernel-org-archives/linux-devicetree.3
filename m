Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1522E49B453
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326774; cv=none; b=RhVa/8SlDoHdD0iqGXt92vkRWakyNoKXmrCzlZc5j9OOOwtGoq9Tf3TPOTdK5REP4XlwpllzCTjyEIeN7dIVRlWZ9s3xMjINV2ZnPjbpGCi8fdvUtDGt82SHqLMWdX8hV4s9v88sVRPbDyHJa3lryd0h+wmrqi071oUVaV3ryW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326774; c=relaxed/simple;
	bh=sDeH5Aa/6RVXWRKxDt4y6WTi40kVY22vaLdAcItynqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlwloFS2g86mji5WIehhDHPt5dWx8cY/egjJyzQbMLDIVauIY54vaYYq6EeTKDlNj9Qg+U2O9rjS2yj3Z/ELYj0956KdZaQ41PpGFDPNQttfqZ7mPk3xTdeoGt9ohmDmLMOvvTWGVTj2RrcQpQr7eGUH/htHGhMsWLINOAOEZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/ETP8sg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/ETP8sg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1e1dade31so2634835e9.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326771; x=1792931571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=le/7ZMUGNW/GaIhf/O4ysG6KC+WhTS8gzrqG1Rpguic=;
        b=n/ETP8sgzIZZqpAfnh+5/HQd3VL8/ZHYtwhSr33f3ltgWkFpcwMKzSLZoM5KQ4GpA9
         GA7Dn25M96A+HtNVQCKsvcUaK6vkxNERmERPWQkb/CrLuGs1PNJyNu8c6HH9hYERJX8M
         6BuHvnFQ7SASbQ8LYLhPXicEjtzhBBSVTXU5XhOtu3fmoZXBfcdpBVMbXQfs2VfLd9k6
         wQXVAR6KmHG+RAvWzZaD2iZMtJXVbjfDq4kQCxvBrTIPw6OX4MQwVER8EWUa9U66szQN
         3LYN5UtsqsFKJ1hPB/F3Zbdxhi7g6ICA5teKcHYZGw/+AL46SNXkZrAxjGXaCdkXc06j
         b97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326771; x=1792931571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=le/7ZMUGNW/GaIhf/O4ysG6KC+WhTS8gzrqG1Rpguic=;
        b=r6O675/WyTGGUmgaLdN+zm+svC112IphYedlgyTDpsYmiDAtqSJSPe/ucHW46r+6Sb
         mXygwtca178QYSm77/hQhfFeaUnHVPjMs/u7KDxydex1BWDduI/Efl2e1Gt1MhyNdgs3
         Yq2rnDNfk0ffw5DaImghk73CkZJmqL9lSqfqB0YKNX9co4SboRDIDPE41DRvbn9kSE79
         uBrO5qUavg+TDFeppyYBykibjIP0n1BzaGkHpWD6r7HQwLYaRSH1HdgFLjPSlsKq+Asw
         AyJjYHNZ+mxiCRXfAYl6zhjpsli0qWPd9Gg321cj4vHKeE6tAqwi/WbxvqMJ8ibC5MNT
         aUfg==
X-Forwarded-Encrypted: i=1; AKwUvBwzoMNvK8NlLZurULO3PV8MH4FWE3PaUKa4HwSQzC1j8EIfDCs3zP9xV9hvvCZymhpR1Hr3xCUzkNzg@vger.kernel.org
X-Gm-Message-State: AFq9FYIyU8ZOKTrWBA4Nn+sG7+ay7L1ZZ3fqW+ZyvdpM7l/BiEr6Bzkt
	08mmsELs7gVuPIQROgp5z3D51Dg6cZll/lLUtGvSjNa84jk7bYyrzqI8
X-Gm-Gg: AYBFou2BQ7m76k8tT6kHTEudKNOuYD0baErwAZoAbQ2i6Dbmy3SNIDcqqxZUWZw02Yp
	2cb5BSKIylRe6PD1wt3SGkA5cAYm+HWQnXQcwBrre5Kqvg4TRdtt732Frex1Qvi+FbLhUbOnUpn
	GshcT/kcYPhGxRIcet8d4y1EE93Wb45tBPt+AbBrPV1q3YvzkfKyFga9sjjAR0q32j/+u72lWKF
	VQ9bkf1W2JeuCx54P7Lo570oZQlNJszXAdPIWeJEd/vplU0l32vmYoJPsKL5TDfmr7+bDE39lku
	YvgW4wPEVkXAwfOorBg8dgLchyBnOa+OfMRyBM8Rh4ygGHAXqRhIdjQ7g9MyCGvhONs3IoyCY8B
	Onhm+e8V8M2KE7tF2pt/TFDv6SY7+WYDGKmita0BhsU8Wm87NisEAOJqYxLAWQRlzsD8Ojr1JR8
	Jp1IVXnZ+IyHacOJtKw/t4XSKwNeH0cbokkuBgC9pB0XGQARc2QsU7a6trhWDUPprKVLT/IWgwu
	9iMCZwwJ+3Wi8fNv7JomSkChdYh5jqAYmC802m0dlR5K2OcktuSZCJJWzh6UlxxF6D1s9L4eLaz
	obKPYEVYW8uCBBWKR3SbMA==
X-Received: by 2002:a05:600c:4e8a:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a1d7630cf8mr109051655e9.33.1792326771289;
        Sun, 18 Oct 2026 05:32:51 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:50 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 4/4] arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:27 +0200
Message-ID: <ec5fdbdf55d25cdcb756d16709a7011d5bbea9b4.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C1 and LPI2C5 bus recovery
as open drain to match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 409c7e74ffe3..1f0954620195 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -210,8 +210,8 @@ &lpi2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
-	scl-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pcal6408: gpio@21 {
@@ -265,8 +265,8 @@ &lpi2c5 {
 	pinctrl-0 = <&pinctrl_lpi2c5>;
 	pinctrl-1 = <&pinctrl_lpi2c5_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c5_gpio>;
-	scl-gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca9534: gpio@20 {
-- 
2.47.3

