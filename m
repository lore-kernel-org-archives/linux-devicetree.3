Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B8131B80D
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604530; cv=none; b=NmzKx7E8sPTXIXJfpLMlQiL2Q8vHrgOUUU3vwf1rfwgu4As7KOCik1s5FJsfsikVdLvwYLvnXtJcB7TDuuxOVqA8GJCYa9vuEkA9YEinml8qRzFIpztEYikVn9P3zXQvWc4XJ3nvs09THak8kwf+TUMrO4ju/2UadCiuLEvBnAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604530; c=relaxed/simple;
	bh=T4eIYBccxXJeZW7OH2Zm0x8+WH27A+FuLPhy+n6Z5fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGdtpvULFc3EkkGRnuNrj99E/28cd1ShDMPsO79InILTg5FRaBgsk0ivtBOsHBtGcmvBXA033sfP8X3NvAJmXo6ip512khFQ27iypueM5eFLF/BukjEQqRL21ATT+rmWcyf/Imtd7zLosQbUN6TLvJYtBFo3w5szIfFC1oFTx/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paiqDtVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMrONoS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paiqDtVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMrONoS9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DdfGU1930266
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUHnGdkfUXRQwt8oe8xuo2tN8rjbIhoMZwW9C9J3BuU=; b=paiqDtVpB4W8XMia
	mkUOQiclKvrkJBkcy+rO5hkMq0oI6Cn0Xzn4u/AP0M3GJ9+tahIRGcJJEe7hpHbM
	D4oF0a6RGy6DeHU/i+bW66vbGrvathcUACM6H+8F8H10kapxcyB6ZtiHA0NSTrt/
	ZO5zNCTQhVervggey8DeCVP//zsz8Ro+9EOIUW6ZODwNzBilBoU1bbzLn0bmNzI1
	tQztUKJ4b4/LY24SELohmsZzYcWgaqFxAWtVikjoPK+KBv1PsimQsvSoxtD6xRb7
	ZToP3b1eG9BKFBMs+zUvuOti/J0hgC0mKBL7MrvPwk9jYcZxRkL4wvH4jcaHCxRn
	TBEUlw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpg09f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:07 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e80385dbso353239137.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604527; x=1784209327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUHnGdkfUXRQwt8oe8xuo2tN8rjbIhoMZwW9C9J3BuU=;
        b=QMrONoS98MRsINVRmW4Sb+bMj7m6+ZfzeRu/9HfU9tknzFAihWDsg++2BnO7DnaKCk
         5zBYVuyUwCF/GfX7rx/Kex/iPKrnQm/PMh9f5QWGkFiN4A9loF89tvjIN5mX1/UH16gx
         7PYca81MYtzMQ+8/z1WlBXW6El/qlYWkk6YfSeWIqqnRTy3iDrrJ8m6W5G2XJ5LlFtNW
         MqhUvEjM4xzv39JCAAlbEqAI+rPm1Ea+yUY0UD4Z2/WRs1ILqTTYR0L9QAVYkBqJUY17
         c1pv4cvuiNbR4ANEZpDMQr7YEv+8InNarHFt2nw4S3rZSbtXrhutLtKmnRHaZscnrMB+
         2r3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604527; x=1784209327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUHnGdkfUXRQwt8oe8xuo2tN8rjbIhoMZwW9C9J3BuU=;
        b=oZk5lSe5hSVM0S2heWAmdovp5mZV2zdcpTr8NWLKG1DnKrz3Cn0H4WvoYQTChQV2bq
         IHNvQGG+hh4DF0cxjORSBIVARRiGp+wCBGgUwCMr4lN+rr+MbPVGdCjDowvPz0aRTyb8
         49KDFsniHaK1NTmoGQDMKP2XBmbO4AdKyoN+Es6oaPj9TRfmPYBpazNcV8E3dTStD4d3
         uuhJ3Qp4An1cBedIy/BTR6gWJfmpx4YOPGXk0NEtvwcy13p2hxhV5TLpoQNk8UM+kqhd
         dhBWz8yFFSXRYHjYLmhGe8BTcD6v1S9p5u44OtQ1+a+uL3azAieamimkVa7JRcha9F/b
         oRWg==
X-Forwarded-Encrypted: i=1; AHgh+Rokg0UuCB735p4xLCjw4JL3E5QLmhqKJxO5nB6UhXtPcRB6WM68va7I214szndMvg8SzJ1D1a7WLxBm@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPPj69I3jDSB/aAMFTy2gJHSTAHjpzqVN6v7wlbZBBoZaY4XY
	MrSdVjh1edkGQBoKZWrYwNYU7sBQcVJn+iJx/pO8tVdfs2QWmp16YqGYM+n5oZ3wsJdc+xT5MfI
	YytdpGCp5HxanTMQLVu3TeZ60LWKWqa/cHqhIl4D+TZUnoH//VlI/lJ9wMcGob1iY
