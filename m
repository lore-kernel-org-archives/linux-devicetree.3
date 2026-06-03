Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B51A477E39
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488008; cv=none; b=BG7NgB/jzRjTUWztqkn1pSRdnh/MjkY/Eh04gqlVUL7Bh9LFAifQSjrgPHhuawO5q4Yg7GSjTbgZJyBRjYpkZPma+jUO9aELYfKbdtT65aqXGBw1NoSwJSSJPDMW3KvZ3Zrt4p5UHszgMGmBFPn0nP3qaKlWUL0AbDZboNOetXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488008; c=relaxed/simple;
	bh=IZ7OVFDg1SPJZmlT+8XPchCRyC9o8HHYM0iwe53Dulo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PE3aX/Naaf0kJ+Ur7gTe5+UB3uy4DKlw5vdpqM3RUGT1Yld7IebPTgWj+dxE7bjSPNrhIYns65hJLgVjwqFIDNHxrhg6ozDowEZLb1kH8h6sjaM9PHpoSfUE364aY9EuNNugAPqPCkJEMUfAZgb6tkcQJnWajZcvuC6wUPsHm00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZb6n45C; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZb6n45C"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4908b92904fso73057435e9.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488006; x=1781092806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq/j8G3NT+tBoF6HRRNJiKlOu2gP9zRAiXpNDLBe0+E=;
        b=XZb6n45CYZ8Yl8WiB/xFgS5fKK9E4apWpR+P35z7P25UV0wGsXRPsce0a/wZSO95HZ
         VzTH/knXI/Qmf6Yv/wG5SMh+hRZNNQaUAuvLbm4487FqXfzka26EaNwppuwFupi86qxU
         8onA+G5elw/ZH3VVDvfbLrtaF2XIRqCPXHOGUDvwwseTFQZF1CK+MOCwdoxSG8KLrMfF
         BxTfEua+4MGd+WPTVeEsh3rOom7+7OtlFNKvT+C88kpdUxcztqGjqIT7kuQkv5nTpJFQ
         PK8BsJ2lRUEQ7xwBghkb+Xe2SYdz75DEEHrFhtft5KNFIYKPU86LejWnJ3HHaA455sLr
         b1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488006; x=1781092806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cq/j8G3NT+tBoF6HRRNJiKlOu2gP9zRAiXpNDLBe0+E=;
        b=VpQ5mJTWXumKkelluEBwl7S6ZWEBhOmzK+VoX+8SbGmFGS0ZJjSOLR/D5rYAYFm4FW
         Pz2cXhBEOX1ayr4ogxUt/TNYczAppeQr9wSzXM3I9aO5KcBtVeGHBL0RAfdu8SdV1sK9
         fRL9LcvW6N5lYj6FGT+xhFqRBKBwdbV4/FCx6+AmlPm4DqOLgIYQkuRqrTwqpPfcm//s
         GKbfJ9gFR88Qda6rkrqUGd2no+Q0zLYSTOT5bFfi62vFlrgJT2oRfAsGGtRO9hN4p/AJ
         y2HsdZEVhIvr54PevwTTX74wxhFsQK0IOO77jz72ExKPqJLUBr8kqgorZUaAbtDmAqS2
         TXrA==
X-Forwarded-Encrypted: i=1; AFNElJ+2rKh8P9niONMFjBhYNh5Q/wUfyn1jFGXb6+IQmPWbSCqQH95+d1h4LNydbSpwmIZMg03WzDqHDNYs@vger.kernel.org
X-Gm-Message-State: AOJu0YyD657Wf0r9rXZne0DZetD8eKM9MJfjNA3JzAa3SIsCaereyIti
	H68m79Guag16pXydR93BLL80YiOySkaIxvCGLtrVl6Lm1WoH8t5sYd6M
X-Gm-Gg: Acq92OGXlat9/LhvtjInRZtlEsT+UdlbUg+6Vf2LUKaU035ir0hIIHaqF8acahEDlrk
	9GutrPhv4CKPN5qc/fzyP+2cSx0Mvw/ijaz5D8d1Pea1GdjPD1sCF6rm9YetmZH1IP/e3Rm5CmI
	FdE+FO7dQSMZx9EKjSm04GnqL3rk5Gp7SNKiw7pYwTS7RLuohacf5wiPltkw6zugk0WGn6yYCEl
	xfgQmGF/6/sQwC7dXU9kKwtnRSDg4t4/jZDcbsO1av/0CMZfKt92NZO6uaTimwrO2BCftTbqT9S
	oSqtqE43I4btIoWpf6Yyd04m9asFwsKraepCo8RbmSdQSxlbIFVDu0yulCpFzlS3Z/xzFuAGoAo
	jLI2LjX6TpNvXn8AYP73dou9V/UEcPS+jPkQraUBBlE8OFb4y/GMy4oOg3PEMxArx3jB3VXUeiD
	ZHLhZXwzTPDs7oZRi6Zw10R6dHeCR06jDJM3UGGX3z9ELqtFpHcTW7N69Xc0C3HqA0jP6IqY4QY
	3SFFl6d/M6sN5WLuUq3DbUGgA4eYXh5lOfdFM/fYBKJ/je3
X-Received: by 2002:a05:600c:4e87:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-490b5ecfe9amr53048185e9.11.1780488005304;
        Wed, 03 Jun 2026 05:00:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:05 -0700 (PDT)
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
Subject: [PATCH v1 05/12] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Wed,  3 Jun 2026 13:55:43 +0200
Message-ID: <0f72ccc0fa5d7a40539fc25a07bfc57f4308f5a9.1780487415.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 8f8c76993fb5..3dda28be92f8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3

