Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D440322C77
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604533; cv=none; b=g31B3Ro+AKXcXeQnMTKbTjPOXIxrCQD5n/rOSA5MsxTCenrrhDxJ2g3KKTMuy7B6YOwt4K5x5nP2piPkSDxs8ddx2l6f4ZJmbYMMwG3sOsSIj6l5LV11a1rNtuRZ9kwGQ8zXmGdoUKmutrUCN01GTCfy782u4PKhbxh7gblEejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604533; c=relaxed/simple;
	bh=acnsSKVi2aqjcn7maAiEpfFJlJtCDzjZpY88Lh3Q2Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSoxFHo0ws5CCnOqUcPc6TP/okmP2mS6+I9q9GXM7sfsQ6L1oE4SRGAJuEfzKBFw12hMoXLrz5eXEkCFFnddwyWVVhZgt3i8vxYyQJbZFxplBw/J+2poJox44/zNuWla2rhmSSnRnuhkcGMyMaASUEw8o7eUO3xxgNOpQCwXtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cO6M203q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VURdcdvs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cO6M203q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VURdcdvs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDhF1575388
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=; b=cO6M203qZaAkVx0t
	tRs11xo5OK1AxwHsjmLF6x7TNpQVlT3Y4b0oxz/KaVblLZX3TceNR3kAALjiaChz
	D6qJwINTGHUPXx1lzAuy9zU2w0KzyBwywVk5VcEqq6+O+kNb67ykEtmB4KO6KP9N
	mRkriKwl3Tibkua/oyxg1d9ra50K2UR6ILGRql7WhuXBEmoae+UAIUHZ9VL8GESt
	veYIe/+nDw073zMRlTEzH8Pg6qa7HNICbUqtJhVILb+1eOTp30FCC9U0tjSmgiTa
	D1DdemG0HaHGYC7vSc6Lkp9+KIV92yLMqU9KtyoIktfjAieDI/9cEGYP/c6qWZI7
	g5PwtA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcfu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e80385dbso353254137.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604530; x=1784209330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=VURdcdvszLD9ZEpenRQM/T7uh6D21y3MqYM4KDWlVgz7h+x1UFEqRJMwkRk5uuNWaT
         YwpxclzdIQY0A6YDwz2Lv5B5Qv222ihJM4U0qXrvBfkTWKKvAzYGOZ6U2tXqOxO/GBDd
         AY797LlLWwXFHtFt2oM8ZgxMahnVdgW5qCkkwoCw8fl0sUL+ETFqbpuInM+NfKDUQJ+n
         nXPhWgKAoQOzeIiZfPMcTVrjE/r9PF8OqxWiiNYHlXm4KUgN2bqE5g+Aq/e28quHc+dQ
         Y1Q/Hu8PB60NwhBZwUm3T9WDbTxq9PRNm+X7foMFTFhqkM1XcaI+XtDgHLos01UprHjH
         4FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604530; x=1784209330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=fkBCgXs1t8RlP4K+TUJzmmFdt5E4BGqNgtfgy7nZmQ5txrVCqI9BZg2sS3ExkIj95W
         03/uEwuQPeYo3YZIxKE4mXygCwfjW8oMp0M2v5foKEB2gtrVC0ER+JC4xYC0zb04j7m3
         dsLJSOyAxh0dSf+15bQwkRq25fUPi3WaTtbbk0a92ytbeuuW/hYegMaK1q+HZmrXO31P
         uCfjhEW4Ssbxby0ghpm/RgCLHR2fj9CAR5+c8ksQPN/IfftI77SsySEbWMDAMkgOAkG0
         ck4sE561c3V13o42QxeZOpc8rEYUTwyLfBoUzQ8tOvIwv76Tkrtt2mjZ4e6rarviNgqv
         IqvA==
X-Forwarded-Encrypted: i=1; AHgh+RpdapKRv1ssAQkASLpxUWBfgyQM5X78GM9P2Nqc7PXMMiXY3s9DOKdBzd223Jh1ONzlsvGphkVDCpRN@vger.kernel.org
X-Gm-Message-State: AOJu0YyLVVNVWB1gkEndA73a/CnQYsA5xJMEvQSUwYwiJhPxb05L2sZ8
	SHi5q+1fy0s/c5/Bd+YgV1UCnbg2IE9sb0b2OUC5wVNzj9C9tcL5a6ht9wG51wkX9TGDauon5Du
	EHecDfM0XNX2YCGvHJa5rdyqfvtsBsL+WjtHSAqQwFezFADScHM9pU+DycN7Qlzsg
