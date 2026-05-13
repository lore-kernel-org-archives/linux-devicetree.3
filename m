Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312B544BCBB
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676559; cv=none; b=AEqxXjp6w214okAvuUOyeF0pB6Dh84Mopw8uyk28cxgZiYNYvxV+KhgAhXn5mveMMgs7ec/fuf5LIx/D4x2vcNb/o4biuq6Fgy1pAmgdeE1Om87FwtVPfBtYJgBqwkJ6xCRFkaSTVNSoYKSxYvqMfr2vty1vUIaE7LgFxCwd2EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676559; c=relaxed/simple;
	bh=U1WEKcOZrCsXwGbYO3VwEdQBYlx1VxXoS7cDYZcOMmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukI30NGQTsToIGa/BeXA6cqXbfD6svwpzdg/ygPKkuqvVX+QcrUYxn/czWobZSqdtyA+9naVSnhzMvMwAgr/y9bRHCpu5OfAU4ebykaTGzgJ9Pt/DquJNii4y8jh8xwiV3YU+160g7qZjU9Z29P/nx62R5Vy6iEcZrqRkZW7AS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAx6Trp8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O55O23dq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAx6Trp8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O55O23dq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rFs94082487
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=; b=DAx6Trp8zN/Zkx8F
	EyNHy1+PdaaDVCFQLFDKKQ7NCKLTnA8C5andj8oivDew1KcntvRaIwspFMNtNgC2
	PXNJsScvjKgFl4PN65mmm9fHMHOlJ1ZAnPNYMv1SGMcrD+cZe4zPwS62W/U1u0Pi
	bSR4wqaX2CbnmMnogAFGyqF1ck1pOV07yNx9sAQ1dMaXMckOahuyO6/haepwumWn
	wou5CKe0+p18xkZmu1/oagXS3sGYUmiTMNdiI7aQo80vRmAFlHhX2s0nfdP9hkFX
	QRNIhWFG6hOFxcMCTF5YennuaMDMy8clLSr7O8m04luYqkJlAubc74liw0fw5nxX
	y4TNIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0tm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5162ee45a77so16147091cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676553; x=1779281353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=;
        b=O55O23dqRgpb469xUiyw3RpkOQjgJdF99+IZb3cQCW8Vr2qVTn+CgmrGyFhvnzBzom
         7bjRbmzs3RGESrXFN8gUSpCjaNkwgqbXtnYXukYU3OJM2ny0os1Uo/TZQwg/ealIO8UA
         XxafcXZQAXEcNp+ZASvMAoO8joQAgBpRjQvXDh2p9PKj7pZ0AxiWKqjh1JQAHg31yRVd
         7cEcGlTBD8+KGCua0YBYye7mbUTNwxq9A5JlWRJdAravfizOL6eOHnOKPwOEnHAk96ht
         ZRT461jjq5tYBckjzUe07H51U8NPSDhHYFWmfqRBwksMVtaaSbvz2hVHpTXuJ/OhUTiy
         r8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676553; x=1779281353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=;
        b=NXBfCjgM/4PGNd1wOCCHmPrQCweqDqzIQ5kcRXosrNagxWY09d6WtSCdpJnHtXBeZZ
         Km2p6gTvPSxIvuXvCEHN7DPNUlzJkLQBOmvGVAqpY6j8T1x98vmZ4SxT5CpuMRZWMEvR
         Y++x9DjMXSmuDBrxYvmhtHSnYiogzkHCwWguv0khBbeRWw5mrqTECA/EjDQN2NajNiGH
         gF8P46j6mvDGjdJ5LH3+4D8jQYS307Ay019Go9R9wVgCNhgho/ZSogjtEDBTj8Kp9bRx
         c4rhyxad126GiTmyzXBjKs/8gfHfMC9a785aBvQgvkbQqTpFVOHBwRSa217DjDbrB5x5
         7ikA==
