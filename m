Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF7337AA72
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877164; cv=none; b=XIkfduvinoDZmeSO/v9TrZJuzqyESOPqhB6JvgB6CW6Yq4eVbuJfJ5prwQuShsVDM69ML+cIskzYj9FKIC5jILI+l+BdFnM6LpFGHqkwbsYkW0kntjSUa6L9sz52yfgFf+oKSfwp6yoYsWZR8aY/1f9Nq9a5FjuUaiHej8wi0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877164; c=relaxed/simple;
	bh=8zVJf4ehl0i1tJ0T6O4LQGiWHk6gdqUy6omYjg9+BfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVPvRR6ENzt/nLog545ZflVxpy1EDjnZDd4D3cIUqL99Ya5P0Ul3+tl1YF6mQlakWllPhggK20QBb/Z76WCRjUZStWihBUvQsX2gon27LOEwrltFBWL8xp6HhsjHPXgkGFyYTpzGS6IoZXp/BPpE66KKcy/w29X96gXUkC2Z31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+pPc+gW; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+pPc+gW"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6870f904c6bso13245391a12.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779877161; x=1780481961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV1/2EFhl/qGJB2u0g887w6RZpeM4jTCX3x2gkFo0HA=;
        b=O+pPc+gWmyd8ZC/kysmIJ10s3zuWrD4jye7NchZrxiBCiH1w2HZIrdRw4m70qBQ2H6
         aoYf4cO5gPyMhttQmN1fWgRGmT76Tt1saj6f3VaabA0CjMlJa+0vXVKehS1ECwKuHwsJ
         I19mQqJjCITaB4kD6w3/L3LTbrOunWlJvgbiuiC0Lb2cDeHPMNXDF4xdBykxVY1kcNDT
         oXpVVrz420iBIQ9xzzKlThI/enFfKiFHCCapdpN2xyLiegwbU7dxOAvOiQ/o0M9dBDfA
         yVWsRWpKxexr+H/5bJMywz16xaBBH+X1tbXPQAY/gBjDNoXdMHhLUMHGPxRidlH44RkM
         9S+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779877161; x=1780481961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JV1/2EFhl/qGJB2u0g887w6RZpeM4jTCX3x2gkFo0HA=;
        b=Eds8+l6bNqWdHisTAOIKdgaPm6oYRiCh66clHWjICdCoqer8hkBBUslWWCVFnSOV8O
         oiQLt8av9VBCFHwihubTAUj7qw7VNsXnPAS6aZYgxvtaOJU0FJIaltuuyqttvOHkTfKZ
         4RFeQEjn0DG9eZPKVgfODOVEkrLJYM76nFNsVRMMOdE+jXUGJQjpWvECYQoga/8MyAt8
         9umfKM1FA6vrBY5C8tIdq1vDG8sOtXSxTjR5//oSbcskMmJfT0mAPnkUfrPinDOk6HJQ
         MNDm4a1euAULsVKlAOJLKaEIL29iO0+0NG9g8uMWwYgg83YzQ8SBb31hhG0j2mRVVQ0x
         r9oQ==
X-Gm-Message-State: AOJu0YwhFJ5hAqLSPFuaNxKDDEX5Vi1le4C+Bz8cEinfQskGAdMbmhFu
	vF0P609XFgxsDPhZ5cto8j189ufeyvwZa3oP/NOqZg7gIO7yzLvTNA51nFWg9ecR
X-Gm-Gg: Acq92OF1QmPtd72sf5LJpdUksDYEs6ccVzMwEfgT751W1CxcYENxZXGS6mOoFYbP3Bb
	rLhpwoofOHQCPW94Zzr7BJKzqWkE16S6d1pqperwOzDqS9S1JIYJeYhPW74G3g+nLw2m0qxfGMS
	8qjCPQVXVtSDDNzS7jgpL5K3/L4RFgqFKxyC0y+u0fJQYgzGJUScboKQGV/nW+nYLpiPDEW4jVY
	bYqrUoz/hP+4tnUvf1uWRkBsm+3i3Ib/DNhWbesSay/Xp3mSdYeq2ivElGFVThpr8gF604n1tAM
	OZyNyN26+ni2Bg0j+uxuwAE8+LTaCVSjROAfUT9yn1MF736lsExt+KnSV4Qab55pwTNN+TfABSQ
	ZAOlQPtiOlvoXMQVhT9ISn7N3ED2IXkQ2yB2szmOpfygPf3nW79j8Ybibz6nSJ2FECeh1v3t5qm
	5o/MQ=
