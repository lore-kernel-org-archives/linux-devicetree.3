Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C694156EB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455324; cv=none; b=PJA2za1HXBvyJKUQtaPgk2pU6mklMvFd2EM1AJCwkWgnST/ecJ8Kz/kZ2JeT0E8C6dJjIbtei/Gjm4gIQO6Y4iVY14SrHt0TYrIkSkrb9AuewxASm8aAIi+VtLoltMgV0m8+608vajm0T0j6fu15j3UEVKcl0B9jRUKPpYM4Si0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455324; c=relaxed/simple;
	bh=l0/lfLbQNiyyqQ8kXdTopoSs0dF+CQUlVAKRACqlzE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CejhsUT2kX3yPuiQtP1miZ3indYyDtO29Tp9Ujjb41Mb/kzbaEdIoMcvaJrB0fH9C+1HYvbFJfmS48VqHQQ/TzTNVZ7aaE/qQ+MSPfY8wTE2K+lZqQ1xb5pESCuf4a/F/DfOgPq1aEfLhCxl4TzBlSAFRuLDJkCMJ8+ogy5Wwyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGnUzzM0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8eF7cSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGnUzzM0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8eF7cSn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrkux2479225
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OB/FTkskig77PdEo8cv9AazpmiyqKhTEhHN6amZjUVU=; b=OGnUzzM0cqek1Zyn
	3czpyPUjRY+8n6GC/6UiKKY/Da0/Sqfou67rODL7yEAtLAEHPDsOlz3aR2OOrusY
	949rWIN0IY+Jh7ZOJgWzst/i0+D7S3sSBdPu9pT21AjsMERfxIAaonynCyhu0ZKJ
	2j8dzb+MSbol0SemUVkmiSQdnNAV55bFtSrEOJSy0ZTx+B8D3HKE9LG4l9gvuOny
	srcej644yXWzx7tYTlYVzbGradQkpsOlb71ue17eSFEOhjLXc5mrNLJm3G+TwJ5U
	KWMul57Dj7QtsuhdFu0aecaNc6AvaZhWHhvPSdD4+rbexu0yJUPxvMK8M+Oj4MRb
	YzARtg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfpfr4sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:48:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso3224361cf.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455321; x=1786060121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB/FTkskig77PdEo8cv9AazpmiyqKhTEhHN6amZjUVU=;
        b=Y8eF7cSnTRbhc3tNOAHcmrSqsdNfraF0B80J7hMU90u2pF86ANmRYIsT6u+rsy76uD
         BVC6pkrbmXQyz0/BXUobaWeME/ZptWmwEaKlkWpgD8/3Rqj1oaKnKTEeqPa3igvhWkm0
         EJJaTx2756YVYmF9oaNKFu9Qa4Z0NkGFE5SeG3zmUhgY5RDyr2nZD45YiyL7lkEO8icO
         ycDgTblbh0wi878/5+XaIQcDdSbcIMNjwrefzpKGiUs7X/WwORkmHzqgB5DL/byNpSpy
         0Gu4yz+XtZ/Houyuf8nQ/hD5bvp2m4WhoIoEJk1GjtMH6RCtkmXUEV3eDIwv2I5JL29t
         yk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455321; x=1786060121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OB/FTkskig77PdEo8cv9AazpmiyqKhTEhHN6amZjUVU=;
        b=UUwlxX3mvL9QWcnu9cgEDl6Ic6DgAQAMo9+JVnBn1ie3Zl5icBWgXW57m4nJy8cdhn
         /KxsrxBjBAjYxpmU6dnQYQe9ztpCBtQ0tWi1gXKDDVUyBXuXrQyhUkcy44B42ZfC0Gh4
         MrGph0Z7C3oSYz1njXybcNtZ6D635JcjVcksy2SkW2HVSvjRlK8js3/di4pzAVC6ZKRm
         c9e1o1iewCNBPUeN1SiChPXcUI8+A3IrpeXQLW+1a+bnknLzOla1WmBQ3wixFeuYYaTb
         r6bLJChjQu6D1c+Sa5RavYGFMedoiAxZyyavfOJZ4unjtNrH/cW9z6Dd65uK7VNPiPpY
         aSUA==
X-Forwarded-Encrypted: i=1; AHgh+RrUZ8vSsYK9Kocl691UjUNMEtPla1uttkDclVrNdGSg99iU0UZPvhkXs1OeRTWP+6tjB9+uBn6O7nWk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn8A7bK7BwzKyk0MDVu8xzPHTGuCzZKp9EGVoa1fib1WqLHaxV
	1BuR3hDI2trwaqD24SIvCvmnO6ZBVK20X6xB9vULkYf7m+1qlT9ouPScxDhMfhP0xqo4786ql/p
	XhW7aGL4ZKQwLqG6jnTEK0yV+Kktza/wT3/npI29qSL//YabVLMHecw9DBhsf1Bp6
X-Gm-Gg: AR+sD13ZswQHa7eapPLOKplp608HW9hKqqdEL2d8rwEHQBrbEAKUKguWl3l8QA7BRZH
	uBdddfk53/Fu60lhWHhAMg7b551Lo+wwLXAUH4IQqniwKFv64rQbMiFxXKnol/JRxBoTE60mq7J
	ow8Q5SGzkMi99ogseGRsQf1v+1/hNbuGbfVcz5WARym2vLaNjmWAF7+rpJp7Q/UfE/CdtgP0ZDR
	jKEaVCB3/JBY1Lxgn5wMNeASQFfKg21cIb5Q9SJtYi4S5YfieVPgNqZwdlNKiJCeg89JAWaCQmJ
	jLNoUXABK85kv68yDiMvJGsT6gGuSGtZqm22JWB6gWIRkbf7Bu+qkbrcr0XI4J4LkcjgtSaRR3y
	kbcF+fVf0KgggWbByHFJF0hn15B2mkfTWv/GdMI2tG8ublHAyQ9LtJPmY6CTfmdEKfvctWyS3Jo
	qm9mZTxKnI1FxUjw==
