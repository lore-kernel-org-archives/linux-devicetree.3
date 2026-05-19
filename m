Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF1A35504D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169651; cv=none; b=NDvG47cTuQoelQK0KZv5jsK2XEQ6X08ur/MeeoYZLv911nqvNty9S2IKCEnBtImtALqbjpr+jy6vg5WdD/uG88v83IF+zznsUJ+PW19Jc9UphIeDp20Pzdmj0gkoovoLuo4na/L9a8KNhaMFM/jkM0sI/2unSeBbvcK1zNCrmlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169651; c=relaxed/simple;
	bh=6l47wGwpcdS+i8z+96tTAR26f2jAl5baUJvJx2wGmVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+NgJjFLFX/fOeWpjZfzPOyvAyfhaFc5LdjgpyZ8PXldwSbkCcHOQPqgdMxlI7sD8NPWWWYBjKzf+8I8SM9v97ksHi/GaBbsSy6p+C57Xv48+d+wnSkL+i+u/5SuAaY1EVdYBofTpGPpGskDpTJdyY7pl816tUEGpqlQ9wkF+js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rt//YA81; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxVOzOpM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rt//YA81";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxVOzOpM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5cHRt2437998
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytn8hC+NMMnLU7PiLjFRS9m0hFgHKNq4bt/poY0T1tM=; b=Rt//YA81zM+mrLYi
	jU2KPCTCo3kLls912E+1OpCYhDqtb/zzUb77KReevcvVtq7JRi7xR2o3ZRTEZl0Z
	DkO+c3cFs0hPl/JNm+f61Y6OTYj1qxiRnTvhPN9RiI5AlaWaMuq6kMHno7FnXx5E
	jaT+V4jaYdiLdGWpambl9Hm1qbWk0VgsYee3RjEdfJj2Mu4fYzcdgNCJ9pfssbU7
	CRiVhk33qWpNwW0RQ0QB6LWeniPuI5De+OLNTtnTSzslauBAbsPFaGqemYJnxRHA
	MqUln9ExXHVjvXHtnVv61N+1BiKgWg2BFarFWk5enb58IRi3T3Yv9o7MYaOe+S7D
	vf1trw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3a6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-303b38ec2f6so4301261eec.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169647; x=1779774447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytn8hC+NMMnLU7PiLjFRS9m0hFgHKNq4bt/poY0T1tM=;
        b=DxVOzOpMqUM+F7Q9L52rCSf+QUhYlTfVMjVUV4ZGgw/EUt8pWtLk9UULVBGHi1+SZF
         cV4k0A5W64YPN2wmeorhKpx5Oxggq9PmdNgIxTKGPftVMiihRQlXKCs1MwFWD5wnEyKb
         xwh099QUvCbHtVrdXEnPzmLyS/vgiePR7rVnhEdQUhGQQkdBWne0eZg5jZuo78bXyV7Z
         VuGlW8s+dmJrMvLduTdMG7EBdfFhiJzufpLpzbzecJdXp0E+46nVkzSAqhFIEo0N8PZI
         UEaMFiHWfZ3psEj5xJgen1XY5Yx8RSh9gqVzoOVv9vOczZGpIynetxb14y4+c9Exy4hH
         V4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169647; x=1779774447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ytn8hC+NMMnLU7PiLjFRS9m0hFgHKNq4bt/poY0T1tM=;
        b=py/LnHHI9QyzaeWtOi/Y+gCnEzMS1EeGwCWdDCed4pkWBT4kJogIByUnGj3iiluZbd
         TbLCMAaGxhYPzH/GtTVulwRNxIDFnuienn7xKKJaFSPPjuOuf9B1tjsJTLqeDUDhZfd4
         8WxwIYK6nsOMU3+UKNpdnRLBVNKzAwBIoSYdluRBKhfisCy84YJ9fk8x6yumY1Whvdbq
         +9+pjQ+xgbIfzobyH1lH7RMBYMS5M8USx6Y27ZreSz4iW5io+KsxTrIKVaLK2h+36hbE
         0UyjhGcuenRRmOWEAn2wQ/WMcRSWaf+2SnXdrJOij/Ia3oZpVhE/CTPJ00ZUabqWP6vf
         sHew==
