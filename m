Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634808;
	b=dc65NEykHBgCZ3nFPHr960Erb88TikZXpGr/EjZkymeQyWvAVDF1QhlFvRXNm7e54J8Y
	 OHwznaBc4G7BTWdIqMx+q2JKYGJtRG3gr+3qQCJjcWLhhIFlxdpTKBAHEgY+MExd1jnIj
	 vOMF1B4EKMuzaQpYqQpjzagfYhchruchweM9D9c/L918K18dXpT2+zeDMMtiH08LR8g3v
	 byIPtsJU1Lccne2V+4UYG9QKI3jf/xqOmcH8xkUcqPdlS12TOEd10WZ+mM86pLPhS6CL5
	 l8wA/XCkzulWSD98YJCk+RtIpyinB+r/iKee919G4UeljIlj1DrAGdKzgC2bcYTVEyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ODaIjf5VwjF2KdsntRNya0T1MnDIbUmL9YbGffxb1Yo=;
	b=toZPoKdfuRMxr/9iOI2PNJh+nPrVbVcX77e0Y56a8t6z2ZyjXic8UAX/HvXhQlJB2sPw
	 RSKNpwjfkxUuUNfi3UqjXoNihCPsT4o0/lfya3ie8HvZtCpwhUbWcs5UAP3LqlSYf0D9U
	 JbiBV22xMGNQrfiCbKLZAocfWgzQic5kgG5Oj6UGbpcKyhpbqTcpBZCkqonZaAGrJ0jN0
	 kLpe0w//ukVcaM8eroON7nw7ZDBIrgqVkcb+GZgRbWd8x/Dv9hXhVvoCMBnC4uMXnnhJy
	 /U/3qPK/lDoazd3kRHq4W37P6SaqTIKLmfH/zY12eBrOmv/wrRyLl5+Kvym18WJjOOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVu4Tnj8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a5kYb/jA";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0179860AED16
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0179860AED16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVu4Tnj8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a5kYb/jA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpSlN4070572
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODaIjf5VwjF2KdsntRNya0T1MnDIbUmL9YbGffxb1Yo=; b=UVu4Tnj8ZPUJ7Yp1
	Nf/ExzKQ6Uh+3p2uwCXvsyNhHRzIPSD/RuneqmCjLih5DmcBTRhsd2ePvq1XO00j
	W01HwsJP+l4mpH/CDgMQM7IEaW9oaKAiJSgw8U0d0at0X/87L9yhM/G5uBMQKcsV
	MVNFG7aWQu2q15aezJGkIJBtqq/D9+JSkz5RQxMxk1eb6KGLE77Huy6jgbHcAvPq
	PfJFawohyY9mcNhig8w2JvzriBjo6Wfnrdu2Iz0/6S/dyXQwfH+mxjtaqWpCXmfx
	KQ9vc9JkpX/EsQ6z6nIFOoxI1fDpRgiETxgOC5CXuEmpb78Vwd4iSCTf4Oc5MvzI
	nLJt1A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5h3f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:53:26 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988b86c66e5so3491151241.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634806; x=1794239606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODaIjf5VwjF2KdsntRNya0T1MnDIbUmL9YbGffxb1Yo=;
        b=a5kYb/jAVHknx/3aN6HG26siSYVZoKfDaO8Hhzg2IUCB9f7407q/RcnPY+BxjM4CwM
         8BL59ME0iqyZplFN+eucL4TTfoVPdk3jxCC5MdOGMVvL5xuAEmVXZjzzO0ivVGSGOfoN
         2kKYA/pSqPSOzY7slVpJWcWXP8a4xElunDNwilYtiB5ExqZVt/UuFV4hxcOnJPA0122R
         51MfQ7nPvfl2TR2S9gtG76CuhZC9/SjCyXsb4X7zzeGF5B6d5KBSOEIrfPsHOdEMENnv
         EbIYZ9Nvjl8w250Nji8GF8ZTvL8MJkZcbIiRnUdERO2DvD0xUCbMaYt75p23eJDb5icS
         OQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634806; x=1794239606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODaIjf5VwjF2KdsntRNya0T1MnDIbUmL9YbGffxb1Yo=;
        b=VjzDGzPya6NFA4f3jxRFnWOovaPwlBpaWI1CNrOOTUeHXxiv5fn50DcafaFRUIqGD1
         cp9sBfWhrnlq8iwP6j97E9jT7ceCNYa9Ewfm9mJ0jV36aAPtZBEnNdjvjoB6/8h5VSnq
         oNoexI++vSLJEx0vviQGHikT0bqiyI5thKgwXadZJOo4gs3ZIFbgELjhC+Yzx7M4Ls/o
         xjO2ArjgSBQRSjN6XVWZFdQzrWcvctcEj8ujfgbdmBwa1/4InCv/QwbL5BgSGEEmxlxl
         CisY8VdWS21cPoO07BCUSu9LujdYC6eSHmnwcH+IASh8NTomxeAGF64N3zAx+XMpSxiX
         TEOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1bk3YNyze9Wmfb4RwoNwDD8y/3VRZXf4f1nCH9RHS0MPGMtOmdoyLa/dndYDY5cje68+50KM0DKOd@vger.kernel.org