X-Received: by 2002:a05:622a:551a:b0:51c:9a3:4c25 with SMTP id d75a77b69052e-52b3867e025mr54196471cf.56.1785455321363;
        Thu, 30 Jul 2026 16:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:551a:b0:51c:9a3:4c25 with SMTP id d75a77b69052e-52b3867e025mr54196131cf.56.1785455320830;
        Thu, 30 Jul 2026 16:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:25 +0300
Subject: [PATCH v9 04/19] media: iris: drop IRIS_FMT_foo enumeration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-4-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4515;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=l0/lfLbQNiyyqQ8kXdTopoSs0dF+CQUlVAKRACqlzE0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LK5KPfce2Hu7u791nJbh9RDcHPzrXZE7Blz
 HNcatbeQ76JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1a/4CACoAadyPaTR1l1nGkXAvgHI3E5Udm74e0fsWzgxYP6ot2rytjFG7mRPWhH5GVWn3VJY+BG
 uf84+9P1vWltASqryj5sUI4GSRE3gKN5ObvZUhPg2ZjO9ySHVuHy82ewtorkjZUg/hVlD3+4eqk
 kcIyr3HRoX27XmmNeSXankDFkPcbKGyf57mlQ0FqpO793OAHGsEujC/zJgi93y+glzFVEOJza55
 4q53N6o4Ac2zOUpJ/IMNyZ6gDk47IJunqE/Ac5cF/W7dB3xyT1eWw46wsmMNOmwaliqOcKtm0c6
 927onb7v8ZWT/yGbZavrn3J/ESpI8Iwuy02PWtpc/DUHMgRy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX5GwMbmisbXQF
 37eeTaOrFx5pktgMVGoG1ddeQZ7dz/lZL8BnjfgWC2WDd3c9Tcx9gbRPseKOpaPHnxI/Dkbb7gq
 kJ0NRzC9o4RnuiZGvCcBYVzRYQOB3cMKNxy/8B+LduGvpuNrEbBtj9eLosjBo6hlrE3gjeR7JDI
 CPNjMR3DATcHQ5J0AesPKJDZcIBRZ71l5nsn8Wh8VOwi3/67qxY52SwPFE+qE1ktva8Oc0NQsQa
 y0f3YobfAQzhtCXaYiXExpxnLj8/0BTJHtDaqM8bsHWVNyhYzNkNNiOSHTIA1Wj1XgzxgztYc7e
 VmxQA/RMZfu5asf9O95eds+CXv8uiHXL6pOgIAGBBnhXg18NwMnvS71aZiLtvl9/4Py4+27GyEj
 TGW5a8VHt4oLOhbiCsPKrPomKqIevWPQbd+XMXGpx4ooLTHi+IFDvykRqtF7T2ol81+eS6ViaDR
 RN23YMxEvC4gkI8rgzw==
X-Proofpoint-GUID: J9Nbvrt9U1XJ0mUKypVE76vVbcWkkqYg
X-Authority-Analysis: v=2.4 cv=XNEAjwhE c=1 sm=1 tr=0 ts=6a6be2d9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Azqn4rg6zLMgtGihcfEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: J9Nbvrt9U1XJ0mUKypVE76vVbcWkkqYg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX9a/vPDvEnaE1
 TxFib2iBp8i/yOaFU23ATWnZl+4UcgckibkzRZIAcSNb0Xi1gAqQwFC/jRXTqCi025uECXo+nyK
 VNaDtO3v1IWjBtottTNSwlJJ3PaVjk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

The IRIS_FMT_foo defines are only used for indexing values in the format
enumeration arrays. However this kind of enumeration doesn't follow the
V4L2 logic (which expects an array with consequtive indexing rather
than a sparse array) and complicates adding support for platforms which
support different sets of formats. Drop this enumeration and use flat
lists of supported formats.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
 drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
 drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
 5 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a770331d1675..ffdbbd20901a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -17,20 +17,6 @@
 
 struct iris_hfi_session_ops;
 
-enum iris_fmt_type_out {
-	IRIS_FMT_H264,
-	IRIS_FMT_HEVC,
-	IRIS_FMT_VP9,
-	IRIS_FMT_AV1,
-};
-
-enum iris_fmt_type_cap {
-	IRIS_FMT_NV12,
-	IRIS_FMT_QC08C,
-	IRIS_FMT_TP10,
-	IRIS_FMT_QC10C,
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index bbdbf21961d7..ee80bc5decaa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -42,9 +42,9 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 };
 
 static const u32 iris_fmts_vpu2_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..7098b652c117 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -49,10 +49,10 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 };
 
 static const u32 iris_fmts_vpu3x_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
-	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
 };
 
 static const struct icc_info iris_icc_info_vpu3x[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 7f89e745a4b1..c4d13ae58336 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -63,10 +63,10 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
-	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
-	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_P010,
+	V4L2_PIX_FMT_QC10C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa..16c52ad07e2c 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -80,13 +80,13 @@ int iris_venc_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
 };
 
 static const u32 iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)

-- 
2.47.3