X-Forwarded-Encrypted: i=1; AFNElJ8f9dx463AIkoVymxLG5yxhwvEwNzKUijyJHS4hXgg54ZorbbLJ6hOiiW6Or33pj4MYk2tCVWMhihbz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3vGJGqsDDJCAxvWnyAAMvnardZLj8Ngpw9XKxEcLMcL29W281
	dOPTFruCwfcQmRZRl2r4mYvkkhDjkQxIOx4ie2yr4iY146D0k86Tb7jFKBPotBWeN2JpbdQURDw
	kvmZsphxwPxgda4eYdPTbDJjtD8am+nPa0Q1sM4v8G6fT+NV8JhfkPbVB+rwuMPNL
X-Gm-Gg: Acq92OHLB+LuNzUZD3k48c7uQq+LLyDBgzYSZ84dCIV2g094MHh3Lqrn4dGH0PcOafu
	tD1as++IPAze+mHDsU1ATNQYjf/QwodtZffSlQnKVbqOZVErkozp5JA7O3k6CElbgOUKlVr6DqK
	So5Bm9HwcR2MIOPbcy8HmQAfDGPFGoKFQtI6HUbMf6f57hGAwd/OkW49acObUHkJI54LB/hYYIZ
	5L7Af9/5FGidBeuaLDDjyqGdi3uIs7GXrnI6k0kd5A97nMDk1RXnCdUKBZ+cLv/braOxv9FYlwT
	wpKHK6zoWGX+N6j3JGip2XAdP1eeD2TrUdbRXSRYOZJZ3vusdaISO2G3rTrhcMlVBJAU0HPZlLq
	nE2FUGTLwJzyy6nxiSyXnaPUcmZRQNYZBCtaO3n4fCvK4JAszqRI02nXJVh5gYh8GN1dj
X-Received: by 2002:a05:7300:e7a2:b0:2ea:b85c:153d with SMTP id 5a478bee46e88-303986948camr7474783eec.27.1779169647112;
        Mon, 18 May 2026 22:47:27 -0700 (PDT)
X-Received: by 2002:a05:7300:e7a2:b0:2ea:b85c:153d with SMTP id 5a478bee46e88-303986948camr7474764eec.27.1779169646587;
        Mon, 18 May 2026 22:47:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:26 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:17 -0700
Subject: [PATCH RFC v4 6/9] phy: qcom: qmp-pcie: Add clock and reset lists
 for secondary PHY selector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-6-269cd73cc5d1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=4489;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=6l47wGwpcdS+i8z+96tTAR26f2jAl5baUJvJx2wGmVk=;
 b=tI+M9vo4rfmkJHBISreYDBHdrX+sGAXFh9++C+YnE/xQL8MIXjFsLioMqHH2TrO7750kRU3Nu
 H8j3v/bQPN/CNxaRDMTldfJKYU89Zz4ECL8idv4ADT7LCrZmQHTaRFf
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0bf96f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ee-eAjM40MESQSg1XYEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ldNdr4dNticggFaECzvEn07nooHRFDX2
X-Proofpoint-GUID: ldNdr4dNticggFaECzvEn07nooHRFDX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX1MPU/AJyjaua
 LNoHaDGwT3bhG2PyrnkT7QsxAO4+zRUOUSHiPj5UKC96tBiXfrE7GLG/Im1mOzydNNg1eak0W0l
 81O7cEPwRiIeUvsye4SHkdaFHrmopo/354SuBZyBK739DIJEEw1JD9T8i7S8JZcSXqpJBRahvWS
 E+bG8KGixGWeKMdP86Q+kX7g7agVE5h2Rp2lg86OzOHU918tmp5HcN/pmD5TQhcP4atC3d5EZZ4
 xArFgbI7xHv+QNb2um6PPg7ecG7JNNR7HDsNgRAz1wNnBGfETuIC5+Aad4CTAap4ywwO74Mm9X2
 KP8KNWJfF1miqG82HGJcJ+iXZW8XIp951EDjbe/2WcNSaTKPMaeg4hscrT1DLn591rth17Ij08H
 a9k5yLWdJ090YzZxIAQFK6b76atWMcQK8gsBOejT8Kjbln9pD1WNFUVzMurSEj60lhSsOvRe9QX
 j2tk+ddJ0fzUOWx+D8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190053

