Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC363B3C18
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726519; cv=none; b=HOyqidP/45g5UXE2/54dblUuKLTUMXJHQKWTLMt/dXyPDHR5OsHfch+bcw+ZEKXeL36LXIiY1V9g/wxyj1lGyoKi2cHaTJiEZwbusjod4Ur2OjR8iFZTNfw2YtazjX3I8plfEfSHnrOLu44ulM0SsCqbZ4sQ9PgUyif9pQjIEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726519; c=relaxed/simple;
	bh=PxHF1bewvUHGmm+Vl+yr/gc5MteATxEgqqnHG+cAveg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvWjTJbHxS/I0NskgfjlppD1OXt69+ZZkIbTo4ZiyfaF5eVt/m+ZB2k6CGUbjEKImKY8pJfcrX5mVlMExVBEOIKtiUvcSVsTkAi0vVx4Z9tSPsIiTCpD1GOXqRjfdvf+065Oh/whnumEM/lotvXtaVf0ib1kg537T8cOWlrwNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTgP1M5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwV3qRY3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTgP1M5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwV3qRY3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397KhtX1071849
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JwwdcGUFGZ6O+KgMKzeP7gtGYmrhUcxeEoLx0KJzLKg=; b=CTgP1M5PGMUS8o1u
	YCuRuncXRZY+S1Ka8N0mUQAhYGFaZqx+msiLETNJgmIZRKAzcOVrMUZnnpBsT5+O
	crorzEMTqU3R3/ovH7NMXRnC0LqLxWQqk2NfTTbRpU9s9tXM4IQxMz3JwpfbciDS
	eIuDJv9I9J6WOeNuqUkxznJgzXsuJgL7p+9yzB10438DE9G9sXhMd6mV7LMTqumh
	peF4Gn3E9u2aPR5zB2IflblI2k/lsjv7qAxgJZYAz7/vczXFPG6yvQyJdvZbyG09
	lXdK04tinXORi9HGc+0ZF2+ju2r8zJqoZOlqS4dplKZXcGFT3fL5ejP8jHmbm1FK
	EIdlhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb3bbvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:21:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242cbb97aso7331695ad.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726507; x=1776331307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwwdcGUFGZ6O+KgMKzeP7gtGYmrhUcxeEoLx0KJzLKg=;
        b=JwV3qRY31oGaKkdEzQ7+Rc2eh9Nsshuw0pCC0FqaDWy1rDe54Kp9dTuvg3fxzrFKCm
         ck1Aa6XysGvhtZcx524FXl+g6qDN7a3KA1YN9LjKfDahXtos8cSPd6gCfM5LeQbbgMmH
         noW5oA41GXIxX5+ywYHR4ltDYZRxgvEsTIasqWiv9hlrpdWZyBDojgglvioduzqPt8YD
         uDMiUWS67R7QoMwn+q1i0ltxy4ogrRdaZ75+3U/xvpqzGrpAiAIOnScR/FAwhrTZHUIV
         MDkEwQdjFUl5JX538uFkTxFzUuLbWFlT8e/NONXaBzUCL1mniWS/3PmcmtOX9L/6byr2
         aZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726507; x=1776331307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JwwdcGUFGZ6O+KgMKzeP7gtGYmrhUcxeEoLx0KJzLKg=;
        b=Ntzp7OpXktHmfHc+5ajXSr6c/NeJ19VoWAc0rOVClwpHNolsvQnAHvWnogp6AGDLQO
         LVyAA5sT8KD6izADigdJ/gUIBm5ZHAJX4iwrsYK4EeyL01KJDW2joXdp7HmHeLcjfL5c
         DzmvEYh0wqkD0YcGPNpQshhSW8A/3nQW80kCE+4eZoS4YGlMnmu71PER1Qu8G5bg8xLW
         a1xyb2AplDQGpESMWGZeurDzF1m40s03Qu/G8W1dmJHRezg9VTjXhas+tjoT0CAyLm3t
         6Zb7jnSK7lB4xSXuqRZM60woWyIqpGvSAg0NtAblLRZYAaP6xqXvHgGGYtZDtQT4BJWj
         +ByA==
