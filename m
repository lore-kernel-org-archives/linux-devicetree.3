Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607FC3EF67D
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705775; cv=none; b=gBIVAUTS6PbJsYvhlyPLEGsfmlQI14hOzk+P2R8eOWatR25LqnqA4BgMnnxecKlCaIhysNoNoqqgzY5sWRRzH7NswpXa7YoQG1TDhCzq+O1Gbjqi6N6Ylf/EsSzdjl2zSjCt2EeXl5vEpFGKq5M/38xjRP98g+RZ2XFNBgaESrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705775; c=relaxed/simple;
	bh=VDncICb4cyA2swdK3ezYrt+ezqlf7ozvYxBHzhEQoVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUUQCgJAnBYmIi17+dPeWmXJsi1EWewvL9T4RARFNy4D0ilpStqL+o2mPIHzn6BFCCsMyIpWjn7i2I+yG+aKCSNoxq//Uz5TrQvc/pqdnBXfBBelTO+mSvZ0ma09P8G9pcYmp5bufgRouZI0Tq8/aMijHEkfFpIpRpKbvRXtMYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zws8HyDo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDZF9aR+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zws8HyDo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDZF9aR+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UW2R262831
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbRfDSJoMUHlkBQLK0yHnHTYPiVwydvfPWthJ49O4cA=; b=Zws8HyDo3suRXQDt
	kTImm9n1+zXC4X1NRtqCg1wQ8kYu3hFWlMkHr/E3CEUrHc92zvrjjN54XtU5xlSn
	ntT+TmX6rk+D6xsYfh2DY9QYlGXU2WQrcYF7XciRmiyMjAUQO52lhfagwdynG+w+
	eYTytoCOKKbVV1L06wzn//9ZsSzn6E8SmjsdwFbBrj5RxcF9OoLCayCatL3c/o/F
	meSJOIeIZ7GmnBZoAa8vRvERLljc6GmCYBmia4McSGPeDhXyy0faSmrGusfFttNb
	BQLQDZY0J05ze0jr/usw9XEm/aYLnQtpF4r8Q6ZDYot93CjfNLilwIc4ZKLlceEZ
	8zRdMQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg41a6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:29:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so412506a12.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705772; x=1790310572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbRfDSJoMUHlkBQLK0yHnHTYPiVwydvfPWthJ49O4cA=;
        b=eDZF9aR+UsJpL+y0WoKeVMOlL/MyP7q7qo859PBLH+ht59Wc0QKWnwr7VPUo3DZTTL
         BhYXfdvP7YX+Ne0zvinl/uOjr4CcdPI25jkdxSUlHvF55plN1lwQ2Oz1x/G13qUJkSab
         ZoU0EEgdG9wNItyCsYtDB3ZIB0CCzhIMevpcC6dU3v6rNt1MLvIJ8OEkA9pbnrymRIZg
         PVLdIytVm6aoKKg//67pRWAgm5jbqcS8zRwV8dRapR4q7YK/IomiNck2iahxVeeHrUHY
         NJ2/P5LrTmMacHJfWvKp5P5HQjuZKNuTojHXkEWR6JQXcZsNbDNWEZN1wOAY+GQ0bW04
         dgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705772; x=1790310572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbRfDSJoMUHlkBQLK0yHnHTYPiVwydvfPWthJ49O4cA=;
        b=ozvCiShEYLTTnUX6ddeVIv0qH8k26tDmOiiM+Kd9Bddpona/dyIA/wcEiUi0loLUBo
         5EbnABih9QWsRDqObmi8grW7LHi0g9rOdKJLTEkeSfGwkDP+dyWUNhU2iyiA1Ecpou0z
         TsqebRwRd4EvaYLErTOzeRyKhWHOzp+jjKnMH4ZqHYTl1U0y2zlvHCHv6pKk3o+Q84Mc
         HV7QwuvDMVKn7Vj5IcsRTC3KpRX33ATleCGfXH8Gon4d6I1X7E8wa12j9Rs2mv34YGx7
         bDYKrdtyltieJYtMnHZPw3uUo/rdH6G832yFtIrss3Xe59B6UYrdMzoisbnZbU0y3ZmD
         plzw==
