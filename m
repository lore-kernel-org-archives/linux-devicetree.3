Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA937E301
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256349; cv=none; b=AaWky6u8Q+mhixgsfoSm85i+iej50BPOTBkXtGgOn+6wlf2KJuzGAZnt4uqOVWApWsd3VN+0zc/i5Eukp/zEE5uIvHsbsSjTYo4MoXkrZKRMA9E9nD2qcs4MZlid9mQIytizxqa/RZq8xiPSKlOGuVUquKPQflWo5nUaTeqDvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256349; c=relaxed/simple;
	bh=H0V82aG3dPYbnrAz0FGj59jRwGH9B0JQTcpQnE8Ylck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s1S+08P6e3IBL4e8Bbtsy+FHoq/1i4KuM6DiDFC4rEPCzLDLnZtetbMQn5ZEQDj0xxCJB4Vfn+fmj/cqWJm6jXPCAoHLHiYCcSGJpwfaKf7005kbmy1afbMRKGrZx2zkxlInRXmsVDkw4QzWT9snEBYLZ4R0JrMOJUovHEAgpeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIbqGHYm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEUtkhS/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIbqGHYm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEUtkhS/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39SXN2502684
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWTJE5glnmUAzyAbMWhXl5nquYnqgRSsKh6pLuxFe3Q=; b=ZIbqGHYm2Jb/821a
	/OaqAqV95SoLEDXSd59kyjoZ1KCWB9rZSXVZZfZB5JlJM2Ujm/SKaFQpRAdk2/va
	RQ8ps0ovB1dcJgVQJrXxAM6MBUwdhe2AZyhRQbuNdDZktSTkHFpWd64IaTo6vYcE
	lCXDwnJfZgRilvSc/qFgeEd6wl5OYpYNSpbRRAk1csHxTjMSDBIAReW1c5JrMKic
	eicsXBLMr5iuIe8TzBgu7FLUBXxWGHF+sTt8epx1lJPpmQTOwjS8geYngAvHroZt
	DQXiy4QnYTIBfD3Ssa6qM6yPC2hboL4kTTyC3lTVHmdZgOYHwWam4a2TFcvEyllC
	yx3+3Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd30na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-964172af027so678006241.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256346; x=1781861146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWTJE5glnmUAzyAbMWhXl5nquYnqgRSsKh6pLuxFe3Q=;
        b=VEUtkhS/eSlHM5RAieBeUejEa/3FTRW8shoRamI53+ui9hsF5BQJtTqZg8x2OrCTAA
         dgTZIMyvXhdioIj017NHPehQeuhZPagYIuYT4uyMtlbI1H2bOSoib3slbnIRbs8mTnk0
         sTqPQDPA4Iwt9ue41w1+ARZMOMLX0lfSilmV6r5G5v8bVFCfe1ulmEloNZR0JBovK+iE
         xUr/tlznxkZBYmHCbU42jrlgCINx0i7D1IV8ENLNne/9Owbh6xys5ipd6FvrSNooderL
         0iBtDuSooB3JccQkEcpclo1MxWfl9UudNd7AE3cdW+lviyUJuUUKtUkuqKMzlY3AUvDO
         9kPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256346; x=1781861146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWTJE5glnmUAzyAbMWhXl5nquYnqgRSsKh6pLuxFe3Q=;
        b=AiKCEYduwc8MYhvAV/QMNc6dL2fBL6tsI5u0UI08pVZpKNZdfYvcweVbvaWPiYSUWO
         Gk75B1y2i0x0fEQZMEBwVdXUNgKZd3h35P8RIYrvl0zBQ8OmpXMq3nA0Eko3AUyRN4bA
         PlMn+881RmK5uOntOtzIw6Tr+G7LzwqTOMnQOBLSlVPLqoFe7Nwzv/3mC/5ptacToVUM
         AyKiSx2jDC6SLPhFiXlaci+SOpZBUdLQXmzCVlQgAJYDVoss5nVlEfHROnCF4CMUA83I
         gyRNJb4rT+aWM3PRPQgnWOKMg3OyQKjtg1GPZ/+cGQtmgdMtk/Wb5xNufjkaAFgfSqmk
         iGCw==
X-Forwarded-Encrypted: i=1; AFNElJ+36zNXyRzF/y5FRc3+MQtmHrOZ8bQg8iwis4nxR4aVtL3a6+zFAO1kjV8mAwfqK6SSOn5XTUH5N5eV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5GQP39FyvCzMVSoNKvjo5HsRjN9j0uxO71nBKtMg8A1ZqlA76
	uR7iASaODv/V3NqA7IEnWk23VLPMk86R5r8b5we0sR54YVBQFe3qBS10s+WLuijfaxzfq9b4QOP
	sBy0tn1TLIh9MRP4CEm1HnZPTBOZQTWkwrypo+ctxgrof3aLncb1uwDjDVaVaNHA+
