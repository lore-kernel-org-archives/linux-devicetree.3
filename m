Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4D471CE9
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363680; cv=none; b=NzAGLK56fFXisKreulEKKGia/ms+bNygF4P8fTZ7b8qPuvTVUAAGaH9Fh9i6VUw1kOariV1N53ZN2qae+8soCyvHSl9D0NkF+MdEj4si0MyDAJkkvI4Cemo3awUgOdAvSp9WAeb1KPreVfnedEudfajG+uVG7qkjbEos4lKaPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363680; c=relaxed/simple;
	bh=jCHLyjvh3+T9dpBgJBN/rrtKwH/018pWKvdxYxje5wM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qrd8vvJdmqj47eUtqMcjq7VcPQ/I2dAkJ+0+n9iSMGGCe0AC1HHH9F28sObP7BTBf+GKXQvPEP70tpIBNmx94BnsykkOlCA9j9zzjrR+Gt49rD57U6pDiLtpLh0JYC28ygBJEHhF/XMrU5+TK92Xkwqsz3qB/XzIyywg2/Xoo4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCLJRzlS reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCLJRzlS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jUo2118869
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8sfe/XIDFZl
	aQRDiVJ5wqvQe6ukasnDP7luJc5DwaJ8=; b=TCLJRzlSNA+/2a0Z2CyUgUogFww
	QHC3TwZfCBRlOCpH/MMSWZ987yOFRnjNyw2ussmu4BWELjGW/ORsksTPExGOkD7h
	Kyk4eFULzuVVhzIdq81e8v0w9WWmQGZobBUmH45OBKuC+pNyf/RCcpo2yXHva95r
	htl+p+R9F/fLC+hSd//e578xox/5uLrDmtRBuBPXcU4qhTchPp6KyvP7FU1piOtz
	ZsaJWlVD+Lb75/eEXbXkj5eQWCIrARQlo7D/Ug0t/ctjVNuiRMRcJxjhr7kmqH0V
	v7alGJZXngVsiYGI+BJ1Oyy+awIDzD0MUDd8VYKG+4dxaSXDbmMBMnyMnVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58qy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:01:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso610068785a.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363667; x=1791968467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sfe/XIDFZlaQRDiVJ5wqvQe6ukasnDP7luJc5DwaJ8=;
        b=xgKYyEaM5WXwqBEgHt1j9MnCCoejrNzWQOiln2bYRTwdgBZN7r2y5S7DAHxD/fC9jX
         do7SQYuAdT9LwJUA5+2220EHfzFSeSVd+rZjE10ZXcUZyaRQ/1E7DtN7cn4QFMKxV9Io
         TgxtFwm1rvbIRHg64hjSFRj1dEmKLslze3YYpEsvHkX2mjihwTif+DNfljSxA0UrgqOw
         XWITfCgxPdFsF9zsM7Mkd7iWSKfSAkJ52T5nu0/XfiUwegY4huNpdHLDPQlOuUCwZwgO
         21Mh+c4Xg25IIQpju6aZD0s/Y95x5j+QjpjJMYGgu9uYJF8eD7HiPiNT/zUbN9pIBkgW
         mfBA==
X-Forwarded-Encrypted: i=1; AKwUvByIfNBbJJCp2qJ0D3fBfi0t68QtGjptfxGZ/3p16duDGBftt83qa+EoNMjcXJebLNriwxCQxnoJIxNK@vger.kernel.org
X-Gm-Message-State: AFuF++lQOQEM5ZdNp/Jel1Jold2bZ0U2C9W+EUP1eHKTaZOcj6xeOBl+
	jBahRUonKjQyG4kpaNh56s0koLxDyxMd5sEaRe7/kKQTx8XavfKdWlVsO53MkyNl+0Dj7swy56A
	4jjoUzQBVfTMYtt/w/ov95zLeB9Ge2lEKwx+3NzJCd91jJsxjeJ9u1xkok5bTKANV
X-Gm-Gg: AYBFou3JETY/VE0FDnXnWrKJ2008TS7csB6X5mOm2oIgrDncBr33m0HzYqsCEl0U3rm
	+GQYo3pzRzHWOwTGkz/l+kDJ6u1TiGaYtni/Y6lFZTe0ryKFGlA2Cn91oslcicyk6oIST9hysMo
	lF1E8LZJtMVK0mxGOwWGNCmsllZzs/kRgJ6WBN4pJKh3cHghwTVpSp6+GikPNhMHBBQDloZGxbq
	YEI1CKyl0LQjJzi4ZCQMynbQPXYhEqh5jv6ub22P19gXhtH0BCVrAd5oj4Qz5Zv7pWLdjueUWFA
	l0qJjGxI8U6492lJr8qlaogOUKp9S9KqHRhmmy4K+Bym9xuNAeKnFlHP48o=
