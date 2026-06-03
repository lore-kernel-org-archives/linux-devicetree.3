Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0C48125D
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492384; cv=none; b=Bl3Hwks1PH79u1OhpLyWM4/kstU9qxexvD3+AbOO5YaG6nQhw4tUtYV2blLN7gyAlMWD8twKyleUuKdJ+FIgdr0TL8wRVgc0y34m33qIx56npcFJcpHzp/dbYai4Hv0MW0e8CnolPqHeuNkOECQodAOIwdY0kAG/YF4S5mzAY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492384; c=relaxed/simple;
	bh=CqAtrMIAuTr+WyduzWNqSyX4HgxvH4WS0Z4W7V7NMwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMvYl9BFF5LluzIgvCATepjS7dOmdhNvS+RqbQob4dgTYVmvTnq7oFmQDNdgjsuOEL5c7GD5BR5kGcR9mkzzU93OSOn6EA2lw1MX1IYRIRqC177iFb0e6T4h6gmqXvUcIyyEQzLjq80JUbhPyI1V8R3f4LXOfUbZkLEUzuXe4k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3kA1dy6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3kA1dy6"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa6c66e6c5so2325306e87.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492377; x=1781097177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LItmvUsB8D4hbVjxhrNTZcvzqIugkVhfkUtCucFdaKU=;
        b=X3kA1dy6bbjgE1rLir8uTtZ8/ubRVvDwwdfeEaCHWZeJiotlsuMsaIhEEQQCBzuusO
         3hUSg65vDENL+/AqhamXD+bIExVArOAp8N/aWDaxjzBktn2UnhxA1uocUh0deE4l8hFB
         tCM+dcOVu28pIkl5oL8XftoNp+rm8LrnmS+/8g6k+/TuB5xVD4VuEgeNv2gYlSqNfxHt
         RCQWICVdEd8o5I40cjZhexXmP1xgaJY0VGgvkFhEQNaFGUDfN7Jb7QgHVnqUxl4u75iI
         VHnQ4FDzJbZpoJzgXHBTaoq2p2C8zCLYMRFI23I5SwFwjbS/AE8Ew0i5ARaF4kbTuTku
         PwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492377; x=1781097177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LItmvUsB8D4hbVjxhrNTZcvzqIugkVhfkUtCucFdaKU=;
        b=WTRMpZxjx0NRp5CVAmawF3sxA1mX4hgPyarX+zoNDrV9WoUGw0+80RZrlWYziP5esr
         UkUAPee3Lsf1OLLqOWWfIvnQJptFk/F8oZl/hePf2Qi6uoaszewtsoDAYF79RsaM84Nd
         pBZCW1lm4FAky6lI8B5HAmg3sjx0nibQGFX/QxOtNhJ+MrDx7WcPBJ/EoI1AXCQ2//pX
         J4QuJdVtT03zfbvPHy0Bg6Weja44rry36gm8jzqw8KEMknZz+iS+wLuN89uVdoW+nG36
         Cag4Yw1oDQj4GgwE1uzKZ7bGjFzFPaPZmJPby7mHtxWhCSE6fjHq2VU+LRo14pYjgvjb
         YvCQ==
X-Forwarded-Encrypted: i=1; AFNElJ84Uj2uA0oNjC2evdgvFGLaz/rglb2Z1sH5FkCGMww6SnmZE7mYk9X57IvXwuU0dq++Q9EChwYPMzYc@vger.kernel.org
X-Gm-Message-State: AOJu0YwIanpTwAFho0VUZE/He1WaF5l7VfkYlPVVb20pA/hsnZwCDxp7
	MyzJl9tBDFymgsyp+qTklMVjOzabOrKwLlnFLxlfyYm4GfJDSesCl+fE
X-Gm-Gg: Acq92OFeC/278oQzMJEJFOSN9qlEmRBEXwb9m/w2/zTSJq9DjhJ+HdAcMe9XBxs64QB
	+KIKjPdzUMUJHFyeNJ633gnkbKyl7uwDj9ilSna7SZ+B0DJuPEcPmi2XycEwiyB6GSpvR2qCL35
	J0W7ziMJprqWK7SY/irQAidHPivofqc6PHajxW1nb1n6snR4kZM8mkhLpUG5vTAL/4WXGvJPMFi
	RcHb1/j7RgU6eAC6fSy8DMax4c86RA46sWjnVYrVtjWcdJ173JZYeMi2a1/OA8ZcuyZqU9wvVFs
	I+d7IWrwgCnuc8tdWEdvrcJNNoPJ9/+qrD1UvVCfcCFK4ePRjc0xM2ihBlFaWLGIUrTv3S/q3wJ
	q9TjRAUYc04HOjul24ZcMLb8vZceXMI7clQl+vyUYjcg3mfj25VXqSd6BUSMVMjUgDMNy9Cvj7m
	uPGsR5/6X38txjAJBD3p7i3KbCJJzq37hMnSK5lCQuwI8x6AE5+K0lIesF7qRwfZdj0+r5piyrM
	wotQI9kYGqYQn0c3q7JkagEaXopSS8d3D/XvT9B0eeTFOgGDRVP59xoRW8=
X-Received: by 2002:a05:6512:40cf:10b0:5aa:6e86:55e5 with SMTP id 2adb3069b0e04-5aa7c09b9c5mr1017427e87.13.1780492376896;
        Wed, 03 Jun 2026 06:12:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:56 -0700 (PDT)
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
Subject: [PATCH v2 03/12] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 15:12:41 +0200
Message-ID: <2e7ff00b61aaa855aaa2c6d9ad6e98eb673bacf5.1780492180.git.stefano.r@variscite.com>
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 76928b005826..6c19a63ce405 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -116,6 +116,31 @@ typec_dr_sw: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	pinctrl-2 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3

