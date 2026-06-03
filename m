Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796DA48B388
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497461; cv=none; b=YqvnttBYp1Nc1c64Eb/T9fBRnwzPZ38HaPJAi72MkcACT5uizq15CYa1+taKQz9QBJT3umUNwV3ac3OW8iyaI/TTpfj9NpHcoeFe6t45jBq7HK99qmsKtwrZMS+zPKdqLQrfpEcwCoL5AQT6R4Th2jLqVgbkYR1P/3zeWyDHAHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497461; c=relaxed/simple;
	bh=f9lN4eCpeq6X4GQCWW5yGIkY8Fi5P6Oy/MMPAeTG7TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPTsuiNURkXvxYwQvBnTGOgHNRhZs9hdfm5E4zUP9/8RcjfAqkfveW138TIva6Ft1900QUMXq2qc1wNipRA8JZddm0zGq44ZHYmWrU1F0bN9+M5jg3j79zKug5mfDBhU88Xnq6tuMhlR69bpIdp6b6NUyNtPH8o183ZlPpInCpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iw78Bc/T; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iw78Bc/T"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso28560125e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497457; x=1781102257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUKMxUWlLW+OJ1vtsYh4pQyPHiovNF3yTxr4Eq5gQRo=;
        b=Iw78Bc/TvASx9K30kxDytvui6FnuRnUM01nhasmXTVH6pqlFM0A0r/EUkUtow1ucfA
         Eo9npnCeWB4X3yh6hb/LQmZLhfzWTJ5b0dD10JH1gw8S8fROLi41DFhpXYrWSFhKFWvU
         ED9uTzBquNL+4rv1ENnuvSGgBZjyPnJpJkt2YUMDBJcYQazmudDJHajJEmDHeWA6j/jp
         K+NlPtG6EbjuuOwPVuUElTyDNqKDd/wLOqFzN7773owK9g66SlM4JUj2wKu+PRg9KI1Z
         zboep1Qe2M4pIKuJFy9TL3A22ZacwBRbHO5UCcwwCWHGE2WhSKJ4raDsLGH1myWZ/c6a
         AICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497457; x=1781102257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUKMxUWlLW+OJ1vtsYh4pQyPHiovNF3yTxr4Eq5gQRo=;
        b=WDCeMujFsPQNJoGK0NCg0LQeJEGIob99r7Qqs18jaw6zb52F+1oeDCMfIs4OvEgM7r
         VBhO7XssYqtrQcnTILQpVdu2s2hikMrUfky1tMYWBw/+hNb2xDSK0lD6AcCwNIA0V7qL
         aVRF/m3jmhXurhNUcKflwBYJKjbOEVNdUmH+CZiNOze/eH8QrcjYauF1d6exIQnV3flx
         YnZGeUMQVL5X4hN4fSZZ2sztBRncZ+h843/SEDgxdiww3mMCv3QfXjt2bKYNEQwpHCuf
         3HtiR51CA5WJ3Qp2EjiASlI4YljYhdNUHZm/+AB+T2gOs2SGKM3XxO0SVdvLgdlFiCN2
         iMHA==
X-Forwarded-Encrypted: i=1; AFNElJ8xBPnux/jYI2oeyuvUR48HrFgtMUuhVpUbWx8pjkRZn/TAT5Lj10V2tE+FYXpAZOiO1M48CUwBN+oT@vger.kernel.org
X-Gm-Message-State: AOJu0YwzO4zmz4ALr5VJvLx2sr+HIOLl93W7QQKEBY9p9vpVaLrc3Ryi
	QgNfryydWMS244e/GXa9FzFFZA++yIPSPVITeVdKLyGMkJHyDieZ9QJc
X-Gm-Gg: Acq92OEbDCr2V8c5pBEFHMyZiBxxpRkbly7c4E8bokwhRrR7l2ovnakiS5UTv/oi6dL
	plnxxea8eu8QXndWMgLfYqcvPWurt0eebsqRoQ/JCmyvu1s7LpFE9Im3CiW9u583+2WxbbacF0z
	tsVcLJNUUQqXpi/219WMS66e7HoXmmd9NlGGrNG68rtWRzXPiAqJTDMxaWYacZ6SmvnKgwSP6Bb
	dPC/Hzn1CpwSDcUkh7XjDqvq7vQAtdcSBPgEuflortD++diC+IDyh+vr/mhLTlHmnn9p8KeJ4/F
	DlOW+/499qBChsl5oLWSwlMLThtkO1eFyX4wa97vMCuMkZ4Q6D512aPnH5ly55UrdUMyMarH6LO
	/jhfMJXGx1PGG1Az2DsL4n8q4+w0oHXhqaujk9wjwVKNWorh5OpTckWnri2d2bi+ZSL2dv29Qnb
	qame2MJRrchiQvDhmJcRKP/Vbv1QoZr4S1+ky5IPBKB1MsDEemSh20mtHNmIqox992B8N6O0SlF
	6TBKLZ6opAKauE8/d9b7VvXklvbrAWqTvpANyLlMTbLHB5o
X-Received: by 2002:a05:600c:8b64:b0:490:b642:ce31 with SMTP id 5b1f17b1804b1-490b642ce7cmr62747555e9.2.1780497456542;
        Wed, 03 Jun 2026 07:37:36 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:36 -0700 (PDT)
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
Subject: [PATCH v3 09/14] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Wed,  3 Jun 2026 16:37:16 +0200
Message-ID: <5532bf65f31a8b476d0e1cd030bdfb066400b518.1780497188.git.stefano.r@variscite.com>
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

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 93098799211b..9d08785cdae8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -327,6 +334,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

