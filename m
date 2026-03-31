Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E432882BE
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917320; cv=none; b=VQJu67nk97vvXZrsnfuHjabamrgbsGG5Jc/LHUgdaYm5auXgoFtJsXa9XXOpQgelDzDmFG+QCQEa5N8Jc2vmMhpnr9Thx+8419buArFxXHUtOhEq72RtXJZddxA4efVr6nKXCHauWkM8PBeTrtDWQYDLPynfq+Jd7aIXcine34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917320; c=relaxed/simple;
	bh=iR7NbPxINjAouUYeeIId0ffLvCwiOben9ExgvHA/Awg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSWsvS8JKnxnhIEZ0RLKNKkBt9ssAS0pNGed6LaCAIEm4fLEvU8jgi9IYq+qBvfldioIq41bXo9KrUhYT2tn0L18WYrb4rYNAEEdHP75zYPCwyNZsFGOWDHNOQosX1pFsZ3yQa0siWQskPrHmCFsAzWJ6m/4VXIjUTvzqQv9etQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c04mj/ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVuKEZEO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c04mj/ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVuKEZEO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UJoXDR2458515
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M63UFBd45xWloYDenKImaYTuEuDt8MZ7ixSNR8M0o0=; b=c04mj/ovHcacXzcv
	zv+8JEzx9ojgcDb2XMXqKIsFEKAgR0Vke7WyzNauUnC8Ce8ZpdlTuphAwWLXy8NP
	Yy6lV+rWgFoEivXn77kprtaMntE6Edm+ShB9pRwt0qd63//5O3jq920XmCj/7wR0
	lyXjlaG+8OKYg563PLIEaf9D7xmksHrnXZQOGgcfcRftz/U9otXTlHL/8dFPqvft
	cFS+35ICSfiWaI3xuYAv93mnhRfMVeyuz2uvYatpy2gFTN2H62eMZKEMXK7fw5Dn
	BKuL3fAX5UYVBgy3lLbWAsO+5VS8cxJa7oPiy7Ttm46GN8fcMKdsdh2opE8KkE7+
	AxCKWw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmukyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c7f2b72c91so1492167eec.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 17:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917315; x=1775522115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/M63UFBd45xWloYDenKImaYTuEuDt8MZ7ixSNR8M0o0=;
        b=TVuKEZEOluy32bz0uQYAtdCsI3nm7l9Z0FAqEVRzSFw9UHNwBZuBouGL7kx6v6hUyf
         a3n6jpdS64mf9bEa3DKz/oN94RGdj9rvgEkpTE618w06hv6wR6d9nHaP9KU0QxMkhGx2
         Wd5PTVlMLuYRcmplp6kSIc06Gyb/N1KthvKBVH/eymLsxVWc10pOaENbb/9pcu5pAhoW
         PbR+RhQpCwqfQ7dlxYTE4BxJ0VLyJ8M7IAWTy1mFfpQT3BuW4cRrS4pQVI74IMHb/OhX
         WLqW87mszJ0Tx6Or+FmESjUGkjAPFqSZv8VAFkv4PjpuB6wrdqGBNiPg9Mx7fW/hFs45
         w/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917315; x=1775522115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/M63UFBd45xWloYDenKImaYTuEuDt8MZ7ixSNR8M0o0=;
        b=CYPqf/wtpIlMJ7qb+CTJcK/CsgQDnbIJQUM8f6EJ87MXx6BhF9FRTF83DdoR9glik9
         fXhlRT1vNNC+VLEyNKdKaY/ORpc42yvyIJc1QXCofEyQ2MwECJ3QqACO5KfNc3yTHlNh
         339agKbA6u+FcVgVCNgOx1Vgol96Rj1RgzgjzoY42zC2qOMENV6E2WdSZXzDMq10spmq
         7gAwGwb03d5wd3Kc7w09TZsQYJwzCS7mqhF3njNJKQzRktMogUooHwUt01kXAFFsABum
         KOwY9MQhqnEX34fOOj4bo+BnBGyspZQ+mT2E//EOBGpahBy3iMn5u4sojv+u5HDT/Sim
         LanQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYGJH5M1RtXbK9nQW6Oogr34M1CulKXklVnBGz7jXfpDcQ6auyPLQ42uwGQaqyY5p3WbW/eX57iiAR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dUKBJfYuefz+ldRmDyGHGy/2xXxNn4zGqCNNZJYVQ4Gbzbtw
	3mJI/1bbccItSI+GayvaCR3veIJnkpskW65QcvJY3jJ5Wtm4Ra9khjH9KdGgYHt1qv2MaEpNvtV
	i0AaGX9VuwwQFWZxtdO+xHzMadoCIsyXHUi3HTQ2a4Lv+IEw52Mam2sUViVO5vL2a
