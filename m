Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD965472F6A
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363688; cv=none; b=ciQcFvbh2OBRTL3O1/am/xug6M6TkhqQffophP1nLu1BmjhhwKP3+rtuOtn352RJuYJTKl7qwfIsnFV7tbvD3DCHyYzxfuF14ZfEpzZOwIfY8QksG90cc/jwQ6Hhhmg+iaGQTYRsXACxswuSIoneSZAM1Nz0XYxhzifA22gGNi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363688; c=relaxed/simple;
	bh=WGgtkWXk/4OTyIrCdnNYpcbvJuJSEwslMqxmHE6lnuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EHaShyUJsUKtPuUmxXd81p1nsW/x6374UZJEBxNe22UZK2EZTNaSggaI+D9p4glTzxtXkJ3FAJ4QnHWpjggT4noDp4GUCBxyZuhso/6Q0w48xuAbvf2dGS7mX/4pBeGVhpU33q1GV9193KOHrqVXTrvi5MASgBLkEK2dr6pWyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgMReqNd reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgMReqNd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jtIZ2312965
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zQtfPnn1PTG
	pnbnSjBfizU0bftFTFsUaBnQIlBDG8yE=; b=LgMReqNdEcLsslVab2h78FsNmjb
	BcinyXxzrGI3qpy/EIsNulJUTc8ArBb/2LNdPkKSoGDfO/3CwTC08cd/5LbiOMcx
	S8N0GmFR8tJsJPIyz4zNSYlE1l5YdpLFrOxy9bupvhpmSOI7PEa8KGBzG4ZIAOgu
	2jdhhQbdaAMNGb0z5YGobuGFI9lpF7iXE3IA4MRUPlpVgsq0m/y7e8X3cLmtbJT3
	Ni9jEGtTIRjPFeHhqzgZbOQHC6kY1GBKjRUYVxYY1OG13yvAKh1pnIlh/315Lu82
	DUV77tl/G7h6Ip2Nl+R6Cnw/YZk+BS8F519nChSyqZVKe1vleaAH5xWNAeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53asknam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:01:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso664360385a.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363670; x=1791968470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQtfPnn1PTGpnbnSjBfizU0bftFTFsUaBnQIlBDG8yE=;
        b=sNXmwrTPcEDkSKQDz8SJ5OBO0lO0sV/94F0QpXAUAuB9F+F2cLgy7W7qMjxh9MOnv6
         LyCjmqG1KtlXlFr8slR2VKNcP5b7C0g5C87nle4FUiNzO5OtwUq4ndD4IThQnE179nUV
         PzKoEKTPUiZXP3EdZeHcup4O1PPV8uNBw+korKi8wV4hhgqsJ7OAPe+XKis/Qaov7zpC
         uoR8hghweqw9MEPWtgveRwVu5p2i5Id2NOMMvP59ePBsL+H2I3GQ5CI0MQ1rfUHhyM6E
         iMxv4p0ELA/+3cPyuFd3x9/4U7OpAfbx5jxtbWUhapxbD4rks4rgvFzQOrH8bgXZybLR
         SGJw==
X-Forwarded-Encrypted: i=1; AKwUvBx/dYMJiFdCcSrbI3hp992iTrj7/bbIQ7OxR+vdrG4e7YZc3+uhdIZMi+2oV73tz1Mw/jZCY0TLuEWj@vger.kernel.org
X-Gm-Message-State: AFuF++nhdXb8Dse78erZtlrQQMyZn5YzCWJwehFWfjvB3DPCEPEZpN36
	sh5jHQoy3sqv4bobnNYNwFthjVkmbpv57VSwbd0hck+81nLQdvW2dRMVkXCRlSTKzH3rqnulnRk
	XXnAm8ELSCyrj1FxDGBsGcmymdx+mkIJlegPCRYqKSzrF0jTIqkNRW4P65EPqdTNI
