Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C144442FA0
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131944; cv=none; b=J2zRxLXg8Rq9Sw2GlbFw4N80tP0eL9Qe0wJ9ipXG3YyMTOxuGqrsSHiffn0uQ5OsYp4xNXgmzBZY1SwDtNHC3JNUqFkCbW0cTyTXf+U9CGRR2jlKpQjUZ30CR3v0YihnUK1yTywvhxtN6ydoA7y3IF50wsZiDGsPdEEzTDz3AwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131944; c=relaxed/simple;
	bh=0m7jQpMFBxfZmbcVUKzb+OsECFUdxjb75HLLdGEunKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gtTvmEBEog794nWWBeVVxW2rThbPSfOyemxs+7QOrqzzjdbVlsOC7qGGojurYai237xtpY9MLp2He+OkiJ/vtcu8Y5z7BhgfdGYQnhKk1UFzwsXAKIk/DJ4iUrOHpI+sWvWEdpFnq4ZrISvrByuuEF+20MlgJ/LvlEiSPd9TC58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZkN4LjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArybFh2W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZkN4LjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArybFh2W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZK1a3495538
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ca5SybnU8OyUy4+Gl2Mm9ZDN0OkrWH3HoIJC7SEBDM=; b=hZkN4LjP0vWPihsi
	MfbKQ8Vcwq+1HAWxmka79RFqyuKLYgwwRe6VKeR6DT3vhaT2Q0pm1UQRg3fBymGc
	zqfPMuf1p4C1SBjzSkGgMfjhv0Yt/Q+jER6lII3QAy9w84LGxr24xUMGAHYMRdj4
	+spe2FFEmMMe5h3mK0fSuPqrWXiRlWYEYj5doDIzkAhwjktgdx84QyQSzu4bi78r
	3TOh6oqndyPibahFO3HmMwUn/eA5ZflOvKfo8nEFzaJki3AX3i9YjkoE1BkSzinB
	P0c1HiYz+/1LFI2P1UZ5mlNVHQ7CJM4eXfTv+umpdPw7R6Fh3Oc9fPmg/aXaX74g
	UBOxqg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjjhph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:32:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso9147711cf.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787131940; x=1787736740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ca5SybnU8OyUy4+Gl2Mm9ZDN0OkrWH3HoIJC7SEBDM=;
        b=ArybFh2WiWzw84mEmfksJmwGjWm6ou6/pgaONuAskK60AtcedZYKvnAwe2oBYVFAqG
         F03jTYkf81g1LIDz1TJfu9MQxvOnyDSWwOxIYOkihsBLbsSiwYPJEU6rYFl/ud0rN6mG
         H8uqoRYbSEpdvNkbLljNrbNaAouR2/m24A2NpPU5TTxPepqFgThNSQS1MAOR8NbywLhn
         VHDccUD8g5uiZv/hTFUenFszmsdtx9adYv0FccNoES0OKciaM7wYzcXpNLAbZFwRv1k4
         lpkogKSH8+YFN6YzNaGGMGCYnwHAixv6YZe28rdo9MEYsN0rstlxppxpr7CzIwpmdGGd
         Mqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131940; x=1787736740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ca5SybnU8OyUy4+Gl2Mm9ZDN0OkrWH3HoIJC7SEBDM=;
        b=NXGgQigqV8vIlaJk76HXzJQSn5BBXJZhIqeU9oHpJln7McR3lBlFxhrJS5Mwhs2ANb
         7ycf0SJJjKzasflCcxk7bxX/WDtPQTxo1e48i+vfXQqPKotXQR1Hr0MaAFrwB8/U6F4I
         2zp5hM6NXehL3PvB3Se6a1cXIReG6F8W1h0IuLgzqRqb4Y23gvtmDoo4Yo7tbGEHicPF
         qeyX2EfclM3nVsQXBa4p0PcWQsdahKoHAbFVd1Hm2Uc67gmBWVO11NeJO0u6qJvvD5Tz
         RAefyufqXlaBNOKrLtnCjOmvqCt8BdCdxRdxjo4cw53ixdt2IDULNmdFl1q6vA4fq/T8
         tUiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4oANYobzCrAME6+Hp05t+7YZ6wxPgQig+uOFShvKLx+UYikQmTy+aGDnPIF/Q+xf7R+/HU+thb5xp@vger.kernel.org