X-Gm-Message-State: APuU4Z/KHTbZc+SQ2t6tMbE2MpvMfoZPF9j7XCXXgWQoJ+qxjHyg5k2F
	G3kblmlw/WOPdXGFNPb7Nd3JZDPpN5iygMWFFDP23FkYR6P1b0YSi3XMwZtgg5RDmIXw4WDEzF5
	IR2pa0gB5PFcbia4aH19PHNLXkz+3dRp2Erh4BRgmVO5BCDB1Lfzxt32Ip9ausa8ix8YejDtroi
	0=
X-Gm-Gg: AYBFou3AQbl7APShk8VtzyK+Brhd6SeCjbWRG6X40GfchJ8uZkOQ9DYheFAuAMawkqe
	xDDe/ygTlOFWbgk+XBpCoQMgz2exy5O+3hg7o45OEbG7pMzYWOZEX1lxHG8Bk8cGV41XFs71z+4
	Y2URgWPfevDx+nJS8fDFsBhuReDkjbwtA1bv4rfl5kRCQx/HNZYIfawwvSh+goXo48p2BvD0zYG
	9/k1iAAfsLkJz6DQpFLprE/btFTcqc5KXGcjcHmlPIYkiB9W+rTuN7UsXDfRukGWVbo/++tFOnN
	JPpEYXSt/ZhHf63NmiZ+MqqlD2tErKi6/P87VsFDGbKo1fJi0qwrGoHu50M7zs7wqIZshS59m6P
	2+qB0MgOXad173vVt+BM6+VoDmTxEngpaJFp+MCKnHi3tjGurQvQWPy2/FafBkS2C4yc71dIfsJ
	VTOBdRmrCSpDpH//h2x+YnFGCnS1V/X1GeXDGUvairgGNtLOXi1QeSebzc9YplPEDFsw+F4FucW
	B7TR8TxMWZiu+gbGWaZDhNa9rL8
X-Received: by 2002:a05:6102:5244:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7d054298427mr3918344137.25.1793634806125;
        Mon, 02 Nov 2026 07:53:26 -0800 (PST)
X-Received: by 2002:a05:6102:5244:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7d054298427mr3918321137.25.1793634805562;
        Mon, 02 Nov 2026 07:53:25 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:24 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:35 +0100
Subject: [PATCH v12 4/9] media: uapi: Add CAMSS ISP configuration
 definition
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-camss-isp-ope-v12-4-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8b1f6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cBt3T3tByBXynNCq78MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: OJIHi3yLD_dDyC2-ZlB96jeJ0O3jdk2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX+whc66bNDZSw
 e6fFJvkFXWmC6qB/ArmuWqesGiJi7XAAARB1o0QZHmfV0rmLLk/W7MqUOJG7geWPLQ/EZ5Bqr3s
 ro5f3/6C3XwnkhSy7WE12/L0/jv/PXFyFHpJvOmuAYZmHarALfsHIVtJD/5xkuodpvAXUszoT1B
 1IHYuKtbVo5nquZ393Kdsk55Ff6l4SNoHUwP3oM+cCLAFbULZl0sOUjNGxTC0OeUMSyQ46uAd7E
 5EUE7wbsj1fSaDHB2ZJH76BerxzTBddC5rKZLGUR9p+G8k0kPfi7fDQ8zNRQrYP5KCYo5zC5NRK
 TssjGqvQxA2BSfrY3d2OkZbFa0Lr3QTGGo7Iv2NURONZgz3wBipXuvH7zphLivE9T2cmgebONh4
 8b46fYWXtTogfjc5fzDb+43RDRDGxFN0CUHYIk/L945dwBds4ixaT9ishSYRpx/TIJ6SdpcPauP
 60am3llPDOIU+hRgzLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX6nKoGwtEHcY/
 ya2jbzb2tQmncVd+DRbhkEDEm7IR6keNEnQZzJOjqawk+uqAxOpZq+lDvXMGGhasEyMqu6yWc8u
 BmUQSORPYpf2RhWOybdNaMAXB4Dprcw=
