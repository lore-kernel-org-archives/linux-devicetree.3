Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736361;
	b=QtY9fzEES0m1LiiR4lXNUNjIa/vqijl0EV9DyWr2qWwsX9nWDDrcM9ysFIp2zdSuGWUi
	 VRZIYja1aadmqWQD4Q/OuxdovIgk05XB4ICiFzV5BalSZ3+My4cO5nwiH9S3hWvXBftCg
	 1x0x3ZZPtdmd27EfIidInkVAjMt1kM9lH8TMgeHxM8hIyPDWjnXHC23D4OHMagVvJ0dJf
	 0KDXlEvrrXr8kRl8PvkA9LWq1VC5/Jy5GiZG6yv9RERiwRbYke4cDshem/g2I6AxzpyWg
	 swU4rhJndhCcjhAJdAYXeZ9N89VNmaznodaqgfq4YdvQbSAYIH3OEK1n2PBrmRH+f7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EXU023RtjmmS9ov+L1f+Bq0MztJ3nGlHC0RmWtYt/nw=;
	b=JdX83GEM7HYw7BMo7ovp4W2P0lN0SSdDPyIY0vHAdBX38cBqrHC5P2GYvWdPpNS2W5ri
	 12ohi0oPmtTtnskhDDDat+NANiGiKagXDqZ6GcLpEJA4fN4MsXR0QWl9EDfqjTik8V9Vx
	 ok6BnrZsNqJ89cVZ1V6mc6mkqH2b1RNkaLM5fdDpUM190QpcP/yzGp80R0fXxC2Dt5txX
	 awYbLzJOSxWdI+m8KU3aVZOSs1rgI75piAUKk+ol2mksureRX2D3CwFH9Ant0ewAVtUJk
	 tKhPNv+y6iSbNwihoWg0HBO5uX+scq0igyayvQwVc1z5TPqhWugZfAlgZLdZjshqZgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSzanUVL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8zD8Ijh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE794606A33F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE794606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSzanUVL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8zD8Ijh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Ip7Kk3673100
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 20:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXU023RtjmmS9ov+L1f+Bq0MztJ3nGlHC0RmWtYt/nw=; b=MSzanUVLZesrDiRG
	ppvI7FYUiSvPoiUlZRpUr8EbbDkgvBIc+T/bajmYAuRVv5DtRAyuJCmnWvASsWOY
	1TbCPzMz2Mnd/4h6bRQMt4ehju9VRoOO8NkFb6Z+7OWcu4eMK82UkJFoU/abKSn+
	wa6u7F60PpOwV5LWdCNO1moPgegm5MxZqTgpNsA9siKdC2RmbuMebP4jmcOo7zZl
	PurCr/St2EuqdpHlVsG9HrN2vsMdW3THTzbmxj3CAM/X5GaakNoRMiaAd9NLdWQn
	QSRw36bI3jUFpgfMxl1smfr0V07el9/EcNBXYCAClLOTwQnKw8T+CFikaA0+Llw3
	0tcaeQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ng998-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:06:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc175cb172so3936013137.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736359; x=1794341159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXU023RtjmmS9ov+L1f+Bq0MztJ3nGlHC0RmWtYt/nw=;
        b=S8zD8Ijh1KPRaksuDtJFP1f/v4CWheCEm2+ZuQ9ZKzQpllLkgaRob2Dep+LgFFYyis
         UxLhwCVzkyHqXxn5DeeLcReuULnARQdaAdxV6GyBpJB8CMIXTRIj6cLH2NPBP726k6GH
         6jRNczOVCe8rcE+2WdfkNQp0a8KdtzLU2sMzE7Sutv+pc+rhmobrYaHXbkOZ6AV477Ln
         aW4UQtxCHVZFqLuYZli6tlECtcs3FxGoXfompmBEFkPAM6dVE4g5pMsCTlxmzwBYymS1
         f6bNbVX77ddvpDsp6UxjzzKlIQShdh47VpLQ6jJDPv/YV6UPhmMxrD4/1FJ2mLzsMydx
         Ygsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736359; x=1794341159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXU023RtjmmS9ov+L1f+Bq0MztJ3nGlHC0RmWtYt/nw=;
        b=IVZEV4BMcTXJjTng62LcAkaHZTdHJ0Xt6jtDadbLZglInvAhwgaJt8NRxJ9g1V/JOz
         6Ir12zonkbL3hV3UryIPs+3t9J4wEqy83en4z+5sctHUddnT/3KC0ltV/V7LiYiN3x+n
         DCQTtoialo0bGpo/X2RexDfmIx8utHgR8OAq5KjNumjzwYvt8Wpm+Z8vFQT8RsV5J+D+
         HpegBWLFoek4svSJS2RW/JGMErZ1+Rsa6aviKLoRHf9XvqY3wfoAb2Up6E2F5SdNvHUx
         vvIr91Q0tBxxKmQXhyJT8U2+Rgdx2o40MIRjxNNItEfe2xsRi4qJ7CFPwkSRCl2z/SvY
         y3kA==
