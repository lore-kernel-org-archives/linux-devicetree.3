Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46639BFFE
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499628; cv=none; b=FcaZ2wERBYOVLWdwN6DhssTlxTZmuTei2C58JmSFDvNpf5K6pfLtqrWxO9nlA3+QJMu97mvVGzZC5uimCX51yF5oj0avMx3exiNyZgfxramoP0x14kkpXIBtsF7P1KwvGZQF0cYSxW5D2SqK6/FOb9+6ydL2t2LPK1HX7n+F2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499628; c=relaxed/simple;
	bh=bNL0H2hWeXr0tfG6HNIYoivengRWnu6dSjQ54s86+uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LnpMcWXweSYt0tT0gSjm7pKIAiXz0iDczf/GBqoAEEMQN3Q/f7s35ubktxTTnLZ5MPBfzVI7c5f032VpJUciNiVcM2eu+pnWK9a3V6WL1gXgaEUDAb1AaRe5bOd/G5mvOl5qEf7Ux6kU4Lpeu8XsAg6YWKDOo5JOOC/d++cFv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYlX6gKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORWOi1ro; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYlX6gKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORWOi1ro"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PMHxnO3069769
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vda2dhwRjDl
	m0C0YacD+XddyVsj2VR9Xkvge/WTb1K0=; b=jYlX6gKEkdWzuqzaT969P/Wdb6n
	uF9mkatFwReZ3JTmcdxHeKYMc8shLokUl00qnVaAxqai5RB4aKhe+nlC2PA0B8Iy
	VXoutKsvr3e45ngw5tULrvP6Y1lWmn/NdzRRg5Xl/QjWye9zotlCTvExhJKFosZc
	Tmap1+gViIusoGhle9zVvEMO0ImAYwH3sSQ+MHWo9jcbxSLeyPtadzqe5XXg/O2L
	HGxDP7noI384EN5v6ypmj/u4fUkinXZumfl/mYpjcLavz9Yjr/tHBcDvaHGE3gPO
	TqE2QdRQ3ANQo0YJuHN1xp7YKAEPVpMWaTul+jwPCVga4u9sBBzuBz6PZYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn0wy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aed1beaa73so7306185ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 21:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499624; x=1775104424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vda2dhwRjDlm0C0YacD+XddyVsj2VR9Xkvge/WTb1K0=;
        b=ORWOi1royOAueXV2eiuTZY/9Xh6c+W8rrZDDOsjcIblJM0IX3L7nkYAg1G/0XjJ3Uk
         ECZoj6ePZNjdqlz+aGQepXUcy03v7ompFBZMFed/s0D/Hy9EEn9kdZ6zfFBuB0RFTAsi
         jEgtq3teUAp7lD1NrUzmGNi8Q/AKrdlMAFtdqgOw/Q9PJtpPZ0xtOExresFeLtX5fqeO
         IQphT6PiULIHK6Fpnx6t3AOm3vhKV0uNIJNABmOu3K6PFboJ7SuNaiLhGNzvJJLvbbQp
         4OQ2QG1cUmauyaeL3vAYTqGTqBiJQgbUnQXwyPyEI8YW+kFpQITGWlF6Ug56lPVYb17K
         4sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499624; x=1775104424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vda2dhwRjDlm0C0YacD+XddyVsj2VR9Xkvge/WTb1K0=;
        b=CBG1fr84cCb3oMOS6CNcWhHCVUu0QAMeJ/CRna37PQJUtJo85xGzxP5LA869FdEcCe
         V1adcJ2ndbg/6hEmnoNg4aYl/fBnkY8iIESwlqtkST8M1zU19JZaBAq7MHCWlH+vqN9e
         u4qE8UqVpJEPLakzadV5M+vpRIlCmxUknJXOBaPRB22Etnq5RjD3e1bofGtA6GYHV1qW
         YBUneLUHvPh+UmlvoN5utSDO1pudTVSq2GYqW4yLZDGWp3/2ykUkOl6Rc1Av2j743Bw1
         cfVFwv25NDspdbOQJrSLGtQT8J1QHRzgQnMAFZ++/yGxq1huAV/0OydhrLPh0c9WKXzV
         zORQ==
X-Forwarded-Encrypted: i=1; AJvYcCUreqGdlvkh1FZGfKS6g7ezg+xS17s+OIPNgIU5lBKbxkov52ZXwY9aR+Xillhan5f/ISSUlyZWn1/3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp2Glqyp7E9MRIozURSeZkTfS02cveukoFDVfd8sFgG0msDh4z
	Ernz3V4nGfp/eoqGoy52aPVs+Bw43iOlK+4yXyhLXznnn49AKqswQ7GV60/yjoNbCrgspXH42O/
	rT51SEAy0WAxHDViXV1DWvSjL/vlufhZ1u5/IhoRJ0cvUKdv+Zsxyalg+45fdaXaLYKW6s/pZ
