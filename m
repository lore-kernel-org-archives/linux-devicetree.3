Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A45343216
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136150; cv=none; b=hjyU7EVdR2WggKAAOkrUVaQM9vdRVRkBV6o2qr/c+/RJtDoQgOS/oc/kA9+GQ+IBznQUp730kt4qyUkh+44pdfOQDhL9fwc/yVBC+p8Pe9E864qmTqSxa9fp4hDpRnOfT1JStomyc3RyUGVUjZoQE7hz8ZeSzzrUEbhKzo9A9xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136150; c=relaxed/simple;
	bh=7L8xHholksLr/J5idSuzkIoCG+5CGus1ErxlOMircNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+h3q8IylCGzJ24qh7BWpxYP1Dl/LcNu5/HrXYX6aRWXMTdFt2v2SdDlqwbT0x4IhQpzjnANaXQBm0tF0VcUjjlyZKu+86PbofjgBaDOcOG+2fYtE+/UTr5PEct5xqDhAop1r6YLQCi7Tm/U5/OgSjeRXRzGoarQCFCE8TXFcJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftVnXNLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyY8djX5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftVnXNLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyY8djX5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475e2Id3036347
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRdJBhxXKG6cF3d7XsY6Pd2XP1jNeNkL4RCXQhfKXgQ=; b=ftVnXNLwAcxTZvsw
	FxJcfhaoP+Rm71klZ+cd6ag9N4dinF8FCvQAEulK0sNnu3Mylwii6ba6wWB5zoiI
	94AT+U0xtnL2UQ1gAOxQl0yaxL3K0seK74E//pASbjm4xraFr6yh9Txhi1oNBqXC
	83m+7FRwuKnBQVYC8XSZqW7UwH8L8wl9SiKbNVfta6axnqhfJx9+WISC9DhAPlP0
	1Wsxr2olmECYgEmz0aB+Zu+vOIN8IuP73p/cEXDxKYQ2zOZv53t0lAg10Dkzyssu
	wCFkVQp2zdu5PeGEg/ON4tyqpxJCs484ua7Ste+Ht7QYiM3F1FKQ/nW+EaC24XLN
	n81yaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf3jrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so7653751cf.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136145; x=1778740945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRdJBhxXKG6cF3d7XsY6Pd2XP1jNeNkL4RCXQhfKXgQ=;
        b=WyY8djX5UQVXFvM7CLPlhCqgH4zgIkap62zWN+gY5HFE25qtPbQVy66JycgiGbhIXc
         bAouPEfD6q/QiL1dwa5/9K/s+BElmAvZL8c0CymSvm1ad+kGlbOVo3Un7wm0NcXhMQT6
         9aAC+lxc3fo6tz+Kc4KNXw19QzrHR2EIrE5gAQ/IMuRCbed7yU/Slb0XoIlcXVgIlDpF
         AZA+0sFNRUD7AEr+yylFMa7mXYdOdfWELCej9Fe5xmWOHbbQXLGrM/9/6svrl+Aa1zml
         +360zTIppL9sS/Ze9h5j/XqDk5yoog22oqYHi2xhd5dgfyMKVb/JXeya4C/9+DEQGOZz
         20XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136145; x=1778740945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRdJBhxXKG6cF3d7XsY6Pd2XP1jNeNkL4RCXQhfKXgQ=;
        b=fu9N9hLxTc1IjSGt1X5gseoU+TtVL7BcUBqIEI+Q1IsaUSF0bphgWm052tcDyKGc1R
         6SCc9318A8yHeVh98CgJwtM7NE+Pq+iZKv/kvNci6jP2k6FZwK3MYSEQbtMP4Q/qMbSX
         /2p5HTsobL97fn9KNaUKEmXIL3KbBCDtcVRAgDKpmAI0UI82a9LDJLqf4zSLmNCn+svp
         +XyPaC+OWS2sCG91y8fC3AVrudSenWiNT+ooA3rs1Vxpw8cSOtH7X3csqNZtE6F+ZHo9
         x46aKEOU/pEZU9o1HmEbE2Zn07AQg1nyCUyIJIOcY1cRnkPa8mkgxIimAHhgM0E+sKE0
         iH4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8pUg8KycYtVR62ljisow9sEguE7XcnD20KWXSyZuXCQsM+7NLNRkNICm4Fi+OWENQvWnRytYsF18O6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rDpCzqzc0bBgOwyfAW8hiwalKBhPtXib+T3GPaGNKwGrb65w
	EcGjRLV9nxJ0RQpXUJg3zbVoQPDzSSqLu2J3qZ/szdZTRngXhqJvDtedSSsguP+KhWPdJtz3b4K
	P9KmP0FuFlOOZP3vQg4J32ONN2xyMi7ZUFu+nnpQLXWOfPOEMEo2ecKF/h50KXy09
