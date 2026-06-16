Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5434502A
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568291; cv=none; b=aQgptbLo/fCSRUW51Ip5VTCB3ML0FOlkyEOv6fglg4qH2NwEuKNqaA7FByUuOP9wzaPkQNUcmHxcAwNFlow64dc6wY0npgxp9XQf6ycxDpVc6tWOe+RnGysY2RdOOfYmaNF9X3MHBRzAjAV5cY4jyTeGgh++BntS0ZGzwW89kME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568291; c=relaxed/simple;
	bh=w6VvzeXtMFbm92J+o6+RQFxhKFl1bm3gP4NcPPLrgdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpXWeO1PSNajfthTxqXxvdEZ+ixFIWoHmQoykPB2zqbzlrLReLyJkc17VXIdVK/ZLRvoiEM1CTBnklvOnEY3/9Vr6RDsq/jJnULpMA+Rg3Gfw+HLHCb9KU6oBbF86yKHeIutJ32p95A9BKlvAMOPIEgu1Phk+vg4V0XAgZBpx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BirFjMnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIEa7QZe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BirFjMnX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIEa7QZe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxE1D861120
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHinJ5pmzeA+6swGJ+pu13N7o3lyaDZ9KgcAONydjSE=; b=BirFjMnXx/w78PQR
	ioq4PTSxqLkLlMGJi7pey+pcuVZ6wzpMh1w7h9UwF3rOX/3+hN+rmyqmrIkmkA0l
	PvjDPgUZuiIiBZrVreWo3T35iJlsaQq+FQymC/TcXOxIFAXg/NXY+IMvsJSJaT/Z
	yhGZg3FZnbj4L7bqBW6RIEgzX9858tlVXzz4Usbu4pBxl+YsWp+PJ75tNYpVflCH
	B6ys7g8nIFwPtx5BjeuaADHDdt6ULgQjgb4JEXLPE2Kjn0qoauzyKOFVmG8o5Lil
	KfJd9xc95kUjcFfXpSgkVxHCIznEOxG42KAigY9GOyH4xzW2AILGOb3ZlxjZwalg
	Qzie2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbmny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c1997732so844152185a.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568285; x=1782173085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHinJ5pmzeA+6swGJ+pu13N7o3lyaDZ9KgcAONydjSE=;
        b=iIEa7QZe5745rbtdkbvmLrdofIUiMR+yqCtO8Wj53PW6SDJr9mvdZblqp1iDNVPmkn
         8G4HTYT9LFU2pgJ5IF5St4peni7R7x4jfGb6Egm9ks21luEy1/XvwzW1lKQzDDkoIwij
         G6CB/WZHjB9sDzHys6Z9KigNYUv2LHcoVDDrHUT5HzFFM8kUBefpXnaoCm4D7miJuDDJ
         rvTKF2LbMmEbOuE59RIZmRkMMlRoUdFgSTR7AgVHBRaFtRPx1dUKe6mK4fDWQzjVHrec
         EbEXU56tN0cD9eK8Gvq2ANnK6cef6Vlp/9qMO9y0dN8tJusnag7pzMwfERwOfRjii/R5
         EEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568285; x=1782173085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QHinJ5pmzeA+6swGJ+pu13N7o3lyaDZ9KgcAONydjSE=;
        b=JhVH2EeZmLTeHt/Mjzt/oiAlK3OCh7IEIx+ibtL2IFiJDMz7eya5dd7syhstp1vHTx
         YU3rJTJzNE3EORC3e8TD6Qtg47izOUala9Q7n/mq7SAbRtDTKgXsmMshw7rbMgj6+GEf
         LOJ3SYJV5U7xTaQvJixnf5iHXGN+UCVc5L46O/J9PDW3Nlf/Ny9fKICkvN0MswUGk+oK
         u6gcQFfDKKm0fA6Rf7Da1dNS2BEMAqxRhHf0jmGm5JAP/bQI0ygQZ+1qevaTpZqg09es
         elfDLPsAk20l59CTyPTJGHX+9LxHujT8guegGDVV3vdaXulm6kROvwYbtSsePv90mQQK
         WdXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yvaVsBIwkbAipsKY5+PUB2jI4/9xUuJSSYzI5sSnyoWwYm0vFp5ac4TdgTfs3EpTx/7WDX/WJ08Yi@vger.kernel.org
X-Gm-Message-State: AOJu0YyBOENcJY1/d9wMkVWsbdN304gqZkaTn8Efe5pFLiR1zuqL6bWy
	AP5VYg03eo/9HFZgpuAysYq9sBStSMCDBdf+puA98y33UYMsatbyez33XqDj4N2//bEFAKqvHTy
	rr9IYG238fc9cJL4Kun8JhDtUFP4WC+JAXWOzuLss1ZLSbpheVW2fSVdwvGBgFWWc
