Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F282534FF55
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169647; cv=none; b=DTkVf2zVLn5WfMDiPNiy5ByI8FZcqZciwvZkgJTX+9BvzP4ssW7PnBpWBmEyMF4pUfuYz4n91C+rS7NQ7TMx2p+kVQhrD4dr9mCC+sSq0eaM5yb9QKgiwCYdEcMbhKwFnr58KjP08eL5LFfXq1IXoqmlKTgpvO6/OFFo+S0FyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169647; c=relaxed/simple;
	bh=0SfbZYNjk789aGYvSOXe+aw7DeVeyc7Kx10vw0KqrQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0qsBc2/t/Qbtt8XoppI9Pvk7MiPBbhSjq8+hGNwfaUA/tJPXxPJgkRhz67z6TPhNYV3OdLtRgXLmWedmvg5vdaZfdt47aY7eiY3s/LPzftO+EFDa++p9hoTRpmdYaI6s5W6Kfc7621IbfhzQOQ0xUqnrN2FqZTZ4EXIw/lXSik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFmMaIpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ojx2aUsf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFmMaIpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ojx2aUsf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4fikZ1251285
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtTEoJrQ863EpCklHl4K1iMrE0nExfGouoieBxC+FJQ=; b=TFmMaIpgIHCHlj76
	I0rUJqlAyXopxTRYDAEq5fKY0sFK6UewYqji5/nPpx299GNXsqYq+E0oKtXUMa/6
	Vx/NOv4nBb7p1RH/BT0JVke0kaywynB4o1kr30DqV5Vew0MzE9Ux5j0oCbARzY1A
	07uHuvfIq2GonIkALsyhpU/5dJqsltqRI0l9dNpXo2T9vXylBw0cfOyd39kvlruK
	ef3kAzailOmypjGuroSYTlyVSSmL2e7FnPmEE0JLsAcSq4C5bjo2Xxv3MElnKGbl
	UbfcVx4yxAncwEglHUUs4+OFuKr9O9III6e4gMxImlJqDnTlVzl04Y+TqCaLZEi5
	5gXYBA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0kj93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ef62078ee7so4257375eec.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169644; x=1779774444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtTEoJrQ863EpCklHl4K1iMrE0nExfGouoieBxC+FJQ=;
        b=Ojx2aUsfMaEQFjGlCjV9Iedk1Z5WRaXB7iIgpaOHcLFR3jiHUq6COS2bfLhTcUIvcL
         vG3UfGuEjPEpimJROyKm+yopTB7aFa6E49NeUwPwJhMjfSTydVk6VyOteYRH6W9x41uU
         jWC5iCaRoUK2MJ82oY8jNZBoFDhEJuJL3SLdejuNNJ3d78JK58vmJ0b2VqqN/ugPTcYv
         cbNBDTx8wZ4KyDBevSUhV73tlVf3nh2GStJldcO3wF7OJK6zqunIYP/CKpdx+uNPC1yz
         QohV8bQXCmVUC6cDnjUS1lRfdqWkqTL/up7kRVFAJ0dLH/v1dAu/fdZ0D90gZoYJ7ckN
         GM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169644; x=1779774444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VtTEoJrQ863EpCklHl4K1iMrE0nExfGouoieBxC+FJQ=;
        b=NTGkoKRaiOZaXfH9+hMar1PQUirK2yDVlws6YJTOCj0Sx4fQpL7xmcRj7xN/DWDWMF
         IEKJaQediuzZIYAGLPxipQ03kmrULviZlScTu4vu62JbLq14Y8LU2wMcAxKfqi2QQDNg
         8uzWDKrvbZOY3CPYhbThFerzIlpOVRNig4DKs3xDai87G7edrjm3wBAkRhUzs8KxOyQj
         zQYNvHxFfRcmLTeLPUIlHq5jX05O0xz78yz3GKvAy9OkZcpBUYq61WqURF08PECvQurB
         wmlWJJ0JOfNaCDt3pIt1+Zm3zYTR595qXVU+H1EI81AI96XrG/syHskb54Xhsap0FXrH
         xi3g==
X-Forwarded-Encrypted: i=1; AFNElJ+3OefP8lu5huFU5jAVDnsGq1ATZXilA4f+kAiwm6lt1ckKZi8BnvhaTltMlPxK+C72Utk75yMhUptU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DUNNO9cC0hqq1hJygAtnZcQLRm+BqIKnfdOe3yEBmoHKug24
	DgkHwwUi1dF9r9dMUcuRQYF52GbuKZVkOEiY23GSVPlg3djL+TaHMmEd3cwkMg1PjRxGXfOsbJU
	aR1pjYsXJrfNWQanJy2h+HTlKu9fSEhRXVr0/gMiz32ZfnIKJY3CICRJbSH+t/i+V
