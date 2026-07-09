Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD333375C5
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604543; cv=none; b=tbgQhiw1V6tPvoA6+LSLglkekSxK3xJCm3Zio1fgbkLYJiDfgZxXKjiLU1Q9eGkoSK4L6bosov/K4yx0uL5WJwvmnar/uFdVd75dzhdrpOK516SjudvsHaYgPg2AeAP8w0jiNaFopIIzkXM++xmAt2TFlGuxmbrIRyfdBAtUiOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604543; c=relaxed/simple;
	bh=cPTXXI3mknLotK+Tb+V1ad85mR3WKey4eZTl/ep3O08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFVi+VwuCi11lFBq7M2ZZ3frRzkoDgO8/MX4xWCgnZ8RiLXNlGSNiCWfrbFW/8DIC4hCXr04ZPafSUQw9vCetP8G/3JvFJyHguaJuNwbbP3NFDcpIIK2JZ+rkLBWeDd3/S9ZwbhgoZpS1bXqYKoX9qBAfpxuYut+iA0JAwhhJ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHNlYQTf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5hv3top; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHNlYQTf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5hv3top"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNQ6Y1488964
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=; b=AHNlYQTfq+YLB02n
	jPF4hH6dtpFyQ0pqebLOr9aMd2/rv3WTrtBp5RsNTgITWPM/PhdklWZeya33yh4R
	u2Lj2CIijI0EOGQPeAvnyZwNIJJygsEXZX+kZn0UoqzR3mdlLXPfSVDu5RR9uAjt
	r2XJ4vgR83zfDZjTmN/zD6PlRXk1kWhTwa9iL+ezn/I86Mup3NjhMVW02xBbNV/w
	kfhSwA0GW0oZ4W9un9BdirUEvcyeKDUEwah3vu8xvjUWxf4Fn15No8f6MzAcFfzp
	jcPHyiUeoSAypdDCK5yejE3HCKth2tRooIC1Tm1iELuHmtiXRaTXN1xZoiuhfnb5
	swR6iw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfufse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:21 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692d7bee20so1509839241.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604541; x=1784209341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=I5hv3topXAVwdjyHIBax1M0OPpdV2yuraxePtxTTOWTR8UuiEzE0zCpdVsxzLjANyq
         dmro6l6kxPiTikHYZBswOroq76tArXTd6Tkw9Nv4kB9KfmjwrA8x3P2kducwmPJPkYCe
         QiuxkoVyn+HLRQQI+Vm/mWPGFOKsCu39Jqr+bEe/f+xlIROh+SvmiqpfF/iU2K8dq9DS
         y2lSYR9PRuex0sfSdnX4lR+JJDfVLhZ3sAR3Avw4KrgWEXUOKKn7ShlXjHIfiUao350K
         RKQzT/zmytdBuNOPTfJBMHlMDR4L8UeBxBPmKXggV+WQr4pS2ocJx8b9gHtlg86HBODE
         kQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604541; x=1784209341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=rJ2QYijdqpYh8Hu3vlmM+aK+5vph+CClbm1uGpYtbVhfsUNdDqSG5oG8UN7HT9r7Ls
         ElFDm70y2xuv+Y4kSJSd6pAAzyg2iET5I16Chtwh6eJG1HqvYqPQ6PGlqo/EXimpxjSl
         Fl/WOJz+D0yDZxeUNq25A7FGVkNIAQgbXPHkuJUzwe6XZVFSTZa/+w+K1aKXh+GIR9TX
         RXwDzqmXqZsjFVlWn+ui7pFsWtb52FiEKvQxXs6lSAtkNJrXXXV1tctEsCmBTgkBOwD8
         OeDMlJ2IYfm8JxRy9nqyrbyCY4L4Ypz/LM3mvrGKQuMe4OU9MQ3ocaaCebFHzHHVk52f
         ETyg==
X-Forwarded-Encrypted: i=1; AHgh+Rp62eihcfxkNXvnIYX2liuShq4ndQAuBetvVkgRdmlITou4wv7TcqfWE0poBla+gsJ9w4Q+/CWOUFcs@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsI08D79b1I6Mt4Kdj0AcRfbYp5YtXVEhCMZMtjq+TZjlDzB+
	r/1xGdaQ3An/ZpuaWuL/ZRGEQG8H2eBoxTxWswXTxYJ4bgThIWGZTatZBg12zYx8ReOcqhoXq6t
	pI62dW6qz3bU8k4f4TSk8MobiwE8DOCkYAQ4AXpMHr6SgGI3mWAYvyg5AYzj1ips7
