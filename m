Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699684963B0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189749; cv=none; b=OOWh1s2dp62av/WhTgEpQJK+CiAqH/5uEOovyP1b9F1gwYPWbNK0iXOfOQWtOtQoaGsSFOMW03KRYsbU1c3jPxUpTyj+SBbU2UqZo+QFbO9VN1zO0H+SlIo9d5/bAX4zxXqyyEzjYXPhbxBcNoOpAVjiBCzNNYbhq13Nz55rJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189749; c=relaxed/simple;
	bh=ap6K6k+El5tekEdZ0WngKg85WSbPGb7xvWPETREbYMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQJI2SfpCDJ5hAi2mY+XSjZdN7MEb5KkCSXZ8dBdNTa7+W+D3K2Hc/uOy+URpgsVT+HBx+P9CcOK+SJgR5Y8sQAxrBhqUJnjb/DLF88BK/FrmYVAUme5PputWxp4/aHWYSKu/hO16+BL/sg1+/1GWPzIA6NrxsrpgSQR/0K1YXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdIQ7J+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDJKPoKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdIQ7J+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDJKPoKL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JB97db867050
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8zXM5n/Ky38SDCu1iW/JnWkDQ8dWlEoAId9HPk/6+M=; b=kdIQ7J+sPKSis0eu
	qtB+1DlhpbeYGGCnDOzniDK2f1sV0dK8E5OkpIsrrlKudmZ1rKhgE79w/Exe4pEa
	wLP68Ey945CQ9egxVoiBkWU+Z2Qy0BVpOFJzB0NUS21tnR4s6enWAfjIxiyIj9hQ
	GutFwXhYPJsf0ZejqqQwRe2DyATO3vsjBcrwgNFOnI3ggqF6dDKaafjXcnB9A45x
	cEbEbQj6dhE7+OI4TQLD2koHqljU78bxJrA2dt/CChlwPj7J3nF5oxxFtx9SoXjm
	8doSiGksLkOkUouHXecniGvOQBt1D04jQJxjjY1Io9xkQfOstfFMDx5cXkRpmQtl
	OQ60RA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1hf0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:22:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9fe2d6793so85626515ad.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189746; x=1779794546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8zXM5n/Ky38SDCu1iW/JnWkDQ8dWlEoAId9HPk/6+M=;
        b=BDJKPoKLaoOgR1Ej9iYFqDj5qdeNEzg8c5FiGghch0wy6Fsr8ITXFdL1HOCb6qOg96
         3vQgVnvkLjaWSD1cWkYumTAQqXsBK9qv4B1GTjYlSh7NpQGeW814ZgYhdyxVM0AgKJcl
         P6Fj9PEBYvCoAqjv/4+dcg1HIKa6Kt8LxoVKAzUPY0hYgCElru8FoR5E8DNL2NG5R8NR
         ILE1lQ5nXt9d2MuBCNxJ4foacFtOhc3467GJHzO6EWwt+uARbds9rbNws9AR/Fq9KJqE
         EmuJV126NTFGf7Gnb4mDEycFW3O/o5WgWh9I7xmcTwxPwa8XiCVlX1fpXoWHsS91DB3P
         +L1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189746; x=1779794546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F8zXM5n/Ky38SDCu1iW/JnWkDQ8dWlEoAId9HPk/6+M=;
        b=kpyfBV2avOsIg5Aa3+zmAnWMuIKJZ+9QSQX//GPmY/FAzSexO59YZw+nqb48ofVOGU
         jDMfpHGPH6c+gjJmCex6cUVK98adjPci+ul5zMuPDgsyw8lKG38BUdHY8dbmc3TuNPhe
         rOKBgasA7vur18nMN5tAmr8GqlSau/23f3AqMu8bM0QGdcO+r7cqLa2JT87tclc+tDMN
         akBEuAyfOUhzDTYXp5Z6jDucOpl/tH2uMgrk6HXEGXuh17pbxAPCQuAAu/m9giTCGc4/
         wVX+TRY+Rxbt9ihY0wI+MHjpBiTeSaaDE6N4gYBgUCrxxqMLwBV+/zg30v3/5KEKr1By
         5Vpg==
X-Forwarded-Encrypted: i=1; AFNElJ+G7NP8ejJ69/50eP3/zCeLq3vVdYsB9t7WIeLGWCBpkuewRCEWV0LVwj8aec2+ogCaRAVvCiK79Pco@vger.kernel.org
X-Gm-Message-State: AOJu0YzZkhERaQYSR9pSTb4lpiJxX41vpQAG9cicZdUaJy6+bc9l17De
	myMfW7cAuYeb0bZU8pEgg8NQ7Bznli5I7AekdkIIK0AMKjOnoD4CXk6nqWm6/kdGFVSDCX2uNy6
	5bMGBcbLMJuytXnks4fHjzgQ/O4SOL9mC84NypuVbe0PjbfJ80w9LPmuInEazfMec
