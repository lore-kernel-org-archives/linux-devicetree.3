Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0F43CCA09
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520840; cv=none; b=jN/6sQQAy5E2nVm70u5ayg1ce7syPTLj570i1S9k7OlwM2unx1fP6uB/Ht6lvvwKK/6xwpcvWBmlV3OYBK7eMKEYW6DkoTgsOcvj9Pkv8DEMX7cU/qmg0eKM9MSUqiCGJzHEl6r2CsBj+9/OajWD0J6W+YP7HGES5hjRypVdn8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520840; c=relaxed/simple;
	bh=zThgr41Rx9Gjz99hFv4NSI9Mkt9M2V7QYNCYF2DLaDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMoYKp8r9VyzJT+X+J3VxOASPB49vqQMHMaeM575k6LTnlK1awa1lBEHCkpFH1bdA8K/C+3O9OO79FT0JMAlLufafH/fvNU5g3vzUFV7GgQm3R29p//c6sMaaELxJ6Vk3koxzxI8ivHU5nhpIlFvCuAfyUNbpWf817TTDvgzDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZHUL2prq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZHUL2prq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so528009f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520837; x=1775125637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hI5861g9V+AK8xL5a9qGA+PKhyksWvAaYlqS2+1AuFQ=;
        b=ZHUL2prq29DIJvykjoy3/F79A+wBWUwEz2aPF7XjStOvdjbsF8c0ymWy5/UAaCZZpR
         6HIuS30PLLYC3bKwn0+/7N1e4EHwWn5MWZFtsagWIs9NQv7O/oFeHiPAXxVrgwYwNKkk
         yqt1BDtXot7gAqK3IssxQaU4ZjnRI6Ru6JuditcUGNrKfA6sWMBTWnKMb/aqli96QWJL
         VyY1f7q/YYDTKaF2YbGix2Up+X5K7PuDZpUFwX57ean3ptuP2DdFgaNPFOaWEIimvwkO
         Mbv7DbA0/Gk8WdgSAcL/Il2BRP/N35yl3PUv1K3aXnacHDs2KYyDj+wtzaJp5rMxiZhx
         jPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520837; x=1775125637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hI5861g9V+AK8xL5a9qGA+PKhyksWvAaYlqS2+1AuFQ=;
        b=hSOpQb92soPYMknDeOw+aPBYv4Bm+Wkv1z6zLE9/7AJeKZWzwiq/bE/3mvWQWnktlG
         wyaN+RpH5DkWfGY44AMsMclzQYpdoreguv1C+KM+zDvEOXt1fEUaGT1zC570JoGVIFjj
         THVMx3AxryrGW3JpSj3q/H7veIfrQ9p1aG4uElcUhoV4McgNI4SkjLmM4P/htCDx29/q
         4bVXA1JUTk145c9517hEn+J3ynnTsUR+30kDdXu5x9IjdmjzoyD7RfJvbVJGyjlkUjZG
         tp8TJW00P4LUIfGg76M1MJsxkHmXgbxFcoD6fNHLjWsce4q04MmxlQpkt7GzCpH8Df71
         yQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCV4pJex2MY7J7Z6Uadw9MbUyKuhb4BPokWMHu1kH07jtDyzW0maPlTrTI2gVMprCWZX7O8amIdNnQjb@vger.kernel.org
X-Gm-Message-State: AOJu0YykJpCXxRUgXbAoCISLoxIlJ4p2dpNWgPani+Md/oFn/ilnTqel
	iVxc3dzY0QlwLA0iaX4n90S9gwMu+wKdR4KMZjmioZFZ3oWoBoVop5XWihgyhfbU8BcQyu5rwfl
	NQnZ0
X-Gm-Gg: ATEYQzxwioEPCnDpmDKI2hrpmvG1EcfHtTcAqk6uZqPl8DAH3RZoANK6MLkPJ+0fpNf
	IUszwVue0hqUVI679QM541aCinPbUPsDb94L6CAKqvjzfkrefJQPvPyf23jVVQvBSdnVilNpLj/
	bf156beA2IOCKaLv6emvV5fTKKz7asIOGLr9EGzLAVcmjqGptKLM5wRB3uf7v8vBDSmb2qZarPb
	1LvKPXAGPHrl+BIw/olst8QTnJtz7SuL/BmMJ2UBMXIgxLA29w2EIo6uehlMxxVbQVieXLKrYM/
	90GrOWBC4mFryFF3C/JFSrK7k9wzqfsreZ3LqEG5MNNmdcZ3PpiwvfMzMHqsje2K7LddU21ukgH
	CHGcLuIiD+ugfjM+RMjRJWusWJjFWMFJb9wMeftxkbC1q/ezYrbN1hdUY/JUTFGs5rBUq56VInl
	ekmsFt4p9ruZMru6N7XWYOSLu5Sf6nNN2Namts99yv5QQB
X-Received: by 2002:adf:e18c:0:b0:43b:5557:ed9d with SMTP id ffacd0b85a97d-43b97a69d13mr1598379f8f.25.1774520836588;
        Thu, 26 Mar 2026 03:27:16 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:42 +0000
Subject: [PATCH v3 05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-5-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=zThgr41Rx9Gjz99hFv4NSI9Mkt9M2V7QYNCYF2DLaDQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQocLj7dbDuts0vH/oNqsZVRMrwq9jkjxNulg
 jcnKUqu0U2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 Ots5D/9Z9mR9rouuaTHdsLZOUyLaTsMyzi4kMYhTsB2tDbjULcMedy+ykmc4f5B9oyW7k5cD9Go
 xM8xEmTcn+8/HYACXlD+mN4iIlqEH1m51Nv0lNfRSowdwzmiCLqXEm4hGvjwvccHyXurp/rdmQT
 Upd4qFBvzx5s9V9O4P7MRr8hiIpCj9YSyfdYKBsXVcRkaDlfqYbrnGzzYJZxQbj47EM3kJeLmqo
 V4o6EbBaDweMxP0UQa5sdLo9TOmjXKo+Dfs64imHHRVBNLXuOIxOI5D3ZW6VgDtle6f//HShhtq
 VASwaZuYb7eyo3b4MsQOskyjVppi+FNsGaG0Hz9zYo4PhJJOS/c6FwX7T0/99UoVKRPlqx8PcCs
 x64Urd0VqQ7rBFzD7+z/EiMAubal483XB5ffWy1GfpecxsHDXBA4AalHOH1bQKzo74tfmgULNxz
 TbUj3RIOHCzVujSRLAMgZHaMeoidhaWRCxTy6iJTVneqHKE5BxrRKZ18/Ggw4eNv7WRMyBKncKi
 8oIe8fLfBj5eJw1EyRw+UI6Ajhzro1Lefa0wAzWEgXQtL+xbNcQpg+GITwpzUshEmWUZ8dHpFRR
 S1azqElsTZLCfFPB3esFpVbSB3zCHUgxffrnkf4wi8bgyO5cUKCaMEKgwG6vKSCHBOFkG1ITnh3
 QVnEvfMHbvbBzLg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c89f5ad0aed56..567be2796d6a1 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -901,6 +902,65 @@ &gpu {
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
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov08x40_ep>;
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
+			ov08x40_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&camss_csiphy4_inep0>;
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
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1515,6 +1575,22 @@ &tlmm {
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
2.52.0

