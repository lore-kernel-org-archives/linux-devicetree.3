Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D115F3E4C81
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520845; cv=none; b=ovZpAn2w3NedZSP+5um4bYST7I7TMoojq+HN1M2Dc70qEpjHCyJ42MxdUSzxnHlZ0+VvlUDt9ucvAMr5pPa5Tkyg/OT8imLixhObnJ5qyhhAvSiA6IfqmtW0onWV5Y2X0jA0uuoDRq5lBwfQAUeH3qdCof65JCdaF5pbXnE2cPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520845; c=relaxed/simple;
	bh=5mrLHlysykFhdYjeny9e0IvSvZETUsnH0rBTXjiFWAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knvq2QZtVwrtSdRYdz+viqaYioSTC0y3605fvXe9auSVDEC2ewGDYR9HCbZVCT4rvgz8ueT9vMxAWmlPi+wSHCguMkLSoJQ2PtHSr6zuVBRQDdiGzMdNYVGlNpS0TityvHnEqVkHjcXCcEhj4GF7SrZRzclcB2LvY+JXFnva3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bRfwuCiV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRfwuCiV"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b40003d13so503650f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520842; x=1775125642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lSlEhCD9G1AWINy/iJq2Q0jUNopKJowuDsWpnazgRU=;
        b=bRfwuCiV4GJjHNhx11l6Jt2j26gxZsy2TrYtKWvsviBm0l0guc9myIwBlSBT+W/a/U
         dwSLrRZxtKYNeupORvBJnGwJdNa3ahhzAzigQRz6a8OMc96y2NopVy7INftgG1DddwH6
         Sme3GeI1Iuty8CqAmWZEtR2QhANzmB/7D2515M4FUM/cNFcwJDpIxJaKGkWCzK2KksPa
         BtDh5Q8jpblsDvsu7ART4kAaT3YO7O6mWMnEM3t2QUhhfezRWjhPNj9/1+4Ev1t+TEAX
         uzkvahTJ0A+NWbh7AM2MfJ60nDdSDj3G+TQj7kTz+CLgQLfPL6Xc0GJjClW92E7V0dHJ
         bjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520842; x=1775125642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7lSlEhCD9G1AWINy/iJq2Q0jUNopKJowuDsWpnazgRU=;
        b=lsQ+nf3nWH+YcaX1wbsGEWtorN0JFupH5IJF8e/bNi9jcHtlI8gyHRmZROL/TqkM1f
         pSdxn6XohxHjyHCic2mljF7fF0CRGv8XfUIwEQm9AbYDF7fw8Shfu4XHv1moplNuSx1c
         l9sSYY+kIhqFoI5ktXab/T95WvszxdEUb77gw5RPMpUiI9kPGKCFblLtBSVGhxroSauc
         K/QqXZqBxWWYRPxnNkKLOvKoLozNQazypuEqUGqqfCC8XdCwzaRyX6jwOoacT0zqsZHc
         8q4IfOLGi7Y1mvFnqI2GtmYRSyWimilMtHeI1vYinm8Sia5TjnkVXIm3fX8M+d8BRoe/
         TUjg==
X-Forwarded-Encrypted: i=1; AJvYcCWEkhv6FFjDCJGS6Rc6tIjnXxekQiv9P/RHzPy++t6NG+6jrSKQxofe7liR6Rdk8sDRj1TBKWW8I8yI@vger.kernel.org
X-Gm-Message-State: AOJu0YyONkAeX+2dZB+OTtmfcTUGt1ZxVdSJoSiUyrXkvBVS8iJBzyZz
	cLNyyP9ambGPFx5WZ4mEUWFYCCrG8JqtIeBlf5JanO5fCULxb/XbvYd3G0ZiQeZckvo=
X-Gm-Gg: ATEYQzxmkCFoup7QPbAzWf1v9Wkt8/xbL/K+NRbv3NXULfWPt4J6U56PAFsaojO95JG
	/gNMWLgwk69xUI2ue1JAQ4ZE5FOItkcz5obleQG8zYrtd9Lv9bDYyM4FH0E0aL9/hCDdVLoGoms
	cQ+PEGlHvIpYWjozYiVSwp0GsmXG0eTyiL4or9GGO3JuMVqukhQ/zbDdVDE3goZBVynh0S34/pb
	loxSN+bCWmHY9p5r9vIbFz129Z/MnxMG+g2UQvgW3fZ+32DAVFKTh9JHdNeM2oerIRbVjEedj8h
	n+g+HbzClhiljaeHfzqCJV42ubgShblN47TSR9PHGzlvCH/4OLGRrdlRsoxgW+pudyjxZkR+QBd
	kXHluGfxjanfu3L/jSj1dYa2BagDAZltLlQGDkBjzMF6n9ZS8Y9DzwkQch3yaTcndhfJ710EXvT
	XQhjvjS10PV+pAHYLT1AlVB6tOJYE2vPZXPA==
X-Received: by 2002:a5d:64e4:0:b0:43b:62fa:e3f0 with SMTP id ffacd0b85a97d-43b88a412demr10577724f8f.48.1774520842179;
        Thu, 26 Mar 2026 03:27:22 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:21 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:47 +0000
Subject: [PATCH v3 10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-10-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2557;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=5mrLHlysykFhdYjeny9e0IvSvZETUsnH0rBTXjiFWAE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQodHu+T0xONtduhALiQzO8vEtcFcD1b4orRq
 7oP6Y9XyD+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHQAKCRAicTuzoY3I
 OluxD/48hcX5spmpdQYuMfiE9QNclcWDMbKV502XAyuURAlOoUkfhrcPqvL9ELQRiuZMFWkYqEX
 iu5LFGtlyrfzDW63l9G37bUP3q8FYLvoWVuZcFl2nNgueN2woYCnfjsh9fgScG/01Z9qrtkoYSZ
 1PMwMf2N8EObJTuBKyro8w3ofQAhtPLKWqEjQYun75spnWHM1VxfyZNmClkNWBTftfV71cyHWrJ
 2+mxLv07l6W3vpHbNxDnlEf25sforzIx+5p902gg1w8LAlO+ZlEXCiERM0cYi7j6Eg8Q3ARqoku
 l/x4aO0DCX5tGChgtzUJwnZ5bQ4pCtj22eO06ra5CgG3z+9vhb+7EhrouVf0Zqx0b+NBtTXw/mT
 r5dgtyNEjQ2L71AFDbZLueSs5AC1mkeelMVflqiswSE0A3Bs3hJCSTrozLUBfJlirTqg482AYoz
 McfuvryFEsVUcVcAI/M9Y5gReIYfSmvunNghw34fgYdzkFIuRxTM5viLK8Sl7i/rKzGEn6TdW3+
 j+1kza3fCCaBaAllvXV0Yy2EvjJ3xH/runU3CBq8SDwp10iIef65XvBSSesplp5JTw/jKNEJojU
 ZmA/P2ah4UVWqqlrzRQ5MeEcSX98r5RNdj8S9syzj1a7/PW7+g6GWjBVyZQOsmTTa6zpJeLbEYH
 arPqTL+VPYZFJHA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index b09b6c87132e9..b1f894a9805ae 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -863,6 +864,66 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
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
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
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
 
@@ -1410,6 +1471,22 @@ &tlmm {
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

