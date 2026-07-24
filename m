Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80A448B9C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913367; cv=none; b=UWd82NVsol5EXAOgOSZxH0Ttnm0TtX2LfPz9qtqKx8TGjRXDaQehaQ6+GK4TOtK2tabV3qweCvSKP9/VrkyI56SWPjToPRSijZNt94B7uEUMFb4IXQSbE6QTW4tLvfTfG0oAwQ/cQChWcMnGqZ0OceoAD0QR2TLKn0NDNC1Ikfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913367; c=relaxed/simple;
	bh=n1uIWOb5QkJsLJsuAviZuo0y0jreL6X/kpxfym+wRpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GBbmNaMPNu3riEYoV03XRPr/En6tTX7MTyY9m9XIN4rrOnvu5p7j3pN/Kuq7l6pRnciR2F0YH6UJBigm5DqHZj2ldxB9FEwJOVuTr2lgGT7fGxBfPYI88zxm8aGG+GAirnp5q2aEAy+uWnpL8hkUacs/5g8DpEfMnddwmvhv/gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niVCcoAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVe6klDT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niVCcoAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVe6klDT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGr6553628790
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	liRQlhPQXtMlp81a1N01foPJwxMNHCyqu87yUXM9zTk=; b=niVCcoAFK2MT0lYl
	v13q3QijXgjved77p+SvJBNVXZWRsFn4kVb44PyD2aHnN2JKEVwrX5OhVmIgMnXw
	PpCLkkT8JfNf5Dy6n2ras8tzciaEw69KubyX30+hAVruoUGQOydrHO4T8DpoUqEe
	vGBfMJ70Li2Agzc6UvHrNMEO/W3QwlsDr85JraILTB7ovDBmSkVoj+8g7/hgYX1v
	DYuotGWvHDNMO50IiH4KEQBCd8/t30J94jCbGxQUOArkfdILVIlmjCurBEYymQrt
	eLqOQ20pJX5NyQSe+fWh/ofF2GVMwOZVDU/CKG0dY1JSL2yGR4kb9bLcviUXOQ7n
	8HDq1A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yahjer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:16:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1235396a12.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784913362; x=1785518162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liRQlhPQXtMlp81a1N01foPJwxMNHCyqu87yUXM9zTk=;
        b=iVe6klDT27jhZ+VkxdUzbpCjw6LWM/SrjH7Ar39sQOWx9TRYlw3s1jKvQN/Vcw9/rp
         rdynjKT8NOHjoGloWloPNXtJ4owR0ZriPTouPh/pci/j9XJfNI4r23cdq8UUqmmwmlHt
         h5hYH6Vja3aU6nNdzzxQXwxNrGpo2w3sPKUduCbhZVHSPT+v037mGptOYfz8PQUt9Ob2
         TXiJXyxcK8PJ7jxu0vcHi9nAWIXFRqRPkKRXEFigIWMdyk1g586p/0foP4pugJ5OJsOG
         RagHL1NwZ9PiNpkjkbfaL7VcIpFeXxHCaIcDy38BwZiMMbfxJN7NB/0NSprf/JxG0jpk
         T+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913362; x=1785518162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=liRQlhPQXtMlp81a1N01foPJwxMNHCyqu87yUXM9zTk=;
        b=JpTy6AMqS69HCUuJzB+U9CUX9M+Re8IZjNTFrzImabzoNsCXeN6xJ7MGWheIlNglxC
         +YJvSWW1YasQH82XJB3kn0fUCPM9ZmB0kBNzPwfKHZj3oKjhRJEqx7lkHp4fhQPIpEYH
         bEqLZlvlbhvJx9gqsZMeR+rBawf0vHxwYoIoQtDeM7reXvqu7xseMEfONrMzn4E/E77w
         fkSCZrJmQNTVNfqOECsYhbHRSa9HGdU44zH0A/1Mh9eGUKHLUd8d9HBnqfY01iTRIlpJ
         V2BTL69L+YDZIk+z3akfGZFKdhMXgngOETFbHj/nqVPrmQrg8Mx45X2wbowGlAr8oh+5
         HuOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2F1clwakBqIaQHyOhnPjRWPMdYQFrIc+Hh+yzVMfh02XwTW2z7p7CC7I3n+KlbE4MZFYR9h1Vdtoo@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVO5vfRF/00u2ZC+GpQrcrtYIiGn9pKrNnSiOjZOc5hv0dePd
	TaHIa0JXhKE6IoTfReKHNbrnw5/PQdEeWdoDNfXb97vrUzXO66qhtLxxN+KJwzPGtz6hX4LDejC
	3sjiw+S15v0qM5BeWSq4os//CmZdJ3bQwjRUHAE2v/N3rCcoqMkcwsuM239hoz0pZ
