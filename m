Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8146AF06
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676569; cv=none; b=H+rlvcFhe0eoXV4Qv+BCgF+wVuoGh1vcOIUv2zI/uYwxB6OjY2Ks6E+SxZ4hyL7b0arBQSEdxszXO61kQasYHV6j+eQw0fSRSxQhbIy75UR9q7iv0cTIkqTDeBJc+IUGOzgCCqkwNZlV9qw3Dcvq4d8CeBJI1APwJqBZDeAScb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676569; c=relaxed/simple;
	bh=sv4VJqZ7JjuYZ9AdNyjmibmQwBvNg6eatU4XxzWlZyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5mfWPzXt1JtH4Fn2MSzdLbQiszBZxDM0mVs7FopEsy7PYK94aY26JIyRAhVNSZhMwD/a4xKd3NAMXuzCh3ROdrNbnNHtpDZ3hHd2WI3yWJ9ViSjsyRI1S/pJCp8eln2FnfdunQW7+nDGZHSciuhA48kGSHTUcBsW5T+okVe39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+oi/4Yy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxHF3PI2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+oi/4Yy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxHF3PI2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rG2b4082512
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=; b=Z+oi/4YyAEwtVpIt
	K/a9LH6ttMA5+vPSk4pNJ0BJPG/bUeIop0oEo3RNu3pDSRuv6OQLxikQ1DAN7X8c
	PQj/wS4dOKBpbRPde6q9I9wCJ5u7XJmsjxZBh7fF+UCStJFBNrRdQJ1kMGRcjz+X
	IAHzbw71G9KGud6GJC1D9qatBU0BLU4gaDNgts/X9tPQPebFud7yQ9YtD9JlXX5k
	tZABRl0Ee9iyMOXoKgohuFKZLeKS+vI1bpzJMmaHZOO2EA1S6GW2MmJusGujINoN
	dvU1JatjPiqc3dfhx2Iaf4XVxZkRdNO1sjqP54rKuL01DFsFZgmWANR5U1i+keMT
	7lT74w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0tmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e8c47a3so6324761cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676562; x=1779281362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=;
        b=JxHF3PI2bSmN2xwFB7zLsaN3m4axqgjO1K8nfTPYn+Hcz7E1xlSNVa/pkjhbAOGOnr
         aMcb6RjqXRCKi0Gn5aW+CBojxEdeo7tpEsR7erS2xIpVz4NywE0pTDrFaNk5vpBdL/8k
         yJXyOK28Quq5mmrP5oqHX+Febpt/QHeT8/qswS+e/YQjpZ8jv4R9OeZeRYNVsjvaJqAs
         qTGicYIKPEfn8uONeie0cSgvBS453CGX+TW34qM69p8nBv+DvgYemS6pkm6hX3Tx34/i
         C2JCKUq6ObrBZN8HvUfayNT2QR2YUR3TtjH9NKuDgUwJJCMW7is7IumEx+9OrsFbfyY6
         NT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676562; x=1779281362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=;
        b=qZ9mtDX7Sj30eGKErDyxuVbPl8hRynSvoah+6mY5zzCgxeoaHqT6xv71lQBLq2ekbE
         +CYiEf0AafbXexigQUt0prTUKwP7Zbgvq+X82EM0cGBn/Xgo4WVz0d8FVoiU7SpzQrNY
         UNNzvas+YGodEadSYnoTGvl7TMxeGlLlWpgngJuFvYokc+xm1g5X6C6O5stOeJ/1DFD+
         n+1MkGhjoOWA2ltA/+sEWy/J8fqbvSN8gCMT1Hyn0MeI2R7zqV42bIGWcoBMfC6kAcAY
         fIG+/L73Tt8QydtfcXck06ypKxfShz44K944OiIqt2CTA/FjFwSZB+QH7CskkQp0CpVE
         Z/EQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ddDzorMxtSw6Uwc62s3IsZP5cNZXjwj3fiF18WRwvc1iqtHBB0KUiBK6sBCR1gx9KwxrmFfLFrArX@vger.kernel.org
X-Gm-Message-State: AOJu0YwnPNeeD3yZfgDAsvPQ7q0/EpBMrvnX2Kpni32RPNfbIy1XWa0r
	YcV8TxTQx2kXU7CCwSzKuhCRU0OApPvaBiEvT2kTfyQIg2BS6doM9nFKm6Ea7J47r+U/xttJbCh
	JqePEI4RVdlezaj4FX7/BdO1X1mukB4kyaR0XWeJYFjnjEd+Q1HegFIG/Jr08j0W8YnddLBsl
