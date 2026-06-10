Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74F3E3C50
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089837; cv=none; b=dSAIWLTzf9xlJk2OdeeJ8RKOZXzBoZi6HVtQm34RLTkYGF0bHZqUgFh8qJ+pA3ktSovs6GD7KEiKz1YZn+m//DRZtAZuDsEHYLYifIk1SQCtjgqRe9iEvJJDAJEv52sAJQw9+XpgEPglGplPjomUnRzqDnNAypcGFoKMaZHY5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089837; c=relaxed/simple;
	bh=8YxhAGTFZb0zJ+5hLjkmzRBQlB5GdZCVJR37ofmfwbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwRJsl1LjRhHQolnacIxqwLF9iK1bWH4ijY2gUKpu4f3rQTPgP5lCIrCcqN86ne81TqB8/52WUiqAJfHcADsqTSnCCulUTor1QzyPFwzjamaiqcqM7V3akXq4ioWzbx/bYtgkaLOWMnAJdM/zz71SO7PoEePwJvKiYAx8WVGbYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGoX7J+H; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGoX7J+H"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36baec934b6so4306262a91.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089828; x=1781694628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dePUqSBzKVLV+PoQEp9b+Ylpu4iFynHLielBVDVr8q0=;
        b=GGoX7J+HqPw01SHiw9alJlAwIPtoim/xDCiFREqTajKrDRCXKbXYGj7WPJlyj6ZFjT
         SzFwCMJody6MmV6pfwD4rUis95kNmtwCSZPTtWM5nsbYQhbBitQdw5b34fsY9iy67ujj
         AO9OorjXwVEF30UzvUCL3wiSoHeRl2BeCV+Sbgwv8sys8Dqu+Ev3VoaZGZ9jP+ntFyCh
         ME2HvWvEF9gPF5Mv3qHo29V29Gl/Afw1qkf57vdIHannQErDeo+J90LS4b6i/GpIFPDn
         9ZBWl3Vev13R56o5MtKRjedTQ5mGJd1amsX7g6GX0VxPcl0w2YVbVF7Qd7ClLtGPpsq3
         OktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089828; x=1781694628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dePUqSBzKVLV+PoQEp9b+Ylpu4iFynHLielBVDVr8q0=;
        b=k0zkwrzQQ41fJcza0MO3DbJa8RsnHy1GKqRw+5Qc5RPrddb+b++O/ymabsJk0fOv+c
         tBCBSNnELvLAZcB5f4sjYyHVmjB4sEr9ge0qJQ4gBjBudA78VfzkzMRBopEflEsVDOPW
         PQ+dW7Ae1K0lve7772eOsTGuvFkryTEkZlM9DaD7NFhC4lqJDiziD/g4X4j98/pGpowZ
         tsIBApuxnNxaIUKs2ljXTNh/8R8Ap6fwROec8aMCDe/pAFj4oMc8VGn+ecilAewchlwE
         CxBIoudRcSmcqR1x8inVeKUwgACFqSmuho77SnC33ayTtlT6u8aV1eoPOOGs893CUIW6
         fgkw==
X-Forwarded-Encrypted: i=1; AFNElJ+cH13qJ4D2HgQ7qgxIZRqTW980QIYyqMT05FT3KTFVamIv93Pf/Dh46DnpXhMDmrp48r6ca9TX29U9@vger.kernel.org
X-Gm-Message-State: AOJu0YzhaQcuKJfUE6uNypeMKdiutuomBLRVKJynFOG05FU0wCwdsro6
	+Bn42Syt35iW+n5B+s4PDww47ofzUXiyBYGsIKE/qZMrs3sAalLGbjO/
X-Gm-Gg: Acq92OEtSuHsCY2ESyH3/2y8VQJ0uGHcoFj/rBKNvhaxL+iC7YC7mcKIfmxsucVwrBQ
	+pyydHyiRnwAz+Cq5dm1a+xYH63fSvMadb0h0/YPxf/jkDplp7W82dcK4Sytm/W0/DxbiP3pRxT
	eFp9OMqqxC6vNV+QUYsHnvjgAYaA6ClITQLiIgjbHHhENB91oNLzVBW+5LknffxbjNea6g98Iha
	q5UHMbX3kVzUO0qX8zAyWDYTQ9TKRmHvsGvrOdKrpeTQbo6YOLkCiTvtV3LuGqCui+NVwFfsFx/
	3aPUNa5CCXSf+jcE/GrBMm9Ghr6lqBPPftohoU0IZOs4qTGjT/pk/BDYYUwcbtCMi7Xif70Vzzi
	gQiox/VkZbDB1dDJCNAJ3fzDBOSAn9o7Raggy/iyLPRAPEWRaOztXTZBHU0h5XJGM4ILjLzb0hF
	HjEIsfCnyOejwppxmHYmO+EVY6ZzW6q3aC63Xoc4xBG5si7o8w