X-Gm-Gg: AR+sD12FfmYKiUec6B/Qg/ioWA3OxybxBbki7z+5DFwRXcoYd5ENWWDiZcccvRU37Zj
	VaED/8UHyFDJBWsfrbiF08yNZGx6H2NiJ10MaPFvDAFiDPLQxvd1YnG3LT+R93bKZwuFOiIptxV
	9kdgQ2KyiKqfUw2/Ika0hctZDBqS3gep8wgpni9xBcGdYPkubWr8S+y6uteUT7FsLXnHWAh3YLQ
	aey3J8xKgTkWWJVL99HbUXm/eII98uHyjVYoyM7ZEAveU0MTYzCSdS0pXBJ8ayYH+LGKxgAxW0z
	nZTeuTtPPn7aApduSinu0WyuhB3qOAl/QcH78Qip7+C25/xoN+dxsDWXWwGFQ+SJGrh5cu0kJPL
	yoyuod4thbG2jS9iH0VrlWtSGDEgTR/Q=
X-Received: by 2002:a17:90a:fc46:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38f1ebb5520mr1272144a91.6.1784913361783;
        Fri, 24 Jul 2026 10:16:01 -0700 (PDT)
X-Received: by 2002:a17:90a:fc46:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38f1ebb5520mr1272069a91.6.1784913360574;
        Fri, 24 Jul 2026 10:16:00 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm8400892c88.3.2026.07.24.10.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:16:00 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 22:45:33 +0530
Subject: [PATCH v4 2/3] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-shikra-audiocorecc-v4-2-0a89bb13d817@oss.qualcomm.com>
References: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
In-Reply-To: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfX7Vp2fQSRVpub
 272FRGfk4B6E4arxU5x/LQ3YXqOutbo3OvNLY8wbLwBPwkDevWIXYqUifkhcx3ERGGxgHG7pUjQ
 kKkmrWnbDQqTOY/eWCKNwn7h4iO0yB0=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a639dd3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F_syqbkkfc-CeLG8pkkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ku6_dCv5l2aNp1JfMTTe_9BNRfGbbwy1
X-Proofpoint-ORIG-GUID: ku6_dCv5l2aNp1JfMTTe_9BNRfGbbwy1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfX37tFn7RR4n4i
 j69HRusmn40MLXvsVi1vIwiSp4wdNdE2cQzE5nXpvPK3fHpaSkUHVxAz8JiQhM2BNPOQ9llUPr2
 qScF8yHAQLkv4XYLIy1kN417FJCi2b/Gq3ZfQ8W/g6hbCm8+plmCpMinBoIeOt+7HGkO+47jw/s
 YLOhBsU9csVovVlS0erzogJYixdDf7pOqFJDCKWPW9OJyNw8uKPlHy8sowYcx05MOGEZN9xPC+d
 v7itWX7Z4B1anIl3PbrU5rKq97nfM3+Ss+ylRMrlfRZ8m/q0eaSDGV4Wx9UPZfQF5mxzt2d9Wsq
 WJGv9bslTNpzvdWChuJ6GNT2A/+VdnqSD4RqXHhwAvZzCegUv60/Vb3R2wIK1xMd2EebhlJUoCU
 xBYhbY7AMvcdOoZmU8+0wKo97QMWfyq8uu7KUi8l0BavHiC19zBjpDkFEM82fynErT6c8cFfwx7
 auABcOUPyxPmKCoKBuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240155

Add support for Audio Core Clock Controller (AUDIOCORECC) and Audio Core
CSR resets on Qualcomm Shikra SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig              |  10 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c | 810 ++++++++++++++++++++++++++++++++++
 3 files changed, 821 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 63f271aff1771bea0885fb753dd28d02fd7d4ab6..29ae37ece3141438d6fb8162cc7ad3a361c5323c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -192,6 +192,16 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_SHIKRA_AUDIOCORECC
