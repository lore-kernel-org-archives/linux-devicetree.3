Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2929737B400
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172643; cv=none; b=XZjfpdGWA7EBCSpI1tHaekIHWhUO38tuUUMfc30TN41HNGZ/JO+FJtpXluZN+Ys3b7g9FYSBKaGa6EwCMFneIWwRo/Gw3qks2s8py86IIjD1myk+TzBTfMOWYJsuOstLACO/oG2PMC7YOMkuEaIiVAmfn2gJXVZMw4HmpyumSGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172643; c=relaxed/simple;
	bh=w1EEpnLR6xXq+MivEnb+PLIzt6dGl5j6KmvIWASlAcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkuEmSeAXocBKco8mm9cVSCErkF0LCVtD36/VqzbgGrKKm5j2Nkpj/2b4bmeBW5t2agk+YzbUAyVaKmu/k0pirIYghXboW6v9Jdh6V6svifiZYUBsYer1cOiSe7cDg9E7qszKt6cRNIJ1F/X+s1BlLHFJ1mXgEYSRsnAG/T+TBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9DAsjty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4kW0Yrx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9DAsjty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4kW0Yrx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA10Co299648
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=; b=b9DAsjtyF6XGUzuh
	7e/d+VvDRiKucG7gUFlZiJk+SNnSc75Y0a2QHcjklMrG62b6qUqqJjxaNABLt2PC
	eVM3tY1Hcordj6fmHzqA5JbH2rRDZlU5pODHDB9J9bnHzyIbAAYiMnsvCC6deVqB
	U/DymwsaN09FrW6lZ5R/KcNuCm5Sf+h/a/ahF+Y8Qva3hSycpUQlbgVXvOaITedi
	+gsfBm0hdckn+MLGOYQNdn5VOBoGXHUUOJ5LyA426nw3emKM11DEku7xhj+F8cJt
	zQNckpfqDgkJUeZYwLnRaFm+Sknhxw43IPdyEk+EHq+5YZxgj1VDyicAbnem2bE9
	d6v2cg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702u9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:10:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so141373475ad.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781172640; x=1781777440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=;
        b=C4kW0Yrx8g11DVArIKyDAna2A6pTFYZw70XE4AgFmazk7C58F6VioJNqOGrEZpW6Pv
         ehsKcxF2dh+OjaZhiPVuz9im3Pr0i2xVsjW8+wR48ncz4PmBU2s0V3cHJ4t8AFwNAth4
         V8+N8R1XsDAsv87RlPjrqENoasq9ScN4Vr9MSCex9yNDh9q8Mi/oa88ouMk3cdGuvUNZ
         XbJvcXsk31F84hrqwIp+8a+Dc2nDOTpZSLPKN8bZLCvXSKtx5nHmmTMFgJJF8yKzvdhA
         gT8ETbkflHBJamyGXtlFQU86QrzBgGdVXS+WQyY1QFQ0gACc0vCxiiA5szlzeh29KhrB
         F0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172640; x=1781777440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=;
        b=QRm4GuZp854DkbvMFtaep0IGwmD1UrbXx0NCf32h/4/xzJf4HyLMAyY/CPUicwN1nx
         EvlJ10J3NaFqjlG5sb+122k8FzRiCi8LYuTnOBqqYFxhO159g7iQ3WKU0pj5sAjpxUK5
         fUG5l4fo+2iOxA18kflRJYhXkspoPIviXzFepinh3gACEnMYYsr5JpIetMAvzY1YJouZ
         /JuWe1POIlaat678Yyn3Kp7ogmYjJuArHiXTJ9yhNkMQOovAGHpudB8ierE6HZU5mBvx
         0uWUprIDZmVvyvybC4dxS81WDmj2Z/e85wUf4IQxsX8JFs/x38fbHi939RfKrqEtUWaG
         +iQg==
X-Forwarded-Encrypted: i=1; AFNElJ8CVMUb1z5/0eueMbqI+ciEKjI4Qp2tdkbMizQ9KkCsUBowXJP+8qUbLO1gXCCXIvgq4QcyyxTZ4hHy@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdT2MSBYR3v95waExZO3Fb1gyK8qzICkF50oArqq30dTj0l+F
	Gzkd5YUjIlkgYHWJMDYuCNM3CEJ7thyPVv/vxuVQJr15gt8XIvI1z+GJNifNjo9ngIrzd9qrONR
	urrICVaali4JOWx9ks2VO81ASWKPt3AApcRINlYqQM4Cs+kpR391PmLjHnp3La0NX
