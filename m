Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447731;
	b=5WrXNrCBgB8BkTnY7e7fxPMsYczZU/dF7VI0LSwscfP6bcz8KS7xKi8Wwr4VaGv9YhBb
	 euAC+L0sURbkuwIjumJdwoQJyxUYpwy0V+d/5PfiR26HLW7MFsf41nLbmkS074mHcbKpg
	 /KZ8E7SR+BNeAztrSYVkLcGQGaF1bRhw+RjikKa3SHFQUc3dk9/xYuqnDDVNPxtdmsIt4
	 7qRNp338d1C+ngIG+3Mtny+T6OWJ9xyC+fhdz5I0fVDwrHSCKGwc9ceN4IKjQN/4K+GoM
	 okZZERqdpGlSkcYVO5wcHYhV46gK42piypwXI+EmibU6+W/S8OEPzcvDNP/JAsLsCkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
	b=ZJLOk81L3wjItvaS/G2o1vQ1KeZ3CR6t+L8n+XQ+FmIB9xcexf7hBU1cBO1KmUlAG/NN
	 UjL5CSSPgKA6v5186NF3zVuxR26/ZgqzMDuutHgmf6ODw7NRb4LI++0X+oLJH9O1uKuqz
	 9ZPZ4Eo2TmCL8Z3b/ERlhGKCUQ7KZYNWE2CweDlNuIboy00wM+tOkH5+33mAwMdphKmgg
	 hi57XBLTRgYA9sgL1YvgRFNBu2VbNGf6sTY1HLTqNoRneIhEsJDcROh1LU9DUV4tLtRWg
	 sMquEVUF7iJPifolcEy8i5mtXIJ31/r4JFWBFTXErBx5NxpWQ6RnDQ48kr5drp1yiag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaN8tz2s;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4696606A32E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4696606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaN8tz2s
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3acec6677so4819180c88.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447730; x=1796052530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
        b=qaN8tz2s6QjWaNTQiTog+fsjkYaL/oPgbb/v7AnoTrd8bU0uoUSwKkNT8dzhR+i73u
         icf9jPTeOWH8XY+3QBmRu9W2BLgFcMzVH0jzRUTmx+5K480YeSVMjIMh6HMIEMLsuKjX
         luCitgg41QLf0IW5yF5mKQ2rtXhnDhkUtd1hM1xT84fobvegCRgTXbKlMwK0Ai5GlV9g
         9YRYCVwNlrXlDd8JsjOTLcLBpPZVBuznpXMjgSwx3qrxmUHZln8iwn54DRgbmz6Tt+jF
         IkErDcjC2ELpglQszvZhQ9f/WhdcIcZ0fw3024FJMxh3bATjPaEMfhnF7WPeDWxuJXz2
         tWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447730; x=1796052530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
        b=j8oFzFoaDgnh8seSGZiw/OZozzJcSiILOkzMKQKrOlz1T6v2YMbv/Ac2Eris66az7Q
         xpqFziNQeY1qm128O+mg40XhRaAlLlJluSFjXAYASgc+kHJradQxQpJyrxHgF5C+t6Vd
         Ix9M9cpQZGDVTSjoY9OfZxQrNc+lGsIYgCDaeX9rNX4AUptwRDwt6gS+CzfyeIKe9fny
         1duGr/+CwaQ8HWA6F3JzwJFC+mZfkzaAufvgmZRqDGPrxs3523YM+Cej1tjed3BnFn7g
         +yATnj4qapQ6h52Ad2ipOvvflwZbPihSEXh1Nu1+oJHf0438Vm2j5hupe3KISor4aIHt
         JSJA==
X-Forwarded-Encrypted: i=1; AL+hErGz6OqBntAwc+w55GYGRELxqLLyu3rhv+ZJ6teyCgrkxCS8RPXFnDtp70zamFGouPotqnH2guqHbma2@vger.kernel.org
X-Gm-Message-State: APuU4Z/cQOPTqd3KH7Yv0gjsuwJsLzWyhwu5t71RaCitvf2VOdT9J5eg
	x93Mv6DrEmQ9qkgWU5Blf9jyZXnSZr/WDhsV6N0JfV3iJThW5TneQ6TL
X-Gm-Gg: AZFdTZfUsdcWNkAVIqtwSutDvP4/SC2r2makFa7SIRQ+CzqZwq1Gtahhx5CU8SHeYlI
	mKMnOkAhLx6tASM5lQ+Yymh0eSXxZQTkExHrL1tRIssO8GjroQuHmQO8zIGf8mie7STZalpz2OG
	kT/c3Z5Rl+BgSnnUWrzbnBAPp/FnRcg74aMqGbHz+Zan9A42YLG4c/U6nP3A4wPqnBX9gMt3KkQ
	tA2Q35tIgH+nMCTKkXnfgPW2AaKtCw+zZT4BusRxL2GNnbfbL6KHuunb+MnSsSeYJLKmPmsvt52
	EeXUCVlb4B+mskFZhMSr2ZREQDFkY6OsR+zwG4cI6TgVxsXfcAABSIgoTFDwMPiwQ0dnYBcaX3r
	kG2WyotnV5HWgLPVqccn1g84ENtFcN9e1sUS2hkbOwWv+ip7jQ21m229gF6GpNXpc1vhkWFBNPe
	rY4O1wwJEsVk4xSh45jiEHqg9S52SzIvU3G4pxTEs3XIiZEukQN9MD+hIOYFeuSxDraTImshiXy
	4MvJE/fpowgWwh6zz4RrObhjm/O7EbfyGQGJtNSgnbW7Jj5dqQoftJ2ao0WiRm2M4CwJRJygdvS
	5Tg22m4bqVRs4dssRELlZ+VdSGRNfhgE3bMF8tPggo1cEQ==
X-Received: by 2002:a05:693c:42d9:b0:386:bc40:1508 with SMTP id 5a478bee46e88-386bc40185bmr455177eec.14.1795447729747;
        Mon, 23 Nov 2026 07:28:49 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:49 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 22:27:22 +0700
Message-ID: <20261123152722.168879-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10 rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..e41cbd4d01b2 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -74,6 +74,104 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+	vreg_cam_avdd: regulator-cam-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam_avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&cam_vreg_avdd_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&camss {
+	vdda-supply = <&pm8953_s3>;
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&front_cam_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		pinctrl-0 = <&cam_sensor_rear_default &camss_mclk0_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_cam_avdd>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <216000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		pinctrl-0 = <&cam_sensor_front_default &camss_mclk1_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <90>;
+		orientation = <0>;
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <418000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
 };
 
 &hsusb_phy {
@@ -302,6 +400,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
 		bias-pull-up;
 	};
 
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_vreg_avdd_default: cam-vreg-avdd-default-state {
+		pins = "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	ts_int_default: ts-int-default-state {
 		pins = "gpio65";
 		function = "gpio";
-- 
2.47.3

