Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EAE345CC9
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136154; cv=none; b=KVQj8Jt41VjPcMr1TrsKkonjvy4+7b9geNKS5DMjhs5gKltkXbNJHi6Zc+qGCSdEeVD7XZSCdrith0E6KX+sTcOWhYYH65NbYgfpHYapgHOa7cEcHP+9r8RQ04lzdBoHHNVLDW7JiIv1HGo7ceaAG5DTitoz3KBuFm1aqOoOIAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136154; c=relaxed/simple;
	bh=o3XqsC4SJ7IqrDgDbMC5Y6LAmP408Zs+Xm8uiMDGiL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N733QDgktgzAUK9xxHwffn1RM3pwA30zjGHQ2z0CJxTvTs4nMcQcxN0L1BjQOr5OdiNh07dOy+pzrBomKw5rw5SVVldeUgaQ7sE+terFrwGLhWXrJdnH+h8QIwZVf5CuRQik0uUCvlv0tUg7p+IkmdPMzoj81TNnd6fTIoZqxUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYCh8bcF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0EPAnui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYCh8bcF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0EPAnui"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745uKv879630
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qskiMoOslweReL5wBxh+b06iXecSi2WY42VOu1Wld30=; b=IYCh8bcFDB9Ozj7J
	CkXUYbbQvJfLWvDplfGoxm0Ru7PYIHhRQTNNelIYtAYegsBk5ZKFxhflDix3hOPc
	t88rYyjjldeLdelqAtT0MHlO8RQniSpx8+kqLLhnqfI1kQdDzYi/dLNarzhKkDpO
	9hqFrajBhKT1G2w20Zeemuh1bW+Ff5kHo+QxOHam1AMJP+T6QzAkdKQUdEBgMQz+
	82Nq+TTckvlH7nA/T5zQTfhVPRvVWTJHk4gBrsa5X+LWD/gyVp3jYPrXSGKtFGfE
	653eEQNWAG1ogE4ZwRp/wYRhKY6CGJ9fnzL2vRdArTTY+vmvxC8pkJaQpFsTMwI6
	KYAgag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0fbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso6149231cf.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136151; x=1778740951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qskiMoOslweReL5wBxh+b06iXecSi2WY42VOu1Wld30=;
        b=K0EPAnui97DHqzsOKkqRX6KhbjcruaWuYJDzdPsTSi3Q80QRjGUnVcxd9nTO8zuSEt
         mGsUg++hri5xzIsbCJXVcYaIDg8zGXdzqD2RTr3kF9SdVjsWWr9QrOexa6MkmAYazsRS
         jXCFVG0ua9XWu8mvdCXrkho9AnItO51osOe7e+t4n1gEWGRM3m9RbkS7ND2X4ymmsMCw
         mGca3GKmlOhR5F0J1cY53Z5b1+n4v72TajwIRywrS6BT/+rYiQfBcsvxyJtZpbVSd8RM
         A1upiQMQQ+WRq63TcKzGjzNKxq+kWJVgefUa26gFit+9b60CRFmma9LptApiihYVuM1V
         3tuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136151; x=1778740951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qskiMoOslweReL5wBxh+b06iXecSi2WY42VOu1Wld30=;
        b=A2zrDdsfIoYXh8DIIKhGoPhcmAO2YgJRBO0zWKgb9CT64x44LBxS+AMbtXT0h8nf1K
         BeXcIceHT7jofkthu/Uad6b2Mnr6HkwMx6xT9Wp+qKaJdhKKxdM0ZEsYND4l1dqnZAkR
         z4cMbv6qRchcYryEy0CXCsoOUlqVPhC0lEtLvjJR+UNnn7+FmAVrWDjsfXofaruOQJqj
         lZgbTPm0IUshWQLgweo/BeISOv2AzJshT51cljIFPiw4NT0vNRl0EtyMUlYuaDIDyPot
         aoz3ujn00OlgoJSrrQhAdBIooEsFjhrGqBuIEUJDG24kn3ES6gvrg1E/E8IU8fMUXujy
         Urlw==
X-Forwarded-Encrypted: i=1; AFNElJ/wUUjvdRVDtCi2Jixv7+IwNPvZCol0t0UWQjxRrFdXCu+0eX93Cr8Rth6rWIhSfUQ46kLnP09ZvN7v@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6tfDVdx00xqoYvFB8is7gSq3oPhKRXjYh75b/GylI8+GprAh
	tDuCIRpHDTpE5zAu0W1YIcOxV7u5Fr5Y4lTzSBjELUT+kz8YzBNrNK1XqlhmKDEKzBTlbrAC0sg
	kbWR+ctgec/gfIhHVmYCo3+ESAK1Ed1vST3Zum/nPgF8K9IIyyTdrXjyO/P4n16e0
