Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B305304D4
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867892; cv=none; b=p7tihdOgRG/aSOqY8pLlEGviRXj3aNJV0pxT83cvuNTv1M5MCTxsidYzSXwJ0Il44mc2EQbnBWmC2dPCx97+VUaUTxCYRHIKdHFY0fiLRC7zFu7KxcPx1Kv7sScvz38E3UtjoMEUDb7tSKnLMFV4yQa6JfGpH7lgPWZxePYiaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867892; c=relaxed/simple;
	bh=p6rhljcnBp+jXz15wzZQhMoSueg/QNRofByiFqfod3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uqu5HRqUDd9JoYPF3Ab7emWeqsbpNc14xXuHLd9rKQpLUHGOD/IIjEaUTUtR7K+ky2VlW/OMUVzhkc4Si8X6xFPCnGSoAU7IoIn8YMIIRBuAzVvMSd+ds098oD0oGtxOkc1UF2KPmXJBkxDqeexKMVUblM+bBG5VM6/kBQK+8Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbclvA3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WM8VF8vs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbclvA3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WM8VF8vs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjHUi2830072
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dHXHAeNe23JwpU0+Wwv+s8PNSaEhZzJ11+JoEi3jlM=; b=SbclvA3Zjjpah1F9
	zioa/ZAk7hQz5nmbb7Rra8eQPBk5eJ+zW77EfhAg0E9rxX+c/7iwktYoPXNAZIYI
	kEhM0UsXN2ZZvG7kidITCHibVDm+YxJi28RdqEUyBNELTlV702tpvYkTvi2yCDTB
	7/6NbjMkVO8yVCvHZaq3QyoO2uwRPql5wHo7lpNJtmJpOWc7BFdakaRPd782jWM8
	uasS9ML7dni6r27N9AQyHIXxF0yOytQ6INaVG3HTTL3X/SelIKifpNvImySSjeP/
	fMASSWYaDPY+MrRrU6WJRkXP619K+G/yudr8z1mvRsG1v9X7V/IwK7/5Tt9Ub2Ej
	jEo6Dw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5bnm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:18:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso5518260eec.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867889; x=1791472689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dHXHAeNe23JwpU0+Wwv+s8PNSaEhZzJ11+JoEi3jlM=;
        b=WM8VF8vsncNl6Ql+RI33xK307ApOM9yXqoNCh3gBHbDl51ViD00dyLmhw5+w0h9Pg1
         3oDt5/LgzDiOT3lJyKcTYBenhlH3pFuqJkMM/5mwr+BXUtw/lCP00Y279JFpWBhjg1Jl
         aFGQob0Hl8IEVZ7XS1n6ujic40cH+7HyBCY3KyvJiZjmau+78NWx2KayiPho7NzB1pW6
         jttb1NuJ9MBAswTdI7taRVlF0hgpy/jWgdHcK4ULavo6B2+xep3CkZ9VxU7Z6MwPTluh
         YAUxN13AyU3Mzvu74/zKhMAEKrh8LsH41vkN9L/W4QXd/C0oBwzHvv0GMgH6Q5CvGDXU
         PLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867889; x=1791472689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dHXHAeNe23JwpU0+Wwv+s8PNSaEhZzJ11+JoEi3jlM=;
        b=Yh6NmdAl20/Hn0ysoT2aW9B7zFShiUXA3ib5rB1atAoLSlfZAJyFPqAAw9B4csaMhk
         RhI8oCkqJ04l/7X5Kqa+vkdL/prbr9M31nht0qqTsohhOQ8Bs/UqdjWPkAD8IhKcbk6z
         lEsfjfJj9KJT72gkHTpFOje48+Shm/abrCD8JtQyTUA6vVI6Tt3z3V3lK79t+H1TJd1Q
         jJdsYOYNN5pg4KMIDTL61XAyG7vVmCX2i2vQd68KrEzYMs2HDfFxremlZPMxftyjS8cN
         ce+FnXpBSGEc4D/HkQdhZyFSak5gUXMKRPW/kOEvA6wKJY9k20ijHIlgK4uWl8zo12Ee
         oaGg==
