Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C848C3E6
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463383; cv=none; b=pU6QmjJwozXinE0UVbhyPKTvaVA9Y4FvTc6ktBuRIYou33p8CSp4ekTVJdTEzWHLTzk4n/Nt2vMjGSkOtclkMM12vj4tOwIeo99U1O/Nm9oFCL3JWa6v+GcVFgxRNOrdeBCdIUAllCz1jUgOLQ2whQTnyrOrDwAd52gzNBI6B0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463383; c=relaxed/simple;
	bh=cPTXXI3mknLotK+Tb+V1ad85mR3WKey4eZTl/ep3O08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbc1JE4t6hlPWWaUhN/i9NeW0rQE0aHb90qrrjbpkRavU5ij41ek74LfY5b/jXIEF6AelSZ25qVfU2AtUj6vCiunhakSvtdfgkMtpGhiALhCyesBCJDmS4tseMJVolNrVTCR8VeXpI6kn/P/Yl46bDMTXU5LrwDDZZjBfsNUR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYA+0R5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ci18rjcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYA+0R5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ci18rjcn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Sil370245
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 22:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=; b=QYA+0R5+AZyM2zAu
	AeMCOgUoC/FzRKnxLrvU/u00jZvuY7EiXDYJWP11lfNNI0kyuS8GELIiI3zDfK7K
	OvQa/+j8gaoB93l3XAOdeQlXMX4/aCQvHBLDBPvVNB7nStA+C7c/8J/KbaELdyv9
	gI2fBwGv/v01u7QU6ywj42y1fcfvVsLw9Sa7gunNBHShnXfbd5umuLhCTF20nmZK
	Vk4tT8WqG/Jc+o5ApCcW3lM9OvIaaPterMuNtmaHphJ+ssJPmRNK5bVAmXBONK/z
	MwLVRYR79VPCAoNqeupB+9UVzY4ptGpOXyQDuKV1jesZqHa5WCLDL1kUUMZDPBPw
	jB161Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun3q5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:29:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73fc1f1ead8so5974137.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463380; x=1784068180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=ci18rjcnole5WjMtOogGWIHn4yUryWgqu8G49QZiaWwoWcojFuwBUua2wWsElUPxxi
         In98CBv3qZBnOpb0+ZKIIrG9zmi9ksYEuZbyFwPIo1DFRmrDQh/QZkiuy1bkdCoWjIqB
         GAxHNgXrSK7G90r1OT8yhlrb3S5iMa8NhfAiQICXU3HzPHBe7UDsfkd7dM6ekdQkcOb1
         7CBhhwlh4BVSIvdxkt3PdIq31i/3WnPiEvaiwb2LE2cdKBjPN1bGdGoUuHytF5k79Auo
         /wZpza8eo617T5+gP3ZQcUEqHPgBA8whuqInxNjWZyeks2DUyvU0cux+FRAVJdgLa44x
         Y/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463380; x=1784068180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=mfKCiw6K6DQNLvfOkuRPpD+KqVhAqD7+3+zevQZ4HlCFX1X7dZNYjbZHbqGtbvczF6
         nM0/VHTAKOfIypdQUYn7GemxXDWygNRSvT/qRpo960SKgM7YyETbtel7XUKv+qmMogGg
         SVW/vk8ine+zNDG/2Vh0boR4vem03JjzlhxH7pp1TDTAVPfAk+Lv1QyATjvfHCG4z8o9
         MN8Le7NJ3NWC4Ir5gYvjwJjNJhDHIWYKLXLwlRaPAz69yAb3OJBQUT0AKJlN77Kgt4Hr
         y/byWgtGzbiE4IcrrMe5EnyX9uyG3/n0zeMo9C4O2uyT0Myp+O2Y77neH+p5h7vZTW8k
         da+A==
X-Forwarded-Encrypted: i=1; AHgh+Romyzfvk4pIZN0B15YxBJg9oLTLxhoMoQ9osMGtyr8qY3I3llYNhHZq4jB+8lQuVlFn/pMqBSVxqFhf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk7j5i4Z9hub2jEdexa1OyLVaEZWkTQYKK9u67urwTfuL0hpyn
	TvVaDewBgvzPnXv5gfUzzpFcwUn1BzTwGhGrkecZ/w3+09cLxlOGRHAWjLUZPF2kXW8My35LnfY
	vhZMPbdNrJWUBXS5RrNUoytjPky5zq188oR5iHdjf4IHtCLGXy6XqBHiNjsRPHQTmAROojEME
