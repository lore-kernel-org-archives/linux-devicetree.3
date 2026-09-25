Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE4409285
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359842; cv=none; b=O/g4RKm0ntZcb1IxHcCILhPRliMO4+FCpaHI/ON9oCTX2X//8Swm8Z49K0ooATTnZP2aGOlkmlLZV9PBW5657lsX7cMfvy96iGUCQCDtaheQ6f+L9fhAsJ24O3SGZLgpZsl00xS6Y4HKN501Qy7ceopurbE1XjhpfM6QVoRostw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359842; c=relaxed/simple;
	bh=yiPfRUOL+OZ9/QfnnwJ5h2P+82mwFzI3sPg4U6hlGHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQVB0gx5Fkzq05TnjLOPHtlOgAk3WSejDEoRJJHvCUb6s+B2TLUVIN8RvZEXRWgKGj6QfYdk3k0Yy42OPGzh6NSIoSapw/49r4i4a/5dN34JoVm6SHOsNN06RVH6nUU1/pv2/6mc3H4WjcQ7yrplofujW20Y/xnBYlEq+Cl71Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=M6FNnlNy; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="M6FNnlNy"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93a2a8c29c4so119431385a.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790359838; x=1790964638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yos8fjWl7KQaz4RsBjbMVq1d086QRYEcPbUkmGEv6p4=;
        b=M6FNnlNynhyrLUtOfOa8OYgFCVoNnZY6ukZGi56t0okbTSbilBbFcfFM2uNh3CaVpm
         42Ym7355Gj9o8pMjtCte7UiW0xbftWAcxovzPa9WsnNm3pCCNgUoAF9WXQ33j+4DmPvn
         kezYzVmQ941RzwkmpBpDAB/txByCFpXsTZ8lcwhnKsvYxR/SaAhGykn/fOFC6iWSk9S5
         RlrcnUxRpmZMHaBUbXsMUEPseqJhARSEm373k/UEK3jfkqQxwB2P5k98KIEuQBihLeAF
         tFT6ySrqwB3U1jYK5sSpIdhSQ2zuFTDLkvd3lMavmbOnckhUxdYojby4m9oIS67/8qHy
         uaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359838; x=1790964638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yos8fjWl7KQaz4RsBjbMVq1d086QRYEcPbUkmGEv6p4=;
        b=n5KXmXKC5/63KJW1xmxgC1Yb2WNI38rM7Jv5e05gkG5SS1znVkcfAt3jl5M9llEciv
         Hy4gjXz4EDZz6bZhfUSok1DK9pY6/VuY2LSX9oXu4F8x4IcyRIgRuruOUYjqCszf+yjA
         CLMRhVKqPWv0mZybWl0rscctL+18gcIpMDhRqCRMu6bOapOO2v4ZQxDIiSNBmqtGxms5
         tpafn/RQAd604uEYRphwoZFaEm9351GX0v2l0gWto/mwxALf1rATUn+Ytjq2q27TCobG
         sroqll2Qh/sikt+vuNQo4zPpYO7AadWTklItJIO4JExgDVPlmM89JhRKiRpvIg75cvCe
         DJHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIeS/XYP4u+DxvmCMIND4R6qeQUOdHzpuF4G+CQfmfsofQMFThNfbB5XocAb9G7cZFof/FnoD7HkRH@vger.kernel.org
X-Gm-Message-State: AFuF++l+DTOEg2CI2SMkIz4vJhVQfXIAw3Ya42uFO2aERFSuWrbGQ9Zg
	OyQGb03Lci85mvoKZUjqWYzhe+2oWd9j7NIk2Ap3VzoYZ6khkZ6NopXI+8Q9FI7ybf0=
X-Gm-Gg: AYBFou3+xL36T4udwWm/pDiIhaB/x3Jdx4NCXzWLjGOoRl/sbGsQpiFlFlxsUoPrxJt
	fvf5d4IODoG/2Mm4ByFPgeXeUg4bOREu/6ggHYKJe1j/YL4sHmZ65dTG33yw9KZ315qhpsdsB87
	ePwIOBOjo6RCMeYsrFOPxVZpO1zT1ByL2Tw81RUENgn7WGGmm++kTWgbeTB9HaIzIJhprxveWUj
	U00SeiJ01jHmYGbEwn0hi9c2lhDCxqDbrsTlbp9T/xQOOxHbj+CfgcvWKu7ievfBUYx/ZUv4lkv
	iRZGiMIMAI38Uz/mz8jhlMDvJeicUoz1/m/iIIJSvsl90R4Czrd8rnYem4JpNXJoHMKlO8wO/ts
	SYED77z82GpVq8r1012/Y232zUgMgp2b5GbberoH+EYWKeU0+nhqLrMTL9IUFwYjeFpEyI+PGhe
	AdIBw3Q5L5YK/NUSQxkxISXHszAWXzOnP0Rk9xY+AGLIPXmwQ=
