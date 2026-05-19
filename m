Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B2134D389
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169652; cv=none; b=BvBF7Ddk7gyUE9a4PeXZJsaZVlNEbmkOUiPMOJqPELybSujnLlJCKqJAF917HSP7cDct0zu/Wyl6ZTEQUW9A6LelwJNAb9xNZibKhM8sxUZDuLKbuH/J41J1CXbf8zapExSa9xxjVUwvUSsQGKOEpbbYOgxSIRBuh1+mMrakthE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169652; c=relaxed/simple;
	bh=vvLE/XhynCZJFbiPcGP3BjnA7ZMMjJOYuddxQHOZH5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VgLj4Kjk5drxfMLJislaDsLOug7B0wRQJCqd3YOnec/3U5k3MhbBbAxBZuRywYjYm3YSft8BMRMZxAIO8IEv06FinHd4TL5ET+iLOU7yxF/LSLQ0IqTZYs2jZkBayTChR9/mn00SHr+3Ai2CvNnnnMhQ8uVH3lxJYrol0gJF6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5/CphwL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJ4jqyuB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5/CphwL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJ4jqyuB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IKPcuT2437952
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45o0IW2ZWWFrwHOSmMY+tw+i50QrMnrRfwUfFW1n9HE=; b=d5/CphwL2QJdQUjg
	eTdNECiW1Pa1gWPGG0IeK/gM7UBZik3r4kLKzSKFW0wbkZRaQmfolW5QPe/jTy0G
	rAaZQKfkWZ19rhOYB6PL5+ve3ikxHE5UlSLLOdF25pu9NJy74Hd94oPm89r0is7T
	+MEFeiYqxkcGeUwdkERlDB9yUouillInAzBwAlMpjBK6Wr6srapxFfvYxRmhcZnJ
	r7109AIsmCv22mfG4/AcbeigQeeAJCntVc2FLjyXGPnPVH2I4zxlelAOzZKWCYAG
	cSCApMq/LTu1BpXU7r7Q1q/oWcru2/rOw+DAWKyyIeSiyFWD5YQuIp5rUxhobppL
	3KVp7w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3a6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2efc342ef15so4359880eec.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169648; x=1779774448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45o0IW2ZWWFrwHOSmMY+tw+i50QrMnrRfwUfFW1n9HE=;
        b=CJ4jqyuBRZ5oBu47OxxA5oCag4ECoLHPN90ZYdZWC/eP2PXxTFvAompwiLAnaqAzYM
         vV+d4zM2Ry2L0+aR1UqORnreiH9TuT7sn4/24DdPlgGTRHfUj+TSt3ybKeNk8DFCivPv
         gqaVenjx4v8sr32u6RQSxdEOCYYgARN9IUGL694ojoo3FsHvuBHi0GHGx8u4zCJzHSSM
         Bng3BQK3bEY4pHPa5PRImIsC/mRcVNrIhbvaARmbEDYuMQNGNFeeGZT9W8raAMHTJBuy
         vED89iN8XYBGLP3Ifa5HLEQdX+lORGcC00R6kajcFRy7UBvVDdb04iL1tg94WA3PTT6g
         OrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169648; x=1779774448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=45o0IW2ZWWFrwHOSmMY+tw+i50QrMnrRfwUfFW1n9HE=;
        b=fb18ZHCe/fLlgw9T2ZHvag3JuAxrbOuPIevsepEAwz/ApaxHANv57eEIC9/l3R5fIW
         aICYB1ZZkCWF1lKBMJ5JQ7iWmoJyKaOMYrsFvuXWsres7WBfFZe8ciVdOEnNXKOvOEPr
         YrVUM1IGhuzVEO6B578BJ4yeiMVrY1dXO+3U1hy6kQMIAa1G3E8MSlO6lspx3HimxrFd
         kFQXkpolb67ZSQ7TPwqnTSVu+uisHuNiiL9fGoGwwzbfYV2Kp6iJp3QsFa/NNybbKfi1
         nnjXNTvL/FXKRa3QU2SPdNSDqGF+b/uOq7PVAG2Kql45KRUkDXPoC5N+AD23SrPMvtvj
         HuDg==
