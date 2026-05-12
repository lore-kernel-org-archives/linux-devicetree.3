Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C6F2F0C74
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778558942; cv=none; b=Glsps5nKjbKMHSA6mcl+rXQr5rY0voK+HXvLGasFzpJObXh0/anOTZB6c+cc4SWX2QTvt7Y2gg1NxB38hWxiZm46iENgp3duEFx4YxkPocc56H5JEpyPjQvnbF3vSjGREvJPD1WrcTqR6nX70xqmYFDkjKhtbihuM5J+XXUDOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778558942; c=relaxed/simple;
	bh=1ljQ84A7zAj1l8wEckyCPg0Y3BG1MCDQO9YwUdHJcxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f1MubZE6pLCZzUQ7B2IdAOK6kaIfww/+Qx28dPIgfLPolgCroab9q9x3JXRkgqOqzwOtnTY5Sqpy+MW2QG4IfyoOh21E1KkiaMM8HODQDSpKf7JOCO3fZpF1fClVEHaHiy5myrVqWqlIpHcGlxO5uJJRjcownM5Y5RRpbxPAEwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCUCEUEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OatY2NeK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCUCEUEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OatY2NeK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK7BEU2804751
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97aapM4tZqs1IfO4iQJmxPEFoE1eTTwgfUYVmSbJ24Q=; b=jCUCEUEuCaM5YdFI
	r5KIB5d/ibCScPeS6tCfwzix8rgUQrysCXFYZ63l08rrsD9yJNziJyvJYx9wN3pz
	14OaXYLvndElO+2KhCv12pU+eYwpyVK5aCDttuOGRN+RK6N9IvQd5URa6IGn/zyj
	VpGUvxrUhYTuUnXHtT1AsCehqQtezGiu+T2vSlb/t6A6Ck3UT3hgnM7ObOVZC3wu
	rKyEJxfdu2gaGZ1QGixMgMW5NZfk2V+mnKzKfHWd4VYw11YWhlaWYau7pImntc/9
	dJeJiqulzXUU/0WMXqT3XO2irhXtDjObDY9U0KK/DTsr36M4z8DMM+fE6vDTB8+Y
	r1DuFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv39e38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:08:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc977e6aedso24819405ad.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778558938; x=1779163738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97aapM4tZqs1IfO4iQJmxPEFoE1eTTwgfUYVmSbJ24Q=;
        b=OatY2NeKsQeMb4vSzbdFWjOyKR/e3uRaUIM6AYyaJ4BqWKnAiTBvfTblS3e0+P+vEu
         hM3tFhfU77bCjwZSrab/Web1Zc7y0F49L9BY7MacWGuI1TH3ak6dDwH28O6D7njXe967
         +QOa3D6+n7YlRsKt9btuEOjA1rFdCrUYvk8yT5QleJXelIYnQ+Hti2crQ4MBmIUuMGJB
         6bFnV3Fe+8yZngZf0jTtslD6QFQ3KK8VJZZGiahHKtMuViP1PL8/04rpaFknikdy6xhg
         G9LHQxF5WJJw2fIuogp92lK8cBYNjM2cI1PWpkTyvxiQtffUjSL72MS4gVX1N91UI37a
         ZDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778558938; x=1779163738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=97aapM4tZqs1IfO4iQJmxPEFoE1eTTwgfUYVmSbJ24Q=;
        b=tYxXHmf14mszSFfFwY0a85/EYmkv+RGJGNtJsgmjbCJA5IFwJF2jMJym9g2SuQFP1t
         hRScUJSQsVFb9/YLwqgKcEjii19jbF7Pf6YLxkS5mBnFpzGpmtxmaPucynoJkJ5FGZMv
         DbHT3jshvD+IxWv4z1dAezz4D2rKHY4m75mrgGBczh56E+ur9X2M2je0fWw+bpEYmJOW
         EHzBWQ802fKU9MWRiqBA2g3u+EoYjXPpPLNjNGaOyv3i9Vmg3LB6AmdTHycSEJqYuxAY
         qDvw+VltWb72BsMwkHVcSsgZsdRgx9mBU/mYwJev3eHOH/m9Xji4nY5hmmba5WaqNMgU
         SuPA==
X-Forwarded-Encrypted: i=1; AFNElJ9f+p8J4l+lG6a8nJfDsGUG2FyWD6OVI7S9sMrB7IMYGG5BFIlNKhF5wQ5bAKzhNhgFnWv4GpmKFAjr@vger.kernel.org
X-Gm-Message-State: AOJu0YySxGAriWH5219NJ6AXfUfIxRdLVHJLNJLg7sQd+fJmqi/ttCj3
	jaDzeqL/5xJvOoMQa9On8yk4xHHqEc8zTCM/UMl3fGsaLtJ6XuZv6ITlKUT+RhB89fSe2f/zF+C
	q/BdO9/aQ33X7++VsHhc9/SxCjsat6VNJ9p6hUcPY8X2qi8mS+KNaYSvX4O02AHzQC5m4vKDz
