Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CC046AF10
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488004; cv=none; b=tpRUrDExwLVO0ZxrhTVx3Szz1qitKg+jp2hRyczFs4lzTf6epA7EU4Aw7xK6FAtyNmPv5mQfl0QOv6qPZ2wXgUh9steJUleS/SFjK/bbwRW0nzBFfgt+lRE/iMApCly/kJBH5TMj8STQnhhJ7VoRSu++zELH1RwkdkjFD6tGogE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488004; c=relaxed/simple;
	bh=SKVKVQvWyYO2FnYxKoN1QjxhOZrsgJI0bms12zf8FmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6FC4hoKZKFhx8MAtY1dbD9hMWvcazp21AIi1gbW1wHemVRwVqwZjRVAGMIYNzQ9dk4BiEeAONPl5D0n2vl5SAzBpyqYBE7i1PC2Fp8GWxRiFpSZNzO1dtLRNFMBq9+pE/Zdp0l4AhTud1Oq/bjrFJe4+TNVcoJq7CtqJIA5PDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNizzk9a; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNizzk9a"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2766205f8f.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488001; x=1781092801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tO3scwQLDILDFlQjuU89g4Kx7wsmtUF5t3cLtUVDts=;
        b=SNizzk9acKTCVy9x+8Y3MYCKKwBcGpUVpI2/OArzcHo5ugFHbxSZzSgFPrKpuVjO2N
         M8K2nmWPo7n6UQNWRIZIgS2hVUCnMJDCq53gvLdzxh9ljl+hWkK9i0oy7YI/gQHn2OK6
         5HcwcUbFbPoaVThQIql26HehwMcO5WmxPIGtbP/ILx8lHeJzghIkoc96jAqocFerSH4a
         dV1QwkRn8/t8Z/JVIeZQairR4jM74iVQ3FdCU9uzqYUPHzPIeymZJY7huLN5S0BXSgHl
         Dt/H9vlR0kcWusSsk/ty4JXJFY23F7Abk2cpK5IgEjKYhfiRsPD54zqQIDyUM0+7MoXr
         Dbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488001; x=1781092801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5tO3scwQLDILDFlQjuU89g4Kx7wsmtUF5t3cLtUVDts=;
        b=rHkCB51rUaPc6A+Cnni2COh4R5LLd+TwSqrrk+MVx5klBj7YKSR1Fcildy/KIi617H
         LzsmujXEi1Eiy7IdtKY4jerCxlN71zDQ44mCjGD8P2SmsUipA21H40kzWXyK49EhFNdp
         OV8ma/Htv7rAn2muFTerCkSStlcl2M+EVGI1Ei+trC3Lnf5mQKdNj3m7uoclRt+K5P2k
         pTiXy0t0q16cNAOsOQaDPkBZJnO73KtzpFu3pkqPaJPbxLZL2E5ZaRGek6iG4e74u8bE
         IBbCCd9ZVqttV1QYl1aOFU8X4x54me9032TwD/jF1vzU+KFB6XnbI29P7GULVytHdth0
         x2nA==
X-Forwarded-Encrypted: i=1; AFNElJ/uH44YTEF4rOPusFKF1LuNwVcRT0pEUYGQILLI4PlJIBkJipR8iBVTADpJKEdUjIb573CtlOS334Ad@vger.kernel.org
X-Gm-Message-State: AOJu0YyGaeifqhWnLxAVXLxAiP6pm3tUjY4RWn+hIbUSO8Onqg+0CtdS
	1DDHNAF72h9U23HB11OQwsm1n5LwVYQcwSpowebvQA+LIRxB6aPRLX+q
X-Gm-Gg: Acq92OEm8F74AV2QtJVvLiewymYmTacbqOKRxXeLkZvOGi9hV2SmpZU1afCrtcXoPnW
	fbSP60iEtB2PDBcvdfqvtJORGbGWMt+JMw8jwyk/JbyZnT6depsdog6fc4e3FjSTewbDPLQ/5Kk
	/LtHOOl71ckWnOGOt26up73rjKKnGJtswoxAX9/vbWBKS2WZcm9vcvu7Ui9Gi+kTa5SRHs39BEp
	9giy+3MMitErV9lYPzMrDNjQqfi/yYV7lyjkW7RXfOVV2lZZQ8qQ8a5XLSSCP0+dwUaGVpO7l9f
	eujg2KM+L/ZBLKOsh/Dypzv15eTEVXAK/llf6Ld14Mg46iWq9jgItoiZNNGwhSWmp8BNDOecDWV
	MghO3wCYDYWTptOeP2j8WLQ0FXbZp/VLv/TQ8RCJuPyhTnIrySZ7yZviSaszDNJX5N59tgreCuI
	XVi3nY9GlH+QgeERly/R6gDz+ScXnjM9R67sIEjRM67kSnX+nUDCIqHoayNUpI9uS/zIqx3BepL
	u6SEsa9+AizDvoZvaQDhLGXNAD7z7VkDWjmqJlDYhBsMOdL
X-Received: by 2002:a5d:4e05:0:b0:45f:f142:d569 with SMTP id ffacd0b85a97d-460217bbdbdmr3322115f8f.15.1780488001203;
        Wed, 03 Jun 2026 05:00:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:00 -0700 (PDT)
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
Subject: [PATCH v1 01/12] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Wed,  3 Jun 2026 13:55:39 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

