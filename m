Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CDB5293EC
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651257; cv=none; b=kYOGN+mlLyCQXozZ00M4GLZvewllCM/ki4P6pMEbPV9bfGjc4flbEMUGJiXoD7G9hX6lyycpmfPf9glgg/cD4UORCmPu7bcs9uagqiwA5r6nZSEHVy5Yp2RfE7x/ZsfDYZR1HiLrMq8l2JXo+b0+C6R0FyK60ANlCQkUBJLHVBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651257; c=relaxed/simple;
	bh=Kdzrsn48p3c+3/xWxGlIWoml4os90u5ZTr3ZZeLSiM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ap29pBUGXObMDIixs3bIm0KdiIBlTLue7H4obSAxzB6kNlzH3P5/h4GOYWPfBMzu8dzvys8W1BdInFGsZHaRRQRE9VXP8SfBv7qNzVKNi9c2laXqECcTTcHOwI5IzIJuAB+3jVO4kf4dMZxtvfXv4y1493OhUwYxHhGwzj7wJis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Se1z2g9d; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Se1z2g9d"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso102626766b.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651245; x=1790256045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aqy2gmC+g19+VnI1b6jHIKWEHPP8Fzt7T1+LG7Ot4U8=;
        b=Se1z2g9ddyKsqcm0RB0t4WW6iCfd1IKFPM0vKD+ZWfgfF/d7a7sPrefprvX0Y9K0FP
         2QSGZgdPaxWB5FWczUS9Us8GKMBtA2kDaCgcP3Q+tyCe5+2T9VXpW747yYSY9zbFykOY
         FoO7ecvnSZUIHZUH2t0UvZeLCsIMmaDTaCVfonHRlm9MvvYwxT+pTjhXfD347nayiSKH
         6p4q5RAXxOQdm+7o0PJPiZ1EJjEFxEmQlawuVm1LlY6qSwi+3+1vDj8FOC36vYZ/Ozzm
         j5mCzMhnQVj/SblFb5ntH2A5V39Xxt+vfu+lyjYYIuU7oEfS5CnIHugMKdbqEDkvf/N4
         SS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651245; x=1790256045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aqy2gmC+g19+VnI1b6jHIKWEHPP8Fzt7T1+LG7Ot4U8=;
        b=efmnw5cRnMrUamnhXgYPhfSDNVPmQKjdX45D5CcefUwPeNalsEDwCtHt1OnQhlJ+IR
         QzWEZ+pxauNjXmzyLjJfzzXSjXjc+ig7AKmLo0O1DUsImhxQn50iQtLMX5cgvIfZcXq0
         FTdSui/74TkDN6JLmW9P+FUK14PTlq3xq03z1WwVqKzJ0iWuMk/tqXN3zL5AftXuwj97
         K62SbfsVta6IJ3UfukHS39bI+gdh5Wj3WaX8Los/aduI3LldyaAup5hWpUv1x0Wf7gjD
         sXTqHQ5Fodx6o3hOI//EPc9fhly+F5XVZ4iqn1eEL5jvxfFlYz2Is3V/uF7zs+wP8zp6
         BcKg==
X-Forwarded-Encrypted: i=1; AKwUvBwqx1/+xhuMjirUkc34fUvLhHmaS4YJYUENBowzvmrMlD4yKf+e1Mly3niwLgIrwa6yQ2OCTosay28x@vger.kernel.org
X-Gm-Message-State: AFuF++kgXi5b0gExddBWqG6KKxjYRaT3LhdIcJdh6anbEIYAuId7N27Q
	W0RO52+K51aKxE8w5cVKUzjvmrmx/G/acmIDf6b4QsBN4JDe8BMYU3P0Cmonx7FmpB0=
X-Gm-Gg: AYBFou3j9dnYC8dlRhLxfydDzvf0qpi6fRWH4cUm+WzhpjDYWH0SNPw7vsyKWFJULzJ
	urPWOTPAznp6cRBRmrMLaYGyc5e/1xRlw1vFvquvtOHPJhLcNRv5DmSekp0eUPm7nQ2LNUoWWHT
	La9kT0ZKmgx9OHWDD70HZn/Pi2tb75cGauHnoGNbQClkbpjVwbeRUOqlYQL6sgoGHLNM2gDpJg3
	F0whYwnjctoLUdJEEG51Cud039ApufaGpGI9wile1Fvlr1n2UzM6ju0KnQXb8HCjN+1OS2THcJ7
	cXe30WV+ru3p29ImwS4wLK434oouoICIqyf+Ku4EXJQM/c1eb3Fs/X+ZtuhK5ez6LJvn1cr8w/S
	hs/tBKd3N1I+vUNEwlC5GnqakH43bhsWkrzhWGW2yAWeCXsSgp6KFf1l35Nem92fIja8PxiquII
	rz8e5KyiXr9eVlHqFoPLChPh2jsS5C8o8pZMnNh6l8je9bXEQZcBUzX3DYnX93vZXSnan1HpRw/
	OtSLqX0EQ==
X-Received: by 2002:a17:906:6a23:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c29e53d4e2cmr421505966b.35.1789651244902;
        Thu, 17 Sep 2026 06:20:44 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:44 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:32 +0100
Subject: [PATCH v7 07/12] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-7-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3012;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Kdzrsn48p3c+3/xWxGlIWoml4os90u5ZTr3ZZeLSiM4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kgSqyNT0j72udFFTdPDEyD5hSaVZnA45Y/R
 zr96oynFTyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIAAKCRAicTuzoY3I
 OlwpD/wLt4Vwffwz9xjYYEn+kz3p1vnqZWauMLYwmpKzFIZkYFRvSqggx5eztrJAQgyT7aBPtuc
 58+Dogh2pp4rOzL5Cq+yj9rvQE/jZVMGSuYpwv7E6EOYMJwKJKeiSPPw9nhtDvoBkcaxaa4kr6n
 Mk9DNawl/fPzd8LKf9XSp4w7XsXhtePFzVPXTkX2aO/BvL19rd/dtqb81xVR5hBZjgAtURgM5PU
 areTyJ4y4JzeovE2xuD5ZD2P7w56Y55WPLP+cgWn559hSTGKhRKMDQKhTDikCBR25OTQWGhgkn2
 BY9Q8K9b1aC+s4nP9XE8FNv0v5NYq6UQ1zzX7Rja/z+ygompvazMNxUHE/KCosq2G5/lrvyo32n
 /5cLkvxoGZ3AOIkEedWqNZDgcqH3kPKgwmPku0zwIniRAdt5f6JoYs/wDXIKZloJj5w07Ntu1Y6
 l3Sd43BRrF1tSzZlpMqu34jRtrHjFiUf8RzhiD8aroxVvXNj6khazwGXgF5l5sR8AnjSnRG35eq
 nWG5e8aGwYg8nY8mIhSMvLP3JymFY3s6wKImqOuqqWkWWH+aQB5U87Eb/8v3i0lkBUNObHtYIR/
 yxb5+7VMQwEtWwhe8NQNKkulWvgCAZqnOBKLRsd19N0AZ+70gnIcJpcflV00O1Ocm1n1VhjEjGW
 PKFEi7xT4Hb7JdQ==
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
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 0bee2a3d6e7a9..d2eaabf917f11 100644
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
2.55.0

