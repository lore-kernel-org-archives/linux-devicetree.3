Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C040F403E95
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285295; cv=none; b=eLRKQQPwxASiXzOhW9U/6nPeVrrxGn8DHI8tx5kItj/hM7LiUysmNS484bvEaxdATp9hxzolU1/a0zLe1N3ccyRijjK8ngrMg8vioXQi0RGdnBhjqIq+WGN9lsrN3F5hTHBoddIjGpo+woeVVxdi4MV2MYRNqBK7ecCYpH54nWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285295; c=relaxed/simple;
	bh=de9OCkDKTuh5nf4nMudEODeUDKn8sPIhepF3pO6PxjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q259gFkx7ULPKfMBgFIK3b7VAgekOZRR2xEe6AFCSgJ80DFk9D6uGiylcZH3f/g4n0f+dflV9flRnh0gjSb2+wb/uAw4nWzMPKbW2h6mqCH8xjAGx3O6zwFQe9TpEHsKDD84mO096TSLchJH8P3ijeuzBzaVsh+FiHIDEPI+tEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDofAIFB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOEJvSu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDofAIFB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOEJvSu+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGSXFp4112925
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdoZ2RJJ60goTigF6n53lme4PvQ7Le5l4apoZP10XKQ=; b=TDofAIFBt5M7d1aM
	lYIpv/qZVvf+emu/0hcMcb8LlOQD3cV76rXQ3kzQNfP+SHB17eEGgW8aTCeME1Ld
	zPSFFfBX36F3FVcnIOGzp34MQ1gg7AaDASk1cyl7i//vMeEiAv8zg9ICu4DcGgP3
	kktIa7wtH/vtrYGIJbf+h4AQJrt2uL21fQ6JJNnzlA4H4Y9WQtNb5OJt4luLkY/C
	gCQhljwaJdS/xKY4UJ12xsx8qt0VVtPtRIZ+W5EqKyR+XT4wLHf3TsXfa6ugzRX4
	tEyCavqKUpMsr7ObdrqKXs6AyPp5FgqQUEMsbnUPIh5WzAl4sZyGw24Q7KrTzLDS
	wLkELQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165cd15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:28:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2beff6b6e74so16360915ad.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781285292; x=1781890092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdoZ2RJJ60goTigF6n53lme4PvQ7Le5l4apoZP10XKQ=;
        b=DOEJvSu+7spS/8Wyrlh0Qh0MX+fSeoRbLfRh01KePbnvmbDVVFVnSBtFjZivCG/c7Z
         X8pqBBMqRQyrbCN60Uir6zP9ZIxHO/6VYv5OxZNLAZiD3Ajdwa8pSHRGBG+OLcSS9W7I
         E+xEefkQB+8nZJJWrLKRFpFDrUBVm8TJEaxibTwX/YyUvS3f3yFCs3u45po+qi8oh7CN
         8s5gzjrMIuzsufYusBX5FgKZ5qiiAVSjhH8djzpKQTsI81xtL6eNfPtJUo2yUVr4vi1F
         NjiOssT9pbTLf6M0KoT9ZBC7Qj8L/iSDazwcxT9Tib0HAp4v9Qpds6X1Aj/s1sm+lKt8
         5IZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285292; x=1781890092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XdoZ2RJJ60goTigF6n53lme4PvQ7Le5l4apoZP10XKQ=;
        b=obTCjoB7K5z7M1wKvj47YtfebsI6CDqPgzfnWf72AvYPGEWtG+1kX9Ksx9oxP2Z5yM
         dzTguKQXQAqeYWBruJsYropT+YAbjVas2QJi8j8yAbQZDgVOT1SH5ro7Zg1kUpqRuiF8
         5L44w5ZWKZmJzX9a/1CIRd/7GXhJIt8Vqt8KxxzQzBqM2GzMNZhoL2vw/nJou0q0MvFQ
         l6Siz+emeiH0wrD5cFdYrBZjO2bdJQw+DBt+t6rlIKw5old65uzgdqEnWjj5Gy1aUD7a
         cdwtBm4WTwGp1AHUmetJDOk2ITCEutLG5lCWyvfT2YOJkoDZ2V/6sxtZLj3DuMjKyqVx
         SeqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HwpW6uWHEkPgGxFbTVlGZ2NfhTuVNlQWv+YRNPz9yNuKyvJVxEBKgYGSODhCjBHXdyEEA0MsmvBrF@vger.kernel.org
X-Gm-Message-State: AOJu0YzmVCOsx3Stn+sbbUzpos3Ob9iGXId026sgnMG3Zqva7Zl9m+Xu
	y3eYou/bDRgODztqUpo2Snt+u0Psu5EKOa6N51i5dQ4EoYNO0V12SI6e438Tg30bz6lucO0c2X8
	cFbRDiNiy2oGGd++ICgXf0UL1hVnt/KEzPZzXcYy/UUkbX/48a5zOet5KlHMlIAgFybE8Izmd