X-Gm-Gg: Acq92OEl0TYEtayR+HbvI12fwEFLqnrgPtyZIq+VwLq+FUhYfSYmcsROWukcLXiY9Z8
	aVTPgTYbfUxs83haFCK90bCKkd6Wk37ZTkD0RDLefcvDHRsHhwanCzbJ4wCwt+doAX0PQriB6cW
	1H3BZp1wanlY9xwLLiI5e9PNqpoRJsbDVL2rCbvxoQYfwPN2s9aLyDE9QsIoTVWBFl5UYNZZpi8
	466A7v4Lje6KBVrKd2LuwxemDZntoJEpGo0TehKxgis1/MZsqFBGBp/lLLNzFAziylbbEoUnoFY
	3fKZar5hwxcinV5AqRtgOAV9YqZa7iQdoiIG9ag87Sr66Dl6Tn1iR4TBzAPQ08TlPojx349L5mJ
	nTJjea1tjtZ/9eUGZd2LCRHyNnXGWi0T0izbs2Ye4X3gYYyo=
X-Received: by 2002:a05:6a20:2448:b0:3b4:87c0:d90 with SMTP id adf61e73a8af0-3b5e33586femr2423592637.28.1781172640052;
        Thu, 11 Jun 2026 03:10:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:2448:b0:3b4:87c0:d90 with SMTP id adf61e73a8af0-3b5e33586femr2423539637.28.1781172639553;
        Thu, 11 Jun 2026 03:10:39 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865860f3d4sm1279646a12.19.2026.06.11.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:10:39 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 15:40:10 +0530
Subject: [PATCH v5 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-shikra-dt-v5-3-103ed26a8529@oss.qualcomm.com>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
In-Reply-To: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172612; l=4449;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=w1EEpnLR6xXq+MivEnb+PLIzt6dGl5j6KmvIWASlAcs=;
 b=8gVoS30lkuWjAWd86AnwnX/01hSYh8ATXkBrk3/U4Xsku5YpjfWMCzOehMCEqMv9m+Rd/O8b9
 k0O39HTkG/NDhY/ENhEHotPjfmSjEx1HY1vGlNtpnDHdpY35PIfDSJS
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: rSZ1HTe34mws4QMcCBtC0QRzVlVSbP_b
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a89a1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=s31jhp6hv9j5UOuNascA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX+H81T0wv1cVu
 YRnRkJ6f7db/J/LSqoszCCcWEwSHHmzE5HS9bVObBxvKGeRVevl8RPTV1N8R/xK77ezcYRL+ecX
 jKxA28I/l7pIemECOztcoxP5JHPqFBuZxuCiD7KHWy8o8rcwhZzMHZ090BvR+GG8kyuKjWQzI01
 yhzvIaWHI3sTgGaTV/8nQZG2VVdrUvQkLLmKSMrXmp7/LmqKaSZEkdz2IgFTtH6wmZPbv43wSeQ
 fazrtQMrI4komuXqAGhCUlyyY3LvN81PkLrSLbv7LR5262ZpA0NP9lEv8rcYnTIHSgq691B10W3
 lS3jtz/frT39+JV24gUEY/cNc3cvecBcyTqOFUPcdH8t2KleTkvZBcGxgbhuJzc7SFwdLHauSnX
 oEgKftWF7yEkvBdAO7/US3NXBybBr+e+XDOGiLEfGHmVg1/d4FN4Hgab5bPOwocCtOcUA4Wsfe/
 bQd8eeIRbAGueT1vJfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfXyFF6TgmBz913
 jhga7R9tuoHXU/TvZsC6DS5wt1su5I6voDVM7DxDtvemPH6q+uiXlSuLg6MOIJ8xGapozcEwuks
 FYNhAc5OKs7KVbfBIlFCLe4/l4JbUXA=
X-Proofpoint-ORIG-GUID: rSZ1HTe34mws4QMcCBtC0QRzVlVSbP_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110101

Add device tree include for the CQ2390M variant of the Shikra
System-on-Module, a compact compute module integrating the Shikra SoC
and PMIC for IoT applications, designed to mount on carrier boards.

  - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)

The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
peripheral definitions specific to this variant. Since PM8005 regulators
are controlled by rpmpd, so disabling the pm8005 regulators.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
new file mode 100644
index 000000000000..dc3861489f64
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm4125.dtsi"
+#include "pm8005.dtsi"
+
+/ {
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm4125_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm4125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio9";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&pm4125_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8005_regulators {
+	status = "disabled";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm2250-regulators";
+
+		pm4125_s2: s2 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm4125_l3: l3 {
+			regulator-min-microvolt = <624000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm4125_l4: l4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l5: l5 {
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l6: l6 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm4125_l7: l7 {
+			regulator-min-microvolt = <664000>;
+			regulator-max-microvolt = <664000>;
+		};
+
+		pm4125_l8: l8 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l10: l10 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l12: l12 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm4125_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l17: l17 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm4125_l18: l18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l19: l19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l20: l20 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		pm4125_l21: l21 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3056000>;
+		};
+
+		pm4125_l22: l22 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+		};
+	};
+};

-- 
2.34.1

