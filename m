Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B603D332E
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194244; cv=none; b=DeWHzhMjICBYe2pHqj+7/cl9ZRySyX1adlqzvmh52IZ96WJJTfj+a5b15HCjYXxmj+T/EN7BmAfqWCLrQGFXtqhbcGg+eQ+dgBQbr8wGAbe+S0jswNK10uWSkyB/yvpT9jv6DyO5uVoc8Ybdd51qIHc2xbyfi8LOFnoIWM0Hnbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194244; c=relaxed/simple;
	bh=HkTdVxm4w+k0/TVpI0ca5qa4aiZZTdLwg/kSTlh/tJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2m2MygA6Qfcor1aQ6QXwfL24qozQPBXhVcRCxqHqpeQbm+TaO1mbOgGGocru5Qj5VEa21l/hrelTCMJxCBbx4mlRbT0ZHr0Ufv3w01cFotd8bIfxCIltyDHQLI7FpZv9wVV3/R2hAK+JOTs/I39KFu7pFTHcmS0cD9wGQmmPA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXoGOZgl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2ZhE1nk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXoGOZgl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2ZhE1nk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647KwSnb2778909
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzmyzEi/9mP9ktBgplmP+G5vCsx1+ZwiDnCaxaRy2DU=; b=XXoGOZglB4Qa4NtS
	IJ/KERF7XAEEzfg5VydkPoYxF981Asfr6QicQqQ29VuIYQkz4cwjVg9MeA2DquED
	mntLMhIpH9ABZvrjTIUEM1dpEWvCO2rmExgBHVpupYiyhL/Jq6pKt8Iy/ouMPzPg
	M/JJ11nM1nTURwnDryoRBCsTY6x95jDC9BUTfI+Ij0rjNGbaWYec7VnJWtTNbLdy
	9r3FQBLQZeMPteOvn4dQ1N7QRaC4QqD7gvmALWaTmYxcc2frr6wQJxQGrp3QGpQi
	QSKAGKE5u7nVHfYNQfT5/3JPjQVE8bzwlNrP59sMBLxOfM4NERW/HUnbWBzXGKZk
	8c3kYQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285g97y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-610478c6ba8so1705510137.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194242; x=1778799042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzmyzEi/9mP9ktBgplmP+G5vCsx1+ZwiDnCaxaRy2DU=;
        b=C2ZhE1nkvUwTBk/HVNvDG5r53qTQ6RUxoAB72YmkaAu3HtFpWbtdpHazflaphUH9Dy
         CedgxfzHcJjcn5BiiRvQ40/dA4xjG2K1xKELpiIi2d/OGdFTK45LTYTJbvmyPTmQWSoe
         xmD2S3xj6kx7xD+fWrGBQcomXyhGhTfaftjE1LC9kodcNWVV22zEeHGLvgi+pjWhQAVE
         O7MAwEU453EQZORzkxXh0shHKZqkKm0J4oqExr2xKfJF8c83/NnIkfWRO6nZg2UgvfXZ
         6l8XouUApDv00EV+tZKxKEiJIK4HngqLd4XCqIBgV3pSOtzBPk0TD+uw85uDBd54NGex
         LJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194242; x=1778799042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PzmyzEi/9mP9ktBgplmP+G5vCsx1+ZwiDnCaxaRy2DU=;
        b=MdXwkz+ZB/qtBGEcaJ57yLnrYiwC4gUAgCkcRqktP2YIE15/sKTvF20xLi17Bkxpkx
         9zEd01/UoTQDrJbCmE5rPo3K3q5N5nS522TNh3J2SqSwLtdlOilEUJIr7VUat7bnmXTe
         ZRoLGE8165cdvjwlEmbVvK9yd4U2gEOZ5ptwwvxV920M6+vaUZvNkPMirOdApHcY/mHN
         r9MQDXIFCB/dRmF+ddOqpg00XUe43IC/VpX3/rVkd6lAbJIdCScoDN1NxRgma3db9ce0
         yONFwlKfaK6DTn2FUey9awM8JYbaAYzVZOCZoTDWE16t4sMFINYQlMAjpHSnT1RQUfIi
         kRxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+u5z9ONK0+SrUwr/Ee043HhU8bDZWu+MSvHTxxdfsNo3pUGJO4xCC5U1o2Z6E8i327r9Q3EyVXTdu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqsj2tEcJHtG/wz7OXB1gmwtKtMi/5fydznwMki1hZ8XNcEf0d
	Rm0xKEQ1JFssbghFnfzsXN7X6CPx9tNc5/JfU+0fp+YAQ9yt6sBah71pq9vsWCrHbDDYFhyWf0/
	VLlO4MR7nXVdqAFWdQjDkxPQVmcWviHaqrgtV0lL3cNZ75nP7wwK4Ckl8cmLclC6k