X-Gm-Gg: Acq92OHZo+k2RQemCMfVOTAO3F+CIy4bMkqmaAmgsd9PXjVIEO7es1Zcmv/l6Pwop7h
	ir8jHVBLTclK10nBdRzh0/Q0r1IAAbBwRkFrWwTpZYgV8WbUggh8XI3TAgooek9SQd+v/d9cHfP
	3wV0B8baGvqQksD7FKkz5LOHzot5feopBx+2BtM6E4UBplmc9l/GbDorGRflYTUeIkdbCnTO/cJ
	c4BhlmU+qH+6tUJI1nZsbvdyMLDPCsxmYI8/yLA3b9WjJ0sjTsbGQpS0DuY6FJwcLGBs3g7uZQY
	xfolDZNnbYWHZeMjyuvZRAiNzJCWbePm01zpywAXAFvAyAn+4nX4R7KmOi8CJpX20AuOazVWzaD
	nxtkqXtCEedg73PXzrPtbDVXzmzoFbdurEzkcbvibiNTj6wqUro5S7oJc+XQkqUQDt1olf77pfE
	HUSNeEwiMdsklS6SE/TwsSz6o4Tv/c1aNc/LY=
X-Received: by 2002:a05:620a:84c8:b0:915:9125:e649 with SMTP id af79cd13be357-91c48b34225mr213379485a.44.1781568285333;
        Mon, 15 Jun 2026 17:04:45 -0700 (PDT)
X-Received: by 2002:a05:620a:84c8:b0:915:9125:e649 with SMTP id af79cd13be357-91c48b34225mr213374585a.44.1781568284882;
        Mon, 15 Jun 2026 17:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:29 +0300
Subject: [PATCH v5 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-2-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5156;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7eAXYetUjHA2IWQTpRRRPO4xYcQIYvJysU+KoTDDI4E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMOCVxIJE4Ld/rO9Q7yn/i8ttZAKx5qQWi63
 m8rDhp917GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1QQaB/9Cs+A3xnIsEPIFwBSOVrrECopmLXgHrH/IIKZRfSKjijMQkVawulOo96ZaphpGTVfQ9/3
 AF+0G3tmGSgsnwFK2l3aaGOC8oDMiD0taI8RPXIezmElaw8vzJQRSMo0q0g1BAp4GkUNS3jRGHk
 KTW2j5pvjIdy6L8cbKi5iEwhMlJMFZma4NWoafEY4HOvuDA8PNfoDur0VWJM4lzTh20386ZyPxi
 r7Pq50hXX76eVSR+a/Su1Spy9xb0ocMQkkRQbSC7To2U+SVcLvENRTOcF0fdth5j4Jny1UrcPUq
 pZhUHRHcjA1FlMHHFpgqXhpvTkHw2bumvMRsp1ib0kkzcKX0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: U4A1x9ovb1PvoJ3PYD-RfXDeFQVkzzmQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX1g9giRrKP2Zv
 lPVT8SzXaSI6/88wBfUGo6a809UZxZfqoJvlIRCflqrm6JZTWOpY9ChlV3uLOrJDy1KBGyRJAQc
 1qAA8SLKjn0PuuxpUYA7eWJcN0VUX78=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a30931e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: U4A1x9ovb1PvoJ3PYD-RfXDeFQVkzzmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXxTcmpWDED/C3
 EEk9Z0xdQlKFqo4sVNl0YXFnMaJm2ezjNxZ0Hl7fs7v+EHeo4xwvzVjWyav8XeYisBNuwO24jwk
 vLK8Y8jmLHo1zPzWSAxAEGPSfTfSHm00vJgcGwnIISo+O/Wc8PKECvq8xfWSVBwFoIfCsd4kbpU
 qDudb09IIPXF2mBYCms1x1NVUWv5yVDssEuDyPRUymWDZTlgH7QbKRrp+vxIkHUfpcaqwsmp02O
 D5QzN/+uLngF/LmUf0weQxUfKjTYOdQxWjf2su9GD4OeKPLr8FtkcnkgAogWMhbqpFjexgSdZrE
 7ThKeBT/1vXH14WmfBtTtlekkSpow0nAOa/o++HcrbZAcIQBpSZFNatO+hgUH9EzJoikI4e+zne
 4Y9oSDamDgFl2lgcHDQQCac/F2NSBEZCCyLoA6WWNvGGw+KL+tGDPskU4Y8EEgXZ2Dk0RcCaZwQ
 BhsHD/dUwdEiv34phqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150254

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
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c |  9 +++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..63b7c9dec60a 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
 	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
 };
 
+static const u32 iris_vdec_formats_noubwc_cap[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
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
@@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
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
index a945992f63aa..2cafbe9f8abb 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -91,6 +92,7 @@ static const u32 iris_venc_formats_out[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -98,6 +100,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -124,6 +130,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
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