X-Gm-Gg: AeBDieuNhBVl069H7l6uHrqfIKBGuU8DS0CBnCTHbwC/87IKfSLDBfoyz4YSb+EOt4S
	dj0YooajrlQASGmYnAuEN5dPgqUKLVvCWvHONU/XkEGNKc+fKYc6f+ZgLDU3psl5BMG+SzBhw/o
	njxzpvOfZz/xU6BRLD1nB2S2wo4BKPN7qR9ABo+B/XmPVJhlLysn62JUNDTgUOuZc00HomcPjqK
	FRHdOZkNjXHcAnzSE/NAHeAP4zqvEA1j3HCx4YZFATWfKmfkYSbaygK3uin4TVG76pEsmxic1yp
	EHCn/FbeAx/k2g4J6J9mFdtDzDswII0eEDtXT/sIXmbvrY+3t073xArTO/ZJZfbhEj2Fjkttwj2
	HmIuONwhykRYQrvK1MfguXK2ixsfTDURlj4Bt9GtDDiQUJZZf60fQcgbZma/WniZdGdtlqwZOse
	aXKmlM4yNNMoMhRzMlfy4IbicwncyFYnp1v0OSWHh8HiCLqA==
X-Received: by 2002:a05:622a:19aa:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-51461be057cmr89098831cf.1.1778136145300;
        Wed, 06 May 2026 23:42:25 -0700 (PDT)
X-Received: by 2002:a05:622a:19aa:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-51461be057cmr89098541cf.1.1778136144864;
        Wed, 06 May 2026 23:42:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:06 +0300
Subject: [PATCH 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kvjyEAY0vC/1nZZAL450HsDlx2QzlbhCGbevXX9OZR0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+YfE9tbWXO/PDQIsikv5ZvO4nBnevElf/ccJXY+48czm
 20WrHrXyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ1Fax/08wywvfbDxd2+XB
 xKYGgZqwS5X61ZtY53jc7NYssAucu/xgdlPwWcG5rj0iyyyva0cHmfZfVPxR6Bwnm9wkZMURxmV
 iZNnoY/zD6eQDh/iwXdN8GmZXmD6+e2mngsOerZs8ZM7f+Bj8mCNI22+G3S02hy6ndIXp62xedG
 9WVIrjXn2120srJX853+RYQZbW768FTZYLvj184KnPrYTws9NEqw/zMr8tOat+wX/aP5MnzVVn1
 lRdXLT9db+BUtiKOWbN8+ymsu/MUdnIeS9ygoX/As4N0wO2LtnK4+h+7pWJgChXob3fq1fuB29s
 mZgS/ss5aNp/E6nrC6y+W2tlCRq2TVS9LfBl2mX/hqfXAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX8DZEfJHRYP60
 sgglr9yXQEGqPMqjfiv/nc1qE//PN2X6m5Vf+9z3aE7iUpGfpj3mHywGtkww5/hDADEvFh4gx7p
 40cqjt9PAccG5z2BSVAeR8lqBAEQE3YN9LfGLRdZwJz9LJwF4KfdCFpKoTzfCbLBffNwvMCnJgb
 HBc8uftryiV+bNlkMZbNiVU4QYmBQlznWzWHh5GNU5m96l4I0xUnDFMcTYCYjZc0+b7W/0y9eWg
 R+/OD2OQ1zuYsjfMX3YPqlU92bY64GDMRsu3wbcmsSLRnWJ/Xta4HorosJ9tJLsHAt26c1NBf4y
 m4N9ksz2dWJl3MmLNYvtp7rT0o8lafKwy95QEZWyRvdyfU0mOfP1Wc7B2wb2frf2ZQvG+CYwtT5
 bpFeASZfPMCjYjJrme4Ff6b1pfTEe+o69ERzxujOah68aDrpf2yRaMN9+p7XA1C108PjC2LFZ6R
 YM9963lZBhYrH7iNbkw==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fc3452 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: _RMCDnrLp_Sxye7UNs-mXW8_RUnGNyHF
X-Proofpoint-ORIG-GUID: _RMCDnrLp_Sxye7UNs-mXW8_RUnGNyHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070063

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 7acb073f7197..51d8faf6fd1a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -283,6 +283,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 8259709ba203..238c7b17ed4f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
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
index 829dc37b4058..6e63f279efbe 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -17,6 +17,8 @@
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -106,6 +108,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -135,6 +138,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -172,6 +176,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -201,6 +206,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 59e4d68d042f..b8300195a43b 100644
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

