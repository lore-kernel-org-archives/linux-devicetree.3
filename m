Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFE338229A
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174902; cv=none; b=VaKcK+ogFG5wK9fBKES6imi04A6tb5hcsta/fD3yPcJi0lRk8iHaZeCRvjWKA0VAfBbOzIETp8lGd1ibdW797z9e8W6+ySGs5YeWCsQh/Aof5INpbeA1mOB9f8bjCsHVZAWYB/93A/4MF05blZLP1lxQTnDNoD1bq6nF5ZALiHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174902; c=relaxed/simple;
	bh=auvXKzScLMLWAPUpcElkRY4hbpPSU26JbpBTTwvFUTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pa8r4+4nyuN4GrJvhxPQEd+6owWDQgRwRnvLOpgpfXCQpx1qgD5eZyNzlVdU/nucYYU2qdg0YcjyTWoOOqmpo1YbczJIP+9FD44+5co9YMoioD0X6pPPb2lCwVBnA5NAC5+uUy5tcUmAj/kDQydw3QRzcHxr3wauR8XKevra6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jj4hTZe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clcSJs+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jj4hTZe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clcSJs+h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wLjF1444458
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tt43oi9uSpsFe98Xg/j8VTDF6EllJwHWMX6RvjzVWFM=; b=jj4hTZe11f09Y48z
	JvdA3fVFBNiXblTSja63f01ngs3p50cHXsv/qkkGJLcPM1nj+bulnGCU9HV3nc42
	MLEDO7B7/80QhJ9UFfbNkPuz9i9wlEZEOAWPR68mq5+dZgyr940x+75PY5aMfJnt
	POwYolXmZyW0a/BQ/3QeYf8nhio0Hce7++zhUiP9TGye1of7NjD97i+nmJ8I9yq5
	wPWZrHk1P3sfNMn79R7Xy3WGseP9kqlEVOI9IlGE/gsqUZf7Oi5GgNpQNWsOewfa
	E8FxyHosc4NBaWsNZRC7CoL2hUfvLh9v55wv60QTio7FE8UfK1DoOXqhgCLm5dsd
	GBz4Lw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehv9w3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:08:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c890bac374eso15364138a12.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 21:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784174898; x=1784779698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tt43oi9uSpsFe98Xg/j8VTDF6EllJwHWMX6RvjzVWFM=;
        b=clcSJs+hlTvcEGmdES+Ne7NdobRnkGkw0lYUBNiyhcvIaeoPJOXPlPTfOylxTgy66i
         v166GJCu5KI1tX1fUCIOx9NRBxxy04D+FBlvQQfRUIettp5c9f7pWE0zO034AO0Dstsr
         T6dZHUrlPtNA+3YZPZT5nnrVO10rim9RPp7jwQsEd077CG7o6bCWP2Thzwgt8nKjhHP8
         qk01G8qThhEx/sUD6UTF9WyIqM8Bfp6JGQ0hD92+YMwhf/fHf89lU8qB6xBsNJkdLy8u
         YN2pSBhxNVavIXcG3541IF7LM+WbjPziTLGGGiQCZHiAzEyM4Wb6j8BMrCnQu7RrW0oX
         pfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174898; x=1784779698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tt43oi9uSpsFe98Xg/j8VTDF6EllJwHWMX6RvjzVWFM=;
        b=JDF2moqn223/tdRjDrLUqvD0NHsRoRUBoQcRfa6M6IHTfiGcOP8w/OBgTQAlHQXWOT
         XymcMYaZX1z4zxX52eisn6m1Gs4yidpGXCAlrCZLm/D2j04lrFtqFF2j1vRkWo8oa51y
         YXjxBeafeGBQNvl/o+Z3MyvzP/2pEMmm2ST4X10SA9HRCwr7vpNuTPyr70WxJ8PFVSTN
         3wVi6ZEGl8uBJKAWhEa0/kIb5MdjV9W2bwrmpQdiqd2Oc3c5lL8lOJu7M9GmD+Fn1k5S
         bLVxtM+p8b8BNEbwEvLEYJ2Ibkgu2GsiKR6VHn+DnU5dt95a8N6qPt20nHMDr/LgRSop
         sBAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp99nBpJJ/wxAUaiRjwz3+p0KUPefb+uQgVU1w8Io9fZdNqRaXwPCjiUWInTap6/OHDN8TuyNhdUJRS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyn7iZiJzWXggj7HEixBPCOK48CkNSqXt3X7n1vWyE43qp3Ws0
	4VTU7RslwVHTr3fxCSvlOSwRIZwYTi3gzgvWd5hw0MV7hmgGmN4HZFbUHoS3IEtCodSun63KeIC
	0ZiVxAYTYZOHVHdM0AJ6oebq1dFPPb7IUifYWwMM/tsMF9Rrdb8qJToa534eVXvVg
