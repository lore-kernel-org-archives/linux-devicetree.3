Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB7148CD50
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363843; cv=none; b=p9U6IpPbLY2HvM7L/Wy9qNBNMRhKcnGqlctLTXLl6RUdmAGHpA5+tGrtHKVH6YjORvOSs1Vm3OLrpROT4CotKsYAHO0l7scKP2laamHYlSR7NxH/8TEHnXU5UnSjbfBOzks/8ilPyTsdQS+vNli5HdYFXV7q2f2rPN00WhiHnM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363843; c=relaxed/simple;
	bh=gQYnlNki4RCfliJrsgE8LVBvSfIJEKZdE0y6Zw1LfHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mmLT8g/wmkgQY8h7KUKsyl+XBG7d2ex6LiOsrv2Jgo0pG+C2TvLmD0Vo5ppQ9Cc+cMJIpl0R0v1UP9Ip/QAQzuQ0lfte7lowtWJwojpjzlT3JG8Id4XosWEJ18xFH/4S7h0iTMbwnwrfz4dIFhF6W+3HScOVslmerwlxEYHFCfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZT9Ydnk reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZT9Ydnk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jkY8152082
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Uk73D1sQwzJ
	OevMqHPdn2fvIIK0KAAYqB+YLXo/shZw=; b=JZT9Ydnk1dP/YAjBHg15bdHqktO
	qzbgfLEY6IShTcgFJAiNYNZJNDZdGFp9u5yP2VR5wFcjn9/iGirN2IV/gMsyz4G0
	vHHWqrxK2OIYQLsALNe6rY5X43R2OfEoAZP9IVpX/VzY0sso8XiP69WVSEUR0mZQ
	FXeivWsN46xFoASnVmeLARAV1KkSK+gsAXBzjwG8uPy9c+Hy5eRE+tUHmvFAuetf
	h3vy7/XPLBaHQJ9ccEM/m4RwWt3FmvyohDkYI49241E452jDAlf2nzpoe4mqinx9
	3yX/03Rz8R5fZrREhu0Si/drK0jVGI6+TBZFnpbpn/+9QqfPg1uepNbnpag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719c0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:02:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf4c0af4eso586411885a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363748; x=1791968548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uk73D1sQwzJOevMqHPdn2fvIIK0KAAYqB+YLXo/shZw=;
        b=dEeAyCZogrM6KAwn6ETxRyMV89TeMAT5DNfshg+8Mb2Q8ofF5ijV7mqbGvi//Ngtw7
         ytzgw2yuNYy2E6pPoMiGJ6yKq8PL8HYmXbiu1zi1nRDriKR0c/F0qZF73xe3p4qLaeUi
         7og46Jt+2PxDc4yAU3DPl5RqQX8RxF4dkxLgr81j1h3G/1gJAurMo77u8e/KLk5YWguT
         RGEaV26CvomWp5U3DUGu8LsJMzO7um1YnXgz5JyF9WVh8BMzfXjpcVqmaIxvhakym1Q1
         S9nrwIH5yaJbm1PAgUxYwIwcqcY+rdL/XUVFf5wTT8NQj8aBqgJoXD2MD5IdmeaL0uqc
         Hm7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzg7bcOzihcRxtO/jjZ0Eb42HbXN7UWDib2EnkyJsVHp15aCXwdIOJMB/3e56b5gDRLDuFtwt80TQrf@vger.kernel.org
X-Gm-Message-State: AFuF++m8qpP9Z6uW3XLHvl6W8ttlk15LH0SerdrVcib3h3T0taNoQjlk
	z7fC7fb/8kle+oZ/bB33foQOHkGaIrEpd6DH6kTxIfJPg7GC2wxDONPfqjfKCmxoaxU6vfAxe+q
	pH2xvn8w1jN0xO0kMc9gIEwQiVpRpJAkoM8TMszB28f5RJqLu8YfE+7tjqm/pdmKG
X-Gm-Gg: AYBFou3179r9lTl5fxSeosr8KNDA2vD1HSZDh2PiH8s//znSipLgxVwQY2rmbOSJrVT
	AlMlLZDUVSSzj8hkqH1SmFhhnqmYPQQg3/OcJv8pSBGR+H8eKNWp3Nju4DYktvpAYLsVi9iCZ6s
	NshLzbFBPkCZgvxNkIDv2CHCM1X4AlbggLTeicEN/n8fkXpqIoFQK9rbFfFIRSmOtsSohLCRkgo
	GpvuKMmmJYfvOctk6NRxObO+pgwTJJeazcayqtcAz23vkg4ge5vZhTUKKOWJh7pmmRr4GAm+/cD
	UzR9XoukLsI5ww1UgNOwtCOQYQxc1xk7Se4UIpFD1d+mkXRjIJh1kUClgd8=
