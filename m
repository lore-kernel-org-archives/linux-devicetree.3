Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BCA34CFC7
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471468; cv=none; b=F049CODnEuQN8HP2WEJErDF4M4R6hXccfBKJmFtdnjRTcmIL+L3LddAH+dNEj4L80gEdsVSqITSW8zb0UVoArxBdR+gH5rrZ/jQBfZFk2nrV+spgaqTyNoRPj6ONZIwzLqhxeZ8U4ByykBXgaE/NAsbbYtAMR37oYGl8a4dfiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471468; c=relaxed/simple;
	bh=vdNCZMyEjhjyZCqw0MVqlw1sAiyCVEz0UXDJwBg2RR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSVyrCpD0nU10QmmoNJ3AED5HUfBAz/5n723PsN7h95+6tIRdAmvkPKDF489Ra2Pj3Xtf+yOsInBIJjJ9JT0o3G7uIiHwN9fSVsIETq4Q6Hh50Scza/86TXcT7gm/O2ZUuItcH4BTXnu8BXIhynbguMtOY7uV4CV3szTVjBt55c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h3f1rl+R; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h3f1rl+R"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso812075e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471465; x=1784076265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwmbzdSn20B88+9kuDOXAlg3IDfSopdsO2HWlt76WDs=;
        b=h3f1rl+RCU6tFTou2BJh0tQC0NZj5V/pudrMlfEkYx77O+Sawk2NxEZu7mEkpNqxYB
         GMG3S3pHAX9MwEhCz2Ft16rqSLexAi5yisdnHuOfi4SIggbgt+R7ac0scFCUVzn7FSFE
         Y/JHy6uus+jHqPxXXKN9xQbLKccg/4B+Wb5hDuVLVRsyKN03jyrTqhTZ4oZMAwmOvzCM
         AfMWy4ooNNgFdbNS5oZ/MeXhNEtP6MhFiTD0fn5Au+lJAPSN3HvxEuycNgbwB/uHCj1/
         B/ZYPdW6Bu+6XIQbSoryaQIgw14Lhhd3Ny6OHCh+DLq5WnxjfWaaPRrnHylt0gxBBTpp
         bcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471465; x=1784076265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwmbzdSn20B88+9kuDOXAlg3IDfSopdsO2HWlt76WDs=;
        b=otBeuc8S2oBUuWFD50ww6oPvrb4ygdC+7VAvzbEKRpvmPHCY9b6nOSsUv03wotBP7z
         1pxvVN79kszvQHJG+oBKHaGg9L9EGqxYgIFqevkQAI0Bot1Z1pR9G26ojfsa0+3zCUhH
         d81Ypa+mZv2ZuDuUZIJdJBvlNqqBxJMX036zJBIOt1cWGyLnGKzFIZCB10fsJ/S5PXm3
         b/YkKTwx3wd51Ldu//beoKCcWG3pqSsqUu0rK3XQuXiXqqKFnpw1ay+WAwlEw4oF+DrD
         YQPrMTvb6bZAnbWCkFOm0ju9xdWOC1gS5I7EXW4+M7qx8vYhwXvy3/czmHectiLrKjOH
         MpRA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+6LrugNOyj3Qk2ZtaEHE6d9+vhNyzdtULuAi2/ZnQpX9wLw+ikWaxfbNDvOYceCX9I/bOqH2bzFIZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Wg35CEjEFkg3xvHBvB2SPz6X359ei9gPjcvhp5LPhGUjznUz
	TMtP7dCWX6esyx3Xdhdw0Rczj/uxUjyNZI/GoZ+4S+ye8McBaZnL3mBoJvecX37nMfA=
X-Gm-Gg: AfdE7cnelqNcFVNoRJCx2IzRsqWmcy7NHJtppbHdBGNl8FYa0moSUDMOzg9DjUpucmM
	BF2W7VwS1mWTp2A3pM+K/zQTtjJDWmPYWqXQLllLWWBl27MOvNDliFIJDgyu9hgmx++hGrwj7S8
	RiOmy7jnMk6hj91AQWTOIh5g43FmMZRHyNnRMp1e6TU9MSE6TvDNdXHoib2A+RW4vdO9hECXl4p
	rKdU0HUdKd2q8fapWjmfGBthBhcBa7kkci3ssZAPHctUA5XY20GB5EJhSrilGkP19umnt4nh1RX
	JGGcYVSAv07RozfS7pQDeoVlbWUA2ybZnwaUrHbkmX6EpoqD/kr/GGkKfXhuXYVM9zE8pXDj92q
	R1MQt4+4iKgz8H16KYkCLBAIADwnsBm05M5TaM2m8XFfKHjkuD+UTEV9bRsTSZ8xao4Giexh/KB
	UGoBTk3UrC+y9fFvZ5kLkIUOo=
X-Received: by 2002:a05:600c:a43:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-493e68db0fdmr1406565e9.38.1783471465062;
        Tue, 07 Jul 2026 17:44:25 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:23 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:11 +0100
Subject: [PATCH v4 04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-4-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vdNCZMyEjhjyZCqw0MVqlw1sAiyCVEz0UXDJwBg2RR4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1cxNppg3LDWlHbwrVWBW03yhTXcpl8PEIRV
 gdfwAa6+rWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXAAKCRAicTuzoY3I
 Oj+GD/9enbos5zACu53il3SXjj+WzUBroKk8JlMIoUBtaiZuqDLdcs19k3DzDcXLUqm/1KZzOCE
 Q3A4ON+IWW7d5TWnF+auq8XMhf45bAiIXbOgFZkPVk/QQjDrOkNmUeHe4ww5ZZ3pwX3hCgXwHqf
 NCduhD+cFEgBC1MVkRNfuGdMT944tHY42akt7mj71uH6G88daKBMhwHzhxI0HRNBXJt9vy5FVgC
 sTB++fynQ3yamc3sKLED3RkPW45d1XQKNlB+1JaecmobvxgmqMuH6rjB6ZEH+Mo1z0Dpwzh7EQT
 1Obx3g1ZrmFi5AxaZ5mSIfD9XJzp3dr2CGpV01u835lFYQtl0MPMuVtxu03UJfw01dChmWJ8uxb
 cfNO+AT2wY3N6JNHcTtJZro7jzEyrAlKd8NvZ0Bd7ZW+xdGzp1oZh4s5GRI7IMAE7ZxwqAnyW9s
 N6WwK0PdLoEBW+RieoUrbA/ZHRT2TWE8CxoIRcYYUO4HtJjEb0A8RZMieuxWdeLu/NEyWMpdvFG
 ziAzxQduD06NuM1YQ7jqBb6+Vq1qFarxfKN+Y982+gcEjpxn3NZXaIYad0L1pleTsV/EzF2jNtv
 PZC0lsmY8TgpWAcWuN9acz7p6IIIJwAQ9/84Ed09t3Db5q++U0Ffwf5lZ883UHDPd2obEqyYOHJ
 dOgE7XRKlv1JNFw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575ee..7b9a40a7b9a95 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -897,6 +897,36 @@ vreg_l3j_0p8: ldo3 {
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
2.54.0

