Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914C481248
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492394; cv=none; b=Y8vlmQlmxdQTz8f0vtddOj660Btf9s8O3H0emacn7BT/siPECtN4HcNI+RTDCMNIxBKlAV5mDeMu9Y/Oj2lFsdjiMs9A9GaEplS9bdc7iLe7WjihkWb8PrJwj+OktsP4nEnxYhxSaxfktmwu7QWzPigpC7kVpjNfXPnBZIxKQSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492394; c=relaxed/simple;
	bh=6OM3yxzhPjBt16s7w15QUwvhrHSDAam1R5GqhU8R45M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMI6zbPHNKFbb3YYpimR9ceOPRbTbrMlZn0Scaq7RpnAj3eNWXH0OspoT3RKd9iIoXbPhW41zoROFS0bDSBAFB5ROGUvHGO/XE52Vk8sWTwuVI5HslhPTmECwnU7bjD+KtOWFSuxLtbCGD4q/a8URTREJJuk4aPQAbCL/cp9v/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tjm6ZYbm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tjm6ZYbm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46015dc517aso2509702f8f.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492386; x=1781097186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgwmeHX1hbkUcZ0QBlqPTtZl5v1WvSKOppfTm3dzSus=;
        b=Tjm6ZYbmnfArrReaqApQkT7dTubASlqKy5BBsvo7oBrqnctE92oaqQaSMhlPRlVWXR
         W2RzUBzmR8dgjVlRS52efCMftIyP2qKgtE5696czDj2cKNXtskXc0d8Vd9hY+QWVQ6kW
         L9lrDGL00cS2YQ37lzRdjtFXOTzqcovBDn4BDkX4l9yUTOUwMa/r+Z/vI9YhE7mMGpBI
         wuPDTf56YNcmURzfSjqJ3yCMh+R4wEOcITxNGk5WMJlp34tIZOIByRPj88RPQV2YgRfx
         2Fq4UVKTaZ2ESILOX8mo+n9pQ5dC3UYI/MLrCuw5pgTUI6Gv0CfRCt5D0+TJrNy4dBb8
         iLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492386; x=1781097186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YgwmeHX1hbkUcZ0QBlqPTtZl5v1WvSKOppfTm3dzSus=;
        b=QHtPk66C4lpqBB1p/lsSdMVPnXLyDemXQ/jessYbUB/eMo898H/J+uAloe/98kRQNx
         4nQpeRK3CT1KY9Cn5RqEeUC2lKfEd9jBnf1SoDwBGS7an/SoW+NhgcM0vYQ4JE02ekWz
         mDoINHQj6Cf5RtCSkKeqpXrfvmMHu5IxfYqzwZi6ODqevTypcbgxVL925/UxkpdoJvVg
         ZnI2AT5C5IhuGUEJZIuZ9YXzwmVRPaOTlwS/4C5tcniVxO0KckSPsI+rFVAKJ0MsH5w6
         ypt68DHduj+uZkX+TLlNYCticOBjebylPJPnSqanOUT/Xq1oA0UDLUddTXyIUpwW61se
         TQEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+B8ybgsJteQWw9rHp+HeSP6hfY9K1vbicRHFwMb4W+s0KX04P3M8snsmDcd4Tw4txwpigcU8jY49vc@vger.kernel.org
X-Gm-Message-State: AOJu0YxAankSPVlGo2WG2tZHuZyQ+7CME7fnOCnpDZq1WnkYoN7W62UB
	9zUYbihIpaXnudOZKJ7vCHerU1Z/PKsI80Vm8YH6OkDDU1M7wLyRIYVz
X-Gm-Gg: Acq92OFAlFbr8qbNAL9YpxfhEjzzGFnDKhxZr29/IKjlVPTI06DsUpgYRxbhzBxBD/N
	5k6/k/V4nZl8Dx6C2xW4niKR8FeH4dkEadzMyJFpvfuGELC6FEBcSjXT0hllYnY0KlZM7heKYf6
	s4GuL2h6FbymnXHSch9cWlcbPYev7oKCxVa0UdoPwUWRLDUu6ku/RnJi3bzDpmhTsEpB98SmYmi
	XX6YTwdaWja/GXbdgjXQFE267iF/S8qBSKkqLiGqgBp028xOvLYspCWDHQAuTaXkkCUregjJQ8e
	vcvI3i5zelLFQt89AnhE7Btx/zpeXmcSAsWq9b5R4KRXbQJHS5OSpeElXkiWbLja//4b5FEny0y
	jcd8EFHLii+Y5VNUr/Tl7FymeWj9Ghb6EWIGVo1PR0HG0ggJuxPuIsOX8atMx+VisgJ7PLpkCDQ
	P7b1bGbuCMLjF/J7SXAA6V4IDcIwDqMaZ2ksqso8lO2Xs8zoLX+9TlWWKTAYA3nnxDCaq8M4kKu
	f1LlSZbpkLeMVxOg0k3Gvy2FWX0tfyTO2XSoeF0TR7jp28D
X-Received: by 2002:a05:600c:1551:b0:490:9d1b:2022 with SMTP id 5b1f17b1804b1-490b5e805aemr59644945e9.13.1780492385546;
        Wed, 03 Jun 2026 06:13:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:05 -0700 (PDT)
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
Subject: [PATCH v2 11/12] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Wed,  3 Jun 2026 15:12:49 +0200
Message-ID: <ecdc707f750339257a758a09b61f5382d0bde471.1780492180.git.stefano.r@variscite.com>
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

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 91d24110a283..912d064a4ce1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -246,6 +246,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -398,6 +404,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3