X-Forwarded-Encrypted: i=1; AJvYcCUhOIzFJIdFQzPXbTrdUShazlV4ClwqAulh3Fx6svEMUXYuWrvXwNB1FAewjZgwSkVBiadBL8Ay31tz@vger.kernel.org
X-Gm-Message-State: AOJu0YzKW9pbw3hrFNnR0UblFKgMb7wA1EYzAvM8L8iUeU6rw0v0xm6r
	t3nomOl/qpCXtA/GD60YekhUWWLD0uUj2Je+b8RbQGyIRoKpT+mb8VI6E5rmaoYVUZlx+/ON2dN
	fyb3J3JP9yr7VDLHzu1GHvMVKySLI0irFiHz+CREve4skXTcPq8KSKBjwn5z1i8iu
X-Gm-Gg: AeBDieu9r+IJ7AsVcYgzjfnJUQfq+cR1dxlVjkRNMCLuWhvspMNxEWlR9oKyE8wpjFr
	HIjdEbk/3xsvBvIuOQDvLJVq29Hvfgf5WjEEm/uYuStNnr17OEAUvOj6PuR2QOq2iNni0OYn/8p
	/lNzL+TwpZGavSUQWQo/TKumBGjHxestC7L7MiIsySK16HbBoFjqYYzsLhu+c1BW/DKXPJjRif+
	Pf9ywbfgpb5aZYXUEQa9iNbbVNSZ2E3y6YL4yYS3ttqZnGOpFVt6dl/Tn27zm/5pDyEeK6kE/5M
	0gLlLPN2ewH6Avnc42RRAYlVZ2pMR3Fxihs5RWrXoHvpF5mpngDixOf1vjShbuNvlYl2NkjXC/f
	0jAh04NVWcc01Se07lcIW1APbNNvaHdo7ZU0EQ8G5Si6yhzN0HMjW
X-Received: by 2002:a17:903:2c05:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2b28183277emr268338535ad.23.1775726506429;
        Thu, 09 Apr 2026 02:21:46 -0700 (PDT)
X-Received: by 2002:a17:903:2c05:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2b28183277emr268338085ad.23.1775726505680;
        Thu, 09 Apr 2026 02:21:45 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:45 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:05 +0530
Subject: [PATCH v4 3/7] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-3-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX4a5P0nz3Q7Lv
 8vc+jAdo7a0hHpUgRj2KjYyf6Zpt41LPAB9AwuNS8AVciwY67JLPNb1MWNVJ7H4FoANvnAqSOGP
 9aZwLfR/GNjcgI9Q3G9wIHGuhubPPlNmYdPItQrzpFiumKsV1vdLM6Re40dwnJc+drc56WZ6B1w
 8jniodxbnBT/F9qJ4/GYADWNxz7imxovR+jNIRDNhGq5uPR3HUB5TF1WVH88fzrA8ulWiStP/Do
 SIkIzHQWNM2xlxPL8V7jQou9dpiDUBqlav9sYHw2jWREM8L/nuvuoHOGGB8DnlS6UiNp/Nj86RM
 ZdmOJbp70vDmrqarU8/n4QVfIrOfs4LQu6Y01i8xemOp7R7BogRSOSyuzz/pSeJk4vcHHnrEjyt
 hGfK9VmeHyI5KtFV1xYCRNprNvUL4fHssKTM/aCoA0EDIsUBsAlq3Ip56zUofH8VRfr+ELLQfa6
 fOu6hxPeX1PipIXaF8Q==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d76fab cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RKjULyPvNO9injS1lHcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6VmStduXeflnAMvqjsF9xuGku0RBvhOu
X-Proofpoint-ORIG-GUID: 6VmStduXeflnAMvqjsF9xuGku0RBvhOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090083

Add support for the video clock controller for video clients to be
able to request for videocc clocks on X1P42100 platform. Although
X1P42100 is derived from X1E80100, the video clock controller differs
significantly. The BSE clocks are newly added, several cdiv clocks have
been removed, and most RCG frequency tables have been updated. Initial
PLL configurations also require changes, hence introduce a separate
videocc driver for X1P42100 platform.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig            |  10 +
 drivers/clk/qcom/Makefile           |   1 +
 drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
 3 files changed, 596 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8f55f10261ec2dd4add61101c5619cc4516f7d66..920d5e78e57d1ac62b59eb1c39d1f79c0718abb8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -199,6 +199,16 @@ config CLK_X1P42100_GPUCC
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config CLK_X1P42100_VIDEOCC
+	tristate "X1P42100 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_X1E80100_GCC
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  X1P42100 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_QCM2290_GPUCC
 	tristate "QCM2290 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 103d6c4b860ccbc6b4ad552e9e6af43298a4474d..ae1f3207a20be4c9163a6f7ce9f309f36e80fc6f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
 obj-$(CONFIG_CLK_X1P42100_GPUCC) += gpucc-x1p42100.o