X-Gm-Gg: Acq92OFucumU/9lOrC9WYr/3l0ceUoTq3B3lAGAyH1z0nNu/ls8VW2UswcgGw7Mw7U/
	9tD3u5pSRCov7j4azT6O8CzIXJMqHYb77BEHH/WnMBTkjRKpdz1pdL20XzrrqkU1VQiB8cLKGun
	k6gMuuF4bQlX5y3RJFFQ1qetXFv2sTjxMRs+JUYAZUVX1lZRfTPqzGnIOEWv/gZy6HBUvnY3q9y
	fo0ecZu7L2oQndAki1r+u0ndzlvlr8Q69QJnDvP1qAdBESYcLnY73/leIDI62H8rMrozdGsbze3
	ImW+7kix8wvZ91NiQRt0Xm9o9SffpECQMzwhEOqOdUf5+i7SywG72gpKQWv/NelSimP9xO82u0D
	kaHJoE4s9OhIr1W2SyMS1pD9OprWdn22IM3fkpZOa8/RxgRx2am7syTIcKudfoL8akcxEQn35nh
	yn9d0=
X-Received: by 2002:a05:693c:2b0e:b0:2dd:2ad3:f799 with SMTP id 5a478bee46e88-303982ac821mr6840947eec.9.1779169644388;
        Mon, 18 May 2026 22:47:24 -0700 (PDT)
X-Received: by 2002:a05:693c:2b0e:b0:2dd:2ad3:f799 with SMTP id 5a478bee46e88-303982ac821mr6840937eec.9.1779169643852;
        Mon, 18 May 2026 22:47:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:23 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:14 -0700
Subject: [PATCH RFC v4 3/9] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-3-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=2515;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=0SfbZYNjk789aGYvSOXe+aw7DeVeyc7Kx10vw0KqrQw=;
 b=BO2RmfNFHbFIq1KEG1dO+4zWeOtGTTNbu/g4DipyMdJHGlwMB3onbNYR2YE0WyW5uigCUblZp
 mF6GK6wBoVLDmAnjOHt5c1QsCtCGbDlQ6NZBx1r0rE0ZjBjpKqDDYUp
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfXwldzkCeVgsVH
 vUnSsp8ARJMVCMbZRk2Di9Im3KoxVewetdKlKRvLs59Amkuy+ChK+XCRUrHgR5G4IaXV7gZsFDQ
 Qmy2kSqNkYFcmpsiVhjYMqkRph/A1VWv9IzoTEwxsBJw5EBIx+11c8P3gcnEK52b2PgWhF7ZQhx
 kbsr/VCP8xqhFCutZmJCydnEriEvy/MLGTMZkPbDF2JuRzMuzBwhPYjHp2ndVJcLG4GFvcYsV90
 tLFB2hVUBhTqZgyN3FFOYFbKbyxBIlLcczveeeOn7qU6HhJAiql3deTsvg2I31f3xeheAoAARQy
 QfJRSjq52TIN5bWECrQ4f80jUo/1Jht5093D6hpenovcKGh+6FL1eam+Uo4iM0OVFGBOxQdDpd1
 PcQ11Meh9UlNTnpgCnlzOrmC+GrL6ru1od2pMekptkjMN7g6DDjdelEtQ8r/AD1U8f1uh/wzfR2
 r7DYK68AeBFWJrH5U3g==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0bf96d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eu5IZVYEi8O4nexjJlAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 8mT-G8i4F1oMDVTEnA7Qs8Or0CxRI51C
X-Proofpoint-ORIG-GUID: 8mT-G8i4F1oMDVTEnA7Qs8Or0CxRI51C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053

The Glymur SoC's 3rd PCIe instance supports 8-lane mode using two PHYs in
a bifurcated configuration. Each PHY has its own power domain (phy_gdsc)
that must be powered on before initialization per hardware requirements.

Current PHY power management assumes a single power domain per PHY,
preventing proper setup for this dual-PHY scenario. Add support for
multiple power domains by using devm_pm_domain_attach_list() to attach
power domains manually, while maintaining compatibility with single
power domain PHYs.

Enable runtime PM to allow power domain control when the PCIe driver
calls phy_power_on/phy_power_off:

- Single power domain: QMP PHY platform device directly attaches to
  power domain and controls it during runtime resume/suspend
- Multiple power domains: devm_pm_domain_attach_list() creates virtual
  devices as power domain suppliers, linked to the QMP PHY platform
  device as consumer

This ensures power domains are properly attached and turned on/off
for both single and multiple power domain configurations.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 75afbd15aaf4..832b5d93105b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -17,6 +17,7 @@
 #include <linux/phy/pcie.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -5329,6 +5330,7 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 
 static int qmp_pcie_probe(struct platform_device *pdev)
 {
+	struct dev_pm_domain_list *pd_list;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct device_node *np;
@@ -5348,6 +5350,16 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 	WARN_ON_ONCE(!qmp->cfg->pwrdn_ctrl);
 	WARN_ON_ONCE(!qmp->cfg->phy_status);
 
+	ret = devm_pm_domain_attach_list(dev, NULL, &pd_list);
+	if (ret < 0 && ret != -EEXIST) {
+		dev_err(dev, "Failed to attach power domain\n");
+		return ret;
+	}
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = qmp_pcie_clk_init(qmp);
 	if (ret)
 		return ret;

-- 
2.34.1

