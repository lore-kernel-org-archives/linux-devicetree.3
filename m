Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1A03D952A
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463361; cv=none; b=p5Ue8nDhkxrp9D0oKANT9jtL047ZCJUQHFP6QnFPbWiliUOPiejba0AgwU87tUJsNFe2OSHsUD5Yli7OAuO6fjYU/LK9gzSQ5VTLTKWBRjOabzFK+gJIunBuAgQVsfu5OkbZVFN0nDxzuVJccMqWjKbgeMOkMwkMnetOFZRLVZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463361; c=relaxed/simple;
	bh=sGfy6DByE8xjp6rASWJ1Ni5Y2jrrt7KAlRpBUyiO1RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCaw1IX3c+gID4Uuq/qSwUybGQZSneZpI0r/gpCKhT1s18vKY/PWyJnN2OD2HVbSMiwXdgKsCA7ntfeCR098RJ/thhG0HDfaPgASa02hWwIRYnhyJTQlrBu+mFbua75NDYXpFyUCJbSU/L5MhX7MiDU8Y68O1D5qqtvY4apgHEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hB6Ul9SA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgWpj/Fi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hB6Ul9SA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgWpj/Fi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5RX6370216
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 22:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoGJLm1F6BtaFU/e+mcWoXq1ksQeQ5SB3AhfoYNRdtA=; b=hB6Ul9SA59EOQcav
	rzmElRwKmAbtttHUKh5PkFR2QIfrfK0UIFapj+l7fN6Z1UxrYh5wY02hW0Ce9HaS
	5inZE0yM0U054tjOj2R3sxl8F1wKdHDKG1vb+/kfXMAPoVKIWNvA+VxG0zFFZ+yr
	10RGToDaREgMXnNt5d1vVFkrAqGdJnjW4ZYvxiz1IDNq2H67n24V/s4j0Km38rhI
	6Zrp8TaFgaxwx1NcBtwGegRSwLg8ExkXmFfQbkNYoncPuUG+CLga85I8qdZVRq7+
	D7a5V9UlTXQDc+t45KwxBumJ9iXkTFUrdQobNBroQSUUBuf3Y3d8HKyHZn25gHDl
	vvC1zg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun3q3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:29:18 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96dacd0ab0aso40157241.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 15:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463358; x=1784068158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoGJLm1F6BtaFU/e+mcWoXq1ksQeQ5SB3AhfoYNRdtA=;
        b=jgWpj/FiqfdiLOTztAsTGjrfwDGQKVqOZkC95mKz98Zv2raylEce5s7ELVwrMrLDS8
         UlIQBAXp9JpSTb9Jnt0oKtanIYvx7II5kV6NfD9hQDXhcg1/EBK4hF5QzgkjsLaW/Rba
         +n3Hbdu9c4TR87cD3THqwwiQDkEUvO4lP/KmuDD3APj66eO51IZOvUIzPOD+ZP+Honfa
         4WiojK+36w0XB0eC942X2gDY6NMZVFH1ganLV9BsAu9U5yn6AcXhoRfr60NSB7DDfLbU
         fJKxMegP3KMsJG/Zswvu9GOslWEh90wGtYSkQMA60MXTkok0hCTgiQOIMFshYSGmRO2o
         4diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463358; x=1784068158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MoGJLm1F6BtaFU/e+mcWoXq1ksQeQ5SB3AhfoYNRdtA=;
        b=R9iYnGTW+8hMsFhxtu+XFp9HPlOqOP9X+B3ikMfwIyBKcs8H4wRUb5NVlg96b3DaX7
         s1LZ0rdrthkzrat7NW3PnG2Y/wiQt/pI76RRWEQNG4HuXaGJJSLPpcjcfhYzLrDWvPrH
         Bvy78SM2AVwnrl+yoqkJG9laDmUcTkyZvyMS9dqsCB4Jvf/f6SUWiN1s4joznUMWAMMq
         /l/vhSHomgywJJ/LCpIrN9tVRY8hgJG1rdQ4HDTU1Ft6wLVEzk9RBLvW8AOj2RoVuX/y
         +VnsmGhur+Ly67EKH+LdY9B8h2FH0ynUlOJX3U626Igbey9cDEuTRKdCX5VfwZtVahf/
         KeTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuydOpN7/YEOmTzVd4vqDod6DGqaGa7pJNClgl40jK50gaMzIQKOFZdYt1CxNvDqztZWqTV307/ufV@vger.kernel.org
X-Gm-Message-State: AOJu0YyjWkeCqwHSHJ+0z39z27xv7S7fdUZ9Ylp5IIpX0T+IlSIQiuZk
	GdWchApYqMB/PWiy/388ZwyZMgsylz4asntH3e3ije28YpxhZh7KXlK9H4bJx3EFk4XSw/vjAHH
	QQ8oOylEqGcyRjwT3HNkXm1OyW1pT7+StMU/3pr9/A+Z67rshrNi1z/0Dkif5Njbj
