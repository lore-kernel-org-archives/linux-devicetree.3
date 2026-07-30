Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BE1447809
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424874; cv=none; b=bMtkbqto4XI7tYtz+Ch4YusdJcBYI0h/fBqGifhQ1ESYzO8vtuCJx/82mXprhAxfyRMmKxEfCLN02GiAPjv9gn326VyFTMO9i5TABHpKsFm7R21soX2IhmkAtAoX8Lnf/LPN89F4c+YVby3S/n72X1fmuvpJiJVK/f3niZCf7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424874; c=relaxed/simple;
	bh=cPTXXI3mknLotK+Tb+V1ad85mR3WKey4eZTl/ep3O08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6sMn6T0kYifG1YmKXOjtG25y534r2kWDn0Lx38nXGEtfbcG5jDwbh/IV+APLb4+nekDaiUKHspD8+hRCM70qm/2jtq1wi7WiHL95fTUmfgl6NGBkd01yAKMQdW0KoSETbWTDIi2hKzWkEHEaGTS0gSq1Y6Jvdm0HlXdJZABGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvp6+E1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrwcrHoq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvp6+E1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrwcrHoq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEirZG925029
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=; b=lvp6+E1JsPlb5u2l
	TYeKqThYArWlZbpCiDLMPc3cGjdmqVJ52SxKnlAFE7WqP2Pgq+/vac/Pf1nUdbF0
	HFJB0Cv2tME35y7CZeIQeBAEq2t+En97HYK6Fm/PkXMZjDI5QNXiPBy0cuMipRO5
	GASg1N7bIpxkKUlR0SoZWoGoI/2huEyIQWwPdX+UovSa4UpSQBWF+9tui7Lj8jvz
	UNqpp942BAe+c4uysru74xOU0bk0clZlIUEZBiN541mHA/8damW6Xb5ZmWy5Nj6x
	P+ZWpW0CpKxSQg9vuA1nw5pIROCvmzdmcDdJjalq0+3puNhhKD8wwwjazVW6FAG7
	jsfd9A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n806cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eac2620cb0so23633456d6.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424870; x=1786029670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=ZrwcrHoqYpxtnuqDxXqZECNt/Z/dbITYcAk6mxp7pUsDnKpXQU6bY/OPagVpPCtvHT
         rQEGh7GfzMLbuXHjFbzLvxG4Z5BGTItj8DiftNx3ExBOzWJOvkyO0dgw1fNBIyhYGQA0
         Vo3U1YZlXcEK6epLY+BcSGhRmrTJ5neaf/xI1fpX2cD8u+Y87VAAJ9szNqVg1LXnDpRl
         p3XxcrrkTzzm4JrsnefN9HAejzntY6s2im7dIDuKmJFwR73vGwekfIhi2XcRtsCQROgZ
         5gfIiBmfbSxkiWOIFb5RiKnNj6a+wj38nZq+2p0GPuFW+haCl+UUrgAFMZcV+M175cdM
         0J7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424870; x=1786029670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=lHdwFpA2cMcZ/CoTdDFBxpRM7w2VjbbkzxgT9RYk732rP9YSIH+wuBu7Gc0Ze4V1B6
         y2dZC9Cm5jA3cWkFJoIBSfzLPEmLeozg1ukYMF3byUwRJCOIri4sUdLOR+CPJ0HPEYtG
         UfX4cKyZHacKZNQMeTJ0K6taUtPO6HdHu0GI3lTbm0DQlHIuvs4POAir8whJ7/yQSeGA
         6wG0VwwT0Hy5VdGi6zcXXAq9KzETwvenesrNVDu2XsL7EzlnGeq3ZPUy6AHRv1kv78xj
         XCnyZNUlTQ/w+VcJxYS74IN3otQITPEu+kybxIAZcsviggz3wir0ydQw09cAItqBi2rn
         IUjA==
X-Forwarded-Encrypted: i=1; AHgh+RqFXGz0byCecZT5Cgyh5YAhJ2s+rxTpz2eFVE7kryp2f71LSXhCFo1G78Y2Ky/RZd6zZK/smmaPc+ZO@vger.kernel.org
X-Gm-Message-State: AOJu0YyLXyzAlTE1mq6QE4MgRSAVxA1D7RVIzqfdqiQFs+zdpx0v8H9m
	n+xjcjXXkAB0dt078YQRSLTNh978OBeb9i+4McM31Vf+2WJidd/096+6AfoqPUzRi9/1vSA33oD
	kFCFwsFk9He1gw7THCztiLZC+dr+Qj+MyhT8q6YphHdMSFZCGTfKlHq0bUKILRofw
