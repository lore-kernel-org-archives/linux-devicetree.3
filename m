Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F5D381B12
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897341; cv=none; b=ae7OLK9WAU/+UhveIVzqf5dEq4E5tBpT7dLftJASiPqDtyMhQkxZEka7+j+btyrLztRu7Ktmxi1MHCb7SbUI1f9xppZjMf1cD2kIMcGPIgUfRZGSj2mjnju3UkVNy1RT5sdhJOWBgY0T2oJQYLdsKWLyY1zvR3XCubRMHjufbJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897341; c=relaxed/simple;
	bh=w1EEpnLR6xXq+MivEnb+PLIzt6dGl5j6KmvIWASlAcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6qz9W9hEv63mQJoKgtt3MWmO+mXzXWbuhtJ9InFzwZ3gQ/qWbYUliywxiKoQ5MlCXWoq+LEm4v9cdfCx69zFfd/ZihMDKg/YvrjXYqM9aJ3Ru7DSiBNAezJLBscOp4wCrN1MW5p9DQEocSz5rCsu8BXtZa0sbvTzgxqTBEgcdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTNAv7/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGNKC49N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTNAv7/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGNKC49N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RA6bP31149430
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=; b=fTNAv7/U0s06ofwW
	nAzjM0I+zLtA/oNDghX7Dblbt6yJMLIOOEfju9QfkUWoyDv87OhK5diURuWhyGwW
	AdZDGy5Pey+FIW/VLNZ2P36U/Pgv7NCqaemC2ioXWO8AnMtHCMeJ/8FCSh77qV1l
	NoCxj8f45iz9g0sPLpZnDlz5fRiNqgzy6dIuAS8BKB4Kz3QvCzGsQQVRRAt++Ox2
	FBUKwJnzLsDIsE48DHO6bqzlsgOGxYE5MKlKskHDKeAZMUFvQ++y4t2tJdiNdFeH
	7mRTWhY33jWgLn5w7RioOp5LgbGX73N2tYeno9hH7X2znQjI8yGlWK80jheAk+x6
	V0lLTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxjsh9y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:55:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b99eb06178so25945615ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779897338; x=1780502138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=;
        b=UGNKC49NRnJKBFXD2uMhU5g8bhrXPHn71m1Q3F9Ck8hNA4zP5QwHeEKHH9RsanejqE
         6nCKI9Glg/xdSRTUf+m3n5wTGAyPftCixJeqsw8DmxUL9najRIv9KtDBeKp1Kn4G9Rm8
         AGqgW3zvF39InHGrHsbcQtCYcfuVaKQXPqr45F7wTgy/NTQbNKdsc8V7AcxmGhDK5IS+
         ov5ejwSwipqsF8FRBzsb+wNDqo38rOZKvHi/EAPIxmMKXU5Q4mI0Xazv5V7w2p4mPh0I
         ZgepkVuNZtykQLpfwEpVcUY3USh5YlhQOsGtGzc7DssAxLPX3t+uyrikaG2uwIIIgHBB
         J+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897338; x=1780502138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=;
        b=KoJAnqhDsGT+DelFCrVAuA2RWg+DO9UB2k4KB4cJ/ia7HFrNSUs1b+mU8vDrEz/E8p
         UeJ4IyeinS2Y767SF+PY+JyRqUFPSYO8oRnn0xLcwZa7EVT3t4TA5GZTTPymKhLkcuDQ
         ZPOHP8+NMB7VZoUgPnYNdh8yf3XJiLvGguXThSDqUgQIg/BINBQ1LfFwobSeiA08HRNR
         Ti6A8gMNyZPrg+7Ym6bQnQbzmJ7y+ZS2qnqerX1oAbYZvHz4tH5h+vZxRjg45SPlMZiq
         Pd4njG/S0qhlJdPx0SlUksKcBc/r8cQuqHfC5IlPMzaBN+kSHOEfCAuLN8NIMpbN5pCr
         rPxg==
