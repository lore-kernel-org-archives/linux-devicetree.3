Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D1E351C20
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049476; cv=none; b=AJruAW4G2VnZ2P2YqC8htVaPoi86yhGYy21a/KFLgrJcBW/A9nzDbjRMR0IgasgcKigDZXwaThCdf8nu5ZuO7jqDDwOYIaFoEHi8STjss1Xfmm95l6Wvzprx0xDTPPtSR2IXF1HcfiogXl11OTklHTMhL4A3fENW8Aye5W3FnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049476; c=relaxed/simple;
	bh=BW953TXROZllcLsU9kioZBcWhT7vnUD+jaqbWRSA2Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjSzOnqk3U92KppaJPg6Pb7X/R4MPWfr+es2cZLhW0wJwaYIkwumLmt1TUxJscAHj7al8jfpJvAYo9daFemQgEshvVC6ycCtCpUOTJ3RJqh0mqkjC8dSWW1GU6c5ghdQNBiWR/KSEDqbCWxFpz76KEs3S28g2Kd7q3UoHdg2I9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOizQ4VF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOizQ4VF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4909def6a21so2076925e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049472; x=1780654272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBGQxOuIfjlaYF5jaV4k96kqDs0sEx4tF2C5YHnDbmQ=;
        b=UOizQ4VFcfAWTzYiZA5YG+3hnjnROItreTicaDbhLqS++9b6OHqWO2g/Ujv5Nc5dJG
         3a5ucwzj5ODjbNcRYXsoDLbVaXI9AXD3xUi1yPPLrYdnzXIexlBidE2bvILnv0eIK0Hg
         nx0PRw+bhhDkOs+uu+gVl/hr1c2NUWh7ofTBuez2V8QyYGm/lTfXNuqqfqI3p07gz7xX
         rO0dGbwUk4hCs73l8PiiuC+yHdStVTCfPuBy98Wpnb3YTLDouQVM2FrTxSPQ2gORM6mT
         NUXtdO+6wuIqvlXD7RwDqQDSkM6ArYdjbDrtEieL6Ej9dupdd7IsSLNYEfGHjeOpgnti
         AsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049472; x=1780654272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBGQxOuIfjlaYF5jaV4k96kqDs0sEx4tF2C5YHnDbmQ=;
        b=Uaq+hQ9Trd3o58NGa1caeUojK7Oh5BpsrtzHz8ir2Hi2dJGgYPy4Ie+QvGG1T32f8O
         sUqjVQYoPwkbFOX0vKI6PSPgXLCI4MVrUOJLir2ntPXx1Pwvmbs31qjXRBeOnnf/wEQ5
         SfsGo9HAP+rmLCJvFtpmcQObjukLLXMg/3+M0gPN9cTUu9mjmE2wEOkJ0z88Y91LPRgX
         3UjEWNx3AKVOUFP+uFQ9x7ZfPcksxaxS7oL3GqeAtRKFe7Zojr6TXQ2hVGBCYAEadX0D
         kq6sRiGPLzsez49hLuWmfVSm0+DYBaCSN0kLCMPPiErJsX9tz3mZn9zaHxAa5S0Ih1h/
         PqZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pDzwvsPEr8OnU4ZltD3bshfXkMkI2nIwQ0F0wociV1gP/N6yfi20xragq4e7gEzt/b88gWudowt2/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0OogAGcCiK9L3mtuo63OJXpQzzxPBgNpUiZiYQiY+lVqU4ZSX
	yXN4UfVYbBrU/7jPgl3ocRGj/N9lzNtKGP1KjWL48AZbLi7uoWJoM7za
X-Gm-Gg: Acq92OEmabhoJZHyjpWTZ/hNpegunvbgoLMNyo1vQmr6S2f6kk0JHboi8ZbG4kgCNsa
	Q9YlWqwNtUYCdBEnSX84/bmxsAfNymVB/1vLWVz+Y//Uv8P+Amh/UfqP8SSuRMi0T3/c43ui02C
	qBmiqfuypVgAVXf06/9bWe4DW02rorUD8r4Vy5eZxo9wO83QEvGaYznPZjndCCdqsZ+ZQmtcl4g
	NK8hDrKYu/EMIvVUI8bDePLDwdoTXdXrG2P8zxW0FQfLHaonfTkXXhkens+LR0Mr0TAIFqgq+hS
	BhRgQQAnOSj+gBHAUYW4cBIXzM/Vf/zmMHtaWpBTML18/ZSoIbGkYX66hW4wz9I9dVe4CoKxSxV
	XtwdH6JsxJo7h5jWjCzDioqlhb+Cnmem35zTfHgjUcpBaUtSe9ExFLr+urrBy9g8D3lTg8K90/W
	6LJ/4GIEsJKJksnRsYuzzuI3CjqJGqw917Qa+uOfxzWDj7RIGnVMoierzpZUAj5GtNLIsYLoW7B
	fovQjLVeKG8BUm9/A0ccDut2Fo54nfa/CeaJaCHOxuSG14=
X-Received: by 2002:a05:600c:c168:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-4909c07267dmr44399965e9.5.1780049471356;
        Fri, 29 May 2026 03:11:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:11 -0700 (PDT)
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
Subject: [PATCH v1 1/4] arm64: dts: imx93-var-som-symphony: add TPM support
Date: Fri, 29 May 2026 12:10:48 +0200
Message-ID: <040ad9104a8a628e3b2c18cb296a0d63d31b533c.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM enable signal is driven through a PCAL6408 GPIO expander, so add
the expander on the I2C bus and configure the TPM enable line as a GPIO
hog.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx93-var-som-symphony.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c0842fb3cfa3..ea996a36b022 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,26 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
+
+		tpm-enable-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "tpm_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3

