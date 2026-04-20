Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA19351C2F
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702644; cv=none; b=DSPdcnZ+GHMtt8Y/IqSqx8hz6IU56A/s09DO1SaQAvFizxpIk/g6JlGJkIISOw37YqaKbzx9dHdy+jje5eIgdm7VgXgPO9M1LYR7m9dizg6GMgq5gOHu7V/dxDjYZjMiViqhWtlAJZelRg7PlqQoAX6efAl+lOSc9PAQHMiow/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702644; c=relaxed/simple;
	bh=DZ3KmwiHC5R0rNOGb7H/mzeKapAJF3vVekLdIS3xqas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qlgLJJUImC93In8IC1sFRoqhh0IX3NtuHXN4YoTnQ8RYkkRj4Xp079sMhoHqhybv35BBQnu3Er94S8ZhwBSV46gsRSPdoQa3Of0MMqgfdJhe0QD52elnCRLB3DgJoeZi4sh3yo4ji8TDhLhigCC+NFCV3zuZvmIV1bdyu58a48Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9yGoQMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFV8iJN7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9yGoQMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFV8iJN7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFZ2uP2281708
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnXNKvGPM70nBzOIG5k0xotvjWoRzt1LHDmn/HOTJcE=; b=n9yGoQMaJJvAt+mf
	q+IohmfA10CSt6DPqEwmk2HhCHcoy+1VZ8cC7wd4pbGQ44JICOlZN6jGZYbzB+o9
	W6UKBIpvd0tEBiY9KKdEXN4BKZY3BU8D89sd47JUzi/gEkP85yU4klGuQ+C4eQzE
	kztGO/YRs3xKpnbmrIqcwZaihQL2elhtlRQljZ3UfrBEm/h7K4cJe3Wt36UlSDk9
	eqgSeCU0ZrV91SK8hZl0CeM9bPoZAlhUuW0ihemKRN5ETqY/fi5IiU5CIwQs60bq
	jSH6Nv7fLMygth89AHnYLaenagXilX1phPSZp2oYTOfJHnsLDUMo+r5vcsT8VI2R
	txiUAA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599nch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f460260cfso3160245b3a.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702641; x=1777307441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnXNKvGPM70nBzOIG5k0xotvjWoRzt1LHDmn/HOTJcE=;
        b=gFV8iJN7oXOVrmLckboekxHIcIWtI3pjs7w4PiTM6mRw7cDjwYEMF57b7wsxIJIFP3
         CDUgl6ry8Oh2/RSzrdYe9TH9qjSEgHJA2VywmpccymGJutCzPQmnvFGxBiOoybkYulqg
         plUFaUNOYIFqtooIGsOxtSsmpTQ2D0OdGwjWC1Y9XWAGmxdqwoKscdaMkDBzkaFmuVzj
         edWCgo6v0dbiK5lEikIgmVY77CGVTRygtrIR824ExBjZ59YvxXIE79Y9N2yRfqtmJ5si
         K/ItzlQ7UFSu/F7D+C+N1mAt3qYPr/dfZnK1TckVuW19TUrwHnsv6gujRebJABRyeGdx
         5Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702641; x=1777307441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vnXNKvGPM70nBzOIG5k0xotvjWoRzt1LHDmn/HOTJcE=;
        b=MUzg+pawd0vL4HtXOLefNy+EJpFfRZPlaeQ2K1G4A99Ce4cn7iwGSFs3InWQimztif
         9T0cM+hCnuTPGKx2WUW+mg8BSJ9aybdoh1uCn30h+gSQzqRk1S7/fZ5XYP1Us7FR+RE2
         dZVxhISGX2Sweraavlt1aF8xtZJPTUNUnv4baw4IxCOCx7wedcQFBUiyPvcKd5rKZqG/
         RqiXDBfdK3UG2t9qDsIB9hkxgehT/AT/av21ftvPjBB1UFhsOx8/OSthMYa3g37mFZw+
         gQl+2t5/dQrkGhqDD0PPNxRR4G6Kb3VQUCvJoQN6M/GSZvLSCpC3erFik2P/ouprO5rd
         k3rg==
