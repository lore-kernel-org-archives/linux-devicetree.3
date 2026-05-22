Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C182366DCF
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472994; cv=none; b=o0Mdc/LUAydCfSkXrX0v04JB2LNiyCDeUj7iqidFiwBD4/YaXnQ6asS8wcTJp+RN8+Szdy5lJJu9u6blnBLGAgMkrsD2nRS5PHnKo/06pPSZ5WgRl8YiiUGpn6jLItDMFdL2rSYaWES6mKdxmcBD74rYViuuPx2tKqmzylHR/2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472994; c=relaxed/simple;
	bh=PKxMIccKL5eOiE/ruMWQn2ee4hu9/pEmn9dglntmZTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYTvxwjMnv8vLPuy6isI3k/jqH6eih87WXMWVa3vg3XgED8MLkzeT8z26HfwuStsfM6PeTHxyUK0Rzo4WvIQrl02Iz3o/q2HKGaxOfwJZIY+a0drJjGz8xXukcmQ64CvQwdz9r50CpXwpfmDrQT53/OPLOmzG0y5ropojV7hOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbcQLJCS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlSpEUce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbcQLJCS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlSpEUce"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGasfn1733196
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ru4fi2wAmy8Cr0jc1TBocdiFWPiW/okyLoP0Q2YQUjo=; b=ZbcQLJCSRcDvBGDF
	JhmRzuQFcsBOOQy1WljJafx53vnFl8JljSKbNKNkz83A/vpz66ZQxBX4qXrDkWyw
	Rs5DrBZmEwJnrlyKM7+TQikeXCdxdCpMrfjmgDQNw8OfcNF6aQ03wITuPQujJZql
	MaOvozG4PR7Jut6OfvIUIIqbqTlIw1hRd0R2yBQPah0kUoRj4vgULW5sSgfoWU50
	xFVtVowIMh+E9T+xQwmTUwH6Hv1mFIrcb+wegnzHIwZer3rjRoca9P4JjC4r072C
	W7Rg34lWC+ZVzsLJvNatP2dt9zGJseWk5/TyidELctfwNmQ7Bif7YPw3KnuwdUBJ
	NhrCfw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eattq8bdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:03:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso85205175ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779472986; x=1780077786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ru4fi2wAmy8Cr0jc1TBocdiFWPiW/okyLoP0Q2YQUjo=;
        b=DlSpEUceUQ7ZI6oKgYnVk+u+imMhGViaRnksm01FTo0z/TLIq73BryaS6PpDzxsxIC
         p9lDPSzW2tbi7GVMzkeXo66LqQZkmbLl6KiobcbVNafJJofaBBq/veLabThUT5x+dsU6
         m+oxiDQNoLP4VzNQCfK+JxBo1757PpIgQH+qW9c82Z4EjZaXLaffoTeEcYpkaqBEpTrp
         MKoaa2f7QOxg5Mdmuvnl6vqb5ZiXXG1zmf4QIVzZhPCdCfouF1XQ0dLHB0XSnt9raNqv
         PmRkkyBoCECsMkYCbe126mdf9fvDdWOzKV0hFgB8cbZsyf6Edj7g6dDX+B+v2eoMd/GL
         +XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472986; x=1780077786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ru4fi2wAmy8Cr0jc1TBocdiFWPiW/okyLoP0Q2YQUjo=;
        b=tIaQI5caPYB+Ya4M5RwsbuyQ1mhmvJ9OLXsUawE+K230Q3f6/uOY2it9kB1/2H8C9Q
         MySVDQ7pnUeQ92A5Kl3MRQiEMjuLS+u7dkZfOneTMQClEpsGCSUvJVpvygGK96rgNf9z
         UdA9FdqJPh3EEK53CzkEtwGecZN386+6TQMvajrZAuPHvIyVH7WV8noXBgIW7AYe6nEK
         vfqmAZ7rdIZfFhIZU9nscU0GwtrgxJq6OiHMG6aL7Yzq2LMKXKbDzHB3Re8b+tbobLZ8
         NUlTp84cuHcQXIvqTHP3v50XCmqZewDg3ykgOkBtsk2dW06pqaICngGO2u73X8gPQ7i6
         hRvA==
X-Forwarded-Encrypted: i=1; AFNElJ+guwf0Qpm5w7UmBE5l962YfsgatN2DcA/vYep109lYo5crztGA/dzshNbjLMhH2EoG2S3FQLuVL5QQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTPksD40GoeVR38AtWZ04WhuiIVWbEfBSzc124NUadPE3I74+
	iX7j1Mtxabgov9zGsJ6D+QyD3dOoP+FCyuaYQLsjTpCPoo1V5agPaOBe6mNDKPWsxYUeQUWoVSW
	Wi4jAWpfo6vWRF9X5lgO/UToeGRHsvoOO10n0/WQo1iU7tjItRvjNmJWexLLsvwKg
