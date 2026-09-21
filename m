Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D23485942
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988351; cv=none; b=QBTevFFqyG6rHd5RTJUF4b311UAz+IUgWJEQhDkdLHkZtdLb6KFECZPgGkCZG+t0xMIPduc2Hbnhb5whRqaVt3sBjIMfOeswKy1/pZ549Ygz/bENCGOm76NPjKljsQA3NNIfaTW9VWc/bi3JXAgETX/osO8IAE427WAqFQXakzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988351; c=relaxed/simple;
	bh=Y9MzhqW8PXyHjlYsNPbgyxZMbRfb9+ARhlcykvF5nuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxTFJV3vr4MJYKIe3uiDuJRtAOI6UBCDLvKpkG+Ih/0V7P9EUrk6SwyNqVbMsil24EU1VMuvUrOqFTV5kgHi/mt/zpd9SRH+rUp35zS4CN6+Pwo73YxCBnoro77NRaLe9bte35i6HZ3Qx3hNCJ7CCwr4jTkobjs4lzy96lb9Odk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L51C3IC6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAy4dY3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L51C3IC6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAy4dY3q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdwAV1563450
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxDVMzkLfjTB9Td7IISpP/51j56rq67Hcj0lw1/B75s=; b=L51C3IC6zElpYgt1
	kHHISR98gHQ/qveUspUUMni1bx7Dfeb/KQkkxlGeQBGXF2aIqxEkx/1ACLubCDfT
	uOp76IskUmbWe6iuirOgcnZsJL2gS/qHaxJBErbho+tAUuH82AfZMxyHa09hOB2w
	37SmBIuD3L/K1H+iIWR6GNuar8DM1aZ1HRQhUy+IDZxRwAq7QiuVFEd4WYkCnCA5
	cS2gCe3LVaqLlpblG4hCuax4LN1keuVC4fVbvGX1VmOjkLLd40ftxQyYDcGbNkeS
	iUY/LNd41mF0dhsqW2vMwg+d4ulvbSDDQDc4H1FqHKlTlBmO+AIAcA+PmoaEWFal
	14sNvA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw0x79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:59:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so2564355a12.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988347; x=1790593147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxDVMzkLfjTB9Td7IISpP/51j56rq67Hcj0lw1/B75s=;
        b=VAy4dY3qq/5b91no0npmwH7haZJRnZJfqZ0bGnaoRDE7FNIuCcGMn79S7Lq/5VgbBU
         BHGchfXRVnlTq2w0DXGXaZIdDuPVFDfb7+bo5sz+0JLQanKqTeRqEOgo+3icMjgBl3OE
         CjECF/YG0NDm3BB8rdGY7s4Jsbmve8CtpvwWMLokdSxjvxNstsc21TaMwKrFhXGC7vNO
         2ZCJ+Uw1iFuHAniSu7UqOve1UjBZ0EqlR3CEdHidQqqHWqPbwtLW3DIfHAB50MUv4B2X
         MOtAwjrk4i1MRs7wN4gZbKiTjpiv8EeJb3pZLmW2luiYyj0hXsl31KHc8D5Zcs9lrKge
         +1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988347; x=1790593147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxDVMzkLfjTB9Td7IISpP/51j56rq67Hcj0lw1/B75s=;
        b=ybBBgPT+6mQV46/uUF5YOkIV9319PWfe6x14Wf15JavNvKQtRbsJD0v6Izmt256HjM
         9P3Q6wFwtibhZtmbkYEKBBxzyi/glnNXM4UVC2o+yP7//Eb0is6cs6kvzaMXjaCJ0DN6
         6PxE9U2D6PytnabcJLhGTcnDAO1ViQNRC9uP5f4gJWS8JkUj2T5CJMAHlzayb5TwF5NL
         uxwBDtZ7hYS63iVV/sES5ft1yN1FLhK8iHYTByEqEVO3QgSwWTHccukejcmm/+J9Or7a
         kKJT/X17aLO+fXdSQIKLcQASXbG5Ib1yqtEvKH8znvr1FiwSlQ9tPQkQoUW05WRut27b
         Xsgg==