X-Received: by 2002:a05:620a:29c7:b0:939:3f4f:7254 with SMTP id af79cd13be357-93e86035520mr972465985a.14.1791363748155;
        Wed, 07 Oct 2026 02:02:28 -0700 (PDT)
X-Received: by 2002:a05:620a:29c7:b0:939:3f4f:7254 with SMTP id af79cd13be357-93e86035520mr972460585a.14.1791363747480;
        Wed, 07 Oct 2026 02:02:27 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:26 -0700 (PDT)
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
Subject: [PATCH RESEND 29/45] media: qcom: camss: sa8775p: add IFE lite top v3.0x
Date: Wed,  7 Oct 2026 12:00:25 +0300
Message-Id: <20261007090041.3732717-30-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4Y7UEfUjNBPG
 6odKJ7QbWWlI5U5YyEzVvClIkQEOfiZttf69RVnJN7heZqW+5ge6/0BVuqkwIoAdbuHkZlC9fgj
 30W+f7TERM5r0scFQkMm/jurFryVdXU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX3q3p+I7bsUiN
 zUV4+UuDsuLkJbCppcXgaa1K5JyMR4eU9wjEac0wJ2/z2jlP4QMp1//6ljqHw2ZHvj/TN71oaNE
 orEbs82nBZYljsdsnZXPRbqez/uCj2P5kJ/eE5ygsrYO76udjCSUbf9b4qIhAyydbxUFdirKYNU
 ZTo4Wuvr5xaoKDRPuIJR3scHXFq0TFDxn4/6B5xpjfGpdERI2dmcWzksghYOBq8RLno2dqx+Ig/
 O5NHva7bHpLHoTKnYaLb2nF75ZUolw7M/OZY98HQpLyYA67OPzq63TtDosTVQGqNepUJxA5gL+M
 uLQjeNxPlilOUIQhBFs6XDpa9iE0Af9DatTIH+7iFl8rQsSjM7Z4CS2XsU8PwHdU+lkLa9iT9ak
 7H3P2N+avnCoVkQuE8JelGhgZ53A6c9k3wawD2mLc4KcOtKhOli0PrIUtwyONr9iz/8JIqWqTyX
 d+5zmPjGmfaPQbiAScQ==
X-Proofpoint-GUID: WWVkqmVD3NRPqk3-KFQLX7F4dWj8DIuT
X-Proofpoint-ORIG-GUID: WWVkqmVD3NRPqk3-KFQLX7F4dWj8DIuT
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac60aa5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=t8b10ELgnko-6rM5i1kA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE lite top v3.0x engine used by the SA8775P RDI paths.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../qcom/camss/camss-ife-lite-top-v30x.c      | 265 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 267 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 479ab17f3bdb..695924e0c03b 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -17,6 +17,7 @@ qcom-camss-objs += \
 		camss-ife.o \
 		camss-ife-bus-v20x.o \
 		camss-ife-bus-v31x.o \