X-Gm-Gg: Acq92OHlR2SeB6IDLCUPxmZpC5Oj+9gPhwlNqWpO311q/CMNKIKK/33JbzFFVsou2SI
	Zx3BTIiLDsLf/baRA0IgsFGLflyzbfbP2t+1tX/wD1jq8l90Hm3i34zU9+x7cP3HgbmfxZ+zecm
	jvsfCbK+sUsJ9IhL9GxRvsd6epG29QDYebhlWRKUZmkBjH2LjcfVEYR7Y0t7Itf8Lo0X74Uy9VF
	HA+9v9clTo9A3BfZfpjQCwMpKq2JapIN8CLtIvE7tjkfv/q4pMiQsSEQ9pTKnGa++Nk5D3WrA4f
	DqiDPs2ZtuQ83U67UjTSRBeIq0meK1T5VMTp4CV0PRn8znN517DkS6/7fB8FJBeZYbo2gA//Vis
	srWrcFxyFCd3giXvxwutUrhu75nsNeFQLijpn
X-Received: by 2002:a17:902:d4cf:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c4130100a2mr44827745ad.30.1781285292379;
        Fri, 12 Jun 2026 10:28:12 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c4130100a2mr44827395ad.30.1781285291755;
        Fri, 12 Jun 2026 10:28:11 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acae2sm24278105ad.52.2026.06.12.10.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:28:11 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:57:40 +0530
Subject: [PATCH v6 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra-dt-v6-4-6b6cb58db477@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
In-Reply-To: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781285260; l=4606;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=de9OCkDKTuh5nf4nMudEODeUDKn8sPIhepF3pO6PxjE=;
 b=ac4w353wVz1Kr4Ck35e4r8txdyNgNeb9l/h1BYOLSNWPT/tnFJHNKxgUd+NCLQrK3akw7kJYe
 S2y7pSgLT53B+gXKBuwUa41fS3dtRgFveNdqzvz2NjILPpQz0RfgeUM
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MyBTYWx0ZWRfX9zwDVoLThFeT
 bRIauP/7oBeIwVBUGJ1y5QZ3J9xS6ky9DB7UAMLHuFKqNUZen913aXagcMgoil0oJPHqAQ8Sgzw
 0QjDc5Y+Uomu+wDYqQ5TiwTWEkJ4rnVCdjgjcE5HAU41oB8OEvjeKSWLY5tG6ZJeTvZ5/lU2WWM
 GnfzVzBPzltr5CF7rjekN1tzQnUc9slu4fYfo2vi0YoXknkhG53tagi6mhkcI3grV5mmimrMuvr
 e/iMOjtuDmlx3xQSx+juKwRRQbLcHIGGffdF96e1ehavfJG7BUwKsxWXWiXl7eoOHWyParZcail
 3OWtQhA0q7jbAR/rSNU53lT8rkN8VPGkSCgGvLdewRvB2O7uDGb+sYL3GDl9KLrmuV+IZLTNaWF
 f/m8934JGLhTitHJjcg3ct1LtSx1IR1B7SB+uHwfziuA6sZG8CaAyQnVATvwKn4pNK3O5sCGXQ7
 uyc0C+AjXvrEEIgowTQ==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2c41ad cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IZjsGcCFCfEoDLf82CEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 7ui5r6vTexIDdTQzvHIK0EmrbvFHG6IB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MyBTYWx0ZWRfX4YuTE6sZLeu1
 EieqbtYRNN+b4hyXZKLZe1v9tx60L1/NKJgl4AoA0gFqpoJKKzK7BKNqdBWHpBV8KmWC9Btwx6X
 f1OHvuZ8d/au3x5aH0D0iIRzD0Y6ZJo=
X-Proofpoint-GUID: 7ui5r6vTexIDdTQzvHIK0EmrbvFHG6IB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120163

Add device tree include for the IQ2390S variant of the Shikra
System-on-Module, an industrial compute module integrating the Shikra
SoC and PMIC for industrial IoT applications, designed to mount on
carrier boards.

  - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)

The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
definitions specific to this variant.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 170 +++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
new file mode 100644
index 000000000000..73945bf42112
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm8150.dtsi"
+
+/ {
+	gpio-key {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_n>;
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm8150_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8150-regulators";
+
+		pm8150_s4: s4 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s5: s5 {
+			regulator-min-microvolt = <1574000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s6: s6 {
+			regulator-min-microvolt = <382000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		pm8150_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8150_s8: s8 {
+			regulator-min-microvolt = <570000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm8150_l1: l1 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l2: l2 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8150_l3: l3 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l4: l4 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm8150_l5: l5 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm8150_l6: l6 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l7: l7 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		pm8150_l8: l8 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l10: l10 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l11: l11 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l12: l12 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <1950000>;
+		};
+
+		pm8150_l13: l13 {
+			regulator-min-microvolt = <2921000>;
+			regulator-max-microvolt = <3230000>;
+		};
+
+		pm8150_l14: l14 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1910000>;
+		};
+
+		pm8150_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8150_l16: l16 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l17: l17 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l18: l18 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+	};
+};

-- 
2.34.1

