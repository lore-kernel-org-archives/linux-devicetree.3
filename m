Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710413CD8A7
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194212; cv=none; b=sgrU6n9+F+z6v2LL4a3Z1TtAaXbwThcppy+Kp/noTa9SNNAYHWXoC2StlXN+5KzRFBIIStJqdpLMUxJ0CpUWIawZt5xBVeGz/kx1Q4JZsQy8ypSWAAaCmsUZ36mQrbI7OcNxL1gOlu821GO+waD7jv0jDP0wjEwObkH2mnGQrho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194212; c=relaxed/simple;
	bh=3/PXA8vkhOv7EJKuy7xYJV6ch+FY6mnuT3BK3IazYV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VS/W8eKsCPQsDEDExFjGAdLVj84k9BvghBFt1bjLouh6wO3jrT6nThFGZfCyKqYV27/0uA4C0CJer4KGOt87qGAJ4BpM8fmySeSA/4OATn8axnc2ILz/BmQLE4XcbnsJwAw/OJYgfalaLXtWViNlhLVRsdbFWrgsXsA9xtUrNg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTHU3Hzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CuMx8bMg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTHU3Hzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuMx8bMg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647JD9s02183011
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NNvpJoXiOTAqnoe0lRn4vTv9RKO5efKsHYJSTSQ49gc=; b=TTHU3HzfnLQX9hOb
	tMyE/tUP7kxxNeaiWJTHOm9ekM+e+Dr98sLps8N3230KYu/N9nEkbdZ/tx/QrAp+
	kSxtAKre56rqMJM6mDB7TziQ60VV8xPiapxT9pIrhiK7WU9pLRi1NAfZ7mJQjPjR
	RQjl0Gm8bgjKpSgCrNBQXM3ivF3DgMXL0HmDfP7UIh81T3Ue8plvbNE0Yc/SkKcl
	ziezxCyv7ayDH72hv2sBOF5fBeVTwM5irGkQTnumQLhfkP4tsl9ElT40AU/vEKcA
	Q0OlEyWH9S22r7uZtfV9oafaugERuER2g7Ls35+oz21AwHLz42lmGXaPscVHRyeL
	V112HQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10py8m4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95ccfd9b58dso2083132241.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194208; x=1778799008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNvpJoXiOTAqnoe0lRn4vTv9RKO5efKsHYJSTSQ49gc=;
        b=CuMx8bMgkH/V3CjKiCwBNPb6YUrqiRkEA9VutR3Gp0QRU5ly9lC4+izqJBFohk/AI7
         YvRZ6jdqQWJOwU4F1rr3B7SHYBaAcM5WYMcAsBDru/q54Dcv5KfEy9g9I3LxZXyynh86
         RW7OdFdaHi4laD7QXJTBX7z3yWjigeGKsU1Cl1bspsP+N0m4NNf5oGIrT59UVgwbQIc/
         9rkhqy0l1IP21+NdhzWBUxq8DQHXVdCdDCr1CheMWU8be/iVpjKh7kR1nl0IJ9AXyRI8
         IH7JOL7LZIxfKDrNAiJev0R4y+v/hBBtJDmd36Bv2veArPTHMGw7+HxWZJl2o+3dlJUy
         /hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194208; x=1778799008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NNvpJoXiOTAqnoe0lRn4vTv9RKO5efKsHYJSTSQ49gc=;
        b=gIF3Zih/LecStgfIeov9f76lfIo6OlhkKlJtiw9yJ0tcDgguYcb3bVQrEdl0LjzGQT
         4YKdxMbJjQWaHWLmYME4zNhEYp7GACxLJ50wczUsrOmE0v1Nmep+R2PmhxyKbHIac9fU
         r2BF7T0Owrj5DkIOwMFWkOLktdizYgVczij/Mu0aRV0TCCrnHjWsp0aCmEbjqksHK8iS
         66zfm7uO/taWAnCriXNvxWTr8v0HAqCScWuiO6vNmMSGyyqOmX0PJ4O/xGFYK5nNmBt/
         QsBwiYfWl7xDcsguPNze/IwsrPVdOFU6+kiTIdcBEL4vUAWF0yxF6nO6C55mIK5HZcgp
         PIFw==
X-Forwarded-Encrypted: i=1; AFNElJ9cVFaWJkvzJrBWpctPuwG8Tx4EYt7Sv0jf3Af6IrMy3++GjsWC+ELA6jXqQ5XtCt6TYcR/p4emO0CA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qD+x2ZA70rZFMPy6b5s9ma5gNrw5ONhJdUY+gxfgap/zJDwI
	KGn+fI3bq9Woo607Jg42znbQGTIMfbpRonOrXb6L0bLGSgPY7X0LHahVrTxlo3xCOeTNW/My6bq
	4pp0IUOpGxgsKK3LOd1T6AtqWjnmAw5k4BK+ttIeJUoDYgk+KCWouvZAW+L6xTJg1