X-Gm-Gg: AfdE7cmFPL1/IRvelFP3bUD5hG4RXe4gfAB89Bu1283Nzg8UohmfSHbiV3SKtCIIc9g
	+FLPvMlrdorem8UM0goBrM4ETJ4yCklViHdMkQ+1PGkwxkunuYKCV5MopPslhvbJqWgoj+Po59W
	I/ogtC/d7Mxbb+Hp7hSNUKk+2Ta7rUEpU0I++lV4aTDMv1WlD+F6hhUdmjgSrvVA1Org+I0ITFs
	HzeIwE14r3tZI/Dm0UDAZvBELeub+jvSnf3MpcuvudLclQzBXKXUF17k6cKQj0v3lLQfNk0WaZR
	9jpwoIJL0rj1ydJ2y2QyeuE7M6nnw8nJmjwNGy6BXVUKts1RO28QxJM6QubSR2oH1W2MiAU0ORa
	O8aZBD8+1nT+w8MIkrgrbEIzlHQsbTBehl3atVcGqqip+MOsZOA279/oLkSAO0dVoYyOSREduzk
	WsWNoky3xyZytSX67MtyJzlix7
X-Received: by 2002:a05:6102:579a:b0:738:9c79:750c with SMTP id ada2fe7eead31-744e010f583mr4087184137.15.1783604527179;
        Thu, 09 Jul 2026 06:42:07 -0700 (PDT)
X-Received: by 2002:a05:6102:579a:b0:738:9c79:750c with SMTP id ada2fe7eead31-744e010f583mr4087164137.15.1783604526550;
        Thu, 09 Jul 2026 06:42:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:54 +0300
Subject: [PATCH v7 03/18] media: iris: drop IRIS_FMT_foo enumeration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-3-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4455;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4eIYBccxXJeZW7OH2Zm0x8+WH27A+FuLPhy+n6Z5fM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkC6y03dfoL2gL2Fcssdxok7zymtMG6w1KB
 CjuKHWyNKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1dAhB/97z4/xuC7+0LB1G/OrJulzwP3h8a/2nkFKlFqBXh1nnLB0IVS12gpa8iN0f+nTAZTm+3G
 Llt49B7giCMHZykD8OcbNgB70rg834GSxnleqLhBr+hs8u/HgTUOzk7Uglt0t26ycbuRWUlG51Y
 5QVPoh/itCTTdj2sdcFaByryM92t5A34XATi6Jvx490Q20Tz9TYnh+qPdvJp2pycQ2NNxUP9XNS
 yDzr2PVaS9Y5s5DV6d0JY3AI396PDJhbCMQJi6mIkkkd6lyWIBd5xt+4nAUn/uNTdTuqWkbXiaC
 13C4zH3qqz/UEdEymefaNr+BQqlsVsOQm5vfQoGRHO8BKiDP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfXz4YzP4EwCr5a
 PKJMVYXuDiWqKoDkxPXAZpPs+9nqX2y78LOiD5OsdPrjmpqiw129gpLIaK/5ph3r1xj+FRrcpi+
 qPZleTZp8EASdMWtOEEjdN2ZJ+MyBf3aX/b3lJIvqSdxpPYy07ikMD56v/6MwFN3XrtLSLNSOPD
 NvijrFyTCIxNJJvoowc/0FQ5qUhejg2qKxp9UQOPZre33YfxeS93YYwaRwQWxy4VxzrYTNFDxcz
 LAUL268Snfnhlb4IyjIQv/DNB7sQp22OXlUX9p0A2w0XS1NVn6vU7Z92Z+ZkPkgzgyAxOhshmmY
 2Jh5/c1PE9ICI7S2EPYQstGgwyPES9YVEb9zmGMJavOaIvdkIyzS9YWeWLYIMzl0HWBHjQuG5P/
 V9Obo9z4zbiRfu17Nb02d3B8LjABiKVdzGDOgLyte4AAC6tSVTPAl5fzjKKGBNzBdtppFXc+Uy6
 f61WGdoOGgTnZAvYrUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX1/oj/Y5notFB
 2sWvndMB/1J2zUY1Qkv2eO55Pf95xD1waw1Z8dprv3x6H3vIxaSJRTnoSeoibIFA6qL54js6r6k
 4szbZfY3srRXzlnNuZfASUwKFP7hWzg=
X-Proofpoint-GUID: XVje-uubVjThwykXWPr5tysJE7LEsPj0
X-Proofpoint-ORIG-GUID: XVje-uubVjThwykXWPr5tysJE7LEsPj0
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fa52f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Azqn4rg6zLMgtGihcfEA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134

The IRIS_FMT_foo defines are only used for indexing values in the format
enumeration arrays. However this kind of enumeration doesn't follow the
V4L2 logic (which expects an array with consequtive indexing rather
than a sparse array) and complicates adding support for platforms which
support different sets of formats. Drop this enumeration and use flat
lists of supported formats.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
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
index 961dce2e6aa9..ba91672df1bb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -35,9 +35,9 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
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
index 9e228b70420e..4c8bc7aac135 100644
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

