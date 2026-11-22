Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316229;
	b=NFnWsgWLV7EgefdnXidl1vGmANPq4+Kurqy4hGgwg0f14lxEoK6vIZQYsKwmPd7bIws7
	 6ZqyQzNtWXJtZ2t++pVVdTlF2XbgpgVLA7MCU41oOkJ3LAg7datLrktUvwEQKUoikoTYc
	 TZERgNW5x0zplpy0tUP89RkFZ6T4aBdolAMk7DksC24Ro/RjJBgikiJrYvi9b9jB0DM/q
	 2mNzpzjIC+mEUuF6JeRxQfh4tHOihKAk0Pd4xpri6z3cmygXwZse3R43LASl+2JbO5KRo
	 UcwUOseHhNgGLY74XTckTN/nLJEUqWOsm+NCy/NC2ITf8Dbmlup9LRyVvDOz33M2wFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=;
	b=jvrboZq6d0CND1XLPkXljIbi3W3BwK/iydticTSqmdR4dFZJ0DQcVd9zfKQ42+JK9ATN
	 8QBN2FdCehQh6CHR1XeHZbS+kNWpLkBgj1mPgbqydMmN2J3AFTg6SQ/WP0M1hE8SNtZ43
	 ccIBV8ubFYpNC/owvdoz45THlx6X+zmldZdAhdiloICrr5zdLbumDm8tAx1jbzdtbUZks
	 mNAKTafpU4RU78Z6BogjykFfTs0RQlBG568eBPTDB+Pfuq/jbRzNPOpC88+pAy5KZrczT
	 YO6JNlR1UHh5VkBVwkno+SLP2PXnRpfNgbGmHszn9mdh/uycBp414Y3X4rCJkfTH/eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYdFd5bs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q15uVlcL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BBE606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BBE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYdFd5bs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q15uVlcL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07v5K1941296
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=; b=NYdFd5bseRzfCXzt
	d8aJg5vz4MYycLsLY6gJcUjcBbyln2NaS/SgvQPXbQialcB55FHjww2sBKAq8qia
	h6aDB9U+2/CtlVUTvFN/JRYgumvbLqkT90+rz/fxgMTgJDQQtk/twHMy7/ZEnMCI
	evtaU8xv69mJDERv0vsAW0ARveftu4lfJ45+IK9sOOQbWJv+Hqd2ez8FmLg0txCX
	R1kytBO2gZVh8iUOLTb2/2fliVmwqjRz5me772JxUQpkq257V4nwjrO31erueNVA
	IgTJy5ZM7g+5F5GOl9qso8DQyNxq5qOCoMgcH0+zgbs+ysVYmdQoVCnR5s4Kr+YH
	kviskQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h32hwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:57:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so3451135eec.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 18:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316226; x=1795921026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=;
        b=Q15uVlcLm5cpCufmEW3sKFe5N1CIRhPSwjIDmiacC/gDKBerPEvJyiJgWS98Slui18
         3hOrcCgLLYF2m3JV+jbEo9lvQ5x234avKvt3MRg3ubhyEL53lPtIvcElqJcYqwBm6FqZ
         9L6EgTr0sH7Wr1ShpzeqDm4FfThCnUBARn/8rS0HLFTmDzDywoIEjyhEhdgVcrbGyXK6
         3sn2jO9llAFgfooab7YKsdgx5hcl0HeQfBLi1eNV3uYnGzOxCxeU/AQxizGK885BMcyC
         Lh221FdWLk21ux+VHKrgojXqnoDY27cnt+DzMx1yuOiuHx6ml7BRXRmuJ9uVlyUUuXeZ
         8aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316226; x=1795921026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=;
        b=MCO2tgE7zsr9kRHcMaTJEUEJ5bdxcrCfMazA0/7XSdr+TKvn2yfkgtucV0SF6CC71E
         OziCO4uHjDu5GdjJoe5vMLxX0l3K5553M7XdmpIihRXMBGX8VZCMQgAMMLEg76PbHRcs
         SlWwbHBqeCS738EVpPSop0tIK5mEMHT/LO1Gd/YFeeipGisH0psqNb0ZiJXzWfNKOwHo
         kafFun4zKr4mmE6K6ijZKO1F7guW+jztYu32GB/7dvse+gOtAXrCAOBhHM7o6Li92w8R
         LcHa0MR/gcNjiZrEs1QZ6nJSGRBPHptq+2DuL0lWAbR3BbELwaJ/ce1Sec11GzaeJHxz
         oPjA==