X-Gm-Gg: AfdE7cl6/0Q+Mpd0JL0NlaodWAJRKWhGIcnr37vfFRM7xJfAvKLmbV4v0i/S+JsL0zj
	NRt+WbobdxQ6NPlv1qecG6OHSZJSIZcq3qkL/kLBEOYcGfg9A4xI159Q6eXgcDFuN2e+G/0UQKr
	UXDlcWW5zbokBQaItmcQq2NMK5MRVmWHHnGsjteovj/UpzLdRbqOWJjZ+BlpzO90im0ahaaMLAR
	yvrbmgT8ND61EAfJ1CQmxL/WkR7/rCEGI4viTOwDMC8GcOFV6hNYGj9bnZhOj0HA8+Ke9CTPiGA
	ZoZq6nXFogY9qygAsgBuGxNPfZsLpBfM6GK+GJThD9EOiwIkVWc258m7Ez5qAK7MGtonaYe9wC5
	vdse+F4smmo/MPR6AksBfyrksRsi7kY4=
X-Received: by 2002:a05:6a20:a109:b0:3c0:9c19:65b8 with SMTP id adf61e73a8af0-3c36c4447fcmr6024537637.64.1784174898245;
        Wed, 15 Jul 2026 21:08:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:a109:b0:3c0:9c19:65b8 with SMTP id adf61e73a8af0-3c36c4447fcmr6024504637.64.1784174897683;
        Wed, 15 Jul 2026 21:08:17 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm7623907eec.17.2026.07.15.21.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:08:17 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 09:38:00 +0530
Subject: [PATCH v2 2/2] clk: qcom: Add support for videocc driver on
 Qualcomm Maili SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-maili_videocc-v2-2-7ed5ab140770@oss.qualcomm.com>
References: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
In-Reply-To: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a585933 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F0qgNhY56VeKpUo0egcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX9xvecnD+sq8e
 nGlSuttrXviS9wrDkQ2JO2ctHxo/zeTpbjBtvhV0Sxq3AJaCj6NHuKabvRgNBXjpa19XpTELjKB
 c9+BErnh/lT3EC9grLE4RDa5LCiXGkgJAyVqV3FeltXPr8AQJtCdH7hNkMqAnhNa39CZcrM5twt
 vCJEpboK/laS1V7Yb21hcVYbelLjfc35f+SfZUTqh7L3D7JjEMbIWf/dkcJffrZDzU+eugnVb8K
 lx5BKFUOX7OtlOewoA1nga73DajGIO1bvq/dz4sH+4oVdwHUL4JKybES4j59C3TKYy3KoCNRUYi
 val/x0f4Q0AZG8IFVMfDCc4LiKSGa2WnSJwx/BlJ3JT1tN97eyxaLDKXkJVjCRhVuSz3B3XXDPP
 CQG22+3eeRTvvMnFQ0gqLPLj1yHQ1mzNtzUrUPkDcMQiXWKTi876R6OhXOBh8cZ1QR+2JgouIdl
 8HcQ8L4oGnTuLi0em5Q==
