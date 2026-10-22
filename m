Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679492;
	b=sYnEYa1vFEP/tL5TAK3k8FApIcjaW0IVcBBIqO4s0yHgOUbthQwlZa3D4xtrL6CBBe0J
	 1+JTtXsvuJBOMlgLsNlrNp8iPBt90W31cHv64Chcwi6UiIvuKPq80tGnR++M+A+RUIwbn
	 AQUJKJ6GOUuU7Ys9yLBS2AA+AK0T+O6hjmMaCsIvD5qSrhwCgYj3pvgAwisCCoMs/NinF
	 lrjQnOMjMxlPE3UM57VWkSNwOxYfX4vVessGmnjy5/SM4taE0+AsxrdYklzSzjsPa7sjt
	 HpfArWWm7/xI4GKXTVrRn+wFo7YcylpttmwBqrO9Je+j6DrCYThXM+xIMWbf2xKiowQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hv1PMXCsK7PMPNmoY1kmiP7/3P83OUND4W87CM/jfVQ=;
	b=FVl2tOTL7+JJxgmHhNdDh8XoryVbQHLvqxnLDTglTJqQyzSLaANI56SYwYp8xT7cEQ2O
	 ScXh06ox0Joke+jUXL6eTXQGCzlydSCdLpYpqjt/G163Es37T/xSsvZdBYapIZiUyDw9v
	 FatFdWl41JgNSNHqgDGpR3fiwyjtZFpGpI5ePELqHbZ/x5EratWpOZiNo3kP0Dyw6FhA7
	 Ooju7PPWmJwgkRF3ZlNHnAg8wcX1DchbVujmZNE0WWS2Y5z4a60vIWWE4VtdnvFTWAQ9+
	 0B7z9+6zERuVyFSNQmNnjSCKYGo1XHOjo7P6mp1b+b8texxG6rf5+KU9WmZNK18yc/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=THrAr8Qz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65E760A2603
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65E760A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=THrAr8Qz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so12153455e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679490; x=1793284290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hv1PMXCsK7PMPNmoY1kmiP7/3P83OUND4W87CM/jfVQ=;
        b=THrAr8QztdQlJiSuVtjMROAMMObjYMY5EVcnDuVjY5fa7G6jMjraRg1CnSuikuDJNn
         W07vorucZlUuhJHC+OCGxnFhsei9SoC8jlGUS1jfXov3+lfhNms7jGhRqHcFofny2U9m
         HECeUhexXn9imWVJjGoumv91rtN3YQS5PpwW5pKJuk2LCy3vrU7fYyf/jJfaHWWyqHrk
         S/n7tHwEizGS4rU5n7Dzsw4B0s4y2593SiyuTIw+hZ3gagt4b1xCroGgLNON+47UAG20
         83/0KiT0tX+a6B+JqjLfut5GgdJZVSD8GDHDiQxcNtXITYuNN7KmttQMCs7pxkAIrJt0
         TwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679490; x=1793284290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hv1PMXCsK7PMPNmoY1kmiP7/3P83OUND4W87CM/jfVQ=;
        b=M3MIRcgQcVrMRe52GoTMg25yvqEk4uehuUsT12Y0aWeVIBS/woINMtYNuP59Sbeypp
         Zi9IG9TW69mwng7OnweLmqcN3OdDYIGRl8PoNJjQZ+8al6bNVot3wFPxmCWgNmObTR2c
         D7mQtc95q+EFZow3KspaCZ8qwjzXYsWGE7mlfp4GeJi5EhBLZ2sL/jJUsoSZoJLx1IXF
         RmA9uRD31RTlbogcnoF0S7pIv/rOjGTzycXvDGjys8Q0bpwPn6/qiNST8+LaGmOHCN9C
         x7DDdFuXbaHOO9fBeJAqXaEF5VNGn6rPFRYvbUAm8rHO6D6DgeCBMuASBaEWH9ur4oNr
         vcLg==
X-Forwarded-Encrypted: i=1; AKwUvBzWKyQu44a3OH4CbWnxLLQsGvJW525GPlVG0JTom1k51I3uLbAMwAauF43UHNE0c9Fx1VdIyBlPBmqw@vger.kernel.org
X-Gm-Message-State: AFq9FYKxzeAE6gGC15V+gBWRIVw175T6SSzTZ7v4FaImbERKXGoFcD0y
	s9TA+oTBggcPZPOqLUeZDR3ZNS9ywd4i4YPRYEMt6jDU+Gzrb2dED0CH
