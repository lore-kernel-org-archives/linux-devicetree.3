Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED56441A76F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455326; cv=none; b=GeIMw1UPYo2fVp0VXbGYdsaXULkhb8xIqVWEEVdysRGFdIxonoBnXFUfsA4Z+qcJVJL4+Zek9Ci2OTCR5z+jVApyjijY8P9yw/5hGbZ0XORsve+omC6X++/0kBo0GmqfFt84G4L6ph+Oz5Zmbq5R5vDNN82uMljKbhzdjjkgXng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455326; c=relaxed/simple;
	bh=UqR7JCx3AsHFi6Of58Oo2FXxMtcndjl1ZU6I5Zx+Tns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJ3NftlB5w8HEpK7fmTzkgZtJZtYWdrer+xOwuDbhVFLfGpkOC7HmLdWfkYMW26UayYHp8PlFS54YGM/ujp8WN/h5AQtqkZg8N+ErAokhngMyEYvAJq5L1LJjIguL+05xC5HwqFrm7qFcj2mv3ufp7SZfYdhEOl+EJi2fF9pBIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhNX0yO5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpXOtZal; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhNX0yO5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpXOtZal"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMqrXd2064756
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOF6mW8u+mcgpBSLz7Y/Z5fdusWH3hWcOP9sfEPktH0=; b=NhNX0yO5B1Xreb+Y
	DhnBMqjPyWB9ae3diwAWBzniDnRzxJ0hNYXQaZz5qXKKGwmdyjkai/LN8xjcCN8k
	II8wcOXscFd1JiAK7Gd95i3I5uLuayFbNyjE8yfqdT4+svnv6gVPAZl3ncWDUVQN
	56+DbU7O6q2njDSINIHBcw/QKHbnBKhkl/QDO4vFoyxp/C0swPgZlMBmHKfvn3Bv
	K66rGg+Z3+mAKTXXyjmvoF21ETeYUa/yw8Aee3+bgWAwr6C6xjeY/uiLgdgd++yR
	hNEFExzLlWoiBBt5oWT8Ddw/OzrtBpc4afUfwpYqfQKON7kixSJnIWsCEoyejz5A
	mgKdLA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfja85jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907a1e04111so5346156d6.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455323; x=1786060123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOF6mW8u+mcgpBSLz7Y/Z5fdusWH3hWcOP9sfEPktH0=;
        b=EpXOtZalKhx9stntlYETPZ8udk5RGTBZ1b0imX9aGbuJ2P/f1wuHiNMtiwnYx9r0oI
         acoH7mvspyRtNht0A9wD8C5ZTP6a+1wUan7tPTM4Ce+tbU9KxzvdjpFAlfHeaRo+aSFs
         vPE4ytuKl76S/zZqwa0UoibcvN/ItUbbjn4K6g12kAdVapm9kgazHUeqmPOM9ioEiPZs
         o0+QxYSslrxEbXD9ynQ1Gwv9Lg4OcVa8NxlkauUoQI0aCZUzzua3FnzSMoRmdm5VEvWh
         7C5JtWHouJbrNKlPxqGnTEO+7+YjsXvw6HoVkV8TxrZYzb68nUlcLUsUSSrk/2bl4hjW
         dsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455323; x=1786060123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOF6mW8u+mcgpBSLz7Y/Z5fdusWH3hWcOP9sfEPktH0=;
        b=HaUuS8wMnNcB5L4olQ7U5HFjJQrmpvlTSntAWhT1U0/c+7fUkCqikpntB6ZJFL5ww2
         a3CzR6SjCcuE2Efq6c/Nd04/Onug4xFhLuqxttOjzzsifeWfdvPjHWE7hIiP0jXbcCP8
         +MaWOcsszARZlRkAX/awBva79gjIJDFmq0+DoeNz8zrdfkX3vipWPcnLSSPDrOlAmGZu
         DH1K0J3DjOygzWNsABr9WVvY6V/TAQrc5UuPuBoUQTzUDO83ve/KiUbWg/p+eOXiLOEM
         ANUsippok+lqB4ENSzSs6Yy2mioms4A2zsrIZWvgC4BD8ToYm6tkqfTOQR2tLF58Y85D
         RuMw==
X-Forwarded-Encrypted: i=1; AHgh+RrDk+1QjBnOzjZAoG1wffYxRsKLrOuyQRVbnCbMpks+zCW0eAVWkDeZ8PauucyBPFR+qJ9w1/F3p2RC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhe3CgsmWhBNP6//uIhAF2P6lUPNmFjwU+ErVsMYHfPZ9LQV8E
	WhMmMfelVk1mDnWKGJLez9o8id/1dXmLi/e8Uc9rKsS1K9Lo2H73EuqWBzYzDK5qXW2kNrOFKk6
	o6A5teGRs3ikk3R52XzJt3lNmXtVoRiFNpUZyTDAP9TQZrG3zpSbe3YCqKvtYyF/U
