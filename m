Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C254E37F75E
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774839144; cv=none; b=b0PR2o3fzzCHKPBkFHhM+qLSgo+T9fJKt6dj/OSn04JCflrADgh7maieiS9V9C9MWBou3RVNDkCmLnDMpGUxFIFEbV/eWHJvCnRnFpPnfwFIuudIpBHnyB61c6ycqOISJ0aMdMJ7pTwUSB86vOx65U4Q+gOaFpXf3f3ORhN3evA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774839144; c=relaxed/simple;
	bh=sGKgY5fAa0UvVj+12R8Smo+AdjPWqdSmB/Ospg2GarI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2T2075I+VUVYVpm9Jqp7Zn2ML4IDQk1Kvy9YvMfiElzSxF2qWo2g6CJDoxru2kraO5bVEtHuNdNeeuICpoEVyWea2JsPFbJd2vRQj38M4lhsqm4giGEoPvzCvsLvdrPypmVsiMCgwtHzbI/RNlyoQNBqKryECNo3GMY8/7C+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULoe35FX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0Ly25Qn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULoe35FX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0Ly25Qn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TIMUcq1747923
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otnhQDCA/EVhv9pthT+cS4OFEczDuPC8D+Xc5fYJuM0=; b=ULoe35FXtP36aUwW
	NKp54fCEpoL7fmGFRwScBLGY7pvq/s+d/HwL2ylvlaZO1SOD0mSK85DasIz2F4WQ
	gl3127FTsv9ZrOJP2uuzGEe+fOZPdHUVHymHyvSXrwowbR9RJuKCiYDA8sth4py7
	33zbWrJ1OUb2NX8Rey+FI58JLGXjs3Hfy+tblSqLrGpfj5gvpHVMcLgacJzb97XB
	NsyrzF30qIc0FsLua57e22+cdaDbUN6NWrihV6j2WdtMLTGeczQxc8OtlWFY4ewa
	0fAPtbXUBWisC3J7BDkbbgMS2ePfz9NaY3QlKgVIhHIrRPRvzLDrgV2WnxNUISSN
	IkaCHg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7c48s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:52:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so37885515ad.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 19:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774839140; x=1775443940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otnhQDCA/EVhv9pthT+cS4OFEczDuPC8D+Xc5fYJuM0=;
        b=b0Ly25QncEm4RxiLjLC1LTBsM6k4uBSYWtA55070ONWyM6tc9LhHinvXpvcCTsmwJX
         WINaNrpMbKPpt4HFiG7lnQsnTouJf8FzXTxAdmDG34tdxl4A5woQeFN1jVN1MHAx4NdU
         3Ed1FRawtiW1wISAgSwduYucG1T94eFAGgrWhLrgnA5tVHcwdn6JJ94c5VlQzeTIUeD8
         PXhGzRDjZZd7MO9D7AUlU2qkiZ9RujS/xBQa0BuRz2COypmC97lvkCpEQ0vW8pPnvVJD
         7cNYV2+rtGsepOAvKjImvcup7ml6qjU2mwqer0nOkEhPbtGoP8dxEPDPYvjLnfeelZT/
         ZsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774839140; x=1775443940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otnhQDCA/EVhv9pthT+cS4OFEczDuPC8D+Xc5fYJuM0=;
        b=JIx6pn2A2qMyA+5Oa1dbILZCFwGV+tERcF31ETQVNIlUfPD4u8NVkrSvf4vLlJNUmN
         UsENqD+xU1qFJCTW+idEEXUY2SJJa84qdqnGbFxPG5MeNSZjlgsWzmrV0NXfyKurEzY7
         5fkSABa4ErBQL5dCcJ/Rb7668n1KhwKInjQqkyGv5THjNwb1XF2NpEKfTYMI3Zglsmqu
         KW4FU9dNQeiQjNMDn9bIAp5xk8kQm2c/cpVAU2ndg0euMcBjeVYgv3qlfRwEMJnlTu2D
         6CF5GZDcnZsRv9MpC/J4I03NihpJ7D6lwi6yrAG1KRBnCJjtgt04gXFkLte6kEDShNnT
         WwBg==
X-Forwarded-Encrypted: i=1; AJvYcCXcs8HUQ0phPLtGCfEm5dPoyb/xjBLu3aYnVCraeLnGJ6YZGklGK4Ywi76QSWd49A2wkUjpGc/n/YaJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvSZUN+baXWXzAsBxBOLl9CecOY88RMOUOoFUJcCNYyvBVQQcC
	0DTlwkTy4Hk0Dy6Vkrk+9P9oM8aVvHl8BZDFUiwfoopvAudxYSMSSkiLoaJxOhMBj6GygyfGB+0
	Pu1hFh/lX5JbofZ14D00T12+SjwCiQhL56GRJx+jS5/fq0u0yAZv/+MLIGQMDXjiJ