X-Received: by 2002:a05:620a:2683:b0:939:3100:750c with SMTP id af79cd13be357-93c43bbd482mr641540985a.22.1790359838322;
        Fri, 25 Sep 2026 11:10:38 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dda494sm22529336d6.23.2026.09.25.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:10:38 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera
Date: Fri, 25 Sep 2026 14:10:24 -0400
Message-ID: <20260925181024.20352-1-lnicoara@thinkoid.org>
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
rail enables. No camera resource file votes a PMIC rail for the
sensor, so avdd and dvdd are left out and fall to dummy regulators.
The CSI PHY file votes LDO1_C at 1.2 V and LDO2_C at 0.88 V for the
PHYs, which is vdda-1p2 and vdda-0p9 here, as on the Inspiron 14 Plus.
MCLK drive strength is 2 mA, as CAMP_RES_QRD.bin programs GPIO 100,
and tested streaming.

The module sits upside down in the lid: with both sensor flips on, the
picture is upright and unmirrored, so rotation is 180.

The white camera indicator on GPIO 110 becomes the sensor's privacy LED,
so the V4L2 core lights it while the sensor streams and takes it away
from sysfs; the comment waiting for a "camera on" trigger goes.

Depends on the x1e80100 camera DT series (v7), and on the CAMSS PHY API
patches (v20 5/6 and 6/6), which read the CAMSS endpoint's data-lanes
as 1-based.

Assisted-by: LLM
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
---
Depends on the x1e80100 camera DT series, v7:
https://lore.kernel.org/all/20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org/

Built and checked (dtbs_check, W=1) on next-20260925 with that series
applied. Run-tested on 7.2.6 with the same board hunks, the CSI2 PHY
driver v18, the PHY API series v20 and patches 1-4 of the DT series:
the sensor streams at 30 fps through libcamera's software ISP, and the
privacy LED lights while it streams and goes out after.

Bryan, happy for you to fold this into your next version of the DT
series if that is easier.

 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 120 +++++++++++++++++-
 1 file changed, 118 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ad62350ba670..73f06fdcd138 100644
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
@@ -151,6 +152,25 @@ linux,cma {
 		};
 	};
 
+	/*
+	 * The one rail Windows switches for the front camera
+	 * (CAMF_RES_QRD.bin: TLMM 91 high before reset release), the 1.8 V
+	 * LDO enable on the sibling thena boards.
+	 */
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
 
@@ -674,6 +694,78 @@ vreg_l3j_0p8: ldo3 {
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
+		/*
+		 * Windows switches no rail for avdd or dvdd, only GPIO 91; they
+		 * are left to dummy regulators rather than invented.
+		 */
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

base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: 270d82b4c1760f1ec0a64a1b56c68ce26e6ae3b1
prerequisite-patch-id: a12186bafac9b287c19fd719aeceb8ff1372dfbf
prerequisite-patch-id: 4bc923fa59ee4c1ff68e64497f11e937c0ab3918
prerequisite-patch-id: 4d000086386a3b344b1d6d345ab93d9b2b569615
prerequisite-patch-id: 8cde6fd860c857dd7f3efce25970c88c783193b3
prerequisite-patch-id: 1f22ff7fc93d0135e8759d45955bf998b037e11e
prerequisite-patch-id: edb32e32f2b6be0b93f66d8da460c9f9de0c52e2
prerequisite-patch-id: 09444936808e801a58c83356c9ae95415bacc83a
prerequisite-patch-id: 348caa9cd0d1d70f181a47b40e2d75e8b25b5938
prerequisite-patch-id: 1c4e4c457d8f95d8f5aaa2d93976c374b8282bf0
prerequisite-patch-id: deedbed2643ca8a0f26bd87175d787d2f0c87417
-- 
2.55.0

