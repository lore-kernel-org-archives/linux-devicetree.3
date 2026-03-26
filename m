Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620E63C2767
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520841; cv=none; b=jS2DixJ4DY46E0ikjnVe+haO6pgY5XjeyPL/CiU5TNkB6vRL32An2IE8lmlCWBEcUQOn0jIYrUpRL86pXKO3M8aTeHaXRQMW5jNujwnBRXWZTKI0BZVjpXD4oGTwlFA6ei29vPwKGKK+bP6DDM7oXSYyGURlx5nlCyceSMkdtkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520841; c=relaxed/simple;
	bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UdA7CBFRauSEOiVVinvxch11TxMn91P8VA6ubxaOCvY/ch4c52Qsenf+mC5sWOn8YWGSvUWFRBSq6CeGvKOSg152omUiDUN5YptIWLNuWCXVnwh6D9tgj0sbi+TYw4Tx/z5YJONYfBAQ8gG9nFIcDUbgNmnxUV6R7RyedjXqPBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjrO1R/F; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjrO1R/F"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b4915161fso712732f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520838; x=1775125638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=DjrO1R/FZKrbyNTpH9tUOr8PiCWJ4UoIEVzX77xR7cDK0Rqe6Tr08xaKkjycQv4ikW
         NmHLNZBW7ykSlrHIch4yNiAMAEJRef+zjDctvE4f6EfntTE1tjtxFMLnoYzqO2bQ2+9X
         8eycGPAFR7vmrx7fN/bYbQNEvalhlJDqK6q+hBS9FWkfM/H9e6hiHvknkTj8C63P0TvX
         CoOoD+rqRiGqK5+NEQaa9NsslMUdKCRIGi+WJYuvSAoM9GE83zD0XKpo/WnytdIsn5xX
         PuMxBunh5350JHO/nmskhQyCjnY4YDskXpjaF9FYQROc5KvzOeTxg8g3kutKfCGaiRCO
         4BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520838; x=1775125638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=itpwu3X6ZqMToHYzfi4obaTy5Dy/ihD2/rrEFMZW/pH94yHZIP5e8D9puW/VA1vEm5
         caD05fHiVggyOvvQjTRgb1G5R48rR2N6yISXwVYLPyzK97cD/1Ie0GVRC4HBJjKrOqYk
         IDgKEqVbVf4zZ6k5ZlnthoKFdq2PTyTDEb9wnvEzlDP2yy4mV8cIqQ3aXPHHNYavwwXa
         ASlWrGhIyqYIRVQYPXue2y+PbtNymK3aStCoSTZdVOAwSaAkgpOk+nUPhyFH8InD6+Vn
         DQiiaC+2Mbs7VsGbyf3qffcgUqOqlv41WTKd7pyCoG5IuHCPQ6dW1gyoSXCKoFKI6Wc7
         LpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWf8Q6dCBbWlpGzLW7Y/rJPYA4ZDFSogbYlLt35FQ4V4HqL65XA9XS9sRB3+I0rOjeS2g1kQN72GMs@vger.kernel.org
X-Gm-Message-State: AOJu0YxM3ddtEDGT3o+P3zSOZinQyDJt6jzGNsvttd9NPefs9rGLSsYa
	16bm5487DnxcBpdwbELuKal1IIDUQ5NEQ/YTZnt9k2AwrEqD5Y3wcggPgjCHltE5j4A=
X-Gm-Gg: ATEYQzyZW/Dovq5yClUwprx+2+wj9aIKNAMSztQXaxFHK+6EJG747TNVmEu6c555C7+
	+2eN0hiq46U2Y90/33rcIFcTq8i2t/iCrDjM2nChMgczTzloNmS49dlo/kpeEJVfUj5AV6BODic
	dIDedtn7JIoj3NPVo95K/9f7dQfNbfC9d4b5XkM/0ENaq4D1ikCRBR7CNBQbViF6Xu0AZ2Mw7e3
	mJYs4+eNcuWsZiX+UfzyFMvqQA1OzWugwwmsNQVUQt2PqlsQqApGLkJu6tT2lXl9bM+EAYKBHNc
	FvTfKeYJoo/cHHBMDTqo+x5a5P5WdRMLBqDm1IlILtrR8Oo5MaAtpQX298UI3sjKu635dQ9K/nY
	ybsoKPeIu7Ve3NydzK3HDCoGlr5AlQBMiPvPRNXbnuHj3WnehAQ/WZbMyPu2gZ8Te787YzuFRhB
	nWWPLx4ZYOnB7K6aLZlcIgaiAz+Fbi/V18Og==
X-Received: by 2002:a05:6000:4212:b0:439:c1f4:302a with SMTP id ffacd0b85a97d-43b8899543emr10349624f8f.11.1774520837589;
        Thu, 26 Mar 2026 03:27:17 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:17 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:43 +0000
Subject: [PATCH v3 06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-6-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQockTcY5AFlpZIr3CssEoDhJCV80C6IkkVqY
 T9YGmvD1xOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 OlwXD/9/yvkiee70v2xxqnsU1bIR6fP7i9LUTuldmVE2GNwwNhSxro6MiXKgrnL10x6m3i/cctb
 f/f28AB9YjWO9vXM32+Obd16nD0Yle0kXARbwcch+Fj/683fG6M52chInLXszl/77nussSIDPcg
 8Ys02+mOBMM7e6cH2jsK5PcSESiPkr6rejlGJRR2fylvh1Qwpw89UVXNxLtbDcuSxnaZINsEb8O
 W30EcdsJlclA+PSkw+Y8ICzlyq95KKAnZ6FA3cbluhf26OQpu0UqdHB9A6RJUFRACoiipunok06
 ORalaz5nMaKGQqZL47GQAKf7pNK5lIt1ZZPNmKkhfjbKZZw+PjIkthDEznVVvoidXpTmQIOdqvc
 1/A7WM0Vs92yc/1NQMiOvt2psSZLLpuGzWuZRCZjyR/6wXRNUVT9naviS2KE61uyLHUdsrZ4CPX
 yHZ3TZKp9/miGkRXKLkwtyEtPnYY9VZyvkTaZNCAbOiO1GD9nPcw07ZiPqgE03AObB/03iT3eRI
 VrkeApSNoM6i7AM9Xx2wvs0af2QBass5GW5UKDMohnFRKXrKiePwp/z7sRKR5+dT70h8oOKe58P
 AjrYTwYrx7b+c0UxyBxYZz1CEWLJ6cDOotnXQ1BKLYLp1xslPkkeiaGKsoip7FyeI3+d2mhb2pC
 HSLDT19WgmPkbyw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4d7fd51f370b7..ee49785c9d005 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -562,6 +562,13 @@ vreg_l6b_1p8: ldo6 {
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
@@ -805,6 +812,58 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
 };
 
 &gpu {

-- 
2.52.0