X-Gm-Gg: AeBDietgugzQnLaRU2CxaQPZXa+OmANH9IC1CMtXr+LYA3QmAxQW7vjPoESeCOwSbPc
	nJA3wX6ogr9HJdrZrffmeqSwWW+fOoSsFK9aH5xjnZ/KvEEff1WTl3wX99LtZtOsRDyeDTk4QCE
	BUPmGQOowjQZXE1Y1kZ4X9qZuMjuDmLy4nncJjt43R5EYZxPcnn6Lso+6fafVii9M2Km4cSiwGs
	oQof4n+wwvYBeOXXv+oo47fctvffV/akwcpawh08y8dYlLMr9DBOMW2IAt3bX7xwu1knyD4GlgG
	bsmOMl+wT9zXxpEzZh5RHNFd2VmAY7Whz5AO5TqV1xFbLYYtBJMcK5Z4M4Yz8zEEhhrX/NLcmj1
	nyfPLrSLXfqZTsWzWt9OZqH36mjra8Dv55Om2LrSscRRqR1EioL/p8iVneKOUxPYpC+OGUtsS0D
	Ha+hJAMLH9DVFf+uwYKH6DyTaRAzgpWqaVUTc7rcKneDZnYQ==
X-Received: by 2002:a05:622a:188f:b0:510:1543:31e4 with SMTP id d75a77b69052e-514621e9218mr92455991cf.59.1778136150593;
        Wed, 06 May 2026 23:42:30 -0700 (PDT)
X-Received: by 2002:a05:622a:188f:b0:510:1543:31e4 with SMTP id d75a77b69052e-514621e9218mr92455661cf.59.1778136150098;
        Wed, 06 May 2026 23:42:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:09 +0300
Subject: [PATCH 09/16] media: iris: Add framework support for AR50_LITE
 video core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-9-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8136;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=z72H4ImX+0JDWWXrPRrLSHAWz84g1C7cxTNXO8PfGB8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+fFE7D7JOmtHoDPhepk3lg3ImaXaGna8PS
 OhouYHwf26JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1WFxB/0TAHJkf94Z0bk4VSSgauAjLpuPqrMLUlasGnFo/N05JqbIBJCi32lXhoL+vwZQnJBRj2m
 HU9v3Wn9KqReaOnC/Wht67xjhrIz1R88O/FCNYc0kfspJFTqzndFgS6b4m+X4Sboy/oT139uf6t
 vBE3QeH7gkgK4gNR9ZBo6jXLKf/TgLPCXDj1A7/zkAqcCEB8EbIVXgXFN0pfbRCxTbOfoM93ufI
 eRv4zDYLuhHlN0p3XX62ptfoxN+1wejRBDMoxQvsvzVe5AJFcDneFg1bELdWsYrthoDvIAVfMhi
 sdfHgiTy2roAQq/XyuaoPROW9ToixnGsdJLAqvznc1GdJT5d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc3457 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=x0nZcyIE9sK-8O7Lov0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: B2Nj-MoicfX8cQTDPaWv47PPs046sViI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX4HZKnfJY5VOz
 8jTvFp7rObpkyiFXVFe5g17KxOpKTjkW/1P4p601TbmebCmO7V6HWxmWcO1jGZQdpIcrKXLarX6
 Tja/2GFnU5Xe//nHLVFb2QHhG5dXXfk55p/5WAS62LD9sQTMClPbkcMLbQGDhkHV3c6hs7endrM
 ok7zvfx/X+hibaCLHW9b70gzq/s5dX0rzeeCkKDN6KRehDkXeEkvgzccNj3JbsacoWBQrHidrJE
 gJRyzPrig5Zxsm2YFlisT91G8ZZog3RbTKCHBUfaW+jM7VLwkJw3uUG+HbIta+RwJgrBTIxbw3Z
 kUzjimBWvdQyO/D7S4MSipwfXGG70qLy06QYP11aN6aWBYsgevj49r2IO2PjISaDoeXqrhgMfko
 oJ0Sx85I7b37Yh4Jdrzrv2D0kz98W0/07/40sUYepxoxgxuwfB9zRbPqtEy1/J1JV9CBJBAHcdb
 UtQglM1TSKvyJU1LYvQ==
X-Proofpoint-GUID: B2Nj-MoicfX8cQTDPaWv47PPs046sViI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070063

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 156 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   3 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 5 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..f1b204b95694 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu_ar50lt.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e1dc226066c1..4a0895bf5720 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -63,6 +63,7 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_THROTTLE_CLK,
 };
 
 struct platform_clk_data {
@@ -283,6 +284,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	bool no_rpmh;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
new file mode 100644
index 000000000000..688b57291a81
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
+
+#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
+
+#define CPU_CS_VCICMD					0xa0020
+#define CPU_CS_VCICMD_ARP_OFF			0x1
+
+static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
+}
+
+static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
+{
+	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
+}
+
+static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
+{
+	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
+}
+
+static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
+{
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
+static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret)
+		goto err_disable_axi_clock;
+
+	return 0;
+
+err_disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
+	return 0;
+
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static u64 iris_vpu_ar50lt_calc_freq(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 mbs_per_second, mbpf, height, width;
+	unsigned long vpp_freq, vsp_freq;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
+
+	/* 10 / 7 is overhead factor */
+	vsp_freq += ((fps * data_size * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
+const struct vpu_ops iris_vpu_ar50lt_ops = {
+	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
+	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
+	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
+	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
+	.calc_freq = iris_vpu_ar50lt_calc_freq,
+	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
+	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
+	.disable_arp = iris_vpu_ar50lt_disable_arp,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index b8300195a43b..f3607c0ca847 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	}
 
 	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
-	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+	if (!core->iris_platform_data->no_rpmh)
+		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 71d96921ed37..f00e2de5fa53 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);

-- 
2.47.3

