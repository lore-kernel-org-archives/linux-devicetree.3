Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9371369D42
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471476; cv=none; b=g2bCFPLKNd6zZafjCLpotoHrakamNsFNqbKBum2Qmt1mDnswDrk/htl0jXU/quqkHwlzNRt2JMpprhpDctWZKvBH44JJ9XcZoHDfnMP0e7ZnMDh7WPsKnw3GT5JHNy0ii3RMni2oNeYRp/2WrvrQfJjNl22UAm0regVID1A4XDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471476; c=relaxed/simple;
	bh=3nogGGrXBxCDLwqT1oTOKrWJjZFhISOK5ofoQzb8Ums=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ri48CEa/Z0n8iszLPlFB9/gmGpoQqJQixsZwLI1tUeM5yy3XyhjZoCPmjhHfTWTMC0xRi9cKhVwpiZdDSYVTjnHCejzKOVSE98ibC9RtcqsG277LHk6kv/0OtZpfKYNh9NccM1vADdJ4LjNVdggUa91ScCj/P0uTqX5QtATg1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zVMSwW51; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zVMSwW51"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b77b150aso580905e9.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471470; x=1784076270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXuluUeSrIOh59TquJfEnMrNfJnCfonDeL5RxJtL298=;
        b=zVMSwW51pC3ZhMSSPEYrmPZ3Liuw3RIZS/6JCB4J2rU9xpJIBEZDDZu+pyU+Rujiub
         rbKjuCBVo6wp+6QUp/Ul8MXpOFVnEOMQqaUWzzfO3bwOjGfUD1aqaya810q9/wpY5aHs
         OYF3vNOUyNh+4iLrR8iBWtimYvBkZWaKgVLfjN+BOxzxQpRI2Y6mkRkp6BOdCZR/PThF
         Qpmi/BKYVmYpemsbDAV8zHJCtUEr5+nHYVKuyFTWV2tIVuR+4TwuIP0RfOlrCyIHqot7
         QD4nSUt93d3VYlJeSq5VWUuHMYc+CRvFUANECdhlpGvr2SiHhXGQQIlIRKQpcL9Gv1PG
         28Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471470; x=1784076270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXuluUeSrIOh59TquJfEnMrNfJnCfonDeL5RxJtL298=;
        b=N/cBK//K4dF3pFXdVwPi1aa64BqiDdKXdkSqQgeazgXW36mlTkBhziFwdeIiyugMX6
         XM2kTofwEHLu8DAiZPLNZXqUKZIUHeRChsEfIOUsQ7vvwTpxk2IWcKdhWlSf9a+7GBp3
         Qgx/5chbSoVxlzfWqNRwrJ8EEUPoxxuFL0v2P6FSpaCF3McsdPOt1ZLjaPQHCrBrLfv2
         abJk1vCurmBUFsw9izSD+JRatTHjMsCaFtKAuHCWFLxe1pINcxj6/VjEHbR9/GdvWbrq
         P/ltyHaCF9wxvbpMsZOJ1aaM0uWQT8WiY2ni8H05GtaLfLaD1o9W8Bqdat1nxMa8jR5D
         NvcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrc6qm/T1E6rtEdbJoogdU6o68zPZEpiOUPK5yEzJ0glBFkBG6SrW3jXxR3CfF3H6grUpEy1yYOHRLW@vger.kernel.org
X-Gm-Message-State: AOJu0YyfPfg3eZk/FwZqWC2pRRqDOU/R7CXYpwNYFAomRxtTHqkraAbY
	jidFrnEs/VKiVWduz7bSanUI16+8Vne1GuTcLsnxKmHIET0NDlaUPZxkDqXZ5SCQDeQ=
X-Gm-Gg: AfdE7cniA4oxjnb3cX7Kye7qVKhMT8tuKnYXCfZYzfFEBZPx2hCeTvlCvAQhogzEyBO
	8CEJ40Q+WcB0UWXDvSSkk3WDpLvFZmFw7WfYISVCc9k+cfUqosmGE7dPFydXvo5r/BpneTDeL0t
	bDnRmKmbgcCjlia5Dj9RZ8D1F3l5/2oWRw7tsAgKtNdKaVS9MGTzNWjyfs9NNQFtnb3Jr28eBJy
	QBzoRu7n0oNvYnBCg+zxYZfR/oYGimkuSszBPWSHlNtezjVgqdo3VMzGQV0BGh63W0tnrmDcY+P
	61cVE2vLn+47OD0NTPPP5m23PwUx9ZpSWkzct0IcyVaYSwMni1caU1WPskM2hfR2hAYttiG6Quf
	RgTaAU+ECry3ChfPbD7KBQRQGWUzPXfQF4s5Vwx9Q8/N+pl53CzsgZo7tbOiOXLRbWbem4HcvxB
	lXgi414cSyYN3g7Szu9wMmOTks2unNTa1NqA==
X-Received: by 2002:a05:600c:c8a:b0:493:c3f9:65a2 with SMTP id 5b1f17b1804b1-493e688cf81mr1630345e9.5.1783471470092;
        Tue, 07 Jul 2026 17:44:30 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:29 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:14 +0100
Subject: [PATCH v4 07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-7-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2936;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=3nogGGrXBxCDLwqT1oTOKrWJjZFhISOK5ofoQzb8Ums=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1dPNoG6MAh/VrvPGtPZb3t/6dMtULpdp/5H
 i8/M4ZKwkCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXQAKCRAicTuzoY3I
 OktzEACZuE6zpAkWqjjd4PvoPB0eE/dUAVl8Q0tKn+nBtvhPu55S6i5juwLs6uX0cvy8C+PBnNR
 BNzOs+BeWAa1iTB8E2KVIUmfKFgNmVizY83TE9otWTK6k6bg9fXQGTaTXYLG/qkoHIGE+aHYntv
 kwb53Lvf/yDyHMRmmo6+QPQioyJnYF02oiSvdTAU/kFzw4nvO0GZgZS6cM6RSkvTa80inpvQPrw
 Z200k70UgDHmGHxh5tZdUmZyQmAcVyRRwBXSHsG2GrOQgvzaLW3SN8V+uON6I3+3I/MX0KLMkVG
 hu2159g6DtOQEbTkOowBZOOuVVbJDPL8johOPyE3+Id+O02M2aaQ9xgNXDtkBXHHG9bJGy3AS/i
 ARRHuFt7HOP4AzOoboR4mfgwbEJhKsYSZs+V9sCXMZybyz3MT/Tbx4tvW/qIzyiEOAVUZn5qaJW
 47kV4wItnTVusMW9G126OmnOKuEL76FMQBXyuiedXKqCVGA/V7dOVlf4u3xRRmoopfgpH2/c2Bv
 /FUt4wd72YiKvKYSeOfFh+QcHSjiqAik5fFvZY85VJMkk+gcoYK76+xXvLOY7ss6DrbQU1QYGHD
 YiuWzDwsP8viP+bqaXT+3eaIqIg4egmOC4ZkqmcDP/DiUNNpUQlCmN2vPMhlbRg6bHDn3iw0dKL
 2vSBzz5dfTm3C+Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 70e50ccf67677..c5c7bf722a45e 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +867,88 @@ vreg_l7m_2p8: ldo7 {
 
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
+				data-lanes = <0 1>;
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
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
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
+
+			csiphy4_in_ep: endpoint {
+				data-lanes = <0 1>;
+				clock-lanes = <7>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1447,6 +1530,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
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
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";

-- 
2.54.0