X-Gm-Gg: AfdE7cnlnuTrpSml0bagAkZ0kTQsBAWaP/xSHlZ7zLNu3yIF2caJH3ToVka3gqjya6P
	piS72k67yThyU3jA1XSxnPvwENq1c6QHtoMjbeAhoCs/sdJa11l+HXiEN+qcUQ+2go+Rywasivk
	Gylkh0Q6O5+gIM7ahQ/zRLMu+fGqSSvqXU8XGtxLY3QIgVTgs88RMbCxlgQy+M/xpPsmfDk8558
	/S5aRfgrTrmnUQ3RpTdaPto1MhIVb78fjKx8LxCAG0Qd1otG8lTFZem2AaYWhCfs1Iwgygo5+FT
	3fhjHv15qIKHFK2/o/hhikXulS+sHUp/G+8WRat68QQPrEnwamWK5i9Ug091s4afo9GfpO5kQcF
	9Y1Rj0yT3KFK5Y6UmM/2gaoLNr2YHeO9FqKDJOmUUbsnLYeaxQ5osmE7t3neHK0D7txwSK/9nBE
	y+YXvkH/xNL1e1wQI+zTnztOAw
X-Received: by 2002:a05:6102:688b:b0:739:18ea:565f with SMTP id ada2fe7eead31-744e0310bcbmr3879446137.21.1783604529602;
        Thu, 09 Jul 2026 06:42:09 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:739:18ea:565f with SMTP id ada2fe7eead31-744e0310bcbmr3879411137.21.1783604528742;
        Thu, 09 Jul 2026 06:42:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:55 +0300
Subject: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5132;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QN/GQkI9t2+DaweZ0uUnFoB7t+XgnQ7MgtUodJ5uTko=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkHPvbbqFQnR8/r4wF4+bOR69aivY98++Bc
 bTKVYb3bDuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1QatCACGpcvMXpTn4K8hntSyBuA+tEaQRVaL1pf6Tpr22MZzSC8ZqQ3iXq3EjJzSNwmE23G0WtC
 QVgQlx+gucW7w3OJ1vhTGXziJPHRonHR1zvbiPa9iMYN7n4wJKYDt9fHy4Z6OrTSE2hN+FHuyBP
 bLKl8Gs6cM4cEgpCGa7uoOeaMprJVCG22Kg07lE2NQuwUQR5v1fYPAtM2Et1KxFgPTcCvuobjIe
 K1UTNHZGTiTWphZ4cX5LlDNXwtApniu10ExsVKYHiVHPAiHDAtUO0/JNVhACo622J0l9WxDDLi/
 rv8bNGVWZYmcWtX2X4JRzNbHsZUPnPSrv7Dx+md3YO0nvu/x
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX6kkr7urW5l/m
 EjtrTPSl6m8l/tw1ZbT/H9WtyZXaV8QUvEjFCFob5gdV14/kXAJm6TQAGRUfEjKm/inQu9JmyW9
 9DYnLiqKO9uffn3fVz3HESqljJprKXURC44F1O4J2F89IVDZ96/Nk61w1xc5fMRpgGZEetQIlHq
 kGmuMeke2eFE1piMAvedPE467vLQjKSa5kiZZmIc6nBpjt34txkZwx9sB3RpDOrJqPyYBYyYMEU
 UIDPw1fVnru7wTx7deqCONivaMoJgt7CZVbUG6I6KCTNRC7H2LRK/in1qvTf/b/Rp0Sz563u3DJ
 XeHjyUTXygyN75BBDBMfMrDtnOTCtaGnqOYkGkeBs3u2/comG5mQYbwbgJfl4jZfOOYmtAl1H6H
 Weu4ILuu8a/BXwLI7v6Y3cWj0qCRMekR3pWNpvVfig86/llS2v+YEFaS0t/M5SUOGiRMhFnI9lS
 Zk8vQM2Vi8tZxxd25GQ==
X-Proofpoint-GUID: xmHdlEBqAmyTgJzCAeIoZDlqFa9IbA6d
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fa532 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: xmHdlEBqAmyTgJzCAeIoZDlqFa9IbA6d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX7/1pUJex2WMH
 E2Ao6fWrgRpJja2qqlkgC00kSk8w1InQPKQx0TqlrH5kwaphrWCOhyblFUz0A8Lk6k7uLDDBWsF
 n+A7foW0Wx/X/OP4CjvDaKsbElCpw68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134

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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4c8bc7aac135..9fee5f28097d 100644
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