X-Gm-Gg: Acq92OGrOs/B/40NYS/k0u+Nm9b+Hfx4TlZM/f9EMVClcOkhE/oWTn7E8N4B+AI4mo5
	6X9a5Kb8cycQAj3orl+5rVdpbz6lHT8+WWLJHgnXoPUZBAI9aRr9en3oBpriledUTcY4UiO3ivQ
	VLW760R+afb7Fc2WFFBD7aFvdmuQrnVcIDVNM1ReBJ4aCCHU+rM9oLMR+TWlrMcrqeOSk0Qj8nC
	P82G0ewYT7oNFgPRUd9nI5E8JmEGlXGyLBYV3fWIwOasQ8wH+tOgPeY2ztaID2S7BHoJ8xtzAsc
	/2tHR5nS9H49cmNK4o+2tpvcOTE/MMbzks/1LwBjZVyaihMbp9pmcqoxmDIiZxNME0em+6Q8Y78
	7GieXBSvXWyoS/Ay73iYdC7cOk9Yuwt+7gT2VOJw382VJCh95bGehpq3p+4asbzUMF4WAzl70TT
	pL0z8dY6cBWoW3uyOYRfHrenLPKAC/N5U/XfQ=
X-Received: by 2002:a05:622a:a0b:b0:50e:6055:274e with SMTP id d75a77b69052e-5162fe24aa3mr37726021cf.17.1778676561739;
        Wed, 13 May 2026 05:49:21 -0700 (PDT)
X-Received: by 2002:a05:622a:a0b:b0:50e:6055:274e with SMTP id d75a77b69052e-5162fe24aa3mr37725571cf.17.1778676561148;
        Wed, 13 May 2026 05:49:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:40 +0300
Subject: [PATCH v2 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-6-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6461;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UQqP5tD2UNNP8smTrGrxEDFFzhpcWSGstXQh9hbGrL4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLsYPa95pV34KZ3swVE2oyaAmtOJ2czxj59Y/IFsWkk
 wm5x/Q7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRtG4Ohu7r361O+vn8XBvt
 kx3b75KR8u3BbKlS9669b6fWsU+uDr6+6nDl8SkGDZ+7z7HMuvL4neamO7rlPHnXiyVixC8xOPf
 E7ctcfudn6d8fiucW/Djcs/hQnIZOeeO1Y1mMabdqcopqnN335+dXiIm9n9e7+4WC223NGYyH2N
 X/P32SteSCtmy+/2M7r77pX5LS1bYdfy+ifEVthqefgldOTa/xVD4j26CLmRf+rH7GKfqAYY3jn
 sxs+61LDsR3LFHtmqSTZ3qJIzF1+olVcSLST7Ni+bQVi5dsio4+Zef3c0PX6leZwQW2EYtPbxCc
 kJFeuWfig/nf5ENMdW3OxMfKZe6p8z/h//iKk/HE7EeNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Gsw_B3WKIfLuGi-uH5cnOXosWhrawV12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfXxScH9JpEX3vf
 MSaE99tRV2PO+unGDbKukxL1ounyDjkRycg2mk0sYmRNegr4K2K9v79fB3QyZcrX3/B7XNyro6i
 1vGnZRr2LCMRC50YJRp9f5NHF3COQO2TAX8Uu7hq1aZVpzcupqspe675JLRADmsO5us0zRfKOuO
 xAE70aYJZDeztthAXtEeIyh2q9SVw6LX0VcTiMPiKYfY6Bv2U2Vw7WK5XqUCDQxpIIzJgyqHYst
 EA3g+i1+UYkGU4emXVc2na8+dYKjEN+pBMjfhAvvYI2HKGeAnslL58AbXtaausfif0Haxkpv96s
 39PjPmComWkq8KUtRTJsaxAP6iXfA7zJtJMa9mlIfrIEl9QRvy7NkAaydyzi8E5MfUZX0RcRUjY
 jwdRczQ8jlqTuKHhopbokn3OkJ+3LJT97gW4kQPKscen29zXKXFUTsgtaWGTTii2I1DkuJvDkCX
 Yy3EsCcW/BJMojwlGZg==
X-Proofpoint-GUID: Gsw_B3WKIfLuGi-uH5cnOXosWhrawV12
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a047353 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132

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
index 961dce2e6aa9..eeef453c583f 100644
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
index 9a76149f37b7..5fbaff5c01ca 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -17,6 +17,8 @@
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
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