X-Received: by 2002:a05:620a:3710:b0:93e:980a:2fff with SMTP id af79cd13be357-93e9b85670emr305917385a.83.1791363666685;
        Wed, 07 Oct 2026 02:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:93e:980a:2fff with SMTP id af79cd13be357-93e9b85670emr305911385a.83.1791363666037;
        Wed, 07 Oct 2026 02:01:06 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:05 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 05/45] media: qcom: camss: sm8250: add IFE BUS v20x
Date: Wed,  7 Oct 2026 12:00:01 +0300
Message-Id: <20261007090041.3732717-6-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5ezmAx6iXKVZ
 A8V9O2LQvI6SRJyEMU+tZ4tEfUjkPhBzakFPB9hao5jPtNnErIP1mE9yo718cgpBPJ6Imo50R1S
 +Dd6Sy7VxYVv+U+BK1/reXeIdA1AcCY=
X-Proofpoint-GUID: 3sDbMb5fdvBdtm3SxPHmd9VWN1R4rXsx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXw7OV/OdkNCVO
 +sU6IPAetHRBfibGNWfERTFzqZH9dn30GIFiuSiNTelrQ5bxzILRdRmWzTfbbRrPdr5EBwEZPaz
 L9vUY19gQtcyhA5ng1r/uijM5A3W07dB+9JNIIpIhUtK/Z1CMscQNFEhDmEDzJfg44G2/shaGIf
 0cSvSR2IkRL4wKHZIiBarvm7jy4a+4f/ygotI690qQHzMbbRx6kE2RHumA4LtWe5jV7u6S6gAwO
 IW4TdudS0ZKqionMhXAm+zY3DyLxoRfR2juYx7/AHgBlpQgm2Omo2KsDhd/oB5ISYdBTlvJ4WIN
 PHWuh5v5WAkG7mla6qbmPBmGklh/ZisL42qy6GGfMAxyfctK1+zXNMTUIVT9yCN1VS6WnFHu+ao
 F5DreAyLrnAPAhCNAfCS4/T3pr/uvj3e2yHkhE4nelKQ8z0VvgeIQ1b9M5cYRtyh878q44V+2ra
 qCwFuvHiU+j0Mqjqneg==
X-Proofpoint-ORIG-GUID: 3sDbMb5fdvBdtm3SxPHmd9VWN1R4rXsx
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60a54 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=f5t0ODRzorHQIUvYkhMA:9
 a=8DUjIpf0rZZqWCZ8:21 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE BUS write engine used by the SM8250 full and lite pixel
paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-bus-v20x.c  | 287 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   2 +
 3 files changed, 290 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-bus-v20x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index b79c40626c40..e30fe07b16f4 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -14,6 +14,7 @@ qcom-camss-objs += \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
 		camss-format.o \
+		camss-ife-bus-v20x.o \
 		camss-ispif.o \
 		camss-tpg.o \
 		camss-tpg-gen1.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-bus-v20x.c b/drivers/media/platform/qcom/camss/camss-ife-bus-v20x.c
