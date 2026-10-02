Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1360476079
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936282; cv=none; b=XQLNwtyPUEdnd3ncZL8ndPI0tnDXucrJUxTqdJo0D4kRYTULIyyA14GS5KbYT4AAgXujsUi6Uej8cO3HatFyqR+F5YBOlKeWmsKAqApDMW+gOS/49VaihblTL1YNqeNfZNtOqaZ+F4QQxPaeBtvCvKJ3KxOVHHHbZP29RfclkyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936282; c=relaxed/simple;
	bh=Ei67Qo4DiNjBwrbkavt7XyuJmYSPj7Zjtor+5aQhLYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lxESAJQnoL82YjU3eV30DXZv6x6z4aZDVV59EBlZ9JrxWeVcOr0VeM3Q/7Fjv2hA9rJ9grZdEUXGWDex/hff59zruKdpFWy+HlTFV48fiKu9iMd0S51yXp9zUn7a0eY5GQv60g6y7MWrMg9i+OgMXnqS42XceORCZrDSDvjr66o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YV7uSNhQ; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YV7uSNhQ"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d04b1077so690581e87.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790936279; x=1791541079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwHVlb6qd1MABiGpHpCoz4HeQSYbdEf5B7Ks+6PxqvM=;
        b=YV7uSNhQkFJ3zt5jZTHum571ob5eLw55dAWBU7Bp5qzq7jr0MhuihF1t+CqTQy5N37
         hwPv4YP8vRsxRJWQXhbyiOPsiMd/rF0PsHUntlLskD/TYJvXOMqABHQFeGOG8YXgKMqS
         QJKeduhL0juPC4yfk1LJpbHFSvSRUeapVUrRhWkP9L1ZfXDFG2hqTIQ0wyCw9zbydjHR
         Ivopv5Q1ilspEgWfsq+InbDY379Isb2fOY8EgE7ZnuAd4GSnt/z0vHvR8i8PgIW4swZo
         6IJgzJYSfXHPP17Wj5NaHr2gZH5JAFP2iglPymFjRRiGNTjaGQt9YdCmU4R9UQkHi/vR
         TwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936279; x=1791541079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwHVlb6qd1MABiGpHpCoz4HeQSYbdEf5B7Ks+6PxqvM=;
        b=SC+eyPnbIoPnvBK017pUtc+YYah96nlvW/7kHAw+OqA72uNNMR4gvSJbhjpMRVDRYl
         d0mj6HR/NhabPb6qzaFhJBdtwciBRQr2cVJfxH/9P6a/4KiE167wPjm3feLmHKiIsqDw
         8GyC6PFV0iCyPwURHYsoJ68BJajkb8UzUXMQiyLILnTQD/5UkChn5YKoW2zqU+7iCWxT
         nzM50g5ccfnTldF4hrVgBsvhI+DNTC9JcSy1XEjN9JIAAESkZyzi8OXoHOQ0x8DQ+vVr
         229oc9YoCEQh6X12gZ8pEQUGOzr++MpkIGBhthsLUlHYB/afKNWQG1j7GCKa8XHAFM/d
         j++w==
X-Forwarded-Encrypted: i=1; AKwUvBx/CSmYjpowCv6VgkzvTDA5QDRyJwFzSJS/pQTQLmDbpM2NZxjca+xT7sF/aXsipX0k/if9xDEY4iV9@vger.kernel.org
X-Gm-Message-State: AFq9FYKrLqWNHCxxSEJhU3b4B87jW/U/zeUbnU1sQmq0MTMru/pqdMuH
	hjFQX+vS9FX5pHeISBEvPSODy0NJXdCA/ePascALn18kGyyJAZm0TvuvlCUAxWhPMcY=
X-Gm-Gg: AYBFou17RuUSBzxS+/MEeugpn1mmMMz5ylgsoarkyAjgdcw6XDKkzGvS7wv1TtQ4nK7
	TE7+YdY0r4sMUheGHOJ8iARm3yNNULrDv8C4Kh4tMSplWOGXdiZKK4yXZNCRzEGcjC7yRGy1E5K
	Ki415qll+2ch4/TEOFprt+FPgc9TzUQp8wH/SjwxBLqrlvtmBdyh/dFfPJybA819s+6FKRdjHc9
	Go5rEyUsV3GMTyyHxhLmePaIgLAllaSCz+e3hitp+SeHyajLJYy6bggdgnqrCx1EPt5f9PZjlfM
	eju/P637zGTQ4AiyeIABAk5pxHB+mHZ1G+TMAUIvETpwCYw6xTXsHQbQqLRLD70tERjYtDQZPtJ
	aLw5eQFNv6m1EJIGWg8bf1VypXDgLJKXVCOGk65zYcmwPPRb0ebjnrAE41zyDMBf0OHGqaFOK/0
	mNrk8U99kpYvUDjcpSmpnublHsbQilPuHAMyLoDuZwVE3UYE0GV6WBq89GOYqRDv5LmeNR+2EH9
	uscgDy9m9SApDdX5zH6fStW8cE4XPt1iAOBaeY=
X-Received: by 2002:a05:6512:3c85:b0:5b8:ea1f:1217 with SMTP id 2adb3069b0e04-5bb9380daffmr814343e87.1.1790936278468;
        Fri, 02 Oct 2026 03:17:58 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c795b22sm583861e87.36.2026.10.02.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:17:58 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sm8650-valve-deckard: Add initial support of camera sensors
Date: Fri,  2 Oct 2026 13:17:48 +0300
Message-ID: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes from v1 to v2:
* added Abel's Reviewed-by tag, thanks for review of the change,
* split default/sleep pinctl controls (reported by Sashiko bot),
* fixed data-lanes value of OG01A1B endpoints (reported by Sashiko bot),

OTOH the reported out-of-range '<&pm8550vs_e_gpios 6 ...>' value is
a false positive error by the bot, the controller gets GPIO numbers
from 1 to 6 range.

Link to v1 of the change:
* https://lore.kernel.org/all/20261001145206.2442665-1-vladimir.zapolskiy@linaro.org/

 .../boot/dts/qcom/sm8650-valve-deckard.dts    | 207 ++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index d25a09e162dd..4120e9d676c1 100644
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
@@ -675,6 +735,153 @@ vreg_l6n_2p8: ldo6 {
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
+		pinctrl-0 = <&cam4_default>;
+		pinctrl-1 = <&cam4_sleep>;
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
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-1 = <&cam2_sleep>;
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
+		pinctrl-0 = <&cam0_default>;
+		pinctrl-1 = <&cam0_sleep>;
+		pinctrl-names = "default", "sleep";
+		reset-gpios = <&pm8550vs_e_gpios 4 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_l3m_2p8>;
+		dovdd-supply = <&vreg_cam_front_right_1p8>;
+		dvdd-supply = <&vreg_cam_front_right_1p2>;
+
+		port {
+			cam_front_right: endpoint {
+				data-lanes = <1 2>;
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
+		pinctrl-0 = <&cam1_default>;
+		pinctrl-1 = <&cam1_sleep>;
+		pinctrl-names = "default", "sleep";
+		reset-gpios = <&pm8550vs_e_gpios 6 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_l3n_2p8>;
+		dovdd-supply = <&vreg_cam_front_left_1p8>;
+		dvdd-supply = <&vreg_cam_front_left_1p2>;
+
+		port {
+			cam_front_left: endpoint {
+				data-lanes = <1 2>;
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