X-Forwarded-Encrypted: i=1; AFNElJ/jAu2Z9ipfVqDpJFqmq08Vt2PMtt5x7kjB/P08PWRUGZxgUfh9VJqU2ylKX/WKVYgtMaYR5USf4VNs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fA6Xf8o6jA3iPDecswoY4ss0JBE9tc55oAZbOGendxqx//7J
	vmk1wYYodjiMlo8gs+cBb4CGkBdie58Wsdhcr1fPP/JTn2E3hkb70jQlLaf6X+fHucP4+Xxmikr
	pQEbSR0OplJBTQDgafbuSGkEJKTOyPwEsiRttK1yFoiI91TZK7GmTWQOIOSxgTd4d
X-Gm-Gg: Acq92OGwO5+qm9prBOEwMoPuo28IH1pP5LMpGznPc6rCZuoIukuD8P2WzFocyxxsyLK
	/XIftSjG9zAx8RbTHMaRsI1XYZDfeIW4cAf++xHp+RsXQYj4DEijDy+9oBBOaSFJ0D/Xqo/3JXP
	p7u/jt0ausaWqEU6CPO0p22C/Gf2nRoDMs5RemDP1vXkxoqP+lCZLI02L9lEPjEFZf+CQqIlrnV
	ZT7euwxNH61s5GwNoU+SQMf5+LFOS/ja2MAd/tutOq62zQ6AmtgN19WToXc6jNy+JBX40A61uVa
	XLJTOD6/5v4PU+Pb3WfsU7rTXdlt0qwatUHZQDj2WnV3m+QF+nYjDA3dUPkrc8E3LEZyZ7J4UrW
	yWG6Y5QvGxmOtgkfbE1tyeZkYMRUGw1kDjd+poLY9LDj8b9w26M1lr3jYuRjsTX9ZJiU3
X-Received: by 2002:a05:693c:20c4:10b0:303:f26f:df30 with SMTP id 5a478bee46e88-303f26ffa15mr1123786eec.23.1779169648369;
        Mon, 18 May 2026 22:47:28 -0700 (PDT)
X-Received: by 2002:a05:693c:20c4:10b0:303:f26f:df30 with SMTP id 5a478bee46e88-303f26ffa15mr1123767eec.23.1779169647779;
        Mon, 18 May 2026 22:47:27 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:18 -0700
Subject: [PATCH RFC v4 7/9] phy: qcom: qmp-pcie: Add link-mode multi-PHY
 probe infrastructure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-7-269cd73cc5d1@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=13426;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=vvLE/XhynCZJFbiPcGP3BjnA7ZMMjJOYuddxQHOZH5Q=;
 b=/KJcR0PA7sjQCRfjoE4U1lYQ/PGkehpHN0m1t/Ui6fzkn5ylKL5VgzojWprlaWAfFw14EzrP3
 /CkPizDX4A7ARt75s9oJUdgoQ7/8f3PAWX2jrGQ/nx09MqwU09SRPkZ
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0bf971 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qYxDVQDxpuus1MYIwLEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 91h4G19m_DB4xBzRas-_6koMk3swDwsv
X-Proofpoint-GUID: 91h4G19m_DB4xBzRas-_6koMk3swDwsv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfXzl90vyXQsdyT
 V58Qyz2qNsYuT1K5FQV0Rghol1wEM43WyIKkorSV4/YZlg3qaAWomW9EtOmbmA1ZtQxCa5XUTRR
 v9pUhbnA8GS70vE/36YeFhashZul2BMiwRQfdJXJ7K7iCmgTdzMfpnVzIJHOLcUazJY46EqrNft
 sWP6M09jnaTvVp9/rdr0NpcuatIIhJJoZTAkrBsOi6ZGcpoxNwhPHzfh+eCBjsKE50kIjOUqFME
 rMtZfqOi1Vi8E+ZNU/gQpFeNRSK6bx9Cj1zdI0zxuAArY0mQyu9ShbMEBunIgxJA+3MpMv0RIlE
 gFi7noN0hGU8i1c/lRQNYk8gbNqkcZ0BOmV8oSSEs9pt8oP9qpAoVibJk7sAsHmX/HeoZdJvT5V
 BvlWgME+O7PCjixRcs9OrVMcwxEJFpUuObvw85PLHX76D3CmAf8avTgvjFIqplzJHta2BhCm83S
 8tq9wMQaYtCKvn7hDqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190053

Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
x8 or x4+x4) selected via a TCSR register. The existing probe path has
no way to model this: it assumes a single cfg per DT node and instantiates
exactly one PHY.

