Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D33C3BF1
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913385; cv=none; b=G4ZiNwMpLGymRho7dMS/We0pDs9CEsfx3pB6Z8Dlt8rPAaXBQ6DRI1b3/BmR/zwmLu12cQ2y+SHnf19Wcf80R5hXVHmF/eXWcGkGQAxd7BL0lQt8b2HIJCk+N+OynFeiKBLYsrbbz00wZlUPBoE65OFcfKclfOxME9AqK7V020Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913385; c=relaxed/simple;
	bh=gAIPVBqy5x7vTMwPX6mzPu2b0xJQ5t5vdUnOfadu2xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuBzYp1l3qN68kujbIzOUu6OwJpSYCGzf8WKqLy1StXK/kBTb7gQoLGBN8GHLYYPXzwSXgbvNNE5HjkVnXp0q2JBlMoyBiG11kJp/wsEMbIWV1z2oiTeMOWgoYPs/TP1dDr2uh/IeNaNJ0nCAeB+nHMI9IuwbCn45wV5cCAW278=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPoWWuNf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPoWWuNf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so3098360f8f.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913382; x=1781518182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyc6FtIc4DT7UgqHVYAGSMmfSKaHs4aR3RARI0nuwjM=;
        b=KPoWWuNfdjtxMHhyPbvojlGc17As3w8yAdYXPfjlLh4A8G/e5pbnjpJF+HQDy8X/8L
         mhoakbhbrh5Z8gWF2yhN8n2VoB1rxPlu1aWztYzOSCGRGcHkQ8UmUQMeqRzS8i4t3W+G
         32/kQAyxR97482wMLMhTsuJaULZW/F1u3yk4gj9TLCwHAHDCdT9IebwiPI16SEOcYgPh
         aKxfGU62Ym7M9p/ystJ/JFiBH8/szN5ODowy1JABrD6SHioUcPjFbyZF2PiiABwxVp2h
         8rFlzjv7UbJwguyqAH/A9KXT1pinOzsbs1vRPEcqpPOTKuSwhZ5IbP4Jf0/4G1HahQDe
         MgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913382; x=1781518182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fyc6FtIc4DT7UgqHVYAGSMmfSKaHs4aR3RARI0nuwjM=;
        b=SIdzpWxyZ9PWYlYcwiaZPL0dFE6AWVHiBAOOnStNViLfS2G/YzX71uWuHnNrppMhTn
         hMOzx5VnsXmLmoo4T2UHBXBy8UWC1FH9HudEnwEtuFqRZ3GoxhLJyTiOQrq0QTa71YUg
         rmvnr5/GMFdqNOPIh2VbnXskU2gRr1hU+M4bZa9X2/TVI8yHg5s99Y4xabTjkowKDz5k
         9wuDf0m46DC3dop7SwqmHs18ks5pLHHneWm3UOmDxFNGRUjjtV+pl/fTDQT+ZtdJIwPZ
         P/jkwCW/p7b5oC7oH97frWN+e7c8CCBDjtk9eX5KlXgpC8aASkFfA1VQhduAsc5lEv/x
         Zzjg==
X-Forwarded-Encrypted: i=1; AFNElJ9H8OFQO2aWSqoZg8/7EOLg1gjYoQnkq3OKbbB9KchMdogmUzonzW3P2MzTXcFBt5nCqaWchHRq5iu7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7yEWvT+D5t+9MiuroaIuNjmiJhe+8TVe6RnPNW8oderSskAON
	pbeamkELV6n2DOSC+FFgXwByH7NC4/bafvQJLLrodZTcGpNldcp4ARKK
X-Gm-Gg: Acq92OH0EUVKWAWWjSqqzRoShbWCopN0xYB480b9r/JQNhJ7KafYDtW3bBjEQvQ+VVT
	b9I1UXu+zvDjN/jGvAEC6D4ZCQd/WQhcEOOkIR9lAaD7Hm8ritENAideQwbQOU/4G89rMjY8uut
	+7rvAEsqlS2ujrISgNDGqBzJbVEM61C02MNK3WL+VVcioFhEMPVOYkhta6qnqhGc4UuhOnFyWZ3
	VUVfj2OjDIg+0rV+ry2fXS0YOYSTa57+zq8U9JiljSmYKHkBc4hvP9+620PSWMf3IGq3IATK4GE
	oMECAzwqXufG5jB6G4EDJmqg7LLl9uZx8J33hCxxIcS6G+SNx6xMBjDCviRMtiOXbu/qcUN2kbw
	4j4CCAIBmHUZr31MttCTJ1GQblQF3o/MfmCQowZ21FTnPEDHN/faaLjIbOlgIzC+iXcKUqml3Yf
	0hqik9pJNIfsZueK1fiemnhE8hQrdpe4iwuQKNap5z3Sl0axlfwJwPfmM0+h/bfmW5A5FppTkva
	tBHWYAy2vW/nvLJmbqDDWLp/CKcLzHyo5Y9hqapapsvpses
X-Received: by 2002:a5d:4285:0:b0:43f:e721:76b8 with SMTP id ffacd0b85a97d-46030624015mr16808494f8f.37.1780913382209;
        Mon, 08 Jun 2026 03:09:42 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:41 -0700 (PDT)
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
Subject: [PATCH v4 05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Mon,  8 Jun 2026 12:09:23 +0200
Message-ID: <dded56bcf066056f56435e65ddf9d200b0d7046b.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7b839efdbcbc..34a956c98635 100644
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

