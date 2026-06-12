Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BEE407583
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285302; cv=none; b=I7lug9j0OtySQ6WkLbG5GOR6CkugrXx58FZAwxQogF87fuE85RTHDjM+jNzv1sOwXjv0b4UCk6C4mwFUSRStB5ou5B91zvEIYgPtdnB106wvQDeKNJ9e1adOeFIlcIXAxMgeK+cE4Vq1DUYpO5x7wRGqahDfoECOvDyderH4zsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285302; c=relaxed/simple;
	bh=ZxjX8+A6FBTaecjdAORo5qujDJsZbUaBlBdXJEaxCxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q39m5kEqLnqZqC0u0s6AXldfTq6qjlllAM8qKcFcw/qXH+4/v3EMnEDStxh1TNtPEmuMjYDBQyHydw9f7PkF0aWkDWuc1yfDwWl1D+ISpNTQrTO1A7m4pkV8UqiQUznp86aXsYnIqAa0BcN+YoIrOfmF98tq32NwbVetkqQf6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8NlxKf1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7ljDN9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8NlxKf1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7ljDN9R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGSlCc007463
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Rwc4/nWVfH6Sf7XgvmXET5o5hcWse/f6GCS8/S4cFE=; b=k8NlxKf14qGhJA0k
	ACJXo4Jp1bphxXS4qh8cmES1Kxnga2rpu4qAAVEGox1ME7K7DvCtJ5kfYpYUdS3G
	ONPX3RqIozIPlAC3W3slLf2YVvogzuLeVkZqmBtszksbW0+tQHPc0PwKTWNrJbYN
	Xvg281U4FzWrbd87HLvQ1dq3BVy3y8hoCCBECM6G6oC62ldZqMMaQcCskRYl5kBU
	zSz5FSG9wcnHzdFBRtfk7lduvEmjy0uDtEXDMc8BLLLI17hID/cA+xlppRs0o3sp
	jDvrRYsX2i50Zlc1VyLVkNXBE3c9YpOZ2l6ORyEsjPjWpmechMesqdL6R/If3C+W
	xBCGQA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd4ggr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:28:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf55c3f44aso18317375ad.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781285299; x=1781890099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Rwc4/nWVfH6Sf7XgvmXET5o5hcWse/f6GCS8/S4cFE=;
        b=g7ljDN9RIwFiZeRY/pkOwocm1PWjXRcxWHK7BhgsJr56AZtB9G/hiq0uKXDwtnrYZD
         XynljCx0j3QSAwBZ9fBYY62dgy+z8kNgCXSryP74qD59Z9/sjHuXTXrj1JAlmhLlYb2X
         Pz3++857IU4DPP5y+LPMA8y6ubtSi/YV5UzEhzgfSs/Uw10QKPlbpiFZGJC5SgNtUeTZ
         1dzOC/ZjgY5nL76tGbhldobWiUW7qNILPHvKlfABgd0Vpo1J/4dz/aVeY0iGLeqC4o/V
         /uTIXS9+zAeWL2N7GZrYPzbx5m4l3anR63QR1Rs9NB5p4cjaaoTRfwnKNYpGsbhe0CWA
         euAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285299; x=1781890099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Rwc4/nWVfH6Sf7XgvmXET5o5hcWse/f6GCS8/S4cFE=;
        b=pK/6BFmDJ78AUL2RtKCv7nVQmzMtEbLlOYkDm5HZHkAZHrgsI+ebpykm7rpUu1NscX
         b9yenvHGmZ6IgEK55sB7RFvXfRKlfbXO0+obcfmuKOrEq6mPdm37CLLD9/JV7pzXKpBT
         cWslPhcFEBHb6TJiYIedrcTRkgMgtrX2QWaNZrlspsCk4eEbJgGVhdL2a7K1ixUAU1g1
         AERRk9SR2V2Ne6dO3MGawECWe9TtW9DJ1NsvCVuIU+g+C5y8Rnd0PU2JrIP+mI3mcxxU
         TnRa5FfXL9uhhhmgJK1h/lrpgDCRbWXhBMJreU5W399s+WXflcfAtsNwrPQCRXHi789h
         Gt8A==
X-Forwarded-Encrypted: i=1; AFNElJ9AvcPezFW7jiOGLU0EZt1DloZpCdlFCGP3YAw/Rc19YR2Ip2kofPR1Or/BN6ymsjESXhIkrairfOpl@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6SkMc+hhGsO9DkQ9sTIdiXJWRD/ZPgCchYY3Jf0xjZhJEemv
	QL7zJgh28MtVnrwGJKXENDWbDI4BidbMKRiUuLGA9M4Cm9BvaT6rakZy9CMvObBXY/x9tQaZ9h1
	cBX9Up9J/2sm/xSs6gtpXI0KFYmtlEfQXhUGo6h/j6HKfWx/9Q0k6xyi3+pLAEnvuyTopUR4S
