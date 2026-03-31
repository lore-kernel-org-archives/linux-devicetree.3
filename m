Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ACD3EE1DD
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986248; cv=none; b=B6oY4lx2PPsNgcpxi0uBBN31bz+XiyxcbQ4+TnmymuMl/3dMd/LEpEWo6HbRMyTOk1POLXUHzSV2m/yH6Y+Lx0m5ilEMZROruHwvm+zR/X8CvspoBh4RVmNmgwCwljnG7xQpeUO6Rj1b5NwwTnCXMmo7CJjyDeiTI6Ib3h5cYbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986248; c=relaxed/simple;
	bh=jhJ+9X7mGcDu4aUH5n4fWbiURU7rddBOFbSL/B5iHQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbYELmJAJFwYsnfrKcsfEAGKDcFRqmQ0nmF4OxCx3DxM0eFrbgDdMKmVXWKlx3Fo/cb/QqS0F9Gt3QuqgJJvwlvQH//8ltSGFoURTWPUDLkawbvKjR9KV4prKg9Y99J27FMXDuyykBQu9uimNkeFnJ7oTak2E2AY4s0eqzyfxfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIQhowUY; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIQhowUY"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cfd122d78fso967094885a.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986246; x=1775591046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41V2HoNtVWwcbC5TAQVx7fTS2emu4IQ5c9Oeou3v8J8=;
        b=DIQhowUYdw2PI0nUTVWR4Q4Fv2GfLAHw5Y9zgTVBbPLQecrSoLkHEX/s8qAuWMHIqw
         H3Q5zIPmD/dRK82snZmkY9msh4BwAdRPzx1FWn3jnjObeOzD/tB1X/3Fj1QsiWqIMlU2
         R78ni9qwf0ZCosRuIvE8F/G/GYzy/4tcn5P14zF8hFkqsUmUOmAeM41gDBOlBN86ZktO
         X4LxIbiXlz0kXazsnljPm4xCE3PdU7FbSQxGoBLpexn9K5N6foX8Qt9yxlBVjBMsnrZC
         R5knD8e6+UkfqAhsqn6jVFHZ4CDJIIyANshHbaSeiUDY624I3FqXtHzoHQJqJLC4vYAf
         +m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986246; x=1775591046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41V2HoNtVWwcbC5TAQVx7fTS2emu4IQ5c9Oeou3v8J8=;
        b=cq/pcbqHsOfxWzQDF4AcVA3LWc2TRHem9gGL4iAlrdS+IouoeAhPT9DCshrZ+rQXJA
         5ORzQ7f/eYy98wqHYQb6HDEhtTJKPmTBpaeYaEnyUcx+bZ52wUtVSh4OHT6h6IIMRPQc
         liOhNDwaD4CQzSZX2sSG6eib2J9UF2COxb+EUqIEH7F8pYmde4mnKvM32RXPwhy2+xDl
         Hf88PLcHNik4cROdjhupekb5/C8r0NXRNIRBBx0RJU7WBXyrPy6XurVULwy2V3oDNtRO
         JG345kJCCINMLf0jyoD1pzhsOjSy52PgmlPUsSmLMHRZCA87QtJLezQkUOCDhzrSUVyk
         WHYw==
X-Forwarded-Encrypted: i=1; AJvYcCWtp8i0E1Ovtl1H3vAcSNoVzIOd7i9PFlNjGvFSyYEiPIGC7qS/r1yDwM0zYufyPEmMqsN0f4ajJ3l7@vger.kernel.org
X-Gm-Message-State: AOJu0YwQG/ru+4ilQoht8NgsKxwfPaXgNouMaKUEImjQcYrOHRFH9hj2
	gFwmkP9xDu8g/iVkRwI4a/M88E56DKXCSJpjnw/oWTKGwuFcz6EwpoMP
X-Gm-Gg: ATEYQzxklqgVyRwrbRhtcX9s+AxlYtDyc48a2E0MKRHZ99m8g3j638TKHkElnX+d0+T
	9Q4qaPs7GjsojDrg0slb1hBTP5Ir+iHWYhtRngYs1RnzW1FkBW5p9bW7oZobqjXt3HAw4cJeuBE
	52HMYzvJIjRc8j0FfBIZy12p1VTT2cC0G6b8CyEhe2godbHtdR6LER6xQk55eVvLxLJLpzxn+c1
	suw3AUru3X2gO9qCjQ3Mvhtns3Zh/2Rua1hDlK2MTqWjJq/Q8+6LdvQBhx/5i118gKuUzIC71Kx
	dEEpsU4QTObJpxLfxjI4sgZrC/ecMR+F44FdrufzsTV08C7yS4s9GoNEnSdKnU63tmIFm9g+wnZ
	8dFFoDD4BKBNmfqnkuW/RBfJL1LHS74LurjNmwcklfOlzBw2gsIWcOW4oMdQ2VFSmdGQFVlS7F5
	01fI7hCBcBnActT+mDZ0Iw2WAX
X-Received: by 2002:a05:620a:19a6:b0:8cf:e015:afe2 with SMTP id af79cd13be357-8d1b5bb8a73mr168064185a.48.1774986245724;
        Tue, 31 Mar 2026 12:44:05 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edb8d1sm893138685a.4.2026.03.31.12.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:44:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v12 3/3] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Tue, 31 Mar 2026 15:44:37 -0400
Message-ID: <20260331194437.41041-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331194437.41041-1-mailingradian@gmail.com>
References: <20260331194437.41041-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
support for it.

Co-developed-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..eba2f3792dd0 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
 	};
+
+	cam_front_ldo: cam-front-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_ldo";
+		regulator-min-microvolt = <1352000>;
+		regulator-max-microvolt = <1352000>;
+		regulator-enable-ramp-delay = <135>;
+
+		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_ldo_pin>;
+		pinctrl-names = "default";
+	};
+
+	cam_vio_ldo: cam-vio-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_vio_ldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <233>;
+
+		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_vio_pin>;
+		pinctrl-names = "default";
+	};
 };
 
 &apps_rsc {
@@ -392,6 +420,64 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_1p225>;
+	vdda-pll-supply = <&vreg_s6a_0p87>;
+
+	status = "okay";
+};
+
+&camss_port1 {
+	camss_endpoint1: endpoint {
+		data-lanes = <0 1 2 3>;
+		remote-endpoint = <&cam_front_endpoint>;
+	};
+};
+
+&cci {
+	pinctrl-0 = <&cci1_default>;
+	pinctrl-1 = <&cci1_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&cci_i2c1 {
+	camera@1a {
+		compatible = "sony,imx355";
+		reg = <0x1a>;
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+
+		/*
+		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
+		 * better driver compatibility.
+		 */
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&cam_front_ldo>;
+		dvdd-supply = <&cam_front_ldo>;
+		dovdd-supply = <&cam_vio_ldo>;
+
+		pinctrl-0 = <&cam_mclk2_default>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_front_endpoint: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_endpoint1>;
+			};
+		};
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -490,6 +576,14 @@ &pm660_charger {
 	status = "okay";
 };
 
+&pm660_gpios {
+	cam_vio_pin: cam-vio-state {
+		pins = "gpio13";
+		function = "normal";
+		power-source = <0>;
+	};
+};
+
 &pm660_rradc {
 	status = "okay";
 };
@@ -508,6 +602,12 @@ led-0 {
 };
 
 &pm660l_gpios {
+	cam_front_ldo_pin: cam-front-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <0>;
+	};
+
 	vol_up_pin: vol-up-state {
 		pins = "gpio7";
 		function = "normal";
-- 
2.53.0

