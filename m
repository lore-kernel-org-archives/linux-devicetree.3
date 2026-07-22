Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A3F470106
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719993; cv=none; b=pLkTyhBXvLiA78u3jiVpxvqjCzRr1TVvEfXhbiVtOki/KTk0EcmfEzySdZvTerh69dX6u4aFC7iWlraP7kUBemfwyGUyUQCKM311lQNdgDdYd2Q8aQIMxrrz5FOvR1FkQ1pHlscjxHm+9qlPXLLuoMbEXyx/67QCQeuy2A9J8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719993; c=relaxed/simple;
	bh=+k6dDmbnvintpiQShs8TSV923DT4bQAUmBhF7NoxLX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Du74rTCaII3sOJBa8OjPk2MJx9kNcLwhJ3z8T+GDtqH/+G/mSdmadTPCdFPVjxo24w1ggYCrNr+8yM3L6LTVFBWF28/WoiWQ3mVQKVJmD9yjqzTKqas3Mnr2EBC2DVLgBA7Diiz4HtrT73JkUGn0X1g1iI0Nq2vWmWyPBWUahYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvUwHjys; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvUwHjys"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956242332dso26090685e9.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784719989; x=1785324789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtM+fsCt4wxJcsndijBxF/F1yhByHuvUrkUU2HREy8Q=;
        b=mvUwHjysalpDKTNvyxjdNpoinj3PXehP0rgOu5a7zZOd3z3+cMWyNPnkRTDmhj9ptr
         Gxh205U8OGlUaxI8pXpAJKcVXAdy3iRbtSzd0Hkqql2lcHjIZWiJN8FJKEdIs7X4RhWf
         7AlScZQrdJq7lFa29LKXTHLsuz1tnkG19nTa/nb2ACGIzJLv35GBmm438rsL3Vfdebsi
         ezq37RXoCWIwbbJowzzvbWuGCsbcTUdjWUcHjHZgpjQ1rlbyE3yqO+TpeIcRqqcQ6pGz
         VLxIKnwyqMgXOPgGNtsaowy1k4g9slBdDyKXMNxP5sWBp7Y69XwCB3IgHuFqcEq+dKl1
         qsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719989; x=1785324789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtM+fsCt4wxJcsndijBxF/F1yhByHuvUrkUU2HREy8Q=;
        b=c+JNb2wKsHqfmLd5sOCNUbRloFg0lKAPMG+kL4JNwMpuEiUM8vtik728i2neAhGJGu
         BeqoUL3qgLm9ePOGwcH1O73VKBSGUN+iR7fw96835hY0FaoL12+a6pih6ZOOPtbUHk/p
         B1bGGfQmjQZnMtAVbKpNRI90YQmN5alA2eW32k0n7dEfUxsRaR96063Ixl7g0nrFPuwn
         wG3zeCAO79qZAETpotYvULM+pPhRLkAFxQHKNtkd8N6t/26IopG7rHlGAtNNaDXlcXEk
         eLGLiMD1wQSoWEHlvv6Jb5byaiWuXUMukMlT8QWoHXKUNOzoJF/KlPVlmd695PMZJTgd
         rcWw==
X-Forwarded-Encrypted: i=1; AHgh+RovHJIZo2oOwgsmRzr1QJgEokHgvRcW6cKz0f21MYMwKVJWUdAEhaNPTkVGJYEpfRNAvoHQ773lxs3p@vger.kernel.org
X-Gm-Message-State: AOJu0YwMoMo0N48E3wtgLNZQsZnRA1BL7BpKFb8GJJzlw/RSJ+oboFK/
	nbiFzukFNRNWIdc66Cg6tCZPnM3aEOAJ+Xoa7O50OsozazK4oTi3+ioZ
X-Gm-Gg: AR+sD119ZYHduLVzx4b7YHr64b29bxdpd0o4X/m37Pfn2N4/ltVDZEMFtecc5QEiRYd
	XwZWxilmlFwtqhyBHcUTMYuy215fZs/0UCJwt0bWXKUxR2Bu6XzIRnMvZ+aZHj0oXOEeC+F+JfY
	7gP8P+vHZNiCd0IkUebKV2DzDXOZfh0qNhHVi+0UPnrdoWgD8NVEtlXDdH3YDntucNH2XEX73ak
	eTiHqS17LroeNvIKS0yI48E/ondGlMpdUdhgqmV0S87H7kfGoQ21j/y4ZXLFdMZTy8HqWwc1ut4
	ckvpMUNsA3aso3YKEIv8qDsbzfCdJUSYXuj9LtUaonNsRf7n34I3vqAGZ2Hi2RldJ+zIRNM6niD
	sS3TlUZX7mV5R7D+9TD7WiToDVba6BzPEhxeJHQdhQqQ3ii5FEkYyxbXoSlx/VmfOJVpuGc5cAB
	MF6+O0LoglhHhRc5sMCxGoK1PJM/Y8TEqa5uefilXZ9htuBS3LckNDJdm801/UYDMFRMpCKoqKI
	8mjOb7miz2FsT+RUT/QfLwU8Q==
X-Received: by 2002:a05:600c:19cf:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-4954aa1a116mr275465885e9.18.1784719989472;
        Wed, 22 Jul 2026 04:33:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495686a8600sm118911045e9.6.2026.07.22.04.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:33:09 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx8qm-var-som-symphony: enable expansion header UART
Date: Wed, 22 Jul 2026 13:33:05 +0200
Message-ID: <20260722113305.28817-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable LPUART4 and configure its pin multiplexing to expose the UART
interface on the Symphony expansion header.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8qm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
index c7d3073b4041..ec55b86c220d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
@@ -287,6 +287,13 @@ &lpuart2 {
 	status = "okay";
 };
 
+/* header */
+&lpuart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart4>;
+	status = "okay";
+};
+
 &pca9534 {
 	usb3-signal-route-hog {
 		gpio-hog;
@@ -428,6 +435,13 @@ IMX8QM_LVDS0_I2C1_SDA_DMA_UART2_RX			0x06000020
 		>;
 	};
 
+	pinctrl_lpuart4: lpuart4grp {
+		fsl,pins = <
+			IMX8QM_M40_GPIO0_01_DMA_UART4_TX			0x06000020
+			IMX8QM_M40_GPIO0_00_DMA_UART4_RX			0x06000020
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			IMX8QM_MIPI_CSI0_MCLK_OUT_LSIO_GPIO1_IO24		0x00000021
-- 
2.47.3