X-Proofpoint-GUID: OJIHi3yLD_dDyC2-ZlB96jeJ0O3jdk2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

Add the uapi header qcom-camss-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

The block type enum is shared across CAMSS ISPs so that userspace only
has to deal with a single set of block identifiers.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/qcom-camss-config.h | 212 +++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..5756d165e7e873a6d268909da077acb6f5f56054
--- /dev/null
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS ISP Driver - Userspace API
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * enum camss_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_block_header.
+ *
+ * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
+ *	&struct camss_params_wb_gain
+ * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
+ *	(CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
+ * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
+ *	&struct camss_params_color_correct
+ * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
+ *	&struct camss_params_gamma
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_WB_GAIN = 1,
+	CAMSS_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_GAMMA = 4,
+};
+
+/* Number of entries in each gamma channel LUT. */
+#define CAMSS_GAMMA_LUT_SIZE	256
+
+/**
+ * struct camss_params_wb_gain - White Balance gains
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
+ * @header:   block header; @header.type = CAMSS_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
+ * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
+ * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
+ * @g_sub:    green sub-offset, subtracted before gain (16u)
+ * @b_sub:    blue  sub-offset, subtracted before gain (16u)
+ * @r_sub:    red   sub-offset, subtracted before gain (16u)
+ * @g_add:    green add-offset, added after gain (16u)
+ * @b_add:    blue  add-offset, added after gain (16u)
+ * @r_add:    red   add-offset, added after gain (16u)
+ * @_pad:     padding for 64-bit alignment, must be zero
+ */
+struct camss_params_wb_gain {
+	struct v4l2_isp_block_header header;
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
+ * struct camss_params_chroma_enhan - RGB to YUV colour transfer matrix
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
+ * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ * @_pad:   padding for 64-bit alignment, must be zero
+ */
+struct camss_params_chroma_enhan {
+	struct v4l2_isp_block_header header;
+	__s16 luma_v0;
+	__s16 luma_v1;
+	__s16 luma_v2;
+	__s16 luma_k;
+	__s16 coeff_ap;
+	__s16 coeff_am;
+	__s16 coeff_bp;
+	__s16 coeff_bm;
+	__s16 coeff_cp;
+	__s16 coeff_cm;
+	__s16 coeff_dp;
+	__s16 coeff_dm;
+	__s16 kcb;
+	__s16 kcr;
+	__u16 _pad[2];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_color_correct - colour correction matrix
+ *
+ * Implements the CLC_CC pipeline module.  The matrix computes:
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_COLOR_CORRECT
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
+ * @_pad:    padding for 64-bit alignment, must be zero
+ */
+struct camss_params_color_correct {
+	struct v4l2_isp_block_header header;
+	__s16 a[3];
+	__s16 b[3];
+	__s16 c[3];
+	__s16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_gamma - per-channel gamma correction curves
+ *
+ * Implements the CLC_GLUT pipeline module, applied in the RGB domain.  It
+ * holds one independent lookup table per colour channel. Each table is a
+ * direct (not segmented) map of input level to output level.
+ *
+ * Each table has @CAMSS_GAMMA_LUT_SIZE (256) entries of 16-bit unsigned
+ * output. The number of significant output bits follows the width of the
+ * engine's internal bus; the upper bits are ignored by the hardware.
+ *
+ * The module maps a 12-bit input to an 8-bit output: the top 8 input bits
+ * index the table and the low 4 bits are used to linearly interpolate
+ * between adjacent entries. Entry i therefore represents the output for
+ * input level i/255 of full scale.
+ * Output range: 0x00 = black, 0xFF = white.
+ *
+ * How to fill a curve (same on all three channels for pure luminance
+ * gamma; different curves per channel additionally shift colour balance):
+ *
+ *   Identity (pass-through, gamma 1.0):
+ *     lut[i] = i;                                // i = 0..255
+ *
+ *   Encode with gamma g (e.g. sRGB-like, g = 2.2):
+ *     lut[i] = round(pow(i / 255.0, 1.0 / g) * 255.0);
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_GAMMA
+ * @glut:    green channel gamma curve
+ * @blut:    blue  channel gamma curve
+ * @rlut:    red   channel gamma curve
+ */
+struct camss_params_gamma {
+	struct v4l2_isp_block_header header;
+	__u16 glut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 blut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 rlut[CAMSS_GAMMA_LUT_SIZE];
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_OPE_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_wb_gain)	+\
+	 sizeof(struct camss_params_chroma_enhan)	+\
+	 sizeof(struct camss_params_color_correct)	+\
+	 sizeof(struct camss_params_gamma))
+
+#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */

-- 
2.34.1

