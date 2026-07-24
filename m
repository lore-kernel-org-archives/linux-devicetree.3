Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E9B4334DB
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896945; cv=none; b=SVY66BHoB2ggjfxDeLffkbLtkLbjEaPHflCuNdWhv7Wy6x5+SSLe1zO49ET/nH0/t3XYf3eeKHABOXc3RmBBYgfYVcDcWlb8d4hCWupyatED4nldL/9qpBP49pNgRH5Knwrm4GzFU5LEGAMCNcR/NWRBVJi8uCWdr9+8UMyf2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896945; c=relaxed/simple;
	bh=geSMRy0ZH2JvsJTkXwUacPv3wUGMUI1wV+ez02ZCygg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SDuuklO52HQ9gK7c+Rg7fsDxFwf2DBJ3+ou0hX84OhNFCZH4Ogyj5Vyva9TDC5ltI3853OFhoW1XhqXz15Ro1KdtlbTj7VpJFd85nrsmYEPkv/xCNzOEumnTMb0YUdjVYV7EKKWFo+EYsekQBSVN/60MgScBnkZLtiCboJitFtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHuySgG+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjAXuNNw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHuySgG+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjAXuNNw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OCgMjr2590593
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guK9WgFBYmGttLui81Y4F5MyPTupnD6V/+UwyXGi92o=; b=MHuySgG+8USGcQSg
	OdzpTDXotBFJv1hKus22YZeQBUndwKCTlE2ezKc/WKlkZkwZTZ9fqpfVcGqoZBHk
	dH/WGd9rUFBzkPHsmqeG5supxBpsQiEmoY3wt3EqrEs5pV706zSq4jZmS3r9rZdf
	KrMSQ02DCTGBsYtUQ/rrTqL9G8dSARsH0wihNBWys0PiCh4nahINQorbh3Ca2v1J
	fcpWce6kDOMLZJz7e0IZ28myjtpcdHGoTe/87u57YmktfdeTKTSemDwkDHuCJCSk
	uzXdYkht20f/CDMdXv1SC05AoXYkPi4gGgrK5XQwBcTfZ5yzT9fYYKv0O0z5dpCg
	eyftOw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrtpb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0f45415cfso6398746d6.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784896942; x=1785501742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guK9WgFBYmGttLui81Y4F5MyPTupnD6V/+UwyXGi92o=;
        b=DjAXuNNwLEHFPFNAQEYdjp/sKh5bm+oxAIATFV09XtSXxAFxAFcr5XrTtMgbS86iJ8
         KAxznrdvRaRjE8hSJRsiGCRhvFVfzyIKVatmxrbikP3QatGSsL1e5Euyd11FPKwAroKW
         CghDfBKBg27a1nMRCOKB/bv5jv47ANbYkFf7uDH+BpOm8OXQFyio/OrXL86mrZifuESn
         Iby0bxau6dB30z6DqKPX+icD7bA+x2dD3pGWj4CPvsEks8Uyz07KA/3myAQAFpiD2D1C
         Am98JXIFfxXpOym/TemfA8w4cpqjIi/R7NhUEBqGgWQwF5P2M9sObtrMyFgjWfvTv4yj
         HueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896942; x=1785501742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guK9WgFBYmGttLui81Y4F5MyPTupnD6V/+UwyXGi92o=;
        b=KwrTzZcB+cQ8EzAAS2rDGRDgFvd3L7vomv5Y+Ovv6ZzkslecDmIvaPDcSIqZzhscv2
         8JLGvmFgO2AfgeaQrZivwouPwkVSTA3vyBsYeBJMSE5OmLUuvdHnqaqN5Uk5PHFSI0WC
         qusnY3OyXolJyA/RsxZ3sTPaAje+8q2Xcqqc6S8cloAvSQK5arDtb8kWaKLrwqL7hJon
         X1pz2M/Te7Q2DEdMlicw/IHujs5VZH6mix9MzH8leJ7aGIfZHB2/i7gYmhe1p3OSc8Ai
         /oW+GZi0tb4718av/2VChuEWJ/Ra8/BayW8hoeXmB6f/e13ZAnCh/RERA3Hfy3ZwXALX
         nV2A==
X-Forwarded-Encrypted: i=1; AHgh+RoLpyCyS6IwBX9igbA7HBamDz0uT8hemqtsSZGXqoQYZCIYiDkookQAv1zK4hFTPwDEXDCJYE9bi3aU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp1giKodUMr6wTdEf5EzhXCwuCz/dPAbtpf1RgrbtFxldxm9XM
	ATSFsL4yMLVIYwK7OtkEr9XWz/phiuTQyW3niRPEeROEIigEfCf8U2d4oGNOZGJI9TEaR5viARx
	z4QPRZ9WDDfRXv15GM3Kx5Iu4PvrGzzfVKEY4YmswXGbT9YewKTXqL2zFOAauFUTx