+		camss-ife-lite-top-v30x.o \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c b/drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c
new file mode 100644
index 000000000000..c3c182e4c895
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include "camss-ife.h"
+#include "camss.h"
+
+#define IFE_LT_V30X_TOP_OFFS		0x0000
+
+/* CSID register update command */
+#define IFE_LT_V30X_CSID_RUP_AUP_CMD	0x00000018
+#define IFE_LT_V30X_CSID_RUP_RDI0	BIT(4)
+#define IFE_LT_V30X_CSID_RUP_RDI1	BIT(5)
+#define IFE_LT_V30X_CSID_RUP_RDI2	BIT(6)
+#define IFE_LT_V30X_CSID_RUP_RDI3	BIT(7)
+#define IFE_LT_V30X_CSID_AUP_RDI0	BIT(20)
+#define IFE_LT_V30X_CSID_AUP_RDI1	BIT(21)
+#define IFE_LT_V30X_CSID_AUP_RDI2	BIT(22)
+#define IFE_LT_V30X_CSID_AUP_RDI3	BIT(23)
+
+#define IFE_LT_V30X_MOD_VER_GEN		GENMASK(31, 28)
+#define IFE_LT_V30X_MOD_VER_REV		GENMASK(27, 16)
+#define IFE_LT_V30X_MOD_VER_STEP	GENMASK(15, 0)
+#define IFE_LT_V30X_MOD_GEN(val)	FIELD_GET(IFE_LT_V30X_MOD_VER_GEN, val)
+#define IFE_LT_V30X_MOD_REV(val)	FIELD_GET(IFE_LT_V30X_MOD_VER_REV, val)
+#define IFE_LT_V30X_MOD_STEP(val)	FIELD_GET(IFE_LT_V30X_MOD_VER_STEP, val)
+
+/* TOP functional IRQ registers */
+#define IFE_LT_V30X_FUNC_IRQ_CMD	0x00000064
+#define IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR	BIT(0)
+#define IFE_LT_V30X_FUNC_IRQ_MASK_0	0x00000068
+#define IFE_LT_V30X_FUNC_IRQ_MASK_1	0x0000006c
+#define IFE_LT_V30X_FUNC_IRQ_CLEAR_0	0x00000070
+#define IFE_LT_V30X_FUNC_IRQ_CLEAR_1	0x00000074
+#define IFE_LT_V30X_FUNC_IRQ_STATUS_0	0x00000078
+#define IFE_LT_V30X_FUNC_IRQ_STATUS_1	0x0000007c
+
+/* IRQ_STATUS_0 bits */
+#define IFE_LT_V30X_IRQ0_DIAG_VIOLATION	BIT(1)
+#define IFE_LT_V30X_IRQ0_BUSWR		BIT(0)
+#define IFE_LT_V30X_IRQ0_ERRORS_MASK \
+	(IFE_LT_V30X_IRQ0_DIAG_VIOLATION)
+
+/* IRQ_STATUS_1 bits - per-RDI SOF/EOF */
+#define IFE_LT_V30X_IRQ1_RDI3_EOF	BIT(7)
+#define IFE_LT_V30X_IRQ1_RDI3_SOF	BIT(6)
+#define IFE_LT_V30X_IRQ1_RDI2_EOF	BIT(5)
+#define IFE_LT_V30X_IRQ1_RDI2_SOF	BIT(4)
+#define IFE_LT_V30X_IRQ1_RDI1_EOF	BIT(3)
+#define IFE_LT_V30X_IRQ1_RDI1_SOF	BIT(2)
+#define IFE_LT_V30X_IRQ1_RDI0_EOF	BIT(1)
+#define IFE_LT_V30X_IRQ1_RDI0_SOF	BIT(0)
+
+#define IFE_LT_V30X_IRQ1_RDI0 \
+	(IFE_LT_V30X_IRQ1_RDI0_SOF | IFE_LT_V30X_IRQ1_RDI0_EOF)
+#define IFE_LT_V30X_IRQ1_RDI1 \
+	(IFE_LT_V30X_IRQ1_RDI1_SOF | IFE_LT_V30X_IRQ1_RDI1_EOF)
+#define IFE_LT_V30X_IRQ1_RDI2 \
+	(IFE_LT_V30X_IRQ1_RDI2_SOF | IFE_LT_V30X_IRQ1_RDI2_EOF)
+#define IFE_LT_V30X_IRQ1_RDI3 \
+	(IFE_LT_V30X_IRQ1_RDI3_SOF | IFE_LT_V30X_IRQ1_RDI3_EOF)
+
+#define IFE_LT_V30X_HW_VERSION		0x00000000
+
+static int ife_lite_top_30x_acquire(struct ife_device *ife, void __iomem *base,
+				    void __iomem *csid_base)
+{
+	struct ife_top_ctx *ctx = &ife->top_ctx;
+
+	if (!csid_base)
+		return -EINVAL;
+
+	ctx->base	= base + IFE_LT_V30X_TOP_OFFS;
+	ctx->dev	= ife->camss->dev;
+	ctx->csid_base	= csid_base;
+
+	return 0;
+}
+
+static void ife_lite_top_30x_release(struct ife_top_ctx *ctx)
+{
+	ctx->base      = NULL;
+	ctx->csid_base = NULL;
+}
+
+static u32 ife_lite_top_30x_version(struct ife_top_ctx *ctx)
+{
+	struct camss_hw_version hw_ver;
+	u32 reg = readl_relaxed(ctx->base + IFE_LT_V30X_HW_VERSION);
+
+	hw_ver.ids.major = IFE_LT_V30X_MOD_GEN(reg);
+	hw_ver.ids.minor = IFE_LT_V30X_MOD_REV(reg);
+	hw_ver.ids.steps = IFE_LT_V30X_MOD_STEP(reg);
+
+	return hw_ver.hw_version;
+}
+
+static void ife_lite_top_30x_reset(struct ife_top_ctx *ctx)
+{
+	void __iomem *top = ctx->base;
+
+	writel_relaxed(~0, top + IFE_LT_V30X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(~0, top + IFE_LT_V30X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR, top + IFE_LT_V30X_FUNC_IRQ_CMD);
+}
+
+static void ife_lite_top_30x_reg_update(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *dsc)
+{
+	void __iomem *csid = ctx->csid_base;
+	u32 rval;
+
+	switch (dsc->hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval = IFE_LT_V30X_CSID_RUP_RDI0 | IFE_LT_V30X_CSID_AUP_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval = IFE_LT_V30X_CSID_RUP_RDI1 | IFE_LT_V30X_CSID_AUP_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval = IFE_LT_V30X_CSID_RUP_RDI2 | IFE_LT_V30X_CSID_AUP_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		rval = IFE_LT_V30X_CSID_RUP_RDI3 | IFE_LT_V30X_CSID_AUP_RDI3;
+		break;
+	default:
+		dev_warn(ctx->dev, "Invalid RUP pipe: 0x%x\n", dsc->hw_pipe);
+		return;
+	}
+
+	writel_relaxed(rval, csid + IFE_LT_V30X_CSID_RUP_AUP_CMD);
+}
+
+static int ife_lite_top_30x_pipe_config(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *desc,
+					const struct camss_ife_pipeline_cfg *pipeline_cfg,
+					const struct camss_ife_wm_config *wm_cfg)
+{
+	return 0;
+}
+
+static int ife_lite_top_30x_pipe_enable(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *desc)
+{
+	return 0;
+}
+
+static int ife_lite_top_30x_pipe_disable(struct ife_top_ctx *ctx,
+					 const struct ife_pad_desc *desc)
+{
+	return 0;
+}
+
+static void ife_lite_top_30x_prepare(struct ife_top_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	writel_relaxed(~0, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(~0, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR, base + IFE_LT_V30X_FUNC_IRQ_CMD);
+
+	rval = IFE_LT_V30X_IRQ0_BUSWR | IFE_LT_V30X_IRQ0_ERRORS_MASK;
+	writel_relaxed(rval, base + IFE_LT_V30X_FUNC_IRQ_MASK_0);
+}
+
+static void ife_lite_top_30x_enable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 rval = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval |= IFE_LT_V30X_IRQ1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval |= IFE_LT_V30X_IRQ1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval |= IFE_LT_V30X_IRQ1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		rval |= IFE_LT_V30X_IRQ1_RDI3;
+		break;
+	default:
+		return;
+	}
+
+	writel_relaxed(rval, base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+}
+
+static void ife_lite_top_30x_disable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 rval = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI3;
+		break;
+	default:
+		dev_warn(ctx->dev, "Invalid HW pipeline identifier: 0x%x\n", hw_pipe);
+		return;
+	}
+
+	writel_relaxed(rval, base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+}
+
+static void ife_lite_top_30x_irq_status(struct ife_top_ctx *ctx, u32 isr_stat[IFE_TOP_STATUS_MAX])
+{
+	void __iomem *base = ctx->base;
+	u32 stat0;
+	u32 stat1;
+
+	stat0 = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_STATUS_0);
+	stat1 = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_STATUS_1);
+
+	writel_relaxed(stat0, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(stat1, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR, base + IFE_LT_V30X_FUNC_IRQ_CMD);
+
+	isr_stat[IFE_TOP_STATUS_ID0] = 0;
+	isr_stat[IFE_TOP_STATUS_ID1] = 0;
+	isr_stat[IFE_TOP_STATUS_ID2] = stat0 & IFE_LT_V30X_IRQ0_ERRORS_MASK;
+
+	if (stat0 & IFE_LT_V30X_IRQ0_BUSWR)
+		isr_stat[IFE_TOP_STATUS_ID0] |= IFE_HW_TOP_IRQ0_BUSWR;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI0_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI0_SOF;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI1_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI1_SOF;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI2_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI2_SOF;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI3_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI3_SOF;
+}
+
+const struct ife_hw_top_ops ife_lite_top_30x_ops = {
+	.acquire	= ife_lite_top_30x_acquire,
+	.release	= ife_lite_top_30x_release,
+	.version	= ife_lite_top_30x_version,
+	.prepare	= ife_lite_top_30x_prepare,
+	.enable		= ife_lite_top_30x_enable,
+	.disable	= ife_lite_top_30x_disable,
+	.pipe_config	= ife_lite_top_30x_pipe_config,
+	.pipe_enable	= ife_lite_top_30x_pipe_enable,
+	.pipe_disable	= ife_lite_top_30x_pipe_disable,
+	.reg_update	= ife_lite_top_30x_reg_update,
+	.reset		= ife_lite_top_30x_reset,
+	.irq_status	= ife_lite_top_30x_irq_status,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 31d9c83767a5..eff4ab4bd1c9 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -403,5 +403,6 @@ extern const struct camss_mod_ops ife_mod_v10x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
 extern const struct ife_hw_top_ops ife_lite_top_10x_ops;
+extern const struct ife_hw_top_ops ife_lite_top_30x_ops;
 
 #endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1