X-Proofpoint-GUID: RYE7NrHG_xpXGsko7mWbGgf5Iw9-YfPa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX4lq1UMlO1+VH
 j4a7TZ7txUhZ4G3jtg+k+WXHOkljUqUDl5FYw5ZFauy4ysjR4rWbO3PSYJV3St9EKpx3avMetoA
 j6dfkGR+ZYZ+QRoxcAvkBmckZzB3dXw=
X-Proofpoint-ORIG-GUID: RYE7NrHG_xpXGsko7mWbGgf5Iw9-YfPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160038

Add support for Qualcomm Maili video clock controller driver for
video clients to be able to request for videocc clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |  10 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/videocc-maili.c | 660 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 671 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 63f271aff1771bea0885fb753dd28d02fd7d4ab6..690f0b6fe227ca449274d3606f7ca6a9da23a5ab 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -181,6 +181,16 @@ config CLK_KAANAPALI_VIDEOCC
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config CLK_MAILI_VIDEOCC
+	tristate "Maili Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_HAWI_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Maili devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index db7689ee5dc63bc8b7d12b8222188bc1e1ff78ba..bb5e3dc7073340f895d3e1108f243c8d66b84b4f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
+obj-$(CONFIG_CLK_MAILI_VIDEOCC) += videocc-maili.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_SHIKRA_GCC) += gcc-shikra.o
diff --git a/drivers/clk/qcom/videocc-maili.c b/drivers/clk/qcom/videocc-maili.c
new file mode 100644
index 0000000000000000000000000000000000000000..640c1802f4ace38d3568df70043dc20fa8ce6a7b
--- /dev/null
+++ b/drivers/clk/qcom/videocc-maili.c
@@ -0,0 +1,660 @@
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
+#include <dt-bindings/clock/qcom,maili-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+#define ACCU_CFG_MASK GENMASK(25, 21)
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+	P_VIDEO_CC_PLL2_OUT_MAIN,
+};
+
+static const struct pll_vco taycan_eha_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 360.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x12,
+	.cal_l = 0x42,
+	.alpha = 0xc000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0x0,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll2_config = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0x0,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &video_cc_pll2_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL2_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll2.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(1000000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0b_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0b_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs0b_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0b_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0c_clk_src[] = {
+	F(360000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(507000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(666000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1104000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1260000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0c_clk_src = {
+	.cmd_rcgr = 0x8048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_3,
+	.freq_tbl = ftbl_video_cc_mvs0c_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_clk_src",
+		.parent_data = video_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x8194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80d0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
+	.mem_enable_reg = 0x80e4,
+	.mem_ack_reg = 0x80e4,
+	.mem_enable_mask = BIT(3),
+	.mem_enable_ack_mask = 0xc00,
+	.mem_enable_invert = true,
+	.branch = {
+		.halt_reg = 0x80e0,
+		.halt_check = BRANCH_HALT,
+		.clkr = {
+			.enable_reg = 0x80e0,
+			.enable_mask = BIT(0),
+			.hw.init = &(const struct clk_init_data) {
+				.name = "video_cc_mvs0_freerun_clk",
+				.parent_hws = (const struct clk_hw*[]) {
+					&video_cc_mvs0_clk_src.clkr.hw,
+				},
+				.num_parents = 1,
+				.flags = CLK_SET_RATE_PARENT,
+				.ops = &clk_branch2_mem_ops,
+			},
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x81b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_clk = {
+	.halt_reg = 0x8134,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8134,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_freerun_clk = {
+	.halt_reg = 0x8144,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0b_clk = {
+	.halt_reg = 0x80bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80bc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0b_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0b_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0b_freerun_clk = {
+	.halt_reg = 0x80cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0b_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0b_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8164,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8164,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_debug_clk = {
+	.halt_reg = 0x81c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x81c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x8174,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8174,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x81b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x814c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x80a8,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_vpp0_gdsc = {
+	.gdscr = 0x8120,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0_vpp0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_maili_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_FREERUN_CLK] = &video_cc_mvs0_freerun_clk.branch.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_CLK] = &video_cc_mvs0_vpp0_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_FREERUN_CLK] = &video_cc_mvs0_vpp0_freerun_clk.clkr,
+	[VIDEO_CC_MVS0B_CLK] = &video_cc_mvs0b_clk.clkr,
+	[VIDEO_CC_MVS0B_CLK_SRC] = &video_cc_mvs0b_clk_src.clkr,
+	[VIDEO_CC_MVS0B_FREERUN_CLK] = &video_cc_mvs0b_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK_SRC] = &video_cc_mvs0c_clk_src.clkr,
+	[VIDEO_CC_MVS0C_DEBUG_CLK] = &video_cc_mvs0c_debug_clk.clkr,
+	[VIDEO_CC_MVS0C_FREERUN_CLK] = &video_cc_mvs0c_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+	[VIDEO_CC_PLL2] = &video_cc_pll2.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_maili_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0_VPP0_GDSC] = &video_cc_mvs0_vpp0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_maili_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x8178 },
+	[VIDEO_CC_MVS0_BCR] = { 0x80a4 },
+	[VIDEO_CC_MVS0_CLK_ARES] = { 0x80d0, 2 },
+	[VIDEO_CC_MVS0_FREERUN_CLK_ARES] = { 0x80e0, 2 },
+	[VIDEO_CC_MVS0_VPP0_BCR] = { 0x811c },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8148 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8164, 2 },
+	[VIDEO_CC_MVS0C_FREERUN_CLK_ARES] = { 0x8174, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x81ac, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_maili_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+	&video_cc_pll2,
+};
+
+static const u32 video_cc_maili_critical_cbcrs[] = {
+	0x817c, /* VIDEO_CC_AHB_CLK */
+	0x81bc, /* VIDEO_CC_SLEEP_CLK */
+	0x81b0, /* VIDEO_CC_TS_XO_CLK */
+	0x81ac, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_maili_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa010,
+	.fast_io = true,
+};
+
+static void clk_maili_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Enable clk_on sync for MVS0 and VPP clocks as per the
+	 * hardware recommendation.
+	 */
+	regmap_set_bits(regmap, 0x9f24, BIT(0));
+
+	/*
+	 * Update ACCU configuration for MVS0 CFG3, MVS0 VPP0 CFG3,
+	 * MVS0C CFG3 GDSCRs as per the hardware recommendation.
+	 */
+	regmap_set_bits(regmap, 0x80b4, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x812c, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x8158, ACCU_CFG_MASK);
+}
+
+static const struct qcom_cc_driver_data video_cc_maili_driver_data = {
+	.alpha_plls = video_cc_maili_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_maili_plls),
+	.clk_cbcrs = video_cc_maili_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_maili_critical_cbcrs),
+	.clk_regs_configure = clk_maili_regs_configure,
+};
+
+static const struct qcom_cc_desc video_cc_maili_desc = {
+	.config = &video_cc_maili_regmap_config,
+	.clks = video_cc_maili_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_maili_clocks),
+	.resets = video_cc_maili_resets,
+	.num_resets = ARRAY_SIZE(video_cc_maili_resets),
+	.gdscs = video_cc_maili_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_maili_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_maili_driver_data,
+};
+
+static const struct of_device_id video_cc_maili_match_table[] = {
+	{ .compatible = "qcom,maili-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_maili_match_table);
+
+static int video_cc_maili_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_maili_desc);
+}
+
+static struct platform_driver video_cc_maili_driver = {
+	.probe = video_cc_maili_probe,
+	.driver = {
+		.name = "videocc-maili",
+		.of_match_table = video_cc_maili_match_table,
+	},
+};
+
+module_platform_driver(video_cc_maili_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Maili Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