X-Gm-Gg: AYBFou1IB4+dDWIH73TAK04aL6KhWtj0Jqpr2WpgHi9UyI96OAaXZkfj+MMj0GFseLv
	lpuAmSlwySHDmhtErLAgIz3N3pjzY68U+rQw9jdBYfD2NMwTWs2rNNvz2qz/OLIymflX2GhNpwp
	2zd8TL3wuXm/qLbjf/QTJ0R2hb3vFqYti23XzsSbPE9WqFPYG9K0Z2ppemKEteKyPKxEBS0KE8R
	YKmynJ7dccB2kdvJqsW4EPkDRM5tXGQL86Uei9Ra+8w3Vu7zK6nnlFIQb73Od9lScrZNtpPaoce
	6jS1tRlc5oKG7SrW8lmvbZSgQ4MVCfksA6f/qn9gj8RK8YwDX6peV+n13AI=
X-Received: by 2002:a05:620a:1725:b0:93e:9809:dbf3 with SMTP id af79cd13be357-93e9b8a1b85mr289587185a.70.1791363669802;
        Wed, 07 Oct 2026 02:01:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:93e:9809:dbf3 with SMTP id af79cd13be357-93e9b8a1b85mr289580885a.70.1791363669122;
        Wed, 07 Oct 2026 02:01:09 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:08 -0700 (PDT)
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
Subject: [PATCH RESEND 06/45] media: qcom: camss: sm8250: add IFE CamIF v10x
Date: Wed,  7 Oct 2026 12:00:02 +0300
Message-Id: <20261007090041.3732717-7-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: fmb-_NC9rjs7Ylywf5B4mkrH0M8Rhn_s
X-Proofpoint-GUID: fmb-_NC9rjs7Ylywf5B4mkrH0M8Rhn_s
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac60a56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=WmRFchFSvUI5OYwuZKUA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0x4zWTVslWCf
 dTSkAwmzUT97ty/EH+NWlU+NYM9BxcQUrxoah6XV4sTG4q3DOux8M6CVXWIr/LbX7ccWNIY3yIB
 Cb9nZd0TrKlRWtDW4dBdb3SqNBE+6XGF/zwiRz5gBOH2vdEJwIGgk16frNn698JgVFtdGMhugGo
 1cLhRDWvyTmubfQXI5zk4D+SBUJE5qwkdO08oPDJVpZh3PG/D9GsPOZGAvTFIV3/dfINAFh9L0R
 EUZ8wVu5IyrPGLEEXbadgGQvZTAKSy4vSmmJYW00dhDAKCswroFQ4CkNrktUzPqgtr3wfm99MyJ
 J++xYyX4wL7QT1Gfi3waTuceJeN3Z6ypPqhMptqSLEx6v1wXOa2etbRkHznAR8FLY3R6j+MpCRU
 3AHQEQLofzBp5zRAgvkC0cF6/hpm7+G4bNuCXj4Y/HoG/s7yKdFRIUurOnDmdSXF4fyq3sPHYZT
 z5mtNWj7TKpjv10eQmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4kTDdPwbWZzz
 aQWsVeX8B0LcnwvTtfhqLyIQl/0rmOVSD7YcuEVmU76xscBSb17pXZclgnkKhps9MycnhDuyiwe
 uDrFdxCKGyJzNdb81+e//sdZsPD7bJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE camera input interface used by the SM8250 pixel path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |  1 +
 .../qcom/camss/camss-ife-camif-v10x.c         | 59 +++++++++++++++++++
 .../qcom/camss/camss-ife-camif-v10x.h         | 42 +++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index e30fe07b16f4..2da998444554 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -15,6 +15,7 @@ qcom-camss-objs += \
 		camss-csiphy-3ph-1-0.o \
 		camss-format.o \
 		camss-ife-bus-v20x.o \
+		camss-ife-camif-v10x.o \
 		camss-ispif.o \
 		camss-tpg.o \
 		camss-tpg-gen1.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