Introduce a link-mode probe path where match data carries a per-mode cfg
table. At probe time the driver reads the DT-selected mode, looks up the
corresponding cfg array, and instantiates only the sub-PHYs required by
that mode. A #phy-cells = <1> provider is registered so consumers can
address individual sub-PHYs by index.

Three new data structures support this: qmp_pcie_data holds per-provider
state including the phy array, active mode, and regmap for the mode
register; qmp_pcie_link_mode_cfg maps a mode index to its per-PHY cfg
array; qmp_pcie_match_data is the top-level match data for link-mode
platforms.

On the probe side, qmp_pcie_probe() is reworked to instantiate one
qmp_pcie per active sub-PHY and register the appropriate clock and phy
providers. Per-instance DT parsing and phy object creation are factored
into helpers to keep the probe path clean. The active link mode is written
to the TCSR register at power-on to handle re-initialisation after
low-power transitions.

Platforms without a "link-mode" property continue to use the existing
single-cfg path and of_phy_simple_xlate unchanged.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 351 +++++++++++++++++++++++++++----
 1 file changed, 311 insertions(+), 40 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index b100302be12a..d78d57fb64d6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/phy/pcie.h>
@@ -3342,6 +3343,28 @@ struct qmp_pcie {
 	struct clk_fixed_rate aux_clk_fixed;
 };
 
+struct qmp_pcie_data {
+	struct phy **phys;
+	u32 active_link_mode;
+	int num_phys;
+	struct regmap *link_mode_map;
+	u32 link_mode_offset;
+	struct mutex link_mode_lock;
+
+	int num_pipe_outputs;
+	struct clk_fixed_rate *pipe_out_clks;
+};
+
+struct qmp_pcie_link_mode_cfg {
+	const struct qmp_phy_cfg *cfgs[QMP_PHY_SELECTOR_1 + 1];
+	u32 num_phys;
+};
+
+struct qmp_pcie_match_data {
+	const struct qmp_pcie_link_mode_cfg *mode_cfgs;
+	u32 num_modes;
+};
+
 static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -4897,6 +4920,27 @@ static int qmp_pcie_exit(struct phy *phy)
 	return 0;
 }
 
