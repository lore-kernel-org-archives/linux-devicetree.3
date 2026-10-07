Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FB448B37E
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363780; cv=none; b=tkoMncGrk0DD2uueU8xUIK5EitQyoimRsGc4KudhnAAm6OkoAfqbD0RtlD8J5tUN9MzagccLJU6zlJoxYsoMtdoKbwe1qbh3jM5tg4oSyGd21mP7Z5R3MTbx9oZrKE50GhEP1tg2OnZsoDn9G5jfJyWofpwfkCYRvrJqZF7Z0Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363780; c=relaxed/simple;
	bh=oiDsL/yj3Pm1VqWrT9P6YWTwtXnmGdL5L3vWdWWbgQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qk+9UdaOWSpQnH4gh3qS5s3+hqG+pz8MRoxxHgbkygYn+KlV7tVRQPbhkSl/gFq4HGRFN9zuqDV20UQ7kcWVCtpnDNhNcL9eL+cWaZA32kwP/xHIUtUXsQtEL7m/QD02DYIVos7wMdzlMo7bu4dw6PbVLnoYc+s5errPvLXzD6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EW7TMz4o reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EW7TMz4o"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnY02711451
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ozuF8iYcxkg
	jB+Uh/BZnxOQlbcmUuvFSeVklAg+6JKA=; b=EW7TMz4oL9VB79EggeadG8F9zVI
	fKgoWi6/dNVQQoBRjm1NpXqrHGYiCdFBMzWjsWN62n3mQG69ruNr5byHBP6X9hzw
	qwTnIys5WP8nWKI7jcEp3stMb1zjudZaSl+yC4gvob4WN8rD7cisDT3JY/TQM88t
	VIzplWY/I/xIQalfwt6paQ7YRmbNcJe1FLnmRcvB/QEvka/xy9GTAQ05U2l5KdC8
	hei0onSzzURfWZOt02iMlOSB+6HCpEX/9JydvP5sbRxpsUGCNes2kiS5ZB5Oq2SO
	sX44nDrLfCdQOI9XFp9zKXXh8Ycv5Zb3qd4pNKe4vpJCKwsJlDh5/qQoiSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1d76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:02:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso738949185a.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363745; x=1791968545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozuF8iYcxkgjB+Uh/BZnxOQlbcmUuvFSeVklAg+6JKA=;
        b=M57st5h/ZQ3U0ghyT1Bug8dMlO6bMC6dPBiCsaRD/C2e6s2OdhTzZhzHHFGTx2wMlp
         wngz8IJcZCxnIJ1J981vkoxWTrCP9YkaIV2I4kgstKE2ZivXAxvriYaUa6a/6QxOLtE1
         4abQa4o2UbSBNeQz8Y0CPz13+rLdjRJdJfCnpsy6+k3oDnKPHtGza04B8o0I/egCMckt
         fmQQ47ruvyU2JtNnb6FW1/pMu+1/59L9OgYC4bA31PhFSviZRnueINHnYgC+ganT00VM
         sWyZ72HExL+jcCbvhQSRsO4WEzQQtQ4s2jsjawfiBwIX6ftkwInr2lzZ7M9xB5jQXOIX
         XDbA==
X-Forwarded-Encrypted: i=1; AKwUvBwhjCM4+J6X20erL57bJw5Ls1v2TnwjXktgqfh5nnqC9o8Pyv+vidRC1RxV6i9B/CZBKpZFbqlU3w7W@vger.kernel.org
X-Gm-Message-State: AFuF++mKyRFtM/JdfhxWTf1idLrhczw1Fvkh9NVwCqbCrorxcHzvVk63
	oxPPBNe2taS4mTpdLWG9jz5e0t/bHL0lqvpBB/LTlP2HVn1S16OGTbCmlHh3u3teZKXTUpZ5Wy1
	m/R6/Aff3vouPxnLU6hbFwlaRXEW/HiuPUJnt2CyG7DIVPGkMUPuF8KLt/bUt+tlm