X-Gm-Gg: AYBFou0PMfdniMKRqxwkvbpkm7mVEcLyj++RtZN9vgBrv6m28FbNiAa+WptFVOlc727
	nw7Ja0MOHC0KmC8S3y+/Jbw62odgHpBYLfwcW67CpekBp9BXx3hBxOZAdCuq0aral5WAj5tHf6U
	uhwu1zZG5ED8/emhHFMtNpvPDzwpmMbZKRYj1JPuTI130WdIydOPzqWS1PeV5GINO2fw0jqEmSZ
	wriruejfhHg5iVa2NPG9/F7anAEeQh1kEPc+CFPLb65CHDHdxPuLzZpI4OQ/e9WZyYxUDxGPDbd
	e1ifmo2rR7Q9m5ySir7ydt6ugLT3F4sGdyrgXnfZ1D2TCsP/GHco4HI7DSsM5wyps4Eslhfn6Tp
	5UCFrcKEixMY2cI86iNMpIOzBFnOiCH9iE5nKCCYMIthnAsCD9MYyXSIh4ysZFfIcPCPJTO9b8a
	2FptR0OVH/WduJacb+8jNxaSxUMR3xXZRjmjBeLHBfZEeQJ0QM30Zgw4HLLhiYfvRCmTqJLLX2P
	AdSy7F0sFlpvpGiLUn6HE2klwcYq6tkUH93wBLev2qdlo7UzAJJvghvpb5c5vmeLsRUIFTtQFYq
	+KUyd0AMZWewXCrkBJZkVLugHepdPqmekNVAIEEg4+iquYPyBd/iHPulYQ9VR7MNvj6EfLjcLfs
	t
X-Received: by 2002:a05:600c:a48d:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a204bb59aamr44577215e9.16.1792679489923;
        Thu, 22 Oct 2026 07:31:29 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:29 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:31:26 +0200
Subject: [PATCH v3 2/4] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 camera connector nexus
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
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-2-90a30b0b0d55@toradex.com>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The Verdin Development Board, Dahlia and Mallow expose the same 24-pin CSI
camera connector, while Verdin iMX8M Mini and Verdin iMX8M Plus route its
sideband signals and media pipeline through different SoC resources.

Add a GPIO nexus to each carrier description and stable Verdin-level labels
for each module's CSI_1 I2C bus, receiver and capture engine. Keeping the
nexus in the carrier files avoids describing the physical connector on
carriers which do not provide it.

This gives accessory overlays a stable connector and media interface
without embedding either module's wiring in the accessory description.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi    | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi        |  8 +++++++-
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi    | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi        |  7 ++++++-
 8 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
index 3d0b14968131..4cf77559e69b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	sound_card: sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
index 1d8d146d9eeb..51a836324c16 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	sound_card: sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
index 4a0799d63446..5951cd19a84c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
@@ -11,6 +11,23 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4f64c5da8d15..1eb6b5d2b432 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -224,6 +224,9 @@ &cpu_crit0 {
 	temperature = <105000>;
 };
 
+/* Verdin CSI_1 */
+verdin_csi_capture: &csi {};
+
 &ddrc {
 	operating-points-v2 = <&ddrc_opp_table>;
 
@@ -596,7 +599,7 @@ &i2c2 {
 /* Verdin I2C_3_HDMI N/A */
 
 /* Verdin I2C_4_CSI */
-&i2c3 {
+verdin_csi_i2c: &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
@@ -695,6 +698,9 @@ eeprom_carrier_board: eeprom@57 {
 	};
 };
 
+/* Verdin CSI_1 */
+verdin_csi_rx: &mipi_csi {};
+
 /* Verdin PCIE_1 */
 &pcie0 {
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index 0e218e6b8e29..164031d5dd86 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X21";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index 72a4f846d694..c52e46738110 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X37";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
index 846b36706821..b915fbbd04b6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
@@ -11,6 +11,23 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X14";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..300326de3438 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -686,7 +686,7 @@ atmel_mxt_ts_mezzanine: touch-mezzanine@4a {
 };
 
 /* Verdin I2C_4_CSI */
-&i2c3 {
+verdin_csi_i2c: &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
@@ -796,6 +796,11 @@ &i2c5 {
 	single-master;
 };
 
+/* Verdin CSI_1 */
+verdin_csi_capture: &isi_0 {};
+
+verdin_csi_rx: &mipi_csi_0 {};
+
 /* Verdin PCIE_1 */
 &pcie {
 	pinctrl-names = "default";

-- 
2.43.0

