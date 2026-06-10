Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08CD403EBA
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093422; cv=none; b=Mzvu/4+PJPFqbjEUQOFKasjL1ELQOqnNEsLwJR7YmQE2vnxcUDfyv+QQ8onav15IJ1hZW7lMdxJckrPpDFzah9u3wkUbkUZ6H3vhlR97vrJd8rU2gQOcmKNPkKX2OIOpLJM0/A6eUPVANsPkgsbYhsm36RhVlB06itwd5c1fimk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093422; c=relaxed/simple;
	bh=5L6HD2B7635vOlsqIcZK13z4zM+horVPwzgTXq4do9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tmLY5mWWUUri5Z1mjaY2A9VavWbljYgxLRze2eUsGtsGsGyuhOlukqcC/lYGEo7W/+vWHWqOKIhBXdsP9bMZ3oOw6WYPsl0AKlMCu61+6PvSkHC9zrSux/IWOKfFuSy7E0euvMijstYHQ80C31CakhmB5pk1THSQ02o9LFXm2IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LY3ORE2l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbZQHK0b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LY3ORE2l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbZQHK0b"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ABNGpM1447707
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hLn0YPYEVNitG5z1t7C+Tw
	0rgmEGuflC+fDnhmLH64Y=; b=LY3ORE2lLxCqswmwKzCghkF+VJwBzrbO3d3BAJ
	LEHt0RfmhyAQm1VoJpLwhl/yYGG0idDlVLQnkCzW4HrbvwwDbzdd86D7NqaXq2MR
	drfI06+RCbX2cZCF0yr2xzgF7HRF9t1E+CRpfr80YsO2ajBAqtsn0EmpEmQzJNI/
	LSsszfCwyglEiBbglNDgzsZSPG3BVJmFKH29q2d+NjaXgtXukWTr1XUPhx2NWoqL
	QPC0TXS9xvhqhCdMm37QfOCAhgPY5PNCn5U+I2e/klucqvRnWAYA2cvROp/R8hVM
	f6LyNWOOrTZzMZeYIhhxU6cGGDPfYyKmqex/0YHoJfMmZ7Lg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnntcbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:10:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so4386539a12.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781093418; x=1781698218; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hLn0YPYEVNitG5z1t7C+Tw0rgmEGuflC+fDnhmLH64Y=;
        b=JbZQHK0bsWwJYw2cwvgMDelukjaAIaI+KK4hsq7f2E8rEAxiu+R8fnA7rh+9aUJCj9
         XRlpUlGoFp9HW3BG+9N/74tHC1g5/O0QE8Q8LlDARzpxsPj5bGtdwFDUF/j0SGTGgZgE
         76ub+ZXHiP6zQymQC2I0glV+G+bAmwPFncOQbhppjlQWOMFNvoslgaIJ1FsU8KDaW9G9
         itXwiFFcw6cvmxPHonYxDtsic/87WIoc57POc90j7Xr8y55ClFCml70GdkyHTwLnV/BO
         6l+8BZ1wgDfurDJ0GaycXSAUJ/El41raWnWRJsKPLfVNBBxD3sFzzwHyCN1fW6mtXr2+
         zZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093418; x=1781698218;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLn0YPYEVNitG5z1t7C+Tw0rgmEGuflC+fDnhmLH64Y=;
        b=XKaRUncQGmeApE2fE63PsMrBbIp4edFbmvW53bD/GJ7yOElN2kFKThWeBGPPm7korK
         mfePlouOe+q9to/NP3dR8/rPpcF9MdBsSFIMBI+HhWuCOWO24e5DJrcgq7C9p6B5X6sw
         vdF1AOQVAHZVLhb7B9rOlS0/xSLA3jU2t8UnlGo3CgRFyEAX/c38U+UMqkYoZiW/Wb/v
         9yGoib5Xwbr2dEG1hQB9mvd/cstW/6lOh+Z8tc5qOtRDHnwWyQlkXrfHWWc9VXNxOJCu
         xYX1963iPs3FxfI2053qA7Yb+koBzUiD9S7vjth0Hw5BInZnAuOxia5jV8HtMePNXhBH
         vNoQ==
X-Forwarded-Encrypted: i=1; AFNElJ933c1xjcSc/wrrX6KaMdXZKDNelL7+pN5OLmLpsSbOfQF6+6F4wDTZZF+b3UBmNgdHOe0dB3X0e17D@vger.kernel.org
X-Gm-Message-State: AOJu0YwRgg5Cr6b8U5oXKuKzauZkAI3bs9TESrHo333I8iS1LK7iWtnI
	2ZDXVweGxvED5EZP5L3rqzLWZ3MA6VGLVxRtWpEqLnd30/XKzj03b7ohEhc9edbNKetaTsqVVh2
	VxXT2dYEuvXdl7WTwO405QQiFvhGO1j01jSPRpo6wQ7vlQtzWv3XHTrNC+SuE01bH