X-Gm-Gg: AR+sD11v4TRXllEj+Z+8kSTqLTvol/NwK1hzpQSv2XgemDoBgPOL4Akq6uy/qMU9EsG
	Lb2HFnpo2hR9qV7BikYgh8mkkAYChurB+c4dsV+utGJbTC5kItXubgYpiftSE3jzBt5eVXpgvyk
	2XTdmCY0wyOHYA4qN5JxjhnrfJ1IduOEl1I8t2eUBHreVjs+yINRsVoLJF96T0uPTf8sbHny1jd
	HQSzW9pkFO7iVnyXhH1+cPnYNbV+zVknzNSk7Ddx7Jxr7uOCMoZNY8Uh9Lc9vLrutuIty1+Esk1
	15rChkWW18Bhn8mMs0wEU0FXICdqYaH8xzQcd4Kg0RnvAnnnfrZxp0n2gr2WC80sCxhJogRoTl/
	8If+j0T32uPKJX6vEedODyFpJPKTw0Go04FKAXyP8ys47WOQvm7UHTCTz0mtSDZiQAQIDkJsFl1
	gEOB0x0eMehN4V/0skJy2n3P7zudQGZHwEdGyZhUaXEwlkP9G4PQ==
X-Received: by 2002:a05:622a:ab10:20b0:527:7112:a5bf with SMTP id d75a77b69052e-52845a024e9mr32212141cf.71.1784896941810;
        Fri, 24 Jul 2026 05:42:21 -0700 (PDT)
X-Received: by 2002:a05:622a:ab10:20b0:527:7112:a5bf with SMTP id d75a77b69052e-52845a024e9mr32211951cf.71.1784896941327;
        Fri, 24 Jul 2026 05:42:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm352591166b.43.2026.07.24.05.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:42:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:42:11 +0200
Subject: [PATCH v5 3/5] media: uapi: Add CAMSS OPE ISP configuration
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-camss-isp-ope-v5-3-e70ad4fa39ce@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfXwb3SQPUwNkyB
 m4inoxK+w2TM86+YhOM5l6GRpFrBYbAmlnxPmV+iLe8oL7RwN5Q1DEbJVJE4JNijQT36c6ARuAc
 ydeRKLqdGolJs7Gkex09X1cUDFJfor0=
X-Proofpoint-ORIG-GUID: UYQrJwjGJfHq5gbrzaSdwS1EiSSDIX-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfX6VAfVtXC4GJo
 0E4pWqW59A9La1lEWKUCLVUL37glyNSsV8UtHgay0cxrDGHwhxX3GdWgHysbEKVzOGJ7Mz3kJ1n
 zGAq4yEFW9617bB7w01CCKKfIrNt8tcWRwGWmh3HfvP6aSswW3uMh3Z4TWqKrGcncW9Rs74Qmwc
 cXz5Duxb1k/OlrAiMfd7P7HpKjh3/w8yVrPWLzlrE92qRV41FzOlOTM6iuC1OmqppmroOohW/qK
 U1TEbxsu/UwVngp3asLiZMaDk25S91+ZbV0OpMDAo5F13jnyQPczPy2AoqsYn5FrgiGNcKAUI1S
 9o38pQ+lupzoKo4tYya93dLNYue4oRQ4sw0VMyW0lHnJgb1rGqrbvVfs00o16VybNbdjCnrFq2h
 fKCgiT5qPChfxVpz/1PrCPfuRs88sY5GlUAZxYyrcR8oNvfmNkFQjbo3fR1kyVbdPFJk2rBGuFQ
 NeQf+IyN0ftmhdc5e8g==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a635dae cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=vpu3RY5T7JUIaZzxZogA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: UYQrJwjGJfHq5gbrzaSdwS1EiSSDIX-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240115