X-Gm-Gg: AR+sD126cBoKqZeSdAusAutKSGvRyh9x3QRSwYEvcW1xCcDxBqi30Hnou2eSJOF1wHi
	JF7hMjMv7lzve5kJEadNRdWRRNRDB2zLqovB3Cm6zKtFnaM90RXHZW19M6r61qkIXE05RyAheuQ
	E0eOrltjDF1nD9badrnPIywZSuL1NiaCM00xY7Lwz0RMfoF0njFZhg4qXhWuxxSA87BUnv1PRO9
	1ErQWQ2jS39FmcK/aVzcknItNkXWJuDmqXJbRzMzpXrvTvPIysu8scVleA6CPBxLbHM8q2H3hN2
	nPJTDasS+blGzwhS3/kLkj/h+MsNlIGdif/uUrO7M6Pah9s9Meb3EuacRKBmtx4My1nGCwYXQKV
	j2e9fwDmRE65inK43OKV7BSWsHDypI5hl9/AKTZVfedGnMINg03kJeImnaWpt21X1lW+IOp24hX
	o7fFCykl4jV1odxQ==
X-Received: by 2002:a05:622a:1449:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-52b3877fe49mr32790191cf.61.1785424870321;
        Thu, 30 Jul 2026 08:21:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1449:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-52b3877fe49mr32789681cf.61.1785424869847;
        Thu, 30 Jul 2026 08:21:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:51 +0300
Subject: [PATCH v8 08/18] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-8-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vRkffmF+Sp0l2e0Xs0yGPoNJ1XWE3HZ9szp
 hBYAvMQTlKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0QAKCRCLPIo+Aiko
 1ctwB/kBuzZdKx//KXH/IoqCLPivulX74aX+gJlnogQXutBQIKsyQqldtbgpjr7HaLh1u8ksiZ2
 KQSsNHh2Zz2y7jiMtgh1i4tz77tqxgoWcZyHdNcDzC7xr2M90EjQCCy2ntxWI7WyLKQ5rpMnWsp
 a+WRi9ugnXMx2ktNpT0Ue4oJTxmwlWke2bRAZxzWscKYUgilJPqkxdKjBbwLWMteyXxWX44W33E
 GOzDtdeizVXpyW5iYuLmgUnNy58SvIEwgMdQkiwLSH/6HkqfeLnM9VKqmJA4UggQBe8j9C9m92H
 y5a77cbfJGAeUzX01ToAGhlOSdwPJ2hGb1t8iGtbC87XTWlE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX+40eeWCyQN2Q
 ol5m69EQCIXn/IcWHHHg2ZTRt+bJYJaO7mFObBpIk/BkoxZC5l6IfQt0HJDJOVwsEscaf0Ua1vM
 wS1W48i5GMiLlBWFzGowFnJIXtAIy4xGIBgBJ87pGWnpc40P8NIak/TR1mAWaP5S5UC+w5WcznC
 2E2tCcPRUFx5Enyc7+cf3j8+miY79zW9DyTINg4q4GVk8AElPXN00rIa9SG87oZJPzjMqyINRCn
 HJgnqs1YM+59hohGQS4/ioD2SRsIsTQo5yq0e/fqEXC8z/75diF85Qq3OOpyowjckup3bYOaedl
 bgCW0rS67hJ1UQJSMG8n2WK1rb5MPzLLpNfJNe3xyip+2XwA12FdXL/+r48nSn0VYh2RRMIU7ok
 53LUntfvXoRzo9KCeGNpVcKAskkHInH5MftTVUceMDwIZgFOSk2c/FQfx0qAGlXTTgVGyeNUA6l
 u8yANMTG5PnwZV+5+cw==
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a6b6be7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ka4cNfJPEDy8pBcCQmdwSBt9BnYE_3m9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX3EfSfrB0h/Ud
 eeK7GCim8Hag1C3HUrPg/4qrjSIcss4o34foQ70SK9rrdtbdXHpoTFSYs8vJ283hayptPkxAEIH
 +A5cl6azURg+STxMJQr/EeyfIZXwLjw=
X-Proofpoint-GUID: ka4cNfJPEDy8pBcCQmdwSBt9BnYE_3m9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

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

