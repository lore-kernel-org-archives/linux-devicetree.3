Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855E53BCD38
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489010; cv=none; b=tZ5DEFQeyCk+zgNMsya3EEOdmfJgCItFspv6SnGHexnoispxIM8m5xb43iuIgUC2rI9RSBSctmRZ3hhZmHIzJw3SsnQbPy8+P2/QTE3rSTPD7aBTwPR9NMXFYzvnyvy3T2yfqQW0P2AVqGUFblF7xUrIrBDy/a4170RuIcJ7xvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489010; c=relaxed/simple;
	bh=5XAIS5g6RD+ZQnZSd2m76T+9NX4q7I4ljArg5mOcrOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ht7NGYBvxPtfT72T4d5HeyITZi+NyJR3Lm344P4MbttK9L+2tSKlBjaBTQZqQXJ+TlXqUUNZNqlFSM2pw4YaMfgz3W1V9CigqgOOJ3FKsQzinSNu0syrbR3rSRlQcoQRR2aSuTnlWMbPyg0alb9T3+ZU3EDlGopSS28hYEfRt1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G65OWReU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZeESfsH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G65OWReU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZeESfsH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842khU1491932
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XjhyIHf5+TXRtwPCEu+5qZ
	HWkgDJdX5lf/sPnObQFy8=; b=G65OWReUiSIwebgIdiN5cL6SvsFQpl1TG79SbC
	aAWeHTj5NlT9p38YwExUKvrS1BXWrz4pIYu4etF/A2kXGOmOz2Wtuj2M6bKbb2/3
	Auaw4TkjxDxqt3/mkfMRVTiQT5b1rnZnAnQ5/0A1EzgWML2G2C6MZy10YzoVd7ZL
	qIXO486tgADLepZBDFZbedcHErIeTBNSPHxMnrKqrjPJRoXmX4Ko2+zB+5Lmoh8t
	X7KyGQg7iCducHzmR0ilEAuybSMgTKtEwmi5FZAzniM3LRVScwwAtmxpuMwkUp4Y
	a/EU8X0NEg6V5LKqKBP3S9Buo0jo0IrvRYb9ZwMhb2NahVug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g94uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:36:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso543239a12.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489006; x=1784093806; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjhyIHf5+TXRtwPCEu+5qZHWkgDJdX5lf/sPnObQFy8=;
        b=PZeESfsHFtaMp+6XhIeSkkM7xaA5mTfjV3Bv58WdAnR87uZAjIOyIZ1MHpsT+F0Grx
         f4AmKTalOYjRX2HjRkR68Fu7Ot0LP53gWCaRcR23TFO8VOHyy91z/xqGJiXBl/8e5Rse
         n2nwKW9nl31t9J76mEUrPl1eGqDWx4bv11mHBIIduJMiKvaKrLSiWQ0hsg94TRUkh+hx
         2vYE4DIzOf2n7TvNEk0JM8yGLzrC3WOuLd0o2YBscGkKCK4l9EP7oY2wJRj6SqSe5OCX
         0oVjZ1/wpLAFC1FynyNNmEiQRwXYHs+0uuavPmz502Lcn+2wLT8dSC4p9hh70gaIw46W
         rqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489006; x=1784093806;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjhyIHf5+TXRtwPCEu+5qZHWkgDJdX5lf/sPnObQFy8=;
        b=KjI477AChmnVs7eBEbOwIR9lupFWdeOBPmJ/GVaNPG+WHw1R0+vlZ6kA03Zo+ConFr
         6OI80AM//O/ZapfbIUDtTflSRJFl15Ke776yehCJg90mkd3YtVNOYbb4WNNnoHfYk15H
         6AdiX/2+SaAlxa82WtLy7OS68Xt6wKAsQjb7i6IiGD6cSQ/0V1IqOkJEEYIKNU0/V3l7
         3Hys6TzczUF8F3bG6PvczG0SZbw7fRlLtw3QsXbuyqDpTJR760TwzaU0AuVO/La9hAIG
         wTwaClWkOq/42AcZxRH7rhykkZUFCut1pxVyEs/a88vrh0dueUQ5eTBY45LA00E8y1Il
         xyZg==