X-Received: by 2002:a17:902:ecd0:b0:2c0:b31b:b19 with SMTP id d9443c01a7336-2c1ec7d946fmr212617895ad.21.1781089828462;
        Wed, 10 Jun 2026 04:10:28 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:10:28 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:26 +0530
Subject: [PATCH 1/9] arm64: dts: qcom: x1-asus-zenbook-a14: Add on OV02C10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-1-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4082; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=ExaW/CgRG0HAtMjfXaofM76A3HEZ9NweHa0eL8KHYN0=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYNHeRo8C16a/eQs+ObZDs5Xo5SL21lIPOY/
 Tm3XHkc+cqJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDQAKCRAVlYpeERwF
 3mO/EACioDVqwwL0R5nMPC0+fQ3U6mxKkXRbIEJQwb17WeR8zy/5VJxVTVluMl9PWgVyD0Kveef
 6JnONYCqscivv0zqrj24Sw+JTk6SExuQkePDj7atKMZxFca2Nu5HXpQEAXWbqp5tKwiVWt7GWtj
 FieXbKrSM4Yp3eyOYEIC2e3q+D13idPqfG4jqpExYg59pythhUI+gbgVIQB3dyZkMHtON85SaYX
 zZfWZFoFsiFKDEzIAfh3g7TsU4J8/vp9jSA/J+7KXd3c5kMcyjUFRG2BW2wXcQhQZ3tV4qnfqkV
 ZO4FkWbYzIs6arGWhIcrDRlEtaVDb9vLN0UC+RlOdiU4Lw645d91VQUhe0ImObf3c59rXdnfbU8
 XPOdkVUYm8MPwDFnfWBIkWthblyaQ2hi/f+dBtXF1+5QFNb4Tq8jVkxVks2i1vfQJ2gTnlwB1u5
 2Af2VBTrQlm4TWu0S7LJ6fuhZn11d4carS1TTDUMvizNhqxkSy1MIxjb7vdhR9tje8O4uA4nBUQ
 U8Si9Ijv54wF3PEanBQaAZcspl8xp8g62L09GbM8EYcBseVlXraavDBtj2qh6mW/lq5Ke8WqH0t
 iOgoPxfbj4SUmw9+W2W3qJ2G/bqupsL+F5qCZB3YiJLCi1vQwEowDhfqoOd60T+wk5uvOjp60oW
 XKHXeefssu7uD1g==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

From: Aleksandrs Vinarskis <alex@vinarskis.com>

The device uses Omnivision ov02c10 RGB sensor. Reset GPIO, privacy LED
GPIO, LDOs are extracted from decompiled AeoB files.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 109 +++++++++++++++++++++-
 1 file changed, 105 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 66d566808f58..388737eaa624 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -108,14 +109,11 @@ leds {
 		pinctrl-0 = <&cam_indicator_en>;
 		pinctrl-names = "default";
 
-		led-camera-indicator {
-			label = "white:camera-indicator";
+		privacy_led: privacy-led {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_WHITE>;
 			gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "none";
 			default-state = "off";
-			/* Reuse as a panic indicator until we get a "camera on" trigger */
 			panic-indicator;
 		};
 	};
@@ -546,6 +544,13 @@ vreg_l6b_1p8: ldo6 {
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
@@ -796,6 +801,86 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
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
+			csiphy4_ep: endpoint@4 {
+				reg = <4>;
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
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
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		leds = <&privacy_led>;
+		led-names = "privacy";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>;
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+	phy-type = <PHY_TYPE_DPHY>;
+
+	status = "okay";
 };
 
 &i2c0 {
@@ -1283,6 +1368,22 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
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
2.53.0

