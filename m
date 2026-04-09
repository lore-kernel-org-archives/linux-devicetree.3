Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A863AA503
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725911; cv=none; b=DJb105+3z4s2e1YfTLBfhuO3XsuczgP9f6rMlldFFPcD5CXn0kumwvSW0n+xCQJ0HbsbrO/jm3vwqfwT2JfuyEUe7XGwhWsx2KStZEwWjGrWLbB6H7f70ZnMCr4sQkphd4EPth49gMKSd8JEzZYM70hs6wB1u/sDSPUdpV84WvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725911; c=relaxed/simple;
	bh=d5tVZ9x3AMkoihFUNRIRknlUL6tLTo91Q/Ds963Z48g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2e7IYjKFVIFlPOUNxpOWtlurn8F1krKcUORbwSpgxSrl9Cr84D3CxDkDkp9eOf36eDwO7ivj6gxDyoy1PkSKSV35G8ZHVvZzzd5YNc5DdCXBcCu8nKZbMt/lEKjfv3TB98vd1hb0oNVCmk+MDbeTnh459PoQ1rleX7c7sOejp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+U1q0Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fD6Envdq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+U1q0Gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fD6Envdq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395ULlb3712984
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8FP1UTQobMx
	I5TbGF5uJY5LSXl0z0TdNDjU3Y36Lbtw=; b=k+U1q0GduFaYAy8AOKFVJqcuUaJ
	ylvDiBnnRlyhRF5jDEJvIQqar6LwicpVZ1XKUfDwoIQFW5JPSuToyoYwK9ShOwvK
	/r0biVO7k+0HX+E3G1NBACwdSG04G1grpwXo1ehX3rfTrg1wkiPbCnjDa9T/KGX7
	NDzvpru0cck9dsmMQBCSGrvwp1/jyjxbuUPVSPrRSJ/cKinH8Y93BBMmORxbzc/x
	MZ6qgvAeD3oFSxiBQ3NGrpQgO+bRybUDNBWHr79hu5d0KHZX+I7ivSDAUQAjQxyc
	37ObOqp6e83jIukXGykewF2u0zcJL13R+gSFBg02E/yRtnM7noF7PZF2Yww==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74b8ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:11:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c68a134df8so458419eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725908; x=1776330708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FP1UTQobMxI5TbGF5uJY5LSXl0z0TdNDjU3Y36Lbtw=;
        b=fD6Envdq1PJKSivjbwg0VUbbF7Or8XAy93ryqkfKkB8+mLEiblP1U3X4JJF39Ly3VZ
         ZTK234Tq6TxFvb5Eum5tAGf5swJqR+jXo9u/Mb7S7EaHgMHVLFPCzN5fywOE/qyHRbH3
         +z9rk4aZetgom5k5MGNgWIT6TvCgwC7nIW8KuFRzNJaJo1Dn+Z+sjjKTCF/2Ebbl808M
         EPLjuxnGbSmNJaYTmIi95VZRtZLMWMgpoH7ruTtpcD4ncQYNniNq9GEmCzEVQRzEucJO
         uDHIFoGcuagy16CM1YfyEzkN0SV2soWm1D2BXFHNBKlQTntvtKDxjBx9PAJdjLWrbw+s
         bOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725908; x=1776330708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8FP1UTQobMxI5TbGF5uJY5LSXl0z0TdNDjU3Y36Lbtw=;
        b=Ub4w2/xgfiDRrsN6j5ccgi2+e6Tkkd90Hr2lf2joAy6tyZYsg68DY3rxvh+BXVWL0K
         S77iXOTt6QyCoxBR2j1KO7jTQ40OhuTYcLLGjlERZdErP919csQfR5KtdCIbgx0kZmYS
         hN001zJyEMQo2hEJdoj6PW/TBWQnPywSECCbRTAFH+eSGmBhiAhC1bzk0AeMR7tDQxfK
         do5O+Or0NK/McAD8+5E/evp7zQlxKKKx0pH5uqzw07ThtiJOgCwtZv1NT7wKGCl4lD9a
         oki7+f8tRilBWjePrgnK5QPKKumZRodYODeX3o/6ECMO5KNcaND9+GCZzOZ7ZF0p60d2
         oNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU95mLcejCTlb6a0rldC68YuCZ6ZcXNFxxjx3sX/5K4zuZIlshV9P9bRimJu3rEHoU2Quo0+MNKuk8A@vger.kernel.org