X-Forwarded-Encrypted: i=1; AFNElJ/ATHPf7Ihv+KluzqXdQvx61DdwQFdxunyBckieugwoRRrZcde09DomRHcIFfoNuU8AeIu6AmowLH4A@vger.kernel.org
X-Gm-Message-State: AOJu0YxESKWvuFh5YKASgQHKWMsv3lNfrG51NV0TpG37ozxvWX2OyDli
	tmVpCuR0KGJ3KjV9CmHqywp8Vs18auDANWTsgfQyLme+J+A3nTfU4ieBiUPPVEZK6HWXY0U4hRO
	b6hKXwnT5yDgyicV5fPUZXn1y9FhoONmEHJ4EWoO8gjCNvX0bfHanXMb0vG8bOxb7QB4coV7h
X-Gm-Gg: Acq92OHZcfoCi/ItuPTidCa3dwNI1kWYIOyBfO2H8d04ybz/q/bs47vzkoeZ6HI2msb
	XbKYlVlsDOGA9qXREuMOH+OyrqT76zzmql+7wFMH9e5c7n+RtxalwRCP9fpaLuJD/ecjQFVtTcS
	ncJ4F3buOklIhL7OWWelfT2m29+lKDSaaFXm2CZoZfFcJnS0rg4h7lzA3UGQa54304QDXCDBzyr
	vqO8gS/DGxfsThN6sudvwPe24ht/cMbMvW88jW5Ib5vDOLijlacLX54K20Cfd5BqkofpLb2JpKK
	00LPXAMm/HAdRMHGQzMa4pcklUIepjPJzIhltnOP/ooBJEA23/RiqgMBxNYCuS5OGTHKm9l2n8u
	uSyq4T2LDXhzD9DFvEj/gH220KJASoX4YnbvsM54ZTs+yBF/hlMKWcgiGPoPUhoYQitEuJ2o+8b
	1HZuBEN+8tTlwigeUJipfaIhalfYa44Y1fpGc=
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr38735021cf.48.1778676552688;
        Wed, 13 May 2026 05:49:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr38734351cf.48.1778676552085;
        Wed, 13 May 2026 05:49:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:36 +0300
Subject: [PATCH v2 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-2-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHM/rOGpk62mEvyYzTUSmmxa/tsYrrnZZDEdj
 mwZJD3UNf+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzPwAKCRCLPIo+Aiko
 1VbHB/4xgL+o0pFRVbWcQXFvIz4kiCzjS4V8GF2MG7OYQh+tfpdavVF7ltbdflw8Anmibz4W8WC
 afIDGpQxjQEfObIchp/9AHvFj2yz/OMQqMx6lqX71hMDKCrUoYMXaafljvSP1lGfyhveQcNEYi/
 yTTevfEug7tIiUQoQRE22t39rY8FzUxZZzwo6rWqneSxeHsE1MA+LkY7KaFsRMKFvAlyGnhCkM9
 XROtUNNR0vZySlB+1U7gVdEQReqQ0dAzig2KqQOya90O2UQlLssTvfDgk/WQNgF1bf0k6VkDBqy
 gR1ytxMXjY4vO4luIUXpyacIdZqJjQtPP/aCuN27EM7ZVPNm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TR8xBYna3teR9AnrqhqN-DHhKort2IPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX5li6F232GMBh
 0Ficd601YIwJnNsvrAyMJOUs4s9ZOPhGMiP874R4LyCwvhpi10o90zg5VI1PzQfdxMkGN4k2Me9
 Z1e9j0j1piyriu2iRi9XPvGwIHIY39iGHvacf5Ph5kVy0cJQCIDvQhYHol8XKoOcZcRyxgI0+PI
 TaIDDA/Z/m4yo7jkD4pC46NOwGJBIYzIIdJ6J2RJf3ZD818JIlNUV78m56vmR+4OvvRFxtf2h04
 yNRr0982RA1esTgNn3j79QpaNHgcvZjXrKH312ZGRcXHJ8Sbd+zdipl2zSErZQbPvgRzgQ+Iry1
 z9VenBppeYTvI92wGuO+2u65lH4oa8LMdfilpRUqvrs7/YzDY3bHHMl/JPhjW/mpoVcNVSH/FRa
 TXAwYrCr93+mznrxIKhFw/HYOHL0BPUfeuG5esGLO3r1nrxtrhrNdjvhzlV0NwgpIC+3WtgaNe2
 BTOkYh3KLZukwyN40yg==
X-Proofpoint-GUID: TR8xBYna3teR9AnrqhqN-DHhKort2IPL
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a04734b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=HWmRtQhKy1KQUjwlQEkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132

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