PHY instances sharing a single DT node each need their own clocks and
resets. The current driver uses a single hardcoded clock list with no
way to select per-instance resources. Add the infrastructure needed
before wiring up multi-PHY probe.

qmp_pciephy_secondary_clk_l[] and qmp_pcie_get_clk_list(id) are added
to select the appropriate clock list by PHY selector index.
qmp_pcie_num_clks() replaces the hard-coded ARRAY_SIZE(qmp_pciephy_clk_l)
in qmp_pcie_init(), qmp_pcie_exit(), and qmp_pcie_clk_init().

struct qmp_pcie::phy is replaced with an id field so each instance can
identify its index within a multi-PHY provider.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 49 ++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 6332f15f78ca..b100302be12a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3335,7 +3335,7 @@ struct qmp_pcie {
 	struct reset_control_bulk_data *nocsr_reset;
 	struct regulator_bulk_data *vregs;
 
-	struct phy *phy;
+	u32 id;
 	int mode;
 
 	struct clk_fixed_rate pipe_clk_fixed;
@@ -3379,6 +3379,24 @@ static const char * const qmp_pciephy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
 };
 
+static const char * const qmp_pciephy_secondary_clk_l[] = {
+	"ref", "phy_b_aux", "cfg_ahb_b", "rchng_b",
+};
+
+static int qmp_pcie_get_clk_list(u32 id, const char * const **clk_list)
+{
+	switch (id) {
+	case QMP_PHY_SELECTOR_0:
+		*clk_list = qmp_pciephy_clk_l;
+		return ARRAY_SIZE(qmp_pciephy_clk_l);
+	case QMP_PHY_SELECTOR_1:
+		*clk_list = qmp_pciephy_secondary_clk_l;
+		return ARRAY_SIZE(qmp_pciephy_secondary_clk_l);
+	default:
+		return -EINVAL;
+	}
+}
+
 /* list of regulators */
 static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
@@ -4781,6 +4799,13 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
 	qmp_configure(qmp->dev, ln_shrd, tbls->ln_shrd, tbls->ln_shrd_num);
 }
 
+static int qmp_pcie_num_clks(const struct qmp_pcie *qmp)
+{
+	const char * const *clk_list;
+
+	return qmp_pcie_get_clk_list(qmp->id, &clk_list);
+}
+
 static int qmp_pcie_init(struct phy *phy)
 {
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
@@ -4840,7 +4865,7 @@ static int qmp_pcie_init(struct phy *phy)
 		}
 	}
 
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
+	ret = clk_bulk_prepare_enable(qmp_pcie_num_clks(qmp), qmp->clks);
 	if (ret)
 		goto err_assert_reset;
 
@@ -4865,7 +4890,7 @@ static int qmp_pcie_exit(struct phy *phy)
 	else
 		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
+	clk_bulk_disable_unprepare(qmp_pcie_num_clks(qmp), qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -5079,16 +5104,21 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
 
 static int qmp_pcie_clk_init(struct qmp_pcie *qmp)
 {
+	const char * const *clk_list;
 	struct device *dev = qmp->dev;
-	int num = ARRAY_SIZE(qmp_pciephy_clk_l);
+	int num;
 	int i;
 
+	num = qmp_pcie_get_clk_list(qmp->id, &clk_list);
+	if (num < 0)
+		return num;
+
 	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
 	if (!qmp->clks)
 		return -ENOMEM;
 
 	for (i = 0; i < num; i++)
-		qmp->clks[i].id = qmp_pciephy_clk_l[i];
+		qmp->clks[i].id = clk_list[i];
 
 	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
@@ -5414,6 +5444,7 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device_node *np;
 	struct qmp_pcie *qmp;
+	struct phy *phy;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -5468,14 +5499,14 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 
 	qmp->mode = PHY_MODE_PCIE_RC;
 
-	qmp->phy = devm_phy_create(dev, np, &qmp_pcie_phy_ops);
-	if (IS_ERR(qmp->phy)) {
-		ret = PTR_ERR(qmp->phy);
+	phy = devm_phy_create(dev, np, &qmp_pcie_phy_ops);
+	if (IS_ERR(phy)) {
+		ret = PTR_ERR(phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);
 		goto err_node_put;
 	}
 
-	phy_set_drvdata(qmp->phy, qmp);
+	phy_set_drvdata(phy, qmp);
 
 	of_node_put(np);
 

-- 
2.34.1

