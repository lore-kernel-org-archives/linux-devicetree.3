Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B547CC86
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488017; cv=none; b=tn+ZHa4SmIn0iCQ3tN7lDG7ucguzVpcHM+JQliU/XQ6aZDg7a7FZLFxdfminDUTgkExOEYbvZJhnqgiE6GHmCzQnuH8DD9xukHRWhOA+Fb3TtNhQwldXEGS00VvLEPVqkdnb68UOUx+HGQtyGvcPHMr9rFfdTLbREFvaOYg9wAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488017; c=relaxed/simple;
	bh=iDzCVHKlS/caaXxuqnyZ0CA4X7dCoZ2adVSPzilWPV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8wrLxeaWDbprQg0Z6SziCzLVJx1RUHzqe4uD2snn7RL1xcmuVMr7nGD2kw+qlbbIjCwtO5NL4A0wt1Zxx7IDU4Vf2zgHGHxk+ynn0kMx2sQUsyoxnF+jAZgcq8W48Q+Ny9PXs0zBmUJBIA9MgOWYD47SAs8bnklxJbTwL1p8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMyX3kU5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMyX3kU5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ac357c55so33286795e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488015; x=1781092815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OC1wDCeyooboIhfSEf5L6MjWXV2UqSS71W6WzHJhc0=;
        b=jMyX3kU5AjkpBhcVMnReRxXlnj25SctPlT2fLkQujnf9UNak4txEY1N9ASCui4OVUU
         ImCXzpruPxb1/u//mxjQUa3EnkzhBOkeG5apJMdlISdKaJ9NOc+17/Pgamh36G1v3/rR
         2CF9BJbG1tAISG9A0LqWGKXtRn756hdVmKAxaR7e0TkGaXPZxlUqKxCYsw+gHQ6SiRZM
         Nl3LYDHSLRWrlA+n2uY6C95vxG9ljcUIafuNYLoEInDnjslV+unqTix9TAn6q0ocp+s7
         UZe4ZtHnrlVlQEqiHsepAUW4Y4mkzn+y0YrggmrUfdrKDBoXzb/vZY77lZofF31h+dDP
         brJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488015; x=1781092815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2OC1wDCeyooboIhfSEf5L6MjWXV2UqSS71W6WzHJhc0=;
        b=ixkO8YS6f+XcbQNkqHtJAEwr0bOE4JXcwoVdzkBi6kMmlx2WM5qnRSdK+P+JKY+50q
         gEEfkQVsUprumvAFcqKumCCalinP9n9sQqTIy/B3ZX9G9Ch1gLra43LcW79z4VOBPy5b
         P3TzAb3AcflbnPhPg5nSk20dIa2c7m4KofbTwZ+0qG7TN63zs0ug1kaVcPFd3Ddq9j2g
         sgPaKYyyH5dTcxrvvmMdYQwt5YiK5xWaHnf2FZ4hIEdqRLHzxPKXRXXL+qzBBzEyBoEV
         oKwiJiVuMmH+kvTg8rr+P8aoh7k6sjlAPv84gtexp17T2pgOExP29UH2tlSJhG/DJkte
         v5GQ==
X-Forwarded-Encrypted: i=1; AFNElJ9C82wj9MYxdKg+hYFJ0VXmOumJW4g6/nXOns5d5gkt0owIzmoA1heVhSZRh1RBUAs4bLmsftt6PtyJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWkJdBNqU2xs4hZluN2rnKnDfOTMEsER5dJQ0LFwOUsoW7PS16
	fdiWE3tz2qHBvIxW8EZrKR6OOSWWDfVxCL0EfBnhl1ktCZ8mMJay/ZJ5
X-Gm-Gg: Acq92OGWhoJXzswXT5mYDfWMOQlLJaM6ombnE7zgdsDLgJRAiota9Hhc4Bit3UIA6Kt
	M7IBtDpZicKa8ucEW4NRQ2sUUw/oLP+b2Vj5ghyUro2Y3XS6xGgY8gv6ceXN6Xmzql2JRLpuFdS
	Bpv2LZed+4vHCPmfuqfnsDWjS6sGFoIucN3g0ZdM++qS+ox83m6aJqnaSdu1AsVZItqWlzCDIJ6
	nhHHTeHom7aDD1xCJlwTtEESERg2vnqPFAgldTIhEQvs761iZs5ruVPvcJXscNxJjttVnc40CZr
	FLfFa9aCCn1Y08hebN7egqeXuzt4pTRKRryuSU21nqSY1iIvmaMgOR1YL5fThP8A/z2zJHzB7QW
	XwZYOoShJP4nHTEa7NNqZBFRBngIuG8TxQ1oOY5GVxOspVIBUVgKIw+1rAbEJNJeHq2Z66lybwF
	oGztDHNIsoQ95aWGA8aRF4rSgYBHEAuKW/fBS8vOxMxFvKHkTvkfCD3puD5mgvM97gA3NrNTYCz
	iqxSVJ8WJPcxNfFlsOuPYHoo9x0nfTO0faPC9CAtuJBQOmd
X-Received: by 2002:a05:600c:64c5:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490b5ed43cbmr49272055e9.20.1780488012933;
        Wed, 03 Jun 2026 05:00:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:12 -0700 (PDT)
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
Subject: [PATCH v1 12/12] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Wed,  3 Jun 2026 13:55:50 +0200
Message-ID: <9924a29ac63d025cee7a91b92e11486be46ab9b5.1780487415.git.stefano.r@variscite.com>
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

Add the GPIO pinctrl state and GPIO descriptors required for I2C1 bus
recovery on the VAR-SOM-MX8M-PLUS.

This allows the I2C controller to recover the bus if SDA or SCL are held
low by a device.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 49467b48d0b0..61786eee0e82 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -180,8 +180,11 @@ led@1 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -415,6 +418,13 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3