X-Forwarded-Encrypted: i=1; AHgh+RrPtfE5vYvW9JSdsmQBk8BFbRH79qcwt5ddyy/884jFZ56oy+e4zhqcJ3Hy5FHhnAUXbLET5qjUETE8@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2RgSP+4RCWtyNqs87hWuOkD39SOuPzFwodbG/MH/IvbUvkRt
	94lmrfFnwAXfe70ktZuGF9gZWHPCE2QqLw2Rxca7KLbGfJOGEUC6UG0xmzy6HQfu3UjCZhXG9wO
	G793OP7P5hTrO+pZ7dCb9JO+u+C88UMGbVE4tfswyCF3uBT/R3tO/QpsqL/xiGwYq
X-Gm-Gg: AfdE7cnHmSw9djE8MDtfDRkXxmtA+ULxtKK2n46tWrMDfk46bKpJnk/evm/XU2pbZU+
	3xCAqYgJdLFnvuSjoSjkwLcwX3zO6Th67E55qJO6F2Stk2riRZWF9Ybh6SfeP12DkEIg2oscQgr
	Oe1pxV8MZHgx7FtbH3/H3fGPm0DA9M22AcUivEx64IhurIWCclHHgjKhE7+4JBs60HWJA7SObFd
	4g3DjWco18v2Cem7a75wkJXdASZOnDwX6nAMu5fXXrzU0yqG/UWGLcALCH8Ycgwq2zs2iru9aJO
	d83oLdUCLwNvT9I3Kt37Et5RVDptksppSRm1gfxxgWJknFIJ0EDZ9mPF4DeU2N/z7u0aftq7Ewe
	EZym0shrWzNVznCiDBbKv0arBDRxS2W/xBGJla843cs4i4g==
X-Received: by 2002:a05:6a21:7117:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c0bd39dec9mr1063016637.76.1783489006359;
        Tue, 07 Jul 2026 22:36:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:7117:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c0bd39dec9mr1062974637.76.1783489005862;
        Tue, 07 Jul 2026 22:36:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c865asm15974087c88.11.2026.07.07.22.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:06:38 +0530
Subject: [PATCH v2] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOXhTWoC/2WPwW7DIBBEf8XiXKIFG0Osqup/VFHFwtJQxXFjs
 NU28r8X273lstKsZufN3lmiMVJiXXVnI80xxeFahHyqmDvb6wfx6ItmEmQLrQBOl/hr333mqgH
 0bdBkTM2K/WukEL+3qLfTrtOEn+Tyev/vGOk2FUbebaynlOzG6KrnHQFmR/C55sCP6Al1Uzcoz
 euQ0uE22Ysb+v5QxssaijYRXzcxdxUoKRXVCrxq0FknVSPD0diSAkKjaWsICkzL1oLnmPIw/my
 vz2Lr8/jlLLjgGlFL1Co4hQ8t2GlZlj/nBGpaSAEAAA==
