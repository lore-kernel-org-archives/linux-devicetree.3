Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE93A7F69
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485773; cv=none; b=PH5DW3YY7Q+LPSKEopzUMrnOKBjt8CZM3iiDwmMHCImd49U6P/oaVRfFaK5FBfBXs7xbLFvIx0xCsxuGrBgSppBlVbfnc5pWScju+uC0F0nx0vWYSK43IoDqzNoVdRjETCRiu19BPPkEyNGXqYyXkWgvHk3iuWe5IC2ecUj2c4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485773; c=relaxed/simple;
	bh=HvRnVDts5ARzEgDQd1uxaF/Ni636zkJ9D8rxyroqkjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWleZ3zeFcKWuigtaPUyCaJW4FlMF/A46p2FPAjzwtPGGQJL+uFOTUSOLlkM8+YWpCdvpJcgk8W1LDbu6ybqV6ZC8BJxsvUopAb+lMF5Bm6GzNp3ZWtdaCV6HMKzrGpBarYlHv++8xxrNHLoBeYEOJ5Wr1HkN/stPo/05n73Sb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdVEZZFA; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdVEZZFA"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso3602835e87.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485763; x=1779090563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd49eOxiPUr+nKhdQNMwO1I+nWDzaH1EHGVy7eWJkcs=;
        b=YdVEZZFAE6cVPajPHpEjMvXPeXCk/cMH90hT1Vy4PuOFg3IQsdsFVm1pMvw1rKWEay
         B22r8MRYi2d087w2nzbm0BJrlDe6zoDRnDZ9wT1dZZUshezjEpJkZlROs4CahFaetlsl
         UBmdDojRAO0ZCluC/oCs4a5oZ94swucKJ/XQygsJbGI1SUMPc8Nnu15B8U/z9rYdUbDc
         rhklGu666Z/vtvXEbkEndiAc8990hwzujQWFGWJyiUaFQjRSGaCx3UE11afKxEQIfcpP
         H003mC0v1fyo6zJYTuodhmSYyOtUxfhGTbJ/g587qOOa0vlZ5EE9ITExWKGkH5KjX3zG
         o2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485763; x=1779090563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bd49eOxiPUr+nKhdQNMwO1I+nWDzaH1EHGVy7eWJkcs=;
        b=ZEnD3qHM1NON/UmrIaib++aWXIqLQUnJbgrXMJUxXIS7l4haKtFK+GesA6OsWF1KmU
         n/uB5GTAcqD+SjX5SxbOA10BRN5vw+rKk4f4yZ32GYbPFHkgWBNWiyboAWJR+2pnz6da
         hMPe/w6CHyTu+ewIosyOSFneONsv3XEOc66rpKWiFf0z/kl9pzSaQqxJ+fCBu8ObLZTK
         VwIs3lfBOkNvJ3IiAuBzk4QG+43+5CStLs03d9jHku7S2BWeeuH9H4K61c+CznrVwTbl
         CEPfmUL4MkmgyWpPr5yD4CUEBhA93t0l6EBYlGBbla/gI/E91YCvOXdjjVLekw1SEqww
         vbxw==
X-Gm-Message-State: AOJu0YyWJ2F++R/hKbvuxWrA1nUyxYVfvQVjxhEsw1IK/4enjwqom3PY
	PWWMte3cn9dT+UUliQPAyGnl8L+g4RjPNpjGyL79z4W7Tf5idyOoC6nl
X-Gm-Gg: Acq92OGAHqsOKf4JmSprPLvfjjZ1zq06UcFh5yYs11tM3/kxXNPiMrPV8J7piFXVecF
	Dnawsc30gT0/apI8IBQ4BnujoAvH7EaIUXcfwi3LPQY4zcs1keNq+HrLj6ZR+y2hx/kXDPvDVNC
	x/cF+o2bu4BFoQuAFutzQe3Efl5TcBwKoHfVhAPEbV2GCzdz49HYXkB+fY3V9L2sjDnkeNKIpgN
	HL+HZG3x2dNXkMTMoimtKE6ORPw04T6H3e+bHfvBl/wTJ0HJmocre6qOHphWl4ORvHnZWzhtqIa
	V49hmSJL8QwI0T9DhZFcv92RrK8ddEOlRmwCr43CZXIsqcNyfWCvuGbekgn1H/cWLaE0/jNeI5V
	psRKHELdtDGnb4SzNEtAWj0iOUG4uT3p1xzkQT8xnhTuyjPPeMoW9D4ExH/SSYVxMZgLClIQ/xF
	75BM8VThCyd2m1yo6GRSZlNK8=