X-Forwarded-Encrypted: i=1; AKwUvByMBJ/W4FbkxB3MwTo+OdA/NHKqfOPhGVAOXLlDDj02tRNNQjg3UJPWhUaoGjo43Ods3B0nYvuiESas@vger.kernel.org
X-Gm-Message-State: AFuF++lSIL8FUl8YZI6OkeSSFQ6dQTqKpLBf2yZXrKTYjMYpoIDZkjnP
	ZW1Iixh+2pyWiaQCTBfZ8ZfSvDcptnst4PeE+NoO5oFktGsIOUL4MA5Kb2AmBHbMcYR4ZnH4v8N
	HFaHFP/ew2wji8gvLXoEhZyh4GHw1/H/BhSnoLtcp3jIKC5z8iozNn9PEIgWjpayR
X-Gm-Gg: AYBFou3aOsiSOqiUD3vmPnUdtKyh5qC94UU/SWfnpOSQaC9eDw4xBA6uNHjyev8P+E4
	0/eq4ftwPFsgIhbDIHQDch2ZeAfnmjdSu8Xk41ETZLSKmOd+7VB2ZuQd6rNI93I8AnsAA1PS/cJ
	C2YNkSPn4TrN0F4KSOxj6+12O9gNOVakwq9siM7WbqWpb+lJwU9jeeAvat51LLa0sHCCS7NPYch
	4F95DuHtZw2tdz+6pwWpiq0+oB8fcIYhXXcfeo/UCkF67pwp/J4U2dl5XhRRSs3g80indxV/+xE
	gmKVihbnkGyfqPfk2Y4f6+9kCuBIhjS2s8rqe3BaRfuPBJc5gBbeADp+b3s+dB78eXmpybHsi1Y
	zwey0WMGGEjjDa5TVmK5a4Lu0LPs07XE=
X-Received: by 2002:a05:6300:2204:b0:3cd:67e9:8565 with SMTP id adf61e73a8af0-3dd8c32eefbmr2992410637.9.1789705771735;
        Thu, 17 Sep 2026 21:29:31 -0700 (PDT)
X-Received: by 2002:a05:6300:2204:b0:3cd:67e9:8565 with SMTP id adf61e73a8af0-3dd8c32eefbmr2992368637.9.1789705771292;
        Thu, 17 Sep 2026 21:29:31 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:29:30 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:28:45 +0800
Subject: [PATCH 6/6] media: iris: add hawi platform data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-add_iris_for_hawi-v1-6-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=7690;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=VDncICb4cyA2swdK3ezYrt+ezqlf7ozvYxBHzhEQoVk=;
 b=9fqMmz8gkGU8HFLEiNafn8acCjlby+d9fKhH0CuKWRlk1ON3CBRB4k6dHh9caFzF657X63hb7
 k/LFK8v3k+hBrQ5xt1jr8x8hHuUfTFjHT1TfaKuj6Ml7rNir74XrUfe
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: bNuUiUhUB--7oxozF5R7qdo4KpDAKmdA
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aacbe2c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=f3iahYxl3_2vxJznN8gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: bNuUiUhUB--7oxozF5R7qdo4KpDAKmdA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfXzVnfU/2UF74R
 NksC/zJbVoo3i3qlKS5VAYaBj6ZrnG776drTvK0mM3N2zWG/L3G4jBssuVkKLPFtGPlGw3AiUKj
 VrNsEdkXM6rXaIVGFsjiagLo3RnZ37RnXXQ8US8BbwlSjyLfHyHX/nGcdUDhU2H224kSPvEQuNI
 MGWmNAoCDcVKl1BxS4Kp5UlQ9Dl6vFSGYqvTkMatp48ZjlRiwBqH/rz26gTohpvFoQax3fo20AT
 B3xf8cbk99JloFwGPJE++3hi+W+FLRMsgKzHBqnmP+Po/5GMW+tQFbp5NBVr2iRtl279gOzaEzR
 KX4tmcmkzK6tTWW79t235uYVUzEx5EjXPTSqwsavq96wEHl5IChYP+rid7WC9zDAi/B8OVgH8tZ
 bjsmp3zUcoBiBBUEcZl+MJ+ShkpFNmbCvoU1y9ttlX/Gn3kOMoChlSK6RjXZLf39f/icCb7UOwH
 LOLkaB0CA94kLjAulyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX3mb8ZYm6RsUl
 Xmlb9pAccbbPoFGRq9uX6yuTR21U525dzDx6uyhqeqHFxjW0sB4r2WMiIj4GWQ3ePkF9BEUUKDY
 uaE2rtLR1/AxzHM7ozV9ssuQwDejZtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180056