Add the uapi header camss-ope-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/camss-ope-config.h | 160 ++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/include/uapi/linux/camss-ope-config.h b/include/uapi/linux/camss-ope-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..800e6ef1dba218ca33b565e1e51d6647f02f8753
--- /dev/null
+++ b/include/uapi/linux/camss-ope-config.h
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS Offline Processing Engine (OPE) ISP parameters UAPI
+ *
+ * Uses the generic V4L2 extensible ISP parameters buffer format defined in
+ * <uapi/linux/media/v4l2-isp.h>.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_CAMSS_OPE_CONFIG_H
+#define _UAPI_LINUX_CAMSS_OPE_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * enum camss_ope_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_params_block_header.
+ */
+enum camss_ope_params_block_type {
+	CAMSS_OPE_PARAMS_WB_GAIN = 1,
+	CAMSS_OPE_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_OPE_PARAMS_COLOR_CORRECT = 3,
+};
+
+/**
+ * struct camss_ope_params_wb_gain - White Balance gains
+ *
+ * Implements the CLC_WB pipeline module.  The pipeline applies three
+ * sequential operations per channel:
+ *   1. Subtract sub-offset (black-level subtraction)
+ *   2. Multiply by gain    (colour balance)
+ *   3. Add add-offset      (output pedestal)
+ *
+ * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
+ * are 16-bit unsigned, normalised to full input scale (65535 = 1.0)
+ *
+ * @header:   block header; @header.type = CAMSS_OPE_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
+ * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
+ * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
+ * @g_sub:    green sub-offset, subtracted before gain (16u)
+ * @b_sub:    blue  sub-offset, subtracted before gain (16u)
+ * @r_sub:    red   sub-offset, subtracted before gain (16u)
+ * @g_add:    green add-offset, added after gain (16u)
+ * @b_add:    blue  add-offset, added after gain (16u)
+ * @r_add:    red   add-offset, added after gain (16u)
+ */
+struct camss_ope_params_wb_gain {
+	struct v4l2_isp_params_block_header header;
+	__u16 g_gain;
+	__u16 b_gain;
+	__u16 r_gain;
+	__u16 g_sub;
+	__u16 b_sub;
+	__u16 r_sub;
+	__u16 g_add;
+	__u16 b_add;
+	__u16 r_add;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ope_params_chroma_enhan - RGB to YUV colour transfer matrix
+ *
+ * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
+ * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
+ *
+ * RGB2Y - Luma (Y) coefficients
+ * Y = v0 * R + v1 * G + v2 * B
+ *
+ * @luma_v0:  R-to-Y coefficient (12sQ8)
+ * @luma_v1:  G-to-Y coefficient (12sQ8)
+ * @luma_v2:  B-to-Y coefficient (12sQ8)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ *
+ * RGB2Cb - Chroma (Cb) coefficients
+ * Cb = a x ((B - G) + b(R - G)) + KCb
+ * with:
+ *   a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
+ *   b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
+ *
+ * @coeff_ap: Cb positive coefficient (12sQ8)
+ * @coeff_am: Cb negative coefficient (12sQ8)
+ * @coeff_bp: Cb positive coefficient (12sQ8)
+ * @coeff_bm: Cb negative coefficient (12sQ8)
+ * @kcb:      Cb output offset        (11s)
+ *
+ * RGB2Cr - Chroma (Cr) coefficients:
+ * Cr = c x ((R - G) + d(B - G)) + KCr
+ * with:
+ *   c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
+ *   d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
+ *
+ * @coeff_cp: Cr positive coefficient (12sQ8)
+ * @coeff_cm: Cr negative coefficient (12sQ8)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcr:      Cr output offset        (11s)
+ *
+ * @header: generic block header; @header.type = CAMSS_OPE_PARAMS_CHROMA_ENHAN
+ */
+struct camss_ope_params_chroma_enhan {
+	struct v4l2_isp_params_block_header header;
+	__u16 luma_v0;
+	__u16 luma_v1;
+	__u16 luma_v2;
+	__u16 luma_k;
+	__u16 coeff_ap;
+	__u16 coeff_am;
+	__u16 coeff_bp;
+	__u16 coeff_bm;
+	__u16 coeff_cp;
+	__u16 coeff_cm;
+	__u16 coeff_dp;
+	__u16 coeff_dm;
+	__u16 kcb;
+	__u16 kcr;
+	__u16 _pad[2];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ope_params_color_correct - colour correction matrix
+ *
+ * Implements the CLC_CC pipeline module.  The matrix computes:
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * @header:  block header; @header.type = CAMSS_OPE_PARAMS_COLOR_CORRECT
+ * @a:       G-input coefficients per output channel (12s;
+ *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
+ * @b:       B-input coefficients (12s)
+ * @c:       R-input coefficients (12s)
+ * @k:       per-output-channel offsets (typically 9s effective)
+ * @qfactor: Q-format selector (2u):
+ *           0 = 12sQ7  (range ~-16.0 .. +15.992)
+ *           1 = 12sQ8  (range  ~-8.0 ..  +7.996)
+ *           2 = 12sQ9  (range  ~-4.0 ..  +3.998)
+ *           3 = 12sQ10 (range  ~-2.0 ..  +1.999)
+ */
+struct camss_ope_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 a[3];
+	__u16 b[3];
+	__u16 c[3];
+	__u16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+#define CAMSS_OPE_PARAMS_MAX_PAYLOAD		\
+	(sizeof(struct camss_ope_params_wb_gain)	+\
+	 sizeof(struct camss_ope_params_chroma_enhan)	+\
+	 sizeof(struct camss_ope_params_color_correct))
+
+#endif /* _UAPI_LINUX_CAMSS_OPE_CONFIG_H */

-- 
2.34.1

