Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B743859DC
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791752082; cv=none; b=TdY8xkuN1Gc2Sf60W4EDPbKE0WDLXiSMiXkwIO7SRgIgo7+nZ14FS5Nb8XIqVz1GwJ1HD8ruRIO7nFQ3HvS4atIc4Zf/anZrbL3robtL5YsspLDZdoAYnRAQ8scLkjHdvOhNe3sWnJg1rBBBtBUXDT+sGq8tRjWtyJUKI9Ioy+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791752082; c=relaxed/simple;
	bh=YohP8B9omEKNJal7JqSezkCGArULtPbPg4hBO+IwlSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rMNL4FtzOhM++wq4CRheRWkvs1WkODVgyS08c3dHPg/Gci8BY6JSBqjlx84lLcZQU71X6xYkrWtTvoTyTxJT+dO9pQ+njSXcevIJW4Io6IpAstYEEAa9oQdsYwlrAuTONliGY314ile+Dl/faVmuzr+Y6m8bboO7SWwyZKkA91w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=pkX4SMZ7; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="pkX4SMZ7"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e6eb77f0bso136450685a.3
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1791752079; x=1792356879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ezoGfDQtxAvSalgmJqsqkDd7nhdWtwbdJ4Gv/LTkYA=;
        b=pkX4SMZ7RfgRvlPHIwXzlFsSo/PjC1St2iL6XA6DV4b7A3JttVT2+BCDbRbLtXHE33
         F/aslCmGxq1cWHk0i+SCuiRvmkquLOKnNVS7EQO1fqRRPudKLHxYGVOCxf1im9i7rFOf
         47J7jyOOHq3fa8cE1WoYoMjKyOxkSFk8tL7CYQZSfZOEAawHxdMrQ0xwz88K6Ja8a9Xg
         ylSpn8TLwSoHIVwTgaiSfsYG5wCqvf7ichR1ZtODVdfgeyEIBWwuhQ8Za1W1ijdwtos1
         fhQX6dVUbFqqjt6ev2pDf/nKePhPzXWz7G4Qx8b0t9iQCua9lhUY4PH/Rom95CCkLO2M
         Dp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791752079; x=1792356879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ezoGfDQtxAvSalgmJqsqkDd7nhdWtwbdJ4Gv/LTkYA=;
        b=hNP66cmxmrqasLpbHFK1nE9qlxsCHTnlCE0ulESfH9zYjQs0UFC8kyuGa+MVsq/TW2
         EqfgiPOXyKYJI23RkU+p26NRvyDacypraqyj1IuKKxRO2D3GleI7QAlGDR48A/SStkpU
         TUSkcJpUGrT69yAGoqUmN77dnKTuxQWKAoAdAdHiFAl0ITDele8yWbqHtTcIcmWz3Qcl
         NAjD0N7w+22qSmCfaJAc1XFsfB7o9QKUKEAXGbK7iKpOD90QighIlAfKlrPay/+xzKei
         z8FWPT+Lv12l2xLTXEBRDJLS426NeW7CcOpUF+AvoLUH0KZmp8tANeD/BJn/2KhGF5c/
         G0zg==
X-Forwarded-Encrypted: i=1; AKwUvBzZbS71Q+TNyBbpGHKdo1Wi095fwhg31xkamIFFn6o3ZqPHsvh5b6NPzUbJWkVgWddIz+cKIP9aAR24@vger.kernel.org
X-Gm-Message-State: AFq9FYLnnOm2VFYL7Od5pi4/FpxbnEwhMtLP0unEGPzVbVJU8MWzTi2y
	PayJt118T202QwXy2uNG6jeh2QXuUztJl7s6OJ3Nl8SyPChXkFDvWoF3z2OoWb/XKxo=
X-Gm-Gg: AYBFou0kwXTO4HJdp/1zetdhaOrsSncPvQrvpv+bCpFm1UY31Iw8OezajM5hEuYNSAL
	5nrWIbosmeKVUyKacGnY5C0XLhhalZH4pQ+8GWLV385C4DOqJfcjFjO/8HziJKYKjyyGukQUVO4
	u7ueVpMvKpHnYnjwsY+UTu1SNI4uTuwWdkIBX/r8a1l3Q2QGuDhafbS8znEGHOwQTc/uHlIRmah
	3zs4E1R2giLSBHD80R3DiRDE+MAtlNe/rdxrypQOdR8urGHXFStMnf2ffChUWRdAiMVKcim3I35
	Taq7VBQCNQKnRCECHX2VEWalRiyKVxxv+a6Hw+AKspEwJYbJM1m1dUVqDYkV1Yk/GFWETlmJqMw
	FS5EG1MT16J+d+sSTpwes1K3tkx9GhA3jq+te+GdtyD6DtgcuM2l49YpdHeI195gkA7YM4LIHbf
	NkNubMsYhdURkF6BI47GbFz3Ldwi6ZfOI+geljXEHaQQa3WLM=
X-Received: by 2002:a05:620a:4692:b0:93a:2150:ec06 with SMTP id af79cd13be357-93ebd1f29d2mr1341041285a.31.1791752078869;
        Sun, 11 Oct 2026 13:54:38 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0e9sm712617085a.20.2026.10.11.13.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:54:38 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera
