Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289533F5B4
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136141; cv=none; b=OGRJYRvrlZHP7pKxZGZ2VCSd6j2lElHedFOO9wO/5TWO5zddIFks/FAkp557RsaR9CSXAB5YPkqy7aY2UsNP6iHZuhnCBvLu9sLsLLKIVuD+f3OS0NZSG0IHThMvH4MymtpnDOKagX1ZRMhDaMROWHTJUeuwL1vPtrB//Wnh8UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136141; c=relaxed/simple;
	bh=coVjg88BpVVzIxncaZzLG0g/mxYBRVsGnjNNsfMl5I8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QoqCxLIPWNJcviniy47ZGmLxAwApHF4/qXT/t6EY7hTLgQdk8FDvsyvmD8U4kjEuTYYii80VQrmyevO8b4/rlA0UQIwOyzuINvdXaymjtlMlaIuQQj+2z9XZh6vQJGP6oqKydOyXdftTdiEGlbFD1tLrKyKvN1iGG6WbB0lqXJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyvzPLMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUX6Hakf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyvzPLMi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUX6Hakf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472LCqM3463986
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	72FCffrovM5qoqfYzfgTQu0WKk0ryn3kQM9UYoEJSWo=; b=NyvzPLMiznBco5Qv
	edkJmlgk4mBJeXA7qmdf/cqIW2pzJ0J2OWAenUzrlPsm/gvdn/1Syj9rABs0jsAK
	FKtfeD4iJSDGDGYXe8YuswpQHoFRz9B4WNLWuizKbtHs7LrX9K1IddHv0kEqqcGy
	X8SsMcEyCfme6rhCFCjJprWYHuLHtUa5lecxFF9buWRKVL9sXKpKlz0L2HPmqadg
	SGDFASu4XyfUc2LsfvVLmouYTnxuH+eSSktG803HLPXKM8E6q8mo6205zNFkEMyg
	he6MygZPQmFprMd69lYB7+G3YLetFiCPl116k2yJwJoFyYB6F3+Uj/rzNnvACNSF
	RlFgYA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn0su7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50eb8bad331so14787801cf.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136138; x=1778740938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72FCffrovM5qoqfYzfgTQu0WKk0ryn3kQM9UYoEJSWo=;
        b=dUX6HakfNm82lwfOUADGpiMO6xTuZa55WC/wZ3VwI13zJO+upQAXu0A4WREiB7Yqjz
         cpKUW/8aVIdsPhHhntdJQhpmoRXHfS6MNzin+E6Gx4AMVh7oljZ0Y6D04KqqxEJOXEWu
         e0aKEVvyuhF5c1DAmYyb4ce+Rs9uO7jmIHvZ/t2dCuF7K2LcASe7g/556R6OyQPm9QlB
         LmQ/N2rKfhoJdrpg7tNuO/r1OlJrkhWGkEYuALtCyDHK9lLBNWcIq+lXMO0JKDGp2Bsj
         XJEjXsJOyi0xFtSqeXVX2icmAgZdB9fj0D3s2Jc3s9fxUrgq/RdTCBBuQWni3JGNJYtK
         szGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136138; x=1778740938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72FCffrovM5qoqfYzfgTQu0WKk0ryn3kQM9UYoEJSWo=;
        b=rC2dmQY7EjB8nv/SyNzn4Uw/X0hx5xhhGQl3iVMvC/CHuci+ZU8zsE1CReDnH59kDC
         Jr3Qp4K+BNFRJYGjxKBSo86QNjNrHjsSvgpQeU7a5pUilPVlQIwXTLusAKPXg/v5JxFL
         VChxVrKXpMroT7rJSa10CrJeE0O1s/NtkP4hRFcn9KnktthI0/TDoM+PKTtviR51lVrz
         FzMe/dPGjDnGivpdJx3uOtWUJp4hP2VykacF98DGsdr2VIfvBXno/polxxrRl+DWw/ki
         AUA2feVcOKMMW+h9zbGscEEtw5vXx4yJsu2RbjEm68SgBvIpJSdG/jhuoNceGUCMkN/u
         mEfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8loTRra0g/mqreDwyXyTVwMsNdGTvzVyXs6TiskopTgKG8sy1Ey3jUtr/ictEJbiKIZt/eWWtiuq/d@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9RmbQUqjMBdewwtp1IJV8JvBeaCjtDpkHBjoRW9Lshy2VCZG
	XRa4xidieD+IGafjEW2aspv/C1LGImOlo2mfip2eEj9ZBc+ZcAxT8ggXJ9StMJ9hZDouRfYFiX5
	Qn4YCjUxW1Y75/R5jA4RhGy28MphqA476t121W5+Rb1advFIwk/hIyUe4KWxy710c