X-Received: by 2002:a05:6512:3d8a:b0:5a8:a558:63b3 with SMTP id 2adb3069b0e04-5a8b709b088mr2382639e87.30.1778485763421;
        Mon, 11 May 2026 00:49:23 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/9 RESEND] ARM: tegra: transformer: Add support for front camera
Date: Mon, 11 May 2026 10:48:55 +0300
Message-ID: <20260511074859.24930-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add front camera video path. Aptina MI1040 camera is used on all supported
ASUS Transformers, but only TF201 and TF700T will work since on
TF300T/TG/TL front camera is linked through an additional ISP.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra30-asus-transformer-common.dtsi      | 138 +++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index 0e06136042a9..d4a7bae51830 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "tegra30.dtsi"
@@ -73,6 +74,91 @@ trustzone@bfe00000 {
 	};
 
 	host1x@50000000 {
+		vi@54080000 {
+			status = "okay";
+
+			csi@800 {
+				status = "okay";
+
+				avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+
+				/* CSI-A */
+				channel@0 {
+					reg = <0>;
+
+					nvidia,mipi-calibrate = <&csi 0>; /* CSIA pad */
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csia_input: endpoint {
+							data-lanes = <1 2>;
+							/* Add rear camera */
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						csia_output: endpoint {
+							remote-endpoint = <&vi_ppa_input>;
+						};
+					};
+				};
+
+				/* CSI-B */
+				channel@1 {
+					reg = <1>;
+
+					nvidia,mipi-calibrate = <&csi 1>; /* CSIB pad */
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csib_input: endpoint {
+							data-lanes = <3>;
+							remote-endpoint = <&front_camera_output>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						csib_output: endpoint {
+							remote-endpoint = <&vi_ppb_input>;
+						};
+					};
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					vi_ppa_input: endpoint {
+						remote-endpoint = <&csia_output>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					vi_ppb_input: endpoint {
+						remote-endpoint = <&csib_output>;
+					};
+				};
+			};
+		};
+
 		hdmi: hdmi@54280000 {
 			status = "okay";
 
@@ -1173,6 +1259,36 @@ light-sensor@1c {
 			vdd-supply = <&vdd_3v3_sys>;
 		};
 
+		/* Aptina 1/6" HD SOC (MI1040) */
+		front-camera@48 {
+			compatible = "aptina,mi1040";
+			reg = <0x48>;
+
+			clocks = <&tegra_car TEGRA30_CLK_CSUS>;
+
+			reset-gpios = <&gpio TEGRA_GPIO(O, 0) GPIO_ACTIVE_LOW>;
+
+			vddio-supply = <&vdd_1v8_cam>;
+			vdd-supply = <&vdd_1v8_cam>;
+			vaa-supply = <&avdd_2v85_fcam>;
+
+			orientation = <0>; /* Front camera */
+
+			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
+					  <&tegra_car TEGRA30_CLK_CSUS>;
+			assigned-clock-rates = <24000000>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>,
+						 <&tegra_car TEGRA30_CLK_VI_SENSOR>;
+
+			port {
+				front_camera_output: endpoint {
+					bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+					link-frequencies = /bits/ 64 <384000000>;
+					remote-endpoint = <&csib_input>;
+				};
+			};
+		};
+
 		gyroscope@68 {
 			compatible = "invensense,mpu3050";
 			reg = <0x68>;
@@ -1310,7 +1426,7 @@ ldo4 {
 
 				/* LDO5 is not used by Transformers */
 
-				ldo6 {
+				avdd_dsi_csi: ldo6 {
 					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
@@ -1685,6 +1801,26 @@ hdmi_5v0_sys: regulator-hdmi {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
+	vdd_1v8_cam: regulator-viocam {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_cam";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(BB, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
+	avdd_2v85_fcam: regulator-avcam-front {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_2v85_fcam";
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+		gpio = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
 	sound {
 		nvidia,i2s-controller = <&tegra_i2s1>;
 
-- 
2.51.0

