Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F398D4302F6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330510; cv=none; b=WsB2CA2iowb12nNnWQRqZHLFMX+aur1XbcamTyQjTFSc2evXNC2VQ9jBS43J0CZA+FM4ld47jB9ot1Vs9QT5rwEtslnGLScoFdfdDGUhJLmcgMsSws7ScbK/WAncDUeyvmyKtFEhLaTO8E7Wqcs219p/HURmd0ZoAVXYg06KWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330510; c=relaxed/simple;
	bh=djI+rGgHxeyFLVfHf/xW2MhVP8M5sDcU2LY5zoiSlp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wss5AlPIH/Tcl7sclIPGMZHUxUGC+R6+3ca0zuy1Nk4H+/r8l0WAE/h8Srv2fBV8/V/bH/KCXkOGkZHvI+TX4VM/GpCCnfbAjtu8RwsFSMXs6lSc8InYawRPdUhczaouLFA3SUZbwOD2dMav8vrI/TLMcCMbCcIPd8driMI+4/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtAKC8Me; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtAKC8Me"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so20856485e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330504; x=1783935304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvZ9w1IWzzy3Hwyn8ZlFCJ5TENdJ/Z16HfTQd+G5DTg=;
        b=jtAKC8MeYduFtA0nGOw+mOHgwN944z/hY10/R2qdB3C6d7LiCg4ZTcf+Sk2b4C1faO
         3jvl5ihzdTvcUvtLZJwYVHD5tXXA1OwaK4n5bLs/bgxXE0Q7uZErkmgUIJkUozInYqwB
         weD0K4HXVk5PMBgYrpQKkU0muGeBYzfVNNICMNcOcVkPtq/xtRGNTLjypTIp9wEeAgui
         sRO++RIX2UALnw9SyB/hVsHPxh/UIxWW4XxzogiKz7Nol117lE0uH7D3GkE5tUijru0q
         KDNa7DmhgzwEC/evgykYkBBdMVgdjRoKDZYZCPlOKf9Fzg0chNjJwixl40ZPmDIFHz+j
         hZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330504; x=1783935304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZvZ9w1IWzzy3Hwyn8ZlFCJ5TENdJ/Z16HfTQd+G5DTg=;
        b=cpcrfuXaPVCuZNX8trG++3DDzQJkY9Zbm0wDsOYdjuw5feP69VvAUoAzvxvMl9SKbn
         rBlWk56Flw/4xjSqFXrRt4L14cEW4h4FQodMmPdv2ECA3R+6AwlAHcOiGgC6Z0ie/szL
         32mdojwMDKhZHP60T31SG0nqP7Xed5/J8rxLJ/kQKkSjIX+RlLzrSfQU/nUw8S8AAPqd
         s8veFXlDtKeFYgOvLbDVdYPHoizj2g8ow57ALLwsW6MoUWTyAAHpCcMIhw1K65YQsoXt
         SYci1crS8MjcKuyss+rqsETiwfv/2L/yikCGniOSeSTmsRAvjsEdCaAzzC5speRsFCHI
         ZMqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rob6Js/YMX+oi1voy2EWcYUa00ag57E0Yw1C+U8kDRK8RFWbvgvEZMcR0IhbmqVSeVsC417CMPOejma@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlb9UKqT64alAXY2Zb5efY1zoMuO8xe2FKWAdsQRxk5YV/cIJY
	9o2qSnnIvz/Xmh8XSd77N9TdGmwCOVVf0LqmKDqOMqMThp4ByHpeR4gE
X-Gm-Gg: AfdE7cmoVcuP7HP17QQjz811w4R44ArzhbfEFLDANVzonVpYV8OHvBRJpZfnYugz+db
	plpSJVUPzRKO2Mr2e+AzC6+QpxunI0J3KZd3t+7w6/722WYXH+Etx+aqxSLRu117WO/DzjQM1Ml
	IBRehrhNkHKbtwj6FiYyu38XCPcDPhAKoodHxJrLBEHGDPARBUbHodPXZFXwOIchHOUbbHYOvGK
	XOpAHGrX0r2jytfDArOWT7+N0NXS0DLG6BPpU3eoXDPyIS+/wfbGzE3fgsUesELij2BKGwpLs8e
	9iAoF+97bZLG6CNu5LEotRhhKM4fbUNs+mXdQgesvYOitj6V9ZqFyVqJAAcplPlB5m24+1Gmep4
	L+IKRxJwBffKfASs2BKN5AII7idlrmKVBXmuXf+DwpjQPb4DtgKOcZUnx4HT8hTTuL9LZvDiqyq
	BTbTG6TRceBet3SVRnC161gsgU1FP+v41yPRqWvlu77oS3s6BWePneC9lHkEjQfQfvV5Xld33dR
	kAqOi8iab4lMB7UutcCe1mRYQ==
X-Received: by 2002:a05:600c:4e8a:b0:493:a960:a0bf with SMTP id 5b1f17b1804b1-493d11f3296mr116847075e9.21.1783330503423;
        Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 11/15] arm64: dts: imx8mn-var-som-symphony: Enable I2C4
Date: Mon,  6 Jul 2026 11:34:41 +0200
Message-ID: <94b2e50c4f11be384161eb8fdfc82a5c1d7ebc4c.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mn-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 7d016ed5e911..4898018f030c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -262,6 +272,20 @@ MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MN_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3

