Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF36481FA6
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497455; cv=none; b=fE6fXpKdxBORygQ4jYrYFGwDh+DRyNQUMWQnVEf9sE2u+ts8xlVwck2ruRdTClU94zIgt67kRXSh3l8KWh9IJq76GO985W8G7HhYRCYp6Ziqn3jGt17mdjL15plM5NPcuafrefQuk1D19CNElFNTV0AwR1o6WfS0PN0w499s9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497455; c=relaxed/simple;
	bh=0YYS7jkrYUXTiFsQHyeEAo9TKyc4891j36hAX5xj8fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sm4LzlzIgSqkwjfJObzFeTJIBZYZZDh0XOKtP47sDNNJQvu2/sc/jsh6pWiVjZ+vyvMJLYSx4jzFKXNzSEsEW5RLF4tfXeMy/93TrgL8P85Oim0uzhFngk/yBcqzvf9y2UeWHkFk2ZzFHFmFChGLgTexC0I9uA6ar+FqEgmoWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIN/vnfH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIN/vnfH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490a765d410so42653865e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497452; x=1781102252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfUZSTS0CZscO6d5l/TdgGte3dejtKMX2oAoiuKxV7U=;
        b=kIN/vnfHNGN6elqt+f21p3a/EDCBGIGqEiUv0L0QslwxmO6KZ05Nlh2CRdw4pyyPD5
         QEEnwHrrJpv5TRgPMOY9FyCawUfJWVWebJSMZ016IrrMHX0fxcSH3rEEHDl8vhCQH/UQ
         L+Ve1TTbD6xkd9U9cbXZWiWOA+21/IYVhYexIt9WE0idYLHrgmQZ1NxPReVu3WDQ9DCZ
         wJkEsmKUEE/WmRHKuLE7/ZWm4ysCKQ1gb3tA3Ssqhk3dNeA4AvZj/ngWykAz9thgpnui
         RDmBLbOAeH/W5b1jH3IKqWJdH1im4bN5fpns+0sOir4zWs166KxaEtExmgUSiGRjxU9g
         lFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497452; x=1781102252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SfUZSTS0CZscO6d5l/TdgGte3dejtKMX2oAoiuKxV7U=;
        b=faO65ZhdQnF098baMmCy3EvNAMs8+CW71AIXg+ObcfZZ9aj+txjv2ObfAIfAQcLtlI
         D/L8pMP9lCWOOR++Y6FJmR5fpjDwVy1VddKTwDKb+Hw6Zwa3UoumhnWxOXXThvPjSlzS
         skjezNgG6CwkpC5IHxywq6+qNG9OGYvM0pPOvGhCxplfSOm5wEcrd+ZCPjWuSUzgjR2E
         TCj/OTNkC7Jrz7F4hmqwx3vF8mj6oK3ezXSd7sonTIuhU46ImdrTNYLyiHvp1oKrDdii
         0LJ/vXgdtP2G54X9AJtyLu0XQFUmcy6JxYzurUJxe8RXazBzeADBDxhX8VdR3NmaJeNG
         mE/g==
X-Forwarded-Encrypted: i=1; AFNElJ/Ku1noKIO5dTnirV6oOOrLnbcDNvvNbpREZk2Rm/whyGul402XQUDmTXIzpsX5Mq1WbssqZcUCq6DJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzuNd6RXSy5fSy75hMKBOGwrodqoqNfw5LIdDg2o8CqAn7TLtl/
	mnKGIkJ52KWSjRHiRj9zEgmdgewxu0+886M3PhZ7RxAQ4Pj7qrfy36Y8
X-Gm-Gg: Acq92OFcmdCatdqZ++VcM4HhtTdsUMR0Y7ANn6762nEBvXpjjVyRp2pNpAxBEMw5wSs
	1Y/QkXmKcA2bxvVSZydJKpH/FTExKZdMHplrqkjEsTur1ebQwAMDtcasBVQvk68U6Vfr9799wYX
	+s2FVSOZucP8qNHv8ecs/Qyqq/YDzsHPd1AO3P8NP+U+Gl++LIyB+XwopM3zh5chZVpGnnlpvCy
	oCcsW4PWEr6Jei9XCkvESgXFatvnzJOKeRgnOWi6U+VPFMMQWW/XQ36piVQad0IzP6Uw02e6Q2P
	V9NhlytQ7fqqeJ8UK3wWd3T1jyaPBsu8djv6ZW80XmDWkpAsGogAxce2a6z7DwnDlEIvqAAgtuD
	SgshCGaZSFDOXfAstl7YD6Eqr5T9h8xuCU575eqHxZMnvTZp8UFBc8A2eA+kGFjdHF0eWFbCkib
	qBcOKclEPJLrp1asohX2R0QYLxjkB+kat741MUMFie+YAU5FPhGlkRXmTfplxp3mg2ezNzCIVo7
	WCmnoDg6Ieur77xmeki9hqDs35q2KbLs6NSLiKSwUJiJKBf3mStO2C7zOQ=
X-Received: by 2002:a05:600c:5288:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490b5ed01damr61804125e9.28.1780497451711;
        Wed, 03 Jun 2026 07:37:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:31 -0700 (PDT)
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
Subject: [PATCH v3 05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Wed,  3 Jun 2026 16:37:12 +0200
Message-ID: <52dc9b387d337c646718378306e76a1bb70616e2.1780497188.git.stefano.r@variscite.com>
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

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index b15ca44b9a92..9500c9bf0f42 100644
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

