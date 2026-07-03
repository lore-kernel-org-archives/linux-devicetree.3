Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE738239B
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068383; cv=none; b=oh14SJPzJFc8t8t2Of1CPrYdCT5Twqz4bJdDupBCKfaqwMcOI7CoH8UDxnD+qn2BR6T7dntVRGtkCM+B6L/97+SpARmB/YWr5TBBPOodhOR+JrM/YWLoILEhKMdV8DnTWtX26O1uGLPxRpDrL21nL7TGuqK+hXFw75pwCgeKyxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068383; c=relaxed/simple;
	bh=61yxivWmjnMWM1viUIarU9gTufDItOGDFs0p3/V3s84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HgJ4ef1e72+GAApsPNofvyJq8ovWUdvjqqrV7ib7aekLTOBzMflpa0yzy8vw3f0KNje68TfWD3TEZEklWE3FpBe+maQGIK1OODMylqHvsUH2+3MmoUfY0MIzD8UnfFC1FhHNm6yxXgexWZ/UflubFDBaAjbZ9IDCZDk5BZU05zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkqX9Czi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkqX9Czi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so2932105e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068379; x=1783673179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiTPaztlaBR2pEeoDnHua6pbqmiqcP154lbAnOqqcM4=;
        b=TkqX9CzilzTgsQDT6vkTEp4bf13aaSWin4mrDfxM0MkQGof/ebXj2JkJhRIMctwDZu
         oTHrDsMXQizw4lrKnp2I0DHjUk0D7DaQWAUYFlgE/mOXNrfpLpY5AgiErnbyfGGz+dyY
         2oulegdy+sNYf1k+WpgtrK0taHLnJKXTQCfeVoN8d50iYeMT9zGtHxK6w2m13CpizdUB
         pngpID15KNAx+Cx2DelsRl/uQyefRxngZqizKiO8f4tBypO7AAOpgf6OTM5s2oFiyn/a
         PTIkD28vs8wujtXS4yFmdzHuO36/ZbcIz7LZU8IeEd2qfohH6PrhgmWLXFDIFwAAsQyZ
         J0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068379; x=1783673179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OiTPaztlaBR2pEeoDnHua6pbqmiqcP154lbAnOqqcM4=;
        b=qIQ3K/aKg2nb9taAV/S4mpY8D1ZmbGLA5WVIRm/6t5jhulFuonB1G65MgeOYr7764P
         G/SpWUXCB4XYBHKHNwtisKRAZG0sswGdi7/ldsMgL3+XsdjbN/nbzNwL7+cHDPOo/nPT
         +dppC7cYkY8QP5QQkWGpX9eSqvfUkrZIyR7zqtTfM28ldK+UjFr2mI8SmqZdgsmv86D9
         V/GsRvrTMM7kzVdy3qMB7cNwsf9VrU7cQ1C8jGPrCdz3IlGDZVh0K1GX5W5jZ7T6MLDu
         /TPzYrSJAgBmZu9fA2Q+pPOxDo4UAl1XNL5CwEHGp4d7s64SQdRaP4znG5q2x8ka0/3X
         LDFg==
X-Forwarded-Encrypted: i=1; AFNElJ/0GN4S/Z8vT3WaEXhPLdMQUa+hG0BmQx5Pm23xIoGE0kjFK/AQDJ0uFb0T8yIqlyaBW4ixiDzQ+cur@vger.kernel.org
X-Gm-Message-State: AOJu0YyCQXciCjvp2wYPDi6UWVKvQY03xC7z7cak0YLvqnEuctB5mnOn
	wYGY9ztx01vudGS+oyuCYYP6hOhqxRB8913a2fnbmBfe51GwaonUPNBT
X-Gm-Gg: AfdE7clIPnfEI1DcIfn5RBeGi0PtC2094/fDCY8yicr5JE22cM72axR5ChXNFavWR+D
	qeMdAKS7YmtjMqMl+ybOPiKPFdp0CH/gcfg5XVGbBCEG46VNB/nvNAo73YgRGRMXWZ0sI9kWKw1
	ENUpn+iOyyYOUGFnrh5C5e79UkbRnexbUitssUZffWyECj4DdhKAB/cGkwlEMNKt9sP74y2d4cc
	/asbrSh2HgbvNH/8FueZD4/YyX1AvIWVketbz8b+2hNKqvIBqvdRN8mv9Z/f2RkErVD7mqKHONq
	wDDIvwoLRnL5ZiPoHppUe5I8xVPaRaLhgNElcSxXvrUPuDsSp1tcIFPTUGMDIvf4e9aRTHg6+8s
	lQUwla+x1CIke50TMe/qLj0B+RBNBGcPwOOyybNSZTJZpW+w8kj6IKTlTtuPjXeICotN9Qp8JZ5
	YHRbSRGBmL/B7vCjMzI4udGE0cP2RPYgh+Jm1SE0UTtUTWcZHzDzEOUv+aeLgB4DbWQHqIxKDIC
	kEkOXMCHC+lrSJGULcXkEc/jw==
X-Received: by 2002:a05:600c:5391:b0:490:c032:ae92 with SMTP id 5b1f17b1804b1-493c3df2b42mr114145085e9.33.1783068378849;
        Fri, 03 Jul 2026 01:46:18 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:18 -0700 (PDT)
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
Subject: [PATCH v1 10/15] arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
Date: Fri,  3 Jul 2026 10:45:57 +0200
Message-ID: <fb9bfa8584a608e9ba8179b2749593bc23c040ea.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

Add the PCA6408 GPIO expander and the ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 53130b521b5b..7d016ed5e911 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -160,6 +160,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3

