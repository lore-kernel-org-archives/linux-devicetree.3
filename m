Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480F643C074
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513100; cv=none; b=sMKkUc/zN0FYk1x1KH0MbJIL4k7oF35dSO5eLvlih5T2YI4q7zsADgcHMGyrKzaouiQo4SvyJJVauFUquCJIti6YGjaJxsjduwqCxrwAJ2ntN85yP15QoBYPUb1voCfTSh09vc+R+exT9f31y/1vLrG8QnugwDUHdVWi+PrDMus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513100; c=relaxed/simple;
	bh=Z7pv66TynUL278UiGRMKLcQsp379zWdYUFvUSQbsLWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kWs5zCABMLJOpqbMaEgTqgT93s7vxqNbBZAb+2Nx54U6g/HA+a8zI6WDCs8UTR9V3f061xQu7GtGAkgtG+JV82nXXM+VS03dbvcb7Z2HnnzumvYrA+E0eWirodBsh2JPmOWxqgyExQzy9XsAsD0OuTjylNjZrJVOYSCC7YuHOp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCQ65O/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrHVRx4Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCQ65O/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrHVRx4Z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3TVa2617318
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 12:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+TV3oNj5eTKwDxA6DeWBFn1otU3ds7v9A88PCy2SAI=; b=JCQ65O/ykDaljrvi
	ozmgRilrLnOKGbEEdXXhdN0YUKLDDlQCTYsFMKas/1li1noGmGzUVppzhsTN44Qc
	A1Y2h0rte9EKNgdxodayuuWFS5k9tvtqFDLZdpx6DpRRRjA3PO4+5cn2eW4lXoLR
	pzuEE2lD5WD3YKjoUKGAD0N76dMYBNjkQ2aGMp1AdW9ODqDl2yYNPtbsuqeRlELg
	zNviEt+7qq/nSKB2ziqz8cl6xvtZzbHasr+b6h5ClA8DlbhZXhlVEdF7nYLchB9z
	lTUP+sBdpY/A3964FNo3/dsLpVm/iIJYibLk/R6tBLEyOhhTwXufcwE6Q6tPXRcj
	1Qt9dw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw9ep7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 12:18:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso1256454b3a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513098; x=1784117898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+TV3oNj5eTKwDxA6DeWBFn1otU3ds7v9A88PCy2SAI=;
        b=TrHVRx4ZINuidIwcO85xdSDf/ugIY7C8uPgGqI4+7e2uQI+MEJDHGceDHbz9tbb9N8
         AsG+WASwP4AXhR0l32js4y0r/YR1hwbFKpPk3eYvBMXmKfSMvpTIIy/BS4qtMR1NEvoO
         739gSFKbH+EG+84qqQkcLqQ90n/Thv92oKouzBttz39BPy7tKNu2ktWTKbtiaD4yXcdm
         eLRIXomNV/RDI0Hr4XLjn6NvxEiO68E/gO+Zntz8r3IZ285YcMTS7Y/P0eQfG4IWe0BH
         D2opcuYss2qplDlOawtJagf9PHVWptxz8sVQRgihNXrhnbX8uoXH/sobY62Ogi35m6og
         gluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513098; x=1784117898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+TV3oNj5eTKwDxA6DeWBFn1otU3ds7v9A88PCy2SAI=;
        b=USUdLriWJidXuN4Ln7jh8JhSw6GHTLye6ldsWIIITQVZ7FjHC2xSYIs4L/yhX96SWn
         gvvlVrPl0SAfLIF8+5epC4aDfsBuzo3dk8kC7SM6OG38NRq/Evss3om5bTVenRpe06Jr
         U0Vlz5Q0BIxE4EGlqe0NvE2mTOhfav2rnLjMRkAFfceF23I+ScKXPCJOsjT0ljM4C4MU
         oMPjGGt3dZEo3l9JsyW5RdcsbK3QCsa3mjCyuk/lNK9yOV2aiVt7YGk8jdK4mX+7+9XA
         oC52r+3bsJDwvD6fJYa6u5FY7Lq1zA4BWAvpW7lQ+CwFqDjx45xiYKEJQhAF9sNeajbm
         O+Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rqw3HSA9+8+ykiG5JWwPy5nerl6QE+bqM93VBT5GbER1KUZgqGL8bypM35/VLZfcYTVYWw9iCzmsJ7t@vger.kernel.org