X-Gm-Gg: AYBFou0+9o+16NxeIG2javmhiE9lY6ZTs6JqpOo1ZW1VPMU9rX+VmT1+Bvc7Q/9Weo7
	0S0mHxWTR515dTfTpOxx9d59kOMhcgakCTD9EgOldpqT7gnzNXufEfBbe4p51HNbWKrZnoFMuUW
	QKU3mLPjFnsKSVHCwZRRBFXyGfQssasCtMDkQP7mJIBfCk39zkWeuKuOvOHTKZfpZj2g2Fo8rya
	VX8iOUxCBsVRtJ1ctBlWojeAb4ZxOyzBhfM74FeIIkSMb2EByfc6oEuYssh6V8MQbN1YeEgYrLm
	Htv8yk5y0Rq/gBY2Zxu7Ycp6RBNJmzZzvU8DJRDKWmrZxsfeBfClUCtrLiE=
X-Received: by 2002:a05:620a:1789:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93e860958a4mr1053877885a.24.1791363745096;
        Wed, 07 Oct 2026 02:02:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1789:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93e860958a4mr1053873085a.24.1791363744483;
        Wed, 07 Oct 2026 02:02:24 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:23 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 28/45] media: qcom: camss: sa8775p: add IFE top v4.1x
Date: Wed,  7 Oct 2026 12:00:24 +0300
Message-Id: <20261007090041.3732717-29-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IUm8Pk5mPyxkFiRnNVgJ3Ngu3aK2L17b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0pdlZsPy4HIG
 M2UMhw9sxK636SfBBt/TEiITYBTkcZJsWz6+NWrKyq94psEvvAoM2Qceoz2V60XzgLAYARS8MCq
 PPMzNzSoLgcHbnGQpgroy4MyOVC9l/9AlJghxF2MlMtsu4gzMl6OazsojRdHruYDK1JcGYexFKt
 PGgfqC2AE69LAUXaf4MvYjUy6vaUmCf7RQOIivRySFQwPY0LqjX3btmZitB/n9HGKPHOS+PqJQZ
 QBC2Tgkzn6iY7KqT1HoLZumk05tN7THB2QIiQP8hHzY0iuBiCilkito2SsRwQxrHEh3NeRAj9Dc
 EGTlSgbAAQaL87qrBNE/Y3FAvfjLvqxY1WbMSYkVzM8mtDgPleHw2CKoOU+NLS9HP6V+uH1bJls
 5jRHmF7HZGmpsPuawjSVDYOj8Wg4CU8/YuLJ9j/nW6YarJe0MpVMivDSX5HETaROb/2yGAODr7Y
 1F0i6EnQjUNEVhtzHIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/PhuW0CrhPIf
 92xJHNuTLJgStna6/NBVpMunzpRUeIP3ciKo/APFcAq7Uok8LLQ3oJH6V0nxRtLfKknzry5jSAx
 1bnAER/8C1cZ8LQBckArXzoUrcsGVpo=
X-Proofpoint-GUID: IUm8Pk5mPyxkFiRnNVgJ3Ngu3aK2L17b
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac60aa2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=PO59o82kRZ5UAxUAygYA:9
 a=-_4PPS_gdBzYQfpF:21 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE top v4.1x engine used by the SA8775P full pixel path.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-top-v41x.c  | 384 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 386 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-top-v41x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index e28b7477dab1..479ab17f3bdb 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -24,6 +24,7 @@ qcom-camss-objs += \
 		camss-ife-scale-v10x.o \
 		camss-ife-scale-v23x.o \
 		camss-ife-top-v20x.o \
+		camss-ife-top-v41x.o \
 		camss-ife-pads.o \
 		camss-ispif.o \
 		camss-tpg.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-top-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-top-v41x.c