X-Gm-Gg: AfdE7cmsxqXNORCQT6vZK/l1J5IdYwfmxJYiWBiLuEFXsyOAVI2SR+hmI5Ec7/DLaaS
	7Kf+LVNb7AsJdNQ7JJvQP7C8gXee4xqJmJSMxc9FifSV0pF+W8xW6/vH1XLwN4poN7yYZPZNiBn
	jpKZTUIPnUPRa/OhQuv0VSV8RHghRLQpQ5WfV0T1RK8sAvUjv2UPZn2Tuw53g9C97oJG0lBqQ5y
	eoyMkK5SD0OEth/9RVW2psSU+JglacZ5HoLj5zbx60bIYozja4CCXym4EkNY0d94cDc2HdMv1OA
	gRTsQd05rzWAjcGRBc5sSFz6iVzlUcsSLneCX7hyxWvHX9YYKbEG0VeYBYd6xhgxfPsjSmMzkE7
	Nb4V/qvy8m2Q39D567R2VdXwdg5J/RyyJ46GPtQKCqiRK4TyKE6SAU4ws0QOynStduVt0NGM5Ip
	5cpQRZr7tEqke/JXnnb4H2kFzV
X-Received: by 2002:a05:6102:511e:b0:738:bce9:6afc with SMTP id ada2fe7eead31-744b78092b3mr4114950137.0.1783463357775;
        Tue, 07 Jul 2026 15:29:17 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:738:bce9:6afc with SMTP id ada2fe7eead31-744b78092b3mr4114935137.0.1783463357288;
        Tue, 07 Jul 2026 15:29:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:46 +0300
Subject: [PATCH v6 03/18] media: iris: drop IRIS_FMT_foo enumeration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-3-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4393;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sGfy6DByE8xjp6rASWJ1Ni5Y2jrrt7KAlRpBUyiO1RI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2o3hB6yN+3QWALNg2Tw61T+6/xw+JsvD7mC
 nO/0kXHnyyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1Z8iB/9axDJlTYxr6yDvnDqNz1lUIvm3zL/7AYi528ppAF7vjNOBHd7RPJAPtNZ1KZld2I44P4j
 oWK0XvApmNLRSp5w8km95U0WFoLys0P8UW6AxcFimgS/mv4PwqNU7kyWhkES9IekfhEi0T2TWeq
 k15M4D4nEDaccVx2tjY6Kvv5G5+TY2MWnGlHoj+Bc2PskpJt3ThbqacZxzYrklDcte9x4T0RpCQ
 Er0MHzyqY6woQmiBQpSubqXrW1GJ6/yRCCYBTirudESzhJbNr4radJvDSK8VyUV98ArTZmot1OY
 n0qWkhKTiUedoG3VlIxOrPEGvRgyOx2+7WfRQrqiyR/xdNgU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX6D6fpqxZcq/7
 Duva/TSbYrmi3MgqY0bI5zE04aBhhY+6Mjn6cmfrE6XVOjtWYKffRBhE6yu/9bGlX1v1Us4kEVp
 ib33+TaY/uuJJrKWvd0gaY1gAYSDCxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX0+zSUL4U01lt
 Ymt+Cg++vL35h1j00PoPJye83xylUMNKDP/CN2pHeOIOhF1RcjXXwM7hZFFHBwFUxzzcDjhAC8b
 PntAG+77H2wDJw5wlakbXMKGPpdR2VYPJtmuD2TfIjPa1pwt9h+BaImSSFaSk4pSZdHTEEw6L4Z
 Y84Rw1RT+5c2FpF8iksFWdUsD4s9wEx/hVJ+CRqGcPsczV92HnCIg49XBiVMCc+BpoPemQMYVRu
 ol0r4TWS16v5gNOLXiSHjZA2RVu/7EA8vhm21dNddQhBAEs7JSm2eZIRshtCatWHL72xmFxsgAa
 rf5bC7dJpnnL0Mi4Tq8QxlikZL4OaLQ2xj28PnDhgVmS6/ubjoBVlEzBSoY2C2BX5Xhx5NsF0jz
 IaZvGVsSAyvlQk1OocBPCzX7fz6h5qMXa2MvD5sBsz6CpN/GsQMmw4N4ZYnc/GD/RZr85cCzDA1
 SvjA1h/mSX+Zuni/WMw==
X-Proofpoint-GUID: 6iSSAs7Y2nLsf1hiR-j7xTwTB5QT1eY8
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d7dbe cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Azqn4rg6zLMgtGihcfEA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 6iSSAs7Y2nLsf1hiR-j7xTwTB5QT1eY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221

The IRIS_FMT_foo defines are only used for indexing values in the format
enumeration arrays. However this kind of enumeration doesn't follow the
V4L2 logic (which expects an array with consequitive indexing rather
than a sparse array) and complicates adding support for platforms which
support different sets of formats. Drop this enumeration and use flat
lists of supported formats.

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