X-Gm-Message-State: AOJu0YztGAZ39XGZEvIDNjQKmjRpIERzJypd/GZuQqtmSNtZKoL7B9Vu
	QOV66fR45lqms4l9DI9jj+qVXNENBW0Jsy2sAnwGcnc8pNZxDDQT68D3lufNkX3Du8oGOaeirub
	nltS/kD7aSi0cHkE2eihX62ltoeBaTuvF6JVHDguM2imLr8/4kLds/XEiTdELaTFrdeaync/D
X-Gm-Gg: AeBDieundGplRBuDgiH1d87iTNenapsPkgJ9VUFjigs7zl60SDQwAoF+h8WjXG0ScmU
	Q3jLJOzytCQk42TSYSySdXqalBCjmCeZ5lfzW0bTpi2OfqIuM+bXicHOxXeIH3ZdlKt3hLgSeI3
	mOaGZDYciLO5f/cVyBnG5/I+UNH4wphgiHdQ19BbzguiNc+82TYDWkqacFWWebdVI0PvDhGUsAZ
	JGEzcu2PM9q2cZHxr4HKMnJk2Tok9QjB8uNf6whHoRbZP/3GTsDHo7Fe71ZQxOdeVY3Hfgteo2F
	QjtQgY4SXmYvDpx71jNaurNGc6gPPQuZ8k0MTRIzj++Tr/tVU8gBiDR2qo+c2QYHExqy6xRs7KD
	pXRRKexdpzNAI0Csko4q6O19QbvvetN17rgmuG+tULwy0y5xGAGBI2L0N4F/BkDKzocbgU4PiHF
	20OhTfxA==
X-Received: by 2002:a05:7300:a2c5:b0:2c9:ee15:a0f1 with SMTP id 5a478bee46e88-2cbfc16ec52mr11893033eec.27.1775725908087;
        Thu, 09 Apr 2026 02:11:48 -0700 (PDT)
X-Received: by 2002:a05:7300:a2c5:b0:2c9:ee15:a0f1 with SMTP id 5a478bee46e88-2cbfc16ec52mr11893011eec.27.1775725907440;
        Thu, 09 Apr 2026 02:11:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 1/8] arm64: dts: qcom: lemans: Move PCIe devices into soc node
Date: Thu,  9 Apr 2026 17:10:53 +0800
Message-ID: <20260409091100.474358-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d76d55 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rs7BxoZ7CQHKALr8RUwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: oRgEdE_9czZdeil9Bpzhi9ysAZkJlt_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX6uLHeUs6xpTF
 4AxP1lls0WAvV3IUJoxQ1JF6hlWauTDrgSsvOpvZjx10j1tBOAqvP2x0h+dme4cCKKvCnH+lzhQ
 uhZe2w0hyUxucUvebd/jxaYxIGZMC8yDgSkeqIHnHC/xsY2IwbZvzhC/EZNi4oSIA4stvaU34le
 N0EqervyepFn6CkoPz872APOqvJaA2Qq9YHmywuJx8AhcVxhpJghvN8ko4uOqBR3wI0Vyc5XOx4
 iSdpFgmB9/+xOcpn87tcuxU1pOb3WWZBpX0UCVE79vVsDnPvIizeDurnb4/liRf2VBGie0I6bQT
 7EO3dAhENkzHtXFztVNab6Y6sUI650GwM/mT0xQeOQ2Vaj/r8TyktFw0941Rns6QYNP6gDWhy5K
 rX6FjAIEK7qeGjcBe8Wmrcq9QxdbNx8PaQ7yv6fFEXMa/wIg7+f5oSyl7MmWp3KPVYBV5Y+2CKT
 +SosmeUQWZTgqgi42nw==
X-Proofpoint-GUID: oRgEdE_9czZdeil9Bpzhi9ysAZkJlt_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090081

These PCIe devices with MMIO address should be inside soc node rather
than outside.

