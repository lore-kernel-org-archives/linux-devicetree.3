Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F652526AA2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081402; cv=none; b=rYRWp5KxhQ5DPa07f2ctjjjVJGaCf6pqh5cva2S2QXwtzEKWax3bQFxJUFZTfSJqxHd13uw/3LaG89HP0y5GvDKifZaySRNIpg7BxYmqXE50gCLMVushBtqmCrfODboxiQeq2VlNfiVRmBg7bYl/uNf5COXMzD86JB/UP6mObDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081402; c=relaxed/simple;
	bh=QPdfVv0xjaBDwPQ8HURDYLE3vCH7R5wni8Gxnxxzetw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gf6W5b3NuzhsigiFQ21XnjDmxCQHLBjuVDPL5GNKpEJ4HLJZEpTejtC0uyz+PGd0b+mCSNLA1o2YNKXQc2vmSTk8rdF7OPxlYsiKJtzoWoK/DWx78+DMKevLBu67sVhD4gNLjIaYTvEFztzQhdJoIDZen8Od0S57HWK8pK7fcjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXe+7zyH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXe+7zyH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so106866f8f.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081386; x=1792686186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1Zj18i8wLD+v0cMejrP3M0EMkqe51uSgByins6dl78=;
        b=lXe+7zyH4kYd19om9kS0Bcig0FSzepg2dPbg92YkJImuGuT0xHUhQQsIYcfQdXhjXx
         +tPSiNImd8NvXrsTSX+gPhbPFxpXJBceOL//qFU8sCAMCHmiyeJDo9Odcn8Hyf/kFY/Y
         Jc/+++lWJwysZGYw9DOZFAO1I/lbCjLNNz0emcGeD5tKoeKZe8X1pPI1+hx7jZ9b3I5C
         zlvJnKTQkVX5VQKn/j9d2+2lyxP/EQIwlbGaOPw6TcZ/SA+XGxe4Gc19vEAqVm+Yec5a
         f1uplWRiKzpum1IA75tYbkwh9HYPBXE0U50vpGY8Y4eaKqd7NghgOHF3ATMvGUX4QWg1
         2V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081386; x=1792686186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1Zj18i8wLD+v0cMejrP3M0EMkqe51uSgByins6dl78=;
        b=z39jsXpKMG/cn6hBQCbaWlxiQxShHsmedvBfbvXklliY0gNUbG+SBmK5jaB1azsv7y
         hElFqoGGMThos/oqcofPXauYm7I6bgpg2ulHNG+20Fu7cl3HbiZghvOzfam7NGM8jkek
         V27gxn+vcgkwiSJ0fHn8YbJh4rUrdsy096EHVSAMbdl+RtMIG4Htmbo68pTMYmPToM7u
         kqE4QznQLUmjUuPs1MfooXLn3zq7afSG3Ia3Rc1cKDjd28Yzoe+4FiWHFYQQ9fkNoyJw
         LNYAo3GZ+fgXFIwFsyEMDrgKGJMffT2rr0xBAUc2LfSekzspG8nis/zZB22D8L0TIFXg
         WvhA==
X-Forwarded-Encrypted: i=1; AKwUvBzO/6QeSOPdEyzRnCM8bJ+TrGGmPGcOded3jzQ2bIGdIbky5DexPub01R88Hm3FiwIL4cVSpwFvBf9a@vger.kernel.org
X-Gm-Message-State: AFq9FYI7yt6AahZE73pVZNv3QBZvBg9r7n85rosx+9TtEXK1phxoA7aA
	xg6apQ/qn0SGelz6wNAO6p2Ba/h5ekwPEPiLbg4zfs/HIaooCu7Us67P
X-Gm-Gg: AYBFou3qqCYluaUrcjZJawUpaUYw+OCJebdXKAg1dwGu4VIDTtflphlxj9STWR3rUQe
	y6+VZygkqlDiCRLIQeNn7Lg6MNxwwcQGURgvyAMToMA3L0cFb6vBVX5zTwY/w3wJEEEuMT2nwpS
	aMqv1HQOGsDSqfbgpKw1FCbX/frf/aTXguFfq3KR+uoVnf9QLSh43unG/OEdtwlCHGXPTOjm4dd
	srrNqJFaT/WkNn+N1Ygs5agjePttp0aVjwTUXLcflqdxVVrLa1t/LyOmfKon69+iRAxKeVNAZQA
	EVVMz+l+Db37d39++QW59o3R3t6aVpuwqAwDieyBxZ8ca++b8+X2zgYflQzJStN3G7MDU/ErVli
	Ir9KE4p6rM/+UfgMxnDtdBxNAjNvXEZKOKmUjt6yEquhM/mavH3bzGRuy9GZ4WwiJOKuFgtOcoz
	xjk2pZaQYLlAXfgA930Kf+KV8cA/WIUpkpz08IibPMJGlXqPSg0AYXkO0609uBpkRj4fZlTnPrM
	GSJ4hT9QqNL+bLniyXDp3H9C+q5jntJkwgfcoNK/gOQhmiZEA/opdPVny0k7zBktfzqewmk7XFv
	YesC+6VeLtzLMyJK6urjew==
X-Received: by 2002:a5d:428f:0:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48dfadffbcbmr1105292f8f.10.1792081386308;
        Thu, 15 Oct 2026 09:23:06 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm20616982f8f.28.2026.10.15.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:23:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640 camera support
Date: Thu, 15 Oct 2026 18:23:01 +0200
Message-ID: <20261015162301.63838-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the OV5640 camera connected to the Sonata carrier
board's first MIPI CSI port.

Describe the sensor on I2C2, its 24 MHz reference clock, fixed supplies,
and reset and power-down signals controlled by the GPIO expander.
Connect the sensor to the MIPI CSI receiver using two data lanes and
enable the receiver and CSI bridge.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..427a255fe8ec 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -75,12 +75,39 @@ clk40m: oscillator {
 		clock-output-names = "can_osc";
 	};
 
+	camera_clk: oscillator-cam {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <100000000>;
 	};
 
+	reg_camera_1v5: regulator-camera-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_1V5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_camera_1v8: regulator-camera-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_camera_2v8: regulator-camera-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -95,6 +122,10 @@ reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 	};
 };
 
+&csi {
+	status = "okay";
+};
+
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -200,6 +231,26 @@ ft5x06_ts: touchscreen@38 {
 		wakeup-source;
 	};
 
+	ov5640_mipi1: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&camera_clk>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_camera_2v8>;
+		DOVDD-supply = <&reg_camera_1v8>;
+		DVDD-supply = <&reg_camera_1v5>;
+		powerdown-gpios = <&pca6408_1 3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pca6408_1 1 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_mipi1_ep: endpoint {
+				remote-endpoint = <&mipi1_sensor_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+
 	extcon_ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
@@ -263,6 +314,21 @@ st33ktpm2xi2c: tpm@2e {
 	};
 };
 
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi1_sensor_ep: endpoint {
+				remote-endpoint = <&ov5640_mipi1_ep>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	fsl,tx-deemph-gen1 = <0x2d>;
-- 
2.47.3

