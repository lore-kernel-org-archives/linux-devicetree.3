Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908E23F39CE
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000616; cv=none; b=CD9n9t9S9sNmImlc3YF4L2X4VWV6DKijw89HcTlZk36+6dGnlzHar4yeihjXKcT4JLVJ3K4KNNe3zCla41nWur/HV4kuFWzsMkgRJcqnv5mhcsYFma03G7CKDyx3k4gZS6LEnlTyZiUNYoj6+SXLfqxgNs2c1aMunuhxYrQC7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000616; c=relaxed/simple;
	bh=Vgpcm917rI9AZrXT6kF/x9okjO0L2rzuk+62qAXi46c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRMc/BVFUJm+3AkuEvyK8oWImCVU+FESMPudFAZ47VCtFOMpZ45gR56sKeXpT7F3vO7HSLJB1l/NQHWM2RSJIIo/LL8vzHqklxh2lIHYGcXC4rWzCoGtJVOwVard4b2EBBnKhsTpV8EcO5cWf9y5unms+fARb9v9efOR8YUVxvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prTT0DVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wz/EeXg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prTT0DVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wz/EeXg7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vDHb1907344
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 10:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjwWogEPwpKGwvQdDpP2g/5MCS2LNqM/7Nc3Uixz8zg=; b=prTT0DVpy46+BNts
	Qfl1PDFGUjsjqXqvTsv0XYQDNNaOOUJqktHXkmUYdonpfhFQPVv/c9WAMMFPDVAR
	VRTI92i5euj61Ys/yEAbDGsNZZUEZhA59+MKgz11TPYade4lHC54K99ulyhiaAFl
	QRPjDQRvVxD7KIrbt806HrXDt/dmSq/jHdu7gMXAb1izEA6kKFxs6z9CHWxtHH71
	HsrugnCyEaIvW3gkiMRistxkEZddbij2mZxypttVl3YvPh6iVw+PmBeUcAt3lEbX
	JH9yvi/CFkzkoxVwMArXKNXv2QTgE46pIi4cPLYsZbeT973FUbt/bWL8M66oVi+w
	vjcHCA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jr8x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:23:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c20f7581so58248885ad.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000614; x=1781605414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjwWogEPwpKGwvQdDpP2g/5MCS2LNqM/7Nc3Uixz8zg=;
        b=Wz/EeXg72SgQwxWHKIASYaRPJ0Jw8s3ke/LJYam7V3gR2fQm6iRYiDIVbxRKoVudbi
         7acLIUSJVgwRa39qmRgoc0EBa8RFgxNAOl+6+LhVXGHmTLO1fLXBaZ9e8D+mbN88gshV
         vQnsAyrttIN6oEVNixQcq+osmi+Y+yzSGtS5npnUBqoCgeTsM+JmZYwIgZP8fM+tNs3y
         vJyWU00T7hQpg/N1UG7AsBW9vWYFgdmGzWE5YNCKSMAOcKmTeRG4/iCK2rIx3rzrsFMS
         gwOxgA1KoCAM7rAl/fJqzikoilLjl3xLtN0GkJDuA2+Mnyen+y/593EP8s5PbzvWQwrD
         Dryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000614; x=1781605414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hjwWogEPwpKGwvQdDpP2g/5MCS2LNqM/7Nc3Uixz8zg=;
        b=l6tMW2eAUYIUSXv0nvd74Nd1UM1siGkQdIw4i/wPccoP2aWpdGd1ANmQo2vQbwg+GG
         QfsgwAAVCpnPE7F3qWmLHaFd9HMoD8DRLswTp+aG0KH6BsYMFaVWXhzqWTiEUW0PYmbR
         2Hpxte9iKli0mompe0RM4PSyyor9Zhe+rycomKHrohCiMLMScK4YiIhuLpnMpo30iV3q
         iYa4UTwLzP5+9+nP6+1WFoCu35BdBERSa2uHde2QfFLNkOV/09y47TsBpGfyxH4L/LCE
         YIj+2ErrWdJQ6EGHd+cCTR+J8eDej5QJ/yH415iqNf9r8nnSLWtT3bANIenr4uiEAO1i
         lSOw==
X-Forwarded-Encrypted: i=1; AFNElJ8IS2TrWQ3tboZa7hteIXdbRBUnQuS2dpClFQ4M/RaDRhgc5FKgKkw4CU1lKmyMWEq2pdR0xNkm0Tzk@vger.kernel.org
X-Gm-Message-State: AOJu0YzNM9sdfyq92+ZH8w9N3HlZImWkpIsH2BGkVEgnRPPnEFyxORCo
	iPKnU2j+PvTDII1PaU+McdWnLOgod5m5H7Z4bI4qkqAJhXEC6ZeZJIPLPF5PhTgv14VLDayFAd6
	KQWJDFcVkMjZN9PcrX8lGLRuGMiElN+TaB5xuEmJ1LXWN/oZssIOk5pXl+7O5Uxss
X-Gm-Gg: Acq92OGYMXk95Jmp8auYXTXwp1O34/oBRIPNs7RfILJO0Mdw7nbr+mPPkULp//jtbJS
	TmuKQcjhE8N+2VOCybWXyTBAPOjO+1l7TIXM432PTNlLXi/E9U7wHskbddWqcj5exS/pDQVr+Ci
	RB27UHPhW9FC5fCVtPdHwEw69mEtXX57F5CsMJbNsqUym1nMJUOvt8491E/EDm1Tf6fboBpKrqr
	o73GxYnjOPSOfxUOebf/eSdTULEEgQiLBB9fMmxU9Qbx02ugxsb/WGtg+SD3mVAxmrxCrHHMAIB
	9Mdw7oxa3QMiuXHLDIiHXtHXlbs7gtKuGgg8LlTaAeAOs188+l0fkYbmUBviOqjKzik06h2Qsu3
	ZtZGQdLFiaecH94aD6y8Fj8KqKKX2WTNthoZTT7ET6JrqhBIrvqiIvKrpIs7P3g==