X-Forwarded-Encrypted: i=1; AFNElJ+ygEcneLlOCA5RyV9Cb/vMeUsro5WyHDt9yJ0vRhVFgNGmkb2+2JOR4K75rNskXvuxyyQVLKRQslZs@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSEvLnBCTwL7jgIoXrM398iFZwu13WzAJBK7h2GltL/B0bioD
	XOBTGAEYogQBhTZK8hOgVdYbb7cH/6REtTilx/Gr0sgDX9oFbgnw1Wrb4vKBcMUtSIRUMXhIyPk
	KPjgukbG2wpsX5rLzMVG8yG3uQ9r2LNK5Efd3hderPJFpcs8u+f5DBFv+XMPqkz9SW3uBamaq
X-Gm-Gg: AeBDieu7lGNFkYhKuVHmDE8EUkbcSmKgDfBouSTdfQ+nyGpgLM7MVWLaiLwZZP6FSJA
	4rQasapvwOBuMubMgKXNklJmvedyv4N9FiY40lDtXlPK1s0w05XZyQzmFixw1IOZQL+wZFL+rZ2
	n1hDhftJO7+n+YJ6YdDqvJyVTQxQIrsGJnYXvD4JyGaKRRIojIzZEfGCeBUpYHUAMEfxLW1Ttlv
	8KFSU7uowUj1UDm9dLutzLNI+POEcqJw0aJHwo2xgd8P6JUGldB0cuHHCsixGQTS7/JHrRe7NPZ
	ONXAq2ce+v+bFVaVDT0NAsp5rA6GTvduHLjwYpGz8hFXb7caHjiUaCHmuwfK+dQ34U5Yo3C9ENv
	Sk8rSfxy8nPZZ1REH8j9G9cWADJoCSmXX2g++NR2PUdqWkCPugkKiT0VMogCmXc0=
X-Received: by 2002:a05:6a00:3028:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-82f8c94c5fbmr15549477b3a.46.1776702639782;
        Mon, 20 Apr 2026 09:30:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-82f8c94c5fbmr15549416b3a.46.1776702639195;
        Mon, 20 Apr 2026 09:30:39 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:38 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:59:02 +0530
Subject: [PATCH 09/13] clk: qcom: common: Add support to register and
 control clocks using CRM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-9-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 72jii67PVDypQzVxXDTzpWLiD5UHNPjw
X-Proofpoint-GUID: 72jii67PVDypQzVxXDTzpWLiD5UHNPjw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfXzwolIz/djBPa
 +FNzNh+k5y8MY1AMG1tZ8T4G3WfKniot3SBkVayqMSmUkc81a5xH+72SdeExCm5eCD9XmKEYucG
 yO5W0I7UOPUIwQ+NH97smps9XbI8G0jVeZ1hJiNWE8wJbkCxs4WgI3peLiMS55EV58TevK/XJrJ
 mmrrwdhsTXIoY29SLRTALGob0yMSze6T7grehBPcLK4F1x9K/r/Wanhn4Xy/hWdS9df8GdPLDC0
 fSK2qHMRUxWnZUTotIMrFenCn9rz0l67ah0aWAt1MHKjrLIcT2FdQC8jPAKV5H+sM+kJ00SgcKR
 4SssMGAv4E9Lh6EVovOgn0KNEbnHZag3VXDjCHG7Fq552fWnENLmudhYZSzRVCLOx//eJimaDEz
 2cyXijRXC9dO8SD80w7xe+DW2GFV0uprXyb7bUH/SL+PiToPLXTdCvYvqWXmXOywxU6l7bUh5Lp
 JE4NtvQSvtEF1worYAw==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e654b2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BZ6vxNvidA0H8-9MRDoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

Add support for helper macros to maintain the list of CRM clocks in a
clock controller. Add support for qcom_cc_register_cesta_clks() which takes
this list of CRM clocks and update the ops of these clocks to CRM clock ops
only if CRM is enabled.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h | 19 +++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 968e19997daf5eebec65315974cd0c41e08e55ec..14dfae80e567852d09a5972858ae14c62e5074ee 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -10,10 +10,13 @@
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
+#include <linux/mfd/syscon.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
 
