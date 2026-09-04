Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D2449B1F5
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519421; cv=none; b=rJtf9/Uc8cvPRgv64NyqS4MDtnuisRcBb63jssyh06H/9DGWLc70lMubD64EHCdWWJTehHKtWwEpiVp3swCKbYcIh5Ji3Q1wM6D8rg/Rz0ihFLuzMgnSF+sNMKJXEFhS8IGCSL8UGkZhLHXSyr8dJsHebI/oN1aixW25X0AQQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519421; c=relaxed/simple;
	bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPEEy95bV5nQ8AIbybt7pdAoVyHU7BQhApFRL379/GECJi0U3+mfnjemh15TZiGdHdtni7Mafek1Hym6P4ReRnWyH+dY7QRvWIXI+i75M4I9bUFPJ6KRw8KcLg0kIHIjgkIMsPgXPtac8hAbefv3egZKBU6f5ejxUMwUd9pqOAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ea89stJv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ea89stJv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso7183515e9.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519414; x=1789124214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=Ea89stJvTKxAKh0ZxNJ5anNeqPCNyOqqAPU/m4x21K+c6Rq+GHx71BUvN9+VAnabzm
         du/ltpxXWEfEqgBx7Y9MA+KG/Pj+B6uesRLSz1c9WkrKodj+UnmzeUV/5jVLFMT4yb+1
         AvtDBEQZobiABfV2sRFIWnX9C8Wku3upEUTr/jcR32ifaGl4ue+p9KthnbQbBTxY17ab
         H42sBZ+DfW5rDOtGH70OKLXwoa6zy1RrE0xq5IXHv9WYxaO9xPEmz/dneQ0fZacmKH3G
         ZTRaD1sRRJxnOCKMv1Sb28JNJWO2LoQcjEpiRPeau0to/QiA43Mo3xEHYzHZgu55Lq1b
         g49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519414; x=1789124214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=jCXXD/hIyyebht4nEdD0hhnssxnJ9e0SSKVIlujDXL/y+Cc8WwAezsfGB8slfaVXnL
         080bjD/4iS8MXpSV8nbNh3elkymjJQFNpbZYo36iBCY1ZXr89ErYAXgFt+NUQNxK8gkl
         7xFZvdGqfv01ZC6xTDcrtkd4p2Lips7ybAERkXirIxk7mym4P9FEP7qranpyAm7oIkY+
         Ay774MT+stD+HSZx46uF8Mir4bWBsER6kofP3H35T6/YQaiLufD6Ry6TQW5l8Z2Pa/uQ
         UXkJ5wlWBk/JTZSiGhpqtfBSiZhG0Z4Xuh0OfsJFze1MQDpMFVMrAO9Hygjqtst3VT/d
         Tzqw==
X-Forwarded-Encrypted: i=1; AKwUvBwjfNkvQsvmruiiqLDH3ua6chfD229FXv/ysMR3xQc2LCF1xCFTGUnmcccOlpSxpGdnNhDi+GhSsByO@vger.kernel.org
X-Gm-Message-State: AFuF++l1J6jvCoIxu7UFuQn4oiYssSBD+zGGGu9rztOwgMRaKC/VrVAR
	DH2DQgxrMBOs5X24QQeB2uJoN/0LayTh8/SMKO46KMsFZzs6XFOw1odkZonHu381aPw=
X-Gm-Gg: AYBFou24lxhNeWzdZuYDQkCIR9F0NIiPYof5eUjmLq2Rg743/0ZGMczZ6Bklvh9n0Ie
	iD334b6lfvHX8sgwFqAAaPqfXXkKtHcZT9D8Wpavu4BegXjCkVZR5RpIfPEv7BzVtzIKp7fvxcT
	rJsvFMW/pl2Sglp2JDD4Qw+AnNCQ1Gz910DHg8JV5EVh/F1vtrrcwZtXZMOMsyaIzCdBRDrt12T
	0PwkrVRX1Zu6Lj62eB6DPLP9pEvBP47rMvnX1HPQg55wz1uEHBxeSDeOlCM1PBKPBCt6gRARcW+
	DK8aFAjPJrtA4zPY6ye3Ymq7pGAp1s62dUbZVhIEBWCSd8cWMawP4bwXac02OyZCpKEp9Lqugu9
	5aKWdiBpad7JGDBraTUDA+hC3efRIJ+UMrQU6Oyx9lOWfWjDthb/O8m1ozCzFp+ONLZ8axcDi/1
	4JrRvKwkRlTYzOPIy9Jfhu6c2KngFvqAAAQWLGJDGAto3Nitc95IXQiBns1clrJVT1kCGxH6cz4
	3OXKuSyCzI=
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr23313905e9.33.1788519414400;
        Fri, 04 Sep 2026 03:56:54 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:40 +0100
Subject: [PATCH v5 08/13] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-8-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPn3B/7abYAemVyp+lAV6hGp+kx0oMZ7gkBf
 3uTBRJwgH+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5wAKCRAicTuzoY3I
 Oic8EACXd3wVUdOGzKCeRDI+btSwNbpr7yUNdStyVSzNxu2NmpKIrmWOYeBkFnx/U22cEnZcZVL
 GY64A+sCoIQy2VaOL085Xl53h+4vPsb1fKilIHfAxFU8byCe/fByysCZPasmJPwpUphNQV4RYX+
 Tu4nzHQWgFEGTB5YPGRp8Cl0X99ngErNV9gKODrArIutgx610Zn2H/6jcWT0d8A/Jb33Cs38DSv
 1rvVu1Bh98hq4OFUjTUN5wq67MOiXZurLbUGFWaMi3W8tMa4yHAePfU54K/Pnqs1QZRy7twR6gS
 9AuNDkZWa2y7T3lgbCtNvQSMMwjegnb40sqvryqHcWTxHGppYQ8i6ecUVa0ca7vmAsCzWzG99EK
 32iK8Dlqq5VlGB/TKWUIqc3E7ANuHNBxV09ds4+nDfo9ddy29lWis5klImfjE5mNwxf3fK1ma5x
 w6CLyxGav8hTKmj0lvEmEBu1gsbjzlv/zPPgmwMp7ZA91nu0fgq3QUaWwl+RrdM7+3o8QZPNhrM
 FroBDDNGaeVJ+awpKaBthhZloHj0uRh5X2x8uCYg6uX7r8jri5xeC15Ln0wThYnyyfVGD6QvRCf
 fEZGSFHs6gD5b7O7/epGhLCgS9SZ0FCctDPl5VCi1r0MWCOJDM52TEnlEYJGx7MMgyoWaWy+6Hh
 cnYc1Ic8fq4ylpg==
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
2.55.0