X-Gm-Gg: AeBDietxdG7ThtphSXJzW0hXL3+UoKBQ1mN15nrMLVbinu2qXwzmD0L+eHhF36BSy8G
	VarriqdH9eBvz6htZuj/QhCpaktFl6V+plmkA3znVRX8E+GtcfRjxlroPJZgnfivnlZqKY8cDo9
	vrqBPq0wLLOlMi2pUrgsVZPrXJj9VdGufkoD2bDGD6rKEbVkowhZAMuQC6tyJhTtyAHCGNB01Go
	W2EjMdXd3sg+RqSGTNbTLSItC+P2acRqvpAJ+Ne36QpNojgnxjLaXyjy2N/CfI758cua2JIOFCS
	fmE9vzSdDZAzwy3kfglvYV7kPS+qsf/sHB8Q3Q3SuggwSADPcf376dUBU3jzx65yiPq635IhW4b
	Gi+2Uxo+4C8X1psO39xwgbAt4MW4+Uvkp+EVodNzEudBx6CJNVb3ADH/U/s/3qiGxtQ7WkutaiR
	HO1W8n0yW9RLipy28H
X-Received: by 2002:a05:6102:5a96:b0:611:61d3:819c with SMTP id ada2fe7eead31-630f8ee055dmr6123858137.10.1778194241579;
        Thu, 07 May 2026 15:50:41 -0700 (PDT)
X-Received: by 2002:a05:6102:5a96:b0:611:61d3:819c with SMTP id ada2fe7eead31-630f8ee055dmr6123850137.10.1778194241060;
        Thu, 07 May 2026 15:50:41 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:27 +0200
Subject: [PATCH v3 12/15] media: uapi: Add CAMSS ISP configuration
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-12-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX9HTSZ2e9t4OK
 bhc9aqtMtRllVGWSOYk4c47XOct/rpkVzdQaRvq6ZHUAR0PD7lz387u3Ua4hRArhTcUaZ02QfVo
 CYxsgUBU/PBc8FdmLXHOrhBXMnHDXjbdpz4aNNOnobMEBKxEAIJ/9mC6iVWXwz/l86vS7URxPL3
 HFa4sVW2+IJ2AMqE5Ayr0Jc2qk0jL9cG+biYNFc34zUyouayw3/rmsTEv08l6bOpl4o1Lq40QGV
 7dhY49yCrte2pynkaHPWiF8JFI6d1QGSosgUAVvqD49XF+NRTJ3aWvsZsyu8hBdxXw2j8C0wYdf
 Mpt1Zg1O9Ik0RjMiK3XIk83VRXsAs/hpIee9d7ixnKH2cGhBeLM9poj0lwpo44pCDNbR3eJvNpB
 /sPsNZCFy1efM29q5l9gzAuHRPo0KgsTjjpAetTW2kaFkEkLTAyMckzBkWYAS20Jrvr8IkSME9u
 2SaWzYOjW2GrdpN/W9Q==
X-Proofpoint-GUID: _wI-fHvxGbVQzwU3YlaR79BHHMi6zafw
X-Proofpoint-ORIG-GUID: _wI-fHvxGbVQzwU3YlaR79BHHMi6zafw
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fd1742 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GU9a0yZhNO0hLPa97fIA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070231

