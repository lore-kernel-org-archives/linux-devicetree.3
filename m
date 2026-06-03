Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5E481256
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497454; cv=none; b=Th8cmO+hp5dd3VIp7IhbPLK4VUEuoS5JoJRxyVy6V1NK1e+3rPmZCIdYL7AiWI0WzBUaua3gfghcWipT18r/i+Qz2zSftbF4yIs9flw+K2CP8NoJOkn8Gq461oz5SvfatKnv2f6huNoAxun16di3MW7eG0W5tmeWmt9IRzhcCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497454; c=relaxed/simple;
	bh=T43hXh82sAKDwWzRE2fzjebOhdXYM6MalzxyP6yv00I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwI2jnyjS5GaIfzPv/jQRneOKMlDDwWI2hZEVpSGa/JdvADbNs45R2binCB45gotV+6C3rpTO86Aa3atmdlNYqYj3OiPSZaX1jWCnMtU8mcIZyQj2Evh1yFHxM3dvwQVr/wfWGIHuyqa+uC0NI4jdMzpHcutE6neaPcRRrQNqUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dddJ3iX/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dddJ3iX/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so18233255e9.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497450; x=1781102250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6HeY09Hs/yA1VsCb12QfnOsD8A+OUTuSPAKRpX1XwI=;
        b=dddJ3iX/6wo8s28Pq5ejfBKSOwbiQvLl9CZjloymR0wfSo9pnkJrKa0uVH+RfD/Vpk
         l6ONkyfGKYrUk8/nWMm1v92la2xKDZqXxzhlaLG+4O/wiBd1Jm+biKz6iZtDRb2bLeqW
         Olm4ZcMn/knnasdyWECW4F/agIJhWTY0FkYJo+nuq3m8SAA6n1DB6M6E+35ZL/bjyttX
         OWDSu7XQeJPhdWDpneWBEkH6N0Udb74hFtJcO/QtKHoQ4/Q/HpgSXcQFypvoPA3XDrDV
         POXQOSXMOxIm9gVnNaKUuV2kWQ44ayKRFiDq1JEdMgr6E9oxiVDb3csu8WZibxsSqOQM
         4nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497450; x=1781102250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I6HeY09Hs/yA1VsCb12QfnOsD8A+OUTuSPAKRpX1XwI=;
        b=svyoPQ9OghA1VugJlbLKJ65vwVBdIlHHMUqFbI9FuSSn1Z6PR/yAlrM9azWsYP4rmU
         1f+aHUens2kupQcVr5IKko5WLbyG1Usrj9fLUqu58ZEXV0YfZOZwrJbOYTFOJh4dJsmU
         HMLwq+W+os7/r09HIemcF63EUZjpMGlTB4P9/VFajNa2JL7R7OAOvQlNJ7lcuhsriMxA
         U4Hh0iF3VCxFUmxlwMhf35s7zs8oFmWCHIpNadgDsLQXNHEXpL/yt7t3ROT5LKGnSBse
         tNvaq9DRTi2Ilz8LBWOkUDtjfWMOwEczsDe9/T5eDaHzxGxEW+7dpRbmQlBJ4nwxcClB
         ww8A==
X-Forwarded-Encrypted: i=1; AFNElJ9ZzxjWhul/ZkkJy4U03syGbKXaWtWb2SIvawwrvY6mStrqJA+fwgPG89BXw0+ZAYjVXn71gLx19pmQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRT+Tzn8m2z5fOl8m3jSBTe3mL2KrBhQaMX9gcZSe7he7FttZO
	So0Y+kNqs1w1pTRZOrLa+kdaZQn7JPir11VTubgkrPwByjeCo8jLfX5b
X-Gm-Gg: Acq92OFaxxAqnNBDT+Ix+dkpkRoGI3PySrqIjcle8z5RGv7SKLNMIvpXrBzHh9VbxdP
	m2yCDpu2l2ijumTlgmyrc3Nc4RZIs6heHkZV+zhHNDcpETCEbTwfJVI864tSVIcJUG5k7Rj4AQt
	6M9PjJ+uijAWNXnvlBpZfIFM/P8ntYSohAIp9QkGZOdzk++NHrxsWQerGhqVZgcJhmZ2SREo9T7
	Y7qkRHqPWA9lEOXvOML95H3Or592rntpX+8Sb0S7QM4pqpYa4mwZIj5fXydqCymMcOB4MTbdQ8R
	7aiIIJTOHmpDATMO3nTYEvntg5cicONH1PLbBqnLvHdGzIUu1aFPb+uvgBWJip6uAFmFers+BFZ
	OEANfxBqR44rCc5/Oy7F93469tD2k9ht0uPwu0iEzSd3OtK9qgB3RcczISlHITK4PeHGOoAzREO
	fyOMA5fCbRckzRzTZJNXwYSnfhXBCADPNjqbOxILyrWNIlbNcRIJjJzu4pkZxG2wPTXsyLDOapZ
	8i/4FMtvHAHaZrDoMov5Hgd+x1HdJZBn1Jr4vPWPQ2WuN/gu3VnAjWCJsc=
X-Received: by 2002:a05:600d:4452:20b0:490:b58a:dcbf with SMTP id 5b1f17b1804b1-490b5e763a4mr43825555e9.27.1780497449675;
        Wed, 03 Jun 2026 07:37:29 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:29 -0700 (PDT)
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
Subject: [PATCH v3 03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 16:37:10 +0200
Message-ID: <2e7ff00b61aaa855aaa2c6d9ad6e98eb673bacf5.1780497188.git.stefano.r@variscite.com>
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

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

