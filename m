Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E735E951
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250139; cv=none; b=s4trnEMhR/OZGWKecSrAYwQUVNCtoL+5EkJ0os1M2WBnJARNWK4mIK9wwiG0GxylMWdHjngRDok28ok1sZjAoWQOR0WQwuUJFy3moFzDhnE7b1ofDiRuuxrw6+UJ2j8/H9N/eBfmMAwa5Kus2agWW2YeQBKrD/ioXwz8c7TlZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250139; c=relaxed/simple;
	bh=1kVB09tNu2L/JXEZO/ToUYxEMkDFaHUqjJ74Zd0YDCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ns9zk8ap/4CdJLfDdGv5a/+lQ1DIGPSU12NZ3JZkCC2qWlm7P+fLAOsYDLVsgPWfM3IuniLGguVkCpiQ8sfgxTFa0uASi9AklND7Xo9c5CP8kRXTs3qUVzTavrQ4F4+lpNhe2t8vmSOV076eicfAvPsXcGjqsNKCFEDnV4g46KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvKSK86U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJMd9SSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvKSK86U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJMd9SSb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4fU3G3046621
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJhpV2AzAumJm8pTjJTWL4q0sS8IJpLGwzEITJtHskk=; b=CvKSK86UrjlaEy7p
	1wXtadtBUHR4UVZCwgtD39vKozOQTaWoBKxn4NL0XVIr6c3tfYXArsyJjbCdYGKa
	CVa4qU7DsY5E0vHaICrU0pdbXMp06V/OeTXDvYV+cN5V6ZugadQFtMCnj+dxN49N
	vdpsxC0FoLTVlojzPcTxERiKx+LeDVK/vRk8MKrZFBd13j3X3emGHB4P4B/tyFRB
	0i9xrVe0vnrEp8tNiA655PaODGJyCCtv+XZmGwjJiwmiGNIwC98k/CfonILSCbbk
	zZxBItXP1PZKmThS//5fEWA9DDI5XR2ufY9Qx0EMYnsSFCXestYsW5j0YZI3Lj7+
	y5sOvQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk4drg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso2937313eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774250136; x=1774854936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJhpV2AzAumJm8pTjJTWL4q0sS8IJpLGwzEITJtHskk=;
        b=OJMd9SSbwW2FC1lf4iEBvqq0VFp+55X5mTPhY8ElpTvKcUa1lNtldsInLgdyejPNxF
         AWxFJ2k23SHZcvwOYlGf5ZUsONqPyTRE7kV2ou6YqVLmOBY+ulzQ2kdQLzbyh3b9CrnB
         TkL2meLPn6m5dUNBvolDyBC0CLMJf/dn4AVYQdRZuxoIe5wOA3E/yQIHHQPydLHTKHv3
         4xvVpfQhVvFhRdyYYinQ9G0jftz4xJKwUJ0CwKa2+l5rE1UaCEQEpXDwsxJsjhsN9j73
         ORP+eNOdjg2zMq9/AWuJT9SvafxNP6w2ltDwXaa9zESjixYPZmIhCZK4bQJqeNrpI4IL
         KO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774250136; x=1774854936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BJhpV2AzAumJm8pTjJTWL4q0sS8IJpLGwzEITJtHskk=;
        b=Bf8yqyTOJMGlTw1aWRSVFHQlThv8HJogjr6Z7bKbT6XvQASdMMV5VJHuSFo5Wcxlub
         c53gqAh9EfGiHm+hFEabrO6GPuVvRHUHi4mENgAeBY62xBq6cEViwXfnjoCADYLbV7CI
         8LskqMgI1M/nofXRPZGEGFCpMB3aMGIBP+/xNRp8dfD6HG8p6yBWuHwAFN0Jt6uurk+h
         q9n4aXEbUXalVPV/qN6zo4jak80/bT/KmA9GuRc+CKHB3Q5PWp+dqk5Zskt83BYkTgwB
         VpS79k+dg68sDdWoZ7KcDeWqArp1X5SrfFP/jIdeRjfG9MDDXg0Enup9PlSMDIVW9KfO
         FH2g==
