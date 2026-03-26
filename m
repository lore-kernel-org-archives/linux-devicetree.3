Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B968D3C73E5
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520836; cv=none; b=qpa8NchJVxZsatE1lhbpm2R7xK2x+BrLje58AtIgkHEZ63LWq6sX9UfXxoUOzL3GmsBZ0gLc4nqE3fDFFRyqVi7f6VU5nyl+Y8pL01DPRHtLYgFQrEGJ5Lti+c+1mKyIsHVbe0h4/f8veg2/WheEa1WpPxd+8Z3Wu87ZqMvKVeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520836; c=relaxed/simple;
	bh=89pCG9foB/aUmIOQftGcQVpa85kxE85oYki4tXopqsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ibDhhiIRs+k/L+VuFtDvolwZnwTK53ftGpxLeNW/NEzZuy5LPqGXy7+H1AMiV+QOgwdu6Lxm/4ENInD1Zxow90Zi8zWl+HYdF744ChgPXi3PGBgAnmTTQPbxNUtuL+oZd/8t+rSV50Oi0k/yylUulzNGDwLh/hhtKMLALseGqBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gYG9mvMb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gYG9mvMb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso7051655e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520833; x=1775125633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvhMcTkFeg87VPIJT1Cy/Iqmh/F0pkytp6qTG1E/Oh4=;
        b=gYG9mvMbJIW/9XZg+poyr2RBuNgUG7B8Wfn9HFtURG32IoQvdG8DOzii5ML/ALv0Rv
         E8ku90Gzpvz42qqqvXp61Iue99g7O3Uh/3ov7rJwMpX4KLZq5Qhkd4/beqbstoej0QQO
         2iPFJ9pwSXWVPgdZCiyIjWdF8GuOZTbqBIIGHfHhJMjFRjRxIqTyLIJBiYNhesn0z/w6
         OQUH2VmXZT3YV4na0SCf80lLSj05ErzPUY5Bgq/pujB0sQawZEiDqJ5NReccJBOysmw1
         8PBpxBI/9cccUdp5a7W1cer/DYcHqwC9dQUkCrV0DscSS5IgJkLCYPYFQNPOAfNi3QPo
         0vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520833; x=1775125633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KvhMcTkFeg87VPIJT1Cy/Iqmh/F0pkytp6qTG1E/Oh4=;
        b=WWgkkUtl22j187li+iY5rYrJfFcYJaFWE2JRq8C1jaAdXSuBsecX6DKk8+3f791UcD
         PC7LoLjWXPMb1jOL0SnJGPtlivj6KpUdlszWpgm6OoTpBoE1rQs1ZmWG5QglftSn3ZM7
         mTvfz6rSNgg6CjDKqR1uDSrDdG6ZGyqdTIIYFlMoRcegMJGdVX34ZlmffdZy1U45k7Q3
         O4zKAIa/CLOfXPQNcGDP0aD5bXo8ycS5SM/9KemtJRdiuCdWbPVSFZNEAk89wof7Q3Tb
         T7M/azCDvl4B0CHizLuSInXmv7keeVAQtccdKX3BTJM20TSQGPww7nXJ3Rvaa5HNu/6b
         SG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkvw8XyOS65GI1DJKfqTnHHT5OAWwRtzmgxugwyHAbiEq0eBi2Wf6N9qMrumTtdj7iG4wpR6I+Z+3t@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5FA05MRVjzxiyMa1VSjLCVghduhgsq7j68OluHD0rt/w6mDKq
	qjnaYkIo5QRFtaxmhcuofFpwE11Fo/Pwwi4gY8Uc4VtNFb8d4M6ylBmWGotB2psEWgE=
X-Gm-Gg: ATEYQzzvGa2D5+1yPRK2d9RFTD42ussskYRHej+ZzeBS6Nef9Vb9flHo2JEag0uH4pg
	3vYsMlCwiQEEK6R2x0KrPgQ+YYWigN7YQ7HBYd5nA37qAK9EabgW5wvZ5H+wBW6DI64nJvhHWMi
	ImhfdFQDkH8auzt2ULVNmHGahP12qVTnUs6MZsu28nKJO4xU+GhcYWHa2bMfgTFFMsqqTiGoeHv
	RN/9ov783gazBxEIlsVhsxo01CEao0C7AmESnTbTvB5LRYKidyoDeb49n+BosU6hCe4Ru9Qu4a0
	ex7VTvnDV4b81kk5MlNP+9tBk8XsMSiOieA8paVM/ho3jUm/aPh6nM6tDdCv757w7TAbx+iEDRn
	+CW6pDjyVy/fWSLL139GwjDDNCctPQdQ1WzY1LhGlb7oyzQf2CVEiICUo1IlMQI2ADYgG8QWPgR
	biA5XZ5xN3UbhHBUfZ4ly1P6xXp7U3rMQLPw==
X-Received: by 2002:a05:600c:3e10:b0:485:3baa:af14 with SMTP id 5b1f17b1804b1-48716042a26mr101115875e9.18.1774520833109;
        Thu, 26 Mar 2026 03:27:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:12 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:39 +0000
Subject: [PATCH v3 02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-2-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5073;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=89pCG9foB/aUmIOQftGcQVpa85kxE85oYki4tXopqsk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQobYV9NK/v6H+KJyHfDspxQBnyumiDeKs2gX
 3fgS6RSwjmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKGwAKCRAicTuzoY3I
 OvWVD/0c5U7qv6Th3DucPL9AP22qLyUSKR2ejuPwDB5awi6K3RL8b6Bl9TapTFpJNphc4c/uVgS
 hxaFIYIAkpY7Cm6OAqcAU0wlGqkRkusK5QN2Guv2DjOJpuzAo7Pqc2lQBIKdR5f3vLsHp4SzlXI
 zCDJvVhBEx/IgvF/03YBVXwRCObNYwjgt89yHGfhPkgPG6D8D8unP9/p+EEANav5SSbZE8Azp/R
 +KStdczQCq70rMc5dbFOdgOkNsT+xfJr8SblCgRo/x4Ahn8+DHsMVZUDGufGmA1pt2aCk9UB4LO
 0+MehREKqZ2Qh82y2NZ71IQ3PGDwJUD3d8BmzA5EwHY9p0PHuY9ttR9sbravNcFE3Arn7/V+f5W
 1V0mX/kXnsTGEayXuJG3NvdNH5tKdn5Nx5eU7Y7Gk1fmBwIEDqzGdCTFBH7hV+KFOmzsyaN6e9x
 wVP6/SLR9eQH5zfdKqMnSiDQNpmNBSH4YTBrYrY1X2IosVxTXZnZVW5d5TuAorzxdUWvvjbw+rn
 SDEvbUvHxBRydPcCOk7zfqTkOgp/qznJpEWG3fw4F4lD8SOoWNVKyf+iU52M9RSFabtKBlcJ9Rq
 8LOf9AkbhmnSjAkqzBOn+OURww1KAidpCmty4XYWa9g1AwJUNqnXdeiyEm4zfGiPd1b0L6t0hqe
 RtCFZ28xRfjPe+A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 029ec012d0a94..38f9da6ad9ca5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5465,6 +5465,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -6115,6 +6193,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.52.0