X-Gm-Message-State: AOJu0YyPHxbFJ213+7BkJIB2a9GJLOWDELfLEQB3ayxt+4K1V2lQnr7N
	5Kxo4kPdn4N6Vu1kByGJf8Q0Yd+QcB6uzXIESmaMj7Hn9kY7Ly+FNqNPdop2rE8wM40EZWdlN7Z
	hAJ1qRRiJQc0po8vuFEIVF+64hPYIHQ+pZ2B4NB4desx6Ft6Kw1NEq2hmA0f2oPwU
X-Gm-Gg: AR+sD13Qd4Ck/3O1Jbxz2L5qJceWFGAfPk4xTDK+Znl1NYk1WgQqJLjzJzUhKYXacXl
	4MhvWBYVyoRX0q7Z1m9zTXKwVDvwKwZXSlogIcqkIMGB3qnr5Cgt48LjQFDy//VaFcQgLQpO5i4
	d6J6QApCQNXG1EW9L9lGoq2x+SmGIBHpEYTZ7uiAD/D7f4fpHsMV1dlck7DVu4sCe9yRLXszE5V
	nZK0gsnDuZ7Szf0QAQkV4p0P0v2WZGAfHG1dX1T7G/Z1L3eLNzw07bNtAv/lOT/tdydKOFvUuD7
	KajTeTF95qMuU5FAplXRtAndsGiRMiqmsKiJcngO5z1/Pt9M9P8qo6XFxKErM8yuEHgAxKi3W1z
	E6fuRoMow8uiN0YSfLW1GttUy
X-Received: by 2002:a05:622a:22a9:b0:528:1478:e1fc with SMTP id d75a77b69052e-52dd5cacd79mr29047491cf.34.1787131939523;
        Wed, 19 Aug 2026 02:32:19 -0700 (PDT)
X-Received: by 2002:a05:622a:22a9:b0:528:1478:e1fc with SMTP id d75a77b69052e-52dd5cacd79mr29047151cf.34.1787131938962;
        Wed, 19 Aug 2026 02:32:18 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8050sm4402835f8f.19.2026.08.19.02.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:32:18 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 2/3] interconnect: qcom: Add CAMNOC interconnect provider driver
Date: Wed, 19 Aug 2026 12:32:10 +0300
Message-Id: <20260819093211.1436275-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
References: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfX+L6M82wTQ1le
 OOUZLzSRvKYlzFBgAe2A52CCeri4kbR6mfRWNymg1O4YM3ogFg5oLteTEZ+2bafihAS9uoUuiYU
 +PiH4a8O688p6Vs86koaFvuTCdnI9w3uYo+kePD3/5fhRn8D8FFVWNIn/4z11meDTmj4PxocIkr
 SKn5MGMvNRBHyTC3Rkmu6nkfiFLZFB/ilYLcBhg9izGJo6i1M8m2LTyNS/HRBDk9seGdD2Kgcok
 MpNugJtqWie04t0xRLj34e+F2jvv8pLpTmsiaMzNIPI0ZAXyOPCc4mHO/irncMUYJY7bEWNAUeJ
 gABYeL2T6S2sVEpj2ODvTThZzHCnyAvRz1J3CuoDuVC6ZQCpA352SMVQazJ+UcTdcj1lH4VhK8e
 Uyf5yqEvkFYD4O6/drN2iZZqCyYaEA2NZ63/04ckw/WmheWoV9sRIubtNVeN4O6NyZgti8WEmL8
 +4+8wFV0KtVoB9cH0lA==
X-Proofpoint-GUID: 66Dsx7qGaFN4aPQK_eWyUaSd39TSvO9x
X-Proofpoint-ORIG-GUID: 66Dsx7qGaFN4aPQK_eWyUaSd39TSvO9x
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfX9w5B+OMRRet+
 x9Jk/7hMg8LfzXOBQFN2WJ+REq8tc1ppm7ZkeoPR7Mxmxp8IWdl2vFyuiv64O7EuEiOpwvIkYW+
 Rpv4WMVgkdbVCZ38dzUaIt0L4pBENEo=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a857824 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=f5Ls4CcRBTqkL3o7hW4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190072

Add an ICC provider for the Qualcomm Camera NOC (CAMNOC). Multiple
camera sub-devices share CAM_CC_CAMNOC_AXI_CLK; direct clk_set_rate()
calls from each consumer cause a last-writer-wins race.