X-Received: by 2002:a17:907:c003:b0:bd5:7a3:a593 with SMTP id a640c23a62f3a-bdd2b0d6a45mr1469039266b.46.1779877160585;
        Wed, 27 May 2026 03:19:20 -0700 (PDT)
Received: from rafiki.local ([2001:470:6180::e68d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd50sm590369066b.4.2026.05.27.03.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:19:20 -0700 (PDT)
From: Lech Perczak <lech.perczak@gmail.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lech Perczak <lechu@hswro.org>,
	Lech Perczak <lech.perczak@gmail.com>
Subject: [PATCH v3] ARM: dts: imx7d-pico-pi: add OV5645 camera support
Date: Wed, 27 May 2026 12:19:12 +0200
Message-ID: <20260527101912.14910-1-lech.perczak@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524175312.10952-1-lech.perczak@gmail.com>
References: <20260524175312.10952-1-lech.perczak@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add OV5645 camera device node and enable relevant components in the
video capture data path, so output stream can be captured, and the
camera itself can be controlled over I²C bus.

This is roughly based on descriptions found in downstream kernel tree [1],
adapted to match upstream bindings.

The camera can probe successfully and establish an image path through
MIPI-CSIS and CSI peripherals, and capture the picture at 1280x960px
resolution, or even more, although i.MX7D is a bit underpowered to
stream this uncompressed.

Link: https://github.com/technexion-android/kernel_imx/blob/ce8fd74abf518dac0a09e8dcb37f3496f6375124/arch/arm/boot/dts/imx7d-pico.dtsi#L874 [1]

Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
---

v3:
- drop the CSI wrap clock override - it is unnecessary to alter it,
  camera can work just with default 166MHz set there.
  While testing v2, I actually had it set at 144MHz by accident.
- Add explicit 1.5V regulator-fixed for the cameras vddd-supply,
  instead of previous 1.8V fixed regulator. This doesn't affect
  camera operation -  I can only assume the hardware provides correct
  voltage anyway, as I don't have the device schematics.

v2:
- Confirmed the video capture is actually possible with this setup.
  24MHz wrap clock actually works.
- Updated MIPI wrap clock to use assigned-clocks binding.

 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts | 67 +++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
index 62221131336f..8982575d3219 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
@@ -19,6 +19,14 @@ led {
 		};
 	};
 
+	reg_1p5v: regulator-1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx7-sgtl5000";
@@ -59,6 +67,33 @@ polytouch: touchscreen@38 {
 		touchscreen-size-x = <800>;
 		touchscreen-size-y = <480>;
 	};
+
+	camera@3c {
+		compatible = "ovti,ov5645";
+		reg = <0x3c>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera>;
+
+		clocks = <&clks IMX7D_CLKO1_ROOT_DIV>;
+		assigned-clocks = <&clks IMX7D_CLKO1_ROOT_DIV>;
+		assigned-clock-rates = <24000000>;
+
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
+
+		vdda-supply = <&reg_2p5v>;
+		vdddo-supply = <&reg_vref_1v8>;
+		vddd-supply = <&reg_1p5v>;
+
+		port {
+			ov5645_to_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi2_in>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
 };
 
 &usdhc1 {
@@ -93,5 +128,37 @@ MX7D_PAD_EPDC_DATA04__GPIO2_IO4		0x14
 			MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x14
 		>;
 	};
+};
+
+&iomuxc_lpsr {
+	pinctrl_camera: cameragrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x15
+			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x15
+			MX7D_PAD_LPSR_GPIO1_IO02__CCM_CLKO1	0x7d
+		>;
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi_csi2_in: endpoint {
+				remote-endpoint = <&ov5645_to_mipi_csi2>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
 
+&video_mux {
+	status = "okay";
 };

base-commit: 79bd2dded182b1d458b18e62684b7f82ffc682e5
-- 
2.47.3