X-Forwarded-Encrypted: i=1; AFNElJ9KSJmqBaSUgQIfcNbrPqcS7WDUfejAWnaEJC/caAJ9kuAQKQGKZ+3w4eQvoOqi5hoidQVLkudXnkwW@vger.kernel.org
X-Gm-Message-State: AOJu0YwG/Y+26v5xL+l60r3Y32DXW605qsqUpvvVWAXDsmos9Y12wdgP
	D/zivzFfDL9pGmBCuRaPgYFyMkys+U6uSsmQ3pfCoCzk7AzRqtip67TCYj2XWm1VkoOzpbMeJb/
	lmpehJXbn3EI2g1rEBDWIDTNYczP/TTCI/gi6H6MQ3vSlmDSblLxGpxuZ714r+pTD
X-Gm-Gg: Acq92OG7tOTz43WIHKAqcN7GnrN1i1TotCp/hQxvxoF1xyw/mjvXRCNNZz8qpyWoXC8
	QyWwmtQD5qLIugDRQhKxfL3sZUwGV5gg6ukJtqdpMHPJXtFXVYec1HLxC94aFvsxqZxyKaWalYp
	x/+Mw8oTnd/RDzSdB2gaA+AJ06vKyQo56vHIBIbtwofcwCIq//9fVsT8Sg6V4542aDc3CsofON/
	EZDDr+u/DCskHUsVu+j7i7fbsRlN07Ff3BuzSVngnoJH2l3rjwxCwLl3q83HmVnZYOB/iOjLOAE
	6CAfjKMGcV4mGQMGHu69qTP3krztB7S8XLmZYhGMbVnuE4CjvpkpnyBLmKL/VYlPgPbqdxp5XWb
	VfRV0RXlyL51kx7WvFtQkJ3PWC0vQ38Q9wOhn
X-Received: by 2002:a17:903:3c2d:b0:2bc:7d4d:3520 with SMTP id d9443c01a7336-2beb067ac30mr244530565ad.40.1779897338307;
        Wed, 27 May 2026 08:55:38 -0700 (PDT)
X-Received: by 2002:a17:903:3c2d:b0:2bc:7d4d:3520 with SMTP id d9443c01a7336-2beb067ac30mr244530175ad.40.1779897337822;
        Wed, 27 May 2026 08:55:37 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beff36894dsm1264135ad.37.2026.05.27.08.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:55:37 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 27 May 2026 21:23:53 +0530
Subject: [PATCH v4 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-shikra-dt-v4-3-b5ca1fa0b392@oss.qualcomm.com>
References: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
In-Reply-To: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779897312; l=4449;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=w1EEpnLR6xXq+MivEnb+PLIzt6dGl5j6KmvIWASlAcs=;
 b=SSYZK9Rpr8hJBNsTGlg+BunartDZMb3yNPpKUlyA82S0mBXZMa23IXdgyJb41W+mRevsEm892
 ENdJhXTBgQRDuq2fsR1i5Mzwp0HyEBfauCiXgMQXXxXPPrulLgpig4L
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=C4PZDwP+ c=1 sm=1 tr=0 ts=6a1713fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=s31jhp6hv9j5UOuNascA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1OSBTYWx0ZWRfXwKH2EXPvcKF9
 wih/mrNVBFrPqExsrahY77bYHF8vgo/8fyWHYovtTJRnOQ7bpukhZd+XqDV6+/Y7IPG8qit6S6K
 R+M+Tz/5CkekBWN5qMzV/rT3x02VmS/JXYJBuh6Pl0H2r2zYGMR1DHpB3yNCWlaGazdRzGVW/bC
 PVnSdNccNu2Tskemj79AzOZhrM+jO+h4hiyy9ja/NDCbBkh8nAa8E7CI90lAkCwSwbvAIeNg64s
 mR2TKTYsXtLAoxnq44Gt1AbCHszXdij6eM9E6c6YzqjrtUFpGUpaxG5rH/Wz800lhHymJKc9N+b
 p+/cnQpdraux+DjaX0X72ctvq26z62nYeW7SXyw3ELeIUq4wvL/tOJydCMClZjvl0TihDQaHA4l
 tTmqXyjgrH7jLJlc2b77mbRxk4h7s6uvItiH3T1eNSO6hrAT9Avisxsrq5C+Cc5X8mVo6uBsIUm
 IGl3KMvuFZJvIG3dprQ==
X-Proofpoint-ORIG-GUID: 8hQTIb1wQ2t1yoSkNPvf0YXmzJ4Z-rEd
X-Proofpoint-GUID: 8hQTIb1wQ2t1yoSkNPvf0YXmzJ4Z-rEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270159

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

