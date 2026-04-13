Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA56389111
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061583; cv=none; b=QTvJGp5EPe6x8UxXs0BaHfMGgUN1L7OnAwqE6KPaZRnfWLd0xI5cEK68sRptYxArQ/W+R7QLWdpgNzMwPsYtBN6l6stO0KLFkZUjCCGTHcyAHbjtlHwMJqtH9OFw/IZkXylLldwgWtvRBm4H0NI8SOwWAmcgCNuDQmu8ZUHaQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061583; c=relaxed/simple;
	bh=WuxD6kGdL+V30CDieIdjcJTNov5dAUcLLKr/2N6fJU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5EAeXCkinx94mFkME54aaF4AsYC4VU5sigN24r5MNr+irgzvXg6OYGjwuf6nAA6nnw+s03VrILWvNANCqb8Eg+SrFkx79gGLgudPrlHnmLZyybaZk+TCwAWuSnhbJUd24dJB3jz7JOtwc/T0xZWXtEKcqdL8yPb+t7drlV6MlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwksyroC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxrIxxB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwksyroC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxrIxxB9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D66EHa2154386
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Le29xCZV1ZgyaYyiM/bMz3/EFr3qGhovELMUCsNM1sE=; b=VwksyroCd/hL84vz
	r9VH6GJsr+u4eyUE4i4TV7xJGRmI6xmDcgKKGRoOd2QG0ZjbSpjywjsBEzSvei/T
	8ioW2NL7yyeiChKOQIXAeKUbVsZXiunAYIDNxhhEDpLTD9CeXqqGjY3QQHFLpaCa
	HH0Uy3IbRx/xIw1ncn79AE/QTXeNAOD8gHmnwnhOYyJ2zzKN0zJufBTabrKw8mm1
	ru43pPelq+rldv2dabI3L6pB84TmG4fxHxK2tTL1CN0aIPYgIqKv9m2Lhd09+gl4
	n1mKcIjcjpODX1YGyNvUN4CrwRu6XiK8tZB/4N8rhz/xPk3CX8uhERnPxEyOYZ20
	BHJPag==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6m1bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:26:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso5729537eec.0
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 23:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776061581; x=1776666381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le29xCZV1ZgyaYyiM/bMz3/EFr3qGhovELMUCsNM1sE=;
        b=IxrIxxB9Im0ZjORs1LqYgW6JxBoHQeS1HgGcgcjlzAkhiSkrU2I7YyrticYLrqlACX
         E7mn0wKKy0HegZyyEGxfb5xZFIXammhEJ6/jYa8mSli1eUzatLR/sBvleAPsHpncrYqD
         A1qFEmyhsAPwARMhqOBF1Pg4u2fCqiUbvjFU76HnBBDQSE9mFdpPtP9DucGKOg/qKmlg
         RxwYZTJp4aLkL6kfmj+yIZXOc48zDkY5O70dTOvypWpycwbkMtAAdqO51uNUDWeNAp9O
         XWFvme4EP6lN8k2P1WLqwpsdOVRnmZ9ddF70qhJhXNRp4QGm/T2r8VQNGna8rAcPdyLN
         nhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061581; x=1776666381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Le29xCZV1ZgyaYyiM/bMz3/EFr3qGhovELMUCsNM1sE=;
        b=I6lxp04/zIUIobnvvhfKvXFHgwxutcUCw4OLc0cO+MPimz7c5piSOCqBdm2Gtv2o9b
         h/y81QNWQuWB/9LoaN1IXliD8U67aUdneQdnloM9cC8FCu8698p4FH32ZCVgVEpOYu96
         z0+xBUPtLDwAPZSnboD6GVeT7XKj7+uBAMyCsU/ZNZuLNofozSaUsVTBnv0DS0AguyGi
         Sptb/Wv6EZQSkgIKQIR1LdQv6fi30x2LbtlUL0086mgdoqKx9QgS9cIfxeig6heyp3g9
         7FI2zh0E41lbNZu3fMjpPnXzJXBOM3yPECKs+aR9LZfPh8aesLZgaAj1zh1MBBaX/wTi
         GQyQ==
