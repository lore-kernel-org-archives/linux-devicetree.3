Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423877;
	b=yBcko+W29NqwvI5YqHU2AvRnXNwjvc5WFdCTr9YLhFt5o2F4rqqstptSY5mLbH2G4WUc
	 d3KRkbjgCBPY48UrpphzNQ9v/le9efKhbA+2HOxbd5FLpMfS3UYwYC4JCZvYwRR/oIRZq
	 kCfyq5xuFqKo0VKSsa8tNR/Ltw08CFB6fKGNsjSdfauHZKlgwvFIEVEVWFARCXM7ouakL
	 mF5cCAQpxJosWLx11riEuMSfd5BpZh54uaJTbiJ6WyuG+iQjGEoP4T8FZ1xamkcLni+qD
	 I0efcoIA7qUDGOqV7dvxqLke3DJqg/BWiK9bIinHDa/jnr2H+/rBq4kNSTgm77zB1WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
	b=DuVeUNKHDhmr0zDjqOjI8OAb/gEJe+XXonEG7oKdxCotD0fCzdW4U+8cvB3MxnbCC/bW
	 JCW3GVLN8MufA9LYJUUNUZci5Rm17a1PCN6IikcdfXeR7axdikvBNg+iUw1Novb+XVsW/
	 vfkUr+ee6rf779oX8ZXJNGlfVqPoJnUbSTCsRG5ucwrDVd8D7gr28cBvLfKnqXv0U84pT
	 814VJjnPeMCwtmJ/Fypo5IeVsnGbe4aAU1lleJeXBkzZ0KETJqgUvLWw69gE0KLIgCHSi
	 pLOy79nvbU/MVhbvYVkpc7PAdj5HBCifH0pHC1I+LvCwqQAMX4q2g2QyRjZcrgd59Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V6hkcPQo;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E8F606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E8F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V6hkcPQo
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1381864a12.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423877; x=1795028677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
        b=V6hkcPQo5LyG/Y2nRJhz5Lpn2o1sO9QbY4WKKWshBLWzDRY1dgOA2mJXSQ9K4jSpKp
         4VrYBUU9Ssx6TzSeG2v4EQe6oePrJILetALDLGIKpXDenxfoGKtKGiVhC67XoIWat3Ue
         O1zqDWAtzgKmwSEUp1TlW+Fu7uDrnX/F8a+FX2tqlQ6FYQOYwsJh5cYsuoD8SGFAVJW9
         kc7NXstW+6Fs6o35xY1jxycMFL8S5hrGGDJQAbFVybQpA6O7lfMj2DcG64G9QrailG6K
         +7PIY0jRGvuehaz3CBpDltrwIoVU1V1WsAVV181dtPGaMUnXok/H4nQdLlIymbVHDRZV
         W7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423877; x=1795028677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnltaZLRhP4fBsVvq0mCqASYDVlLQyGo5RH8flPD4Rg=;
        b=hRQh7ijv2yh9bOhZEVuxOLOYxied6kLbAzv0MzmDHjyQg80MxoHYJUF+hFkNn37jds
         b1r/gb5Kspq6p5Gd9WGjm7Lqsa3Ov/2ovRvtRJBSxC9ro+lnYqI+eM2xkvpskoItmMWL
         qilF49i6UZ4ZDYuCClSbK0InsURwNIuRIz7Gpx+7q+Uj2n9pUeaOXtffeS9zfuG6GKaR
         8QhzSSy2EPwoJZAylE4Xjo4V8dG1RgZroc79lwb1KxlXrzdw9fRqr4+Cq0axEOe/DbVC
         QwuKJJ3Knedfz+rclRVg5bAORQ0Y9g9l/AavDFxaKuJclPmhUNOMFVO58NJ5AaAwmtWt
         oNqg==
X-Gm-Message-State: APuU4Z8zvzZHVAN+WK4EqvmooygbgPV4/AZFo9x7Fv5vSx3VSC7mFl5o
	dvS470KQTrWeWmmjB3YDLCJBRL3tX2Iv1mMdBGjrcGQR4OWJG6BwWqCo
X-Gm-Gg: AYBFou1bFIuOlpUepma/O16qVwMS1PF4B3D7n/mN0ipS5gDCqP+yw5syHcv3fMkjd0b
	bKRfyWV/TZoI5xNgQZdmt708mlrcLna53XTA7bLydTlAIIeeeVmGoONbERNB4SconbNDHeT7dgK
	nZ7XsMscI+hmdDf3BfRPW44LzNrjSL9agEljTr9nX9RV2JLTJtgNAWNh/MeY3thKSVoIycrPX7M
	VX7/lgKZzGvqDe5Oewedsl3VLAfMueSsMM6HfGfusvwjsOfoK0/CRV9aMsqWrMiVbW9I8ljonSF
	VJMK7z8pOqqPBegp71rWTStAXRDGLOdSY+l8lZFjbdYFhWtt16PaCrencZjme/4s3ng4pU9sFUD
	RYzcFLG7rbN7jT2esVPOiff+5vYlYXdwgHyzqOrM9ne6mVin6+ICRhVzByuxKf/RatGuU7cg/tU
	peDvoa2XtF+9TCRVmo7Gvz6eBHLQodV4V2OKT7vC0vuN9TC595yL27pp2eaW1Ue03PjecuxFiRG
	iVmUBAnbPRHpK31SQfIfur/FsiSEA3YUiBPQpDvBepxvA7eVeaJpoEn8cQdTh4C32E7zAMNkUl/
	smeRZbxrqlJBpaa7XJ2q2Jqf7486D+LApg==
X-Received: by 2002:a17:90b:1f90:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3b182f5a142mr3250774a91.59.1794423876623;
        Wed, 11 Nov 2026 11:04:36 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:36 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:59 -0300
Subject: [PATCH v2 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive
 Touch Display 10.1" LVDS
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-3-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=4455;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oe0gNHFEkUnU4DGWTju+MJg1QgwQQbBq6PPLVxbI5NU=;
 b=lhQ2QCeAMTxHxA6IWvu2h/Y6r9QtaPWxJFG8efc2jLx/HSL0wnuHil7uHqrWS5Po1Lq2DorDn
 CGVUtSIkP2MBnzpcQOF+hJQg3ZiifuRvsFb33h7G4Vrw2sWkihPB98K
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via the Apalis iMX6 LDB.

The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++
 ...-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 53 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 13 ------
 3 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cc0f5f100892f..3b69669b27129 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -164,6 +164,10 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -320,6 +324,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -330,6 +335,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..a84114e1d3fba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
+ * on carrier boards with a Toradex standard LVDS display connector.
+ *
+ * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel-lvds {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3_sw>;
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds-channel@0 {
+		reg = <0>;
+
+		status = "okay";
+	};
+};
+
+&lvds0_out {
+	remote-endpoint = <&lvds_panel_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index af038ac472261..8f5a9ab1f20fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -95,18 +95,6 @@ lcd_panel_in: endpoint {
 		};
 	};
 
-	panel_lvds: panel-lvds {
-		compatible = "panel-lvds";
-		backlight = <&backlight>;
-		status = "disabled";
-
-		port {
-			lvds_panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	poweroff {
 		compatible = "regulator-poweroff";
 		cpu-supply = <&vgen2_reg>;
@@ -735,7 +723,6 @@ port@4 {
 			reg = <4>;
 
 			lvds0_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
 			};
 		};
 	};

-- 
2.43.0

