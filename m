Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF43D47B2
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786103421; cv=none; b=ccaroVBqNyNg3i8a2nqOHPQRbo1Wa8tHlaF9h55xAIvKRno9W+6ohwaP0DmkbDxaZCSsL4YYOx26XHzsKb+UEWVtxXMZDcfYbQl43XVdR8Y2okUvcTsxM3qVHlunpKFZBv0mpsogtp1kxYU/ZuN7d+8m4Cr2Dxh4iNYAY+4x+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786103421; c=relaxed/simple;
	bh=4CmrAYKHp1Lj7cyPBcomvd8gdC7FB3hmUzd+wvp1kzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tarB2PdmqccbHN7WHs3zrXAjZqU2Xo3TLFcDn5T/FZHWYmkcKtnxxj8FwSGlFpobS7Ag9WXIkP6RJog0RpiGxOVXjl6b6xhoyDVWRqF8fQKX4/1YHAAW2S8rBUySDiptIg0vKmixOj/gbh4k7TD5YHfJbHTpxM9R95sr2rvu0+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVZ4GwYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WF2hOL6I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVZ4GwYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WF2hOL6I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777p9mH3829286
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 11:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zwZSf2cdgc9vmRwcU4CDp3Ze8ejsg5Z5vyAf9z1BAQc=; b=jVZ4GwYVhbzXfgl4
	26v/MJp3/Z1PyP01c7tRSAFsog4mZBPD2g1oSSQd3JiSeLYxdxiDEV855CfaA4ZQ
	ApoBKRWyQrEXNeeZ3UAqTZ07sWC/E/1ElYdvf1seyzKOuaPAY59oVNbkxO6exCCc
	o5mrNkNzyvsSEilqqo7FEgQOlovNxzq3p6HqUuvLg8gNQTGbk5ya+Qw9ci8oO468
	bvAdrXWyRhlFekq8QRJbMFDddx1eVzth88UZo2JYMa5q4aR8gye5mUzgHVlQ/VhR
	QREH3QHi2Nu/i/KIPSHUZODydMHeJ6vzyN7oE8pKEuUp3YOZ8qXUfN9zLxSEOnG5
	oExNeQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gutkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 11:50:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso37210061cf.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 04:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786103401; x=1786708201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zwZSf2cdgc9vmRwcU4CDp3Ze8ejsg5Z5vyAf9z1BAQc=;
        b=WF2hOL6IW1fc5Qtk1piZbxNcASLG5q4SUjmhaJeMZHi7nJR64Hbn3UrcqaHephTYYS
         7yDG7Wt7HrUA20qeVOsSlLS8pPi9Ohf7Fl+INswzZXxMvd+sZBPB6d2zWBfMEUQ11tWQ
         e1Iapuhf+tcOChiX3ib+BmMePZSACLMgB8ocJQ+0ymqY1LEnUIIcsXw80nR9loX2uAaO
         z34viVkZc7UrxcfNzyGYW4njaRYkArR8uUEGvrGrkYtcoEgQwnjXjfRIgJJ7oehPBfnC
         Idu70frp04tFY67CGgHYi2MH2iXRfDbDjhs+mI7uLe4WLdrqs8lfemN0/S5CKEA4cO2k
         qLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786103401; x=1786708201;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwZSf2cdgc9vmRwcU4CDp3Ze8ejsg5Z5vyAf9z1BAQc=;
        b=gKR2QkGLA6MzwwSUBlF+GpZA3X0jA5Wk8azOmI+X8mCTBCjDuuEoHGY9rKfgAIWtmW
         iPRYBy7Rl0qLlfZ4J8elk7cXSmWFBkTC5HS806bYES6HxuigoM+LPcUcm5eKIZd6p9VV
         3tsP99yk5yBqHKAVLTJcBfOqm5B9BkUdcVfWW/avs4Rmg1I511Fm/FnEitfT1aaE4KXZ
         GJ2NWAzsLSImqgATKLDJOApvliQ+YqnG712yqbcwwOAap8JakDx31S5KhQ/bwfoYuga8
         Jud8LV0k5qvEbIq9KEY8vo4JCtbOFAaqjoDLCCpptlAQRAmjg4xtRAqaPQh3nkm2GBOK
         sPLQ==
X-Forwarded-Encrypted: i=1; AHgh+RokqpYKmnLkxYDekGeFyOAxgAlqkFltrHAce2k7aiUZYbHIu9bS872Gf7oKPM8UvbEU8q/JRfhgC5b7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy8vtjsYTrS7UURU6tmcv35FFUNcbResuWLiuvU2c3q2RqN+q0
	o0BAJfh0Y830p1ouPZmxwH2voLFaXuwpjT0FyFd8yFnOfpCvg4CToAdKJYkcZYDiuQfJWO3wiZR
	4BoInMhjSE0MUU38sRMbIgOkoYTnejbnfy+qlUcNY4y4r3XxE3D1lVEOGNWBZQ1+D
X-Gm-Gg: AR+sD12cAbVuLKlZpqE8qzLR6V64zzRnuRplERFOOLCSaSQme7dF6zNRKNbvq1TuvR6
	i5VDEJ4LQOFSZkzz0S7zC3KZY982MFj7lY5tbn248xJKjVLVMiN1tLN+CouiUmc8n/F+xdNp96A
	l9/jJlV7Rq6s56wgh5XOOjeKPiV3x/9OSimjH4tBaE9Q37YsJmFIW1WD1TnOChR1nm0prDnZOgd
	zCbQ/xx+A6rpmwdQk+1ZJiuge3UGZ42GHaI9z7tFLnZa9TV31PpXfIYchnKjC1fuFesLIYz/PVM
	wZAJ9nLTf0B+8+MUE16T6KXy6zqf5vYQP1l2LpET8Coo6TbBRTRdz7dQCsh1A1kCHn/OtEhP0RL
	/Yblb2tTDIjUIAKc00486VAMI