X-Forwarded-Encrypted: i=1; AKwUvBxl7+511Z6MIvOGogkFRvnn509mdq1NKQgYPIR0iHSX4FDrfj4pbxsgXCkKezSpQiVWbpbZfds826jC@vger.kernel.org
X-Gm-Message-State: AFuF++kYrTty8MD6776mYXavuJjM2vh2Hzyo7ZhyvmM2iNoHis6tvMkC
	Em+hOgUXBfb8HIaCatCelThFP4Z8U1z0Ehk+twVrOloYraLNzX5CqdwQh5oFGJZ8nNmt9wiozFN
	fZX1U32zkUHxrFLIhkIpRI7ic3wRsi88ahoQPBYUMyVA53Kd0xo5//I6iuOBYnUOL
X-Gm-Gg: AYBFou3plJxkCU1HXwiSqfm4PKjNLqD/YV5X3UPCRu6llQTEthHpcU3f5pk+0MnHeP+
	ckXnc19d06k+rtvYqtyGLzL13+GCgWiNR22XAEf5oRsofuPge+tPYg49849PJ2oPrLMIOcuYM/o
	kIgxXGTZCX2nlSZXt6RbEQHNo8EoM8weTNUWtOmwXcpAT9N1VAEuERdBpAlHkC4sej3jZBGph4F
	PvzB2NNHXm1BlrwOrIjIf0SSsJ/nvjaqaOPxlPYC4ibe7YCXN933gI5+nd1n7jNRQay25HPoQFz
	ZedIZcqB4rdtgMt9zoEysGWswnVYtVQXuEdA64Q8K2Tz3J0uErux736mUaIvH2zcH4xUCHV/Cdm
	HtyBCDhk0f72fxzcZY5+FVsg6UtweAIwe0A==
X-Received: by 2002:a05:7300:2a95:b0:34b:e2cf:43b6 with SMTP id 5a478bee46e88-34cdd0a96f7mr5115545eec.2.1790867884495;
        Thu, 01 Oct 2026 08:18:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2a95:b0:34b:e2cf:43b6 with SMTP id 5a478bee46e88-34cdd0a96f7mr5115489eec.2.1790867883658;
        Thu, 01 Oct 2026 08:18:03 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:03 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:24 +0530
Subject: [PATCH v4 4/6] media: iris: add platform data for kaanapali
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=8545;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=p6rhljcnBp+jXz15wzZQhMoSueg/QNRofByiFqfod3k=;
 b=4SC5f6P+PvP4irga9iViCW4zDmymJD+FnIBCMAPf2g5xMOmoUMbJJOAW8S1YYQcBOZW1lc3jP
 uy58z2N5/sVB1HUAyLA+R1hjcPwldPoXLx2rMsRtCX5RUSPha8xEdce
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: wYNlmfWeXn4WVcMrOeR0-uEWLQUHBqXN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXyV2zPa6Mb/CW
 nyfYPOStRtwU3gLW8wayfIw1CQHx1hlFJ+GsrzQ/1YLC8ImbaPIxYrSrlWYK4khCdfUZYMPWtP9
 19p53tbQqx34EvHdWtfjd2cHj5WlZ7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX+J6EHQdov4sr
 KJtHhGJHRh0aKMn0XlKuAzYMVTGcu+24XYPjpk0lIU1ukWimM+9lPxzeFIiL1ik9CF7NzVaUs+k
 NvuuyiOOlPpuMGAVBjfF5JmVidaJL4OCnhiYpn1REZMde3PzeQIcDHHM4r6lO1jxfKdBpG3FTuM
 OBktTJjKy+pq+TxSega86FMWb6iXPa2GPYxIReyPXw4kdqaF/ArPycW1+8Q4HiuMjp3JuYEvza5
 HYxhQIAMIaP3nOH8dHnHv6GWm+CiXDpA8IXgKOhYYengVEdMS9Nb9nOjh4va2TfIPmmA8+NbaL3
 qBV3fOfLkwbtffUZAuNAxc064CT8ecrmTduIItnzGjC7Y4fzhG167n16cB5YMn4SeiRiR9PpS9z
 X5lmTwGhD94rVnTY1QGuu9mmTc8Pg9XsHTlCMALxS6+nG+akFcIaXKUby+AF7BiOHaXpo6k7ZaZ
 k8GCf35xQZYkzJyavLw==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe79b1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Jh6IeAywF76aN7zT5WMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: wYNlmfWeXn4WVcMrOeR0-uEWLQUHBqXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010060