+obj-$(CONFIG_CLK_X1P42100_VIDEOCC) += videocc-x1p42100.o
 obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
 obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
 obj-$(CONFIG_IPQ_APSS_5424) += apss-ipq5424.o
diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
new file mode 100644
index 0000000000000000000000000000000000000000..2bb40ac6fcc57e817ce8f0b6727a571c7c072ffa
--- /dev/null
+++ b/drivers/clk/qcom/videocc-x1p42100.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
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
+enum {
+	DT_BI_TCXO,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 420.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x15,
+	.alpha = 0xe000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1050.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0x36,
+	.alpha = 0xb000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
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
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_bse_clk_src[] = {
+	F(420000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(670000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(848000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(920000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_bse_clk_src = {
+	.cmd_rcgr = 0x8154,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_bse_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_bse_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(210000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(300000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(335000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(424000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(460000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
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
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
+	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs1_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x810c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_xo_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_bse_div4_div_clk_src = {
+	.reg = 0x817c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_bse_div4_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_bse_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
+	.reg = 0x80ec,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_bse_clk = {
+	.halt_reg = 0x8170,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8170,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_bse_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_bse_div4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b8,
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
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8128,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8128,
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
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
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
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x812c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x812c,
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
+static struct clk_branch video_cc_mvs1_clk = {
+	.halt_reg = 0x80e0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80e0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_shift_clk = {
+	.halt_reg = 0x8130,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8130,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_shift_clk",
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
+static struct clk_branch video_cc_mvs1c_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1c_shift_clk = {
+	.halt_reg = 0x8134,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_shift_clk",
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
+	.gdscr = 0x804c,
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
+	.gdscr = 0x80a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1c_gdsc = {
+	.gdscr = 0x8078,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs1c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1_gdsc = {
+	.gdscr = 0x80cc,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs1c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_x1p42100_clocks[] = {
+	[VIDEO_CC_MVS0_BSE_CLK] = &video_cc_mvs0_bse_clk.clkr,
+	[VIDEO_CC_MVS0_BSE_CLK_SRC] = &video_cc_mvs0_bse_clk_src.clkr,
+	[VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC] = &video_cc_mvs0_bse_div4_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
+	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
+	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_x1p42100_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
+	[VIDEO_CC_MVS1C_GDSC] = &video_cc_mvs1c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_x1p42100_resets[] = {
+	[CVP_VIDEO_CC_INTERFACE_BCR] = { 0x80f0 },
+	[CVP_VIDEO_CC_MVS0_BCR] = { 0x80a0 },
+	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
+	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80c8 },
+	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
+	[VIDEO_CC_MVS0_BSE_BCR] = { 0x816c },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x8124, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_x1p42100_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+};
+
+static u32 video_cc_x1p42100_critical_cbcrs[] = {
+	0x80f4, /* VIDEO_CC_AHB_CLK */
+	0x8150, /* VIDEO_CC_SLEEP_CLK */
+	0x8124, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_x1p42100_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f54,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
+	.alpha_plls = video_cc_x1p42100_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_x1p42100_plls),
+	.clk_cbcrs = video_cc_x1p42100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_x1p42100_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_x1p42100_desc = {
+	.config = &video_cc_x1p42100_regmap_config,
+	.clks = video_cc_x1p42100_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_x1p42100_clocks),
+	.resets = video_cc_x1p42100_resets,
+	.num_resets = ARRAY_SIZE(video_cc_x1p42100_resets),
+	.gdscs = video_cc_x1p42100_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_x1p42100_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_x1p42100_driver_data,
+};
+
+static const struct of_device_id video_cc_x1p42100_match_table[] = {
+	{ .compatible = "qcom,x1p42100-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_x1p42100_match_table);
+
+static int video_cc_x1p42100_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_x1p42100_desc);
+}
+
+static struct platform_driver video_cc_x1p42100_driver = {
+	.probe = video_cc_x1p42100_probe,
+	.driver = {
+		.name = "videocc-x1p42100",
+		.of_match_table = video_cc_x1p42100_match_table,
+	},
+};
+
+module_platform_driver(video_cc_x1p42100_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC X1P42100 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