Each consumer obtains an ICC path to SLAVE_CAMNOC_AXI and votes via
icc_set_bw(). The ICC core aggregates votes (max peak_bw) and the
set() callback converts the result to clk_set_rate(). Consumers
encode the required frequency as peak_bw in kBps.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig       |  10 +
 drivers/interconnect/qcom/Makefile      |   2 +
 drivers/interconnect/qcom/qcom-camnoc.c | 279 ++++++++++++++++++++++++
 3 files changed, 291 insertions(+)
 create mode 100644 drivers/interconnect/qcom/qcom-camnoc.c

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 5b8a094ca4ed..9d9d238019a0 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -135,6 +135,16 @@ config INTERCONNECT_QCOM_NORD
 	  the RPMh hardware and communicates via Bus Clock Manager (BCM)
 	  through the Resource State Coordinator (RSC).
 
+config INTERCONNECT_QCOM_CAMNOC
+	tristate "Qualcomm CAMNOC interconnect driver"
+	depends on INTERCONNECT_QCOM || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Say y here to support the Camera Network-on-Chip (CAMNOC)
+	  interconnect driver for Qualcomm SoCs. It aggregates bandwidth
+	  requests from camera sub-devices (IFE, JPEG, BPS, etc.) and
+	  scales CAM_CC_CAMNOC_AXI_CLK accordingly.
+
 config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index 1c7d410b40cc..52a5998ae6a8 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -18,6 +18,7 @@ qnoc-msm8974-objs			:= msm8974.o
 qnoc-msm8976-objs			:= msm8976.o
 qnoc-msm8996-objs			:= msm8996.o
 qnoc-nord-objs				:= nord.o
+icc-camnoc-objs				:= qcom-camnoc.o
 icc-osm-l3-objs				:= osm-l3.o
 qnoc-qcm2290-objs			:= qcm2290.o
 qnoc-qcs404-objs			:= qcs404.o
@@ -66,6 +67,7 @@ obj-$(CONFIG_INTERCONNECT_QCOM_MSM8974) += qnoc-msm8974.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8976) += qnoc-msm8976.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8996) += qnoc-msm8996.o
 obj-$(CONFIG_INTERCONNECT_QCOM_NORD) += qnoc-nord.o
+obj-$(CONFIG_INTERCONNECT_QCOM_CAMNOC) += icc-camnoc.o
 obj-$(CONFIG_INTERCONNECT_QCOM_OSM_L3) += icc-osm-l3.o
 obj-$(CONFIG_INTERCONNECT_QCOM_QCM2290) += qnoc-qcm2290.o
 obj-$(CONFIG_INTERCONNECT_QCOM_QCS404) += qnoc-qcs404.o