X-Change-ID: 20260610-eliza_dt-540bd6f7e883
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783489002; l=12997;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5XAIS5g6RD+ZQnZSd2m76T+9NX4q7I4ljArg5mOcrOg=;
 b=5y5RhgEZBP9Nnuxai1u1/WDU+LhZcnJgE2Z7ztp9+tGvAaco3zk74ahTG7pLxD2wg6nVCSD60
 /h1QwAurHnOD/wbA6/dh0BQFCvidP20UxQ3tFm7z/1yykns9Qg7qrpf
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX/g37S05Vc2pL
 8we5PevgibmcNqJ+e+c+TLoMSmbdIl57Rd7CHqOvOM+ClCeWDECQzJ1HWSzmNYf47Oae6PRoE+M
 VzF49lMbwsVafM9Xi2A1njMQKAd4TXo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX091eFor37Xa9
 lrgpmKKAuWAQLl4XC7zUwXNjI5sKoZI2lZ5IwTKiisRSXZZxyfbNWDf1NLUcxYJmkvHc3E/uvEn
 b+jp3/m+N07+sXorjxBJwGwubbI5AZ0DDwJmTFVc58jhf4LOmmuZGwSNjRb7wEmhVHnacRAnXqN
 ZGtwQ1sURAEU51BUUyo0WlcLqc9NpS2VJvXjgYVucDaSEtUi8+qz5Ur9xWE5b5+lCagoPUMFYOW
 eRVUNM/6+vFWK6P98BofcePEoVLRjFLQJQe1O9gRJbTszZEcqLpppHwnIFO18MPID1MNP7O8Y2J
 zK1hOQ/pqollZnM7ZAzffYC5Mjc3jGgyYKioXvcEDuccnuRmnZDFkbmVJM8Gxri57cersDIZYu/
 89L61t8OxphW2VJ30Oe8TIcNFdPgbr3hK6iywUxRYNtppPU3sytBE6PEoJ2Il/96+E7OXaZlbYp
 PPaE0BTUlZRwVNr430w==