X-Gm-Gg: AeBDiesBVriPFd9EgiAvEaHHgm22RL4MO9dwiMkMXZrO8Oh1lrVVP62JlaY+ajfWnfD
	weV8GIC08ZsDWSM+oni8AVoZsleEqqr1rs6tUw8HDmU+/+IzYf7GkYXqLCvMOH2kToBgnNXLR9d
	4n08QwKRgpOetbU2tRQJoAUJRmi+p35jjSUiGx9ZHOv4vXVicuUdaWOoe1YiDBdddv6cVugdW3o
	9YXoP9sSk2deNzPPkbFGgftmnaIFviFurulDpQ9a30Ibc2kBfU2wMxTzGJvUVDMA/8DQ56TTBY6
	7MQkALRJwySzdA4UXVNgk5N7c8SPIA1/W6RwGaV4mEp7lOWqEAicHaaNGif3ppAzGV+3Eunq47H
	k03LACBxt76jCaagjGSnkFziyOvhF1t7DPLa/8xK8kzeI1tySRrpAxCsb5TzUVX473rEGEaMNdd
	3niyKbAR/yMutYYTQIQ/fbOO0XCJg=
X-Received: by 2002:a05:6102:3048:b0:614:bef5:637c with SMTP id ada2fe7eead31-630f8c2bb7dmr5807138137.0.1778194207828;
        Thu, 07 May 2026 15:50:07 -0700 (PDT)
X-Received: by 2002:a05:6102:3048:b0:614:bef5:637c with SMTP id ada2fe7eead31-630f8c2bb7dmr5807109137.0.1778194207421;
        Thu, 07 May 2026 15:50:07 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:16 +0200
Subject: [PATCH v3 01/15] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-1-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fd1720 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KmNvnciZBadtvzOit0AA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: RTAF6BlHT6MbVqIc5iv6a9D0LM-Tuj5P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX5pONjoD6vbfX
 GZASUhdXRKmMsJbcI4mC3xrOahNE8niZqlte8mqCSDtfvLk2In6b3RDN4k4DL09M113PS8MUN5u
 bK0yuSTx9UEMOth7B/a8c8fZchKCN8MdjJYiXkzP0vp0I396p6m1Lwgr3LXhaY5/0aa66Y1Ksx3
 RiFtvs7JagX4PJ6EtywGI24iQWYUN6AiKGRzZjE/n3Q8be03Es/CbrIthFSZH8Tno0M808KvKG8
 wnn2r4lusYCGExnaDFk+JlDYVYkrkfXdKa1K16XP/gdnxTaZ2e9JKy/dMo2OMFVOASGfydrMA3i
 8Jb49cdxPhNWtDSfVNJ1Oit2jgQtebkZrKcscT2oVTXmp/c1EgNWFIrMgwYk+AL1l+BoWzsbG+d
 YYiOvucxd5LU68vrYBfeRO9PiSeO6XVKMAUw5qJn9BIq0rSapCumU2YDkXMl/GormozqVg0o2HD
 uQsQVweKIieOhKvDR6A==
X-Proofpoint-ORIG-GUID: RTAF6BlHT6MbVqIc5iv6a9D0LM-Tuj5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231

Add optional PM clock support to the CAMSS driver using the PM clock
framework. This allows CAMSS clocks to be registered once and
automatically managed during runtime suspend and resume.

This is especially useful for global CAMSS clocks that are shared across
multiple CAMSS subnodes. Now that CAMSS is modeled as a simple-bus,
these clocks are automatically enabled whenever a child node becomes
active.

This avoids the need for each subdevice to reference and manage the
shared clocks individually. A typical example is the set of clocks in
the top_group, which may be used by CSID, PHY, CCI, OPE, and other
CAMSS blocks.

Introduce a small PM clock descriptor table in the CAMSS resources
structure to describe clocks and their optional rates. Initialize
these clocks at probe time and delegate clock ownership to the PM
core.

Hook PM clock handling into the runtime PM callbacks to ensure clocks
are properly suspended and resumed alongside power domains and ICC
paths.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 41 ++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 36c601c595053ddad8d327b1416d7ff587920174..c37d5bfb4072d4d94a8abd453b89c9aad7e15001 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -18,6 +18,7 @@
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_clock.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -4592,6 +4593,36 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+/*
+ * camss_init_pm_clks - register shared CAMSS clocks with the PM clock framework
+ *
+ * Clocks listed in res->pm_clks are shared across all CAMSS sub-devices (e.g.
+ * top_ahb, axi). We kept them on for the lifetime of any active child, managed
+ * automatically by the PM framework.
+ */
+static int camss_init_pm_clks(struct camss *camss)
+{
+	struct device *dev = camss->dev;
+	unsigned int i;
+	int ret;
+
+	if (!camss->res->pm_clks[0])
+		return 0;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
+		ret = pm_clk_add(dev, camss->res->pm_clks[i]);
+		if (ret)
+			dev_warn(dev, "failed to add pm_clk %s: %d\n",
+				 camss->res->pm_clks[i], ret);
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -4674,6 +4705,10 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	ret = camss_init_pm_clks(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_of_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -4981,7 +5016,7 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
@@ -4991,6 +5026,10 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 	int i;
 	int ret;
 
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9d9a62640e25dce0e8d45af9df01bbfd64b9bb4b..44599abce4a850afa7cf0e38c453c4a7b54e4e25 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -103,6 +103,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const char *pm_clks[CAMSS_RES_MAX];
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.34.1

