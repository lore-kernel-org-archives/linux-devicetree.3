Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0CC330D54
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629187; cv=none; b=BBfD2sji5b7T1VeJgsKlVWRvwEbpHXniYg+uGTh/QavcY+4CaagALYfTVE3IcZirMvZRhEKI6FE1GCCAegmkRmolIV1QWMEDXSldu/4EBIF2CIbmVScD4PYiUU2LYbzDVSj7s08YnAhw24tzzaI3dML5Lhk4XnzfKb5PJ2TsIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629187; c=relaxed/simple;
	bh=FqU3DCQ9wVCZs1rUXt0lNtK3WzwimgAkpy1L21cml2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CnYYfxwZ/ErDXvuKzA8EQbVLlp8+r54xYDO1VFqKNynshriPBF3jn2T8eiboqJpmQ+38Gk8ACtTSFtgMqnTniEIqFZ3xkemCZc+dNUL3Be0+mLcmklh2kJuRa0wYFsUOkK3vkL5X7OIGJAxG4i/6xdItKH8f8E0K9RJfhRwPGQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccr/ziI0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccr/ziI0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486b9675d36so20480965e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774629184; x=1775233984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlEToPEr+d4V7DfWGTWOj3TmBp5gc4y+lbp6HYbSKds=;
        b=ccr/ziI03jqErGj+6vVGr4vYIxsvgB9/3YvTN+8R497jeq7TKUhaK0gG6n5aGnPmPM
         Ofj36Ys89W6b2ymcnC+8LS9YH1R/YpKvexqadvTlt+58PS8IX9BNYM81W/eRPPGj09Bt
         QGw1u/Fz6C+qQL0oJftBce1ZbVYi3wCsLxvZVPZBRePfc7Vh5v3gG6nEBe7k4tfBhj4X
         LwtwwfC1POGRz2Zpns00gdsEGUMeqzxNN//sCVBqwZHZ93NkiZ6R1tavn/82cbe1+uDi
         Cx/FfjRbOIkJ8Xu14cd/DVirHGhYnx++SAo/l99g4FcOC8E0Hztzqrv+9wiKhtGkQ0fo
         osXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774629184; x=1775233984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlEToPEr+d4V7DfWGTWOj3TmBp5gc4y+lbp6HYbSKds=;
        b=d6fdlqZ1JGZuztjUQA6FVNqtLYIoIwZPdRdnDiQKpl992wSjAXYEstHyu8qpuskhhR
         1lO/C7hV88VjJBOtnPwohE3GweaUFTHJCkcYltJLGcmb9oWSFrZKCiMXUwbWJ7eB9t3s
         tvVg67r6YvsuS2hluoESvygNLez0XIOqn5tnL2k3bw8vH0tzGMV4hJ4N3mugETPOYNmi
         zIj+4coEjm/K1YvNplY08etlKneXyxOXBb8fsqINN7Nfwct0FOkyuIk+vGjwNV8gl9FU
         b9N8XRfYp0vmCkntLiDKiVf93lwr3feiTMsd9Lu3uop8EY5Q2wk6kaGChFXXIGYW82m5
         5d+g==
X-Forwarded-Encrypted: i=1; AJvYcCUC+RXpi4t47oTmgDGA/txLqOG3MAsegXjv1ppjF8OQPAh437uzJpQKkS9GRBdCv/CvF9aOIR2dAgmW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CTARlm07rRgCzRC5XmTN27q9xAptsDa6OhlZxrKAkPyT2D2M
	I2yS0E2g6WWi8GwJZxc4Me55xbKE+e8BaV6Jro5OdBAwu5zKzDX/3qlI
X-Gm-Gg: ATEYQzxxK6aYaTEwn2fpBE3MSNBAQ6esdUdR3VcLoIwc9e1xAl1NX3nipIdDdaJpUY7
	US7Yj1KJn+M9bPRM6sfEc0wPVjmAmF5BCRMp7clQKgoLUmh8ICgbdV+54kF/La4Op8D1yBsTpmF
	YnpAyCuwgqIsOLWNm74Q2p7xDQD/pFXWKtfSP6KDX/xZ48IEuvUurFGl+M3JARxQodQl1YO1kZ0
	YzsXn1T74Dll4GWQcdyaKIK8rvSsx0WulO/YIi3Sr1trShTDrPBWx5yFXcqt210/aPGJtJxffdo
	Id26naGpxo+Llphv9vp07BwVZbyI3A73lC3rxofN//BZdJD+JZxPUqgQDJnVeBzuJ1dQHD7IImF
	02KdTPGUHYohhFE02qOCuFv1X4P6S3eOiyc26AHg48KTlWbTnDyqDuDr5egTBVVSYTRKiHYeRFb
	37nqFoL0x4bKrN773Qg/PAkhDkqPoJjqx8pDpOND0CR+vzDGMlCi0QKfoCU+oFzzhTWFpo8Ffzn
	qv3MiJKm3fRRFBOnO50pQgzwJrsTpvcc0Re
X-Received: by 2002:a05:600c:8b41:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-48727edf577mr52913915e9.27.1774629184028;
        Fri, 27 Mar 2026 09:33:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm193697875e9.11.2026.03.27.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:33:03 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select supply for PCA6408
Date: Fri, 27 Mar 2026 17:32:43 +0100
Message-ID: <20260327163243.17334-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

RGB_SEL controls the routing of some carrier board lines on the Sonata
board. The two PCA6408 GPIO expanders depend on that path being enabled,
so describe the selector as a fixed regulator and use it as their
vcc-supply.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index afa39dab240a..3b5816884f24 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -90,6 +90,13 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reg_rgb_sel: regulator-rgb-sel {
+		compatible = "regulator-fixed";
+		regulator-name = "rgb-select";
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -195,6 +202,7 @@ pca6408_1: gpio@20 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca6408_2: gpio@21 {
@@ -204,6 +212,7 @@ pca6408_2: gpio@21 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca9534: gpio@22 {
-- 
2.47.3

