Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168948;
	b=bb5ZVQQn98TpSMebK0UyVbnQ+PAoBcZYodok4Uc9hSI+Frn9xDIbrSaybjAS52vfSoSp
	 WSqd+NZv7thgmyCKk2IIo9ZUXF+kLbCB5KCxaB0JBqHTiZX/BNh+84P6ppZZBLiQg09DG
	 1M71HHGmiKZi6nl/lSCeBky83ltj8jlNnZGkgshQ0j5vKMbF1K25e4oKMchxM6PPg9Xpg
	 CKVH/2D7SyaAdSvr6DDYhoRvAPsk+5b+TqOmOgn/pWWn1xiNj5N2HIi1Edp7+6KN2vjuK
	 oz/bkcalEXAtXODOelmMbZab5XLfdoC+OrljldnUoT2TCGLDD7YPellcnj/xNQSq7kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=+/Nvrr/kmurSuoSNX/nrEDXJoBt1+szlAZyD/QS6ioM=;
	b=im2K66lVbYgzGuHsbZXHq4kfa/3TwHZ55Xbz0xSR+f79DPbU8bfAEsdwpYhtHtqBSiWj
	 5Q9MoPBYCCDI/+Ztno7TsmyS63T/aq7DGLkFfyi+Av1JpNtaL6uoxEQhfiF7F42jxW2Mm
	 iuf+FxhVfG+0NPW1DSaX+6AtcE9clMJSgclfljC+l4IZcEOUv5AnN5yag7Xz+dYXMryMc
	 j4/ZDIQBN3rtArbPV0cnfvSZVrlYZdB2Ztkag3PjlFEE+dIEPEOhetnlycGN7CVs9cs6p
	 8yFvRx4fkqUjmeB7fGaL4Z02lfPVTnkk4LVKT/SuD5bhWb7ADyxf8CVNMRjGZS5Pgcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=KBXagnVY;
	arc=none smtp.remote-ip=84.16.66.168
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA093606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA093606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=KBXagnVY
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jW9qb00VCzmQt;
	Fri, 20 Nov 2026 11:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1795168938;
	bh=+/Nvrr/kmurSuoSNX/nrEDXJoBt1+szlAZyD/QS6ioM=;
	h=From:Date:Subject:To:Cc:From;
	b=KBXagnVYzai5Hyt8cvC07l1zCVwAJfI7bJuefebIm04Yswvtlg2Oy+r/VCdrllwGA
	 a1mFXDsDmRBRIcSGtmPnmvsUmUL5RqBFMEVM+bsmpOW5vCdbhVgaYN5Fq5jYB7UQ/U
	 nqer/b7iAiYvdgu1vvC9aj5LfKEqhka6bmue6CpmuzqR5KtRK/s7MxTMGYtNInhpau
	 FH6UePtEPU6aiERO7EoYhz4GuXvzETXqXHp5pe9EH7brhHCi/NlYiHvr+mgzP8Fwrf
	 yMx86+BQzZLZszUb5O7GWwqlzKF0vBzwCevjlSVV47BvPgCk0Ud84XEzaFwy09Xi70
	 GJlLx7/ONkYlw==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jW9qX6x17zX7X;
	Fri, 20 Nov 2026 11:02:16 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 20 Nov 2026 11:02:03 +0100
Subject: [PATCH v3] arm64: dts: rockchip: support camera module on Haikou
 Video Demo on RK3399 Puma
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
Message-Id: <20261120-rk3399-puma-haikou-video-demo-cam-v3-1-5183b29527f4@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOQW7CMBBFr2LNmkEZGxImK+6BWDj2pHFRMLKJR
 RTl7lXohmW7/NLTe3+BLClIhlYtkKSEHOIdWmV2Ctxg71+CwUOrQFe6JqoMppsxzPiYRouDDbc
 4YQleInoZIzo7oj/VndSGLZPATsEjSR9e78bl+rvz1H2Le27ijRhCfsY0v08U2rj/9AohIdsDe
 25Ohrvj2Q2S0rz3Aluv6A8j/cmokVAasq43VdOz/jSu6/oDSEF/tTYBAAA=
X-Change-ID: 20261103-rk3399-puma-haikou-video-demo-cam-d86be639a91e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The Haikou Video Demo adapter has a proprietary connector for a camera
module which has an OV5675 camera sensor and a companion DW9714 focus
lens driver.

This adds support for the camera module on RK3399 Puma module fitted on
a Haikou devkit with the Haikou Video Demo adapter.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Camera only works once the ov5675 driver is adapted[1] to work with
24MHz MCLK. With the similar work done for RK3588 Tiger[2], we now have
all our modules supporting the same set of features when used in
conjunction with Haikou Video Demo.

Same request as made in [2], please only merge this once the OV5675
series[1] is merged.

[1] https://lore.kernel.org/linux-media/20261026101646.2450051-1-heiko@sntech.de/
[2] https://lore.kernel.org/linux-rockchip/20261026102027.2451025-1-heiko@sntech.de/
---
Changes in v3:
- added missing #address-cells, #size-cells, reg properties to
  &isp1/ports/port@0,
- Link to v2: https://patch.msgid.link/20261113-rk3399-puma-haikou-video-demo-cam-v2-1-e71acf307f92@cherry.de

Changes in v2:
- added missing #address-cells and #size-cells to &isp1/ports,
- Link to v1: https://patch.msgid.link/20261103-rk3399-puma-haikou-video-demo-cam-v1-1-9a49d97839b5@cherry.de
---
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
index 141a921a06e47..925b4bb88f1b6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
@@ -16,6 +16,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -100,6 +101,12 @@ &i2c1 {
 	/* OV5675, GT911, DW9714 are limited to 400KHz */
 	clock-frequency = <400000>;
 
+	focus: focus@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0xc>;
+		vcc-supply = <&cam_afvdd_2v8>;
+	};
+
 	touchscreen@14 {
 		compatible = "goodix,gt911";
 		reg = <0x14>;
@@ -122,6 +129,57 @@ pca9670: gpio@27 {
 		pinctrl-names = "default";
 		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_LOW>;
 	};
+
+	camera@36 {
+		compatible = "ovti,ov5675";
+		reg = <0x36>;
+		assigned-clocks = <&cru SCLK_CIF_OUT>;
+		assigned-clock-rates = <24000000>;
+		clocks = <&cru SCLK_CIF_OUT>;
+		avdd-supply = <&cam_avdd_2v8>;
+		dvdd-supply = <&cam_dvdd_1v2>;
+		dovdd-supply = <&cam_dovdd_1v8>;
+		lens-focus = <&focus>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cif_clkouta>;
+		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
+
+		port {
+			cam_output: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&mipi_in_cam>;
+			};
+		};
+	};
+};
+
+&isp1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mipi_in_cam: endpoint@0 {
+				reg = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&cam_output>;
+			};
+		};
+	};
+};
+
+&isp1_mmu {
+	status = "okay";
 };
 
 &mipi_dsi {
@@ -145,6 +203,10 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_dsi1 {
+	status = "okay";
+};
+
 &mipi_out {
 	mipi_out_panel: endpoint {
 		remote-endpoint = <&mipi_in_panel>;

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git master
change-id: 20261103-rk3399-puma-haikou-video-demo-cam-d86be639a91e

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