+#include <soc/qcom/crm.h>
+
 #include "common.h"
 #include "clk-alpha-pll.h"
 #include "clk-branch.h"
@@ -266,6 +269,47 @@ int qcom_cc_register_sleep_clk(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(qcom_cc_register_sleep_clk);
 
+static void qcom_register_crm_clk(const struct crm_clk_data *data)
+{
+	struct clk_init_data *init = data->init;
+
+	switch (data->flags) {
+	case CRM_PLL:
+		init->ops = &clk_alpha_pll_crm_ops;
+		break;
+	case CRM_RCG_CRMB:
+		init->ops = &clk_rcg2_crmb_ops;
+		break;
+	default:
+		pr_err("Invalid CRM flag for %s\n", init->name);
+		break;
+	}
+}
+
+static int qcom_cc_register_crm_clks(struct device *dev, struct clk_crm *crm,
+				     const struct crm_clk_data *clks, size_t len)
+{
+	int i;
+
+	crm->crm_dev = crm_get(dev);
+	if (IS_ERR(crm->crm_dev))
+		return PTR_ERR(crm->crm_dev);
+
+	if (crm->crm_dev && crm->max_perf_ol) {
+		crm->regmap_crmc = syscon_regmap_lookup_by_phandle(dev->of_node,
+								   "qcom,crmc-regmap");
+		if (IS_ERR(crm->regmap_crmc))
+			return PTR_ERR(crm->regmap_crmc);
+
+		for (i = 0; i < len; i++)
+			qcom_register_crm_clk(&clks[i]);
+
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
 /* Drop 'protected-clocks' from the list of clocks to register */
 static void qcom_cc_drop_protected(struct device *dev, struct qcom_cc *cc)
 {
@@ -439,6 +483,16 @@ int qcom_cc_really_probe(struct device *dev,
 			goto put_rpm;
 	}
 
+	if (desc->driver_data &&
+	    desc->driver_data->crm) {
+		ret = qcom_cc_register_crm_clks(dev, desc->driver_data->crm,
+						desc->driver_data->crm_clks,
+						desc->driver_data->num_crm_clks);
+		if (ret)
+			dev_err_probe(dev, ret,
+					"Failed to register clocks with CRM, ret: %d\n", ret);
+	}
+
 	cc->rclks = rclks;
 	cc->num_rclks = num_clks;
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 9987cec84324a258f3405c7b9093237f52a41b45..d00376f058ce1de7aa82ff760f92826282b1606f 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -35,6 +35,9 @@ struct qcom_cc_driver_data {
 	size_t num_clk_cbcrs;
 	const struct clk_rcg_dfs_data *dfs_rcgs;
 	size_t num_dfs_rcgs;
+	struct clk_crm *crm;
+	const struct crm_clk_data *crm_clks;
+	size_t num_crm_clks;
 	void (*clk_regs_configure)(struct device *dev, struct regmap *regmap);
 };
 
@@ -97,6 +100,22 @@ struct clk_crm {
 	u8 client_idx;
 };
 
+struct crm_clk_data {
+	struct clk_init_data *init;
+#define CRM_PLL		BIT(0)
+#define CRM_RCG_CRMB	BIT(1)
+	u8 flags;
+};
+
+#define CRM_CLK(clk, flag)		\
+{					\
+	.init = &clk##_init,		\
+	.flags = flag,			\
+}
+
+#define CRM_CLK_PLL(clk) CRM_CLK(clk, CRM_PLL)
+#define CRM_CLK_RCG_CRMB(clk) CRM_CLK(clk, CRM_RCG_CRMB)
+
 extern int qcom_find_crm_freq_index(const struct freq_tbl *f, unsigned long rate);
 extern const struct freq_tbl *qcom_find_freq(const struct freq_tbl *f,
 					     unsigned long rate);

-- 
2.34.1