X-Received: by 2002:a17:902:ffce:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c1e80ebb9amr221575645ad.24.1781000614143;
        Tue, 09 Jun 2026 03:23:34 -0700 (PDT)
X-Received: by 2002:a17:902:ffce:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c1e80ebb9amr221575045ad.24.1781000613695;
        Tue, 09 Jun 2026 03:23:33 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:33 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:52:58 +0530
Subject: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal cooling
 devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=4010;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=Vgpcm917rI9AZrXT6kF/x9okjO0L2rzuk+62qAXi46c=;
 b=v1Ic0FXdRYOPlaKPI+tvvVuHSsoolHXtuOodAQ+nk3K/gvi09iOybzeNknDfxDjkSwPL+Oo0i
 2fN6D1GKrH7A8Knx+Ag7A1EekKeHIDSJojGPhQA9lhGc9Um7PcrPjJd
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: y8kpx7Ta1LW7yMUL69290f9ELTcmu3I3
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27e9a6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tEZXOP7woKDf_sZP_QwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX8fSsvDGoizhX
 JIiyKqYMbnA+zPq3tmNqUG/mRJ8UTyNHOwqNzOBWW5tywoJ+sfBWbvLH/9aPvgxCCYBXwVazjgT
 NIGNjGZyFacYX5oylOTcbv2bBXLwikC/4aTAt510RR/D7yGt/5mdyWXy2GL0G8b8nioZceBZnmn
 A0wZ7qA9ZeTlHRzBYGODrJKo/UjpCNuxGpsuKxrlWEIrns7CStghMquSspgVSoJhHhwQg8h09yW
 RvqsyryYiLPNFZqbJ2adZ/TGHQUHYdnCLiZD887EPGU5LG682WaTlL7uXEFVMF9KcIdvl/hWH2I
 284DXeMj2PIHTlL6C9zioL2hK33O6LJ7W7Ko/7QJT934qp/dXFtklmGXCck4xtoxtqtAfYq3y29
 qTRJW94lAYrESwUdtj0WbMPKsJ3LllrH+8djzgRYpOq8kaxwdt/fJu2G/57k83s3bQdmc8JyU/t
 kMIXvoLoA6ytadRVuMA==
X-Proofpoint-ORIG-GUID: y8kpx7Ta1LW7yMUL69290f9ELTcmu3I3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097

Add support for Thermal Mitigation Devices (TMDs) to enable
thermal throttling of remote processors through QMI.

This enables the thermal framework to request mitigation when remote
subsystems (modem, CDSP) contribute to thermal issues.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/remoteproc/Kconfig         |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 61 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c78e431b7b2d..cd8cc911e1be 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -228,6 +228,7 @@ config QCOM_Q6V5_PAS
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
+	select QCOM_QMI_TMD
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..1ad896de42fd 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Linaro Ltd
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk.h>
@@ -24,6 +25,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/qmi_tmd.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -120,6 +122,8 @@ struct qcom_pas {
 
 	struct qcom_scm_pas_context *pas_ctx;
 	struct qcom_scm_pas_context *dtb_pas_ctx;
+
+	struct qmi_tmd_client *tmd_inst;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -733,6 +737,49 @@ static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
 	}
 }
 
+static int qcom_pas_setup_tmd(struct qcom_pas *pas)
+{
+	struct device *dev = pas->dev;
+	struct device_node *np = dev->of_node;
+	const char **tmd_names;
+	int num_tmds, ret, i;
+
+	if (!of_find_property(np, "tmd-names", NULL))
+		return 0;
+
+	/* Get the TMD names array */
+	num_tmds = of_property_count_strings(np, "tmd-names");
+	if (num_tmds <= 0)
+		return 0;
+
+	tmd_names = devm_kcalloc(dev, num_tmds, sizeof(*tmd_names), GFP_KERNEL);
+	if (!tmd_names)
+		return -ENOMEM;
+
+	for (i = 0; i < num_tmds; i++) {
+		ret = of_property_read_string_index(np, "tmd-names", i,
+						    &tmd_names[i]);
+		if (ret) {
+			dev_err(dev, "Failed to read tmd-names[%d]: %d\n", i, ret);
+			return ret;
+		}
+	}
+
+	pas->tmd_inst = qmi_tmd_init(dev, pas->info_name, tmd_names, num_tmds);
+	if (IS_ERR(pas->tmd_inst)) {
+		dev_err(dev, "Failed to register '%s'\n", pas->info_name);
+
+		ret = PTR_ERR(pas->tmd_inst);
+		if (ret == -ENODEV) {
+			pas->tmd_inst = NULL;
+			return 0;
+		}
+		return ret;
+	}
+
+	return 0;
+}
+
 static int qcom_pas_probe(struct platform_device *pdev)
 {
 	const struct qcom_pas_data *desc;
@@ -855,12 +902,21 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
-	ret = rproc_add(rproc);
+
+	ret = qcom_pas_setup_tmd(pas);
 	if (ret)
 		goto remove_ssr_sysmon;
 
+	ret = rproc_add(rproc);
+	if (ret)
+		goto remove_setup_tmd;
+
 	return 0;
 
+remove_setup_tmd:
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 remove_ssr_sysmon:
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
@@ -883,6 +939,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 {
 	struct qcom_pas *pas = platform_get_drvdata(pdev);
 
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 	rproc_del(pas->rproc);
 
 	qcom_q6v5_deinit(&pas->q6v5);

-- 
2.34.1