X-Forwarded-Encrypted: i=1; AJvYcCUpOFCN9UczKqPbhLuMIUSmVpIqoZBfUNPyrqOcNfqebIU53z5CM5IiLq2dez9ysbynB5e3luaefzxp@vger.kernel.org
X-Gm-Message-State: AOJu0YzOIxaul3nJ3lx4cNjn8efdFA46QRTjGkKQUquNefimReR4aqmL
	QjAsrfkEU/5A5jNuKQ8wy20tOX+ONjikEzL/dJSIp5m57uoseR4Dh1q2dlHwvewQ/VNNdCLe2Mu
	flx2RB8DfoiaCQ/+FF8nywWKPYxud141qgobjntjwkzkPJNBkosjpmcud5ywipNHVHsWFDdtozx
	A=
X-Gm-Gg: ATEYQzz1qReNU46sgSqSNAmX6RwWiyHGMrRSIhqCiwxA8B6EYYInwSdFS0ypt3kCaLd
	aJSZqU2MBdGIyrI7YwTBCt8azkdtmnmjzz1EjvClmKyqtNvG0RBfGuR/jM8r4y6jMauegHv6Uw8
	dGpHhmPWAC+TFXT5s5Z0+0G2PrCNP20CxND/hKrW3+YyYzNjmxxGoaKPZjvgQL28FfFoi5U0RFA
	IqV6fUA8jMQ2C5hsZ6ylalPQWSBL1l466TleUYpDLyb3XhoFQ71+c9K1vcXlY60c1v7mY708+wN
	ATMiAaoGCikP5aiWSX9K2IUitC2f3I8Lg6FnojQG3ymvnGDbRPo/Ys7OqypAo1LP9+L0UABV3qa
	pAMJwoFxziA9umpDIpMwN4Gx3+9R+r5GH6tBkSRgDYUmUi+pcoJJC/FRlbp2pdm9hAUo0
X-Received: by 2002:a05:7301:3f07:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2c1095fb80fmr4975768eec.14.1774250135755;
        Mon, 23 Mar 2026 00:15:35 -0700 (PDT)
X-Received: by 2002:a05:7301:3f07:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2c1095fb80fmr4975754eec.14.1774250135214;
        Mon, 23 Mar 2026 00:15:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm13997886eec.3.2026.03.23.00.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:15:34 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 00:15:29 -0700
Subject: [PATCH v2 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-glymur_gen5x8_phy_0323-v2-2-ce0fc07f0e52@oss.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774250130; l=2504;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=1kVB09tNu2L/JXEZO/ToUYxEMkDFaHUqjJ74Zd0YDCI=;
 b=MtfPg0/WzxcccrnkITZarstr4an0FSrB3GYefYIOIEx+XcVZGCq+zCV0mtEnRv7BQn+FRSU+K
 EOPre4HDVu3AdlWQAR9PHbVlaBLIqW/krj80b7m5CZdbEa6mP2H3cyq
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: 7QhyHi-OGiOTjq5W7GA1niXKkLjjzRuf
X-Proofpoint-GUID: 7QhyHi-OGiOTjq5W7GA1niXKkLjjzRuf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfXy21QNdhq6OdV
 +Rj7j13WYR2Z+oR/byOtX8AIOncjozQLqEgNWg18K6ItN53S68NEHL/ZVYGwX0zBSNcFfPx6wIX
 iEh/P0OfAAZPnAwzymkgu2GPWraL01ev7V9Amw0mxUcZON7nUxW7gSr6Q7LMRUiOPMmv0BZ0iuX
 n/jq2K42Rbal8S3PtAI/ddMMU+TMo74WOB5co5lr9NNWnn7b8Ohul1wtMEUDiF3v2iAusI23QPT
 K2zNCEfkS5baR1m0U9prD77ELVV8cOhChM7l5LWzucPsMgWCWDSDmn+FpOa5gLC2A8jLa7sfIn+
 YmCMNm93RYhfvo/r4GUWYwVF3V0YlAt5qDBuj+2c5tiFIGlpJyTi2RoZuFpsk8giMHIN7OtIbAc
 I2BJDxc4Cv6OCMzYA8Ikb1ZwH9etkO4CvPz9dcwl+6+7fDgbBd4vlWHbomaQ5u2fZW30WNHsvlW
 w/yh//fZ4I/bW1pSYcg==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69c0e899 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eu5IZVYEi8O4nexjJlAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230054

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