+static int qmp_pcie_config_link_mode(struct qmp_pcie *qmp)
+{
+	struct qmp_pcie_data *qmp_data = dev_get_drvdata(qmp->dev);
+	int ret;
+
+	if (!qmp_data)
+		return 0;
+
+	mutex_lock(&qmp_data->link_mode_lock);
+
+	ret = regmap_write(qmp_data->link_mode_map, qmp_data->link_mode_offset,
+			   qmp_data->active_link_mode);
+	if (ret)
+		goto out_unlock;
+
+out_unlock:
+	mutex_unlock(&qmp_data->link_mode_lock);
+
+	return ret;
+}
+
 static int qmp_pcie_power_on(struct phy *phy)
 {
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
@@ -4907,6 +4951,10 @@ static int qmp_pcie_power_on(struct phy *phy)
 	unsigned int mask, val;
 	int ret;
 
+	ret = qmp_pcie_config_link_mode(qmp);
+	if (ret)
+		return ret;
+
 	/*
 	 * Write CSR register for PHY that doesn't support no_csr reset or has not
 	 * been initialized.
@@ -5229,6 +5277,20 @@ static struct clk_hw *qmp_pcie_clk_hw_get(struct of_phandle_args *clkspec, void
 	return ERR_PTR(-EINVAL);
 }
 
+static struct clk_hw *qmp_pcie_clk_hw_get_link_mode(struct of_phandle_args *clkspec, void *data)
+{
+	struct qmp_pcie_data *qmp_data = data;
+	unsigned int idx = 0;
+
+	if (clkspec->args_count)
+		idx = clkspec->args[0];
+
+	if (idx < (unsigned int)qmp_data->num_pipe_outputs)
+		return &qmp_data->pipe_out_clks[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
 static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np)
 {
 	int ret;
@@ -5258,6 +5320,37 @@ static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
+static int qmp_pcie_register_clocks_link_mode(struct device *dev,
+					      struct device_node *np,
+					      struct qmp_pcie_data *qmp_data)
+{
+	int num_pipe_outputs;
+	int i;
+	int ret;
+
+	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
+	if (num_pipe_outputs < 0)
+		num_pipe_outputs = 1;
+
+	qmp_data->num_pipe_outputs = num_pipe_outputs;
+	qmp_data->pipe_out_clks = devm_kcalloc(dev, num_pipe_outputs,
+					       sizeof(*qmp_data->pipe_out_clks), GFP_KERNEL);
+	if (!qmp_data->pipe_out_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pipe_outputs; i++) {
+		ret = __phy_pipe_clk_register(dev, np, i, &qmp_data->pipe_out_clks[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = of_clk_add_hw_provider(np, qmp_pcie_clk_hw_get_link_mode, qmp_data);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, phy_clk_release_provider, np);
+}
+
 static int qmp_pcie_parse_dt_legacy(struct qmp_pcie *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
@@ -5437,36 +5530,102 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 	return 0;
 }
 
-static int qmp_pcie_probe(struct platform_device *pdev)
+static int qmp_pcie_read_link_mode(struct device *dev, struct regmap **mode_map,
+				   u32 *mode_offset,
+				   u32 *active_link_mode,
+				   u32 *hw_link_mode)
 {
-	struct dev_pm_domain_list *pd_list;
-	struct device *dev = &pdev->dev;
-	struct phy_provider *phy_provider;
-	struct device_node *np;
-	struct qmp_pcie *qmp;
-	struct phy *phy;
+	struct regmap *map;
+	unsigned int args[2];
+	unsigned int mode;
 	int ret;
 
-	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
-	if (!qmp)
+	map = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,link-mode",
+						   ARRAY_SIZE(args), args);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	ret = regmap_read(map, args[0], &mode);
+	if (ret)
+		return ret;
+
+	*mode_map = map;
+	*mode_offset = args[0];
+	*active_link_mode = args[1];
+	*hw_link_mode = mode;
+
+	return 0;
+}
+
+static int qmp_pcie_validate_link_mode(struct device *dev,
+				       const struct qmp_pcie_link_mode_cfg *mode_cfg,
+				       u32 active_link_mode, u32 hw_link_mode)
+{
+	int i;
+
+	if (active_link_mode == hw_link_mode)
+		return 0;
+
+	for (i = 0; i < mode_cfg->num_phys; i++) {
+		const struct qmp_phy_cfg *cfg = mode_cfg->cfgs[i];
+
+		if (!cfg || !cfg->tbls.serdes_num) {
+			dev_err(dev,
+				"missing phy settings for link-mode %u, logical-phy %d (hw=%u)\n",
+				active_link_mode, i, hw_link_mode);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int qmp_pcie_parse_dt_non_primary(struct qmp_pcie *qmp)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	struct device *dev = qmp->dev;
+	char *pipe_clk_name;
+	char *pipediv2_clk_name;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, qmp->id);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	pipe_clk_name = devm_kasprintf(dev, GFP_KERNEL, "pipe_%c", 'a' + qmp->id);
+	pipediv2_clk_name = devm_kasprintf(dev, GFP_KERNEL, "pipediv2_%c", 'a' + qmp->id);
+	if (!pipe_clk_name || !pipediv2_clk_name)
 		return -ENOMEM;
 
-	qmp->dev = dev;
+	return qmp_pcie_parse_dt_common(qmp, base, pipe_clk_name, pipediv2_clk_name);
+}
+
+static int qmp_pcie_probe_phy(struct qmp_pcie *qmp, struct device_node *np,
+			      struct phy **out_phy)
+{
+	struct device *dev = qmp->dev;
+	struct device_node *phy_np;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
 
-	qmp->cfg = of_device_get_match_data(dev);
-	if (!qmp->cfg)
+	if (!cfg)
 		return -EINVAL;
 
-	WARN_ON_ONCE(!qmp->cfg->pwrdn_ctrl);
-	WARN_ON_ONCE(!qmp->cfg->phy_status);
+	WARN_ON_ONCE(!cfg->pwrdn_ctrl);
+	WARN_ON_ONCE(!cfg->phy_status);
 
-	ret = devm_pm_domain_attach_list(dev, NULL, &pd_list);
-	if (ret < 0 && ret != -EEXIST) {
-		dev_err(dev, "Failed to attach power domain\n");
-		return ret;
-	}
+	qmp->mode = PHY_MODE_PCIE_RC;
 
-	ret = devm_pm_runtime_enable(dev);
+	if (qmp->id == QMP_PHY_SELECTOR_0) {
+		phy_np = np;
+		if (np != dev->of_node)
+			ret = qmp_pcie_parse_dt_legacy(qmp, np);
+		else
+			ret = qmp_pcie_parse_dt(qmp);
+	} else {
+		phy_np = dev->of_node;
+		ret = qmp_pcie_parse_dt_non_primary(qmp);
+	}
 	if (ret)
 		return ret;
 
@@ -5482,35 +5641,147 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Check for legacy binding with child node. */
-	np = of_get_next_available_child(dev->of_node, NULL);
-	if (np) {
-		ret = qmp_pcie_parse_dt_legacy(qmp, np);
-	} else {
-		np = of_node_get(dev->of_node);
-		ret = qmp_pcie_parse_dt(qmp);
+	*out_phy = devm_phy_create(dev, phy_np, &qmp_pcie_phy_ops);
+	if (IS_ERR(*out_phy)) {
+		ret = PTR_ERR(*out_phy);
+		return ret;
 	}
-	if (ret)
-		goto err_node_put;
 
-	ret = qmp_pcie_register_clocks(qmp, np);
+	phy_set_drvdata(*out_phy, qmp);
+
+	return 0;
+}
+
+static struct phy *qmp_pcie_link_mode_xlate(struct device *dev,
+					    const struct of_phandle_args *args)
+{
+	struct qmp_pcie_data *qmp_data = dev_get_drvdata(dev);
+	unsigned int idx;
+
+	if (!qmp_data)
+		return ERR_PTR(-EINVAL);
+
+	if (args->args_count < 1)
+		return ERR_PTR(-EINVAL);
+
+	idx = args->args[0];
+
+	if (idx < (unsigned int)qmp_data->num_phys)
+		return qmp_data->phys[idx] ?: ERR_PTR(-EINVAL);
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int qmp_pcie_probe(struct platform_device *pdev)
+{
+	struct dev_pm_domain_list *pd_list;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = NULL;
+	struct phy_provider *phy_provider;
+	const struct qmp_phy_cfg *cfg = NULL;
+	const struct qmp_pcie_match_data *mode_data;
+	const struct qmp_pcie_link_mode_cfg *mode_cfg;
+	const void *match_data;
+	struct qmp_pcie_data *qmp_data = NULL;
+	struct regmap *link_mode_map = NULL;
+	struct qmp_pcie *qmp;
+	struct phy **phys;
+	u32 link_mode_offset = 0;
+	u32 hw_link_mode = 0;
+	u32 link_mode = 0;
+	bool use_link_mode = false;
+	int i;
+	int num_phys = 1;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, NULL, &pd_list);
+	if (ret < 0 && ret != -EEXIST) {
+		dev_err(dev, "Failed to attach power domain\n");
+		return ret;
+	}
+
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_node_put;
+		return ret;
 
-	qmp->mode = PHY_MODE_PCIE_RC;
+	match_data = of_device_get_match_data(dev);
+	if (!match_data)
+		return -EINVAL;
+
+	ret = qmp_pcie_read_link_mode(dev, &link_mode_map, &link_mode_offset,
+				      &link_mode, &hw_link_mode);
+	if (ret == -ENOENT)
+		cfg = match_data;
+	else if (ret)
+		return dev_err_probe(dev, ret, "failed to read qcom,link-mode\n");
+
+	if (!ret) {
+		use_link_mode = true;
+		mode_data = match_data;
+		if (link_mode >= mode_data->num_modes) {
+			dev_err(dev, "invalid qcom,link-mode: %u\n", link_mode);
+			return -EINVAL;
+		}
 
-	phy = devm_phy_create(dev, np, &qmp_pcie_phy_ops);
-	if (IS_ERR(phy)) {
-		ret = PTR_ERR(phy);
-		dev_err(dev, "failed to create PHY: %d\n", ret);
-		goto err_node_put;
+		mode_cfg = &mode_data->mode_cfgs[link_mode];
+		num_phys = mode_cfg->num_phys;
+
+		ret = qmp_pcie_validate_link_mode(dev, mode_cfg, link_mode, hw_link_mode);
+		if (ret)
+			return ret;
 	}
 
-	phy_set_drvdata(phy, qmp);
+	qmp = devm_kcalloc(dev, num_phys, sizeof(*qmp), GFP_KERNEL);
+	if (!qmp)
+		return -ENOMEM;
 
-	of_node_put(np);
+	phys = devm_kcalloc(dev, num_phys, sizeof(*phys), GFP_KERNEL);
+	if (!phys)
+		return -ENOMEM;
+
+	if (use_link_mode) {
+		qmp_data = devm_kzalloc(dev, sizeof(*qmp_data), GFP_KERNEL);
+		if (!qmp_data)
+			return -ENOMEM;
+		qmp_data->phys = phys;
+		qmp_data->active_link_mode = link_mode;
+		qmp_data->link_mode_map = link_mode_map;
+		qmp_data->link_mode_offset = link_mode_offset;
+		qmp_data->num_phys = num_phys;
+		mutex_init(&qmp_data->link_mode_lock);
+	}
+
+	np = of_get_next_available_child(dev->of_node, NULL);
+	if (!np)
+		np = of_node_get(dev->of_node);
+
+	for (i = 0; i < num_phys; i++) {
+		const struct qmp_phy_cfg *phy_cfg = use_link_mode ? mode_cfg->cfgs[i] : cfg;
 
-	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+		qmp[i].dev = dev;
+		qmp[i].id = i;
+		qmp[i].cfg = phy_cfg;
+		ret = qmp_pcie_probe_phy(&qmp[i], np, &phys[i]);
+		if (ret)
+			goto err_node_put;
+	}
+
+	if (use_link_mode) {
+		ret = qmp_pcie_register_clocks_link_mode(dev, np, qmp_data);
+		if (ret)
+			goto err_node_put;
+
+		dev_set_drvdata(dev, qmp_data);
+		phy_provider = devm_of_phy_provider_register(dev, qmp_pcie_link_mode_xlate);
+	} else {
+		ret = qmp_pcie_register_clocks(qmp, np);
+		if (ret)
+			goto err_node_put;
+
+		phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	}
+
+	of_node_put(np);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 

-- 
2.34.1

