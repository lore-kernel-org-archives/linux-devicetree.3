Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3263DEFE8
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947752; cv=none; b=N1Mff/J/TKoCvgMWB3nX4FvJvXQI9lC0BGw7bfQL+pzsuPlrLy4B/4JIitHfSPPDnSh1JTk+TsKLu13kxXyWeLCHlE3LR81koPgK4D1DXFhQKsjQ0CXRiO9L/NGMeKExz2LWq+gr5jznn4NKuwWbPdnZr7Na4AJccwsP2ZvW0lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947752; c=relaxed/simple;
	bh=eisKC3CYLxZQq/P8w+3Gv95mqBJ3rmRXNiHIB9lj/NU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpLe0Jp1bzzauwqNffwNlDKsdN9m6yNBZPQ4w57Wd0tXZw5hIZlJAiCarWHbcFug/moNx3VQX+bBs8qS7xbEpf4Q/QYbTTXJMcWQVz66PE/UZHsL7FMm7b/6PBc8LDn6Aam14tsEj4opLLYw/kTttWPPObxR68PQqMBIxQZbJjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDtQJUU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0AlJXjx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDtQJUU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0AlJXjx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8B03Y058382
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0hPnB9fJFbGu/sv5Ogg49ECnoHt0baKzNqz
	4h7CuM8o=; b=EDtQJUU+djr8Tz8UjnsFNT6vOGBVxPGg2O04AJ9cO4fG3AjV7b4
	eBBQvyWh/9S7wLTp4cfFKZYgVtbON39hRat7bCAPhd5wI6xF3t8x24uo3i2qogz3
	DszXlkle+M2pk6Lf8oZDRuBPhHD8ppaAHaWyswBmh/0V28gPRCZd6xtr+HGUw8Q/
	ssBToZscv8KffMzXm2vLdwzvJ7y0ZqMFnZ2rI9Zs9ioENgKcaBDtBboifV67yvLb
	rL7h6X69uUUVrIsCWy+dMslxlHuD5dgilEy1essg6t0CIRGDehXs0YIojXPL0+i2
	2yOSyTsG5bQj8+yV5S/07kn1N/l83g7FVgw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahkr7dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:02:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so4264178eec.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774947748; x=1775552548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0hPnB9fJFbGu/sv5Ogg49ECnoHt0baKzNqz4h7CuM8o=;
        b=Y0AlJXjxBuGHemus6FnJodmLc1jUzrmWqvc2OtiwI8X6NFtpAUY7CYN33953phpLUD
         acB6fyBu/uTDoKV0B3YpqBScozM0rPrrFEwjj5I6ObIgwbgS3CBNTqY3xgOzd6i6jkl1
         7/f1t98Ji3Ktg8xw46rMXpmHgRWxuGbmYMxAD3d/0GzhNfc2IjphpCAL0EareVBlkwJ+
         kvwIopF9IV/WgcdEbwt+nQx3OVuNt4uEHTOyJC+YIDCbQmg2FiHltnsnbgZGhyub3dQB
         ULuHueiJUssuuybrfqCN82XX+uqu9sax3F7xPjEgSDw26Suo19nqiynUmi6O3Ihne0S8
         qe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947748; x=1775552548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hPnB9fJFbGu/sv5Ogg49ECnoHt0baKzNqz4h7CuM8o=;
        b=n5pDHRLWwMj4P9528U6+UmKM7mHghmvW1FBsZQ/eyl2Xj3jkwEGPx/kXFzQriI6eAn
         dlLxMkWPca85jkY5rY93YBeoa/F37uutlnEu4kAJkWN6P005tBjnfABcoEP/VipSiAYr
         qaCKUqQtqXTkoDMECieft03A+YQtHo9n5U9+LCjgNM/PxAWMQgZ47+8Zwp0rpLMjgL1W
         XHNsPxvwL+6GFCQydNKMAr/g6uKbtbQqg3qkVpsAd2HYGslj7UDhFGz8XmOGRjZtIY5o
         EeWPjsEoz7XdMnA++muytbWuP8OCYdsBCh0rOQiNz9QJixD3aeC7kKCKzrnyuGrdzq/W
         gOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR2vsHXhHXBdswQ3nq2AByD8OmddjBdpeEvPHoTChtkuk4TU6CxUSnZR3eq7eR0Qijpch6LHwF1UBH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywac7toPiXBmBMx6RINNgFkPa19ImbqR/lvpkKPjiDIDu8ZACFe
	gsSDOnzxVlYvPQ6FukNuyx8UFcQD7xNRXigTUIGHCRSBXU2KlhXCqs9meQnEVi3QvKawhgswvcp
	bYMoDWCd/tvcWqPEeKSb4piE4Y31VdOPsMjZtgOPqlrlfOJGATTUDtdNhRtwkaR96