X-Gm-Gg: Acq92OGyFYuCbXxwV8Lo/C++tEHbLbzIMU5l/v29V+ahsU1h02PJPJ/jCDPW30ZR8Lu
	yGFG9qaZmyMhD3BwoTtc2kCBlLFHNQ8LsTPvaREoEEAaLwvN79OKrAdlxI5ul8zaGdcQqt+rfXk
	6kbVw4pXdkUfLdKCbAnJN6Aio6ItKCy/MRpHxnSGhpgSbiUo8btUJu68Qx3RVFprg4dTDiOI3R4
	MfdO05QkSfl5efyGLg67SmlTTHHPvEaJGLtb9qxPrIz29OjahYsGiwWwpnNEDkBeWNwoQ0P2XJT
	qZKoS65EMH4RiTRG1dkEnktwc6ZbfhhtSWyFtg1VbSpk+yU/Mro7tah+1H2taimxf0On19ex/AR
	KD1Y6y/vpv7MoxoXk5nVtwtNHeKARfmRMJs+B
X-Received: by 2002:a17:903:15c7:b0:2bd:e5d4:dc63 with SMTP id d9443c01a7336-2bde5d4dddfmr93412465ad.26.1779189743643;
        Tue, 19 May 2026 04:22:23 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bd:e5d4:dc63 with SMTP id d9443c01a7336-2bde5d4dddfmr93411975ad.26.1779189743113;
        Tue, 19 May 2026 04:22:23 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm192743605ad.43.2026.05.19.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:22:22 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:51:25 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: Add Shikra EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-dt-v2-5-c01b90fb4395@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779189702; l=7354;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ap6K6k+El5tekEdZ0WngKg85WSbPGb7xvWPETREbYMs=;
 b=BL5R2cYROSTNoSWRlEWSIDuNeVH8iehb72h9ietIocAXf1LTsj8Hu7tk5/FTrSlUS08YYCdjM
 5ajch33RejfA7R+UnSKgjCJPqWyaQXgDoQUXnym5ehqjR1nrRTi2wYc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX5i/KMsSXtAni
 OlPePjB62LiWO3Hc6U2tMFcYAVnKkw5rkQb7oiqzWdAefPZnR13T5fvHoEggaYHMZMgq3nrIHom
 pn/BZXxqyBuMhRMp2aQybMX004A2ih7RENjA5iBJ+V3X8MQYdaGP4e/kWjx6AB4g6QxAm68JT9L
 XWwMEGegXsntSqhmmpAvbFbKb1kktTzUv7trL3Wx1NB+9aTK3juj6u6m3mWXXSSvq7DUWQLEXtA
 b5kf+63i1YzSq4Y5RcMte2QLnFs4CXRa+prwBMAtnFTrG3Yj+LI2Oed14I90FcCPAaHiAxAzZb/
 KLWYKum1QBB3JiqLY9UqyaYF6ihmzVUDOCevJ79uKtBXbtj75HXeAxX7DJtNMRSPZspkDA0QvWR
 SFTuBqVrLMTOkvGxLIOQLXMDILgbKp+jzTtEE+H4wdfctbKMgf4LKSQpBgCOaE3F5TJScXWgpFc
 Psmn1VD2hqshexmmN2g==
X-Proofpoint-GUID: p9SsdHKNDXWhuhJjTskR9wlSy8MNIF3l
X-Proofpoint-ORIG-GUID: p9SsdHKNDXWhuhJjTskR9wlSy8MNIF3l
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c47f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=UVWtEavHwLwq9t59c2IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190112

Add device trees for the Shikra EVK platform, which combines each
of Shikra SoM variant with a common carrier board.

Three EVK boards are introduced:
  - shikra-cqm-evk.dts: pairs with CQ2390M SoM (retail, with modem)
  - shikra-cqs-evk.dts: pairs with CQ2390S SoM (retail, no modem support)
  - shikra-iqs-evk.dts: pairs with IQ2390S SoM (industrial, without modem)

Also add shikra-evk.dtsi, it represents the common carrier-board and
daughter-card configuration shared across all Shikra EVK variants.

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
 arch/arm64/boot/dts/qcom/Makefile           |  3 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 61 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 61 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 14 +++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 61 +++++++++++++++++++++++++++++
 5 files changed, 200 insertions(+)

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
index 000000000000..ee460d8c6a87
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
index 000000000000..096283ed9b1a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -0,0 +1,61 @@
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
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};

-- 
2.34.1