new file mode 100644
index 000000000000..c89caf38fb8c
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include "camss.h"
+#include "camss-ife.h"
+#include "camss-ife-camif-v10x.h"
+
+static int camif_v10x_config(void __iomem *camif_base, enum camss_ife_hw_pipe hw_pipe,
+			     const struct camss_ife_pipeline_cfg *sink_cfg)
+{
+	u32 period = 0, pattern = 1, epoch;
+
+	epoch = FIELD_PREP(CAMIF_V10X_CFG_EPOCH0_LINE, sink_cfg->in_height / 3) |
+		FIELD_PREP(CAMIF_V10X_CFG_EPOCH1_LINE, sink_cfg->in_height / 2);
+
+	if (hw_pipe == CAMSS_IFE_HW_PIPE_PP) {
+		writel_relaxed(period, camif_base + CAMIF_V10X_PP_PERIOD_CFG);
+		writel_relaxed(pattern, camif_base + CAMIF_V10X_PP_PATTERN_CFG);
+		writel_relaxed(epoch, camif_base + CAMIF_V10X_PP_EPOCH_IRQ_CFG);
+	} else {
+		writel_relaxed(epoch, camif_base + CAMIF_V10X_RDI_EPOCH_IRQ_CFG);
+		writel_relaxed(period, camif_base + CAMIF_V10X_RDI_PERIOD_CFG);
+		writel_relaxed(pattern, camif_base + CAMIF_V10X_RDI_PATTERN_CFG);
+	}
+
+	return 0;
+}
+
+static void camif_v10x_enable(void __iomem *camif_base, enum camss_ife_hw_pipe hw_pipe)
+{
+	u32 rval = readl_relaxed(camif_base + CAMIF_V10X_MODULE_CFG);
+
+	if (hw_pipe == CAMSS_IFE_HW_PIPE_PP)
+		rval |= CAMIF_V10X_PP_CFG_EN | CAMIF_V10X_PP_CFG_OUTPUT_EN;
+	else
+		rval |= CAMIF_V10X_RDI_CFG_EN;
+
+	writel_relaxed(rval, camif_base + CAMIF_V10X_MODULE_CFG);
+}
+
+static void camif_v10x_disable(void __iomem *camif_base, enum camss_ife_hw_pipe hw_pipe)
+{
+	u32 rval = readl_relaxed(camif_base + CAMIF_V10X_MODULE_CFG);
+
+	if (hw_pipe == CAMSS_IFE_HW_PIPE_PP)
+		rval &= ~(CAMIF_V10X_PP_CFG_EN | CAMIF_V10X_PP_CFG_OUTPUT_EN);
+	else
+		rval &= ~CAMIF_V10X_RDI_CFG_EN;
+
+	writel_relaxed(rval, camif_base + CAMIF_V10X_MODULE_CFG);
+}
+
+const struct ife_hw_camif_ops ife_camif_v10x_ops = {
+	.config  = camif_v10x_config,
+	.enable  = camif_v10x_enable,
+	.disable = camif_v10x_disable,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h
new file mode 100644
index 000000000000..87faa5776c31
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#ifndef _CAMSS_IFE_CAMIF_V10X_H_
+#define _CAMSS_IFE_CAMIF_V10X_H_
+
+#include <linux/bits.h>
+
+#include "camss-ife.h"
+
+/* Per-RDI register offset */
+#define IFE_CAMIF_V10X_RDIX_OFFS(n) ((n) * 0x200)
+
+/* PP config bits */
+#define CAMIF_V10X_PP_CFG_EN		BIT(0)
+#define CAMIF_V10X_PP_CFG_OUTPUT_EN	BIT(8)
+
+/* RDI config bit */
+#define CAMIF_V10X_RDI_CFG_EN		BIT(0)
+
+/* EPOCH line fields */
+#define CAMIF_V10X_CFG_EPOCH0_LINE		GENMASK(13, 0)
+#define CAMIF_V10X_CFG_EPOCH1_LINE		GENMASK(29, 16)
+
+/* Module config register offset */
+#define CAMIF_V10X_MODULE_CFG		0x00000060
+
+/* RDI register offsets */
+#define CAMIF_V10X_RDI_PERIOD_CFG	0x00000068
+#define CAMIF_V10X_RDI_PATTERN_CFG	0x0000006c
+#define CAMIF_V10X_RDI_EPOCH_IRQ_CFG	0x00000070
+
+/* PP (pixel path) register offsets */
+#define CAMIF_V10X_PP_PERIOD_CFG	0x00000078
+#define CAMIF_V10X_PP_PATTERN_CFG	0x0000007c
+#define CAMIF_V10X_PP_EPOCH_IRQ_CFG	0x00000080
+
+extern const struct ife_hw_camif_ops ife_camif_v10x_ops;
+
+#endif /* _CAMSS_IFE_CAMIF_V10X_H_ */
-- 
2.34.1

