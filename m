Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D702647F2F1
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845700; cv=none; b=jG+EGzzxa+Q/K753yoSU1HQ1nMEnj8Hk+vpXKEZpkT7YJmhx8LbRCzdVBXL7CIvO/slaFHE9YVCGojkFWYOBgnuqcaSIE+fpefpE2xtQUhUXvCofqf/IHbiURLoMF/i9Cflv2VH5OZPwQzc3A7g3wwiy9gGxQRY5EXeg6W8n1/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845700; c=relaxed/simple;
	bh=U1WEKcOZrCsXwGbYO3VwEdQBYlx1VxXoS7cDYZcOMmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrbN+23aWuE167p9/uvhIHSbPR95VinXd/aodNLwHFZ4qg1wRVMcKwxla4JZLcKtunXZ/LLO+0rwE27HAGUPdKvpZKPtcbbxgnvwTCFx6c8midT2UEIzVTfxaSwnZGIfxNXLD0MkKD6EKovpPryGY3cFCPUfHLiQHs8UP2Z3fmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fuaoj0Vj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFScml7/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fuaoj0Vj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFScml7/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAsu0E654914
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=; b=Fuaoj0VjJsLnCtKI
	uEVz5BrMPbM66W/D+Qc3/EtBTnRmzH6J8FiLJH0r2G3azUl4lC94a9sLJtHtbogy
	r6COYRNKHr/7d7IquKp0cw6EBo/Thl1/d8ygpnVptXUEGn8D+gK8sIYygkC7fjgJ
	EPnHW5620N9L9fTl7js9puRSxvUk7YW0Wz4w/lpBDcQ9rhc2q4CVpa9p68N4VOEi
	faakD5pYHC0GoO999im5vSJE0rVj5fBoes/rzdt4mdtb9WXlHdHIivvCTbzhJnfU
	YfDhXaYga0Xgilkp2DTula3q6VYbDdI1tfpYQMGKx03+v/thNifMOUwTBza+5zeA
	EGVvAQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu5g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514551d5f2aso250573321cf.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845694; x=1779450494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=;
        b=WFScml7/LNs/YWivu1pkWihQmR8+12jv1boa7ONkm07apGYOaxPkWMOIQ5uKo1HFkc
         GCnNJ6JPTqx7+vC2CvBwpjtwAuW95MrHrPClLwFG1pe3u8aipNOmO/tkDTIVoxSMxQjG
         zkWxXQKJXcvvfFKas+hN31CEk9kIuhFSW4PKBLXUTa5c41fri9hKSktG/pIb4IHKv+rN
         lk+9yzrNJtN+Dz0WEJMqzIKjcSI7bhLZQMjNU/VUbFwpp0n++GlZ4AeTqm2obgP0Szdw
         U9SO/u01ix5DtT7Dl4PU2UZYqxxCH6h9Jt+73gK/FR+LPHufZb3RE51YGsZQlgWHMHLe
         0XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845694; x=1779450494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=;
        b=PijzkV/LGewLUJuMtclmV1a2wJXIf8ogTYLT/qghlgASsjh0LqBfwivl3m3b6AQcsA
         FMXArvMpGIRfZP+GuQf/+5eitWwRZ8nZqdWk9bRDkjaPsvb0EPrOn7s3oH1jQKKzWnwn
         fO3385Dltx1quHy8PUvZCpPUM9oKOoyeF25OqQlPKCi271/nWjxlH3UJe3jsaNcNGxxj
         R0CNheDT1mC21Hn+MV0St78n9bkIvnZLVmj25wi83lhczlfxe+CQY//23uBmQCbQvScK
         j383d07i4Gg60mTdd7BPU9VP9Fx4XijuJpFydn+RVS/zBiYTB+fWJSO3xiZdF5jACIP+
         xhcg==
X-Forwarded-Encrypted: i=1; AFNElJ+l7qutU4wFgY2ZeqmTALmyXbWMGzL3PineZr/C5v4EM7wdVz5+e6cJ6Rw2a/dBc33PtcId1LwLA8Tr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zjXNrlgBIMKS4eolimpiqw0eiBGnVU/VMN6FY7AxBCvrronR
	E1AKC82C37UUpsSU2LKYdDXa6ARN8eYnPOT+XFOWXJZBlGaQuvOyGsBJciJKlNnN5s0aDxi0x67
	PWMsw+JoVIKI0R2FZgJfHSQjOH8rGU9RQAAHraJ4qvGbgJLjvhYAC0PBxUkw4LwrF
