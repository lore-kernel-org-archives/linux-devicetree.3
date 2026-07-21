Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC066432E75
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617694; cv=none; b=KXsk7VHatMRlne32ZKJY7KZD0zASDaPb4ZGtN7ehfG9UBBiMUDwNpx07O98nRNkZNo4pkq/pEVDBaITXwYv9ezn15wHNpiVg88srwMgAy5H2aOU6trxJmdj7IDt4vtOIpG5PfcZlKOBkuheEduVazBBqPRfFnjvveph7L7hhn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617694; c=relaxed/simple;
	bh=3nrWBSM1RWi5sdMS61Shiz6pSfS+N67vnuNk83VQFGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaukyyBlFYf6cg54iEEHcUzL7E4xNBMR55nZtkzbTW2+b1kM8AehIELvBBak5meiiN/bB5lkleaBFLjtrMUHWys6gzIAz6FldZN9Ib50zJh+aFV7IvMIHqbO8NdwhDa2ebjcis/xT36OL/sV41HhybMeKKs2Xj3RN50/+lrRwZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SC7DWNUU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvyDj5h7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SC7DWNUU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvyDj5h7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6M1Ro4107152
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1vxF0sHezxDAONQZ2Jehk5RyVt3fpr9IgxXJ0OroUc=; b=SC7DWNUUVYyt+iA/
	63VyaBGJurr7Wq8x9vf2HScBCr+PFRLKl73gNSMLrTxwEGfRdJ4KWIgyrTtqehMN
	RqOasg8fULh8Kn9D1+pmxcWoUCEmz1XkDgiwUjLDZqtLHgvCRYXq79FEfiUP0LVV
	Bw1VHB9/2uECc7eGxGnY67mQ/54R7vvEdnkkO7rZjWptkpdT7j8oYHNUb5Y6NwAH
	RN82YqVN/HhQ5HnYiNjxwKP1AtQCyO7OfJqoe8B2AsAd163pqgmmdFL3t0JBartT
	eM/n9eTQLB4jqTPPtWKLC8KZy3yggDJUMbhObZUtkpd5MQ7YzbnmihqoBrPm2ZqN
	G23Qog==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9nrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:08:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486ffba174so18140602b3a.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784617689; x=1785222489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1vxF0sHezxDAONQZ2Jehk5RyVt3fpr9IgxXJ0OroUc=;
        b=cvyDj5h7Ox6JzKJlYEG2ooj71oM4IIGTGVkZdUaabPmmagDa3bL0ZSoBDeGwKuc3tA
         mHDzsHbow0LvtkjBC/ZDq7gcco2TtfQhLjTj8cpieC9QtbfH7jPXHWP0Kv4bNFwLeNn5
         uJFrJ0/YU+hUrE5/20YcfAguMRmCuezTBtFm97zK7lVWIqjJxbzGrU+VgA/u6IOfOYxp
         PQhJO1KokUvXfJxxZ5bKyDwniLUNjkmXu6iVb4Ee2n2x19dAvEnF/kfaJV8GA6DKID3i
         ckDxFaspzOFodJMsMiR4Z41Bu7+8ZXtrPBwJa5hyuCzL7ecNULcUIB2nBG85mnZ1Ck7y
         FPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784617689; x=1785222489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1vxF0sHezxDAONQZ2Jehk5RyVt3fpr9IgxXJ0OroUc=;
        b=UX1QbNnWo240HW7v7jknOzSMwDGsSDEanCMjGFPVAcwusUb2vcPQcR5eFQKpoRbAYu
         mfWmimOzQqhM9Jo15gr8+YhNqfzYNDSqS7g/HArBs8GpUjwPS26DGnPdG/Dsp1VIrxhF
         IhiI8lxSOx9Xagit5lJG3IjtN6Csf9exd2XO5v27aYR9eyJuHEJ6pIAEPsLb0dQUR7Od
         tRb1Efd+MqblCVUmuBFu0eYE+9m9rhSZ/vS6sgVjMun5H5sJAqNExUHUATe5JDHhSEIG
         OMQVh09W8F8JCSjJl2bTgO8FqCEJ0s3bo8m+SSTrucFWBjkN/SOY1OYM1oFiuKiPKfWh
         loRg==