Date: Sun, 11 Oct 2026 16:41:25 -0400
Message-ID: <20261011204125.8357-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the OV02C10 front camera on CCI1 bus 1 at 0x36, fed by MCLK4
at 19.2 MHz into CSIPHY4 over two D-PHY lanes at 400 MHz, the only
link frequency the ov02c10 driver offers.

The wiring comes from the Windows driver store. CAMF_RES_QRD.bin
switches a single rail, GPIO 91, before releasing reset on GPIO 237;
GPIOs 235 and 236 are muxed to aon_cci there, the CCI1 bus 1 pins, not
rail enables. The sensor's avdd is PM8550 LDO7 at 2.8 V, which the
firmware leaves on, so no resource file votes for it; the module
regulates its own dvdd from the rails it is given, and the supply is
named as on the Inspiron 14 Plus. The CSI PHY file votes LDO1_C at
1.2 V and LDO2_C at 0.88 V for the PHYs, which is vdda-1p2 and
vdda-0p9 here, as on the Inspiron 14 Plus. MCLK drive strength is
2 mA, as CAMP_RES_QRD.bin programs GPIO 100, and tested streaming.

The module sits upside down in the lid: with both sensor flips on, the
picture is upright and unmirrored, so rotation is 180.

The white camera indicator on GPIO 110 becomes the sensor's privacy LED,
so the V4L2 core lights it while the sensor streams and takes it away
from sysfs; the comment waiting for a "camera on" trigger goes, and
panic-indicator stays, as on the X13s.

Assisted-by: LLM
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
---
v4:
- Add vreg_l7b_2p8 (PM8550 LDO7, 2.8 V) and put avdd and dvdd on it, as
  the Inspiron 14 Plus does (Aleksandrs Vinarskis: the schematics show
  the 2.8 V rail from LDO7B; the dvdd step-down is on the module).
  Laurentiu Tudor's unposted patch for this board wires the same:
  https://gitlab.com/Linaro/arm64-laptops/linux/-/commit/d79e44083197b263ee59dc3521a2b16ad2a12bd8
- Drop the two comments on the rail Windows switches (Aleksandrs).
- Message: the supplies paragraph, to match.
Bryan's Reviewed-by and Abel's Tested-by from v3 are not carried: the
DT gained a rail.

v3: https://lore.kernel.org/all/20260926122533.8200-1-lnicoara@thinkoid.org/
v2: https://lore.kernel.org/all/20260926122032.4847-1-lnicoara@thinkoid.org/
v1: https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.org/

Depends on the x1e80100 camera DT series, v7:
https://lore.kernel.org/all/20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org/
and on the CAMSS PHY API series, v20 patches 5/6 and 6/6, which read the
CAMSS endpoint's data-lanes as 1-based:
https://lore.kernel.org/all/20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org/

Built and checked (dtbs_check, W=1) on next-20260925 with the DT series
applied. Run-tested on 7.2.6 with the same board hunks, the CSI2 PHY
driver v18, the PHY API series v20 and patches 1-4 of the DT series:
the sensor streams, twice in a row; LDO7 is off while the camera is
idle and on, with avdd and dvdd as its users, while it streams; the
privacy LED lights while it streams and goes out after.

Bryan, happy for you to fold this into your next version of the DT
series if that is easier.

 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 120 +++++++++++++++++-
 1 file changed, 118 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ad62350ba670..39d76b9a63f4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -10,6 +10,8 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -46,14 +48,13 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_indicator_en>;
 
-		led-camera-indicator {
+		privacy_led: led-camera-indicator {
 			label = "white:camera-indicator";
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_WHITE>;
 			gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "none";
 			default-state = "off";
-			/* Reuse as a panic indicator until we get a "camera on" trigger */
 			panic-indicator;
 		};
 	};
@@ -151,6 +152,20 @@ linux,cma {
 		};
 	};
 
+	vreg_cam_1p8: regulator-cam-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_CAM_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_ldo_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_edp_3p3: regulator-edp-3p3 {
 		compatible = "regulator-fixed";
 
@@ -436,6 +451,13 @@ vreg_l6b_1p8: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -674,6 +696,76 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_in_port {
+	camss_csiphy4_inep: endpoint {
+		data-lanes = <1 2>;
+		remote-endpoint = <&csiphy4_out_ep>;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+		/* upside down in the lid; both sensor flips give an upright, unmirrored image */
+		rotation = <180>;
+
+		leds = <&privacy_led>;
+		led-names = "privacy";
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
+&csiphy4_in_port {
+	csiphy4_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2>;
+		remote-endpoint = <&ov02c10_ep>;
+	};
+};
+
+&csiphy4_out_port {
+	csiphy4_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy4_inep>;
+	};
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1102,6 +1194,30 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
+	cam_ldo_en: cam-ldo-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_rgb_default: cam-rgb-default-state {
+		/* 2 mA streams; the sibling X1E boards use 16 */
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio74";
 		function = "gpio";
