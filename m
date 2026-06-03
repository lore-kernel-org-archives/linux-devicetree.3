Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19248C419
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497466; cv=none; b=ahQb5XiiTbY/hMrCDGWqUy+IcQZgBZvfOQYYqh8XLXzCcaJLxGsSLlrnz0b508pacbLd5S4ravId4yecetWCe9tst1dsk1eMAYD7qTjQLZljOPhGivOe57fA6IS5SBbqN/arvRzafCoBmGkB1M76encM2znzViMiSr6uNBU3vSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497466; c=relaxed/simple;
	bh=tapJulvq9sZNzCtmbZgAjkSubCFsjmsf/ax+SbMxIuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLHDg+f5KJ5NJORPZLmBta1Ye5hnR0GkoIQn4qgYHVgNw2WEfP/63wWAELp6fEeDwG17qxkVGkNqIycsfq5ENZ08KEt/zTEcQv+Xf+5Llvvjm7/6Ugs+4fNxGOqeBpH6oLOTQ0NFn23ZH1tTV+IGr5uwFiJUzj5vR+UZx/rmf+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryoOVDNA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryoOVDNA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so117566165e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497462; x=1781102262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2r42H6aMK4b6UNRgIksoOLm8aN27wEuwsly03FlTjcQ=;
        b=ryoOVDNAYXL0jB59+hntfvuLGKACc7D8/gI0xdAv88FDydMIabb6tg1cSJBD3nmMKh
         vnNyVwX347Ygx8dAh9rjBFtFtAT/rRYJkEHlfMb00cIlKcFRT1w1N82WUARQFnhyL9NK
         Tb9DRGtb3Fl3aTGDhTr7FUj7IFX+os63FuehZGXDyeQAx0F2gmFyn1NRBYTAMOtNkpEk
         iJ2UHP4bnA/72WIDEhQHScXb6dS8liqnTCLztDtPKy4xZNrloHk2sq3FmVrKHL9OcnWn
         loSYvEEYMyVl44iRC+BBOniCSUR28aBkYlUkXn/ci6dFmoxL63PB38IH+W5unJEHO6q3
         mRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497462; x=1781102262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2r42H6aMK4b6UNRgIksoOLm8aN27wEuwsly03FlTjcQ=;
        b=rc/6yxxhJNgNpxEabct3d3O0QHVdT6JnrLXIGCk02C2Q9v4z0JpimiQkolDfEWn1qV
         9Hwn5RFACg9kDl1zUQm8XD50xSApRtB4j812Nl0L1YAXE1cdqe1HDIBSE/U+psjS9JrA
         jLojhD48N+Hzs6axRgGKqEdoMXNwNcfWWHAA6Rv5Bi+8SdMbur8k0n+RfWeDSb6IeD98
         ADeHrahqt9I1RZGsORndRBWN33NZhhqiCv5GMn9gIdeLYT2RQlGHoOSSxo/GUNWIrnJR
         sefZbCLyZ/Z+g9lIY46OsJUqAbp4ah6S1NG4PE7FDT+ccMFLW1Y2SnFiluE4oM4kfwEb
         QC9g==
X-Forwarded-Encrypted: i=1; AFNElJ+CtCnOkd/jDTzX11gDBUCqFcnYa+1V9vrbDfxfSd6k9ZXrQvmFVZBKbN6z/CF/KjQlRRJdcdk9el0B@vger.kernel.org
X-Gm-Message-State: AOJu0YxeU8/lWHK5i4o/Romocseh3ZXYkYdD2ru30/b3dklxlrYuG8Cx
	2Wj4hb7cuyTJ9dBTZaAmvHBzZlIWQQVpQxX9Int6TXOrozQ1enPHG/Tl
X-Gm-Gg: Acq92OHN4gVTeifOKxVV0QY1IkOT1bsKCjir7kq/2bY9A1m9lTEzgCTyM5szHx9yYBY
	+iu9hTlZNDxxSAxfHiTAgv9PXclVwltFE5semofhi/x16kOwJuDCGhgYtDw2OKJ2eSZkGTBsh0Y
	KpWskchKgujtpPCV47hiFDP7H45PetP6rrsb+WF4i3Xn3Kg2OpdcHoo52doHMtfG1gy7HnChMYt
	VKbUbA5ieCxg9YftgSKjEJ/MR2L64MF45KrmUhKQn0ZiggU/s/0D5kW/Tw45ladgQ4VvGOh10yF
	LzJIKEUOuW6tCDHNVS0vUKxKjt2fzb69PWqlX9NyWEjAAgMXJgh9LEoUe2Qn8ZOHCQkyvvCAxLv
	9F/BEpfjfucNivjTiXAi5fRXguL0XGwnJUNCkEktwkQ471/Bl+8xfGjSyMec8/XPHIvLv56l3Nr
	R0YqufogcRlnNIz6mf5SJIDK7GfEI6Pq68gEms2Sm+n1lYUNi7BORfdNWIWor3PeK+USAH11DV6
	unFaOva09CT+msP8dAWEQ88XG0STQJNhnB/nSsX9EY4oJcz
X-Received: by 2002:a05:600c:c163:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-490b5fe9575mr65008075e9.21.1780497461900;
        Wed, 03 Jun 2026 07:37:41 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:41 -0700 (PDT)
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
Subject: [PATCH v3 14/14] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Wed,  3 Jun 2026 16:37:21 +0200
Message-ID: <aa740b2d684362627b46d35912c979c01f8c2c36.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
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