X-Gm-Gg: ATEYQzyPIfq/Na95GNMG8Z32z+ROrRqpITzwT0LAPkQA0KZ47Xbey79EupILIdMpqIA
	QwQR1Aw0/wq98dZi3H/3Fg538rb4g/8OCcAqZP7ilBjce0y5Es4+NnIc6pjSsa1LDjpL8/NeT09
	P3ZuGCrST4rALyS6RJXMmN+wLgimvMhns4fYosnJAxC2I9URc5wgPINCIHAeHP67VUSQq+Woiv9
	mpSqGkYHt0Xyg6aX6CEIkZ6dlMFukYLgqcwtk7JqaPiUInevyorOO9uQRrZX1NKZCe3KdYX9aTa
	mSh+gSHJtXQrrPqpB25VzJcVPGi5t6CCU1vJ+hwk3TcI/Zb9Y0V06JFMVDebdvC9HS/quIHEQ1x
	zd/qmyXerac1s94YjkDVls+RzIo/P2nwjxQuvCSntK/s1FAKldAOHkeElhm4MBOkVAtOM3/pvKO
	sJpdWyAay+PVaRKbzkUTACjHARWtMK+Ojsumhq50FfYfE4gFrW2/0=
X-Received: by 2002:a17:903:22d2:b0:2b0:67a4:fbe8 with SMTP id d9443c01a7336-2b0b0b332fcmr70716385ad.40.1774499624133;
        Wed, 25 Mar 2026 21:33:44 -0700 (PDT)
X-Received: by 2002:a17:903:22d2:b0:2b0:67a4:fbe8 with SMTP id d9443c01a7336-2b0b0b332fcmr70715975ad.40.1774499623482;
        Wed, 25 Mar 2026 21:33:43 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 3/6] remoteproc: qcom: add hexagon based WCSS secure PIL driver
Date: Thu, 26 Mar 2026 10:03:17 +0530
Message-Id: <20260326043320.2507890-4-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c4b729 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=2haS3Ga0fGOBmvNocw8A:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: iFFPZrw1-j8mOF7UXKiT9tyGpOwrKS_W
X-Proofpoint-GUID: iFFPZrw1-j8mOF7UXKiT9tyGpOwrKS_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX7sRuD6hmLKob
 KlgQI4PVbTEiB8sIzj7tA7t1TgwFDLFPavSmC/8X7TJJlQAKz+88MIpONuH1x1bB8QPatU7YsR/
 R4EeYeoOEPm+STqztuzP4erTR2YQuBnjsF88J75H/R8ROhdh4brbUxsl/Lk+dXx5cbquAFZXPIa
 v6Ert/F77cLSRm5RzokmY5o6gefHS6GmMkWaP4IZLowx05iH0dGhUoehHDy5i34BmiUXos+ac32
 h7SrEIRCztvpE2Z55AA2O7OyxvgBeSIaxnT8Yo0utlNogRQNBD+GUkl8Vi9cRhCFZDaHmuDBX/6
 TLR3GdBj/m7KQ7ntBaGLJmFTjBujnEPO5iXFTyL7mCN8XBcIHCM93916IqSb6yGpWYNgJ5eSHZA
 IAi11gjCnzpxJ6eQuflXnvMg682YZihKOlhKF8Qw/gZbwARCmKALEy9s/gcUqo1nWgyIV2TMf5z
 9YvxFh97JXoyFN9aCOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032

From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
SoCs support secure Peripheral Image Loading (PIL).

Secure PIL image is signed firmware image which only trusted software such
as TrustZone (TZ) can authenticate and load. Linux kernel will send a
Peripheral Authentication Service (PAS) request to TZ to authenticate and
load the PIL images.

In order to avoid overloading the existing WCSS driver or PAS driver, we
came up with this new PAS based IPQ WCSS driver.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v11: R-b Dmitry Baryshkov
v10: Remove unused members from 'struct wcss_sec'
     Remove glink and ssr subdevices if wcss_sec_probe() fails

v8: Dropped ipq5424 support.
    The comments related to 'use_tmelcom' in [1] not applicable
    [1] https://lore.kernel.org/linux-arm-msm/72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com/
    Changed copyright for drivers/remoteproc/qcom_q6v5_wcss_sec.c
---
 drivers/remoteproc/Kconfig              |  19 ++
 drivers/remoteproc/Makefile             |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c | 325 ++++++++++++++++++++++++
 include/linux/remoteproc.h              |   2 +
 4 files changed, 347 insertions(+)
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index ee54436fea5a..a1e322107b2e 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -256,6 +256,25 @@ config QCOM_Q6V5_WCSS
 	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
 	  a non-TrustZone wireless subsystem.
 