X-Gm-Gg: Acq92OE0AzI5iEntskq/9UmsbPpocgvhOlWKQIrR246GtJe6hYmPBquHPlNikTJOjsp
	NMTb9Hf1yHWmod4AdPAKqInJjHi1Ynii/9YY6oAejPxs84uh/fYHj+E2awvwbsRJfW0Lt8Td3w4
	PwYG6Lw9J+g5EbFBszl4KXmvNkSjEmhKNLnMExfWD071SWamOyx5yPxq5tXyvl0lfEbnfM6seue
	4ui4NjuVTiI2jqGnKCtOtBzdr3FqNT7YLrnsXS9rw4/sI9qVtdXsS2pTg0bxfVuAFDhpHcN4+DE
	IUbs1dR2eFx9ZRlT81ZX01e5IHc7eB0AbJYnNil3avA8IxmRgHKKaq9dRGvWu0HvYIoPOg07XUT
	k2rBxKuXC1ArdGxA3Ru06BMZRJ4h7r8wGY7OX
X-Received: by 2002:a17:903:948:b0:2bc:78ec:54cf with SMTP id d9443c01a7336-2bc78ec7687mr132514405ad.9.1778558938066;
        Mon, 11 May 2026 21:08:58 -0700 (PDT)
X-Received: by 2002:a17:903:948:b0:2bc:78ec:54cf with SMTP id d9443c01a7336-2bc78ec7687mr132513755ad.9.1778558937466;
        Mon, 11 May 2026 21:08:57 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm122646725ad.28.2026.05.11.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:08:57 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 12 May 2026 09:38:07 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: Add Shikra CQM and CQS EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-shikra-dt-v1-4-716438330dd0@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778558905; l=5885;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1ljQ84A7zAj1l8wEckyCPg0Y3BG1MCDQO9YwUdHJcxM=;
 b=T+MjS3kbq+x5i3hAjxh/jxMqoeQz2ipbNRnaqfXHH5A3gzuih/ViELVdU/34Mw8dA0PyaFzE6
 7z18xCvhLJmBQUj0gxEXfjvLKNQb4kpXgMoV6kkRNOADaNBlTEeCEyO
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzNSBTYWx0ZWRfX3gQSs9wFUoo7
 9bjFt9an+jcSeBLeCHMLRm9iAIO1v3bS2UP35zWUNaeU2XPGoC+1RzDXLTIsVoKBVmv8EM0rCZ7
 qJv72iuZ1cEKXurDQrIKBZru/TlwnCczaY0scb1MpEWingsdWOPqbtRHqO5ggXKk0UfK0oBDJcC
 gp4v+9M5cJ2D6bVPSLcrEeHfbGUega+Nr+5p+O3mMEMhKm9L1nuQPMyhDU9ZGMJtiZHVIjjyhw7
 Lajcf8nB1fVM/Ro0Lwfv0/6p+Q0bl0qSC5p0XC6MnBRAoRwOWHxnfw0GoDocTBVEMfJ0yN4qesq
 f24gBn+bOSTS5Bxq7ElSSENUJQxARb1NlR1N5p3CbyaJ0ymfwEd6MeBeOW9MN/Q6qKrM0doFrcD
 QtvvsxwXAVy0Boaue5uWXJjTrq4/UbZAdz8D84ux9uQbKbpq3O5sIRioJ8rCjtxkfJd1G8uoLVY
 Fi5t3lV04ethVWNmMaA==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a02a7db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=GgAk_Xbvyzovik2Das0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: u11vkmJJBa0Qrkvf7-2FD3hZlIll72Jo
X-Proofpoint-GUID: u11vkmJJBa0Qrkvf7-2FD3hZlIll72Jo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120035

Add device trees for the Shikra EVK platform, which combines the CQM
SoM variant with a common carrier board.

Two EVK boards are introduced:
  - shikra-cqm-evk.dts: pairs with CQM SoM (retail, with modem)
  - shikra-cqs-evk.dts: pairs with CQM SoM (retail, board has no modem
    support)

Also add shikra-evk.dtsi common across both EVK boards.

Each board DTS enables USB (peripheral mode) with the appropriate PMIC
regulator supplies for the QUSB2 and QMP PHYs, and eMMC with the
correct vmmc/vqmmc supplies for the CQM SoM's PMIC.

Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |  2 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 61 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 61 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 13 ++++++
 4 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cc42829f92eb..6de783bcd133 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -328,6 +328,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
new file mode 100644
index 000000000000..12eeca84832c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-cqm-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
+	compatible = "qcom,shikra-cqm-evk", "qcom,shikra-cqm-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm4125_l20>;
+	vqmmc-supply = <&pm4125_l14>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
new file mode 100644
index 000000000000..bc93282f64cf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-cqm-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
+	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqm-som", "qcom,shikra";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm4125_l20>;
+	vqmmc-supply = <&pm4125_l14>;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
new file mode 100644
index 000000000000..fae8c75b68b3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+&qupv3_0 {
+	firmware-name = "qcom/shikra/qupv3fw.elf";
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.34.1

