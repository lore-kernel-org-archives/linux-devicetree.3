Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265EC340293
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767908; cv=none; b=qCa6cykJEWyCpjbuNI2JuBRN7KYUjo8ROo0WkWcaQ6bd+JOrHhyM0TuMMX02yGF+CPv9mSSDyM2bnsC58EEeeGWdBIKDAwfc+UOslL5t3lgGS2/g90Qp+HfyOh8qwQwbQnrNqfo9jL2nldo+GwGq9wgyd+HOuEFMXaFrPAm6kIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767908; c=relaxed/simple;
	bh=gcgvGt00dtfHZQ+9tTFp2hOWb9q8ub2J+jWdr3GP7bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/cwthuRicWwBnWV2HxZSqZ53zpQXWqt0or+8Cw4yjoKTDWq/NDdwzb7jMuZFk6DoVd11ru/zs1ZLV7leJpP+bcWuPX+Z7azE7GF+SjHype8pPijtYiVYsSeDi/FHi7gro5OM47f121ssL63HKdUwJZzrvOp+vZBFP1AdpAegY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HL+llQiO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hheiJOYy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL+llQiO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hheiJOYy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KXSqP1972547
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 20:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t18nYD09G1Li+WSxDw6Hf7c8xY3vrOtBmaJwda93wpA=; b=HL+llQiOOIBLZux3
	AjzRRmtwKIAX6H8vB1ylZo85G8dXXRTWy31Ba9TzjUy2K4thXuJTTz0MO6+i+mZ2
	VnqjKvFrnP8EvsP6tVL3A0aIWNuttnfWYxeSKRhM53kUPXOoBzi6wBKGI5fA62rs
	LdV/gD6/6ABYZ2CzC1JYRdF/v+Kht3EZbjEA06VRJapQqg9WJO/iyEKy2YHM+p1q
	IaprB8tUeqigTOFPw9AcQhVQ00Zz4N604EsYQfWRxhVX5nLiv3K/Msydrdn0RZYz
	d1oUYgV2oATt6MCsU47YuXqmFi/uyY8r+Ne0fqn6BsTPMF8SZPYWR+2oyqsI17Xc
	8qL7Ww==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1n98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:51:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127133794b6so12154125c88.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767904; x=1776372704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t18nYD09G1Li+WSxDw6Hf7c8xY3vrOtBmaJwda93wpA=;
        b=hheiJOYyn0VvVJYvGgrcQDnvJxcrtleAYYEzOJBHX7AijVUyBIgNzCgpNZ6f6VqXeU
         i7KzmvtwkO6TRPgjJp9A8u+lk8vItFC7d/hRftA671nmwht0jpLaW3wfnzZEyOj2D9Dr
         YPWY95K+Xecxh9Mt/eBgufvKFAcBJaeWuBvyosrgT1o1onTrhhnvSHYXE2ilcX648M5Q
         0pQu54ijakdrRVBil/qXRP2NAZFy6AeIPX3Hq8XaUidU1oSQ9TygTCqScKOPGrrufOI7
         SbogYBz8oHgSxJqqAySdd/JW2LX7lBacbWx4fcDqZXiMj7eqH9MrLNtfJmXIPPl+GH07
         1Ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767904; x=1776372704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t18nYD09G1Li+WSxDw6Hf7c8xY3vrOtBmaJwda93wpA=;
        b=Y+AKl4nn7qPVckXMbp+GxOMI/Q0Xaj+ixrR8eMwiOXB6dPKFK5TFnF/qLjkE6PH8wZ
         iQ3gaADRd3yuMgO/ReTGG7T9n4rIgrVssBWT672s3Z3U+15IoY6gIBFVzbQji0VKjBYj
         cKgA9LB3GyHA0idDQ2k6V5pIygPSlUUMq7R45Umzt1hqyY1YaZspyKCKKTBHK13e2Pzp
         ad3uSkLwysjc3moMJC28Ky99Qq3ihXTnLp2isejbrh3nP36ZO4JdLn9EqKOF4/eBaUx5
         CRGGr0dZrKuiuC1TxFFP8v0Nuf7d3QECMWZM9Cm9IeFtX/64L1mAgXMx1k6nF9S9guFy
         HdFA==
