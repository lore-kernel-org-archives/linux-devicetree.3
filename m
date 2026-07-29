Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF084749DC
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785324453; cv=none; b=SM0ybu8zbqKBbfTnCPbwcc7GtfPGaHyQLCoPW0TW6f5Td3sEjKaG9+jsFRPQE7vMzSRRpk9Qpn2COlnpQT2EMvn16SB1LwTg7fduBc/DbCcvNK/6lPvM8J1YL0vZrT0tfXPDcUOY/SjybzXfI5Cs9MC+L5IL5CDLTNEjssJdoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785324453; c=relaxed/simple;
	bh=o5fuh0olua3cmod/5ayAnVMOpDpteZ21Pp91RNNLJQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xwg6VwIc6Rxr+jOmVDf4J5YwflFjIFb0mbJ2UTLb0/E2mUasEuD/Ss1Y0t0oCvcl+EJIiIET1rXLwNjHU3N5szCQxuK/BrqE0OENO5ddjQeioYV5YMO3UkK7RrqS5lOr8NqvOC0BC55rkNPckC+2Wi/EvlLZiAo0cmD6DKF/7q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PpioGXT0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PpioGXT0"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a1fd0ab0so74490e87.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785324450; x=1785929250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pWtgZKuw2W+ngq7ib5CKwcZeLXinWBcwq/8MK7k5OM=;
        b=PpioGXT0dPHRAW+OzKD0POXZK53LP4g/4DjOvStlbF1ny1m3ZHedQINi8MLvOrQ1z3
         fKuhL2xcTgEYmEMgW5Q6a1MwqvjQsq5xsi486d+xHY1LqZ/PQieKe9TcybegkPMBnFbI
         I7KF1BF4M9w+4yjMw6MxufngnF83LY+k19dGiuMxno+YetnNtZdVxVTXUOKlNtKmyH7r
         VVFYxNMrEf9Qug9GHeZoLRCqYqI94KvXGmSUH5kMz6k3f5xxL2Mj4crhKWVx3S1y5SDI
         Baw9y8rw1sIJgX7Rf1LdN3iKP7oJxL/kg/0XopR06k4TywN0CQqR9KT9OR9JbEXDtT8Z
         kpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785324450; x=1785929250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pWtgZKuw2W+ngq7ib5CKwcZeLXinWBcwq/8MK7k5OM=;
        b=ZFpmvgL8QK+jY2J23QMEoU97ngrHdJ5vWWorkj/9AljnZHaD1sa7tRqmsMGyp0JHjf
         GhqisbWHp97U6Yvcal6E3AUJYe1i3NGW+vfozOcp3/fzCXpzrK+57/ariK33ztZuv5Ij
         ual+QrLpuEZNFN1UvZL+QmJWLWKXB4pPGV0WSWTjBAP0qpxdUsDKJBq7KlR/MAmKrhaX
         8EbryeynwDpTU6bB7/3B/SfzZrLwZwL3UM/KdkDdDeIZp9Esn5cowMBxX0UjzZ3xmQpu
         8dbwWE0j0z/vlSLkui2vBa9EmPQr7CRrGNlePwLGl5MwoCO8wMRh1F+odQIme258tKHG
         6WVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTXaQP7Z+6Ytp8HxNjJTv6xEd63Oc0qpq7W1liQeQw6o0lHhf71bDZ2Vplye+Tn7bIZ/MDRnV/KlE7@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ8l+7ipmqdGyRvmVwAkaz89yumNsjHnMkvE0WvRyhLa1zyMOS
	A/UYG+mzuNsgYeU46Ft1FgLyL+cEYV/DJlNtsN1+OtVaa4BVFAgziZN3/BkCGFv6a8c=
X-Gm-Gg: AR+sD10eB9sAokZcmCotjv0256nr1oNZWJskkSqz5/Oh3iW3TAWNcj4qB/TM4niPEBS
	gRyXvf2LYKe2ND7rDFHuwNJQMl0ezUjzkw8wZJU9YQSM8qCTrFfzLKruDAQUu2enyPqksJaxCpw
	NBodXNJBFZFDoCWWjramszjEr9Xqg2AFlFrTPb21ZHDvcMAgDIVj6vsde1R0RGQEQ+uL9VCg/CA
	KF+dsZ+a0avTbQupSRiNXNIj37GQ3eNsSZuTutD2R8jBPFWinYxzC7Enlyz+JWtkGMrjc1L7m+s
	L0xtzFtxSg3hb0lMWp6Nsg8N7+IaAXelItnKv9NSGBgyFMMyCt2BTeTqarBzgdWslzPkQg3Ggjy
	lMEjg1IcEunSxasPy5IFVtYYZ5QZ1VqUOh8QFOM/NC7WSdZMXKFcErrYl837rlrboH5ger7Q+DX
	ZO9I+InZp+LlT3Eh/TT0Rra8Ubiw1oel7c3wrmjg1bp6LZHjtw+bgdR+576gMzKrpgIP7k1Q5Ul
	7SSnpnGjPs8yjKZfAxPHtddCpLSIw==
X-Received: by 2002:a05:6512:3413:b0:5ae:cf48:bd37 with SMTP id 2adb3069b0e04-5b2d0247dd5mr930296e87.1.1785324449626;
        Wed, 29 Jul 2026 04:27:29 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d76aa2b4sm336457e87.29.2026.07.29.04.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:27:29 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8650: Assign CCI clock rates to 37.5MHz
Date: Wed, 29 Jul 2026 14:27:19 +0300
Message-ID: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting CCI supply clock rate to higher value of 37.5MHz allows to
program the controller to configure its I2C bus speed to Fast-mode plus.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index a64922c21267..a14e11d81488 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5615,6 +5615,8 @@ cci0: cci@ac15000 {
 			clock-names = "camnoc_axi",
 				      "cpas_ahb",
 				      "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_0_CLK>;
+			assigned-clock-rates = <37500000>;
 			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
 			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
 			pinctrl-names = "default", "sleep";
@@ -5648,6 +5650,8 @@ cci1: cci@ac16000 {
 			clock-names = "camnoc_axi",
 				      "cpas_ahb",
 				      "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_1_CLK>;
+			assigned-clock-rates = <37500000>;
 			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
 			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
 			pinctrl-names = "default", "sleep";
@@ -5681,6 +5685,8 @@ cci2: cci@ac17000 {
 			clock-names = "camnoc_axi",
 				      "cpas_ahb",
 				      "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_2_CLK>;
+			assigned-clock-rates = <37500000>;
 			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
 			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
 			pinctrl-names = "default", "sleep";
-- 
2.53.0

