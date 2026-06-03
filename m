Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912A472780
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488006; cv=none; b=lXUQJ171WtRR3yZ4PT9yVD/j5KhGoDdPpNH7aBAT2umL6JrqiOviwKioR5iTjSwJYH4ch8j0TLlPk1lB/Sq75lcN5Sdfct7dFAt+g//YHxJCA62GgRSnEuqN0wQMYz8Bdi77Ub7htJhtnPCbTO5c/7Nz8hbOeHOz1U9KZv/rlno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488006; c=relaxed/simple;
	bh=fNiGoUSJqSEmhz+n3sgUNFoIYqnWXFryu5rSRIxkBEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcN8pK4Xl6t9EArtiWBJMsFmHDVQWh1A37MaegpLzNhDOhc3rdK8+r1kk7tWspSZFPEvY2Gm0pDwfokHZwF3nUGCW+E956iTOH0xfE/UNEzaOJsUVviJbBNuf7jXMS61VzXp7zdy4zntxEg72QCzf0rj7W/2m+Dj4GUPsrHN3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mINeImqb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mINeImqb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eee266c6cso4878139f8f.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488003; x=1781092803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk1r/Chz5tySwG2DZgKv8FwEIvhKShhxz5WRxEuPP38=;
        b=mINeImqbEJq8WUwbjl62GRrf7LMuNKm47kK9YfFQ7Veeo8CK0QLb8SfUsZqf68RJi3
         DDl4zFV0CjzTYrUWH3B/F6jFf7rMAkDg1FZxrtE9cfg+tsnM3SRU6GxSugKVAnD70jTu
         ZpdLRaDGDWB9n/OpLJVY/UxHvMXQEdUh7peBEa/Hf5phfcK7mw0bkW5RfGDjGFTWPiMF
         9ScHLYoqKpDldKR1Re9GqWFj1n/JMXt7sbzdNfxPntH2+ztvoG4T35HzgdJVHu7XK8ME
         JQAziJ5QhGqSOjD8vltwrqIPQj6/E1afLK3B+XrTvyRwW7gf3uxYfDv+lpxq483Ab2TZ
         0qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488003; x=1781092803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mk1r/Chz5tySwG2DZgKv8FwEIvhKShhxz5WRxEuPP38=;
        b=je1xEQBMMeMQuw6uwcJmB9iFHB1/yj8Gi65PRFeeU4hoXv8a5pMP1HNkdNkGt4oWCj
         eIYVKlEtghi3GBrOJLZ1NqqE02n1n9UNm7BYV7IpsdoRHQLkGj9hUaQh1uuShqZ27Rt7
         AAHmf2AhhoBgs5KQbf5k8f6LMA6wfCV80xrEZ8ewpaQRotU0haJwKBduokhlE/r5GxeJ
         wdhJfBUFWLwGBad4n9wt9boyVrOtfZjLTa1y4yAg/yTyifx9llPE0g7y4Mhe+OZiTyuc
         C96AKIjaaxNaVbz4RImxWJMN/jTjWdvAgapxlbeSRWfADmYYajacEYi1kC83osmZ4Dwq
         2P4g==
X-Forwarded-Encrypted: i=1; AFNElJ8xJsfny6yTFjODTKBmoAW35czvPVB5JdVHBlmlWyHHDAmvGdg+TB8qtIcp8iuxFGIKXWRT3I/0PVlB@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsW2/08vjNWcwttp0LpCRz3dyqrW58RNGXGuIvpZdOqKdM0YC
	VDEFeuYJJGVOG8MlywXaAskm6N5Dl3+K3fTWLJqQg3mwDrk7fIlLaacu
X-Gm-Gg: Acq92OH/fG8ij1QGAB+tC865XaZuzjMusvPKiL8W2ENHKs5qoXY01NgicgLP1DLBGvV
	jY+AUqEYSC+NsMvJBO8LBH1kCySbfmCmKBL9ab+Ik9zgABr/ezm4HMGQV4b0qGUTpV6MR35kia9
	+mw6uUYz+OONXLaw592Wwa5vaxlgjyV4FrlyGOQpjN2yoaWGLd9ZiRJDr7D4mWZwBgiQUwk62bh
	qZfenRVIdo2Kwf4mBoVgfBAaHqudKYXUCl5qO1DIVg6T7YhzyXb9bwasO3UtbwJHEvd6Ls6DIbe
	YJr9S8c12GYUUSjp9iule0l4q/Fm5Ss6XGY/qMck66W0ed2Tq1ZWy4pRCsWmHY1dz0l/3EN2cM/
	n4/7tIUdE3prDifmUcw8FdEWU0LSGe75yD7bRw3UHohVFLqL00NWG3UPq5hFDWA3084h/B8zaFg
	GUlzfRpCaAOKUDuSaZwDT8BnOhjHYjG3tJTKLIeV/aUnz4Mj46SrWii4SIajNSj3xClGloRg3aU
	Yp/LiKLu2iiZL9YZ0zpC9JuuUx5YEpdVBL0ot/pqRJDpi/nSJtNUTxdnXs=
X-Received: by 2002:adf:e014:0:20b0:452:11f9:bc40 with SMTP id ffacd0b85a97d-460218abd41mr3075579f8f.2.1780488003205;
        Wed, 03 Jun 2026 05:00:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:02 -0700 (PDT)
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
Subject: [PATCH v1 03/12] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 13:55:41 +0200
Message-ID: <4bc5e9bb6c7e136113dd59afc6ae44be2c8c30d8.1780487415.git.stefano.r@variscite.com>
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index de1b8b842848..935bc71b6ee1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -116,6 +116,31 @@ typec_dr_sw: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	pinctrl-2 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3