X-Forwarded-Encrypted: i=1; AL+hErEaVwswIeoIWf/DGDWx/yyd5Ok+axcUXDTv7PsYjZXSdU573VUBSMElfY3Z8Vj8w1lGjH/9aCr+ZgRL@vger.kernel.org
X-Gm-Message-State: APuU4Z9550xxfhZu1Es34L9PBOquROy5wn9gS+cfqPyW3WPQujA7wUGc
	VIVteiKX+dYZbFK/qp3AwjvMd0CiDndRR8Fk92qNYzKJXEWO2kt759zoFrtCNpcWQmz4kL2NlUU
	ZYL/RKG/aAHB1wjD3b4M2ZSWTAWdFDRVjFKJ3ts9wiHYkMwZ5iumt716CEcpKFFKh
X-Gm-Gg: AZFdTZdXVxNUQ0rF9eDmszwQJ0aFOiDp43fzF1vMhUS+cXKSVe4GGoWgiM9oAgf2tle
	p56bnhDi5qdJ4GJwh8b4ktbR4q7LlWlDQlaTfmYrS8tgSHj89gc+vc0Hv3R5bWcijbsTosuK4o/
	npgzS7U6nG06SHEjgb3+Im3FCxwtzexzz+JSSq8qzdJsc7o67kF4F8nW4krSu6jU8+ZeqoawDXu
	ssm4AYl2XF5AW35Lvob65Gl8musQznRl0qSddMHAy3n6GrNciN3bZ1MHiCV7KdVNcSCaafdqFb+
	c9BQo/wueWpxksc0c+/+aCfELJqrity/hwIWYo7w77ftsHCbKMSZXWYwCV1GPEJlO7tRNvoJxHz
	nWI7UM3u3/2a50JPnP7Gb4o+MsPS1Kl+hFRmqpSQ/EKyGTVA+8OawbHBWLP65qKU8WnQDYfxYOd
	ADt78hTTg9
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr5271991eec.6.1795316226433;
        Sat, 21 Nov 2026 18:57:06 -0800 (PST)
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr5271971eec.6.1795316225925;
        Sat, 21 Nov 2026 18:57:05 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:05 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:18 +0530
Subject: [PATCH 05/11] phy: qcom: qmp-pcie: Add PCIe endpoint mode support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-nord_ep-v1-5-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=3245;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9UVXub4tyfQyqAJ5iLairdqM1PlMxztFvo8mRpY4zlY=;
 b=/xrnyvXAlwvkroxvh1fh6Ne6gyQ24oDqJjVsXBGs8mljggskqwHJ8AW9eNpwHn3irT19BeiYT
 lqikiJvdKZZCrCsuPpUawQ1VpjJCazPuc8cDV0m8ITn42MGHDQw3421
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b025a03 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=n6AvfDos_TaM4Tq8RocA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: OHliPVUIBp9f6S2S70I10uYS6lnKSNZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX4+IyWKjMrZlQ
 O5tYGfXmFgD6dGmdT68j3pS3S8WjVyGD1hy2eVAZXLBfLr1pexQhPHJFLQFNAb0yTv1eqrfGh3P
 9HnGDWK8XtZwoS3N0XUHcxqHperYGXb3kT9If6gcs6lq8nFBON3OY5QraUndX3L7o6OE6Ojpo9u
 JYkUUsN31QUoRJhjr4gg1ogCYEv2I84tqxhWb1scwWQRN21Yr2dCejFq3Y76JAjf3PPnq/vx/7R
 lsEt3dj7+thFXv4cqpY3QDQqbsGrGNCQ+JoJn9GjqzR75CqS/y0cIFspXEORYZYTbO/ae5sRoDR
 uafCPyjWNlcxplQVm2GjYW4ixxXS12u7k/S7pcae+uPYRjcN/HHGu3/d/2e00Ns9H+laFekhaCJ
 n4BtkKzjV0PN6WKDQfPsrpDS7/dO1nWoXqXTrDgnwDrX4MPmmB208qc2hHgu10mqkCdB2QxqnxH
 Da+N47MVnRck/+n6WJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXxXPgd84djaEo
 ye0PjI+82FH5AuTjc4i4fJLAqpq6wp3zFxYJpkU5dlWv7edeyN749LCAAatVrgAI2t/BoHAXu1E
 JSW70TfBb10VRtsVPWZHS7d8cSfdLrI=