Add the uapi header camss-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/camss-config.h | 115 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..665406969e66927e8bce83afaa9a3aae53ba2803
--- /dev/null
+++ b/include/uapi/linux/camss-config.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS ISP parameters UAPI
+ *
+ * Uses the generic V4L2 extensible ISP parameters buffer format defined in
+ * <uapi/linux/media/v4l2-isp.h>.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_CAMSS_CONFIG_H
+#define _UAPI_LINUX_CAMSS_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+/**
+ * enum camss_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_params_block_header.
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_WB_GAIN = 1,
+	CAMSS_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_MAX,
+};
+
+/**
+ * struct camss_params_wb_gain - White Balance gains
+ *
+ * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10)
+ * @b_gain:   blue channel gain (15uQ10)
+ * @r_gain:   red channel gain (15uQ10)
+ */
+struct camss_params_wb_gain {
+	struct v4l2_isp_params_block_header header;
+	__u16 g_gain;
+	__u16 b_gain;
+	__u16 r_gain;
+	__u16 _pad;
+} __aligned(8);
+
+/**
+ * struct camss_params_chroma_enhan - RGB to YUV colour matrix
+ *
+ * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
+ * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
+ *
+ * Luma (Y) row of the matrix:
+ * @luma_v0:  R-to-Y coefficient (12sQ8, e.g. 0x04d = 0.299)
+ * @luma_v1:  G-to-Y coefficient (12sQ8, e.g. 0x096 = 0.587)
+ * @luma_v2:  B-to-Y coefficient (12sQ8, e.g. 0x01d = 0.114)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ *
+ * Chroma (Cb) row:
+ * @coeff_ap: Cb positive coefficient (12sQ8, e.g. 0x0e6 =  0.886)
+ * @coeff_am: Cb negative coefficient (12sQ8, e.g. 0xfb3 = -0.338)
+ * @kcb:      Cb output offset        (11s,   128 = +128)
+ *
+ * Chroma (Cr) row:
+ * @coeff_cp: Cr positive coefficient (12sQ8, e.g. 0x0b3 =  0.701)
+ * @coeff_cm: Cr negative coefficient (12sQ8, e.g. 0xfe3 = -0.114)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcr:      Cr output offset        (11s,   128 = +128)
+ *
+ * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ */
+struct camss_params_chroma_enhan {
+	struct v4l2_isp_params_block_header header;
+	__u16 luma_v0;
+	__u16 luma_v1;
+	__u16 luma_v2;
+	__u16 luma_k;
+	__u16 coeff_ap;
+	__u16 coeff_am;
+	__u16 coeff_cp;
+	__u16 coeff_cm;
+	__u16 coeff_dp;
+	__u16 coeff_dm;
+	__u16 kcb;
+	__u16 kcr;
+} __aligned(8);
+
+/**
+ * struct camss_params_color_correct - colour correction matrix
+ *
+ * signed 12-bit fixed-point (Qm)
+ *
+ * Out_ch0 (g) = A0*G+B0*B+C0*R + K0
+ * Out_ch1 (b) = A1*G+B1*B+C1*R + K1
+ * Out_ch2 (r) = A2*G+B2*B+C2*R + K2
+ *
+ * m = 0x0 - Coefficients are signed 12sQ7 numbers
+ * m = 0x1 - Coefficients are signed 12sQ8 numbers
+ * m = 0x2 - Coefficients are signed 12sQ9 numbers
+ * m = 0x3 - Coefficients are signed 12sQ10 numbers
+ */
+struct camss_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 a[3];
+	__u16 b[3];
+	__u16 c[3];
+	__u16 k[3];
+	__u16 m;
+} __aligned(8);
+
+#define CAMSS_PARAMS_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_wb_gain)	+\
+	 sizeof(struct camss_params_chroma_enhan)	+\
+	 sizeof(struct camss_params_color_correct))
+
+#endif /* _UAPI_LINUX_CAMSS_CONFIG_H */

-- 
2.34.1