X-Gm-Gg: AR+sD13TW347YVFbGHjbZXGREX6eW/NIH2l91+Q5YPJCIqzislSzqLqC9jn4NvwDK1n
	mXRaL1I21TKFV8LPDbqFuiP3UQJO9cCZRtRTugpTcC2NDmIY/pHYc+UH0Ij1jq9laUabVNXEgW1
	hFVQA9GdZFFgeQf6+TZWW1Id34kJ3/8v7tQyVJyD3vUsuZjzNF2hbhbSmpk/q0E25BvGlJs2JLY
	OAdAA144M8VRcr+MExTxDIAeGW+O5lzAtWHfyJ25n8NAHCeskVRipUXBEq2Wpov9fy8DLM7gkBX
	bi4UqhURMORT6vdnoCg/udjCVHMcOmlmRrAS7yTXV+XbidRdyKAFxJIfsMhojaCQAHHJ49CE/yY
	BthzWQFL8h+hZWGUUGC3G72I/GDyYHn9KV6zDKtwJ+hloFgKd8XTIfJaGvAxRmamRexr+VUfbcb
	woKFk06ErmHB7EXg==
X-Received: by 2002:a05:622a:5149:b0:528:3b83:3483 with SMTP id d75a77b69052e-52b384b0630mr51774291cf.23.1785455322922;
        Thu, 30 Jul 2026 16:48:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:528:3b83:3483 with SMTP id d75a77b69052e-52b384b0630mr51774071cf.23.1785455322476;
        Thu, 30 Jul 2026 16:48:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:26 +0300
Subject: [PATCH v9 05/19] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-5-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=s1WY6CnSsSdbwrbtarQlKHIXpgz9X6EpNUw0sdwkkxo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LKSINhLEjMhIimxh1nuG1driAAQeFF38pq0
 ZucoiIUWe+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1dNdCACKhb2vJAmoNSVLr5rUMNvCH4GoSftd1Zs5fzWjjXbQstBZCnuUULnMsDlJ2ScIdhONB4w
 D0UDydtGRh9O9Jx1UqVkcc6Z/oDMnQ7c4bqW5ZLeHy6KykZDjAs9hC8rG5TMLYqI+6IWY3+wOa0
 vIALxCmMCtfy3mgP9xNA9SFAs+9SDCOYQhioglFxa9la8i32wCzJIOJe+pXmgBuykgBNXhJaYVb
 DXKgxqYl97bWkxF74Sya9zoJfSrZiSMD/6RE4ZZ7F+3iUCKqzJXawNqTVpNRUbYhxZfUAGHlyRv
 6iJwxEOo8YO/sFfBY6j3NKOHu9fAd5lyZrVtAB+xAwSLHRCq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0C_XRmiesc5vvZ3cn4F1Sz_A3COtWntt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXxWQ25rho+pPc
 mwW9aHlsD0STW5UlDyflYPreIiL6XaaHAXofSFlLwcimVwmugCFTZNcvrXbIFX39ql5+aZFTwDw
 GZN550q5aVzHUYXkbhMXtH8eSAUmCE9T8vgDUYbL3SzeKXUJuwrVGMTDxm8XEZi9IK1Gj3oeLxb
 1WA/+733HfoAJm362LIV+1nHL43AaRUwd1oT6JMn9Eo6PwmDuU7FtqhAYk88C3Qm7ennGlUZ9P3
 +JF6mLr/YELXYXU6RaCkwWIWEML8tfUqaNbO8F18x+/xh2HWRTLgL1fJq2UHCADZaPA1E6odI82
 V29lVCr38FKQgZa2O9F4WVx2NhkeZ46VyE5p+jBdmc3bNbO4fOK7E9S46dmWqPuJ3aEyPVsrNtt
 lkiU0vrhQpjD85Ec0jnhrZSdNbGu0UJoBHLYw4/kX8vHpvkEFy6S/YG3GUWQyweu3Xw2ogZKPUI
 AH8o0OmGYwsRSdR5EEg==
X-Proofpoint-GUID: 0C_XRmiesc5vvZ3cn4F1Sz_A3COtWntt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX1rpvCo8HJT1e
 0DbovsUq/Qta42910IBkzT1Nls9MjAjE0IUtSLkR1pwIFATekGz+z1DDVuujD/cCw57uiU1Tlib
 oxd7VnpT0I0/QXsXfdYMWtndbej+qQ8=
X-Authority-Analysis: v=2.4 cv=XtzK/1F9 c=1 sm=1 tr=0 ts=6a6be2db cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index c4d13ae58336..0dd33ff447bb 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
 	V4L2_PIX_FMT_QC10C,
 };
 
+static const u32 iris_vdec_formats_noubwc_cap[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_P010,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return false;
@@ -100,6 +112,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -109,8 +122,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 16c52ad07e2c..2f2c56bf9122 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -89,15 +90,25 @@ static const u32 iris_venc_formats_out[] = {
 	V4L2_PIX_FMT_QC08C,
 };
 
+static const u32 iris_venc_formats_noubwc_out[] = {
+	V4L2_PIX_FMT_NV12,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,13 +128,19 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3