X-Proofpoint-GUID: OHliPVUIBp9f6S2S70I10uYS6lnKSNZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

The register initialization sequence differs slightly between root
complex and endpoint mode. Add a .set_mode() op that records the
requested PCIe submode, and an optional per-config tbls_ep delta that is
applied as a second qmp_configure() pass over the pll_common/txrxz/pcs
blocks when the PHY was put into endpoint mode before power-on.

Configs that do not provide tbls_ep are unaffected and continue to
program only the root-complex tables.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
index ccdb7748a9e1..21cf6adf7d60 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/pcie.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -89,6 +90,7 @@ struct qmp_phy_cfg_tbls {
 struct qmp_phy_cfg {
 	const struct qmp_pcie_offsets *offsets;
 	const struct qmp_phy_cfg_tbls tbls;
+	const struct qmp_phy_cfg_tbls *tbls_ep;
 	const struct qmp_phy_init_tbl * const *pll_tbls;
 	const int *pll_nums;
 	bool port_split;
@@ -121,6 +123,7 @@ struct qmp_pcie {
 	struct reset_control_bulk_data *nocsr_resets;
 	struct regulator_bulk_data *vregs;
 	struct device **pd_devs;
+	bool is_ep;
 };
 
 struct qmp_pcie_multiphy {
@@ -930,6 +933,7 @@ static void qmp_pcie_init_port_registers(struct qmp_pcie *qmp)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct qmp_pcie_offsets *offs = cfg->offsets;
 	const struct qmp_phy_cfg_tbls *tbls = &cfg->tbls;
+	const struct qmp_phy_cfg_tbls *ep_tbls = qmp->is_ep ? cfg->tbls_ep : NULL;
 	int i;
 
 	for (i = 0; i < cfg->num_regs; i++) {
@@ -957,6 +961,15 @@ static void qmp_pcie_init_port_registers(struct qmp_pcie *qmp)
 		qmp_configure(qmp->dev, port + offs->pcs_lanez,
 			      tbls->pcs_lanez, tbls->pcs_lanez_num);
 
+		if (ep_tbls) {
+			qmp_configure(qmp->dev, port + offs->pll,
+				      ep_tbls->pll_common, ep_tbls->pll_common_num);
+			qmp_configure(qmp->dev, port + offs->txrxz,
+				      ep_tbls->txrxz, ep_tbls->txrxz_num);
+			qmp_configure(qmp->dev, port + offs->pcs,
+				      ep_tbls->pcs, ep_tbls->pcs_num);
+		}
+
 		if (cfg->port_split)
 			qmp_configure(qmp->dev, port + offs->txrxz,
 				      tbls->port_split_post_cfg, tbls->port_split_post_cfg_num);
@@ -1179,9 +1192,22 @@ static int qmp_pcie_disable(struct phy *phy)
 	return qmp_pcie_exit(phy);
 }
 
+static int qmp_pcie_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct qmp_pcie *qmp = phy_get_drvdata(phy);
+
+	if (mode != PHY_MODE_PCIE)
+		return -EINVAL;
+
+	qmp->is_ep = (submode == PHY_MODE_PCIE_EP);
+
+	return 0;
+}
+
 static const struct phy_ops qmp_pcie_phy_ops = {
 	.power_on	= qmp_pcie_enable,
 	.power_off	= qmp_pcie_disable,
+	.set_mode	= qmp_pcie_set_mode,
 	.owner		= THIS_MODULE,
 };
 

-- 
2.34.1