X-Gm-Gg: Acq92OHt6BkABawzF9EZq+YOpQSx/v1fksmSEA4UVjIR/BFnMugFt+kDAnAGvStzKsa
	ESW+mVBu1wsL5fz6Yzaz2SAy0w6y7QlR4rMY5BwnJdUshVGG1QFLKjYw25MXDOlxsyG/IcXLyVe
	9vWzepQCygLLXce/xXFoge4VX3/+86+U1Vg+m1tVl2KGWXSaJ8ZhHYMLlqByZYuwXu7ZvbiPR1d
	kwM4/LiJ1YLjlz2+v7FpoPFnOKZfnVtUyodfXoXbIyMwqXjCE05QDHN7a7gEXc8M/0gZpxa5FU2
	V/6gPx+5azcEmUE9B/86MDNrx0wKEA8AQKkUUpBxyhd67UCpf9o/MGnzLXG0YXgvizZla83HnPW
	AjKiQO7Wn+by27fE6t/GA0HzDGkTB6x3kwm7OnnOxiJDM+fZnZyJUrb20OsC8XFlzn8AWp+uQch
	dh3yKYVJLv9ENZWcoumcnR8rUPOo1MAgEKAgUiu/kCrHhs6g==
X-Received: by 2002:a05:622a:6201:b0:516:4fc0:27ac with SMTP id d75a77b69052e-5165a1f4f2emr48630391cf.50.1778845693954;
        Fri, 15 May 2026 04:48:13 -0700 (PDT)
X-Received: by 2002:a05:622a:6201:b0:516:4fc0:27ac with SMTP id d75a77b69052e-5165a1f4f2emr48629731cf.50.1778845693441;
        Fri, 15 May 2026 04:48:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:01 +0300
Subject: [PATCH v3 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-2-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4536;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X3Z4HL3UZoUysuTz1/xwzlwJPOeZfHAr2V3R4DT1iDI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf04u5V7a0CdPnHXhbzU/0YX52imldiIFn1O
 kYXoLv07n6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1cDnB/oCbahHR8DTH5mvvr0QxrSYVV7jmC0bmzbKIciGzaTBCM/aEWD6NYHsk68PQWPwQwsMg5z
 cpMDawc2ggvLXXAt75KifTOgQHa5Pr8i4O9QNNy+4xwKlFNd/59PUHfZIXCmehjIb/pLsXgHu4e
 zdZc+AmihXWrx8vrUSSzTVb8cwdQqSNOua3MnJ7pW1JDdEqrw0SeBWk7+CWRG18Px3q8wcFcitJ
 s0uPFKYMBuDaFRYvLXnFwrNNWlpILB/TogopKSnH8/hYGQu3eOrUpB8SX/EnnAwrQ/UICtY16K/
 RmdtrlscllzooaTtkUK+SfuSf7KxkQEDgvYFKIifKpsKUpVA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4u_3zcODr2S-PvKU0w0R2r-tlqIVPQaZ
X-Proofpoint-ORIG-GUID: 4u_3zcODr2S-PvKU0w0R2r-tlqIVPQaZ
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a0707ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=HWmRtQhKy1KQUjwlQEkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX3JPxczZiLqUq
 9cH2taix7T8G2PzH+ETfZDqbW8U8LGvgYbf8khA7dvh8k9unGqpIvPJwdXZ4OOHIiVJcu2596mW
 IRUSE8mR72+amUDNmHUfXn2Js8UmbPIYNV9FdXkpCk3nKm7Nn49Vnea8COJfETW8b9fuAKPMlDv
 eF+pYmOpjfxz+1B3yQCAvwskCoHAyuvktndUBm2cTNAQ+e90KKDw04FroOG1HhzG1kAmxyzLWwy
 xAhglC2L/SItrtTcye0eMS6BxQf/KFjCcYVesOvTzMw+qQ8Ft5GaGq/81BABYHpagYFo0PHXV6c
 OOF+c1CNcp0XyNNTi3ThuFkzmhrOBguSv6JHqKHEMpNjTMo0h0y/IQh3yyYxiMQaXf5awUV0MDA
 ZnBg0aDKCc7AORZHjLX4Rj/rv/XxDM4276MVSd7h+1/DxlVqpTCLpMqQauGxYvzaH6dVlPiTle0
 KTVIkDDbL02EfI2SHhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 9 +++++++++
 drivers/media/platform/qcom/iris/iris_venc.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ff8d664558af..bd44e6437480 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -74,6 +75,7 @@ static const u32 iris_vdec_formats_cap[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -85,6 +87,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return false;
@@ -100,6 +105,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -111,6 +117,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2398992d0596..c41f4103ccc3 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -97,6 +98,7 @@ static const u32 iris_venc_formats_out[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -104,6 +106,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -123,6 +128,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -130,6 +136,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3