X-Gm-Gg: Acq92OGB6y3sOMdlWHCIRUetc5pd9eaaArlh9Ej7AJlqdtI12Vlh8lrxT08jdBanxOP
	ttsLhV6jYmZu03UF1g5TCynEUTnggmFXPEaOBkJaaTkKr8SQeywwCiARHBdv059jDs6+5vQ8odt
	rwG5zJSJBQV0eARGuCBWLDTHtYfuNYd0LuS9+m9IBQVvenBu3fFvcOvezx1TC8CByFcT2grcKPg
	8IJtXVU5ZSjy6UA9TrZRN5TM46YKQanb0QSI+gyRbcM3pd+CtGlN26edCLrSbpEhKpdhCBp3ckG
	A/K6f0E+zz3Z5ugrg98tGgO8dbMoT9Hb0v910GOFkgS+SMdUuRHOu2d2Y9pXX5AgtRsldHMsjr2
	1EM2+/G8q0TdMUbBRC1PbhEGXo1Xkz7Gjbjp1
X-Received: by 2002:a17:903:35c6:b0:2c0:dc5c:9069 with SMTP id d9443c01a7336-2c42c819001mr31320885ad.2.1781285299469;
        Fri, 12 Jun 2026 10:28:19 -0700 (PDT)
X-Received: by 2002:a17:903:35c6:b0:2c0:dc5c:9069 with SMTP id d9443c01a7336-2c42c819001mr31320555ad.2.1781285298962;
        Fri, 12 Jun 2026 10:28:18 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acae2sm24278105ad.52.2026.06.12.10.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:28:18 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:57:41 +0530
Subject: [PATCH v6 5/5] arm64: dts: qcom: Add Shikra EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra-dt-v6-5-6b6cb58db477@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781285260; l=6252;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ZxjX8+A6FBTaecjdAORo5qujDJsZbUaBlBdXJEaxCxI=;
 b=anTp+vp4IFQ5pH4NQnP/wAmz4oAHkVndw+PAugN0uQaTcX6jX1FhA0Irv/+NIIlxC22ofy/eg
 119NWLbCIRrA3lss9uDqLB9mw4jmeVJwe5uNS6LyHsG198viRsVgm6D
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: p6KMIT3pEQUpCYdSdFLJLYKtYOS_Vkuv
X-Proofpoint-GUID: p6KMIT3pEQUpCYdSdFLJLYKtYOS_Vkuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MyBTYWx0ZWRfXwtBbzgvJZSfu
 zcQj+cjbpF7XrXHwcDC7HIphJxH2htdyFITqs/H2xHxRIL0AP7lDp8ed0/8j6A/B9PdGO4yxcXS
 U/efnNumTfSzczrO5MN/7KKgpTKNDqLMJQIm0s/9sxXvG7VJLmM8lkNxaQtf1rOd7HoJW+6zjBB
 va9OhJgcIQut+JK2kdEi8gXfmDZjDyiXzPlFW+A24WGpfW4+uDvrTxubAYSAwxsIUQ6j9d71vQf
 sG6I2qQUwlHLnvliEnjL7oG4SBeRHG7OAgQBbj2LYrmhugW9xFrV7vTEWGD4CQQWbfke6QHqZfU
 Vnqq8oTiG3Z0+QSVDiFxCWdaZJOHtY/rOP23aqgXCfRAXRitfgikPJ05p0+E/DXwhIxdxTiAdmU
 NDUiNpT44pAG971kHK7vmP5mtYWQA8fhP15SyyzedMNX0Eprn3I0YEqusl/nQXNE9KglEcOlKUk
 ttJk30kaAxttZUFsCVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MyBTYWx0ZWRfX7tfN1rSqXsvE
 sKn7a1YvlFAOmm0IVqhA4bPxka7z/OZ71Kuknn1d8ItthGKWWOdyr1XX2HeW1WCzqptNEQ3e3MJ
 To5Papygk8xzLkDHobM9FOmx+cFRM0w=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2c41b4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TizygBHPM-tQ0bhc_XQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120163

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |  3 +++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 40 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 40 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 40 +++++++++++++++++++++++++++++
 5 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..a9e9d829fb96 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -334,6 +334,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
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
index 000000000000..d0c48bad704c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+&qupv3_0 {
+	firmware-name = "qcom/shikra/qupv3fw.elf";
+
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