+config QCOM_Q6V5_WCSS_SEC
+	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
+	depends on OF && ARCH_QCOM
+	depends on QCOM_SMEM
+	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
+	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
+	select QCOM_MDT_LOADER
+	select QCOM_PIL_INFO
+	select QCOM_Q6V5_COMMON
+	select QCOM_RPROC_COMMON
+	select QCOM_SCM
+	help
+	  Say y here to support the Qualcomm Secure Peripheral Image Loader
+	  for the Hexagon based remote processors on e.g. IPQ5332.
+
+	  This is TrustZone wireless subsystem. The firmware is
+	  verified and booted with the help of the Peripheral Authentication
+	  System (PAS) in TrustZone.
+
 config QCOM_SYSMON
 	tristate "Qualcomm sysmon driver"
 	depends on RPMSG
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 1c7598b8475d..08705ef62bce 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
 obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
 obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
 obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
+obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
 obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
 qcom_wcnss_pil-y			+= qcom_wcnss.o
diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
new file mode 100644
index 000000000000..10a69fcd20f0
--- /dev/null
+++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/clk.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/io.h>
+#include <linux/mailbox_client.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/soc/qcom/mdt_loader.h>
+
+#include "qcom_common.h"
+#include "qcom_q6v5.h"
+#include "qcom_pil_info.h"
+
+#define WCSS_CRASH_REASON		421
+
+#define WCSS_PAS_ID			0x6
+#define MPD_WCSS_PAS_ID			0xd
+
+#define Q6_WAIT_TIMEOUT			(5 * HZ)
+
+struct wcss_sec {
+	struct device *dev;
+	struct qcom_rproc_glink glink_subdev;
+	struct qcom_rproc_ssr ssr_subdev;
+	struct qcom_q6v5 q6;
+	phys_addr_t mem_phys;
+	phys_addr_t mem_reloc;
+	void *mem_region;
+	size_t mem_size;
+	const struct wcss_data *desc;
+};
+
+struct wcss_data {
+	u32 pasid;
+	const char *ss_name;
+	bool auto_boot;
+};
+
+static int wcss_sec_start(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	ret = qcom_q6v5_prepare(&wcss->q6);
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_pas_auth_and_reset(wcss->desc->pasid);
+	if (ret) {
+		dev_err(dev, "wcss_reset failed\n");
+		goto unprepare;
+	}
+
+	ret = qcom_q6v5_wait_for_start(&wcss->q6, Q6_WAIT_TIMEOUT);
+	if (ret == -ETIMEDOUT)
+		dev_err(dev, "start timed out\n");
+
+unprepare:
+	qcom_q6v5_unprepare(&wcss->q6);
+
+	return ret;
+}
+
+static int wcss_sec_stop(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	ret = qcom_scm_pas_shutdown(wcss->desc->pasid);
+	if (ret) {
+		dev_err(dev, "not able to shutdown\n");
+		return ret;
+	}
+
+	qcom_q6v5_unprepare(&wcss->q6);
+
+	return 0;
+}
+
+static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
+			       bool *is_iomem)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	int offset;
+
+	offset = da - wcss->mem_reloc;
+	if (offset < 0 || offset + len > wcss->mem_size)
+		return NULL;
+
+	return wcss->mem_region + offset;
+}
+
+static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
+			    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
+	if (ret)
+		return ret;
+
+	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
+
+	return 0;
+}
+
+static unsigned long wcss_sec_panic(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+
+	return qcom_q6v5_panic(&wcss->q6);
+}
+
+static void wcss_sec_copy_segment(struct rproc *rproc,
+				  struct rproc_dump_segment *segment,
+				  void *dest, size_t offset, size_t size)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+
+	if (!segment->io_ptr)
+		segment->io_ptr = ioremap_wc(segment->da, segment->size);
+
+	if (!segment->io_ptr) {
+		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
+			&segment->da, segment->size);
+		return;
+	}
+
+	if (offset + size < segment->size) {
+		memcpy(dest, segment->io_ptr + offset, size);
+	} else {
+		iounmap(segment->io_ptr);
+		segment->io_ptr = NULL;
+	}
+}
+
+static int wcss_sec_dump_segments(struct rproc *rproc,
+				  const struct firmware *fw)
+{
+	struct device *dev = rproc->dev.parent;
+	struct reserved_mem *rmem = NULL;
+	struct device_node *node;
+	int num_segs, index;
+	int ret;
+
+	/*
+	 * Parse through additional reserved memory regions for the rproc
+	 * and add them to the coredump segments
+	 */
+	num_segs = of_count_phandle_with_args(dev->of_node,
+					      "memory-region", NULL);
+	for (index = 0; index < num_segs; index++) {
+		node = of_parse_phandle(dev->of_node,
+					"memory-region", index);
+		if (!node)
+			return -EINVAL;
+
+		rmem = of_reserved_mem_lookup(node);
+		of_node_put(node);
+		if (!rmem) {
+			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
+				index, num_segs);
+			return -EINVAL;
+		}
+
+		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
+			&rmem->base, &rmem->size);
+		ret = rproc_coredump_add_custom_segment(rproc,
+							rmem->base,
+							rmem->size,
+							wcss_sec_copy_segment,
+							NULL);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct rproc_ops wcss_sec_ops = {
+	.start = wcss_sec_start,
+	.stop = wcss_sec_stop,
+	.da_to_va = wcss_sec_da_to_va,
+	.load = wcss_sec_load,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+	.panic = wcss_sec_panic,
+	.parse_fw = wcss_sec_dump_segments,
+};
+
+static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
+{
+	struct device *dev = wcss->dev;
+	struct resource res;
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret) {
+		dev_err(dev, "unable to acquire memory-region resource\n");
+		return ret;
+	}
+
+	wcss->mem_phys = res.start;
+	wcss->mem_reloc = res.start;
+	wcss->mem_size = resource_size(&res);
+	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
+	if (!wcss->mem_region) {
+		dev_err(dev, "unable to map memory region: %pR\n", &res);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int wcss_sec_probe(struct platform_device *pdev)
+{
+	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
+	const char *fw_name = NULL;
+	struct wcss_sec *wcss;
+	struct clk *sleep_clk;
+	struct clk *int_clk;
+	struct rproc *rproc;
+	int ret;
+
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0)
+		return ret;
+
+	rproc = devm_rproc_alloc(&pdev->dev, desc->ss_name, &wcss_sec_ops,
+				 fw_name, sizeof(*wcss));
+	if (!rproc) {
+		dev_err(&pdev->dev, "failed to allocate rproc\n");
+		return -ENOMEM;
+	}
+
+	wcss = rproc->priv;
+	wcss->dev = &pdev->dev;
+	wcss->desc = desc;
+
+	ret = wcss_sec_alloc_memory_region(wcss);
+	if (ret)
+		return ret;
+
+	sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
+	if (IS_ERR(sleep_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sleep_clk),
+				     "Failed to get sleep clock\n");
+
+	int_clk = devm_clk_get_optional_enabled(&pdev->dev, "interconnect");
+	if (IS_ERR(int_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(int_clk),
+				     "Failed to get interconnect clock\n");
+
+	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
+			     WCSS_CRASH_REASON, NULL, NULL);
+	if (ret)
+		return ret;
+
+	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ss_name);
+	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ss_name);
+
+	rproc->auto_boot = false;
+	rproc->dump_conf = RPROC_COREDUMP_INLINE;
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
+
+	ret = devm_rproc_add(&pdev->dev, rproc);
+	if (ret) {
+		qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
+		qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, rproc);
+
+	return 0;
+}
+
+static void wcss_sec_remove(struct platform_device *pdev)
+{
+	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct wcss_sec *wcss = rproc->priv;
+
+	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
+	qcom_q6v5_deinit(&wcss->q6);
+}
+
+static const struct wcss_data wcss_sec_ipq5332_res_init = {
+	.pasid = MPD_WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+};
+
+static const struct wcss_data wcss_sec_ipq9574_res_init = {
+	.pasid = WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+};
+
+static const struct of_device_id wcss_sec_of_match[] = {
+	{ .compatible = "qcom,ipq5018-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
+	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
+	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
+
+static struct platform_driver wcss_sec_driver = {
+	.probe = wcss_sec_probe,
+	.remove = wcss_sec_remove,
+	.driver = {
+		.name = "qcom-wcss-secure-pil",
+		.of_match_table = wcss_sec_of_match,
+	},
+};
+module_platform_driver(wcss_sec_driver);
+
+MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..7b2159853345 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -472,6 +472,7 @@ enum rproc_dump_mechanism {
  * @node:	list node related to the rproc segment list
  * @da:		device address of the segment
  * @size:	size of the segment
+ * @io_ptr:	ptr to store the ioremapped dump segment
  * @priv:	private data associated with the dump_segment
  * @dump:	custom dump function to fill device memory segment associated
  *		with coredump
@@ -483,6 +484,7 @@ struct rproc_dump_segment {
 	dma_addr_t da;
 	size_t size;
 
+	void *io_ptr;
 	void *priv;
 	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
 		     void *dest, size_t offset, size_t size);
-- 
2.34.1