X-Gm-Gg: Acq92OEAr2fZrb8YobekQuvz2SqfP6LJSl+P2pBR5LA8Vx7hdwY3EkJrCtgj0lz9XGI
	CqF694pZ7lY2Pam12doLUazCWV3rHuWMvZg1Kk17XJ9g8wSYh8rSvNtKDE/ksiYr/8fe9YBU5Ro
	aiqsEJhw8oAJBL1kMd/nEsP9oVwNGp3w021iOJnnM5aQxBK7D+PG6P8/BKBWKPTjIoKfowvKwhK
	C9KB8uHyHYJERh/Om4ymLeu4T33vOXWNCfba8UkePm5xyxNJO/Vgc+15lFr9V4nA2Bf7GMwclB/
	t2gWjxKJZkpQxuuvWsbkRDi2VFL8sIXikLnM+b8e18Ap4DF6MzRZaolXQGxJqM2KpvNOthG3751
	luLHkCqGFaerc8LjyneJViK0gxZQ5d4qHG+zG
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr48802985ad.11.1779472986334;
        Fri, 22 May 2026 11:03:06 -0700 (PDT)
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr48802245ad.11.1779472985718;
        Fri, 22 May 2026 11:03:05 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm21193645ad.74.2026.05.22.11.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:03:05 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 22 May 2026 23:32:28 +0530
Subject: [PATCH v3 5/5] arm64: dts: qcom: Add Shikra EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-shikra-dt-v3-5-80ffde8a3dc4@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779472947; l=6187;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=PKxMIccKL5eOiE/ruMWQn2ee4hu9/pEmn9dglntmZTo=;
 b=eeP1CuXgJm4EnxS5uEZe8Tiz6ULuop627FHXTkgKyi/znA3m/T1A5GqXkJUMu/nArB/fxR6F+
 0L1ipdLcM4lAHrCln+lQrSyh1atuEEc+VKjoOmsmWkdccqHdgVA7BG8
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE4MCBTYWx0ZWRfX6ByUOJLNVBt8
 qg0tLXrrJpq1o3JHyWRu3wtJ9sWLAOUytqwSqOULPKyslitXWyZJUnoOxUzRRp6McrR0NdThcrH
 UG5NAxgzpcO/0w5Ap4ftwfCIHv1sbdxmSbClbbTmP7hcpHlMI+XyXP7NojzZPuv2fbiTUbtJojK
 X2JvvRvxyn+eweoQrsoXJZwqtwpKUpZay2FiSvzoqEQpBzeO978dYwAE1NodrFarmppBi+vZrlJ
 yFTkI0sVBm0V2gJFXb6z7HuHrZH4BDCBrBgNdclclt0Y2AQL5pfCKtbTNDuQoRcIQkcmSVsd94v
 EWBJhZDzXQsD4bwfNGbWkNPpDYdTCL/u4f5rzf44P6bT47pqJyYjkknPPyeFsgCbxnCeiaaW0wW
 HtenwIJ3JslUXXJf3s6zsW8j6z/nHyXzhOWAlAXftBsTxzACrYxrrfo3GErZ7Jrboox+9oVu0PR
 OKUhP9jc14LtYFX8+vw==
X-Proofpoint-GUID: 8SJYE80sykTBHhZUgJ6Tne8VDaOBm44S
X-Proofpoint-ORIG-GUID: 8SJYE80sykTBHhZUgJ6Tne8VDaOBm44S
X-Authority-Analysis: v=2.4 cv=S/zpBosP c=1 sm=1 tr=0 ts=6a109a5b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=vDQBCZ3ZoHl_64TEIpcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220180

Add device trees for the Shikra EVK platform, which combines each
of Shikra SoM variant with a common carrier board.

Three EVK boards are introduced:
  - shikra-cqm-evk.dts: pairs with CQ2390M SoM (retail, with modem)
  - shikra-cqs-evk.dts: pairs with CQ2390S SoM (retail, without modem)
  - shikra-iqs-evk.dts: pairs with IQ2390S SoM (industrial, without modem)

Also add shikra-evk.dtsi, it represents the common carrier-board and
daughter-card configuration shared across all Shikra EVK variants.

Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
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
 arch/arm64/boot/dts/qcom/Makefile           |  3 +++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 40 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 40 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 14 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 40 +++++++++++++++++++++++++++++
 5 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 795cee4757ab..3801f280c8cc 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -333,6 +333,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
new file mode 100644
index 000000000000..0a52ab9b7a4c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -0,0 +1,40 @@
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
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
new file mode 100644
index 000000000000..b3f19a64d7ae
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -0,0 +1,40 @@
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
+	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqs-som", "qcom,shikra";
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
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
new file mode 100644
index 000000000000..8b03d4eafa6d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -0,0 +1,14 @@
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
+
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
new file mode 100644
index 000000000000..3003a47bd759
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "shikra-iqs-som.dtsi"
+#include "shikra-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
+	compatible = "qcom,shikra-iqs-evk", "qcom,shikra-iqs-som", "qcom,shikra";
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
+	vmmc-supply = <&pm8150_l17>;
+	vqmmc-supply = <&pm8150_s4>;
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

-- 
2.34.1