X-Gm-Gg: ATEYQzwlZdHy7GjzUrBpwVcCxRxkGIidUJMrMCvcK6PgoZqKHu64GN766A9QvvTQxYQ
	vsXpFskL8xEVFSJfTQcpRR71H3R4oExbEa9/XPhISR4mgCHvWlNT9+drZOXh7CxVKZOIZ9yu4Y4
	Q7ZyKgKqETc46TeJp0hhb2iON8C0qNJeeUYmRPQAVjoRVW4jhRdfhbdeDmv/EFztmxUwfvKyGgx
	j0aioDB2Iip+SbCNwbw9JC4df2Pv+37gUIbiBheoLVkObhfSialRInD7vxqCNzEX3T40pv06ptX
	sCFWT6mRCB11Tl9/meryhQszfiuMhD2T27idq+QoD7j9ZS906MgAN3F3tEsX0jjMhwn72ByXpA6
	PB8R1hsQhoTGd1ol3abL46CkbpKkIELBHqGWyoF2obyhBEVpWVBOyoc3oaBCWFzHPrUi4MLIZuZ
	j/iAbwww==
X-Received: by 2002:a05:7300:434a:b0:2c6:1b92:1cee with SMTP id 5a478bee46e88-2c7bd966e93mr1543100eec.21.1774947747212;
        Tue, 31 Mar 2026 02:02:27 -0700 (PDT)
X-Received: by 2002:a05:7300:434a:b0:2c6:1b92:1cee with SMTP id 5a478bee46e88-2c7bd966e93mr1543067eec.21.1774947746512;
        Tue, 31 Mar 2026 02:02:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c8a1de559csm189692eec.22.2026.03.31.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:02:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: lemans: Move PCIe devices into soc node
Date: Tue, 31 Mar 2026 17:01:47 +0800
Message-ID: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NSBTYWx0ZWRfX/3SBHBJK5FCR
 DNzjeMvEKpmc2e82Sz59Fxxsxqkwo3wogsMO+RFCF+fytkP0DBylbyHzkWA2JWS5EZGe8xf5zOw
 TdqvXiNacQLXLWiiK3Tx9+G57bknBlIua9o4/xIM05DDX+lKneIgV/SqGI+10nt8FFuQbW3XRh7
 1xLpwtJ9Cld1AimA+Bqks+myoSxt+i4DnlNlavUFKWpNrcNZS0hh+LtcFjGGlJwJS4Fe+CChYlX
 ke7udw9lJpVAvaKplUbaoZiCz4dg6MwhNLRdf6k+GPeMqqzOAE8vIic53wlgKtOHOeXTeVUrwtj
 uyrX+CY8WXxMwEtaelUVTf+/D1U54RzyS2DprhUjISin0bU8oUJv4HZNAxXzXPIykkj/SyW3OZ6
 RJv56dqdPNaEUs1E4Y2KcuzwrAnIxD80gWxyDcfRI2CR/DMGieCTbgtZDXiESGL7fVd1vN9Lu0B
 vS6XvPtG2tMNcAjkqFg==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cb8da4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rs7BxoZ7CQHKALr8RUwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: McSzQwZkQiTFmB3Zqj7Qosesmr1MO604
X-Proofpoint-GUID: McSzQwZkQiTFmB3Zqj7Qosesmr1MO604
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310085

These PCIe devices with MMIO address should be inside soc node rather
than outside.

Fixes: 489f14be0e0a ("arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
This is compile tested only!

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