X-Forwarded-Encrypted: i=1; AKwUvBxqW7hnMHPaHYS/Vou3NHGZvHpwS8vNaPquw1gD9lvHgBJjr8Ffs7DHertPxoOd5xiXkkaZSUooWuvC@vger.kernel.org
X-Gm-Message-State: APuU4Z8NcZDuh1zcm1gTBpdoFF+6Dkm4ePNYPf71J3NlIo9pCkrV+lpG
	NzcJ6kZYv2HFb3QYeckQWgH2PNx5G1mK4mdp2ryuTrxGzp7teqY8lu7s69+zvv7Aa6wyDz2CElt
	OgctL9NdBs5JJbCCqYTyGNQOZz6mLu+JZOcRWDTK+3xyV4KsS5DJJ5r7GB5Dvrx8a
X-Gm-Gg: AYBFou2fL/MaSZkh0MZupZGFsfOFZbF2gQa8pwHJKrcK41HItSIXUqy0YsmYRQhp1mm
	oRzarussPFpVAJLVpJnHVKbgr4utckhmngB+xNdrHz1laYTn67YNxNTVrxrzNbqkRZi4AHLmLcf
	UUk7ZJL4V8PkyydNqstqboOVAJeYNNd49rXQ3qtOshIEF828znw7nPuaH08jiErgnJbPknZtvQQ
	mSX3r5YoZ7Y8mX2qXPS4dHWiBXvK8KCP7YcxEib0AwR1xoYUFIcfhcYvZKgat97cIvdtFKZVglK
	Ak+POjBHEU9Cpp68FK/sXRu5ImUXy+05J9pNJ9LdI2/q6fYju09/wgDRE571LhpSoAAlchHWhaf
	E1tugTCYzYN3p+rsKFWq7I1NApi0cdj0byKVHKlJtRSH7QGtes5vedSQp7ye603i5sFmCHLVYoZ
	0SUGR2mNbewerO9h1v+QovUb2/SdEEaSjC3W3jjdwg1xiJKAlvCXselAaNwwr/XRbvygFFgIKOe
	RVU2ql/mT19UlEDYg5jFml01xLv
X-Received: by 2002:a05:6102:5126:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7d0726cbc51mr6026354137.23.1793736358943;
        Tue, 03 Nov 2026 12:05:58 -0800 (PST)
X-Received: by 2002:a05:6102:5126:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7d0726cbc51mr6026338137.23.1793736358435;
        Tue, 03 Nov 2026 12:05:58 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:57 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:48 +0100