X-Forwarded-Encrypted: i=1; AJvYcCXfkz8Im1ZI/YspBnjXHx+1vKRY8Wr/s0Q3Ug8u+fyY9ogRJOHwiNZae81LN+YJ44MR2FcXdyp/iWzr@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1+yytjorymm7zMdpi+NPbDBpgnnA8V8k0Hl/3VXFahDS2Cem
	gwCCpU2zBtSPH0M4cmHWV99OSXhSlM9Xybi0UB1yBgF/30Ee3Mt8ePWPXGToZgQM0p0R9s03+dy
	0i77gC+GAM6q5XUJELMDipBnYuDXR8c7bQpS2R2569dv4NFCHiwEwu0z9A0ZWM+cs
X-Gm-Gg: AeBDieu3jKnZyNlRweOKtJPOZ6JgeuHVrt30LR94XWHeCvlgym6bR99B3KvnpIBx6+K
	eT4t6rl/ez/p+ohFyAdt9gFhK2gtsq2Y6i7tzk7Ecsh+DR1JYroaTNJ7E1Tx5MscASBFJuepIcL
	knkkpU+IqHW97xGflD3I9Hk4QqMfE22WH8tic7mYqnc7JFZzVgz623d6im+figJPjbEQ0XZcBl5
	jPb6jDyp1yH+kwodV7aNZWUOBvx/467OQN8YewcXnRDxpFezV3W9ThaLocy4FWy9u5Iu8Ub1IgO
	G98OzaI0DuSHp2g3Nw21wCfCRnemjXYjLrl2UZSUf/FrDqriqbWR/Rb02pe4WKRHbs5YqpfQHon
	DgfzYEsCcGwRvTfsDQQQBitQgtr5vaKtQv7Em9wcAABPpRlTMRm9z6kLIQlzAMsJ9h2VfZQneoK
	J+
X-Received: by 2002:a05:7022:6721:b0:128:ce84:f68b with SMTP id a92af1059eb24-12c34e6b498mr331600c88.4.1775767903394;
        Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
X-Received: by 2002:a05:7022:6721:b0:128:ce84:f68b with SMTP id a92af1059eb24-12c34e6b498mr331583c88.4.1775767902801;
        Thu, 09 Apr 2026 13:51:42 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:42 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:39 -0700
Subject: [PATCH v2 5/7] clk: qcom: Add Hawi TCSR clock controller driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=6115;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=gcgvGt00dtfHZQ+9tTFp2hOWb9q8ub2J+jWdr3GP7bg=;
 b=u1UaBfMfsKAJaZ7/oLtalN/NilDGYCa7wUdSC3DFMvyBXElwaUCgERibB7/pLEekMO4xaN9Zy
 No1HlfqWMpiAaTqjVUbV9tQRtOsvbf41anBH2dJsEmhSv0njsSTHzHq
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: vRABSaUdCK50qVmDuCxNkNmiVJBaP0XV
X-Proofpoint-GUID: vRABSaUdCK50qVmDuCxNkNmiVJBaP0XV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX/0ETPZouH6Ip
 j14P9Jkun9y3KAUpU5GjVUjURkfRGs63vaQQPK6S7OQOYle8XA1mG2IfS3PIjAc0RuTnaKt/cJd
 i7ystAFTRXFoIkjYlv1GshnkHS1QMVYioi/LE8ZAvA4+amnRKISJnk7n0W1K0oIwmdUKXhdCaUT
 rhqnftHLCCrv4lY54rvfEaz7gzPdODuLPjohQZUZRwdcWIK79cY3l7L1J8WJGMnpcQuwG7KWrlK
 6wGwFftALK0I3WRaQFAf0tnfBsyfXqYTE9d9o8rgINaA2uGiniWtM/Yem9N5khLkZpI1OLBt9L8
 uO1I1pEHIcmTl3hCo+htKG9AboRetCNVBP3jKu//1XwYT/zmBaIhaWIml4R0TM9L+JQX4hypKO7
 29yu12nurski1gBxhyq0jgrWqAtfuEDaHjfI4y79K0AJZhZn9pk64W07B13j9YEb1c3miEFyDgF
 bJ6sM8uoXMICITn7xxQ==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d81160 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=L8n4sJc4XsezP8dVquAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192

Add support for the TCSR clock controller found on the Qualcomm Hawi SoC.
This controller provides reference clocks for various peripherals
including PCIe, UFS, and USB.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
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