X-Forwarded-Encrypted: i=1; AKwUvBzM/EyIehVbRmpsurL/620v7bcF5OKaQzh44lfkJ+81FWpK6FYu3Ffqy/ZfCjO8Euq7GFn5rnoTQJHc@vger.kernel.org
X-Gm-Message-State: AFuF++kTkuZNTJ5NalnvDu7BEH9i9s5nlgTf8Yqza83tXJDdfRGl93cj
	6k5e0Kihawr93yfR22VcKzg8Su6XL72CaQIz9CQTpx/6996KnCSdagXXvOJGfeYIu4pHYORmZP7
	Vx1tDVNatjuVOJ0AsEPSa7DojiXQ1+oKgDJN0dINghe8fyIOz1bSuNLK/rBJcx0TO
X-Gm-Gg: AYBFou2RrB5OX+M0q9K7Zsk2JGRmRQOtpdHnpyJsQG+f/s537CKcrR1EGLVtB5THT+R
	LbT+Kjtb/74YrKx7NyWrb+KbMZ4FWtIrrEFCtKrSuGv8Tq6PlFVYZ2wSYH4DYgvCgW7jS2tDRuF
	1dCt3q+Upp/xjbxkiAdMpB6BfAZobQ9f9MdgkUSEyNJ89VVgzAYhKU08N8FAFp0rEahnbVFv+Sl
	g9+XkHsfquu3GWWbDq3o7bgHp5nuh5ZPJHb//9ULl4u6rWwcprDtBwdZarV2JoqVO3LRkqY7MPV
	WEr1HKfCHhFJKVJq50JxhaPJvSHP0AKkcNcR6K5l5ISYZwVOEOaV+43DACYbZt8uwWuK4dBWJkZ
	754ABkUvNz+BRTkJ0e9M5lE9G1+1tOLR/2A==
X-Received: by 2002:a05:6a20:a10f:b0:3dd:a196:30a4 with SMTP id adf61e73a8af0-3dda19633d1mr9696204637.84.1789988347137;
        Mon, 21 Sep 2026 03:59:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10f:b0:3dd:a196:30a4 with SMTP id adf61e73a8af0-3dda19633d1mr9696165637.84.1789988346686;
        Mon, 21 Sep 2026 03:59:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:59:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:28:17 +0530
Subject: [PATCH 6/6] arm64: qcom: monaco: Add PCIe Endpoint nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-monaco_ep-v1-6-63c5282fb0db@oss.qualcomm.com>
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=5508;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Y9MzhqW8PXyHjlYsNPbgyxZMbRfb9+ARhlcykvF5nuI=;
 b=NLJTJpRfvCihkHu/Mu2lK7vwZT6HDjHInRC/KmKYJT7DBvDeKQna5xui858Sf/joQD6oK0A0/
 Gs8qAt0eWdqDtVsR3T5xJvyJM5H4HdYOregyB5ahJN8J/JiYzXxkBP4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1OSBTYWx0ZWRfXzunDQpT+utWW
 xRZ7sKuI8GyAYxtW4Cq4DuxrXKVlDcakJFmZ0n/rQEoc+jOmKBB0LPZxwkRVrP4vjFSsJH4VJP0
 vrwqMA5rmjQIct++q6rdiv422imaaN/PGuK9kzeXuJRcN6vxo79VZ19BqV7womZ2ja0qPfG1Rg1
 GJge+elE+S+rdmz6lNuo88utxGXPWx6JLUDsFU7Iaggl6t00PeGfRSkRtt18DTVm13AXD9YVSTi
 YAq35qLf+jowRVWtmTVpvesQg2cpTzg/3tsaxNJ+fdEdrTEj4gAtMjIP5B3iSQJ31yRzFhNf/tq
 7hiU79jMLx9uL8iFAVzRRM2K4OJqYGKF+oVU4H7h7ziJkA/3zgGBWMiQOdP18ytDQpbRQkZpYyo
 nmRWjXQIyikPs4CMvdEfyhh7St9qM5hforpU2131nE0GcmEwVRF4Td0cDRs1+oAdhwN+FjucehQ
 Fm2tWqVBW6uI9Int5dA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1OSBTYWx0ZWRfXyFZxbIjdALzN
 kWJj5x6VQnhiFIzYg8Cf2vdG6NJHUCo3P6rIGMqFBcW3pnN6Z8nnymg2XOiMP0p/DEAm1PIqDMK
 n0PWq3tWT0Lt/BEySYAqd8ZmVE1y+W4=
