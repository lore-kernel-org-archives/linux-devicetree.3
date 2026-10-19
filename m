Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71D4DC53E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405256; cv=none; b=DuSms0g9Ksg+9+8mjhX77TWyBfVc5BF+Ru0wyHawOMRjekdRr9WHMIrcfVCJWortZU+pUT9HbNkAqp1kbDvYr2uI2Wp0oaUESoJVoviRSwwTCw0jmczOOwfp9JsMg6mkS19iuUFZ/hv2P1KSUXQkD68/RYhSGG+O6l7fJ3nfxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405256; c=relaxed/simple;
	bh=x44fXUGB1hEoqTJKZxN5NuqcekOM+6AMF+EnFq/Ok/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o0WoA3+nwrTWmqXgp3JG9hmoJYw80dB99NqEc4rOKE6XwuQg2PUlwsWLt5BmB42MRnnywEGg9YFRbdx/XakOhi4gDfwQGxt7909WWm2IPFSWfHps7MY6xJ+Gwl+9Qk/jBQiu8O+arRk8rd9sO0aUaBViPt8xK2ugwKwMRoyWoaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtY8ruRp; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtY8ruRp"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-17bc533fda3so2112420c88.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405250; x=1793010050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgK4Knz1UTecYHn0SL3JT3fee9wk3Cp4TEKus9TadaQ=;
        b=XtY8ruRpsBoeIP1m6BFyy37kFBfIjfcfAapt5CjkUDkXQZ4cDmQ/DXOmzSZJpR34Po
         Nzsv//Rw/DEw/udcS+EVpwZFwVRM3hkSjxrJN/MfFWe6tbSDPreLRJGTWOo0osG68wLv
         bI6eQoHZda8cLGzCcjfQijippFYxinZXNNXl6DK5AK75naBa2zvoXYhZtrcZArigmE0g
         bz7At+tytFX84eM5J3NtfTsD2kKO0YRkoOhAqNQgMxpZSFe2brK0W3uBD6fCyYgVWM29
         VqcAlVK1tWUDhOSEqDctSsqoeoSq7jKqUTjpkIbxmA7DxRwJZvZFDx4DlyJXNw6df0h8
         3ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405250; x=1793010050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgK4Knz1UTecYHn0SL3JT3fee9wk3Cp4TEKus9TadaQ=;
        b=Dg3jMQ6cLklN0hJ4QkXpX0+7bBWqMSpA1A4phwHH0awQ6MuA5ZGVppXp+xt8ysaR2I
         MAGs1AvM07XzFg1C7KVVWDmXT1yMzR8dQEC/2PegNWsVj+eD+2ftgyJ1fC9GOsMU+Via
         YPKWWGuGN2cy/ziU/W0O7OGuzxR11S0LvcdEwPtxI3Af8snMesIQbvtEQsS5Np0Mywoz
         HIFKrMUU6HkZB7yQ3cSPuGpSig9417msaAmP4pglvrXDR+fw4QJs80IymjBTfes2MoVF
         X0bYwx9QYoKiDPQHcEMIvFmGvFHZWjGKWL45eZVtjKspwb7+Gxo8ln+QSyzAdSFkRf1l
         6HJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzRWsKp5Kx7m98N1rtZcmGYTo/26MFuwJOaOQQSsdNcjESZ57BrOJj1Vd/5aN5KKkkOcNZ3MK91N6D@vger.kernel.org
X-Gm-Message-State: AFq9FYI8xtNtMT3vdtErlJgrCutqrcxs+wfSUkgo/eXG7YMiBdJhR2WJ
	UHnMWqVyHKNIxXUd9p1R7EJirS3oIH7ubg98BmCZI8aG+gTLuKTk4DnE
X-Gm-Gg: AYBFou0nRmwzIT8tuKhXOuzDPn2Dvnq3fU6LVLoGImG7FKSi8IFGI9L3IBWX6YWedqd
	dswHOw1dBB4X8Hd45QZISKJqrR0vqZDEQ7r4g5r5RnHycEdiALYpBAFdj0v6UifkKizdNbgSuF4
	c7AxNvsriruHiFY8Atvt4SJRnc5fQek7klo/LIReBDafrqajji7jdoozJOUijQmSSRFjbWa3xfk
	Wg0Q4+rLXgAGtQ0jXGoPgIP3OXNoGDYZPDQE8t7MCMubc3rVOuJ0+HT+fgGSqv14fUcffZG3KS0
	aPIwF1Hzx+UEUVwxISraUQ3dRQj5MkgD+3kbiBDVjZ8+WZjHswhMznnY+iWa/5idQnxAGdjl+/y
	+uUz3TiCP+LwJUSuHxWaIU8KArcurpbdqTNYySv5y/e0tWfKEj8qFbbtFFSE+ERrPem403Q9kFx
	XkkMjgUJuVCMEJEVIO0hXt+TnAovhHF2pqpozL0Z8qh863eLeX6ds14USx3HAAdlGedOb9be3Bl
	5Q=
X-Received: by 2002:a05:7022:ea9c:b0:149:49c:233 with SMTP id a92af1059eb24-185138b5a78mr9592984c88.27.1792405249689;
        Mon, 19 Oct 2026 03:20:49 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:47 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:16 -0300
Subject: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=4062;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=r+aca+myZbkHcW0Bz/oaFLZH6+eopUpkEgtw7VP1FW4=;
 b=Zvh0iDVRcy5Gtps1SXd63pWalIOszDSoQM1rurde5ryRdO6K2rMFmCqUHSbRjy9tbneq4/t3j
 sSjRGYh4TiPDpQo5LJT494T+Ww6uL06s9RSdMfWvljaiQEMcGs5xrW/
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the VGA output available on the Apalis
Evaluation Board, which is driven from a parallel RGB interface passing
through a non-programmable video DAC to a VGA connector, without VESA
DDC I2C signals.

The non-programmable video DAC consists of a simple resistor ladder that
converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

The overlay is also combined with the various Apalis Evaluation Board
device trees to provide ready-to-use DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index b5fad2ba764c..9c218260fdcb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -60,6 +60,22 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6q-apalis-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-eval-vga-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-vga-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -186,11 +202,16 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-vga.dtb \
+	imx6q-apalis-eval-vga.dtb \
+	imx6q-apalis-eval-vga.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-vga.dtb \
+	imx6q-apalis-v1.2-eval-vga.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
new file mode 100644
index 000000000000..991c2b7c2777
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to a parallel RGB LCD interface through a
+ * non-programmable video DAC with a VGA connector.
+ *
+ * The VGA output is available on the Apalis Evaluation Board without VESA DDC
+ * I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	disp1 {
+		compatible = "fsl,imx-parallel-display";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu2_vdac>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interface-pix-fmt = "rgb565";
+
+		port@0 {
+			reg = <0>;
+
+			vga_display_in: endpoint {
+				remote-endpoint = <&ipu2_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			vga_display_out: endpoint {
+				remote-endpoint = <&vga_enc_in>;
+			};
+		};
+	};
+
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					data-enable-active = <0>;
+					remote-endpoint = <&vga_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&vga_connector_in>;
+				};
+			};
+		};
+	};
+
+	vga-connector {
+		compatible = "vga-connector";
+
+		port {
+			vga_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&ipu2_di0_disp0 {
+	remote-endpoint = <&vga_display_in>;
+};

-- 
2.43.0

