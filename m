Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8CB531611
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866342; cv=none; b=NicOkdEyO9nSj54iduZ4JeQcg2Z4/egF1nLfIicIVHpZn82fGwuIvDYxrTV793aSoe4LlvjgpkBieKWd2o3jabOJUwfOFznjAKCqig4tjiFRLHAkH6DwZ9vPsXcUup0THGGxJkzUjf2M8fgOscgiGCkqLDkXjNYg3rP4ZYpIAyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866342; c=relaxed/simple;
	bh=ESgsFLbZFCngXPnPQ9A3da33dc+1DUeB4zAsWCYNKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IfoHvMiWGFosbTToEYJvPuj0q8Mdop5vgHJZrbh4qbYW9fAR/eIZdVDCWbYhn8ZeO+2opHgfJRT334imJq9ks/Dma19G7gDVamur1TZAV9GNtuhFEdLWZwCwYGfC0P7coMqw1dfCVIIikaFjLHzHVasyvLxg/XPt24NNxfO+Eu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zatw/jEl; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zatw/jEl"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d04b1077so660095e87.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790866337; x=1791471137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TibT46ElKEehSA4Hf9Ywkj/kE0y7Gum3tdai3aG95FE=;
        b=zatw/jElET02YulDtQXJj3VBiwjZ3voEQOVusD7Ga+gwiQRZeF502OeUsGof836RRn
         F7VxVGp5gVy16S18MVK90M+8CMDNa4h3zkzuoi2p7PsTFbCgape9c9TqWWIqT5CpDJ98
         wsmxe698Fu6vHviAsFtvvIj+pF5ZGyvJQNbBBzpCZ50JJGAnjsDm1nuP/zoluf5A9Iwr
         nIdpV6KjaN7J4rqV1fRCeUN8R9ksHqM45KR5aszdAEqmfwPl0j1JlsrUD3JpSpHjAQ2+
         WhNrToP8AoCFf8KY4PEzrDSe4XggD1DYBa2opyS3dhnEiwOpLSexNLZwKqH7wMmGtUhO
         eHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866337; x=1791471137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TibT46ElKEehSA4Hf9Ywkj/kE0y7Gum3tdai3aG95FE=;
        b=kkB8MxaB8KLVGE1ggXQAo/7p0u2iRl4V1k/QW/RxIpQbKD5E0W+rB+OpLe0oOMWvxg
         F8kliirKz6+nCNz1DrH3VoQ4+chJbbZTBOTvukkDELy6Bi2LarTOWvpkKYUWOV6Fxaqx
         6i2dPJAoYh3s2nC5w4UeWFh3wq6ASu9nsLB2AaXSvhAU8DwgPdbdYdMFQXXiTvdttNjU
         UXPB0tGfnovtY8LXw+rUzS+3+BRXQDH/VzyTVirJvSMO4/u0aH3/np/toJCoOVg/POyX
         fCpRgGrZhOGDCqQAbJbr8gvJH6LbbXyCjBTZ4F/cYR5q6rV66EEC/p1/CUCAs3lEzvxt
         KodQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpJvqVOgHPuog7BZGVlrv00jWM4taq5ayt8JkstP4ibNQx5JWVhnJn4KmIP80EVeQfoDfbztD2r1UE@vger.kernel.org
X-Gm-Message-State: AFq9FYJi4RlJX66Rp74+tW5eWUFjkgsMpzWDRjZbNMd+5BphRZBr8vyu
	QDRJPBnMD65phc0mG9gK8o/My7+iJ/j1HDWg7LbtPLapS5KRKXoa5lDziLo5igrOzGE=
X-Gm-Gg: AYBFou1bHptRJGxjw3f5tMFecGRcBWUbydenhCX3XUgLZSGW0cBnOfO30hHsNPJOkBU
	BZ+e3dmaPWzHqntXAN1QCA89/ip8CNZ31fxMl3SsJbKJIvEFPRhn3+EiFPKnCjhJCfYFrAcL3gk
	R3rs3J/3GsQhn7he+TGpLe/+JeRKrw07ul2bQgMzgI4tPpVSL2Rf4hHSZXwmuDF8FdkMynyO1nN
	ZrbemWV0MqsyeTmARHQgF6pVsm2c7hpZwlWXVlCFR53KW18Sr1D3hwc3zjz0UqELNhUr9jN3Wkg
	mIsg3Kcm9CmOfH63mGkbBHH6NzPEtkcPnMV4NKX9Brqqs3+XhFEXvT8qIe7UbV9B35VleLhe+ew
	s9Gzgtv8A2sbpHsZDdLAT7KtuBNX7OIpcmbUY2i/Aw9Fhi43bBtgh3uk9ABzdty1mZVYcZUelo8
	bQhfXQ+2I5Wl8BWryY8KxWlrLSpYJpqQzRoyi+GaQUtlPZBGjfbwF9Ba0xKl1h4zuOH2AZQbyGT
	hr2Q0yU8oGE29oZXv+/RABbTKZClf+FJ6r4J1Y=
