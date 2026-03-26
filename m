Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1A03CB2EA
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520839; cv=none; b=f3v08wYnjidU31alKZlGNljlW4Q20UuVzSYpYLfnZcszKC+wps6fahPDtmoELanDsAm3wu/sFyR97S/EKG2VHaCgD6bDs7fzrzbwJRHQMDZNgF94vwOCo0iByFVSI8lG3X6Xfdg3FUsd9uiC5SPmqkQxRZdOsczO2w2DrZhHG9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520839; c=relaxed/simple;
	bh=S6iJnHFPbJLaLr3h0qEMNZIwUOoiDKNDAFZUs4m9niM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsIH0jlp8CFjC9J2of9JcbD4T9OuAFt18QcGxlhW6xomCqTgXesxED6NTeebXeLb9AEzL+AE4vsR2OaSjD8WcPCJ6UxUMsFp5ZK2UEWsQoSSI0s7GN5hcyAKDLwuIGubFlEwPxfXLJYW0gzm8TsIJEpBqhuwG2NrT+njyKYseOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NPiZBNEr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NPiZBNEr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so699921f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520836; x=1775125636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Z6/U7PnUrwuHg9KKOxLA9kV52dFoYuRPPc7c14Ax4g=;
        b=NPiZBNErtUcqqqfPlRUmL4aWtkbEx4uKkBCism7abZRqYfKujW/Gp6TyQEJ86bUBYU
         iABYSh46VFaTDf9GG1eqBZTWZAmgJ5Ienf3fRIMpmadDVNFd9n8rpNBGyD1r/38BgJ0p
         dUuHF4/tj5Gq6fe3V3FVI/xqRUKL44tNA09JuxEUSlbAnL9PDu4ENE/URzNh92RgMcUp
         2gFqIwsTZ/nF9Vv7rysWIIgvR6mQCetR5vzrX9AGp5z1iavwREqOdXcFUNVssgY/D1Vd
         BEvN5B52aZISQgN8T+xEHPEOPhxCua41jLtsIGrdLsxJmOxeSgsYkjFRfKk4FCG1o25p
         kmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520836; x=1775125636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Z6/U7PnUrwuHg9KKOxLA9kV52dFoYuRPPc7c14Ax4g=;
        b=VJFX06tE1d3RxAtZ5emIfFCmtVmPv4g4+2OYibLY/urjbRKAa0q9w7GwXCPP+ohkEV
         Mp0sDLPAFv9ia4eOPIppenUsILzXPcxXyzRGTF28KiiMtZ/MP2LYLOhObfpGYSKR3w7N
         k4xbBiXoDTbMHskPrj1e9lnIcj/AluAlc5x7nafGXKcIvSjT0aiUXYYtmSewrfrGAf1n
         W3tr1F8l4aN/VSJMkYJ/chBsEiD4kYu5fBqrHXRaWAQ6Xmko5ydN5TKvGNWVjaOvBmyx
         sD5HUHaqAlrhnBi7/Fye8YuXse4ARA9+js62A4HRQjCmYU7Tx/ja1r1OQtbIn16iCNPl
         ixqg==
X-Forwarded-Encrypted: i=1; AJvYcCUpCA5z6zPAaU6cGNshXXU6f+GytppmE2y3gA5dJP8sxyJePY/n411JlCSwXORougLOojXmxcvnTgj1@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ2+2FizKf5pX68SxrueVJtSYz+oCs1VUC3gbdanvAN0mGM0+U
	LPIhxZ2WuXp0sL9vasGSmpIYKceg71qJa1dT360GjFbvqD76FO+JKzOE38gIGctwYlQ=
X-Gm-Gg: ATEYQzwzRDIT2kAiRC+/NHXNhpY2U+MyDUdYJtnfsXzamIZ/7ieUUIGoKkMGzHPH4GJ
	iFYXO9j37Sczs5RIUc1keBjr1OvTC1TLeSoI/NDujYdOWvHnzvPqeNlDXp2hhr4QFRinJz8V+rD
	6Ptws8WZGUCznmDKjvCrElBD37mhty0nPfCYTx3/2AvuLIGkkw0aBqBeKZ6BhsA4PJ3abqLght0
	1B4HwXgnqcLsPo7abB0q3jVCRsng3f1R8kn7g2mvjiePNT8xXlVxE5/afzKeONY+KdFx9v4DaGo
	u2Ao00ybv0s8ss62qHLNjcnvpEXbXpJBcRYK7/6uB+DK7FwIblUDnrOngJaMrZoQWmZr7eQ/xbE
	3KDfwC1oOjDiKdc9mTnDqb7+kNyMAgTlYNxenzhWdO/p5aVWNJ1cxtj6wAfVd/dlNPNSI1LbLsq
	06U3OPDmefwAdFqAW6C7sXv7FMFJPBP8GubQ==
X-Received: by 2002:a05:6000:2401:b0:439:b6ae:5d5f with SMTP id ffacd0b85a97d-43b88a1a8f4mr10698867f8f.36.1774520835535;
        Thu, 26 Mar 2026 03:27:15 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:15 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:41 +0000
Subject: [PATCH v3 04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-4-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=S6iJnHFPbJLaLr3h0qEMNZIwUOoiDKNDAFZUs4m9niM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQocL7WX0ILwE4o9t5edmRHZq5yHt+ZwPbf1F
 JuyU0dS/leJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 Oiz8D/9NoDUCWE93GsBxaOElM3I8EXo2xHmu9htpkI8jFobBMr9IrnKtOZz2whY7epWMFgGCmaX
 PqvDgQnh8mT3NOA7gWNTvRegub3hZIDsxX/XA6DBEp68RzUgtdv5G8m1BvTJAYe7IwuYznICsCD
 heSWjtv9jYZG76GkFcWaI3JCynTgS8CYPeuV538jcOYZF885SD8Vz1TFEiWaHG9S0indx32mNkX
 A1rze+EhaMGrBswPhYkDDoN0gqjxinzj2xr3sPVdeKx7Rg/bOxaMdxFmB97ajQdT6iSQNnMVVJH
 IuaD+H4j6ov5EsW520r/rcxXDmfGhu8SRY0Vjb00mlB9pHPTfKV58Di/FCYs51fS/NQO1gB8O8+
 oOergWnIYSi9rnE5NRdEK9UNhJh2h2+kf+6E3l4cLrda+xYhInofLVN0exgOLA/vAb7YCQAE8P6
 7cGVqT4tRAhz52fgZ8beOOAOIeXyyDjOplIFD6MPF3y5Q5hTPGeCFtpPYztcfSoGc88WVOcol2B
 gMRuZQWFqD9OvaK9p3sebmMLABJ0IBWXkWvQpqSmCTKAUJn6Y+1K6W2ktGoJeZSogfgjpx8fJoK
 kIpDd/9PkDVNePmYnOQAYNBJsS4AspxiO55OaIAeQuTirTJfSzboDcaGadqmG4NVvtiZka6E3BK
 GemnIapUeur0Hng==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ded96fb43489b..c89f5ad0aed56 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -865,6 +865,36 @@ vreg_l3j_0p8: ldo3 {
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
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.52.0