X-Gm-Gg: Acq92OEFQwsLeCKF2uy6Fd7XqvYH0tQXtPANXCRlXNikqOSLvAUHuwwxDai61Aucioo
	VKyg9no9w49Kw20onPRPEsgZ1q4c3Kgeobls/1X18VYlDSoWKhYJ3UK3JSfAx981jM6d1NIaWSF
	CPYbeyFjYntW/uwpBN9jar8jPKgpSUUDzPq8Tyhj6kvhT1NL2KLbVmEdYOCkMXVGRr1pqmC8Qv+
	RQRWnaKIK2dGdlyvcHCDdyiuukn51ztMJBiq/sE/89sWS322AKhSXIQj44m7/72Ib05tkI+5Smc
	zz3svV5p5FqMAe1QxQEMX4WvOKkYYpy/XdhnwmJ2O3Ms7Kak3Oe5u/VvMZt+35hEsylI2S5SesG
	ApAeugcv7CYvJhnnw8SPqcxdvyCOP6HcJUIWZeRTENngd/2J/XGV9/7FlNSOVq70SGNe883ZfKl
	LG41KiyrHH8nPkgQTGDHB0NPfrK6Sdq1htTxQ=
X-Received: by 2002:a05:6102:f13:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-71e88b36277mr863731137.12.1781256345690;
        Fri, 12 Jun 2026 02:25:45 -0700 (PDT)
X-Received: by 2002:a05:6102:f13:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-71e88b36277mr863722137.12.1781256345218;
        Fri, 12 Jun 2026 02:25:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:34 +0300
Subject: [PATCH v4 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-2-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4535;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ksWQgJMkKP/JHjPoFVDtiRDL31oOL67/XmVWJa1aDqk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5b2hf53rIt2cUsaVMupq10Plp1+6qG9RW2bzQqzBAOXB
 LEzoVWdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZgIuzD7P80UMfPfjSW1C68x
 iNl/zVJ6cKP4qcDaGx2V+xq+vGMpiNeuWnbqtFTU1R+bn/QqdP/3yT1fLbj+XQPL2rWpsXHc2+0
 kJ/XxCswVVlPj+FbhXDPbbf+NVOdE/7xP2dEui7fqlG4L/jFHJH6Kgq9Yzaleifxvl2a4sOUUbd
 vTrWT5ReNMkvI3i/UJ2i++ydxb0inszaLfo/rN9KKr+b0zq16esDv6bvGGzo03pgnNalXPt68yC
 O6dGbK3csZZtpWB7+bunLt47ol1wSdq9EIvZgbcdzdt1uv/kXuW98yvwurpfh9PyNptN3ZhmuqY
 PFPYofgr85ZrJ/XiUxO2SeUbRdkZ/WKrMVXrZJm4/2wTAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: NdJajPuwGpF3Fza_GHw5mBdUqHhJSRj7
X-Proofpoint-GUID: NdJajPuwGpF3Fza_GHw5mBdUqHhJSRj7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX6rrKaRAVbSmt
 x6dstc90VxACgnxYeec6csTNosroemp1926SslIOv6K+knD4k+IOC4jhD42bHdAIjq1a8vs6F8H
 Q866Fq+mbwLeC+Q/b4upgk8U/lli4byIL0FXVkR+DqqYRMd5umtRzT+1AfHovq44L3suBKkkAcu
 K58QhEC+q2n+hdgANWjIzA8vlPgv2vjbk4jZmpsHbUyQ+DrPYaO/lgHWwzUQxSUEc36shtYi32/
 XTRcT8U4aYL7V69wGjXEh9CLtGEjBPlgoyfWLbOImI/dTxkaork35kPneWOsBrft/OebW8I/OoT
 L/Izm2i7iVS8oSjPODF26dL5NRzbXn1JguSxhqi8Gv6/ixVWZAdYrxozxbMa9qS0e66yUzldOOA
 xMLV+kOEEXH+wITFq0OaSCTA9TJ4EETK6Fq6jxitytAoftdk8EdEkvbBHQbIJbxzOg6DeScf0gt
 5FypYHtoKTwCFl9Srmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXw3sW+yx34YHr
 HtJy3BDqkMRvFOLifPsnnHzO9TnJWzezTun0+aul9XukMpvZl8pIKxPo7ea8nHyGGcCP+aSDTQU
 8H60iouRlDsBVEYoI4agQVcy5VZ9IrM=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2bd09a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=HWmRtQhKy1KQUjwlQEkA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084

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
index 9e228b70420e..7da43f312ba9 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -71,6 +72,7 @@ static const u32 iris_vdec_formats_cap[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -82,6 +84,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return false;
@@ -110,6 +115,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -121,6 +127,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
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