X-Proofpoint-ORIG-GUID: 1TDiERgHw1Z_-9ilWZcMbfS1qg1RzkCX
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4de1ef cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=hypBCiTlnlxyN0RPDbAA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 1TDiERgHw1Z_-9ilWZcMbfS1qg1RzkCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
(PCIe1). Add PCIe controller and PHY nodes for both instances, and update
the GCC clock references to use the newly added PHY nodes instead of
placeholder zeros.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
This patch depends on https://lore.kernel.org/all/20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com/
---
Changes in v2:
- Add pincntrrls in soc.dtsi (Abel & konrad).
- Link to v1: https://patch.msgid.link/20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 411 +++++++++++++++++++++++++++++++++++-
 1 file changed, 409 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e..7cfd242bc192 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -640,8 +640,8 @@ gcc: clock-controller@100000 {
 
 			clocks = <&bi_tcxo_div2>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&pcie0_phy>,
+				 <&pcie1_phy>,
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
@@ -1786,6 +1786,367 @@ mmss_noc: interconnect@1780000 {
 			#interconnect-cells = <2>;
 		};
 
+		pcie0: pcie@1c00000 {
+			device_type = "pci";
+			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
+			reg = <0 0x01c00000 0 0x3000>,
+			      <0 0x40000000 0 0xf1d>,
+			      <0 0x40000f20 0 0xa8>,
+			      <0 0x40001000 0 0x1000>,
+			      <0 0x40100000 0 0x100000>,
+			      <0 0x01c03000 0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
+				 <0x02000000 0 0x40300000 0 0x40300000 0 0x3d00000>;
+
+			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
+				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ddrss_sf_tbu",
+				      "noc_aggr",
+				      "cnoc_sf_axi";
+
+			resets = <&gcc GCC_PCIE_0_BCR>,
+				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			power-domains = <&gcc GCC_PCIE_0_GDSC>;
+
+			operating-points-v2 = <&pcie0_opp_table>;
+
+			iommu-map = <0 &apps_smmu 0x1480 0x1>,
+				    <0x100 &apps_smmu 0x1481 0x1>;
+
+			interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			#interrupt-cells = <1>;
+
+			linux,pci-domain = <0>;
+			num-lanes = <1>;
+			bus-range = <0 0xff>;
+
+			dma-coherent;
+
+			pinctrl-0 = <&pcie0_default_state>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+
+			pcie0_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* 2.5 GT/s x1 */
+				opp-2500000-1 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* 5 GT/s x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+			};
+
+			pcie0port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				phys = <&pcie0_phy>;
+			};
+		};
+
+		pcie0_phy: phy@1c06000 {
+			compatible = "qcom,eliza-qmp-gen3x1-pcie-phy";
+			reg = <0 0x01c06000 0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&tcsr TCSR_PCIE_0_CLKREF_EN>,
+				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_DIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "pipediv2";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>,
+				 <&gcc GCC_PCIE_0_NOCSR_COM_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_nocsr";
+
+			power-domains = <&gcc GCC_PCIE_0_PHY_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pcie1: pcie@1c08000 {
+			device_type = "pci";
+			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
+			reg = <0 0x01c08000 0 0x3000>,
+			      <0 0x44000000 0 0xf1d>,
+			      <0 0x44000f20 0 0xa8>,
+			      <0 0x44001000 0 0x1000>,
+			      <0 0x44100000 0 0x100000>,
+			      <0 0x01c0b000 0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0 0x00000000 0 0x44200000 0 0x100000>,
+				 <0x02000000 0 0x44300000 0 0x44300000 0 0x3d00000>;
+
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
+				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ddrss_sf_tbu",
+				      "noc_aggr",
+				      "cnoc_sf_axi";
+
+			resets = <&gcc GCC_PCIE_1_BCR>,
+				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			power-domains = <&gcc GCC_PCIE_1_GDSC>;
+
+			operating-points-v2 = <&pcie1_opp_table>;
+
+			iommu-map = <0 &apps_smmu 0x1400 0x1>,
+				    <0x100 &apps_smmu 0x1401 0x1>;
+
+			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			#interrupt-cells = <1>;
+
+			linux,pci-domain = <1>;
+			num-lanes = <2>;
+			bus-range = <0 0xff>;
+
+			dma-coherent;
+
+			pinctrl-0 = <&pcie1_default_state>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+
+			pcie1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* 2.5 GT/s x1 */
+				opp-2500000-1 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* 2.5 GT/s x2 */
+				opp-5000000-1 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
+				};
+
+				/* 5 GT/s x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x2 */
+				opp-10000000-2 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
+				};
+
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
+				};
+
+			};
+			pcie1port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				phys = <&pcie1_phy>;
+			};
+		};
+
+		pcie1_phy: phy@1c0e000 {
+			compatible = "qcom,eliza-qmp-gen3x2-pcie-phy";
+			reg = <0 0x01c0e000 0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&tcsr TCSR_PCIE_1_CLKREF_EN>,
+				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_DIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "pipediv2";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc GCC_PCIE_1_PHY_BCR>,
+				 <&gcc GCC_PCIE_1_NOCSR_COM_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_nocsr";
+
+			power-domains = <&gcc GCC_PCIE_1_PHY_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie1_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		ufs_mem_phy: phy@1d80000 {
 			compatible = "qcom,eliza-qmp-ufs-phy",
 				     "qcom,sm8650-qmp-ufs-phy";
@@ -2843,6 +3204,52 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 184>;
 			wakeup-parent = <&pdc>;
 
+			pcie0_default_state: pcie0-default-state {
+				perst-pins {
+					pins = "gpio78";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				clkreq-pins {
+					pins = "gpio80";
+					function = "pcie0_clk_req_n";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				wake-pins {
+					pins = "gpio114";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			pcie1_default_state: pcie1-default-state {
+				perst-pins {
+					pins = "gpio54";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				clkreq-pins {
+					pins = "gpio52";
+					function = "pcie1_clk_req_n";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				wake-pins {
+					pins = "gpio53";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				pins = "gpio28", "gpio29";
 				function = "qup1_se0";

---
base-commit: 05225e350d54bcac2542f98abde017b8630f5086
change-id: 20260610-eliza_dt-540bd6f7e883
prerequisite-message-id: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
prerequisite-patch-id: 9f910ecb377e4195299293f27c9892aa1df93943
prerequisite-patch-id: 246cb54c5e74e3e6ac32772972c26289523a93aa
prerequisite-patch-id: b8f67adbd27f4738bc31916b7773132383e2415c

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

