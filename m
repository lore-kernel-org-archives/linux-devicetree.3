Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F690481232
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492386; cv=none; b=MXQITN0BnjAQypRsxlb1bGoZeiiz7pd+cAubTpq1/UPEH34c3FgsYt9b8Q5tGfxINS+FRhZSQoidciV8GHpxFtW4Icw2BwrJuLFI0AiJXWUhHBzx8OkwV981QNRKbwVjiAeg3YgoZ4Sir1Mp4ut4eR4CvS4qFKtLue8OLam4J5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492386; c=relaxed/simple;
	bh=brBknWTbJeFdLrLiJEDTIRXbjSKeg4crwnjhONTnli4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RP8xHVkOqt+iLHkdop89uv/c1FTkCglkbjXofyBVw/k4Xw/9frBJxKV13FER9s3Svj7JUYpTvBv/CIkNyqg4LptytEyo4l23P79m3zI76PO4pR88B1lwsAisWuKdymxzN0YXZOYRjURMQsWoYFlWnnVPcpc+Mj5fzwHK8vCKqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvQJRSOT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvQJRSOT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso3918765e9.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492379; x=1781097179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS8EXfD0I7q+hrNj9u5k8EGUHhOwOotqLP8CFPXgTJk=;
        b=DvQJRSOTvMhXs69+CdOgEgL+VJNl4fpsj49CYGsrxRaafUkhGw2zCzk8RiA04fcwTW
         g8pdZfWKSNZacxaoxaBOa/vpEClMHiy1iKnT9rCVDDMQ+M0qt/XVzBCPkC2AvjDtNTJX
         WJtJhXYNgBJGr/JjL+8m0HHrVRfCHVFOZBKf9z7RclohtNUV31PEp/cYPabjBg9D9OHC
         9aRPwdw++BUtEoqRmoyclCaItFSlCdK9KOcvo7FueYTPtbg25R3cJDBiZ59dzuwKnPgV
         HdGC5hWQcK9Cbm4Fk2NHOXVzufmL+LEmAWCLHlZ4ExzuH1QFIRnmUGgkL6HRVv5PSeh1
         WrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492379; x=1781097179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XS8EXfD0I7q+hrNj9u5k8EGUHhOwOotqLP8CFPXgTJk=;
        b=mlrZio9HBrPhjMWJHpDGBZi45Oh8SotPYWSnTY5icBjNpscwurUbMrBZ1jOyvp2VjW
         X4DeddemCSsRe6BiNnjZTT4uK8jWTxujvIKlQ9/c0uVs7XpU2FFmUfxXbiIPWMP9zEnx
         GHKdasfHSSMeLYarEbqCwJYcOXFB8jxEy9Y07VB6Nmb6y9CLFfeE4gjvakegSik1voBe
         J+wsqhEw//X3Xls+NWiU/ggXxm+i4trgjnTDpk/JynwLXT9Q9XJhzed2CefbwCvH/7OS
         WLvXTLpboMhakqJdiZ70VO5TxQm3SyqXvdbNJDWKt9aE78Wmke8zQtXZVFVIMcxL0fg+
         bsIw==
X-Forwarded-Encrypted: i=1; AFNElJ9it6Wb5/qwZUMeX0q2tVjTWrCin5+BDDB/wyfY0btYqnr6V0C7ajfnmM/7dOr/wPqaoZsOCYndgFLe@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqQ6OfrR07URzXnXPR3gTnDXFTSkRKTi0VRsZonuQ9iys8Y8V
	ca1oBHJrxTbmSbWeMSd1i8Y4gsE3Jp9yaGTigYSxv81SVJtnGIASO6M2
X-Gm-Gg: Acq92OGanffJfh2DDBBXspMawxtE8cOP/tztgt7pvIfOreMrEKQ+ZSeI30UO66Ou+Wp
	FTVXwQchSdnkj9xbsHU/UQsF97K6Bq1JIc3/BRJbIEbCKFgZBTCypuXWR6aQM9S8QOB5Hceq4Mw
	K0vM/iF133t3BZ87m/0KNIvLJeum1fjj/yKZSo8ZZt3xSfBlzjXHIf1gpel1SzMEhDJ7UdTCEsL
	3TnAzosqJOuqz9ko3pa3sysLYCJ7JuYvnO/OLItYCZIohjToa/xDcyOPtHN0TTa2+/vuvKWByV4
	tCXUeHfi9k3d2I8sCF3fmTchyzq1xH1KylvjaZUrVsqbczVAVB+dszM9OCHhE9Km+fC0zbGeIR3
	GBXIXPoPrI8FIAe6D3GW5si9Utj52VMgAKIwCxL9DCCQHQMkWUrX+/nRWduV4yQEl4KrJqV5+WU
	KQhipZntZrEisKcv0oMlfslTa2niqOxM2iqKiEGV1d5t03CiHggcoGohhJ+IcqQSI2aB1Cyib4d
	3EPmezjKjFYZXD01C60rZUOJYFPQZsc/lEj0hfaWbIfP7tu
X-Received: by 2002:a05:600c:468d:b0:488:7d01:f67b with SMTP id 5b1f17b1804b1-490b611af3bmr56074385e9.6.1780492378779;
        Wed, 03 Jun 2026 06:12:58 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:58 -0700 (PDT)
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
Subject: [PATCH v2 05/12] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Wed,  3 Jun 2026 15:12:43 +0200
Message-ID: <52dc9b387d337c646718378306e76a1bb70616e2.1780492180.git.stefano.r@variscite.com>
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

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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