X-Forwarded-Encrypted: i=1; AHgh+RrYIXhwVVKCgMfIMPABVV6J57u9Ai/RwI0fszpnc2sHsXNmknBgZYbFwa95pryZTkNnx1MiKZXebugy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrbs8dY2f4Me0fwRLrt7YZWPcDb+uI6WtMDKaPeQbDpfNaaGy5
	GravgErCVXaXlHUKIBUl/c7bvV9OqiDF3szaDn9sbXnCT2l38x6Jhnc3rzin6gjLxojX54Fmrz7
	rQUXv3rT1pB9XW8uzadJdZAb9zMprYuu99waQbj2NZlMHSWD1gQm/UXcoDcHO5D2H
X-Gm-Gg: AR+sD10vCpjFO1RI9GxHdsQu27SY5EGO9dtxl9Ler4+hrKWDeFR3II/Nd+3GN1cXS+0
	c+pUlHSXtuWkhnXdN1wFH0Hs7Lksuvr+HLDyyA1G8bLS38cH8f/61qEvbKmNA/uiZHp934HZTii
	mIVu7/yvlkq+kw/ZK926M1jGvUOD8DjEQyfSt9MpfKcaO8brecdYgFg9ZNi2ZZZi5me7QQka5f6
	eLxU1m4k+ZeXqF85DQJOqkjLNzhBW5JuZbfjcEUTfp5ffEyY+UhlEUCUXMMqcudZzVZEF/Rj3FA
	ePjST+8R+7izQEWecI4BL+wNrR8qRxC6bSfLXtyBCXD2qvkwRvRvaKDp2cbL7dpmTDCYeQj8O9V
	Zz76lRuqHxr6HK/hzmp88yBb4
X-Received: by 2002:a05:6a00:9092:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84c292a0e7bmr18471379b3a.14.1784617687627;
        Tue, 21 Jul 2026 00:08:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:9092:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84c292a0e7bmr18471334b3a.14.1784617687016;
        Tue, 21 Jul 2026 00:08:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc74csm7080833b3a.18.2026.07.21.00.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:08:06 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:37:21 +0530
Subject: [PATCH v2 6/6] clk: qcom: gpucc: Add Nord graphics clock
 controller support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfXwLqa0jiy9fk3
 P6L6mRGmoblr+iM+c7omlQwt2IVdUy0+s71y0i6+XdDk7az8jWBDKFjkD3t+2rEDGFbveJvaplZ
 cUntdiX6xAbo2MrIk5ogRVHCwANwJDrEGKIVI/eJFiGzLYne4BNrGkyqFlgJcfn41jTW2Kdxa0z
 l0/eoCDp4q1Iv5r89Xr5qrk4LfZlHYeVyH3+tUu2MChbk9lE0mwacV9AnUCQz3Q2ZY9MX1VoXAf
 mUhrSHZ1Zdc9XFkyXDg/3mjW8PYqiEI4jn48iLWZhMMpKzjbSSUH7QK1nfNWFo5PJG82oLdb7el
 oNSPhk5TauhoBUkXnsQqwUV+yzahlLJCKtHt+ZtuAXVWcAgNcv/z3f4eXLO6R7D3jxBMDZ4U2L/
 7QhpYJKYb3jSGRDCR73+7ZsYSNuy3kwZOwJsDs2mACj/RfEQa45C59W2XG+ru3yFsPc+8et8/T8
 Z7RUc9yvLENz0qGv7sg==
X-Proofpoint-ORIG-GUID: EqzE9Hp-kDKWa9jr3J0VMUE6UYIMzKSe
X-Proofpoint-GUID: EqzE9Hp-kDKWa9jr3J0VMUE6UYIMzKSe
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f1ad9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F3NrMrZ0Zf_nGyolyosA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX/lOx/uequegY
 MpQtM4TvRfSR9mcqhi6WFvYai4czeLyl+lO3rBm8XNoyF9dOCxvbnFnpCJafTtRpo7V0OVin4rG
 gNm8Xn1YDrcNi/YoDaqs9HhhGVv5PYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210073

Add support for the GPU clock controllers (GPUCC) on the Qualcomm
Nord platform.