X-Gm-Gg: ATEYQzzesldpOZbrRqXG7eZfxuPlxhs/+9LC8w+y2cq2XIbY+xf7IACpcm+BrGmmJ+G
	/DYL4rZu+27VhqwqvidT+BAyWMYzIK77SPubKUOnocxqh/kt5/DwlrB8upobFGIc6jyG32PGFjC
	jdO6RRz2DDYkI1Hi+cd3z2Ki0Rulk0fyHQNJhw15+yA7jYk1SdV1tYVTuWZy3zuobD8CuO9dsud
	jHNXgLU8cGl/JjkkR/A0XyPIwheqg7bh8HR5L80Pcsa9gwjTEHi9tMxXismZnnqPcsVddUxsUlz
	xjx1BO+lx2ao7QB3FVhBHZynJIpN/Zqc7vrFHDR5WXcM/IrkIIkK4JDwHC/9WRmCpN6VvcZcM/n
	bsWC9icdytyGoNNnPHV93klcv8GNmZ6feITR9+oF/2SBebfyXHdm09R618xch6TkZmVy5ilkE0m
	3D8wVKgjq4ELHWkGo=
X-Received: by 2002:a17:903:2f8b:b0:2b0:53b6:d0a4 with SMTP id d9443c01a7336-2b0c4863590mr125933195ad.12.1774839139555;
        Sun, 29 Mar 2026 19:52:19 -0700 (PDT)
X-Received: by 2002:a17:903:2f8b:b0:2b0:53b6:d0a4 with SMTP id d9443c01a7336-2b0c4863590mr125932515ad.12.1774839137944;
        Sun, 29 Mar 2026 19:52:17 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642864sm69624865ad.12.2026.03.29.19.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 19:52:17 -0700 (PDT)
Message-ID: <82bc146c-dc41-4d55-97c3-7819a3ec42cd@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:52:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69c9e564 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yOmPoFu1Ht0vmZQZIAsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: uyxdYLcriRhFXEQoPi1B55e3H1pPjKoK
X-Proofpoint-ORIG-GUID: uyxdYLcriRhFXEQoPi1B55e3H1pPjKoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAyMCBTYWx0ZWRfX61FrlponCbpq
 BM7Pb3BrUgK8/VF9zHxViBjzTj2jQzdjsMvxamr/WTRLVh0FZDXP6YOPLvQ6eqFqiYEuUY+736F
 CNC44CCNXAEgUTsZUyMmOf2nqEmEsToRV4YRm9Bg4nd9g/CNL1cm4z7totHdLXtTJ4s/hjlr51f
 RwioRQVAJZkxvYlzD2gyVT38nkN9b+X49rM3gcy2hLlRZSRgl02x97n/NPDYffUhWMg5cLZviaH
 mI8b3ppEQeLftQdzrWpUvshlS60WThgDbtRqUYS9mBz7TM6Dz/btEr7GRks4udsHcGRQkkKKHdH
 hjWsYhjAZprj/lamWeT5xbarXmBNyL067luAodzwHr5DzV/fnldEYvU/pVgbvNwVXkYuuUr5neM
 TYq3PLr/OyagBnoaOsZVeh+QgqHtvb5w04jkcxmnWSK+5bf5irUnzBy1n5FhyB0kbkc55zZt+Y1
 PSdpirdry/xefNEcVxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300020



On 3/30/2026 1:52 AM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Add the base USB devicetree definitions for Kaanapali platform. The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 154 ++++++++++++++++++++++++
>   1 file changed, 154 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index ac6a6c789902..08d7c1a1d829 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -6026,6 +6026,160 @@ pdp_tx: scp-sram-section@100 {
>   				reg = <0x100 0x80>;
>   			};
>   		};
> +
> +		usb_hsphy: phy@88e3000 {
> +			compatible = "qcom,kaanapali-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +			reg = <0x0 0x88e3000 0x0 0x29c>;
> +
> +			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible = "qcom,kaanapali-qmp-usb3-dp-phy",
> +				     "qcom,sm8750-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x4000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&tcsr TCSR_USB3_CLKREF_EN>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dp_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_dp_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_dwc3_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_dp_qmpphy_dp_in: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		usb: usb@a600000 {
> +			compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			interconnects = <&aggre_noc MASTER_USB3 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_USB3 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +			iommus = <&apps_smmu 0x40 0x0>;
> +
> +			phys = <&usb_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,usb2-gadget-lpm-disable;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
> +			snps,is-utmi-l1-suspend;
> +			snps,usb3_lpm_capable;
> +			snps,usb2-lpm-disable;
> +			snps,has-lpm-erratum;
> +			tx-fifo-resize;
> +			dma-coherent;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dwc3_hs: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_dwc3_ss: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
> +					};
> +				};
> +			};
> +		};

please make sure the nodes are sorted in address order.

Thanks,
Jingyi

>   	};
>   
>   	thermal-zones {