Subject: [PATCH v13 4/9] media: uapi: Add CAMSS ISP configuration
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
Message-Id: <20261103-camss-isp-ope-v13-4-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX0ZzGxkTYe/1W
 wel8S/JYAQSPNnmmh/Vt2mxueJPr5CnlwHhZ1GRUuCvBMMch8R054Mfp+lRti2BG3qVrnEiJMIl
 VCAlLf3QhZ0O6kCB221buwYF6VN1KVwqu+rllW77CPydMTWhk5Dz06esVQncQ356hZ9UJpqEZvS
 bjHpLepgmWBah+mpGyCGfHYYIBaYeFiS2WcDWimOBYWLcLubPR8FNgSQ6rkEoClXyuVLMnw4Mfw
 m42ft2NWXgtiET9P+mMHlzDeBFaHEkXoTIheCuEBK3x+QAIs+UR9qrP3l4qs6riXlpQtcPF+fLr
 K4d39B6ZeYkSlEnreKc8PNww+sUCzZxiV/vdHOJ9FP7F7AR//K4RjeMjIYFtweO2K+kGymTXi0l
 8gNrvbfzh2/Cz9JtYOQw3GJfk3H7MuU56y1yu3AadeGV5MO2SP8XmFVfKjtIm5SF5GYcDasINdc
 CRNy8TWwxveynBCxvzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX/dz4ch2zdebe
 i5FeMbpQHwcsH3vBdaZ5mKxHwgH6L2WvKZgLAlFvanG6m/jQGuRF1Hs5ZzV4MFDRQ+y2PtXEpI5
 bI37DnOb/N/1OouS/4eGypDWahZOnV0=
X-Proofpoint-GUID: 6QlOJoqsCoL5wa4KeHPIf8zUziWGEC5F
X-Proofpoint-ORIG-GUID: 6QlOJoqsCoL5wa4KeHPIf8zUziWGEC5F
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea3ea8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cBt3T3tByBXynNCq78MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

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
 include/uapi/linux/qcom-camss-config.h | 217 +++++++++++++++++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..543c1682f8aed3b07d7085f54a24eb632ea190a8
--- /dev/null
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -0,0 +1,217 @@
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
+ * sequential operations per channel::
+ *
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
+ * RGB2Y - Luma (Y) coefficients::
+ *
+ *   Y = v0 * R + v1 * G + v2 * B
+ *
+ * RGB2Cb - Chroma (Cb) coefficients::
+ *
+ *   Cb = a x ((B - G) + b(R - G)) + KCb
+ *   with:
+ *     a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
+ *     b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
+ *
+ * RGB2Cr - Chroma (Cr) coefficients::
+ *
+ *   Cr = c x ((R - G) + d(B - G)) + KCr
+ *   with:
+ *     c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
+ *     d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
+ *
+ * @header:   generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ * @luma_v0:  R-to-Y coefficient (12sQ8)
+ * @luma_v1:  G-to-Y coefficient (12sQ8)
+ * @luma_v2:  B-to-Y coefficient (12sQ8)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ * @coeff_ap: Cb positive coefficient (12sQ8)
+ * @coeff_am: Cb negative coefficient (12sQ8)
+ * @coeff_bp: Cb positive coefficient (12sQ8)
+ * @coeff_bm: Cb negative coefficient (12sQ8)
+ * @coeff_cp: Cr positive coefficient (12sQ8)
+ * @coeff_cm: Cr negative coefficient (12sQ8)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcb:      Cb output offset        (11s)
+ * @kcr:      Cr output offset        (11s)
+ * @_pad:     padding for 64-bit alignment, must be zero
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
+ * Implements the CLC_CC pipeline module.  The matrix computes::
+ *
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * The @qfactor member selects the fixed-point format of all coefficients::
+ *
+ *   0 = 12sQ7  (range ~-16.0 .. +15.992)
+ *   1 = 12sQ8  (range  ~-8.0 ..  +7.996)
+ *   2 = 12sQ9  (range  ~-4.0 ..  +3.998)
+ *   3 = 12sQ10 (range  ~-2.0 ..  +1.999)
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_COLOR_CORRECT
+ * @a:       G-input coefficients per output channel (12s;
+ *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
+ * @b:       B-input coefficients (12s)
+ * @c:       R-input coefficients (12s)
+ * @k:       per-output-channel offsets (typically 9s effective)
+ * @qfactor: Q-format selector (2u), see above
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
+ * gamma; different curves per channel additionally shift colour balance)::
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

