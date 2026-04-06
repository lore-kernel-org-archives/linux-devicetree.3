Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766731A07F
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464461; cv=none; b=H/R6ldN0vNR+j369KV6vAGCgGwSUZbeQ5pJRu4UYd8Knw66KJ98Itpi0C2GOqK2SuqY1CyjMu7Rq1yojhN1k33p9G3pyx/5gFxRZfBAieX/NH3FTi5aWL1OHcLx1gbi33gJtJIoEVqSqDMdCiiGVbq3RoR502zaoD36eze3vFwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464461; c=relaxed/simple;
	bh=HvRnVDts5ARzEgDQd1uxaF/Ni636zkJ9D8rxyroqkjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZnEFVOMLeHJtlapydjiKJGTHuL35T8aLqcc7pNR+rNe9gPTztgH2dkZ3F9YgKJf0g2kuX2E/0YcmEYIoUI3eucx8Z9mYLkHCMiwZsPtC3Kxrxt8Djuo3Db1x47cucrTjcXZWjUcCm3CoKn2wo/Aaso73dWpkYpvX0fIiJatlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPaqUcGp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPaqUcGp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso13915525e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464458; x=1776069258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd49eOxiPUr+nKhdQNMwO1I+nWDzaH1EHGVy7eWJkcs=;
        b=UPaqUcGpG0M9CPFdqzPLRmMBANm3ifGQJLEk0c6+65h5IKghgHF3FJkF1tmQdnEpFd
         xH8B5u4ewSvjgdXeN3V5foyfLaGh7YUl33NVexJyfvp3+8EhXo4AhP1u8BFfhOz7Hgy6
         qlIhTYZUylgGTo7b/xNl+pB4xvaH11e9z80i7m2Rmq5R+gLtk3stizb32J0XL+oleamr
         Vhvy8xbIv9Km44eZAWQisKbJf6iJkkBVQLQbe0yFFnKjVKd5Oo+Jvof2W7O5f2FowR/O
         yGL/G9OIJE42YfKzcY6tL+6B36H2Hm3gNgaZaLc3I3AINYud0J88AcnNl03t0tceKdpW
         zRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464458; x=1776069258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bd49eOxiPUr+nKhdQNMwO1I+nWDzaH1EHGVy7eWJkcs=;
        b=EToRSuVj6ltY8QL7mWg5TtMw/2YScwG0Wcyyqf7VpgwgcrbG8KHNUp1slmJuCQ+FLx
         +XaRXCyjIO95DXUg74+MDdDYc7dlpivzPPRIAQdJt/KRB+ptnTgPbBXcB2Vv6NI3au+7
         chua6hP34iN7g/bcXtVzrc8HEtxvrZGI9sHjhhu8PolghECI+R6sWrplkcjIxGgfj6Be
         zejhNrAZKy3NGRlkkakEJobCFdn1tCNB9gb0cDIkgecfjBRYQbbbCS/vRX/tPCG/KK91
         D/sGf+jAzeriMHBZM+fFCFxymRwZjX04pmowzJSJcf3oN6C5rYKrtQXxG3OLD+dlrW9E
         bpSA==
X-Gm-Message-State: AOJu0YxzQRlHBas7NiBQLJ8OGOQz9EjJHupWzHTmzXiM+jWUx4iaNKKY
	MPPM9PuV6uxG29lTxxrvWDrsY4G//sgl4H9JvNJOs+lqaQ+3UyQ6o3cH
X-Gm-Gg: AeBDietJGJLTyZut0RTxHV/qa78dLk50ukbSNSgloRYOeg+ttxEMu/zlesKr1+Q56Xr
	JMlI/dMKIRGnahvnmpCAvAx4dyfoqnxkXWkK0/Y0DqvWp1HI52Sc6eGwk119bANEVH5fJVg07AP
	ji8IgpjbX78CO1vVcBb7oJDiY5n25GRaMoXgTuNHR1tFwWfMS5GyPID0+XTaTJKoOT0Em0HyZQU
	kn4E3KVtnZ9+phe2YMzGG/IRpLdAFesjBmf25UfHtaXZfM/ksJLg8yeb1ORF+tunr2gWKkAiGMI
	ThffhP55NIWvmAgYQDxEyC4uppkF8A7H0zLtmuNtUVbsDcfZAiTHZoYQ2haOWRsAvi22oqO2fTA
	M25WpJepXZf/f29x+i4V1rCBZdEZnCSgxzbUIV5k5DDZpd3U6uJy0OyGhab8bULjN78aNtGGfvW
	inVAZiczqXQxKF
X-Received: by 2002:a05:600d:12:b0:488:8bdd:cfc7 with SMTP id 5b1f17b1804b1-488995d140bmr130951175e9.0.1775464457889;
        Mon, 06 Apr 2026 01:34:17 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:17 -0700 (PDT)
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
Subject: [PATCH v1 5/9] ARM: tegra: transformer: Add support for front camera
Date: Mon,  6 Apr 2026 11:34:00 +0300
Message-ID: <20260406083404.31359-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
References: <20260406083404.31359-1-clamor95@gmail.com>
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