X-Received: by 2002:a05:6512:3182:b0:5b8:f5e2:cd78 with SMTP id 2adb3069b0e04-5ba405fdda9mr2402132e87.5.1790866337079;
        Thu, 01 Oct 2026 07:52:17 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7bf18a67sm8957e87.79.2026.10.01.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:52:16 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: Add initial support of camera sensors
Date: Thu,  1 Oct 2026 17:52:06 +0300
Message-ID: <20261001145206.2442665-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support of camera sensors on Valve "Steam Frame" device.

The change enables CAMSS and adds description of
- a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
- a pair of OmniVision OG01A1B monochrome front camera sensors.

There is another pair of OmniVision OG0VE10 camera sensors found on
the device, its description requires a combo mode feature support in
the SM8650 CAMSS CSIPHY driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../boot/dts/qcom/sm8650-valve-deckard.dts    | 203 ++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index d25a09e162dd..3b2503c3c541 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -95,6 +95,66 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
+	vreg_cam_eyetracking_1p8: regulator-cam-eyetracking {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_eyetracking_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l5m_1p8>;
+	};
+
+	vreg_cam_front_left_1p2: regulator-cam-front-left-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_left_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l2n_1p2>;
+	};
+
+	vreg_cam_front_left_1p8: regulator-cam-front-left-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_left_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 36 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l5n_1p8>;
+	};
+
+	vreg_cam_front_right_1p2: regulator-cam-front-right-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_right_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l2m_1p2>;
+	};
+
+	vreg_cam_front_right_1p8: regulator-cam-front-right-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_right_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 36 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l5m_1p8>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -675,6 +735,149 @@ vreg_l6n_2p8: ldo6 {
 	};
 };
 
+&camss {
+	vdd-csiphy01-0p9-supply = <&vreg_l2i_0p88>;
+	vdd-csiphy01-1p2-supply = <&vreg_l3i_1p2>;
+	vdd-csiphy24-0p9-supply = <&vreg_l2i_0p88>;
+	vdd-csiphy24-1p2-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&cam_front_left>;
+			};
+		};
+
+		port@1 {
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&cam_front_right>;
+			};
+		};
+
+		port@2 {
+			csiphy2_ep: endpoint {
+				data-lanes = <0>;
+				remote-endpoint = <&cam_eyetracking_left>;
+			};
+		};
+
+		port@4 {
+			csiphy4_ep: endpoint {
+				data-lanes = <0>;
+				remote-endpoint = <&cam_eyetracking_right>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	sensor@60 {
+		compatible = "ovti,ov6211";
+		reg = <0x60>;
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam4_default>, <&cam4_sleep>;
+		pinctrl-names = "default", "sleep";
+		reset-gpios = <&tlmm 195 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_l6n_2p8>;
+		dovdd-supply = <&vreg_cam_eyetracking_1p8>;
+		dvdd-supply = <&vreg_l1n_1p1>;
+
+		port {
+			cam_eyetracking_left: endpoint {
+				link-frequencies = /bits/ 64 <480000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	sensor@60 {
+		compatible = "ovti,ov6211";
+		reg = <0x60>;
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam2_default>, <&cam2_sleep>;
+		pinctrl-names = "default", "sleep";
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_l6m_2p8>;
+		dovdd-supply = <&vreg_cam_eyetracking_1p8>;
+		dvdd-supply = <&vreg_l1m_1p1>;
+
+		port {
+			cam_eyetracking_right: endpoint {
+				link-frequencies = /bits/ 64 <480000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
+&cci2 {
+	status = "okay";
+};
+
+&cci2_i2c0 {
+	sensor@36 {
+		compatible = "ovti,og01a1b";
+		reg = <0x36>;
+		clocks = <&camcc CAM_CC_MCLK0_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK0_CLK>;
+		assigned-clock-rates = <19200000>;
+		reset-gpios = <&pm8550vs_e_gpios 4 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam0_default>, <&cam0_sleep>;
+		pinctrl-names = "default", "sleep";
+		avdd-supply = <&vreg_l3m_2p8>;
+		dovdd-supply = <&vreg_cam_front_right_1p8>;
+		dvdd-supply = <&vreg_cam_front_right_1p2>;
+
+		port {
+			cam_front_right: endpoint {
+				data-lanes = <0 1>;
+				link-frequencies = /bits/ 64 <500000000>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+
+	sensor@60 {
+		compatible = "ovti,og01a1b";
+		reg = <0x60>;
+		clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <19200000>;
+		reset-gpios = <&pm8550vs_e_gpios 6 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam1_default>, <&cam1_sleep>;
+		pinctrl-names = "default", "sleep";
+		avdd-supply = <&vreg_l3n_2p8>;
+		dovdd-supply = <&vreg_cam_front_left_1p8>;
+		dvdd-supply = <&vreg_cam_front_left_1p2>;
+
+		port {
+			cam_front_left: endpoint {
+				data-lanes = <0 1>;
+				link-frequencies = /bits/ 64 <500000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
 &dispcc {
 	status = "disabled";
 };
-- 
2.53.0