+	tristate "Shikra Audio Core Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_SHIKRA_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the Audio Core clock controller on Qualcomm Shikra devices.
+	  Say Y if you want to use AudioCoreCC clocks required to support audio
+	  devices and it's functionality.
+
 config CLK_SHIKRA_GCC
 	tristate "Shikra Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index db7689ee5dc63bc8b7d12b8222188bc1e1ff78ba..f26a79658bb88c957f990d76d295a5a9a09bb7ee 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
+obj-$(CONFIG_CLK_SHIKRA_AUDIOCORECC) += audiocorecc-shikra.o
 obj-$(CONFIG_CLK_SHIKRA_GCC) += gcc-shikra.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/audiocorecc-shikra.c b/drivers/clk/qcom/audiocorecc-shikra.c
new file mode 100644
index 0000000000000000000000000000000000000000..19f67b50d6234655ebb8cbc242a8d7efbb0a6039
--- /dev/null
+++ b/drivers/clk/qcom/audiocorecc-shikra.c
@@ -0,0 +1,810 @@
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
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
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
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+	DT_AUD_REF_CLK_SRC,
+};
+
+enum {
+	P_AUD_REF_CLK_SRC,
+	P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX,
+	P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2,
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco spark_vco[] = {
+	{ 500000000, 1000000000, 2 },
+};
+
+/* 614.4 MHz Configuration */
+static const struct alpha_pll_config audio_core_cc_dig_pll_config = {
+	.l = 0x20,
+	.alpha = 0x0,
+	.vco_val = BIT(21),
+	.post_div_val = 0x28100,
+	.post_div_mask = GENMASK(17, 8),
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+	.aux2_output_mask = BIT(2),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+};
+
+static struct clk_alpha_pll audio_core_cc_dig_pll = {
+	.offset = 0x0,
+	.config = &audio_core_cc_dig_pll_config,
+	.vco_table = spark_vco,
+	.num_vco = ARRAY_SIZE(spark_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_dig_pll",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor audio_core_cc_dig_pll_out_aux = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data) {
+		.name = "audio_core_cc_dig_pll_out_aux",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &audio_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_fixed_factor audio_core_cc_dig_pll_out_aux2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "audio_core_cc_dig_pll_out_aux2",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &audio_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct parent_map audio_core_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_AUD_REF_CLK_SRC, 1 },
+	{ P_SLEEP_CLK, 2 },
+	{ P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 4 },
+	{ P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 6 },
+};
+
+static const struct clk_parent_data audio_core_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_AUD_REF_CLK_SRC },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &audio_core_cc_dig_pll_out_aux.hw },
+	{ .hw = &audio_core_cc_dig_pll_out_aux2.hw },
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aif_if0_clk_src[] = {
+	F(240000, P_BI_TCXO, 10, 1, 8),
+	F(256000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 32),
+	F(512000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 16),
+	F(768000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 16),
+	F(1024000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 8),
+	F(1536000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 8),
+	F(2048000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 4),
+	F(3072000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 4),
+	F(4096000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 2),
+	F(6144000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 2),
+	F(8192000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if0_clk_src = {
+	.cmd_rcgr = 0x104c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if0_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if1_clk_src = {
+	.cmd_rcgr = 0x10b0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if1_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if2_clk_src = {
+	.cmd_rcgr = 0x1114,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if2_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aif_if3_clk_src[] = {
+	F(240000, P_BI_TCXO, 10, 1, 8),
+	F(256000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 32),
+	F(512000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 16),
+	F(768000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 16),
+	F(1024000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 8),
+	F(1536000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 8),
+	F(2048000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 4),
+	F(3072000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 4),
+	F(4096000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 2),
+	F(6144000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 2),
+	F(8192000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	F(49152000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if3_clk_src = {
+	.cmd_rcgr = 0x1178,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if3_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aud_dma_clk_src[] = {
+	F(38400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 8, 0, 0),
+	F(102400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 3, 0, 0),
+	F(153600000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 2, 0, 0),
+	F(307200000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aud_dma_clk_src = {
+	.cmd_rcgr = 0x1028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aud_dma_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aud_dma_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_bus_clk_src[] = {
+	F(38400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 8, 0, 0),
+	F(76800000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_bus_clk_src = {
+	.cmd_rcgr = 0x1008,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_bus_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_bus_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_ext_mclka_clk_src = {
+	.cmd_rcgr = 0x123c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_ext_mclka_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_ext_mclkb_clk_src = {
+	.cmd_rcgr = 0x125c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_ext_mclkb_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_lpaif_pcmoe_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(15360000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 8, 0, 0),
+	F(30720000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 4, 0, 0),
+	F(61440000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_lpaif_pcmoe_clk_src = {
+	.cmd_rcgr = 0x12ac,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_lpaif_pcmoe_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_lpaif_pcmoe_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_tx_mclk_rcg_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_tx_mclk_rcg_clk_src = {
+	.cmd_rcgr = 0x127c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_tx_mclk_rcg_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_tx_mclk_rcg_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div audio_core_cc_cdiv_tx_mclk_div_clk_src = {
+	.reg = 0x129c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_cdiv_tx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if0_ebit_clk = {
+	.halt_reg = 0x1068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if0_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if0_ibit_clk = {
+	.halt_reg = 0x1064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if0_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if1_ebit_clk = {
+	.halt_reg = 0x10cc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if1_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if1_ibit_clk = {
+	.halt_reg = 0x10c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if2_ebit_clk = {
+	.halt_reg = 0x1130,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1130,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if2_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if2_ibit_clk = {
+	.halt_reg = 0x112c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x112c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if2_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if3_ebit_clk = {
+	.halt_reg = 0x1194,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1194,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if3_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if3_ibit_clk = {
+	.halt_reg = 0x1190,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1190,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if3_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aud_dma_clk = {
+	.halt_reg = 0x1040,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aud_dma_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aud_dma_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aud_dma_mem_clk = {
+	.halt_reg = 0x1044,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1044,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aud_dma_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aud_dma_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_bus_clk = {
+	.halt_reg = 0x1020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_bus_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_bus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_ext_mclka_out_clk = {
+	.halt_reg = 0x1254,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1254,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_ext_mclka_out_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_ext_mclka_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_ext_mclkb_out_clk = {
+	.halt_reg = 0x1274,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1274,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_ext_mclkb_out_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_ext_mclkb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_im_sleep_clk = {
+	.halt_reg = 0x12cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_im_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_lpaif_pcmoe_clk = {
+	.halt_reg = 0x12c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_lpaif_pcmoe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_lpaif_pcmoe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_rx_mclk_2x_clk = {
+	.halt_reg = 0x1298,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1298,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_rx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_rx_mclk_clk = {
+	.halt_reg = 0x12a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_rx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_sampling_clk = {
+	.halt_reg = 0x1000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_sampling_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_tx_mclk_2x_clk = {
+	.halt_reg = 0x1294,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1294,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_tx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_tx_mclk_clk = {
+	.halt_reg = 0x12a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_tx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_hw *audio_core_cc_shikra_hws[] = {
+	[AUDIO_CORE_CC_DIG_PLL_OUT_AUX] = &audio_core_cc_dig_pll_out_aux.hw,
+	[AUDIO_CORE_CC_DIG_PLL_OUT_AUX2] = &audio_core_cc_dig_pll_out_aux2.hw,
+};
+
+static struct clk_regmap *audio_core_cc_shikra_clocks[] = {
+	[AUDIO_CORE_CC_AIF_IF0_CLK_SRC] = &audio_core_cc_aif_if0_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF0_EBIT_CLK] = &audio_core_cc_aif_if0_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF0_IBIT_CLK] = &audio_core_cc_aif_if0_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_CLK_SRC] = &audio_core_cc_aif_if1_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_EBIT_CLK] = &audio_core_cc_aif_if1_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_IBIT_CLK] = &audio_core_cc_aif_if1_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_CLK_SRC] = &audio_core_cc_aif_if2_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_EBIT_CLK] = &audio_core_cc_aif_if2_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_IBIT_CLK] = &audio_core_cc_aif_if2_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_CLK_SRC] = &audio_core_cc_aif_if3_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_EBIT_CLK] = &audio_core_cc_aif_if3_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_IBIT_CLK] = &audio_core_cc_aif_if3_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_CLK] = &audio_core_cc_aud_dma_clk.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_CLK_SRC] = &audio_core_cc_aud_dma_clk_src.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_MEM_CLK] = &audio_core_cc_aud_dma_mem_clk.clkr,
+	[AUDIO_CORE_CC_BUS_CLK] = &audio_core_cc_bus_clk.clkr,
+	[AUDIO_CORE_CC_BUS_CLK_SRC] = &audio_core_cc_bus_clk_src.clkr,
+	[AUDIO_CORE_CC_CDIV_TX_MCLK_DIV_CLK_SRC] = &audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr,
+	[AUDIO_CORE_CC_DIG_PLL] = &audio_core_cc_dig_pll.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKA_CLK_SRC] = &audio_core_cc_ext_mclka_clk_src.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK] = &audio_core_cc_ext_mclka_out_clk.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKB_CLK_SRC] = &audio_core_cc_ext_mclkb_clk_src.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK] = &audio_core_cc_ext_mclkb_out_clk.clkr,
+	[AUDIO_CORE_CC_IM_SLEEP_CLK] = &audio_core_cc_im_sleep_clk.clkr,
+	[AUDIO_CORE_CC_LPAIF_PCMOE_CLK] = &audio_core_cc_lpaif_pcmoe_clk.clkr,
+	[AUDIO_CORE_CC_LPAIF_PCMOE_CLK_SRC] = &audio_core_cc_lpaif_pcmoe_clk_src.clkr,
+	[AUDIO_CORE_CC_RX_MCLK_2X_CLK] = &audio_core_cc_rx_mclk_2x_clk.clkr,
+	[AUDIO_CORE_CC_RX_MCLK_CLK] = &audio_core_cc_rx_mclk_clk.clkr,
+	[AUDIO_CORE_CC_SAMPLING_CLK] = &audio_core_cc_sampling_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_2X_CLK] = &audio_core_cc_tx_mclk_2x_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_CLK] = &audio_core_cc_tx_mclk_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_RCG_CLK_SRC] = &audio_core_cc_tx_mclk_rcg_clk_src.clkr,
+};
+
+static struct clk_alpha_pll *audio_core_cc_shikra_plls[] = {
+	&audio_core_cc_dig_pll,
+};
+
+static const struct qcom_cc_driver_data audio_core_cc_shikra_driver_data = {
+	.alpha_plls = audio_core_cc_shikra_plls,
+	.num_alpha_plls = ARRAY_SIZE(audio_core_cc_shikra_plls),
+};
+
+static const struct regmap_config audio_core_cc_shikra_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x305c,
+	.fast_io = true,
+};
+
+static const struct qcom_reset_map audio_core_csr_shikra_resets[] = {
+	[AUDIO_CORE_CSR_RX_SWR_CGCR] = { 0x1c, 1 },
+	[AUDIO_CORE_CSR_TX_SWR_CGCR] = { 0x30, 1 },
+};
+
+static const struct regmap_config audio_core_csr_shikra_regmap_config = {
+	.name = "audio_core_cc_shikra_reset",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x34,
+};
+
+static const struct qcom_cc_desc audio_core_csr_shikra_desc = {
+	.config = &audio_core_csr_shikra_regmap_config,
+	.resets = audio_core_csr_shikra_resets,
+	.num_resets = ARRAY_SIZE(audio_core_csr_shikra_resets),
+};
+
+static const struct qcom_cc_desc audio_core_cc_shikra_desc = {
+	.config = &audio_core_cc_shikra_regmap_config,
+	.clk_hws = audio_core_cc_shikra_hws,
+	.num_clk_hws = ARRAY_SIZE(audio_core_cc_shikra_hws),
+	.clks = audio_core_cc_shikra_clocks,
+	.num_clks = ARRAY_SIZE(audio_core_cc_shikra_clocks),
+	.driver_data = &audio_core_cc_shikra_driver_data,
+};
+
+static const struct of_device_id audio_core_cc_shikra_match_table[] = {
+	{ .compatible = "qcom,shikra-audiocorecc", .data = &audio_core_cc_shikra_desc },
+	{ .compatible = "qcom,shikra-audiocore-csr", .data = &audio_core_csr_shikra_desc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, audio_core_cc_shikra_match_table);
+
+static int audio_core_cc_shikra_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+
+	desc = device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	return qcom_cc_probe(pdev, desc);
+}
+
+static struct platform_driver audio_core_cc_shikra_driver = {
+	.probe = audio_core_cc_shikra_probe,
+	.driver = {
+		.name = "audiocorecc-shikra",
+		.of_match_table = audio_core_cc_shikra_match_table,
+	},
+};
+
+module_platform_driver(audio_core_cc_shikra_driver);
+
+MODULE_DESCRIPTION("QTI AUDIOCORECC Shikra Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