diff --git a/drivers/interconnect/qcom/qcom-camnoc.c b/drivers/interconnect/qcom/qcom-camnoc.c
new file mode 100644
index 000000000000..9a703b052b2d
--- /dev/null
+++ b/drivers/interconnect/qcom/qcom-camnoc.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Qualcomm Camera NOC (CAMNOC) interconnect provider.
+ *
+ * CAMNOC is the internal AXI interconnect within the Qualcomm camera
+ * subsystem. Multiple camera sub-devices (IFE, JPEG, BPS, etc.) share
+ * CAM_CC_CAMNOC_AXI_CLK. This driver acts as an ICC provider so that
+ * each sub-device can independently vote for bandwidth; the ICC core
+ * aggregates the votes (max of peak_bw across all consumers) and this
+ * driver translates the result into a clk_set_rate() call, avoiding
+ * the last-writer-wins race that occurs with direct clk_set_rate().
+ *
+ * Consumers express their required clock rate directly as peak_bw in
+ * kBps (e.g. 400000 for 400 MHz).  The driver converts kBps → Hz:
+ *   rate_hz = peak_bw_kBps * 1000
+ */
+
+#include <linux/clk.h>
+#include <linux/interconnect-provider.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/interconnect/qcom,camnoc.h>
+
+#define to_camnoc_provider(_p) \
+	container_of(_p, struct qcom_camnoc_icc_provider, provider)
+
+struct qcom_camnoc_icc_provider {
+	struct clk *clk;
+	struct icc_provider provider;
+};
+
+struct qcom_camnoc_node {
+	const char *name;
+	u16 buswidth;
+};
+
+/* IFE */
+static const struct qcom_camnoc_node camnoc_master_ife_0 = {
+	.name = "master-camnoc-ife-0", .buswidth = 16
+};
+
+static const struct qcom_camnoc_node camnoc_master_ife_0_rdi = {
+	.name = "master-camnoc-ife-0-rdi", .buswidth = 16
+};
+
+static const struct qcom_camnoc_node camnoc_master_ife_1 = {
+	.name = "master-camnoc-ife-1", .buswidth = 16
+};
+
+static const struct qcom_camnoc_node camnoc_master_ife_1_rdi = {
+	.name = "master-camnoc-ife-1-rdi", .buswidth = 16
+};
+
+static const struct qcom_camnoc_node camnoc_master_ife_lite_0 = {
+	.name = "master-camnoc-ife-lite-0", .buswidth = 8
+};
+
+static const struct qcom_camnoc_node camnoc_master_ife_lite_1 = {
+	.name = "master-camnoc-ife-lite-1", .buswidth = 8
+};
+
+static const struct qcom_camnoc_node camnoc_master_ife_lite_2 = {
+	.name = "master-camnoc-ife-lite-2", .buswidth = 8
+};
+
+static const struct qcom_camnoc_node camnoc_master_ife_lite_3 = {
+	.name = "master-camnoc-ife-lite-3", .buswidth = 8
+};
+
+static const struct qcom_camnoc_node camnoc_master_ife_lite_4 = {
+	.name = "master-camnoc-ife-lite-4", .buswidth = 8
+};
+
+/* BPS */
+static const struct qcom_camnoc_node camnoc_master_bps = {
+	.name = "master-camnoc-bps", .buswidth = 16
+};
+
+/* IPE */
+static const struct qcom_camnoc_node camnoc_master_ipe_0 = {
+	.name = "master-camnoc-ipe-0", .buswidth = 16
+};
+
+static const struct qcom_camnoc_node camnoc_master_ipe_1 = {
+	.name = "master-camnoc-ipe-1", .buswidth = 16
+};
+
+/* JPEG */
+static const struct qcom_camnoc_node camnoc_master_jpeg = {
+	.name = "master-camnoc-jpeg", .buswidth = 16
+};
+
+static const struct qcom_camnoc_node camnoc_master_jpeg_dma = {
+	.name = "master-camnoc-jpeg-dma", .buswidth = 16
+};
+
+/* CDM */
+static const struct qcom_camnoc_node camnoc_master_cdm = {
+	.name = "master-camnoc-cdm", .buswidth = 4
+};
+
+/* FD */
+static const struct qcom_camnoc_node camnoc_master_fd = {
+	.name = "master-camnoc-fd", .buswidth = 16
+};
+
+/* SBI */
+static const struct qcom_camnoc_node camnoc_master_sbi = {
+	.name = "master-camnoc-sbi", .buswidth = 16
+};
+
+/* ICP */
+static const struct qcom_camnoc_node camnoc_master_icp = {
+	.name = "master-camnoc-icp", .buswidth = 8
+};
+
+/* Slave */
+static const struct qcom_camnoc_node camnoc_slave_axi = {
+	.name = "slave-camnoc-axi", .buswidth = 32
+};
+
+static const struct qcom_camnoc_node * const camnoc_nodes[] = {
+	[MASTER_CAMNOC_IFE_0]      = &camnoc_master_ife_0,
+	[MASTER_CAMNOC_IFE_0_RDI]  = &camnoc_master_ife_0_rdi,
+	[MASTER_CAMNOC_IFE_1]      = &camnoc_master_ife_1,
+	[MASTER_CAMNOC_IFE_1_RDI]  = &camnoc_master_ife_1_rdi,
+	[MASTER_CAMNOC_IFE_LITE_0] = &camnoc_master_ife_lite_0,
+	[MASTER_CAMNOC_IFE_LITE_1] = &camnoc_master_ife_lite_1,
+	[MASTER_CAMNOC_IFE_LITE_2] = &camnoc_master_ife_lite_2,
+	[MASTER_CAMNOC_IFE_LITE_3] = &camnoc_master_ife_lite_3,
+	[MASTER_CAMNOC_IFE_LITE_4] = &camnoc_master_ife_lite_4,
+	[MASTER_CAMNOC_BPS]        = &camnoc_master_bps,
+	[MASTER_CAMNOC_IPE_0]      = &camnoc_master_ipe_0,
+	[MASTER_CAMNOC_IPE_1]      = &camnoc_master_ipe_1,
+	[MASTER_CAMNOC_JPEG]       = &camnoc_master_jpeg,
+	[MASTER_CAMNOC_JPEG_DMA]   = &camnoc_master_jpeg_dma,
+	[MASTER_CAMNOC_CDM]        = &camnoc_master_cdm,
+	[MASTER_CAMNOC_FD]         = &camnoc_master_fd,
+	[MASTER_CAMNOC_SBI]        = &camnoc_master_sbi,
+	[MASTER_CAMNOC_ICP]        = &camnoc_master_icp,
+	[SLAVE_CAMNOC_AXI]         = &camnoc_slave_axi,
+};
+
+#define CAMNOC_NUM_NODES	ARRAY_SIZE(camnoc_nodes)
+
+static int qcom_camnoc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	*avg = 0;
+	*peak = 0;
+
+	return 0;
+}
+
+static int qcom_camnoc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct qcom_camnoc_icc_provider *cp =
+		to_camnoc_provider(src->provider);
+	unsigned long rate;
+
+	/*
+	 * peak_bw is the aggregated max across all consumers (kBps).
+	 * Consumers encode the required clock frequency directly as kBps,
+	 * so the conversion is simply: rate_hz = peak_bw * 1000.
+	 * A vote of 0 means no requirement; leave the clock at its minimum.
+	 */
+	rate = icc_units_to_bps(dst->peak_bw);
+
+	return clk_set_rate(cp->clk, rate);
+}
+
+static void qcom_camnoc_remove(struct platform_device *pdev)
+{
+	struct qcom_camnoc_icc_provider *cp = platform_get_drvdata(pdev);
+
+	icc_provider_deregister(&cp->provider);
+	icc_nodes_remove(&cp->provider);
+}
+
+static int qcom_camnoc_probe(struct platform_device *pdev)
+{
+	struct qcom_camnoc_icc_provider *cp;
+	struct icc_onecell_data *data;
+	struct icc_provider *provider;
+	struct icc_node *node;
+	unsigned int i;
+	int ret;
+
+	cp = devm_kzalloc(&pdev->dev, sizeof(*cp), GFP_KERNEL);
+	if (!cp)
+		return -ENOMEM;
+
+	cp->clk = devm_clk_get(&pdev->dev, "camnoc_axi");
+	if (IS_ERR(cp->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(cp->clk),
+				     "failed to get camnoc_axi clock\n");
+
+	data = devm_kzalloc(&pdev->dev,
+			    struct_size(data, nodes, CAMNOC_NUM_NODES),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->num_nodes = CAMNOC_NUM_NODES;
+
+	provider = &cp->provider;
+	provider->dev = &pdev->dev;
+	provider->get_bw = qcom_camnoc_get_bw;
+	provider->set = qcom_camnoc_set;
+	provider->aggregate = icc_std_aggregate;
+	provider->xlate = of_icc_xlate_onecell;
+	provider->data = data;
+
+	icc_provider_init(provider);
+
+	for (i = 0; i < CAMNOC_NUM_NODES; i++) {
+		node = icc_node_create_dyn();
+		if (IS_ERR(node)) {
+			ret = PTR_ERR(node);
+			goto err_remove;
+		}
+
+		ret = icc_node_set_name(node, provider, camnoc_nodes[i]->name);
+		if (ret) {
+			icc_node_destroy(node->id);
+			goto err_remove;
+		}
+
+		node->data = (void *)camnoc_nodes[i];
+		icc_node_add(node, provider);
+		data->nodes[i] = node;
+	}
+
+	/* Link every master to the single CAMNOC AXI slave. */
+	for (i = 0; i < CAMNOC_NUM_NODES - 1; i++) {
+		if (camnoc_nodes[i] == &camnoc_slave_axi)
+			continue;
+		ret = icc_link_nodes(data->nodes[i],
+				     &data->nodes[SLAVE_CAMNOC_AXI]);
+		if (ret)
+			goto err_remove;
+	}
+
+	ret = icc_provider_register(provider);
+	if (ret)
+		goto err_remove;
+
+	platform_set_drvdata(pdev, cp);
+
+	return 0;
+
+err_remove:
+	icc_nodes_remove(provider);
+	return ret;
+}
+
+static const struct of_device_id qcom_camnoc_of_match[] = {
+	{ .compatible = "qcom,sm8250-cam-virt" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_camnoc_of_match);
+
+static struct platform_driver qcom_camnoc_driver = {
+	.probe  = qcom_camnoc_probe,
+	.remove = qcom_camnoc_remove,
+	.driver = {
+		.name           = "qcom-camnoc-icc",
+		.of_match_table = qcom_camnoc_of_match,
+		.sync_state     = icc_sync_state,
+	},
+};
+module_platform_driver(qcom_camnoc_driver);
+
+MODULE_DESCRIPTION("Qualcomm CAMNOC interconnect driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