X-Gm-Gg: ATEYQzxzWpvS7UTlx+b5YzSV6KI8Y2XQ0BvFNphYinz8zw5j6WOZOS//M+g4pQvnKhP
	GEp69XSJHCafR4FfC7y8LgRX1d4tubkRWXzgKz95I4+jX9ul5riqIkLKqttK2lfI4Sp8nLgJkgR
	wrRAlEUzh4buEPiJ7kvd2txPnaNAuqT+BhQv3K79UW4RXpCxVqPOwz/W/4OZli2vmy8SlNjVLsb
	DHpMEqKZIuvO0RfDkwbXP1u+YkyaCtEVV6rzsHb9jnbYGalH7xyjz0seOV0ABBng4W1EGsFmmf5
	gFJverpiVmlTg0cJxpmp6LqS8gPRCmxcVvfSwUoQEbFsoBwZSgIOVv6mdYZ3r/7sfrv3o0izG+L
	wVglSAOjNN7Ru7dszUUN8L56N1/zVG//2fAHJF6UlI7d9wxtdicJVb72kHgmMOo0Fbyg9gOxVQ5
	V7
X-Received: by 2002:a05:7300:4307:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2c7028769cfmr2586677eec.28.1774917315350;
        Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
X-Received: by 2002:a05:7300:4307:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2c7028769cfmr2586660eec.28.1774917314829;
        Mon, 30 Mar 2026 17:35:14 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:14 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:35:00 -0700
Subject: [PATCH 5/7] clk: qcom: Add Hawi TCSR clock controller driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-5-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=6048;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=iR7NbPxINjAouUYeeIId0ffLvCwiOben9ExgvHA/Awg=;
 b=3GbspS3jHwy4BofsDn+/BuVz0sPsjZkP8jh3m4tK3aIAL5Urt5pjctJCDY55+6tiu1eSeXZLc
 09D0jRSKVtyBrKbJ9+/5MXKe91wqzyZNIQfG/I6E3Cfh5EuzTHK+CRY
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX/jdDDcJLRRxv
 yWQrQgKF0vRViOkRQVAnL1SiF6so/p6mlLKPg229PJNCU+Ok1PWc4uP9a5LxGOy60knWJK9rZfi
 i1mJYqgunTH7vo+6uAVVSqAL+vYyaAFcdQ1O6+tCdbj/k9HQ2IjXaTBgz95p+hQjlzu0vmSkFB2
 1rmPOD56HqmZ72rEDdxXd7f0spSG8IPJRISS1DsRQuOKqELxcuJhcCZJn2s0ed/TLNl4XWZOa5d
 eAhIFRCirGIwafMLRM0MSjPe/X5FJvQHxxToJo4usiFxwAI6AfxkCHBZQgngBetwJ0lsEGoDath
 lNUDhN5BjrHCHrsOYLmGZX1nwo7R4CeWMEOEfD/YUPkVg7ApxRj73o4m3m0G6JtSlaXzWMAB0v7
 WH6twWk/8rSW63mQGsw5BwlqFuE9Zly38ctKi5lSca4i+4MYbaqX5eZdc83ZYa7Eq1kt2AL5hjA
 zw222f96R4tS2Jas0Pg==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69cb16c4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=L8n4sJc4XsezP8dVquAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Rdp_YA9zzNqmQPje6R3wWBdZ9RXqniCf
X-Proofpoint-ORIG-GUID: Rdp_YA9zzNqmQPje6R3wWBdZ9RXqniCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

Add support for the TCSR clock controller found on Hawi SoCs.
This controller provides reference clocks for various peripherals
including PCIe, UFS, and USB.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |   7 ++
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8f55f10261ec..412badb0fb58 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -286,6 +286,13 @@ config QCOM_CLK_RPMH
 	 Say Y if you want to support the clocks exposed by RPMh on
 	 platforms such as SDM845.
 
+config CLK_HAWI_TCSRCC
+	tristate "Hawi TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Support for the TCSR clock controller on Hawi devices.
+	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
+
 config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 103d6c4b860c..e85ed6678e51 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
+obj-$(CONFIG_CLK_HAWI_TCSRCC) += tcsrcc-hawi.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
diff --git a/drivers/clk/qcom/tcsrcc-hawi.c b/drivers/clk/qcom/tcsrcc-hawi.c
new file mode 100644
index 000000000000..c942b0c8e09f
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-hawi.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,hawi-tcsrcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x4c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x18,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x18,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_hawi_clocks[] = {
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_hawi_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x4c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_hawi_desc = {
+	.config = &tcsr_cc_hawi_regmap_config,
+	.clks = tcsr_cc_hawi_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_hawi_clocks),
+};
+
+static const struct of_device_id tcsr_cc_hawi_match_table[] = {
+	{ .compatible = "qcom,hawi-tcsrcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_hawi_match_table);
+
+static int tcsr_cc_hawi_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_hawi_desc);
+}
+
+static struct platform_driver tcsr_cc_hawi_driver = {
+	.probe = tcsr_cc_hawi_probe,
+	.driver = {
+		.name = "tcsrcc-hawi",
+		.of_match_table = tcsr_cc_hawi_match_table,
+	},
+};
+
+module_platform_driver(tcsr_cc_hawi_driver);
+
+MODULE_DESCRIPTION("QTI TCSRCC HAWI Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