Fixes: 489f14be0e0a ("arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes")
Reported-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 692 +++++++++++++--------------
 1 file changed, 346 insertions(+), 346 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f565067bda31..03a712d82d78 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2694,6 +2694,352 @@ mmss_noc: interconnect@17a0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		pcie0: pcie@1c00000 {
+			compatible = "qcom,pcie-sa8775p";
+			reg = <0x0 0x01c00000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf20>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x4000>,
+			      <0x0 0x40100000 0x0 0x100000>,
+			      <0x0 0x01c03000 0x0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
+			device_type = "pci";
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <0>;
+			num-lanes = <2>;
+
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
+				    <0x100 &pcie_smmu 0x0001 0x1>;
+
+			resets = <&gcc GCC_PCIE_0_BCR>,
+				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc PCIE_0_GDSC>;
+
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
+
+			status = "disabled";
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie0_ep: pcie-ep@1c00000 {
+			compatible = "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c00000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf20>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x4000>,
+			      <0x0 0x40200000 0x0 0x1fe00000>,
+			      <0x0 0x01c03000 0x0 0x1000>,
+			      <0x0 0x40005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x0000 0x7f>;
+			resets = <&gcc GCC_PCIE_0_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc PCIE_0_GDSC>;
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+			num-lanes = <2>;
+			linux,pci-domain = <0>;
+
+			status = "disabled";
+		};
+
+		pcie0_phy: phy@1c04000 {
+			compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
+			reg = <0x0 0x1c04000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>,
+				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
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
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+			reset-names = "phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pcie1: pcie@1c10000 {
+			compatible = "qcom,pcie-sa8775p";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf20>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x4000>,
+			      <0x0 0x60100000 0x0 0x100000>,
+			      <0x0 0x01c13000 0x0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
+			device_type = "pci";
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x1fd00000>;
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <1>;
+			num-lanes = <4>;
+
+			interrupts = <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
+				    <0x100 &pcie_smmu 0x0081 0x1>;
+
+			resets = <&gcc GCC_PCIE_1_BCR>,
+				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc PCIE_1_GDSC>;
+
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
+
+			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1_ep: pcie-ep@1c10000 {
+			compatible = "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf20>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x4000>,
+			      <0x0 0x60200000 0x0 0x1fe00000>,
+			      <0x0 0x01c13000 0x0 0x1000>,
+			      <0x0 0x60005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x80 0x7f>;
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc PCIE_1_GDSC>;
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+			num-lanes = <4>;
+			linux,pci-domain = <1>;
+
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@1c14000 {
+			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			reg = <0x0 0x1c14000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_CLK>,
+				 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
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
+			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+			reset-names = "phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_1_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;
@@ -8601,350 +8947,4 @@ turing_llm_tpdm_out: endpoint {
 			};
 		};
 	};
-
-	pcie0: pcie@1c00000 {
-		compatible = "qcom,pcie-sa8775p";
-		reg = <0x0 0x01c00000 0x0 0x3000>,
-		      <0x0 0x40000000 0x0 0xf20>,
-		      <0x0 0x40000f20 0x0 0xa8>,
-		      <0x0 0x40001000 0x0 0x4000>,
-		      <0x0 0x40100000 0x0 0x100000>,
-		      <0x0 0x01c03000 0x0 0x1000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
-		device_type = "pci";
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-		ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
-			 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
-		bus-range = <0x00 0xff>;
-
-		dma-coherent;
-
-		linux,pci-domain = <0>;
-		num-lanes = <2>;
-
-		interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi0",
-				  "msi1",
-				  "msi2",
-				  "msi3",
-				  "msi4",
-				  "msi5",
-				  "msi6",
-				  "msi7",
-				  "global";
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0x7>;
-		interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
-
-		clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-			 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-			 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
-		assigned-clock-rates = <19200000>;
-
-		interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
-			    <0x100 &pcie_smmu 0x0001 0x1>;
-
-		resets = <&gcc GCC_PCIE_0_BCR>,
-			 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
-		reset-names = "pci",
-			      "link_down";
-
-		power-domains = <&gcc PCIE_0_GDSC>;
-
-		phys = <&pcie0_phy>;
-		phy-names = "pciephy";
-
-		eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
-		eq-presets-16gts = /bits/ 8 <0x55 0x55>;
-
-		status = "disabled";
-
-		pcieport0: pcie@0 {
-			device_type = "pci";
-			reg = <0x0 0x0 0x0 0x0 0x0>;
-			bus-range = <0x01 0xff>;
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-		};
-	};
-
-	pcie0_ep: pcie-ep@1c00000 {
-		compatible = "qcom,sa8775p-pcie-ep";
-		reg = <0x0 0x01c00000 0x0 0x3000>,
-		      <0x0 0x40000000 0x0 0xf20>,
-		      <0x0 0x40000f20 0x0 0xa8>,
-		      <0x0 0x40001000 0x0 0x4000>,
-		      <0x0 0x40200000 0x0 0x1fe00000>,
-		      <0x0 0x01c03000 0x0 0x1000>,
-		      <0x0 0x40005000 0x0 0x2000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
-			    "mmio", "dma";
-
-		clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-			<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-			<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-			<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-			<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-names = "global", "doorbell", "dma";
-
-		interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		dma-coherent;
-		iommus = <&pcie_smmu 0x0000 0x7f>;
-		resets = <&gcc GCC_PCIE_0_BCR>;
-		reset-names = "core";
-		power-domains = <&gcc PCIE_0_GDSC>;
-		phys = <&pcie0_phy>;
-		phy-names = "pciephy";
-		num-lanes = <2>;
-		linux,pci-domain = <0>;
-
-		status = "disabled";
-	};
-
-	pcie0_phy: phy@1c04000 {
-		compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
-		reg = <0x0 0x1c04000 0x0 0x2000>;
-
-		clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
-			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_CLKREF_EN>,
-			 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
-			 <&gcc GCC_PCIE_0_PIPE_CLK>,
-			 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
-		clock-names = "aux",
-			      "cfg_ahb",
-			      "ref",
-			      "rchng",
-			      "pipe",
-			      "pipediv2";
-
-		assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
-		assigned-clock-rates = <100000000>;
-
-		resets = <&gcc GCC_PCIE_0_PHY_BCR>;
-		reset-names = "phy";
-
-		#clock-cells = <0>;
-		clock-output-names = "pcie_0_pipe_clk";
-
-		#phy-cells = <0>;
-
-		status = "disabled";
-	};
-
-	pcie1: pcie@1c10000 {
-		compatible = "qcom,pcie-sa8775p";
-		reg = <0x0 0x01c10000 0x0 0x3000>,
-		      <0x0 0x60000000 0x0 0xf20>,
-		      <0x0 0x60000f20 0x0 0xa8>,
-		      <0x0 0x60001000 0x0 0x4000>,
-		      <0x0 0x60100000 0x0 0x100000>,
-		      <0x0 0x01c13000 0x0 0x1000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
-		device_type = "pci";
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-		ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
-			 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x1fd00000>;
-		bus-range = <0x00 0xff>;
-
-		dma-coherent;
-
-		linux,pci-domain = <1>;
-		num-lanes = <4>;
-
-		interrupts = <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi0",
-				  "msi1",
-				  "msi2",
-				  "msi3",
-				  "msi4",
-				  "msi5",
-				  "msi6",
-				  "msi7",
-				  "global";
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0x7>;
-		interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 2 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
-
-		clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
-		assigned-clock-rates = <19200000>;
-
-		interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
-			    <0x100 &pcie_smmu 0x0081 0x1>;
-
-		resets = <&gcc GCC_PCIE_1_BCR>,
-			 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
-		reset-names = "pci",
-			      "link_down";
-
-		power-domains = <&gcc PCIE_1_GDSC>;
-
-		phys = <&pcie1_phy>;
-		phy-names = "pciephy";
-
-		eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
-		eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
-
-		status = "disabled";
-
-		pcie@0 {
-			device_type = "pci";
-			reg = <0x0 0x0 0x0 0x0 0x0>;
-			bus-range = <0x01 0xff>;
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-		};
-	};
-
-	pcie1_ep: pcie-ep@1c10000 {
-		compatible = "qcom,sa8775p-pcie-ep";
-		reg = <0x0 0x01c10000 0x0 0x3000>,
-		      <0x0 0x60000000 0x0 0xf20>,
-		      <0x0 0x60000f20 0x0 0xa8>,
-		      <0x0 0x60001000 0x0 0x4000>,
-		      <0x0 0x60200000 0x0 0x1fe00000>,
-		      <0x0 0x01c13000 0x0 0x1000>,
-		      <0x0 0x60005000 0x0 0x2000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
-			    "mmio", "dma";
-
-		clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-names = "global", "doorbell", "dma";
-
-		interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		dma-coherent;
-		iommus = <&pcie_smmu 0x80 0x7f>;
-		resets = <&gcc GCC_PCIE_1_BCR>;
-		reset-names = "core";
-		power-domains = <&gcc PCIE_1_GDSC>;
-		phys = <&pcie1_phy>;
-		phy-names = "pciephy";
-		num-lanes = <4>;
-		linux,pci-domain = <1>;
-
-		status = "disabled";
-	};
-
-	pcie1_phy: phy@1c14000 {
-		compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
-		reg = <0x0 0x1c14000 0x0 0x4000>;
-
-		clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
-			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_CLKREF_EN>,
-			 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
-			 <&gcc GCC_PCIE_1_PIPE_CLK>,
-			 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
-		clock-names = "aux",
-			      "cfg_ahb",
-			      "ref",
-			      "rchng",
-			      "pipe",
-			      "pipediv2";
-
-		assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
-		assigned-clock-rates = <100000000>;
-
-		resets = <&gcc GCC_PCIE_1_PHY_BCR>;
-		reset-names = "phy";
-
-		#clock-cells = <0>;
-		clock-output-names = "pcie_1_pipe_clk";
-
-		#phy-cells = <0>;
-
-		status = "disabled";
-	};
 };
-- 
2.43.0

