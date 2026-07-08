Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0DB3672B6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471476; cv=none; b=X45gCSfsBFPfQ0X/DZhV5RrygfKeRYiQdlfjTgjshECBcHZSYEX4HKQz0dCyF9Et4RJMHa1na5p0WQsdBiW/r44IFts0mvkEI2QR37gs9TZH6Ndzd7SbmrFlffxkkg3p5AkBbAf7yZdZFU4mHelJqszm2uCWlXBMCKsce1KsJr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471476; c=relaxed/simple;
	bh=mvMLAzdHB6jsqZsO+74GFyviI8Dwel3IBPxFz1BFrkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuCBxNGsL00fJam9Kg3tB6eWlWJwwV7HajfvDLwcjPPjcqntNHyHf3SpL6U7KhYY671KioRbDnlYRdkrZev+wKrwq6t38etz0YSAwAF2lA1TI2Eoad9lAORcqkN3ZRowRG6TbB4RxJVjY2yZxUyG3AOPFdYkRdk/QwYLnmAt9TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N7roRcG4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N7roRcG4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so741855e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471469; x=1784076269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nthn12NadXrjawh8dDtyD49F69pArpzqcwypys3xj4g=;
        b=N7roRcG4+1jj9FaLlwgk1rTY9+sbeLmroYAiEuXBPvUMTHjJREIuQU7M10PS+E4tM+
         61DEnu1xJpHhvGdfEaTvq6zeiMi+9vQkCVvFGs+orEw/dahgrf8di5JA/mWdbQdlHIn8
         zW9OLrZ+tksi4pnolkNQbRmyrO/RT00J683rGXbi7M5wQSjRSd2KaiwlOF7NlWRo6McG
         7q7SXfBcFc1mK/kA4TP+ayfF7OnTHpTCh0qnnXjDMIRmQlTIY5VOF+ouDqgLXX1ShpQS
         YweiMGD6ytRDW2SKECstt71EOmJgSHHcYiGa1UEKcHftArcdFuqFUlHYk8VeQAKjtB1j
         +ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471469; x=1784076269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nthn12NadXrjawh8dDtyD49F69pArpzqcwypys3xj4g=;
        b=emDFWTsmJOJmLxfC8papUefSuhkd2IcZafObba4T2P/omAw8jnkML9krfh7ddpLpQf
         sI5/WGiKT+ULkVl0MEUSIyXP5zOA+MJA0nvmyQxCir10YoLXlcwmrkc7EA0TzOU/ZIuC
         0b1XD1opPAfdpph0gZAAAqy1yPC+BnSxoqmyjAelvSczNZ6GCLMm/Q7KUHeAhajgc3uK
         V3NdnZaCLtSCbvR7+uy25IRyRvV8lCxT8zkXEvwc1JT5ZVPPsSsSr94a8IkWTx5MX03w
         G1EC2yJIFkhVnr4vQ7rODPfJkKrq2cZW69QIjuWM66xv9uYGsYdvk4V4HVE4Fkefo+5u
         TRDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpelfGINOxGcc60xwfBa7vEsPb0ORJtpZYVue85UZ2XQA2z9CTdoQDoBizLgSopZW6Bv/tSMLSctfQT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dilb0C5/Ic+N1U/ksN3FTKfQxc0sd00xoKsj1ODj9pgEqIk/
	PwhsIe4ERHlyqt+SAuelpuDMMeEVrwZD0E57ZKInkgr+tdAfR5VygUtErb/ctIz+E11IhAnM9He
	jeWqq344=
X-Gm-Gg: AfdE7cmF1az6+W+o/gBlZkEFI1tk755yjBY5LXfmWCKuNBAuqO2lDznibrE2CNigVQb
	kMsRgdJKSht7WRystA/ydhIZ8MfFEALoVNgyzcORtlNGhzxHEO3jcta6dhg5yaQjVjk/5aOO2Dm
	k6/2oVTbqnC1UsFExYJhfE+rLcRxFCVmLPntm2+uRpU/hIGWqlzn8uANd+gboHq4B8gM2DAzsFK
	iMGs+KO0RXVKSYptLh5WQGLRmx4bFUzGGiXq4wvVPgAeIyaLqOkC2Uge4GKu02Z9qBYJaGDoaMw
	ao5p7UOjnrpcfggJPZwk+0D2JbqNqWDdVsp8nqJr50u3Uhlp6IsThWUZT42X2dulhiCVVfFJxpJ
	14CXfZK3SbFgVQVjPYQBkcWL6iemlh6bm9220T9itXaZNnYfeuoqoYqjer+9DhiqSVGwme3Pr9b
	ELaBy3fYNjVG4KkoyjL1Zk3cU=
X-Received: by 2002:a05:600c:4e56:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-493e688c7aemr1803125e9.1.1783471469103;
        Tue, 07 Jul 2026 17:44:29 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:28 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:13 +0100
Subject: [PATCH v4 06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-6-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2938;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=mvMLAzdHB6jsqZsO+74GFyviI8Dwel3IBPxFz1BFrkk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1dYd2B3FgAM9NfvVSJBuo3tS1Y0i+yCkhyH
 w94UBWLc/OJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXQAKCRAicTuzoY3I
 OlPcEAC8HkwCzDXWTSrhBegwY94DB1HbGGojGzbPPZtN5qV3lS+YGy4vi5uM7VAlADZBWmBVCcI
 1UYpn4bqcgr+FYBiku1mo860V7asC3vmtFlz2/X+XISdn+EeRZybZNwW5d0MnPjxRwrfceg0DZj
 fnGuLQen/Icxf4srFoK8y10r554jM8Or39HCv9htJhFdFtGFeyR4OuGb/GGHYctnOvw5l5AX6G1
 yJMLk0NLSAAS3nUKVFf3XBzCsun/v8GdJvuMx7V+T8UcBD5S0ekHt6RgIur/LgVAA0is1hpWwwE
 eWIkGSpiyJP41mVAkOz/JGcP8CL6+cHckWSXp5PBDvhtacCHgqs5nCN6SJ1YRf1QwujLRZ3TuH+
 K0uEygv2TaZdaQKfxWgLJJvlfX7nYmTy+UDNHB1P75YWtEuwlPj91YvR39l44xQXAN78+b/WYbA
 huxP43Sb0YW+WXOIA3ZQVr2m9dNOArMoVJLTbCuK7IL3GtXXaWcBROTp7zh1nRTM7d7dp4y3riB
 nnO8dP4aackD9sOVKwtPrLO1fy0xyFq1vtTFnmprAi2bGa8fUV7ecpIy4qYO94f4iLlFmQ4J2Oe
 58CP2VQeX6wcXy2CI/nOmbU6vp8eBsotmArfPkYjYWoET3TE58YGFsT7PqHmH2xF75bHhrJAjIq
 aBzzzR5asFtHqyA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02a..70e50ccf67677 100644
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
2.54.0

