Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EBF30AD0B
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787629255; cv=none; b=sp3iPwvKCyzU/V7TJY2L7u8JtY+3ouMkFYq1i++mFflA+n62jN2tJgZ9cBIOk19Pej4DxTnwU0ATsYe/Waa8pFiCSgyAhXzi9ZGk0f8voqzccEgMHMmYEyxnFZWsLH1yiMf1rtBdz1Ijy+33dauezcrqvY4QboA/JMzUtm2UKzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787629255; c=relaxed/simple;
	bh=pnUfS1D4ryHbnN3ay1WHwI/EX6dn6xIWedo2EUlAh/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5jrEq/lNDrCvD2/39IEU5Zp6zawa+s2VeW4bkbxtz7r4fqqN8OZt4HzDgAnhLzPemiiVD9pAC6Q9MGKZYevY5+EfW71Xi5AorpTuSn1xdbCtiM3MlyuNFwpBga74UCe6pc8ipDWePjeZ4wI6K8QcYRG+AVdgkHBht9x2FXkW/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPppTo/9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9taXG3h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPppTo/9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9taXG3h"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R2mj606819
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mghAs4DMl2QziDdbSxmizHokUORt+deiKrfMBKoEfws=; b=mPppTo/9avOwHGMm
	dKBrG/dYKB/oUI51i2f1MUnFSYAOGbtCUszwmZb1NvnGuV+9w4xlTxcg0qlBGSHw
	gAJb4eDwIqFo+oMPd2gbwYIJkt3WzIbrB3gzz7YLFiPb+1eJJkFS2x1Ds1TwteW3
	g30uLKm9qzeg9WHQ14QbohVQxOCPCuaHlils57Igf5F58DAMPMcIbXXiwKu4sSR5
	4RzF22c2fMbb6GU445H08QeQpmYDIXy5aqkCKeRB/IaJSI6BgsAmQ7qT6bCJz1Xm
	FJ7cb1etuFLpzEHu0KvDnzADi4N4Ui+ngpOq2jNLATRLmfTzzSTv1os5gyvr/jSp
	NnpiMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swy20ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:40:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so6863024a91.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 20:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787629252; x=1788234052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mghAs4DMl2QziDdbSxmizHokUORt+deiKrfMBKoEfws=;
        b=A9taXG3haTiwHB21z2dhsxEkmcrVwUSTk5pLKDy2VSZCG19/RA8USDqt7tVnCT7YVD
         ktcwx9iUt6MWzk08xfzXt7bmbfpLMJeQKtIUHIsuuguO2IF1JMmDcxE/i6HGLbkH0lza
         frMV2XXmTdfyb7usXUcmwubk4Osrvoz/iLFNaGHZ8Kkh/ZwHS+dNmoP8AFfU1GdhErau
         zr5xmZDny7edR0WjTA4KYikVN77W+0dgi64lymmQNs/bMkOcMKY3/j/FSPW+PUiKfppf
         xdGcfGy/jWYKZpJ/LduOJjhHiuK7AKPuNOHW724SpQMCtHWZ1/pdg1u9KdxA9B/ZQXgr
         32LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787629252; x=1788234052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mghAs4DMl2QziDdbSxmizHokUORt+deiKrfMBKoEfws=;
        b=gj0VwnmI/GXn1GX78ffyPJ8JSijkZuXETIrnps+LiNPO9X2PQXDEBjRvzZ9MLZq4Z9
         eB7o2HuP8aKjYFhjULXH9LChhWwXvZZ23rTWlTJwGf2BuUBXy8YmAyC1t65qNdiK8YI4
         OHu6sZXOluMSZXv/Cr6cexQyRopHG7URxyi67m9wE5CFfc68vM2JzMPWRcfyix57dv01
         +g7lSPDZpSHsRK0m91M68Xe75hIjnvyBgAmmVyXOz5WyZxU/rHER4kVWUouJdDKkI/fp
         YnSn4flpy1aP6LMeULnfiZRoraifkCClUCTh0k30MGxdPyMG6cc5iWsE2WV+zmWq+vYu
         OTqA==
X-Forwarded-Encrypted: i=1; AHgh+RpjTTTL8nWkZDxIflxJoXDzTtkYN8FZKt9rNMPXbWBcVCxjl1Zbc6QKfgH5zcyRdUdC7QBDI3o80Niw@vger.kernel.org
X-Gm-Message-State: AFuF++l9a3YnvNQu2fyTZvJglAG1gAOUYYAZQNDe3X4eK8WJ5d5DiuXo
	TIP147hUSqmIzpMPDukpD+uNVvm9OUUp/boFBY2vykYUXGtqmvoWtZ40xXjTBkRcXjDXFk3n2hh
	f0+G+dsVFL+P/dxLx31l5IRP/dMmAvFv732A2LiYk4ueKSEvIxcm5DH6uV19dUQm1
