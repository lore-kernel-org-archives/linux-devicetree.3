Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58B232B13A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187695; cv=none; b=BA8lgl7tGWooOErnwet6wCYqyFjPlMFF05hr64KV3tdakxsAUcMnCfhA3E7HEtlubWDhRpJ8RWJR/hZqJDxdGYBUaC+c+QMJ09NmThO2hyxkv04TO+jXrudA+3u6eXLVI6M5hAzIsmz540DlbM3MSe5d9LUjOuORhme+uiaBoic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187695; c=relaxed/simple;
	bh=APxUCObf8BVPKtv0F42GaM+94TzT8vxNnWzyBapE4EI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHZOwkKdtkUhScerE8Rn+u43QDptujxhONZLo+gZf0Rr9PoYKgd6RMHbIaNlUcUIQqPYle61BOf0co6DXRNUmctrL1eLehD9iss1zKWf8LQs6er1CRsNb8tP22EGOILaVLSrdB0f00theFm57CO5KKvpCVIeLToGNGdCWXT0XwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BThaFmD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzGCluYl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BThaFmD3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzGCluYl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8F3dn1146368
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDa9ZMVWMhuQ1GptplD39wcf8xmC1uYPFbYSE44QLjc=; b=BThaFmD3LgMtG9hO
	r1zVtSH4x1z1pj85LWEZMYuTJjKITxdDUHwKwPhrYmbEaXRMA/j0U8iMrFNE6sky
	NzzpoDXqNWRyxG7OaNjke+Ap+R84oUb5I8WjhJrOLrnf9Lz0C2OqLPoI0vXA+qLd
	iEkqztjoGjEnfk7DvycEJMklAt0VBsCxHSQS1rJTRIfXdww9xgi8+2oMUD3FbqQf
	bxxiK+Y3koykq17E/cpCL/hhrCo5wGWyPdaMtPRrrSjYjbt5LpgTxe6dTPgW4ccb
	4RLThpCPTnCtZovdpiOrUw+sXDff8jKgaeg7wlm1YeAOEk8l85Nhr/495w2u1PRR
	WtOfJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ej36j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e136aff17so79583801cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187692; x=1779792492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDa9ZMVWMhuQ1GptplD39wcf8xmC1uYPFbYSE44QLjc=;
        b=CzGCluYl1YSWCuJvqGNlW5uETxEYrRJMQDe7r3U9eJxQYUhT/D05tLdT2dmrscCqfa
         VYfU3zajlVZ8amaS4L5QECpv3RvhDkUXCA8y0zqEtskFpIuFD8vM9FT8t7mveMN3EeLT
         6/nHzm2ynznoIOCBglPH0jmcc9E76RauvTMPiUXl0BYQUqnApoLKWckz3i9OLpt6KzAN
         Hw/r/YBJJEuWOn0azRl7AmBdWjABEcMUBJMnrnCgXQ4o0gr9K7ihWqZlY4PLs+qn0tLp
         7GmhZFTUQODmsKhy4frwLIrwtOGnEcyWb2GNRFSdIU6s+OIQek/1YqpHyzqNwQxkrOEF
         Ik5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187692; x=1779792492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDa9ZMVWMhuQ1GptplD39wcf8xmC1uYPFbYSE44QLjc=;
        b=bwK8ne4D3pmdrH9ZO2iWohKwH2x28m0DKFefjsWeu2d4m3LRTPfcrceIalerbfYO0p
         4hjSfzXvf5znL2nG5KpQECRQmrtblh/RC+uzRcma4zIq85YLS44XriXIS9HX/X7NSwUp
         lGDVDLOk7dTFZVmH9EzYTAbjkBn3FwvG+MMIJuzbwzwQFqN5Vjgkc78HAXO3cIG/Yv0n
         /XtCXHqlClEv7N7Nq7cNGxUuBZ3xcQOXmoZWfv+rwk34dGO6hXTybtWSPbTyokUmvzM0
         151m5ae/K6kDmVFgMziznw7Tc2yqAoxSN39y5Ifdjw6F13gHwL/WTKYyezfwV9CISezt
         y/XQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RUlA3HMh7dMobtKXFCuWkGQ2eUGpA0ewbVJ3MpuZzikQQGjWE62ruwQuBp+KBzV3/3k/ZWsMkUmRJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIvLgsc2LoPphqz6CVB9yYmr9p5Xsz2DQG3Efl31eqQ6Zv/Z/2
	KDc9gmKGfSQFvL5AmzWU02sd1Runk1ELT2PhSSXzy9bhZkKCVd+JZL3dZ2cN8Nsl61827JGgorm
	oC5gimfCTHTGlk9pxcF3RJU4mw3Mqb/Us+eNTa0d6omlrDD2CP9zTkOq98wwbuAS8
