Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C60368D78
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471475; cv=none; b=DWm0MmD5BgMccjzcZW9zEEKPnPu8Q5xAD056Fww/D2IswAwwvnunkzcD+nn4Yp4uAGCaAqxFS8W3p768AwG5BfDC1wSVdk3o0vjlCgqlnCETXDOMabZCBEfweu6XbxhvLw1zHPvQH94RaO3de/vaSAOTMOTFAXxXT57B4RjssjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471475; c=relaxed/simple;
	bh=mZln1b3un7cbjtyyqStjeOQ9net19lXjFVDIFyOquDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWu8t5LlLPVtBSDZrVlSC9o7mW2zb/HClo2KrMU0LtPt+847GK+VFQiCq5F4e6X1PIlRWJu+m0ylXHovvMjqumH+JrqpQnZpAbojwcKPzcP2tx2P8mRbJjb/urWNoJca9SvHaNx6kATh5ByYbiq2g6Fl7qQhW76H8BUV7mboeyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2tTl8Fh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2tTl8Fh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b1710405so352195e9.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471467; x=1784076267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFyMS9ddI0aj7oPecUMKa8Hkd0I3JDhzdUVh4YXV1qM=;
        b=o2tTl8FhNQPiVseHxIWJ2JtSGlRtYXQu46IVXcE/sHaoRdPH0/snFtTi4uTVoNOr6i
         WUxLzxK/KTQwFObMQbUTjAbO7e6kFkskXMs6jxo8/ZGvs9jZgaoXWd57DHy3Oc0BNalm
         QJUUnm44/dQxwcN9OH9QPG6xp0coMRlol8udD8w73yhRMRE/oCQeX64G3BH9oonzTVdu
         TEsrb+Vgh/DKe883blGOJGG3EVvjH0jThbH9fy4gsxjcq26QZr5GOL96rqO93YnaLNsv
         3dc0a5jMH8BLAh4HzLTk0cH2T/yXmb8vcOmmXfBz7Ss/wjxMwk4HZ5rSPiXHEKHyB0JB
         pGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471467; x=1784076267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFyMS9ddI0aj7oPecUMKa8Hkd0I3JDhzdUVh4YXV1qM=;
        b=bDJAInzAlxyyRsiSQR91RsBU64SGXqRIXxSv58IvbTUwVFOkcQMqkQq77J5mvzdqNZ
         BA6tJLLr9YFEa5NUHvrp+H0xrSKJ63lewHYyIZwvzNVrDMxNEk0e0xGOrNBVRfK0j3Pf
         4r2f9XIGi9ec6Q3xrm6LOyz4HlGxGH9Tx/5YywZMcVqNirna/yWHFwfJVkLsvej8FwuQ
         04eBVis6Fpfv7K1ATOgerm3/nn891YLmxYtkFklc5UpD3bFJ8k0iYzvqJErdPt3gTl8q
         k+9vV9B8zumqDg/A+WINc3l0NAd0Ns/fYHMXx/qANdx2Z891gYkJ4wfXfhocQcFx//0K
         8Mzg==
X-Forwarded-Encrypted: i=1; AHgh+RqCsGadbcePiOo5Xt3t5/uiMNm/ZsoUWdnp78WkyWUtpSVngCtsSqH3E9iNyeGIKT1V+aXsdPRIDyoL@vger.kernel.org
X-Gm-Message-State: AOJu0YyRHC5Ok088MPfunZhMr7P7sFW02Jd8CgMxlSThKhpRkOCHWnoC
	aWzSbRl4KlAdToFXSlrBjS8ViwB6SS/njLkBOYnZyYEfiq7syrSBbOsX+vtBphG7PTA=
X-Gm-Gg: AfdE7cl+GaZJpfyTRooPzGEgUFpqOVjSFxKqaH6eJBTrJ1m9eRWZGN6TBTcKPeZpYBi
	1OsAlrJYrwXdAgR7LaQXs2LOpSUEal6NVlHycWgB35I8zqLRDJzHfje5XPWQEtdEpuWF6ObbTa+
	OveHG9ayS2jTOriBOrpxZ5z3ANXBWuZyzpP/kSIpi3BgVvVrrnKXcdXQpIDcOdIEYrvz71Sq8ZL
	etPJ9HpDDwve/Q7av3EKjVWpLokppqMT0tKrNa4vXcGVPiJiFu5udv561f5NYoxO7cm9ySXYgAj
	BW/y2FYZwUnXEC+VmsRX23PBi6oqvW94rDeJsMpj5ZSe2Q8ZLHOiqZUc2ye3Zte6UOsHA+pYJa6
	AoXbmjuG9+eOzFFTDRKKQovRwi6hnAAOhkHahKF/ibC+yD2QAdQhehzNmVZ/DVig66YKZkGeoM1
	k6PjxWGVPfkZE4Im67EDmtf+s=
X-Received: by 2002:a05:600c:8486:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-493e6844d66mr2085525e9.14.1783471467426;
        Tue, 07 Jul 2026 17:44:27 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:26 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:12 +0100
Subject: [PATCH v4 05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-5-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=mZln1b3un7cbjtyyqStjeOQ9net19lXjFVDIFyOquDo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1csJSnbxl5DRubtGvijMMbOErwHClEpxdoA
 +LAbNUbn8mJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXAAKCRAicTuzoY3I
 Ohn3D/409TEySLFfraVAwgFFRFVLmHeIVQ51iX4GEnIRDnAM4LuI84WtZEwzRT3etLtBunX+GUK
 kVD797sKMUNZe7hG2y3j+p0lHc0khlOw/WjiSJlcCbH5Iep/CmXJYw6chVhQcqF3GB0TWfhc71y
 +XNnlxoDnNt3kJbBeO3596h5DjuiAE2RHgJ4cx5D7AIekX06AVykvlB8f1WR0yjvcnqZE4LPBZR
 +r1T7nmE49g7TTlB3K853AZKcCCNzKGSR+YwMvflH9z9aLPUYIKDRNnpHeIKdPYri3JaUpJ1CFJ
 5mFt5rELO611vbzfcL/FMWswKf1e7PUEytSk5p4fE+psxGgI2f2JK/589fKl9BEpe+iQnYNH228
 JEilXKsMzNUU43/D68rFsXpmBcHRyosqXZXFJutdnHLY4k62GzhmJjn0XJx4Ga2b/EHRTFCzl5I
 jeflxhcwUw+7I3UvskRGfrBBhmLEKveksu8GgmNVJ8WVJOpZ8NJ5xvLMYirQI0+NEvcfd7DiZvu
 FPdlauLUsCIn22kG9yIwfhP0f3Qi7KtkMgeHndVN5G9TMYaD7JCyAS5iK8Dexp1r+cC76udPTA8
 dkVF1uFc7xBHsIVNe12d8q4MrZbDgKqPVzs00sqwL8IuN1LqDBlxnH0Y3sQA/nHnPRrsUL8e7Kt
 nMQXcyUntrckDdw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 96 ++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 7b9a40a7b9a95..838ba830433d0 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -933,6 +934,85 @@ &gpu {
 	status = "okay";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep: endpoint@0 {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy4_out_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
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
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			csiphy4_in_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				clock-lanes = <7>;
+				remote-endpoint = <&ov08x40_out_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1553,6 +1633,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
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
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.54.0