X-Gm-Gg: AeBDieupnNK/pBwQA29nJjv6SSev9WBswq6ZvIs21VpQtNbk6V6uF+zuiKF2cv7xi/i
	bZP7scltZ26H23hFNEz8j2ORT+c1SrhN4dCNDTMrpUKfro2L9C+A+pXi27DdDbPGj9VRkiNV+SV
	8CQlVVJKXPgtWziNcinGUSTkUVTnnvbdhq9leT9jDW3D/RFFazJfCYXbhyRfnsw3tl6YD9VBeZG
	JZlc9q2V9WxbQXkXOAmtjNzKrVOscAHgBnViTSpAMG6cC7tgBa3tVxOhJTVOG+Prdefb69nqfGk
	qUEB73A6TuD24BUy1Y6+Tmd+Z9xuORUns8ozjndkYSeBQZMu3Eiy9nzR/7Cd5MUYNq9DJH2rFtz
	CmEFwEARMwFt8hb4Y/Fqv9oKTLWiS4klKJAkgrfHBTz9D4DwZUd5qz6nMdq1PgwccD6OwkewHBJ
	+9n9I7DducmXHu44P0ZzE/XcnVY+ME+Q5oKu2f9ZA0KhnoaA==
X-Received: by 2002:a05:622a:647:b0:50d:71aa:6b67 with SMTP id d75a77b69052e-514621d15e1mr92134431cf.53.1778136137923;
        Wed, 06 May 2026 23:42:17 -0700 (PDT)
X-Received: by 2002:a05:622a:647:b0:50d:71aa:6b67 with SMTP id d75a77b69052e-514621d15e1mr92134091cf.53.1778136137385;
        Wed, 06 May 2026 23:42:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:02 +0300
Subject: [PATCH 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4413;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=l7we/4v2r0lTXTULk2MQKkzGpBMGA2OLuGGhvYxgzOM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ936Wpyvsdx9AspG9AitCcbV0Q35E2ar46J
 YsRzVNM5i6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1TDyB/9DDOhRfzzww4R1R8G1YkrfeOYlqHS9zNDuMF3FCIAfwjqxvPV67DRibXuFaPeLdbzIJ7+
 Brom/ZxpQZ1lJ7FTieK+eV5BGsD2ecxh/1UqcQh8xCeAn8+shg6cu1jsrbk3qzzs40wICeVeme0
 que/ZpLrBxUAv81KNq5U2XwqNu2Ewlfc+GGUpVeRKTv2qFXO++GbPv7lL1nNXkKBnpZ8/cR8R5m
 OaKjQC25ksbPdGjeMnyF/vnGDPu7M+H6a4CVwqZmWxNBXOCrQmz4Sxsy97qyPOcfXO6YlU0gDVQ
 AS252WkO8qIvR9vregYlDHfqOTBDEVGnQ1eqDK8d48XtEzXU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX/lj07UK0epse
 WiG8b8FZg9zesd8dUnim74QJ+9WxPwPGHsP2KMx41+cdSFrQpZ0lB8KPYGB983e23luL7LjpKyT
 lppxRea/nPjdd+0d28M4wlHGD8glpam4qDakzWoNJ3O89y6gh9xaTJYs/vmZtSjDnoT6DpBrlH9
 +IKvsldKd37Nt62Yx9t/186i8+JOhRHHdQxiyjXyaTRbSRe71pxBJ8937XWiuX4FhFKbs52ktS6
 PIuVHN5JvtPTXGUt9Lb2bo+MgbDJjRf+mKAp5PGAuKKHRKRF0eDdYCT121GmVYfTjTECNo4smqg
 3XkEBBDpE6pDDoT+ufFc5eYUMMnmaMrBPVD4JA70gnlCQcU8fD864tTEccVAfXABPPhIQCPmsS9
 7oqVGW7WL6jhG42Rt3GJFJug4dyZn8Ug/Mf9w97qosIfSDkty0B+LJTre/KpzNyRM32YknBYdTi
 Jm0YO6OI8tTJhWG5QIw==
X-Proofpoint-ORIG-GUID: i76aiPM0ViF48pPZLHqv9nBTZlLC2RVa
X-Proofpoint-GUID: i76aiPM0ViF48pPZLHqv9nBTZlLC2RVa
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc344b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=HWmRtQhKy1KQUjwlQEkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063

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

