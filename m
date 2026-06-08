Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FF63C1966
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913383; cv=none; b=tCAIqsvHr1oHssk/shNUvwVoKMnvJv6pHWSA/D++SUo0U4vnmJ4PQcYTE5/Qn97mgCNRWxUa8Y9bgz62u39YVlhw8YruaTE6bOGpPmk65T8oLIcA3U4aO/nGbG8nR6+NMPe0Y+R/Wi3QhMzCgWubucvi3lMtP33ohOnLINbJvKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913383; c=relaxed/simple;
	bh=otcCri0DxgEweLlKzjCTtxL1ABb+6wi2XU5g9zloAhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GC8c8Ao4cjxnviJA2hF5NNO7nm0pp7md+bUpSl93mN3wXY3VSnem224p7rduwn6ZhlYM629Uf29UsB75Jy2o/3gVdl3XKVXMdl67BCJqspLrXti4pSiEiKc34Zd115ILb6shTYKuw7u+YN4gRjSH2MUje9cvkmDFGoF2g1VBlP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=islS6K1T; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="islS6K1T"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3707612f8f.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913380; x=1781518180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojVwZhZ3EvYNAttKwQ19CCpX2VmMvoPJYfArtnRSCJY=;
        b=islS6K1T3pxCADhnuHZxIfcbI51MW/dgKsbyztRCYGDrIowrHYFx270hAIpESvPB85
         ZC+FwJFJVGxLIbmDIiS9UGq9LTb/NRw4G5SjGcS97jR8mOOjfgZW4Luo5VjurKUFIEXu
         gJSnd4QZPhVRpiDBTRhGJ1T0WLaEDyzt/qQowUPhFL4OTSsdVtdbwx9VueP0RQiiQ5cx
         UTt185r8+LQcRqve1IRwgdFULGEqMpJ9EiayRNL+L/9ZWaz1zUdtm3LXQWD5nVldFtk6
         l491RZ9Ws1yBik7QcJFtcvFXDH8iVtwFtj52XsIWvUgTLNsS9V86fpprHBOh35xMbDj5
         p+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913380; x=1781518180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ojVwZhZ3EvYNAttKwQ19CCpX2VmMvoPJYfArtnRSCJY=;
        b=BVIBXggwcV1HBdHWyKEmRFLbibde5ofYOdRq302TYNAy4xvRYseM/Mx5G3sbjX+8iC
         c/kcPg+C6u4dGEGlDlOSeq1GySV5kDs28kjPd7UHRRSQ8cDX2QPnpYhy7nHjvq/tVSIa
         evpyT4QzYubPtsya5/KJr0uCee9KwjVaYthuVzvCwiWx5Tvf4Taq5qW52GvJ1Czi4pDO
         9fu8E+3C8hOzl1sIUyCL5PdzdT2EUXNUkYHjA8GUz9UV86Uk/voyje9PZeafWwepRyQl
         yMEhvOHoX3se/SKlCbPBM6Z3Wc60oqUiIvFUGjwzMDpfhPqOHxEnZk9EVSsTsUlsEy8F
         +XbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0dTscv0QVs+1OT0udAJX7FX0/fxtTQDNYLxjub9aOP3+Kg14afR3EIJkmA5AkJplxduB4gzjbc3z0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj/hBlbNNIFngL84mMLRhOxg45CISYkBIZWaGI8Kt3QeTahYNf
	LV/FL4FfN6e81Voe1d6ry8k9uTskKt+RB0aQU9/DVSD1CYQjnQXx4TZ4
X-Gm-Gg: Acq92OHxrMqwJHmBN2yVSMWkYpkgE9a7yEy/in9QB1D01w7I/LuA3I0snAGS+oO8H2t
	+b/WPiomgjnNOY4DRZ5IBE64X00ksTxsE4PxlgfMj48+yMc2TsXm+ZmFDU+eGYLjtBKn6gSYZR6
	liQcleKAo6sbH2IfqvN5wCw+iFcC9D7EjI7/1RMqG0jL5aFNiwB5LQ8HduwdKnVj4gPPzRUHCl3
	d0RYEOcNa8yhCPWS3NA1sWPHSSZATLNbfT6jSVaYYgCk4Q1XAzlY4FkFxrJvS5FcA4VEjk99qB1
	PWpbwgwi7pxztXPPM4wC+mfpZVv3kKhXBPQe5wAxGt9Z4yFLtq8TldUO6fWdTJFo/5Qgp/D5Vsw
	6V3PrM866kubpKt+nJjluHE6R55q+KZwY+i4qiQDNCrWEx5MGYqi7XcBdlE5uVIT3WAofZUAuVF
	IXDWSTqEWeysK2O0uG/C1zYRB0/FMwIsA6twUwGZqZB45sLITiuMBxung8ZWosjSQa3FKEa5blp
	l6GZIHo+P3uAVM2z3VoV5xfMSauuBWQOUpcpv86MUkcTZR4wajossbb080=
X-Received: by 2002:adf:eac1:0:b0:45e:ea65:d329 with SMTP id ffacd0b85a97d-460302dcbeemr15699680f8f.7.1780913379806;
        Mon, 08 Jun 2026 03:09:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:39 -0700 (PDT)
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
Subject: [PATCH v4 03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Mon,  8 Jun 2026 12:09:21 +0200
Message-ID: <6e57585e7a493e688f235a1c9877d7e1d6640cbc.1780912893.git.stefano.r@variscite.com>
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 2b04c9027125..e9fcc491e5b2 100644
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