X-Forwarded-Encrypted: i=1; AFNElJ98FNvHOKYjNKFfdlZQw7zzQS5sMESERxZCB8SAvV2pnHydMRvMUWNfX30q+1YJE2pItk6V6qM/K4qE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Yb8OzmKa6cumvFvf9wJYsrgSSpg8/MWOo0VnfCkkY7mYpJsl
	op9YtK6TKsN27eH5taQZMatoc410A4/9L4hbIopY1bf3F6AoD4Wfe93awFdPP8Flzn82+VG+ab5
	zl0OAUGmT7z/mk7fnDPjJ//mW9uPnZenTQkHLGZxxchBWjWwGOaCac3bsBjzsV4yE
X-Gm-Gg: AeBDievW0zDDwE3fUxQieG74/VpCiYgvHDyl645Qf2IkVgxqhZ6ni/vsxQS0OdFAaUq
	zxS9uO0T/aSMfvIUdcPdDHHOwnkRszBPEh0qfNgskFtxZE8TZa94yC5YC4CPgLiH+XZ0H71Dhlf
	RVXfFmYY7NlO+7mI8+X0Fe7gfQqPxnGYURMEMN+Xrq+msPSBJUU5un/G/IYxlkW5IdXKZOtYmtv
	rpC3tXK7MWB2leuq02o5EacqiiF+N05PPz+iM8vW/9w7Ei2npPzX+DmvRhQ7lcbctx4on6avaFJ
	+APAFkHmagLl/139yiIcuuYjmgJFoGGsSvKMqLc6dSxcCeZOZIP9IxpMw6jGY5c+kP+zCXAmgIi
	4/QuURZWo38ZetqWSZhSUV8UO8rA9T3a6Jbe/5Wei2EhpLwKuCPgzlfthL3tNaclsbNTF
X-Received: by 2002:a05:7300:220d:b0:2c1:6676:5ed6 with SMTP id 5a478bee46e88-2d589669863mr5936233eec.25.1776061580831;
        Sun, 12 Apr 2026 23:26:20 -0700 (PDT)
X-Received: by 2002:a05:7300:220d:b0:2c1:6676:5ed6 with SMTP id 5a478bee46e88-2d589669863mr5936224eec.25.1776061580282;
        Sun, 12 Apr 2026 23:26:20 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm15260935eec.14.2026.04.12.23.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 23:25:57 -0700
Subject: [PATCH v3 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-glymur_gen5x8_phy_0413-v3-2-affcebc16b8b@oss.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
In-Reply-To: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776061577; l=2571;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=WuxD6kGdL+V30CDieIdjcJTNov5dAUcLLKr/2N6fJU4=;
 b=oIeAAqEG9SEUZcNaYwhRdKHtYtS+diUCf/WWHL1ZhagoSPXt4BK35q/TEcJmwzjJWYyfJOvuO
 R/LkzvwtIECDN9YfRwvv8LAB50WN4CywYm/PTyFq8z4kB1rhRXMUaJr
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2MCBTYWx0ZWRfXwJeJOJXpzFIE
 Fj1r4VP8T2Gvoa+aiqNexSvQVWRQwpy21Zm/idfbp1+9Sq2z4wpXrdK3gtp8gPE/jYLh32l+/ob
 PraP+fVBHHbuiO3HEQ4kecghSyp3z79fmJquG+/7c+McZ8s7KJtpJF/hMnlb0ji5sFaxh8SRo3D
 Z8HPCBcrvjDDxMTVXFn62xrAyPmJUaDsI3+oWHvPmxwjtvwRcu18VPzz8Q0CNZ2U6oNPRnmvtA8
 shJAdMDbLaY+WxRgs/BkOffrtR9Jzjw/AxLJgbK79e1aGcX68UKOknVh2USyOczLSqF5iEZjhAV
 K/Aztzvnm0tShMHfU6MA1rINA+Q34CqtA3VDS+hnIVNx0FW4NalDLSPPEa7IOEGcLlDFCapnPcu
 gG4bHoDNB19gDSXyjRcvTUDuVmAiQPV5febUIzndgMnV7As4UlWbOI90wjVoPbn0Ug23Nf9XPAR
 iT0vDnu0I+XVZGlfRaQ==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dc8c8d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eu5IZVYEi8O4nexjJlAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: JkBIUbej97Y1CG_t53OxCZLSoRiD2YyM
X-Proofpoint-ORIG-GUID: JkBIUbej97Y1CG_t53OxCZLSoRiD2YyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130060

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
index fed2fc9bb31108d51f88d34f3379c7744681f485..424c935e27a8766e1e26762bd3d7df527c1520e3 100644
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