X-Gm-Gg: AfdE7cm9Y+kshS0rpwMmEvizsnrrKeCez7OXQKz3D8c/5USW3QyHnEuzfsbEUpvcCpZ
	yeodv7/dPYIuR1xRQ3pz6lKSmRkccRr0ErsEnzBs1QKJGsga6+Gx8MpkOnqRJpb4ws29m0BMHPX
	JKFIqg8FxIhIQOpeAidEvU+8N/71r44Hu49ABSEU03qktcksqsd9o3bCJbaecjIZUDmGnYtjVGQ
	WU1T4rlY9GNjZodrrLgl0ssl8Iz+1ee1Ftm1ybTnRyrBoQTRHLiAw4sp3/+CnI9sDJRT3TQ1KGv
	CHrXvYFn3jMWadr3Uds3xWaGfb3IhQtytczC62WKjtm9i8xU3BHMo5nnKhQxEb4x2LOlX1yZoj6
	k0cQzO9W2LjyasPxwS8ZvUVJx1fC30y6gscxoP36YmnvV03hzPcQ8mixeVP5LQJxjX9Qh7Z9MbK
	uLjH77tNCkmsfFoaXstiJgG08n
X-Received: by 2002:a05:6102:5487:b0:738:ff1b:942 with SMTP id ada2fe7eead31-744b7e3e572mr3982547137.22.1783463379792;
        Tue, 07 Jul 2026 15:29:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:738:ff1b:942 with SMTP id ada2fe7eead31-744b7e3e572mr3982523137.22.1783463379338;
        Tue, 07 Jul 2026 15:29:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:51 +0300
Subject: [PATCH v6 08/18] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-8-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5Zv7co/5WeM+BnP+jsklzWfXXH/nE6cV1RUtJfUk24WH
 V5NvvudjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIlxoHw8J7q0ItDh1q4VdK
 PvxoHUeVYRmDmGH+Oie+G/rcKflv172asb3y43Lm7rliD5/utPFSv6y6ilVQOuVj2+PS5wkVr6Z
 4tzN9q6tm9djRYGwj/lxJSGP7Sa01f7/4ras5fvucT/r/dL0dChyt7bVZ3p4MTWWGTxdfDnNYv3
 rT1gq7eR1dH1+pXUivFclfzHSYrfNfNBtLhMwV9/Wdmx5Nb37Wr7pznanYyfAZVyxKTosorUy6+
 /fFd61qTpvS5KwPnzqUC2ILTHZsmBbbnO317pcF89kdZt5h0UdNrx6uz5W4/nDzNfnAh+kHLllZ
 finwE5OfdUdrX7Dr/A8p8/+7vXlXVq3IzDjJPyDr4qd9AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX3DUy+JJeh58j
 CqR85+l4t7mBwZOqVUQdbj0fTT9mgQJR0mflJ33JcZzsWOalsP1cIKC08IUGKtwsup/+wnXrbTq
 KEH23o9aAzYC3MqKv8y7AsIhXysiXbY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX56dwqLR7vxZK
 //mzE6cOR1qM1yay+0jHqh/vlvUouMz2GoljkgCIly3QNOhVa3VQUx32t/e6TPRuHahq1SzMpNY
 6NouSoJWFh1CZ3gngrH8ucMr+QzU0NofrI6GAuwIBzCM4BDegoCCHVQ3VQEDj7iv5af+3abwv64
 /YsVw2uESbfnIX8AM40ehpbdBCL9j54t2Jo44HnAb8QbE0DllY474GCq/mIF3FpigGejmo2VGM/
 e4h7q3F3eFwJxoolXXiMjxVIkzisE4hFTNVwLh4DyKBnciEa7hbP7+3aKJBRMONUpW07aplaD3I
 mWxqekhlOgUOeVYeE3lLxqVJsR55c0yywakuBxCgH25IHNfKj+oNQfMpBTSjwogPH3NbnXAsYS1
 OsxTGq+3Hk6q6o158Inao6mKNIAy29deTs48rROiOz2QPJe4G5s+Itp6eMlssFOhxOP57rlS5U1
 6eZYCUMdQ2Nfd7yYWRA==
X-Proofpoint-GUID: XLJzdUKpzbq7TWGKNWEBi_MQYSag0pRM
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d7dd5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: XLJzdUKpzbq7TWGKNWEBi_MQYSag0pRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221

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

