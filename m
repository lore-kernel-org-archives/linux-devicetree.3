Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527E368291
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471483; cv=none; b=pU5O7elOhKQeVf/Qps8KLQb8lhezgN2dkIwxzkWG+HGHXs8k4uXRExVOE1Pf0hwOJDp23YspK2j3bKKqxGxdlhJ0q770w8PvHNLVm7X2xh+lxwl8uO7fI208jGy43CRLqW7ZoVJkvbHNoj2zz/NmXy4LDKbuDbC1lszcFTTy4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471483; c=relaxed/simple;
	bh=wdTjCu2iIapoyCDwicYhqowPI7KxEg9v/HwTrOwsTfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTymAp8zlCS9tejqkD8LddA5MayxGYvi+nkbdriDDEKUVSCIEz0RSLLrxXqYgpY5pr42s5ovkYuaJDeZ7e4TP7dWluscrMB1g9i7ERdtnSZYXkngb3Up6sldnn9nnPd1k+2rE+YB4AW0683s5kKChe8x6PfPQiYESHUQhTzOYCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SH6sMXHQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SH6sMXHQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c83474ddso569335e9.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471476; x=1784076276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eL7C2TivAhFoMuIpE15O00uVHzYATKH26ir7lQJ+yLo=;
        b=SH6sMXHQ+nhpmnHSDroSJuvGvzfwWoixZ+U++hQwML84xYOgbmVx66I6k3do350Q3w
         l8LZfVHQRQtuVVdjgBeGA1G2MZ5TNli9B1VMnNmZ0Pu+2hKvao4Ms7YVH1gKbw51tA7Q
         N302F6pfYNogpexMPzsNyh3PuveF0dCoW0nPSkqm8EyXdYhb9w9pW4XrNkU25OWh/BON
         r1xqTYOFz+SITpf0sxLT9ZnAQ2PX1uTEhct0jhp1sdZBUPAyBN7LxAWdaCur8jIlO7QE
         ovIBc9hLwWGTfrgjHvlnFeaPWVgtAqDxXayelJMQFtrReuMFIuMHqYw/6u2sCI3sT/jc
         l0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471476; x=1784076276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL7C2TivAhFoMuIpE15O00uVHzYATKH26ir7lQJ+yLo=;
        b=MV9lyC1NQy5m/1HLO+ZcKHakR0YfClqL1VBXBjoOfS43s2sGxmIfDO/OiALilZ5VZx
         wAxvtGZgdSipUX+buxmlE1kUVss5zHC8OPZO2dgSJSw9GACQQ91Du6FiSRHA6IDsgOsp
         /AUlozQtQ4QEJpUHbI1BY3yJE5BJk6ClOs3FvyPZ4AGkxTxjTHVmVOuErdwQDyuNNYO5
         ldV0pXyjpfdpS5KNLpbpHh/3jv3JEaYIz+ZIXR0bp3nK0n8cCU4TMhLGqgDwZzAG5B5A
         iuqqzxSL3SYbPDit+Rc+qxNmxS15UNCzY1zOY9S5E6B5S79teH7S4zHCQw3KDFbPMprX
         lviQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWMglAfGW3hvyhFPyKDh5p6VuR0zVoZ7QkP0FZOXv91JJoGSyc/QsYW1+1MjsKnjCuF2wnmJl20qss@vger.kernel.org
X-Gm-Message-State: AOJu0YwS4LDlpHMzUoGE62Tugz1A8FosA9A/sadYW5A3/xmCT/RE821G
	my/Su96y8fXOGIAiTn4fHj+84AJ88ID2idaCObb1ntgucB0UQ5Z7pwx8uNAEGNsgbaI=
X-Gm-Gg: AfdE7cmq5Yq9cbuAbbQuaCxUMNujE7WWC+oddQ0UHJXRP0apQYgdWURdF/onaGjrqOh
	R4tOTJrRSgalPbD4YXHqiucqksjtXCGzIEb0Dcqc4ic4sbZKzecULpFrJ18coQHL7ZofPJ1bnrH
	rlXAcQ63Vfz9pKP3JOW/zFGhZJulQxwHFQa8gmU9yeGGDLpQaxs9W1I87b1dmsE9qSB25IsaFyB
	FBxxy3R702lUf8UXxyDpzlbi0D+QTmYSFfOIPSJQ2og4/8n/nRhYTBFOZ1t3OBhBs/c+VtFRQMW
	dp0Dbi2XhxaFwRCyPimp3RgJvAGExMwVui8cY3ZQ91zwrg60eqUn1uF4FNo45aeDDjvPRruwINx
	NoT7olGxm65Gw0ZcTrFOnfwKtrFjvqd6fQs0xNQFqgM1IB5KsvfSP/UlxncCwgfRJl2YanbdG/R
	QnFg9Pjzu7SIUiYcin40e7nHw=
X-Received: by 2002:a05:600c:4754:b0:492:5145:f054 with SMTP id 5b1f17b1804b1-493e68e750dmr1135895e9.26.1783471476565;
        Tue, 07 Jul 2026 17:44:36 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:35 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:18 +0100
Subject: [PATCH v4 11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-11-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2402;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=wdTjCu2iIapoyCDwicYhqowPI7KxEg9v/HwTrOwsTfk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1fqA66iPWXw6Z1WlOawNeu7cCv+kEG5n99G
 xDuTpkStTKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXwAKCRAicTuzoY3I
 OgJ+D/4t8/ggM678NCIecsTKlPzS9uglAouDpGM+XNnnUrss9eR7GXV3mKvOoBTbESHaesQkVCX
 rzKGYZhy4CwK6mqCJjLtaBKoqdwyw5FHTgngt2RcK0k/jwhS5F0AB1hs14f2mfGFeAKtypJm+Be
 GuJHbBaa8XOaXZXThAGIY9KA+HCSefNKimICd8JY2ghcZp9sYgkYZ3i1DgoRw5XHsqu8gANemXj
 bDPLlzuYfcxdizonIvM08o8aqpK8D0c0KO9LoEpqXTHhC45KGuqwd2ETq5lYiOTbkCvJeNLXmh4
 AkJuwmD/nGDKwK4sQ+jprJszHg7WVd8FU61Z56WMdQxI0d09zB1cgrzYVSXuwgnMzMlsvfgDBqT
 rq/b6dSj6h+p7GOJUxLY0e9QeuJ5hp4whnG+D5kxUw0rUCAzf67lbhVutwzVC6jaL5opGSkedQw
 UGtXUm2zUkBkw6rVgwgqw8EkNwb0PE4FaW8p3l38fxB6zGkYPuft7s1h8y6g+fmdvSWO80ltm72
 7TOgpgWPvZPmtSLG3RFUfv+upabS9BiYLwCmn9l/hD+yuEcM1NlT1ZvAvtiVbbIUe2qtoF9NmM6
 ioFXm2ANiFI0jlR2LteIFHF7GbcTrBhxGlNqwvlDZDF1XcnSaxsuBcYxJ/9ok4OMtsF5q78epFv
 HdLVyTu3BE8ATGw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 83 +++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c7..63417d942b13a 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,88 @@ vreg_l3j_0p8: ldo3 {
 	};
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
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
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
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
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
+				remote-endpoint = <&ov02e10_ep>;
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
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.54.0