X-Gm-Gg: Acq92OGINuis9hHZbWqYIhMS/JVLHaNcvF1NOw7NJL5pv8WRCsz1vuxhekC58QqNHc1
	mULAhwSHknqowtxHZXvu8s9EFnEXARApx6ofGI+avQh1Jj3vqsT9bI/U8dIdmrHKYCDY9qRO6yT
	wJZ2bLtRat36D8sJNvPJthuelNOSbEwulg2nX5YY/tvaN/Ca4I2F0+e4nRfr5mepkMTlbZ733rT
	OetvRtFtC4Idsl1BhE550GRhAKYHV7kyWFQAt8IDX9v856FjYUR47wD5NMwy27HhfATyeEWX2lu
	3DKtqnhdcyAOQQNtY2hjpCjqLOoMNJ6+00fgKl3Y8EIpsR8gtrrIK7cApqClfDerwzYv4gCRAt8
	CFue2QsVZwAXrrvGyH9ziig6lFB2ztL67/cR68jQZt20q/SJZT7tceRnxZsuIxXuet5e4XrKNY+
	SechtzAGsQwr0JtYBxxraqerTFn38hSRT9vg4=
X-Received: by 2002:a05:622a:544d:b0:50f:b17d:7e4a with SMTP id d75a77b69052e-5165a2766b0mr269662351cf.57.1779187691885;
        Tue, 19 May 2026 03:48:11 -0700 (PDT)
X-Received: by 2002:a05:622a:544d:b0:50f:b17d:7e4a with SMTP id d75a77b69052e-5165a2766b0mr269662001cf.57.1779187691409;
        Tue, 19 May 2026 03:48:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:04 +0300
Subject: [PATCH 2/6] usb: typec: tcpm: qcom: prefer VBUS supply from the
 connector node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=APxUCObf8BVPKtv0F42GaM+94TzT8vxNnWzyBapE4EI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mLbDeCaZaOwdAtlRsxQUtqIaE6KgbcJOqB
 4UxcFqW2qeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1aE3B/wM4WHeEGwJ8kusNlI/jxbyTXEEuI5rSqyleiLE/17Ept7BtiW9EI8ljRMaDlK95WE6MZI
 as8oX1aKHlLRAGoOy9f/QLlqTkpUAELGv7UfFEdKwlKn8qdzwmUrAYlZZyYl1n9tWVft8FHniz+
 FHNwB1hG4c56CCQ9cl/38ftQ07hsHJKEt7R+BCRx6DTrqX6JVKDlC17Kj3v6LfI22VVZNYlRGG4
 LQEpG1w284WX2/02V9zwAjuCyViouhT6S16PQV8uA1bUJrYcg2787R//x5SQbtHrN7anSBSIDVT
 8cJzshglqnRP2AepWiUDF54158Ek35ONbsHkdycPuKFsEsWn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c3fec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3Ip0nfeMyQuR1jy_OcYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -b49F_E8IzKSrTULTpeOd7vJndIBCWir
X-Proofpoint-GUID: -b49F_E8IzKSrTULTpeOd7vJndIBCWir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX5JQfNMKurlBf
 CpylARLkvvmSQW2GMsjMj4MMsjKlS0vYeJgnmhpBxSW3qRpUByXGTPc+kyyvO896t7dgykDy72i
 DwVYDXUiVJzHa5mA6s7ijP4WGkejM0unEWuMSQ7+fgb3DeeYJrJgRFkFTVnirdDaJjIJots5QNG
 rhn+B56XYRpnRxePUH9zioJnsm9HkrM2PSie4YfESxm8Zxh3d1t6ipm7aNjBBZZ+fozkaseOhyq
 hyAs6FrybESCuzSTN5CL1wkb+Zi6lvfccgfChTR8bnJFRqtHCcHEd29crnbpfOjnJOXXA4apFE+
 ibJZmiFn2J67MQeHb9tlnGVOBO9zEwQ3+sD4Kv4ZJCmLkWfTOlP3sfAGRU4wG6eXAjbOfP93RZF
 kjBBCtYW8ITyErwu5AUavfK2I1F8Zc2z12zWNeT/uHKEEwC183wiYlSKKyiaiMXLMcRKgfLMnud
 exACTKbMYg219jnYktA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106

Current way of specifying VBUS supply (via the device's vdd-vbus-supply
property) is not ideal. In the end, VBUS is supplied to the USB-C
connector rather than the Type-C block in the PMIC. Follow the standard
way of specifying it (via the connector node) and fallback to the old
property if there is no vbus-supply in the connector node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 8051eaa46991..429bd42a0e62 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -704,6 +705,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct pmic_typec_port_irq_data *irq_data;
 	struct pmic_typec_port *pmic_typec_port;
+	struct fwnode_handle *connector;
 	int i, ret, irq;
 
 	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
@@ -720,7 +722,15 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 
 	mutex_init(&pmic_typec_port->vbus_lock);
 
-	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
+	connector = device_get_named_child_node(dev, "connector");
+	if (!connector)
+		return -EINVAL;
+
+	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
+								   to_of_node(connector),
+								   "vbus");
+	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
+		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
 		return PTR_ERR(pmic_typec_port->vdd_vbus);
 

-- 
2.47.3