new file mode 100644
index 000000000000..3e27494d91da
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-bus-v20x.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+
+#include "camss.h"
+#include "camss-ife.h"
+
+/* Block base offsets */
+#define BUSWR_V20X_OFFS		0xaa00
+#define BUSWR_V20X_LITE_OFFS	0x1a00
+
+/* Per-client register offset */
+#define BUSWR_V20X_CLIENT_OFFS(n)	((n) * 0x100)
+
+/* Interface interrupt and violation status bits */
+#define BUSWR_V20X_IIF_IRQ_CMD_CLEAR			BIT(0)
+#define BUSWR_V20X_OVERFLOW_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V20X_OVERFLOW_ERR(s)	\
+	((s) & BUSWR_V20X_OVERFLOW_ERR_MASK)
+#define BUSWR_V20X_VIOLATION_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V20X_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V20X_VIOLATION_ERR_MASK)
+#define BUSWR_V20X_IMG_SIZE_VIOLATION_ERR_MASK		GENMASK(25, 0)
+#define IS_BUSWR_V20X_IMG_SIZE_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V20X_IMG_SIZE_VIOLATION_ERR_MASK)
+#define BUSWR_V20X_IIF_IRQ_S0_IMG_SIZE_VIOLATION	BIT(31)
+#define IS_BUSWR_V20X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(s)	\
+	((s) & BUSWR_V20X_IIF_IRQ_S0_IMG_SIZE_VIOLATION)
+#define BUSWR_V20X_IIF_IRQ_S0_VIOLATION			BIT(30)
+#define IS_BUSWR_V20X_IIF_IRQ_S0_VIOLATION(s)	\
+	((s) & BUSWR_V20X_IIF_IRQ_S0_VIOLATION)
+
+/* Client configuration field values */
+#define BUSWR_V20X_IIF_CGC_OVERRIDE			GENMASK(25, 0)
+#define BUSWR_V20X_CLIENT_CFG_MODE			GENMASK(17, 16)
+#define BUSWR_V20X_CLIENT_CFG_AUTO_RECOVERY_EN		BIT(4)
+#define BUSWR_V20X_CLIENT_CFG_EN			BIT(0)
+#define BUSWR_V20X_CLIENT_IMG_CFG0_HEIGHT		GENMASK_U32(31, 16)
+#define BUSWR_V20X_CLIENT_IMG_CFG0_WIDTH		GENMASK_U32(15, 0)
+#define BUSWR_V20X_CLIENT_IMG_CFG2_STRIDE		GENMASK_U32(15, 0)
+#define BUSWR_V20X_CLIENT_PACKER_CFG_ALIGN		GENMASK(4, 4)
+#define BUSWR_V20X_CLIENT_PACKER_CFG_FORMAT		GENMASK(3, 0)
+#define BUSWR_V20X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD	GENMASK(4, 0)
+#define BUSWR_V20X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN	GENMASK(31, 0)
+#define BUSWR_V20X_CLIENT_FRAMEDROP_CFG0_PERIOD		GENMASK(4, 0)
+#define BUSWR_V20X_CLIENT_FRAMEDROP_CFG1_PATTERN	GENMASK(31, 0)
+
+/* Burst and FIFO limits */
+#define BUSWR_V20X_BURST_BEATS8_256			3
+#define BUSWR_V20X_CLIENT_BURST_LIMIT_CFG_MAX_LENGTH	GENMASK(1, 0)
+#define BUSWR_V20X_IMG_ADDR_FIFO_MAX_DEPTH		4
+
+/* Common BUSWR registers */
+#define BUSWR_V20X_IIF_CGC_OVERRIDE_REG		0x00000008
+#define BUSWR_V20X_IIF_IRQ_MASK_S0		0x00000018
+#define BUSWR_V20X_IIF_IRQ_MASK_S1		0x0000001c
+#define BUSWR_V20X_IIF_IRQ_CLEAR_S0		0x00000020
+#define BUSWR_V20X_IIF_IRQ_CLEAR_S1		0x00000024
+#define BUSWR_V20X_IIF_IRQ_STATUS_S0		0x00000028
+#define BUSWR_V20X_IIF_IRQ_STATUS_S1		0x0000002c
+#define BUSWR_V20X_IIF_IRQ_CMD_REG		0x00000030
+#define BUSWR_V20X_OVERFLOW_CLEAR_REG		0x00000060
+#define BUSWR_V20X_VIOLATION_STATUS_REG		0x00000064
+#define BUSWR_V20X_OVERFLOW_STATUS_REG		0x00000068
+#define BUSWR_V20X_IMG_SIZE_VIOLATION_REG	0x00000070
+
+/* Per-client BUSWR registers */
+#define BUSWR_V20X_CLIENT_CFG_REG		0x00000200
+#define BUSWR_V20X_CLIENT_ADDR_IMAGE_REG	0x00000204
+#define BUSWR_V20X_CLIENT_IMG_CFG0_REG		0x0000020c
+#define BUSWR_V20X_CLIENT_IMG_CFG2_REG		0x00000214
+#define BUSWR_V20X_CLIENT_PACKER_CFG_REG	0x00000218
+#define BUSWR_V20X_CLIENT_IRQ_SS_CFG0_REG	0x00000230
+#define BUSWR_V20X_CLIENT_IRQ_SS_CFG1_REG	0x00000234
+#define BUSWR_V20X_CLIENT_FRAMEDROP_CFG0_REG	0x00000238
+#define BUSWR_V20X_CLIENT_FRAMEDROP_CFG1_REG	0x0000023c
+#define BUSWR_V20X_CLIENT_BURST_LIMIT_REG	0x00000264
+#define BUSWR_V20X_CLIENT_ADDR_STATUS_0_REG	0x00000268
+#define BUSWR_V20X_CLIENT_ADDR_STATUS_2_REG	0x00000270
+
+static void ife_buswr_20x_acquire(struct ife_device *ife, void __iomem *base)
+{
+	struct ife_buswr_ctx *ctx = &ife->buswr_ctx;
+
+	if (ife->res->type == CAMSS_IFE_SUBDEV_TYPE_IFE_LITE)
+		ctx->base = base + BUSWR_V20X_LITE_OFFS;
+	else
+		ctx->base = base + BUSWR_V20X_OFFS;
+
+	ctx->dev = ife->camss->dev;
+}
+
+static void ife_buswr_20x_release(struct ife_buswr_ctx *ctx)
+{
+	ctx->base = NULL;
+}
+
+static void ife_buswr_20x_wm_config(struct ife_buswr_ctx *ctx, const u8 wm,
+				    const struct camss_ife_wm_config *cfg)
+{
+	void __iomem *base = ctx->base;
+	u32 rval, period = 0, pattern = 1;
+
+	writel_relaxed(BUSWR_V20X_IIF_CGC_OVERRIDE,
+		       base + BUSWR_V20X_IIF_CGC_OVERRIDE_REG);
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_CFG_MODE, cfg->mode_config);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_PACKER_CFG_FORMAT, cfg->packing_fmt) |
+	       FIELD_PREP(BUSWR_V20X_CLIENT_PACKER_CFG_ALIGN, 1);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_PACKER_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_IMG_CFG0_WIDTH, cfg->bytes) |
+	       FIELD_PREP(BUSWR_V20X_CLIENT_IMG_CFG0_HEIGHT, cfg->lines);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_IMG_CFG0_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_IMG_CFG2_STRIDE, cfg->stride);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_IMG_CFG2_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_IRQ_SS_CFG0_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_IRQ_SS_CFG1_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_FRAMEDROP_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_FRAMEDROP_CFG0_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_FRAMEDROP_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_FRAMEDROP_CFG1_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_BURST_LIMIT_CFG_MAX_LENGTH,
+			  BUSWR_V20X_BURST_BEATS8_256);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_BURST_LIMIT_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_20x_wm_enable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+	rval |= BUSWR_V20X_CLIENT_CFG_EN | BUSWR_V20X_CLIENT_CFG_AUTO_RECOVERY_EN;
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_20x_wm_disable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+	rval &= ~(BUSWR_V20X_CLIENT_CFG_EN | BUSWR_V20X_CLIENT_CFG_AUTO_RECOVERY_EN);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+}
+
+static bool ife_buswr_20x_is_fifo_full(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	u32 rval = readl_relaxed(ctx->base + BUSWR_V20X_CLIENT_OFFS(wm) +
+				 BUSWR_V20X_CLIENT_ADDR_STATUS_2_REG);
+
+	return rval >= BUSWR_V20X_IMG_ADDR_FIFO_MAX_DEPTH;
+}
+
+static void ife_buswr_20x_queue_buf(struct ife_buswr_ctx *ctx, const u8 num_wms, const u8 *wm,
+				    dma_addr_t *addr)
+{
+	int i;
+
+	for (i = 0; i < num_wms; i++) {
+		if (addr[i])
+			writel_relaxed(addr[i], ctx->base + BUSWR_V20X_CLIENT_ADDR_IMAGE_REG +
+				       BUSWR_V20X_CLIENT_OFFS(wm[i]));
+	}
+}
+
+static u32 ife_buswr_20x_consumed_addr(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	return readl_relaxed(ctx->base + BUSWR_V20X_CLIENT_ADDR_STATUS_0_REG +
+			     BUSWR_V20X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_20x_log_image_size(struct ife_buswr_ctx *ctx, u32 clients)
+{
+	unsigned int wm;
+	u32 cfg0, cfg2;
+
+	dev_dbg(ctx->dev, "BUSWR image size violation clients: %#010x\n", clients);
+
+	for (wm = 0; wm < 26; wm++) {
+		if (!(clients & BIT(wm)))
+			continue;
+
+		cfg0 = readl_relaxed(ctx->base + BUSWR_V20X_CLIENT_IMG_CFG0_REG +
+				     BUSWR_V20X_CLIENT_OFFS(wm));
+		cfg2 = readl_relaxed(ctx->base + BUSWR_V20X_CLIENT_IMG_CFG2_REG +
+				     BUSWR_V20X_CLIENT_OFFS(wm));
+
+		dev_dbg(ctx->dev, "BUSWR client %u config: width=%u height=%u stride=%u\n",
+			wm, FIELD_GET(BUSWR_V20X_CLIENT_IMG_CFG0_WIDTH, cfg0),
+			FIELD_GET(BUSWR_V20X_CLIENT_IMG_CFG0_HEIGHT, cfg0),
+			FIELD_GET(BUSWR_V20X_CLIENT_IMG_CFG2_STRIDE, cfg2));
+	}
+}
+
+static u32 ife_buswr_20x_irq_status(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 bus_stat, iif_stat = 0;
+
+	bus_stat = readl_relaxed(base + BUSWR_V20X_OVERFLOW_STATUS_REG);
+	writel_relaxed(BIT(0), base + BUSWR_V20X_OVERFLOW_CLEAR_REG);
+	if (IS_BUSWR_V20X_OVERFLOW_ERR(bus_stat)) {
+		writel_relaxed(bus_stat, base + BUSWR_V20X_OVERFLOW_CLEAR_REG);
+		pr_warn("BUSWR common overflow: 0x%x\n", bus_stat);
+	}
+
+	iif_stat = readl_relaxed(base + BUSWR_V20X_IIF_IRQ_STATUS_S1);
+	writel_relaxed(iif_stat, base + BUSWR_V20X_IIF_IRQ_CLEAR_S1);
+
+	iif_stat = readl_relaxed(base + BUSWR_V20X_IIF_IRQ_STATUS_S0);
+	writel_relaxed(iif_stat, base + BUSWR_V20X_IIF_IRQ_CLEAR_S0);
+	if (iif_stat) {
+		if (IS_BUSWR_V20X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(iif_stat)) {
+			bus_stat = readl_relaxed(base + BUSWR_V20X_IMG_SIZE_VIOLATION_REG);
+			if (IS_BUSWR_V20X_IMG_SIZE_VIOLATION_ERR(bus_stat))
+				pr_warn("BUSWR common image size violation: 0x%x\n", bus_stat);
+			ife_buswr_20x_log_image_size(ctx, bus_stat);
+			pr_warn("BUSWR image size violation from CCIF: 0x%x\n", iif_stat);
+		}
+		if (IS_BUSWR_V20X_IIF_IRQ_S0_VIOLATION(iif_stat)) {
+			bus_stat = readl_relaxed(base + BUSWR_V20X_VIOLATION_STATUS_REG);
+			if (IS_BUSWR_V20X_VIOLATION_ERR(bus_stat))
+				pr_warn("BUSWR common violation: 0x%x\n", bus_stat);
+			pr_warn("BUSWR violation from CCIF: 0x%x\n", iif_stat);
+		}
+	}
+
+	writel_relaxed(BUSWR_V20X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V20X_IIF_IRQ_CMD_REG);
+
+	return iif_stat;
+}
+
+static void ife_buswr_20x_irq_enable(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	writel_relaxed(~0, base + BUSWR_V20X_IIF_IRQ_MASK_S0);
+	writel_relaxed(~0, base + BUSWR_V20X_IIF_IRQ_MASK_S1);
+}
+
+static void ife_buswr_20x_irq_disable(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	writel_relaxed(0, base + BUSWR_V20X_IIF_IRQ_MASK_S0);
+	writel_relaxed(~0, base + BUSWR_V20X_IIF_IRQ_CLEAR_S0);
+	writel_relaxed(0, base + BUSWR_V20X_IIF_IRQ_MASK_S1);
+	writel_relaxed(~0, base + BUSWR_V20X_IIF_IRQ_CLEAR_S1);
+
+	writel_relaxed(BUSWR_V20X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V20X_IIF_IRQ_CMD_REG);
+}
+
+const struct ife_hw_buswr_ops ife_buswr_20x_ops = {
+	.acquire	= ife_buswr_20x_acquire,
+	.release	= ife_buswr_20x_release,
+	.irq_enable	= ife_buswr_20x_irq_enable,
+	.irq_disable	= ife_buswr_20x_irq_disable,
+	.wm_config	= ife_buswr_20x_wm_config,
+	.wm_enable	= ife_buswr_20x_wm_enable,
+	.wm_disable	= ife_buswr_20x_wm_disable,
+	.queue_buf	= ife_buswr_20x_queue_buf,
+	.consumed_addr	= ife_buswr_20x_consumed_addr,
+	.irq_status	= ife_buswr_20x_irq_status,
+	.is_fifo_full	= ife_buswr_20x_is_fifo_full,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 39e8cfa74909..48701cb67e1e 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -389,4 +389,6 @@ camss_ife_pipe_for_stream_id(int nstreams,
 			     const struct camss_ife_stream *streams,
 			     u32 id);
 
+extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
+
 #endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1

