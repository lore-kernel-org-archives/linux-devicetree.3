Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25222F0C74
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 17:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779645212; cv=none; b=julZaUkBuZskpZFo7+WeLI22aLF4LjpKbbAJ7PmJw3cbjTc0g6qCRzGjNYF/Ou1k0IfRQJE4edeZgzUI2xl25ootoA4dXNSP8j2wqpI9qIvuJ25SERJH2AbDfvkHBDZNW/4idDn1yK44Y/CwWJEIBbeZ9i/pNIqcVC5j8x7uZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779645212; c=relaxed/simple;
	bh=RIIkHBh6BPzSisFnhl/7Tmt2+QHkyhNR0tNYKg+Cnq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T/RdG91X27A7l7vhdkJQ9blm8jyrfrl3n1j5cSgTZwYT3vEFg7FH5/cgdDjlQdgg08j0nI2W7YoelS91yeeN53CoxsV7BCwN3YNZKwXl2rW2bDB/xZIP6sFVhaBhQmj0Jnol+yYFPiUMoinzAm1ECaVkdo98tKh8fNBgjaOYTwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpU0t+4+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpU0t+4+"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso11433040e87.2
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779645209; x=1780250009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xuzjGJ4dL5LPMOZspbodS1eRRrvJ2J4imKwWVHJPTkk=;
        b=LpU0t+4+BesxK7sLgWLKNLHoCS9Q98Wvg1AMsbWb0PJTVYaYkat0K/YZbik/lSL+kB
         rDud5kNAQ+G1KsAKCiLwN/UyumYq0jjXUzO2CL5t68TB54RnKajOiLpH9+GIbPERh7Mc
         Tzqd+uc+yGH+8LkpLNrduKBVpterpjdUEqZ6RNKe9ehn9/6lVHxPjwjpvs7NLR9iMaQO
         tVfhw9EIzj1Z7k6ZLNpDmCIF7/lkJe68A2NThCUR4R8FsIA1e5z552mB+sN2SxdZ1x2P
         mnCOsO+mocbPskFwNEas4slpJKbN02YkWHzrWAt3wvQ2Mk+iDvNfnoNvuPWU1siFJDrA
         rzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779645209; x=1780250009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuzjGJ4dL5LPMOZspbodS1eRRrvJ2J4imKwWVHJPTkk=;
        b=paiUhduBjgXDE87yBa+fLW0c9sex1FHEiE6EXc/fEAU8He2EvHojgg9Hl1xr/ZstH8
         uC4d0vH70skdyIcuLfv2RAszVsC53nr9GC+FCOC3trM/83biEtTpdMJJd92hJh8JEV3i
         5w1f7GllNVkyRKRHs6b+fF2EjSnKWyBwmpJC5GPcRUaekQRi/5sewaLYkZE+lS0RNRUn
         GSexG11yTfpEqKa8icvMVFMg+WSktWfP/jf0A0+wnU9RJfDhrwRi70A9u8hzaA5LoGew
         ermNbsJUlqvdMXVUsd9jGriZs9u5SQLuO13OLLHSgwSqWNdsvsXJIhynhC52C8NlQLgr
         Nu0g==
X-Gm-Message-State: AOJu0Yx2ylU6lEkjgx8vBwNXRs3NNof0n2pOWDRQZ8H1GSzk06EORXNG
	nshFieTLoZjbVzy4mt2YYbpnbfqE7fmdVHEB3A8znp4sKxygF3XPnyNZ9mEWAXiz
X-Gm-Gg: Acq92OHdqObjF5GMURzzGHb2gStxGzBnLoXEZL2vUN0bJv2lW/RQNvZ/Kft0G2gZXwy
	Mj/+yMUS8k8xhzLT01JMg98k80SiHZRs4dkt6hwaTdyK+KHlddDLXV1Czdl41HRvLMCvpiUe8FB
	K++c/jJEM+4AK6hVBJLeMWCZqb61yfsuDQIluaE74WVxvAIB4GCpjJRH4M0wBaVwLGxkbxocDEW
	udY/oaD7MIwY1pYzkeIMCPB6Utw34EgKpGRlUrd/Ts5xVsnjD5UgrOt6zk2tixkUZ4vngRtX8mX
	Cs0KvVkkojVtn/3EdSmZtY5d25iF3IvO/LFAU6n0hHZax/884KUtTnNZJVRtNlUTG5NVTzkyGJW
	ga5wO3BwKi02OHZPdHWt2sPAgENnCdhzV/17oNIWdnkcX/OmtKUx/N13rmm8n5M3YuMk18aMN+P
	jwytI=
X-Received: by 2002:a05:6512:31c4:b0:5a7:4a60:1454 with SMTP id 2adb3069b0e04-5aa323a93b2mr3709073e87.33.1779645208574;
        Sun, 24 May 2026 10:53:28 -0700 (PDT)
Received: from rafiki.local ([2001:470:6180::e68d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf96cbsm2063846e87.84.2026.05.24.10.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 10:53:27 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: imx7d-pico-pi: add OV5645 camera support
Date: Sun, 24 May 2026 19:53:12 +0200
Message-ID: <20260524175312.10952-1-lech.perczak@gmail.com>
X-Mailer: git-send-email 2.47.3
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
MIPI-CSI and CSI peripherals, but so far I wasn't able to transfer the
actual image, probably due to pixel format incompatibilities between
the camera and CSI peripheral drivers - yet I'm hoping, that submitting
this will eventually help getting full support.

Link: https://github.com/technexion-android/kernel_imx/blob/ce8fd74abf518dac0a09e8dcb37f3496f6375124/arch/arm/boot/dts/imx7d-pico.dtsi#L874 [1]

Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
index 62221131336f..b36936ecfa4b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
@@ -59,6 +59,33 @@ polytouch: touchscreen@38 {
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
+		vddd-supply = <&reg_vref_1v8>;
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
@@ -93,5 +120,38 @@ MX7D_PAD_EPDC_DATA04__GPIO2_IO4		0x14
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
+	clock-frequency = <24000000>;
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