The platform includes two GPU clock controller instances,GPUCC
and GPU2CC. Register support for both controllers, which provide
clocks required for the graphics subsystem.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |  11 +
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/gpu2cc-nord.c | 545 +++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gpucc-nord.c  | 593 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1150 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 874136a2ad9aaa117df2c7ad5c8abc5280b76339..10dcfa72a0bd3bdd70e2bee05964e8c275ceb07d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -166,6 +166,17 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_NORD_GPUCC
+	tristate "Nord Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the graphics clock controllers on Nord devices. There are two
+	  graphics clock controllers on Nord SoC.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 4282f43e7078f1fe0dde6f942040eb6bd122d7ce..fb0a5bc94e32b2dc1d56268aa87f455b20d779eb 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
+obj-$(CONFIG_CLK_NORD_GPUCC) += gpucc-nord.o gpu2cc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/gpu2cc-nord.c b/drivers/clk/qcom/gpu2cc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..a05ff9fa1506e9d63b789127866ea5c37e5a1e2f
--- /dev/null
+++ b/drivers/clk/qcom/gpu2cc-nord.c
@@ -0,0 +1,545 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-gpu2cc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_2_CC_PLL0_OUT_MAIN,
+	P_GPU_2_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 934.0 MHz Configuration */
+static const struct alpha_pll_config gpu_2_cc_pll0_config = {
+	.l = 0x30,
+	.alpha = 0xa555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll gpu_2_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_2_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1100.0 MHz Configuration */
+static const struct alpha_pll_config gpu_2_cc_pll1_config = {
+	.l = 0x39,
+	.alpha = 0x4aaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll gpu_2_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &gpu_2_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_2_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_2_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_2_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_2_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_2_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_2_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_2_cc_pll0.clkr.hw },
+	{ .hw = &gpu_2_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_2_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_2_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_2_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_2_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_2_cc_ff_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_2_cc_ff_clk_src = {
+	.cmd_rcgr = 0x91c4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_2_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_2_cc_ff_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_2_cc_ff_clk_src",
+		.parent_data = gpu_2_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_2_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_2_cc_gmu_clk_src[] = {
+	F(550000000, P_GPU_2_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_2_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9174,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_2_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_2_cc_gmu_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_2_cc_gmu_clk_src",
+		.parent_data = gpu_2_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_2_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gpu_2_cc_hub_clk_src = {
+	.cmd_rcgr = 0x91a8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_2_cc_parent_map_2,
+	.freq_tbl = ftbl_gpu_2_cc_ff_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_2_cc_hub_clk_src",
+		.parent_data = gpu_2_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gpu_2_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch gpu_2_cc_ahb_clk = {
+	.halt_reg = 0x90cc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_crc_ahb_clk = {
+	.halt_reg = 0x90d0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_crc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x9114,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9114,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_cx_ff_clk = {
+	.halt_reg = 0x9100,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9100,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_cx_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_cx_gmu_clk = {
+	.halt_reg = 0x90e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_cxo_clk = {
+	.halt_reg = 0x90f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_freq_measure_clk = {
+	.halt_reg = 0x9008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_hub_aon_clk = {
+	.halt_reg = 0x91a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x91a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_hub_cx_int_clk = {
+	.halt_reg = 0x90fc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_2_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x9104,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9104,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_mnd1x_0_gfx3d_clk = {
+	.halt_reg = 0x9164,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_mnd1x_0_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_mnd1x_1_gfx3d_clk = {
+	.halt_reg = 0x9168,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9168,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_mnd1x_1_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_2_cc_sleep_clk = {
+	.halt_reg = 0x90e0,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x90e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_2_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_2_cc_cx_gdsc = {
+	.gdscr = 0x9090,
+	.gds_hw_ctrl = 0x90a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_2_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gpu_2_cc_gx_gdsc = {
+	.gdscr = 0x9034,
+	.clamp_io_ctrl = 0x9504,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_2_cc_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gpu_2_cc_nord_clocks[] = {
+	[GPU_2_CC_AHB_CLK] = &gpu_2_cc_ahb_clk.clkr,
+	[GPU_2_CC_CRC_AHB_CLK] = &gpu_2_cc_crc_ahb_clk.clkr,
+	[GPU_2_CC_CX_ACCU_SHIFT_CLK] = &gpu_2_cc_cx_accu_shift_clk.clkr,
+	[GPU_2_CC_CX_FF_CLK] = &gpu_2_cc_cx_ff_clk.clkr,
+	[GPU_2_CC_CX_GMU_CLK] = &gpu_2_cc_cx_gmu_clk.clkr,
+	[GPU_2_CC_CXO_CLK] = &gpu_2_cc_cxo_clk.clkr,
+	[GPU_2_CC_FF_CLK_SRC] = &gpu_2_cc_ff_clk_src.clkr,
+	[GPU_2_CC_FREQ_MEASURE_CLK] = &gpu_2_cc_freq_measure_clk.clkr,
+	[GPU_2_CC_GMU_CLK_SRC] = &gpu_2_cc_gmu_clk_src.clkr,
+	[GPU_2_CC_GPU_SMMU_VOTE_CLK] = &gpu_2_cc_gpu_smmu_vote_clk.clkr,
+	[GPU_2_CC_HUB_AON_CLK] = &gpu_2_cc_hub_aon_clk.clkr,
+	[GPU_2_CC_HUB_CLK_SRC] = &gpu_2_cc_hub_clk_src.clkr,
+	[GPU_2_CC_HUB_CX_INT_CLK] = &gpu_2_cc_hub_cx_int_clk.clkr,
+	[GPU_2_CC_MEMNOC_GFX_CLK] = &gpu_2_cc_memnoc_gfx_clk.clkr,
+	[GPU_2_CC_MND1X_0_GFX3D_CLK] = &gpu_2_cc_mnd1x_0_gfx3d_clk.clkr,
+	[GPU_2_CC_MND1X_1_GFX3D_CLK] = &gpu_2_cc_mnd1x_1_gfx3d_clk.clkr,
+	[GPU_2_CC_PLL0] = &gpu_2_cc_pll0.clkr,
+	[GPU_2_CC_PLL1] = &gpu_2_cc_pll1.clkr,
+	[GPU_2_CC_SLEEP_CLK] = &gpu_2_cc_sleep_clk.clkr,
+};
+
+static struct gdsc *gpu_2_cc_nord_gdscs[] = {
+	[GPU_2_CC_CX_GDSC] = &gpu_2_cc_cx_gdsc,
+	[GPU_2_CC_GX_GDSC] = &gpu_2_cc_gx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_2_cc_nord_resets[] = {
+	[GPU_2_CC_ACD_BCR] = { 0x918c },
+	[GPU_2_CC_CB_BCR] = { 0x9198 },
+	[GPU_2_CC_CX_BCR] = { 0x908c },
+	[GPU_2_CC_FAST_HUB_BCR] = { 0x91a0 },
+	[GPU_2_CC_FF_BCR] = { 0x91c0 },
+	[GPU_2_CC_GFX3D_AON_BCR] = { 0x9118 },
+	[GPU_2_CC_GMU_BCR] = { 0x9170 },
+	[GPU_2_CC_GX_BCR] = { 0x9030 },
+	[GPU_2_CC_XO_BCR] = { 0x9000 },
+};
+
+static struct clk_alpha_pll *gpu_2_cc_nord_plls[] = {
+	&gpu_2_cc_pll0,
+	&gpu_2_cc_pll1,
+};
+
+static const u32 gpu_2_cc_nord_critical_cbcrs[] = {
+	0x9004, /* GPU_2_CC_CXO_AON_CLK */
+	0x900c, /* GPU_2_CC_DEMET_CLK */
+};
+
+static const struct regmap_config gpu_2_cc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9ff0,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data gpu_2_cc_nord_driver_data = {
+	.alpha_plls = gpu_2_cc_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_2_cc_nord_plls),
+	.clk_cbcrs = gpu_2_cc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_2_cc_nord_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_2_cc_nord_desc = {
+	.config = &gpu_2_cc_nord_regmap_config,
+	.clks = gpu_2_cc_nord_clocks,
+	.num_clks = ARRAY_SIZE(gpu_2_cc_nord_clocks),
+	.resets = gpu_2_cc_nord_resets,
+	.num_resets = ARRAY_SIZE(gpu_2_cc_nord_resets),
+	.gdscs = gpu_2_cc_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_2_cc_nord_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_2_cc_nord_driver_data,
+};
+
+static const struct of_device_id gpu_2_cc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-gpu2cc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_2_cc_nord_match_table);
+
+static int gpu_2_cc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_2_cc_nord_desc);
+}
+
+static struct platform_driver gpu_2_cc_nord_driver = {
+	.probe = gpu_2_cc_nord_probe,
+	.driver = {
+		.name = "gpu2cc-nord",
+		.of_match_table = gpu_2_cc_nord_match_table,
+	},
+};
+
+module_platform_driver(gpu_2_cc_nord_driver);
+
+MODULE_DESCRIPTION("QTI GPU2CC Nord Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gpucc-nord.c b/drivers/clk/qcom/gpucc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..f37bc32e80ff66915108c241fc0e46b2e8a5f8bb
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-nord.c
@@ -0,0 +1,593 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 936.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x30,
+	.alpha = 0xc000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1250.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll1_config = {
+	.l = 0x41,
+	.alpha = 0x1aaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll gpu_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &gpu_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_ff_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_ff_clk_src = {
+	.cmd_rcgr = 0x93d4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_ff_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_ff_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(416666667, P_GPU_CC_PLL1_OUT_MAIN, 3, 0, 0),
+	F(625000000, P_GPU_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x92b8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x938c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_2,
+	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
+	.reg = 0x93cc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_hub_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_acd_gfx3d_clk = {
+	.halt_reg = 0x92a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x92a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_acd_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_acmu_clk = {
+	.halt_reg = 0x9294,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9294,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_acmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x9150,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x9150,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x9154,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9154,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_crc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x91a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x91a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_ff_clk = {
+	.halt_reg = 0x9184,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9184,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x916c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x916c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x917c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x917c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_dpm_clk = {
+	.halt_reg = 0x91a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x91a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_dpm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x9008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x9388,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9388,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_cx_int_clk = {
+	.halt_reg = 0x9180,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9180,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x9188,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9188,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_mnd1x_gfx3d_clk = {
+	.halt_reg = 0x92ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x92ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_mnd1x_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_sleep_clk = {
+	.halt_reg = 0x9164,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x90e8,
+	.gds_hw_ctrl = 0x9128,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gpu_cc_gx_gdsc = {
+	.gdscr = 0x905c,
+	.clamp_io_ctrl = 0x9504,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_cc_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gpu_cc_nord_clocks[] = {
+	[GPU_CC_ACD_GFX3D_CLK] = &gpu_cc_acd_gfx3d_clk.clkr,
+	[GPU_CC_ACMU_CLK] = &gpu_cc_acmu_clk.clkr,
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_FF_CLK] = &gpu_cc_cx_ff_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
+	[GPU_CC_FF_CLK_SRC] = &gpu_cc_ff_clk_src.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GPU_SMMU_VOTE_CLK] = &gpu_cc_gpu_smmu_vote_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_MND1X_GFX3D_CLK] = &gpu_cc_mnd1x_gfx3d_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
+	[GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
+};
+
+static struct gdsc *gpu_cc_nord_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+	[GPU_CC_GX_GDSC] = &gpu_cc_gx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_nord_resets[] = {
+	[GPU_CC_ACD_BCR] = { 0x92f8 },
+	[GPU_CC_CB_BCR] = { 0x9340 },
+	[GPU_CC_CX_BCR] = { 0x90e4 },
+	[GPU_CC_FAST_HUB_BCR] = { 0x9384 },
+	[GPU_CC_GFX3D_AON_BCR] = { 0x91ac },
+	[GPU_CC_GX_BCR] = { 0x9058 },
+	[GPU_CC_XO_BCR] = { 0x9000 },
+};
+
+static struct clk_alpha_pll *gpu_cc_nord_plls[] = {
+	&gpu_cc_pll0,
+	&gpu_cc_pll1,
+};
+
+static const u32 gpu_cc_nord_critical_cbcrs[] = {
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct regmap_config gpu_cc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9660,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data gpu_cc_nord_driver_data = {
+	.alpha_plls = gpu_cc_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_nord_plls),
+	.clk_cbcrs = gpu_cc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_nord_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_nord_desc = {
+	.config = &gpu_cc_nord_regmap_config,
+	.clks = gpu_cc_nord_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_nord_clocks),
+	.resets = gpu_cc_nord_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_nord_resets),
+	.gdscs = gpu_cc_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_nord_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_nord_driver_data,
+};
+
+static const struct of_device_id gpu_cc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_nord_match_table);
+
+static int gpu_cc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_nord_desc);
+}
+
+static struct platform_driver gpu_cc_nord_driver = {
+	.probe = gpu_cc_nord_probe,
+	.driver = {
+		.name = "gpucc-nord",
+		.of_match_table = gpu_cc_nord_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_nord_driver);
+
+MODULE_DESCRIPTION("QTI GPUCC Nord Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