X-Received: by 2002:a05:622a:5796:b0:51c:849e:e222 with SMTP id d75a77b69052e-52d1919d9f5mr23253911cf.36.1786103401442;
        Fri, 07 Aug 2026 04:50:01 -0700 (PDT)
X-Received: by 2002:a05:622a:5796:b0:51c:849e:e222 with SMTP id d75a77b69052e-52d1919d9f5mr23253151cf.36.1786103400918;
        Fri, 07 Aug 2026 04:50:00 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c9047esm43046266b.33.2026.08.07.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:50:00 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: djakov@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        odelu.kukatla@oss.qualcomm.com, raviteja.laggyshetty@oss.qualcomm.com,
        vivek.aknurwar@oss.qualcomm.com, quic_afilipov@quicinc.com,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 2/3] interconnect: qcom: Add CAMNOC interconnect provider driver
Date: Fri,  7 Aug 2026 14:49:50 +0300
Message-Id: <20260807114951.4164439-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807114951.4164439-1-atanas.filipov@oss.qualcomm.com>
References: <20260807114951.4164439-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a75c66a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=muAYhjqZ-AtuC14g7DYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: v6jW4ZMwdjFz0aBuALrtMozgo0LM-eVt
X-Proofpoint-ORIG-GUID: v6jW4ZMwdjFz0aBuALrtMozgo0LM-eVt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5MSBTYWx0ZWRfX4S14f2BOXoSK
 u7jd0d3pWSftFi2P2QsPZxlYuODBXE3QLr4TscwDMCNR9+B4I9Mw2JQI38l/RrNOFl98neMVF0z
 u6eYq7jGKp+bCi3q77de9l4/qMiLJfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5MSBTYWx0ZWRfXz40arH+I7tRd
 5+kVYhmv8/07xhcvm/Vf/gm2lx37KdzZ5DaZLJSdNEg3ZGEHlIfl1lTmvh9TCDsa931NT/DXgUV
 kcLhrTVPWWNXyvpnjtm+E9RFze+eDyeSb5kn8qUllIl10kjXeYDNunORWQB6EPL7kCHwGDnCitV
 GYOYqToZS6XQ+XvgAwKsjaQ2JOWgU6/yo6qJY+V4fUEzGF0Syexovl9GlbDkA//8VbFnzJTOhTK
 ccRWeuoaybmGdxU0vcLNjc1IyjlL5+A6J09Ik5+0e0vlkXGKLVt7+D4o5PQiz5Xu3RmgF2itopi
 vhhP0TlrabSMv5ipaz0rcZXGKcPOMRJGgJ63Pi+5fU+oTr6NXCWj7xSp+AXxyCtyuMa6mS2gFfS
 2AbjvKeVvkeCaeqz+Mkq8R7nYSt6me699+0ohf5yDXE1H1RjgtKLKtXFRFHFBE+h1AUfAJxTg8p
 a6ptSlGwnvY5nFCPBHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070091

The Camera Network-on-Chip (CAMNOC) is the internal AXI interconnect
within the camera subsystem. Multiple camera sub-devices share the
CAMNOC AXI clock. When each sub-device calls clk_set_rate() directly
on this shared clock, a last-writer-wins race condition arises: the
final caller sets the rate regardless of what other active consumers
require.

Introduce a lightweight ICC provider for CAMNOC that solves this by
leveraging the ICC aggregation framework. Each consumer obtains an
ICC path to SLAVE_CAMNOC_AXI and votes for bandwidth via icc_set_bw().
The ICC core aggregates all votes (max of peak_bw across consumers)
and the provider's set() callback translates the result into a single
clk_set_rate() call on the CAMNOC AXI clock.

Consumers encode the required clock frequency directly as peak_bw in
kBps (e.g. 400000 for 400 MHz). The conversion is:
  rate_hz = peak_bw_kBps * 1000

Implement get_bw() returning 0 for both avg and peak to prevent the
ICC core from defaulting to INT_MAX before any consumer has voted.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig       |  10 ++
 drivers/interconnect/qcom/Makefile      |   2 +
 drivers/interconnect/qcom/qcom-camnoc.c | 184 ++++++++++++++++++++++++
 3 files changed, 196 insertions(+)
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
index 000000000000..a5a484491515
--- /dev/null
+++ b/drivers/interconnect/qcom/qcom-camnoc.c
@@ -0,0 +1,184 @@
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
+static const struct qcom_camnoc_node camnoc_master_jpeg = {
+	.name = "master-camnoc-jpeg",
+	.buswidth = 16,
+};
+
+static const struct qcom_camnoc_node camnoc_slave_axi = {
+	.name = "slave-camnoc-axi",
+	.buswidth = 16,
+};
+
+static const struct qcom_camnoc_node * const camnoc_nodes[] = {
+	[MASTER_CAMNOC_JPEG] = &camnoc_master_jpeg,
+	[SLAVE_CAMNOC_AXI]   = &camnoc_slave_axi,
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
+	dev_dbg(src->provider->dev,
+		"CAMNOC set: aggregated peak_bw=%u kBps -> rate=%lu Hz\n",
+		dst->peak_bw, rate);
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
+	icc_link_nodes(data->nodes[MASTER_CAMNOC_JPEG],
+		       &data->nodes[SLAVE_CAMNOC_AXI]);
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