Add support for the kaanapali platform in the iris driver to support
video functionality on kaanapali platform.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  2 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../platform/qcom/iris/iris_platform_kaanapali.c   | 58 +++++++++++++++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   | 15 +++++
 .../media/platform/qcom/iris/iris_platform_vpu4x.c | 66 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 6 files changed, 149 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..65ad965515a3a368c0f4c9115263e101252b7c0a 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,8 +12,10 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_kaanapali.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
+             iris_platform_vpu4x.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..e8ed0e7c769f37443148cb9418d4efafdc21485b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -39,6 +39,9 @@ struct iris_inst;
 #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
 #define MAX_HIER_CODING_LAYER_GEN1		6
 
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -54,6 +57,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 extern const struct iris_firmware_data iris_hfi_milos_data;
 
+extern const struct iris_platform_data kaanapali_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.c b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.c
new file mode 100644
index 0000000000000000000000000000000000000000..cc7529e22d84a0a9bc55ff528686166b2f3c6a87
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+
+const char *const iris_kaanapali_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core",
+	"vcodec0_core",
+};
+
+const char *const iris_kaanapali_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vpp0",
+	"vpp1",
+	"apv",
+};
+
+const struct platform_clk_data iris_kaanapali_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_AXI1_CLK,		"iface1"		},
+	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
+	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
+	{IRIS_BSE_HW_CLK,	"vcodec_bse"		},
+	{IRIS_VPP0_HW_CLK,	"vcodec_vpp0"		},
+	{IRIS_VPP1_HW_CLK,	"vcodec_vpp1"		},
+	{IRIS_APV_HW_CLK,	"vcodec_apv"		},
+};
+
+const char *const iris_kaanapali_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_apv",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+struct tz_cp_config iris_kaanapali_tz_cp_config[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda400000,
+	},
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
new file mode 100644
index 0000000000000000000000000000000000000000..33ac3f5aad9149d78d8f4b83a0d6305b7fa09b2d
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_KAANAPALI_H__
+#define __IRIS_PLATFORM_KAANAPALI_H__
+
+extern const char *const iris_kaanapali_clk_reset_table[4];
+extern const char *const iris_kaanapali_pmdomain_table[5];
+extern const struct platform_clk_data iris_kaanapali_clk_table[10];
+extern const char *const iris_kaanapali_opp_clk_table[5];
+extern struct tz_cp_config iris_kaanapali_tz_cp_config[2];
+
+#endif /* __IRIS_PLATFORM_KAANAPALI_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
new file mode 100644
index 0000000000000000000000000000000000000000..0d515adf331d7f451408826136539e6b6fd4a1af
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_hfi_gen2.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#include "iris_platform_sm8550.h"
+#include "iris_platform_kaanapali.h"
+
+static const struct iris_firmware_desc iris_vpu40_p2_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu4x_buf_size,
+	.fwname = "qcom/vpu/vpu40_p2_s7.mbn",
+};
+
+static const u32 iris_fmts_vpu4x_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+};
+
+static const struct icc_info iris_icc_info_vpu4x[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info iris_bw_table_dec_vpu4x[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const iris_opp_pd_table_vpu4x[] = { "mxc", "mmcx" };
+
+const struct iris_platform_data kaanapali_data = {
+	.firmware_desc_gen2 = &iris_vpu40_p2_s7_gen2_desc,
+	.vpu_ops = &iris_vpu4x_ops,
+	.icc_tbl = iris_icc_info_vpu4x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu4x),
+	.clk_rst_tbl = iris_kaanapali_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_kaanapali_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu4x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu4x),
+	.pmdomain_tbl = iris_kaanapali_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_kaanapali_pmdomain_table),
+	.opp_pd_tbl = iris_opp_pd_table_vpu4x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu4x),
+	.clk_tbl = iris_kaanapali_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(iris_kaanapali_clk_table),
+	.opp_clk_tbl = iris_kaanapali_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu4x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu4x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = iris_kaanapali_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_kaanapali_tz_cp_config),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4bdb078d83b5c331869dab2409bc4d10ab302737..be3e799edfbe4e13321ef1ecfe6e558eb7a69e01 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -427,6 +427,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,kaanapali-iris",
+		.data = &kaanapali_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.34.1

