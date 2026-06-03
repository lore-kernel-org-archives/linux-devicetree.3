Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B8248167F
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492390; cv=none; b=H1SpA/OtL3JDjcR38IuZnaY2jH+hVyQIOxl1GEdooInjDdiHh3d/QaF1ZscNIYx27X7BAPGqYpZ0PHqMtCJ35sBdFYtdHAV1QOunyqY8cJPWMNBdkKalGtOdI2ANF7EL4HQtjYkGXQY56xTAYbwm/lX6fk0hF1l/pPdFCLzTE2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492390; c=relaxed/simple;
	bh=HQOQnngToDJecf0bRLPczW2aV0qCUfQY3QS+6f80Nso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHaFyMyy1pt5W1GGSSRPR2oJS6tXqD8I78cVGj3dJp3lg+/EV/bRGVg/1Uqc+iK4GYsuCBPM+SQDsDwWM68YanRYUEURgKNRe7ZJVFBP7PTmED2FCl3XmfQZv6m5ikdLfQfJ8wgR4xBeN7VBIBMCAdmVMg2rALIFAupxScWJ0n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZdAc7Hk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZdAc7Hk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2172314f8f.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492382; x=1781097182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YNBR43rYsuzDzzKAUXPCjYnMBRokGK4lII6/eKu93A=;
        b=VZdAc7Hk/s+nDdPRW8mjEsmSP9+pmPpNDS5Yd7zBzDvoWDHWmy2SP1S1Q//uaoUhUy
         5DsfPNY8e3bCBfe9rolHyhdXk8TQdvGQVmNKxHwdDiw+dGsUhKZ6ovG+U6bYNvGcObz8
         QiGZYUlnirSvs/gVmARQiAO9XMVlhK322nXQQtBZ8liepCrcahqhzVzSYjB9Ttldvsah
         QO9SrdLANL6tRSlxnyqg4AiqSLE/h78JlvDOSQbBe7iUei53SGmDX36WRVihmVGT9XAT
         JWREKCfWUYLQC/dfZiRaZh3MpvjdrvK96EDb7D6VDMmwJX/Q1hYJqNmHR3cH7JQqFiD0
         1Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492382; x=1781097182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8YNBR43rYsuzDzzKAUXPCjYnMBRokGK4lII6/eKu93A=;
        b=ODD7XIfCC4SMxOcXJHYqX8r9HFTRN+pSriolqAaN6zOYh4Gj7jkjxoyeZTZOEcKdqm
         Aaaq/7t2XYRCKQ/ykEIagAmckR5MAp+BKS/KHnXUvq/AuA7o09TwPcZUvKeJiOejFTiu
         qVkRssmnBvs8pm9wHqpJ4aPL5leDs6RSoAab+N+BNZPw6IzsBRJVSOcCSmVwlIUJENSS
         jlUwdExyXVi6aLVWpj4LbB9805j6x3J1avfd/AsxD5xQPPFPufFxZVz/XRAwPdSXhyS2
         KOvWlOXYZ70NrM1BINKc7IB7Ef1fCmywP8ylKreaIn3nCICC4SOaggqRIKC2HC8SbSBz
         STWw==
X-Forwarded-Encrypted: i=1; AFNElJ8LbSDhkP0I9R+czRHABM5XFW/C4f9KtfCrhdr2sUftSyJ/GBfxs31b5lj89994L1upjXlYZ33VWQZb@vger.kernel.org
X-Gm-Message-State: AOJu0YwgTi4DW5kjikFm9jlcEbCaO9n4gfUPtwP1jTMewKF7AT0Q7v9h
	aC5IIM2L0eEVuT5A14u/9QFnUtiWyP7F+Vc0sZvPsNZu9CRF+FlETUJU
X-Gm-Gg: Acq92OEh6Y+P38StXjButFY+hY5omXDDOeSxPH3lRn386kw0aq57FID80T6AXwpJpKp
	MKT2Uz8JiChWLJFk/wKkCYXMg6yI8QAAurXKIAmnRKTZ74nPF3r4+J09vaF0BIe31yqz8a/30xR
	O2oxfjUr6DR/V2pVZAxd2pTYgol9bqhjfZMyuLAOZWCrISWwF44kZBkv1RlkSRPjXz3r0R+Fve7
	NxQHmk840RLbz6Gefojn25FEeT7MJGnQ0XQRmlmbgyCTnfmUwd14U6+8Z3renoOdSvJHcf/ZxzR
	ijA3CL3nayJxKc9HvNgHfzcQikx29Eryn2pLBwZyHe3RXRuo2jjMB/TDu6OirUgZgS/T69tVGMC
	fkBx5JWJBPwFYvF6XXPU+qTNVEpZkwv62m5GP7MxGfSEqwOP82OLujAtfiMx6AXC0oUPsVjlVLW
	2f8ouNZRg6K+bHkeWw8N/uY5v7BQRR6b7DkiEybnhdmrguNGMYaLl2QRr7GFYidWAstr/a9nLTo
	qOWEU/MEd/oLT4OmwPWit5zUna1EPauH503D8M+rN7Uo2BW
X-Received: by 2002:adf:ee49:0:b0:460:1684:ba11 with SMTP id ffacd0b85a97d-460217c31afmr3034562f8f.15.1780492381876;
        Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
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
Subject: [PATCH v2 08/12] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Wed,  3 Jun 2026 15:12:46 +0200
Message-ID: <3cc5be80b54f270f8ea1079c514e20024dc231b5.1780492180.git.stefano.r@variscite.com>
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

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 4d8791886a78..ca0fc66193ee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -195,6 +195,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -305,6 +320,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