X-Gm-Gg: AfdE7cmROgfj7uVlRIAOAQxUmwnzlT+JsghEkxy1QrdyfR59gbRHzdZ1UC0+3AufUxN
	xPUuEPqrigX3E6Hp0Sp5q1HWrC7POggdON/FCkydJBxb1buaSxB0HNPnpaqA9K5pi+G46eVxxK8
	Wc2RLZmCPdX2weg1J6TMV+0voleLSzTcfSTuiX2thLmKyMPATHGN7U57vVMUT4paRfAPonBF7Fm
	7PZ2y+aLz9bw7ugQjCqcy7JtunfaNKZ5iR5HXNL/fgtSYeUwEyBK5wrTkvXGnnU9Mm3Hyrx3cQj
	nm6DHdNjhlrmvgR2TUdL2y2l+iko4TJkgebfkWgT7hIFPGUq7Z12YdITGYzEj1ijyKPfStfpeXv
	djxfM+vpW910ipHDocu8FzoyGi06bpBrF14A6SotaM9pscIr/gdj9mJwm80lbjlvPdO1UGGheP1
	C7kOnYch9hZgsnM8I1oq8ixdS1
X-Received: by 2002:a05:6102:f89:b0:744:cb59:d6e4 with SMTP id ada2fe7eead31-744dff883c1mr4748038137.22.1783604539876;
        Thu, 09 Jul 2026 06:42:19 -0700 (PDT)
X-Received: by 2002:a05:6102:f89:b0:744:cb59:d6e4 with SMTP id ada2fe7eead31-744dff883c1mr4747988137.22.1783604538934;
        Thu, 09 Jul 2026 06:42:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:59 +0300
Subject: [PATCH v7 08/18] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-8-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KKYwQvV6HfPLmLckhIvkwX1DNxqvTV0Ag1veh8Tp1rA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UlQoHH4h8r9m/1xAdnLQWeWCfpk8+r97P5W
 nwLGSKwxeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1QRyB/9Ua/8ga0fyfM249+q4hk0FOEFtT0M7eL+v3TZEnjIckdjtWAzRpcU0gl9934IeBTIx5rx
 sItV4XomzcceIYM+FlWZh550XJsk+K8NklHQyIQ/kDfVDIXloXQ7duKWSee4Ck2C9Jm6RxxIH4A
 84kV40saumdvDWT3RIFmrsSXQ+XqxfVPSe24DKOz+A4euIBzbYDFnLHA6exVckn72qI0xPJDCA1
 Xzy+RJGGzuRgVxEZStvN9jll85Z6niwFhAOn98iUQtwosM2/aXDorMfJd4X32IGaf9hZXz3JWW/
 uUAat0Nl7I22dmm8cb87Dd2bio6PCs9x2YJfvbvJpdUZQ4gw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX4FS30W2YgUEQ
 LJ+amkRPRizMjc8k2EqHqu4yR1VQ6uh9h9sk/VaNQ0IcNjMoJDU0lc7GWGvh5VtFag7fw2txFd/
 ElmYfEjObdCgZcrAlg5eR1h2NH5KBGQ7movb7AjVnyl5lUAiowSXftmQ+LuxNGuWL/tZDrLpq1i
 m/DDPoeZ76Fzj+bEdHtAnPHM8FzKq1DEup4B8ov3Sji6KA+lx82rx72RBszj8b9aj+em9FAoTk8
 4u+F0XehuZC/FzGRK1rg1wJ8GZDb2xUdUidAlI36FlKbxiVysUAYSib31DhPa9CL4Ph3lceGTrO
 azAr2uc9C2VWFX606uBgL1/pU6TQrESZYdgpoWu2UEJo4qylfLz2aDhfe0LDRc3ak3PM2qBuYQS
 pd12+iwOaa7pukacttGQVwplw8XyBJuPCdlK+gJIdrigkm7sxw7WPC0DwOrX0FAfngTdhfxoqIb
 sp3uBWVyH1x/2CfhZQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX874Jnmse8jHL
 R85e9GT/9SYb0XledbDf1VyUaown+CA7YgPebGjsINWSREJrmWrPv5QD9w0kHgdd2PJ2ioHf+s2
 D62ur/ppsONI5uy0mzavCt+Xm7kmVmY=
X-Proofpoint-ORIG-GUID: iTjxyUs9kzxRNd54KOYTsW6FLvM_uQls
X-Proofpoint-GUID: iTjxyUs9kzxRNd54KOYTsW6FLvM_uQls
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4fa53d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 7 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55a4fa356985..81fcb2854772 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -315,6 +315,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ba91672df1bb..940daddbafcf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 7098b652c117..eeedde8fc9ce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -18,6 +18,8 @@
 #include "iris_platform_sm8750.h"
 #include "iris_platform_x1p42100.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -243,6 +249,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 375bcd923476..41498f94480e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3