X-Proofpoint-ORIG-GUID: OYGWUXU4RGBkhJoNgUkLM5mtKTRLr6yO
X-Proofpoint-GUID: OYGWUXU4RGBkhJoNgUkLM5mtKTRLr6yO
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab10dfc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hNZP5i6h11z2s_4BSHIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210159

Monaco has two PCIe controllers that can operate in Endpoint mode.
Describe the Endpoint nodes for both controllers, including their
register regions, clocks, interrupts, interconnects, IOMMU mappings,
resets, power domains, and PHY connections etc.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 144 +++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index d7d135e87a8c..8f2f0941383a 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2405,6 +2405,55 @@ pcieport0: pcie@0 {
 			};
 		};
 
+		pcie0_ep: pcie-ep@1c00000 {
+			compatible = "qcom,qcs8300-pcie-ep", "qcom,sa8775p-pcie-ep";
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
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x0000 0x7f>;
+			resets = <&gcc GCC_PCIE_0_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc GCC_PCIE_0_GDSC>;
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+			pinctrl-0 = <&pcie0_ep_default_state>;
+			pinctrl-names = "default";
+			num-lanes = <2>;
+			linux,pci-domain = <0>;
+
+			status = "disabled";
+		};
+
 		pcie0_phy: phy@1c04000 {
 			compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy";
 			reg = <0x0 0x01c04000 0x0 0x2000>;
@@ -2596,6 +2645,55 @@ pcieport1: pcie@0 {
 			};
 		};
 
+		pcie1_ep: pcie-ep@1c10000 {
+			compatible = "qcom,qcs8300-pcie-ep", "qcom,sa8775p-pcie-ep";
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
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x0080 0x7f>;
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc GCC_PCIE_1_GDSC>;
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+			pinctrl-0 = <&pcie1_ep_default_state>;
+			pinctrl-names = "default";
+			num-lanes = <4>;
+			linux,pci-domain = <1>;
+
+			status = "disabled";
+		};
+
 		pcie1_phy: phy@1c14000 {
 			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
 				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
@@ -6225,6 +6323,52 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			pcie0_ep_default_state: pcie0-ep-default-state {
+				wake-pins {
+					pins = "gpio0";
+					function = "gpio";
+					drive-strength = <2>;
+					output-low;
+				};
+
+				clkreq-pins {
+					pins = "gpio1";
+					function = "pcie0_clkreq";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				perst-pins {
+					pins = "gpio2";
+					function = "gpio";
+					input-enable;
+					bias-pull-up;
+				};
+			};
+
+			pcie1_ep_default_state: pcie1-ep-default-state {
+				wake-pins {
+					pins = "gpio21";
+					function = "gpio";
+					drive-strength = <2>;
+					output-low;
+				};
+
+				clkreq-pins {
+					pins = "gpio22";
+					function = "pcie1_clkreq";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				perst-pins {
+					pins = "gpio23";
+					function = "gpio";
+					input-enable;
+					bias-pull-up;
+				};
+			};
+
 			cam0_default: cam0-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";

-- 
2.34.1