X-Gm-Message-State: AOJu0YyiwLFMxd7a761Xxy58xvo1WhFgV/2mqK9MWxij3DKyQbzT649V
	734BY+j7+TxXwA8EUuhoEVb/TI7W4IDeKC/v6zmCntnd+5Qq5aB4f+oOXE2qvmNV5JPDKTYSna5
	qXJ5MhrgdMsUSjUfLmDs6JgWzF3l9srWAbYq8EBvssut/6dPljBkRQfd9x3ivffD3
X-Gm-Gg: AfdE7cnnQZhM+wC6hQY2RDqwmAW99rgtvl4G1Gq8QAQPfDF2/yux04DfP/gwraxwR2M
	5tuVAMc/DwpfBvNljdYO0xlYyOQ9CSkxnHoaYTLjTngvYnxybmBeV+VxuP0Yst0rrCdxpKXPIjX
	OHya5ZsTZO4qIL2ko1Lv8JbtHE5zvZxKD3rNdU5U8PKTJ1x0Dw8q65jLeLvxKB9lRb4+6Q0Q+py
	kaIGYrSwENWsueIUJmQffUBKepyG74C+Ax8P6RNUC3OG/e5G1RDC+SAfzTnUO2Ebv5VPl/1tDMB
	WXIV9sbruZU5LULFdzbqwv0cOOOff7uK8Eumlu8+G0llh6GeykKskXWtoH8mn4M5bBf4ypRcgSB
	GACB58xlv1W6ViuBhoTKbnlr/gA==
X-Received: by 2002:a05:6a00:1481:b0:847:7f38:27c2 with SMTP id d2e1a72fcca58-8484367f26amr2330606b3a.50.1783513097844;
        Wed, 08 Jul 2026 05:18:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1481:b0:847:7f38:27c2 with SMTP id d2e1a72fcca58-8484367f26amr2330558b3a.50.1783513097131;
        Wed, 08 Jul 2026 05:18:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848337d12ccsm2367474b3a.48.2026.07.08.05.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:18:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 17:47:34 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: Add Shikra EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-dt-v7-5-977b65a300c1@oss.qualcomm.com>
References: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783513058; l=6252;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Z7pv66TynUL278UiGRMKLcQsp379zWdYUFvUSQbsLWg=;
 b=JU92cpVZ6xRIwE0qviz4k7z4z7YsqXvWK6ZrwOf5356xNgiR086TwWhReZVloIg8mAHC2Xxt4
 iIvR0yvVdymB+aV1/bmJE3DrMwTcY9x6WQ67yAM5zaMYuGXqNDIt2Bq
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX7Gt+be9VCM0y
 JBChDnDUmGCvY2iBIhjoYXvdm5W1YoBNpB92yh81E+5AGvvFcU6n+I6yPF1/SlvhJW9mY6u+W3b
 2Ho2+WvJfkh9SpS4ShNeQJo/wZHfT+rR30TI6NGlfIH1O/b4JO5A0ig375Trn6TmYNegBRFisXO
 SHR2kfiwLYYgqHa9yumPF2FFJt6IECJHDJtpZLVtSVj2mBCcT9IBx/sygD9EjbtKg2QsurD6vYp
 5kBNr60qgvmvc2skxnH67X9GWsnNWj5SOh9TQA/an4IiPqF4wDmjm8v3v2HlhG/e2ddcJHJxsNj
 mn1eQym/dI+4zMjJV3O7cE6tcTXdiOkelR784SZ9hxS7pnRyDMMuhi6/0QaxA3JClE2v5SvIKze
 1bOVftpqN2/znuouaZgCa96dlV1YpZywo8lVvNl27b7yfyH+hpt5xu+nOLj/IIvrk08s/sGDekf
 PoU05j4j3MvU5x5fHMQ==
X-Proofpoint-GUID: rwn5r6tpoSNVcLKkCKzPifo2HGum6kaS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfXwzd1cIHCZYUL
 kQl3Rqb5m5cBsyvPmi+IvAA+xhBt9zERYXnrJzz/BmXC/e9gCqoBJ7J5FJIhMr21ly1+kqHyxs0
 tA9cGXyTFasaFulW9Jk/JxYr9iGJ/bo=
X-Proofpoint-ORIG-GUID: rwn5r6tpoSNVcLKkCKzPifo2HGum6kaS
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e400a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TizygBHPM-tQ0bhc_XQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080120

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
index 5a1c56cf98f6..7f00a60d3e48 100644
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