new file mode 100644
index 000000000000..b600dd009268
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-top-v41x.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Qualcomm Technologies, Inc.
+ */
+
+#include "camss-ife.h"
+#include "camss-ife-scale-v23x.h"
+#include "camss.h"
+
+#define IFE_V41X_TOP_OFFS		0x0000
+
+/* DS M/N scaler module base offsets from IFE TOP base */
+#define IFE_V41X_VID_DS_MN_Y_OFFSET	0x7f80
+#define IFE_V41X_DISP_DS_MN_Y_OFFSET	0x6780
+#define IFE_V41X_VID_DS_MN_C_OFFSET	0x8700
+#define IFE_V41X_DISP_DS_MN_C_OFFSET	0x6a00
+#define IFE_V41X_DISP_POST_MN_Y_OFFSET	0x6c80
+#define IFE_V41X_DISP_POST_MN_C_OFFSET	0x6e00
+
+#define IFE_V41X_MOD_VER_GEN		GENMASK(31, 28)
+#define IFE_V41X_MOD_VER_REV		GENMASK(27, 16)
+#define IFE_V41X_MOD_VER_STEP		GENMASK(15, 0)
+#define IFE_V41X_MOD_GEN(val)		FIELD_GET(IFE_V41X_MOD_VER_GEN, val)
+#define IFE_V41X_MOD_REV(val)		FIELD_GET(IFE_V41X_MOD_VER_REV, val)
+#define IFE_V41X_MOD_STEP(val)		FIELD_GET(IFE_V41X_MOD_VER_STEP, val)
+
+/* CSID-level reset and register-update (via csid_base) */
+#define IFE_V41X_CSID_RST_CMD		0x00000010
+#define IFE_V41X_CSID_RST_CMD_SW_RST	BIT(0)
+#define IFE_V41X_CSID_RUP_AUP_CMD	0x00000018
+#define IFE_V41X_CSID_RUP_IPP0		BIT(0)
+#define IFE_V41X_CSID_RUP_RDI0		BIT(4)
+#define IFE_V41X_CSID_RUP_RDI1		BIT(5)
+#define IFE_V41X_CSID_RUP_RDI2		BIT(6)
+#define IFE_V41X_CSID_AUP_IPP0		BIT(16)
+#define IFE_V41X_CSID_AUP_RDI0		BIT(20)
+#define IFE_V41X_CSID_AUP_RDI1		BIT(21)
+#define IFE_V41X_CSID_AUP_RDI2		BIT(22)
+
+/* TOP functional IRQ registers */
+#define IFE_V41X_FUNC_IRQ_CMD		0x000000a4
+#define IFE_V41X_FUNC_IRQ_CMD_CLEAR	BIT(0)
+#define IFE_V41X_FUNC_IRQ_MASK_0	0x000000a8
+#define IFE_V41X_FUNC_IRQ_MASK_1	0x000000ac
+#define IFE_V41X_FUNC_IRQ_CLEAR_0	0x000000b0
+#define IFE_V41X_FUNC_IRQ_CLEAR_1	0x000000b4
+#define IFE_V41X_FUNC_IRQ_STATUS_0	0x000000b8
+#define IFE_V41X_FUNC_IRQ_STATUS_1	0x000000bc
+
+/* IRQ_STATUS_0 bits */
+#define IFE_V41X_IRQ0_DIAG_VIOLATION		BIT(15)
+#define IFE_V41X_IRQ0_DSP_ERROR_VIOLATION	BIT(14)
+#define IFE_V41X_IRQ0_DSP_RX_FIFO_OVERFLOW	BIT(13)
+#define IFE_V41X_IRQ0_DSP_TX_FIFO_OVERFLOW	BIT(12)
+#define IFE_V41X_IRQ0_PIXEL_PIPE_VIOLATION	BIT(4)
+#define IFE_V41X_IRQ0_BUSWR			BIT(0)
+#define IFE_V41X_IRQ0_ERRORS_MASK \
+	(IFE_V41X_IRQ0_DIAG_VIOLATION		| \
+	 IFE_V41X_IRQ0_DSP_ERROR_VIOLATION	| \
+	 IFE_V41X_IRQ0_DSP_RX_FIFO_OVERFLOW	| \
+	 IFE_V41X_IRQ0_DSP_TX_FIFO_OVERFLOW	| \
+	 IFE_V41X_IRQ0_PIXEL_PIPE_VIOLATION)
+
+/* IRQ_STATUS_1 bits */
+#define IFE_V41X_IRQ1_PIXEL_PIPE_EPOCH1	BIT(17)
+#define IFE_V41X_IRQ1_PIXEL_PIPE_EPOCH0	BIT(16)
+#define IFE_V41X_IRQ1_RDI2_EOF			BIT(13)
+#define IFE_V41X_IRQ1_RDI2_SOF			BIT(12)
+#define IFE_V41X_IRQ1_RDI1_EOF			BIT(11)
+#define IFE_V41X_IRQ1_RDI1_SOF			BIT(10)
+#define IFE_V41X_IRQ1_RDI0_EOF			BIT(9)
+#define IFE_V41X_IRQ1_RDI0_SOF			BIT(8)
+#define IFE_V41X_IRQ1_PIXEL_PIPE_EOF		BIT(1)
+#define IFE_V41X_IRQ1_PIXEL_PIPE_SOF		BIT(0)
+#define IFE_V41X_IRQ1_RDI0 \
+	(IFE_V41X_IRQ1_RDI0_SOF | IFE_V41X_IRQ1_RDI0_EOF)
+#define IFE_V41X_IRQ1_RDI1 \
+	(IFE_V41X_IRQ1_RDI1_SOF | IFE_V41X_IRQ1_RDI1_EOF)
+#define IFE_V41X_IRQ1_RDI2 \
+	(IFE_V41X_IRQ1_RDI2_SOF | IFE_V41X_IRQ1_RDI2_EOF)
+#define IFE_V41X_IRQ1_PP \
+	(IFE_V41X_IRQ1_PIXEL_PIPE_SOF		| \
+	 IFE_V41X_IRQ1_PIXEL_PIPE_EOF		| \
+	 IFE_V41X_IRQ1_PIXEL_PIPE_EPOCH0	| \
+	 IFE_V41X_IRQ1_PIXEL_PIPE_EPOCH1)
+
+/* WM indices for PP output paths */
+#define IFE_V41X_PP_VID_Y_WM		0
+#define IFE_V41X_PP_VID_C_WM		1
+#define IFE_V41X_PP_DISP_Y_WM		3
+#define IFE_V41X_PP_DISP_C_WM		4
+
+#define IFE_V41X_HW_VERSION		0x00000000
+
+#define IFE_V41X_CORE_CFG_0				0x00000024
+#define IFE_V41X_CORE_CFG_0_VID_OUT_OUTPUT_PACKER_EN	BIT(10)
+#define IFE_V41X_CORE_CFG_0_DISP_DS4_R2PD_DISABLE	BIT(21)
+#define IFE_V41X_CORE_CFG_0_DISP_DS16_R2PD_DISABLE	BIT(22)
+
+static int ife_top_v41x_acquire(struct ife_device *ife, void __iomem *base,
+				void __iomem *csid_base)
+{
+	struct ife_top_ctx *ctx = &ife->top_ctx;
+
+	if (!csid_base)
+		return -EINVAL;
+
+	ctx->base	= base + IFE_V41X_TOP_OFFS;
+	ctx->csid_base	= csid_base;
+	ctx->dev	= ife->camss->dev;
+
+	return 0;
+}
+
+static void ife_top_v41x_release(struct ife_top_ctx *ctx)
+{
+	ctx->base      = NULL;
+	ctx->csid_base = NULL;
+}
+
+static u32 ife_top_v41x_version(struct ife_top_ctx *ctx)
+{
+	struct camss_hw_version hw_ver;
+	u32 reg = readl_relaxed(ctx->base + IFE_V41X_HW_VERSION);
+
+	hw_ver.ids.major = IFE_V41X_MOD_GEN(reg);
+	hw_ver.ids.minor = IFE_V41X_MOD_REV(reg);
+	hw_ver.ids.steps = IFE_V41X_MOD_STEP(reg);
+
+	return hw_ver.hw_version;
+}
+
+static void ife_top_v41x_reset(struct ife_top_ctx *ctx)
+{
+	void __iomem *top = ctx->base;
+	void __iomem *csid = ctx->csid_base;
+
+	writel_relaxed(~0, top + IFE_V41X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(~0, top + IFE_V41X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_V41X_FUNC_IRQ_CMD_CLEAR, top + IFE_V41X_FUNC_IRQ_CMD);
+	writel_relaxed(IFE_V41X_CSID_RST_CMD_SW_RST, csid + IFE_V41X_CSID_RST_CMD);
+}
+
+static void ife_top_v41x_reg_update(struct ife_top_ctx *ctx,
+				    const struct ife_pad_desc *dsc)
+{
+	void __iomem *csid = ctx->csid_base;
+	u32 rval;
+
+	switch (dsc->hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_PP:
+		rval = IFE_V41X_CSID_RUP_IPP0 | IFE_V41X_CSID_AUP_IPP0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval = IFE_V41X_CSID_RUP_RDI0 | IFE_V41X_CSID_AUP_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval = IFE_V41X_CSID_RUP_RDI1 | IFE_V41X_CSID_AUP_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval = IFE_V41X_CSID_RUP_RDI2 | IFE_V41X_CSID_AUP_RDI2;
+		break;
+	default:
+		dev_warn(ctx->dev, "Invalid RUP pipe: 0x%x\n", dsc->hw_pipe);
+		return;
+	}
+
+	writel_relaxed(rval, csid + IFE_V41X_CSID_RUP_AUP_CMD);
+}
+
+static int ife_top_v41x_pipe_config(struct ife_top_ctx *ctx,
+				    const struct ife_pad_desc *desc,
+				    const struct camss_ife_pipeline_cfg *pipeline_cfg,
+				    const struct camss_ife_wm_config *wm_cfg)
+{
+	enum camss_ife_hw_pipe hw_pipe = desc->hw_pipe;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+	case CAMSS_IFE_HW_PIPE_RDI1:
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		break;
+	case CAMSS_IFE_HW_PIPE_PP:
+		if (wm_cfg[Y_PLANE].wm_id == IFE_V41X_PP_VID_Y_WM &&
+		    wm_cfg[C_PLANE].wm_id == IFE_V41X_PP_VID_C_WM) {
+			camif_v23x_scale_config(ctx->base + IFE_V41X_VID_DS_MN_Y_OFFSET,
+						pipeline_cfg, &wm_cfg[Y_PLANE]);
+			camif_v23x_scale_config(ctx->base + IFE_V41X_VID_DS_MN_C_OFFSET,
+						pipeline_cfg, &wm_cfg[C_PLANE]);
+		}
+
+		if (wm_cfg[Y_PLANE].wm_id == IFE_V41X_PP_DISP_Y_WM &&
+		    wm_cfg[C_PLANE].wm_id == IFE_V41X_PP_DISP_C_WM) {
+			camif_v23x_scale_config(ctx->base + IFE_V41X_DISP_DS_MN_Y_OFFSET,
+						pipeline_cfg, &wm_cfg[Y_PLANE]);
+			camif_v23x_scale_config(ctx->base + IFE_V41X_DISP_DS_MN_C_OFFSET,
+						pipeline_cfg, &wm_cfg[C_PLANE]);
+			camif_v23x_post_mn_config(ctx->base + IFE_V41X_DISP_POST_MN_Y_OFFSET,
+						  &wm_cfg[Y_PLANE], false);
+			camif_v23x_post_mn_config(ctx->base + IFE_V41X_DISP_POST_MN_C_OFFSET,
+						  &wm_cfg[C_PLANE], true);
+		}
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid HW pipeline identifier: 0x%x\n", hw_pipe);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ife_top_v41x_pipe_enable(struct ife_top_ctx *ctx,
+				    const struct ife_pad_desc *desc)
+{
+	enum camss_ife_hw_pipe hw_pipe = desc->hw_pipe;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+	case CAMSS_IFE_HW_PIPE_RDI1:
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		break;
+	case CAMSS_IFE_HW_PIPE_PP:
+		camif_v23x_scale_enable(ctx->base + IFE_V41X_VID_DS_MN_Y_OFFSET);
+		camif_v23x_scale_enable(ctx->base + IFE_V41X_VID_DS_MN_C_OFFSET);
+		writel_relaxed(IFE_V41X_CORE_CFG_0_VID_OUT_OUTPUT_PACKER_EN |
+			       IFE_V41X_CORE_CFG_0_DISP_DS4_R2PD_DISABLE |
+			       IFE_V41X_CORE_CFG_0_DISP_DS16_R2PD_DISABLE,
+			       ctx->base + IFE_V41X_CORE_CFG_0);
+		camif_v23x_scale_enable(ctx->base + IFE_V41X_DISP_DS_MN_Y_OFFSET);
+		camif_v23x_scale_enable(ctx->base + IFE_V41X_DISP_DS_MN_C_OFFSET);
+		camif_v23x_post_mn_enable(ctx->base + IFE_V41X_DISP_POST_MN_Y_OFFSET);
+		camif_v23x_post_mn_enable(ctx->base + IFE_V41X_DISP_POST_MN_C_OFFSET);
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid HW pipeline identifier: 0x%x\n", hw_pipe);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ife_top_v41x_pipe_disable(struct ife_top_ctx *ctx,
+				     const struct ife_pad_desc *desc)
+{
+	enum camss_ife_hw_pipe hw_pipe = desc->hw_pipe;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+	case CAMSS_IFE_HW_PIPE_RDI1:
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		break;
+	case CAMSS_IFE_HW_PIPE_PP:
+		camif_v23x_scale_disable(ctx->base + IFE_V41X_VID_DS_MN_Y_OFFSET);
+		camif_v23x_scale_disable(ctx->base + IFE_V41X_VID_DS_MN_C_OFFSET);
+		writel_relaxed(0, ctx->base + IFE_V41X_CORE_CFG_0);
+		camif_v23x_scale_disable(ctx->base + IFE_V41X_DISP_DS_MN_Y_OFFSET);
+		camif_v23x_scale_disable(ctx->base + IFE_V41X_DISP_DS_MN_C_OFFSET);
+		camif_v23x_post_mn_disable(ctx->base + IFE_V41X_DISP_POST_MN_Y_OFFSET);
+		camif_v23x_post_mn_disable(ctx->base + IFE_V41X_DISP_POST_MN_C_OFFSET);
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid HW pipeline identifier: 0x%x\n", hw_pipe);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void ife_top_v41x_prepare(struct ife_top_ctx *ctx)
+{
+	void __iomem *top = ctx->base;
+	u32 rval;
+
+	writel_relaxed(~0, top + IFE_V41X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(~0, top + IFE_V41X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_V41X_FUNC_IRQ_CMD_CLEAR, top + IFE_V41X_FUNC_IRQ_CMD);
+
+	rval = IFE_V41X_IRQ0_BUSWR | IFE_V41X_IRQ0_ERRORS_MASK;
+	writel_relaxed(rval, top + IFE_V41X_FUNC_IRQ_MASK_0);
+}
+
+static void ife_top_v41x_enable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *top = ctx->base;
+	u32 rval = readl_relaxed(top + IFE_V41X_FUNC_IRQ_MASK_1);
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_PP:
+		rval |= IFE_V41X_IRQ1_PP;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval |= IFE_V41X_IRQ1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval |= IFE_V41X_IRQ1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval |= IFE_V41X_IRQ1_RDI2;
+		break;
+	default:
+		return;
+	}
+
+	writel_relaxed(rval, top + IFE_V41X_FUNC_IRQ_MASK_1);
+}
+
+static void ife_top_v41x_disable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *top = ctx->base;
+	u32 rval = readl_relaxed(top + IFE_V41X_FUNC_IRQ_MASK_1);
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_PP:
+		rval &= ~IFE_V41X_IRQ1_PP;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval &= ~IFE_V41X_IRQ1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval &= ~IFE_V41X_IRQ1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval &= ~IFE_V41X_IRQ1_RDI2;
+		break;
+	default:
+		return;
+	}
+
+	writel_relaxed(rval, top + IFE_V41X_FUNC_IRQ_MASK_1);
+}
+
+static void ife_top_v41x_irq_status(struct ife_top_ctx *ctx, u32 isr_stat[IFE_TOP_STATUS_MAX])
+{
+	void __iomem *top = ctx->base;
+	u32 stat0;
+	u32 stat1;
+
+	stat0 = readl_relaxed(top + IFE_V41X_FUNC_IRQ_STATUS_0);
+	stat1 = readl_relaxed(top + IFE_V41X_FUNC_IRQ_STATUS_1);
+
+	writel_relaxed(stat0, top + IFE_V41X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(stat1, top + IFE_V41X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_V41X_FUNC_IRQ_CMD_CLEAR, top + IFE_V41X_FUNC_IRQ_CMD);
+
+	isr_stat[IFE_TOP_STATUS_ID0] = 0;
+	isr_stat[IFE_TOP_STATUS_ID1] = 0;
+	isr_stat[IFE_TOP_STATUS_ID2] = stat0 & IFE_V41X_IRQ0_ERRORS_MASK;
+
+	if (stat0 & IFE_V41X_IRQ0_BUSWR)
+		isr_stat[IFE_TOP_STATUS_ID0] |= IFE_HW_TOP_IRQ0_BUSWR;
+
+	if (stat1 & IFE_V41X_IRQ1_RDI0_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI0_SOF;
+
+	if (stat1 & IFE_V41X_IRQ1_RDI1_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI1_SOF;
+
+	if (stat1 & IFE_V41X_IRQ1_RDI2_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI2_SOF;
+
+	if (stat1 & IFE_V41X_IRQ1_PIXEL_PIPE_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_PP_SOF;
+
+	if (stat1 & IFE_V41X_IRQ1_PIXEL_PIPE_EPOCH0)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_PP_EPOCH0;
+
+	if (stat1 & IFE_V41X_IRQ1_PIXEL_PIPE_EPOCH1)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_PP_EPOCH1;
+}
+
+const struct ife_hw_top_ops ife_top_v41x_ops = {
+	.acquire	= ife_top_v41x_acquire,
+	.release	= ife_top_v41x_release,
+	.version	= ife_top_v41x_version,
+	.prepare	= ife_top_v41x_prepare,
+	.enable		= ife_top_v41x_enable,
+	.disable	= ife_top_v41x_disable,
+	.pipe_config	= ife_top_v41x_pipe_config,
+	.pipe_enable	= ife_top_v41x_pipe_enable,
+	.pipe_disable	= ife_top_v41x_pipe_disable,
+	.reg_update	= ife_top_v41x_reg_update,
+	.reset		= ife_top_v41x_reset,
+	.irq_status	= ife_top_v41x_irq_status,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index efbb1e75d550..31d9c83767a5 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -396,6 +396,7 @@ camss_ife_pipe_for_stream_id(int nstreams,
 
 extern const struct ife_pads_descriptors ife_pads_v20x;
 extern const struct ife_hw_top_ops ife_top_20x_ops;
+extern const struct ife_hw_top_ops ife_top_v41x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_31x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
-- 
2.34.1