The Iris block in the Hawi SoC is a VPU5 capable of decoding H.264,
H.265, VP9 and AV1, and encoding H.264 and H.265. Add the platform
data entry describing the Hawi-specific clock tree, power domains,
firmware image, bandwidth table, DMA address range, and secure memory
regions so the Iris driver can match the qcom,hawi-iris compatible and
initialize the hardware.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 +
 .../media/platform/qcom/iris/iris_platform_hawi.h  | 48 ++++++++++++
 .../media/platform/qcom/iris/iris_platform_vpu5.c  | 86 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 5 files changed, 143 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 3ca4db45cb07323bdc18e5aba99ec7195087fe73..6c6f11184a1d0e46786e9aeebed5b79ee414aa15 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_queue.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
+             iris_platform_vpu5.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 193e6f293cda5462ecca9acc0ebc79c936b68bb4..67f79cf86136f4e2374467b436cb43438cd02d6c 100644
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
 
+extern const struct iris_platform_data hawi_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_hawi.h b/drivers/media/platform/qcom/iris/iris_platform_hawi.h
new file mode 100644
index 0000000000000000000000000000000000000000..90d9282ce59821489c941d7282b3f23e8c06622e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_hawi.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __MEDIA_IRIS_PLATFORM_HAWI_H__
+#define __MEDIA_IRIS_PLATFORM_HAWI_H__
+
+static const char * const hawi_clk_reset_table[] = {
+	"bus0",
+	"core",
+};
+
+static const struct platform_clk_data hawi_clk_table[] = {
+	{IRIS_AXI_CLK, "iface" },
+	{IRIS_AXIC_CLK, "ifacec" },
+	{IRIS_CTRL_CLK, "core" },
+	{IRIS_HW_FREERUN_CLK, "core_freerun" },
+	{IRIS_CTRL_FREERUN_CLK, "core_ctl_freerun" },
+	{IRIS_CTRL_DEBUG_CLK, "core_debug" },
+	{IRIS_CX_AXI_CLK, "cx_iface" },
+	{IRIS_HW_CLK, "vcodec0_core" },
+	{IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
+	{IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
+	{IRIS_VPP_GATING_CLK, "vcodec_vpp0_vpp1_gating" },
+	{IRIS_APV_HW_CLK, "vcodec_apv" },
+	{IRIS_BSE_HW_CLK, "vcodec_bse" },
+};
+
+static const char *const hawi_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_apv",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+static const char * const hawi_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vpp0",
+	"vpp1",
+	"apv",
+	"mm-int",
+	"cx-int",
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu5.c b/drivers/media/platform/qcom/iris/iris_platform_vpu5.c
new file mode 100644
index 0000000000000000000000000000000000000000..0240b4dad6ad483feaad480a35c365c7a211ac42
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu5.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "iris_core.h"
+#include "iris_ctrls.h"
+#include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
+#include "iris_platform_common.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#include "iris_platform_sm8550.h"
+#include "iris_platform_hawi.h"
+
+static const struct iris_firmware_desc iris_vpu50_p2_s8_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu5x_buf_size,
+	.fwname = "qcom/vpu/vpu50_p2_s8.mbn",
+};
+
+static const u32 iris_fmts_vpu5_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
+};
+
+static const struct icc_info iris_icc_info_vpu5[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info iris_bw_table_dec_vpu5[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const iris_opp_pd_table_vpu5[] = { "mxc", "mmcx" };
+
+static const struct tz_cp_config tz_cp_config_vpu5[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x0d000000,
+		.cp_nonpixel_size = 0x25000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x32000000,
+		.cp_nonpixel_size = 0xcdc00000,
+	},
+};
+
+const struct iris_platform_data hawi_data = {
+	.firmware_desc_gen2 = &iris_vpu50_p2_s8_gen2_desc,
+	.vpu_ops = &iris_vpu5x_ops,
+	.icc_tbl = iris_icc_info_vpu5,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu5),
+	.clk_rst_tbl = hawi_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(hawi_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu5,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu5),
+	.pmdomain_tbl = hawi_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(hawi_pmdomain_table),
+	.opp_pd_tbl = iris_opp_pd_table_vpu5,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu5),
+	.clk_tbl = hawi_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(hawi_clk_table),
+	.opp_clk_tbl = hawi_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu5_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu5_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu5,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu5),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = NUM_MBS_8K * 60,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4bdb078d83b5c331869dab2409bc4d10ab302737..3512ad7cad4ae9fc07d21bad339176ed959e3dc4 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -427,6 +427,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,hawi-iris",
+		.data = &hawi_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.43.0