X-Gm-Gg: Acq92OGmu+4PSl4CENQi9j1T3NtdBgyL6fZZiB4amp7jViCv0Mt/0pBF+MxNG+T7uwn
	twbizhM0qYjM1BKMMPN1wSWq4RBIcuBN6NMdCPvd0u3OuwyCCDBFdM6iMKfafN9UaS6nbjo7ln/
	wiWTOG+v1OwMjrLeWJ5UKXv11fCiUF+NOIQIgVppSt4MOqzLdY3SOZc84vzXI64xVuT+Cu6Yrg7
	c5/4djHaMchDYdFzFwq+MSwwcC4NKA0FA9ZDdEL9YW5exNbOjNTUe5NOF+mFCZFqcPpcNrdtOqJ
	JuTOn1OpR2Fe2kApwhIWx0IX9dvRraPTadHjusgq/7CjzCYreKEhoRj2ZHcMwxjqWW8ZgakFPna
	dx69PIvqJua9wFsE43y++MO1TQFdxM5/3pgk63XBD46C1X3mEp7zJB+IAev3fN2EzAio=
X-Received: by 2002:a05:6a00:3d48:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-842b1065038mr27806131b3a.24.1781093418327;
        Wed, 10 Jun 2026 05:10:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d48:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-842b1065038mr27806086b3a.24.1781093417742;
        Wed, 10 Jun 2026 05:10:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm25721328b3a.15.2026.06.10.05.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:10:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 17:40:09 +0530
Subject: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACFUKWoC/y2NWwrCMBBFt1LybWSaV2MRcR8iksdUI9ZqpxVR3
 Lup9WfgDufe82aEfUJidfFmPT4Spe6aQ7koWDi56xF5ijkzAcKAKYHjJb3cIQ5cK/DRNBVaK1n
 Gbz026fmb2u3nTKM/Yxim/p/o8T5mxzBjrEUi93PUxXpWgJ0V/CE58JWP6CsllRd22xEt76O7h
 K5tl/lsplHvCPn0SUNdgBZCo9QQtfLBBaGVaFbW5RUoK2+NhEaDNWz/+XwB8MPvSvsAAAA=
X-Change-ID: 20260610-eliza_dt-540bd6f7e883
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781093414; l=11533;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5L6HD2B7635vOlsqIcZK13z4zM+horVPwzgTXq4do9w=;
 b=XnCFoebyoo0H1uUxDLgsKeMLfqN/onSlWB1tj4cvC3oYinCS62g4VWzqXWLtalAspY6K4vx5D
 JbMrqrdJRVqB5GTO0t1CBxEcI0HlEUJXK4GNuI7801QHEvjTzuXlXCC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: g3ntphJTFWxA0W_ffwdXU2SmZd-hIway
X-Proofpoint-ORIG-GUID: g3ntphJTFWxA0W_ffwdXU2SmZd-hIway
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExNSBTYWx0ZWRfX1s4BiKFpklrW
 QA9as6jR3tcGQgGja+niVkKDIcrzvIP8TyAjDsUjt7oc1C7JbTC1+JLp+uO7IRXQN/+sXlG3wNk
 FhRIxSdQXn08yLC319J52biN84IeLv32C8d1bRkGWvtqqJKSk4AYqiw4bnbWO3K5HLmk50ycszB
 yN2snZKnzpOk1pOIsBZI5spVOju5bBIpAeHeYX0/WuKy0yAgagfM22VcautNPNfsqw8Jw8b0SPq
 YiyRH8lU2AcGoZ0mlwm2N2nskGTrsaij3M7dcrY/+tsQtib3Cw12XJcWA3JmBkdsI0NKwbhq+or
 n+Lu9GAO8luYoUUBA6U9HdkotQ22KhHLWNQxJChe8rn6eCQ5InGAiUIsMQmG8Y0A9memC23aP8A
 gh912rdLF3P2JfnreX4cVRZ68nrrnYPwq9f9+WAq2UlapRFl2PER7+oVIog2uH/hAqexFR96YL4
 5rhwDsZ1WWTkdY1j9jA==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a29542b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sPDGGsNVV7SyBOZRkVwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100115

Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
(PCIe1). Add PCIe controller and PHY nodes for both instances, and update
the GCC clock references to use the newly added PHY nodes instead of
placeholder zeros.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
This patch depends on https://lore.kernel.org/all/20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 359 +++++++++++++++++++++++++++++++++++-
 1 file changed, 357 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 7e97361a5dc5..2a51da62270d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -610,8 +610,8 @@ gcc: clock-controller@100000 {
 
 			clocks = <&bi_tcxo_div2>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&pcie0_phy>,
+				 <&pcie1_phy>,
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
@@ -716,6 +716,361 @@ mmss_noc: interconnect@1780000 {
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