X-Gm-Gg: AR+sD10De/28Xi5cDweTJVxURmlRVIRZrmNwZ23ATaW8iXPP7bNGYb+QWM4++P/GEvu
	ZLgMh7kItPR0uiJCW7DqEj+84f5YzFpYP9im16royShHLV6A68Ds1z6zxlZ4guEPG1VevrY+UKS
	npp/g7BOChEuEvKTOvwdoloF+H1Ho1V/lNJAG3s+tjZhJ3Bkg7TNOrQM/ut11ezbHmnaU4r0PK1
	oZQkKmSXCHVJ/ncGU/AeIoO2ierFsbt36qNbwv/CGarYXMgFT3aqFjA/BUpOnyIyvWeCfatAnzx
	omRNjLoDKi9V0SFoWi9ipHk6xXt1I4dxmPU+KG1BB0/LMippllmzly24k3GR16d6L2wEK3TE1T0
	sIqE6bGh1WnNky75EeHIrwDLf3B0Nc+LeimQ=
X-Received: by 2002:a17:90b:1b41:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-395c39f97e8mr51196093a91.16.1787629252092;
        Mon, 24 Aug 2026 20:40:52 -0700 (PDT)
X-Received: by 2002:a17:90b:1b41:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-395c39f97e8mr51196015a91.16.1787629251637;
        Mon, 24 Aug 2026 20:40:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm46440083eec.16.2026.08.24.20.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 20:40:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 09:10:24 +0530
Subject: [PATCH 3/4] PCI: qcom: Add CGC disable workaround for Nord PCIe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-nord-v1-3-7c02f2b8765a@oss.qualcomm.com>
References: <20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com>
In-Reply-To: <20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787629229; l=2301;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pnUfS1D4ryHbnN3ay1WHwI/EX6dn6xIWedo2EUlAh/M=;
 b=A5+LJQ0DvKPTuC+Blx8ArneS2OlrX+eeCZcHQm7Vd8/jAHAYY8say82bXyMadyPhau9mYbezZ
 gO8kabdxMNTDZOjgajCNrJiECDYr9EwAn2LoPTA4K3vJwLP3J57E/VU
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfX4bNgPV+kILYv
 44xUo5Y0j8eQ+ad2zWK0DCTG+uyv8kklqyysfMRDE5NMUYN9HjcM8vYtrwNiJX3iM8E94oGIZpi
 fLwRyN4+rWp+UZ/i/bcDU0ssP19LcHyRZ1DoLbS1B3LfQTNkdutGlQoQ8EO6hsY7RXcWIHWJkvU
 puE05bNtSKSY6AqpApAOqzcOU/NiAArynjIJnn9XkM9uO3y5wkTjPrveRtYEbSqLYgjkhQVvOwi
 xyzXLejhAby20SClm1Z+ZNTw4K6UJTLt2C53KUNUx/+06fkS8rdlcHetff4IMPIWcxBXAsdD3LH
 DjUkY5A1iglF3cXZz9N17eVX9Re2y8iEdHAuGKpyBTqbBYRUBNOJvIVizGKSIXreMZbnb2CUO73
 gZjcm8ES8L8++4lsK7Qfwd06uFZw5SqxOEm8i8z2AA8Wbn4oacIsgKjTTSPOyGzUyk/NkHcB/Os
 PBzbvR1tkG5ScLvPnIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfXzFulPSUfpgHh
 QtPdsj14C/Qq2KPjiWSxuDk+ZNuVsffduu//R56VeEX/LgdRi20CC9NnBUhxGXAbKaVhhoG/Bbr
 Asv/Rh7D5nGJA7SB7iD6zD/Ra4/h334=
X-Proofpoint-ORIG-GUID: AHSImK3TEPkZHcrN9Mcd1kL5VSl215Gl
X-Proofpoint-GUID: AHSImK3TEPkZHcrN9Mcd1kL5VSl215Gl
X-Authority-Analysis: v=2.4 cv=QIlYgALL c=1 sm=1 tr=0 ts=6a8d0ec4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250028

Nord requires a workaround to address a timing convergence issue in the
PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.

The SLV_ACLK_CGC_DIS bit is already configured by hardware reset. This
change adds the remaining required settings as documented in
QCTDD11972446.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..9fa7ab47c86e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -266,6 +266,7 @@ struct qcom_pcie_cfg {
 	bool override_no_snoop;
 	bool firmware_managed;
 	bool no_l0s;
+	bool cgc_dis_workaround;
 };
 
 struct qcom_pcie_perst {
@@ -1073,11 +1074,18 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	const struct qcom_pcie_cfg *pcie_cfg = pcie->cfg;
+	int val;
 
 	if (pcie_cfg->override_no_snoop)
 		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
 				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
 
+	if (pcie_cfg->cgc_dis_workaround) {
+		val = readl(pcie->parf + PARF_SYS_CTRL);
+		val |= CORE_CLK_CGC_DIS | AUX_PWR_DET;
+		writel(val, pcie->parf + PARF_SYS_CTRL);
+	}
+
 	qcom_pcie_set_slot_nccs(pcie->pci);
 
 	return 0;
@@ -1604,6 +1612,13 @@ static const struct qcom_pcie_cfg cfg_2_9_0 = {
 	.ops = &ops_2_9_0,
 };
 
+static const struct qcom_pcie_cfg cfg_nord = {
+	.ops = &ops_1_9_0,
+	.override_no_snoop = true,
+	.no_l0s = true,
+	.cgc_dis_workaround = true,
+};
+
 static const struct qcom_pcie_cfg cfg_sc8280xp = {
 	.ops = &ops_1_21_0,
 	.no_l0s = true,
@@ -2282,6 +2297,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
+	{ .compatible = "qcom,nord-pcie", .data = &cfg_nord },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1

