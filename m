Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7369B48A2CF
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497457; cv=none; b=DfiKqAkNDVJPY0JSzIaMzo4P6M0MiK8ZHjKP/HM0jbZRC+TI9AnIzqV7LaFtt/p+8xlczqVnKEhcLQ0b0TMcIBKioD8qclOrxCO7Gpy1M+5I+2DQKZp+EbpXKXA9O6bIc9bpjAZUzyMPOi9XpUv+Dk/Mx2Y0YQHKQrShf+xix+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497457; c=relaxed/simple;
	bh=/kpNjBflrS8g+S0mHG1ImgGCsUUL03+6OayeWxJ858Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbIjnW3rmevZOyHFfI3fe8KYuZDFtgAojlFym/hIaEUJqgZyqlQF/CAfrh8G6VTKfXiClGM6lT5YXAtisd4rs+7al9ev7+CZSwmnyCBozAc/LsiQtlC5OWpkTjP7ri+19rrePlr4HjRCr82Nk8GWg4vzGF/bo1Xhyybak9VG7+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5SymjmJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5SymjmJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b3e03939so7469405e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497454; x=1781102254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek2z2hCKg51eeqqNP9O236wR5gFYHNYlKZaWXk0NZ1A=;
        b=b5SymjmJUJ2ZVnd9lg4axoJukqi1buGfumMaLAkFN71IWbStwws5YUTpV7FFOjpny2
         VnkLfYpFFBqhd3We1NM9WnsW2kVMsZ03pWb1t1y4/OD2JaQoH2nqCZfyeWl6JkhODYfn
         wuyfzaqL2TV47SSvjKmHGZSXDT/ww0WRXve+DLfx2LspJtOj0B9U72kN9hDFUilRaWHs
         NvQscC2V1W4T29DthWtwC757TP9k3iiCyNOhJqdVZOibk5nwLk2mp9X7ZNfu02ZzBMOA
         yav/lHuQQrlMOmZ8AHniDcP7b+BNCUy2ztHu0CDQyliDTFVb5KZcZPKIVKZLUFpIoIpm
         L8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497454; x=1781102254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ek2z2hCKg51eeqqNP9O236wR5gFYHNYlKZaWXk0NZ1A=;
        b=CJDCY66MzLjY2eC46a+bM/c7vamaKjwFjGqnnr8cTM9mK7kpUvLQrHW48p/qyRHEA6
         W/Jkn7z5fg7dgjsI8+PrnxYk+RJnuslgbQ4lt+ayRkJGM9CTT7eyQ91oO1Ev/DvHaOS0
         cA0SJ1B9CEE3zjzVpF4dAjmpjErBtlfQUWXo/MTIsBBs2dXTPQze6FraqFTEFPoXnLHC
         /4hp5E3k46JEliMvfBWzYsjHYtm3ZFqYFY9gtSuP1byRtccV3GOyGXPxV8UgLF7OnEk0
         fKRaRQQk5gRnuObmokSI2tqT41ZL4SFyvTztD1r8xlzEcuR+yVpu9RByqYeOuqAFB3q2
         X5AA==
X-Forwarded-Encrypted: i=1; AFNElJ/6PsTRNNhsNzTAqZqWhL36xByVmxrOYaQEGzxn6VreYfmRxyvVz/FlEIZNmN7ZbQ7/lbNZkbIgDGBu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26sMmNH9dNW2k7eQDM+uTqzgSmxKMyg/HpI3uu4ZKwTWKwaGp
	+YeLpXF0ltj6aj9kCzGeSuk2rBVGdnVNCeqrzOreBz97xjmfSt9yRLPU
X-Gm-Gg: Acq92OEKEm1j5CHw1Saz+Lb998Y9OiO87HoE3R+HJ2kAw9ezFmOQXppDAls8+1DgEDj
	oZ/wUMxanDLC2XZzVkmnz6bRfqVOBXvFU/uoicVGfo3LG+3qah6HBx87FryZnAv178GRa7Sswtn
	3B8G0vK3ZvHFzzIarBv+f7UTzyKNkffBpE1J2rWTyoJgmGUwr2d7iJ6CqppwEwBShgJxb+sA4wV
	AYb6WO+28ptukXP4kYTGTmmNt4pYKT5doFrN3UObtjNmcQgyt+/vddVMpL8tQwAmqCkVk3DNx/3
	OppUvVJjRNaAQZgubjElz2bcEnbhaxv/OqEz0Rys2EmwOAgMhkJKMZvWH9VCdaalX/t6FgV19TI
	csjPxTta9tOVTV4/pPGwsOiZ+SDmx8PJ2R6y8oDClKDr3x0uRxcDvE5qubF/ws6tg1CYDyaU4XM
	d7k5y/BbQix0n8fXhLISL0TFlde4+d8C6XkuwxA3VfxAvim7pKlkpT9i39wuhs6R+6gVZjpjsKn
	Vz17U18yqycqFGYEh1T9nVu8HxWnifGUWewUjpfmwQehaV0
X-Received: by 2002:a05:600c:3510:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490b6151755mr47163205e9.14.1780497453687;
        Wed, 03 Jun 2026 07:37:33 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:33 -0700 (PDT)
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
Subject: [PATCH v3 07/14] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Wed,  3 Jun 2026 16:37:14 +0200
Message-ID: <24154af5fc04cf4b355dbebc33566f83d85b222e.1780497188.git.stefano.r@variscite.com>
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

Enable the HDMI display pipeline and HDMI audio support on the Symphony
carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline

 .../dts/freescale/imx8mp-var-som-symphony.dts | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index db0ae706f648..f7eebf265fab 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,43 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
@@ -152,6 +201,10 @@ rtc@68 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &pcie {
 	reset-gpio = <&pcal6408 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
@@ -253,6 +306,14 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3

