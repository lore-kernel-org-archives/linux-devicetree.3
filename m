Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447217;
	b=szu+l8AEaQapfXkkjRAZTU6OwFzD3nu9AUq2cisfXWyf7jL1Z4n2/P4831oZR75ZkDb2
	 bNEhvIXf5ajc4e3BL1uqLestmWCZonoMPcT7D/gY/XvMusTOXeN6MhEEwgi5UqGGKvdOF
	 xOdkfssT9JA0upmR6JHXVUKYh5iJlNsBhq0oiH8hKVH4JYJm0oyIFvxWCCMN67alhG1WF
	 YObMJi/3caClp3wH73YIrnz31MQOiBIwxwWb4XpzJmjhhlRKoTNIrUliiBqFcEUcQLYLw
	 wBYVdS4b8QeRGSn1BxiG4WwbLG9z2+r/8QfuCA7QCrk0FMk2bCfqvkq/uXo75gNdqEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iwY05ePos+qS824cLnj8Amy3FhuXuwmHwQQSArwlNIk=;
	b=XC0RMviRVuPQf2BxOiFEU6NHoyE5a4++rpfL/FrvpiEc/HNvY3uiYX795ZbcnOhyyD/I
	 Pbej/bNvNIGb/lymHogSKEWD3dTmedZMDlJsghDW4/UQS9Hno+9IEcCoUasbI5gg+IpWt
	 WX6C+VkQMYsXdQoN8Dd9c1WW0UNYIJeq1iwmH4Lmf+Va9ZG+z0ald9VPliRfcEYVkNVeZ
	 aolQ31JxFydEBASwPxPKosAazo8Sdofo/wN8DOywTGQXT9HMrfDFynNzCiClKn3QcPq/k
	 kmrjFiRhzDIA92udOqTfla1PsIuCa7fY1JkbbauKDzWdcUcrubuEpfftS504LhXC3/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kihrlvM+;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C1606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kihrlvM+
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab30d04674so2256261fa.2
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793447215; x=1794052015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iwY05ePos+qS824cLnj8Amy3FhuXuwmHwQQSArwlNIk=;
        b=kihrlvM+r/axU9K4onIBLVnsgAa7aihHO7bKTH0CKBkr0mLrslDBgHPJ0hLNouSI8v
         Xd5IzzSJWtVZGhGjagABf2x33ruhhbx5/q27wBI9HjqpE12zwsVlT49Rjb2+X30DxgLK
         KYWTEjmOHVlVTt1/qZmqPgNHoSCAF3uJOlA6ifo9YmAyBPLvVO6GHteaFu9n7FLmeiBG
         AQNTPS59mN8u9NTKi6coI0YOO312VoKVtzBcpxYgkTZUSKEjWF2ePVII/0IaJvaJl/zK
         AHdQV1q9DRdknG3U2lUTZNL4pIrPdlQz48InpNPgeQlLEfPAxNsZCa/1WvDFuyDvPH2n
         uWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793447215; x=1794052015;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwY05ePos+qS824cLnj8Amy3FhuXuwmHwQQSArwlNIk=;
        b=nlGB9MrroXzEQ5c8ypnlZuitonvZN3Trqn3Nw/ni49vEP7MeLeDSCWp3+E8oxdA0OZ
         i9ghkss+vn54Aa06M42CAxemHJhrV7tJRle3sXaJbZMRygZQBN8DeoZ4Zy962n1kfwKp
         MgMw60C9o/YzuiqpWEpkOkqpVdwwWk9Q8Xv7OgtUncdeiFpQye9s1fgD4zeVenSpDdP2
         XkbueSVDl6brKOkJ5Gh3bSyk6ib2h8gggovSkcsxljYoDCHKTm22TI1qx0q9AaxL3nHI
         hHFq6OTzn4g2bo4ly2lBwuIzk85G2trzA42+ymNfMidJoQeSgOhRZOqejef90izjg/dZ
         A6rw==
X-Forwarded-Encrypted: i=1; AKwUvBx9J3mqBKPpQDKZyyE86N0763EeRCZTQcR5kzd5a6FUaSLFIigPXY/Xqarap5lM/Fyzn8N1fG+sPYEA@vger.kernel.org
X-Gm-Message-State: AFq9FYJaRKkAmkWw0YTyPlHYR+dFf1CutjaMpzCIsxlotBOaKB08PFoJ
	PaIz0Jh6siwiiqtxI27xWmCyXERI9swCGtr0Q5lOs4SBCh/QXwZNvV0p9jQUJiQVJLQ=
X-Gm-Gg: AYBFou0mL0utg4E4APrO6uVpoqHpy7A/m/FlwC0D1x53AcIXC7H9le+zx62EL8kinCD
	xNBtDxfS8EoT4Y9RA5Ze5aRxfD63mRZO9wYjU9DbchhT1KMhFynMDYgwO2de9nr14K1vIVY2yNb
	+jdrUdWvQgA0B1PAkAGLMMMf/BQ0GVEC2thubJY8bvyleAeh6IQktJfjF6u2vNa5tpfkl/VEj2K
	BwKVm392JxkfpbCmwbZek2IJmQolxjBL8z2xtxvIMeSGczDR4jtKEekVkE5WD0gsJN9+bnztDHp
	r9wNmfSG6Bgtc3+j6+Y8MrIJo1tSF5jgGV+/mEfdJS50lrawyhyI9D1uB+oCwflFnimcZS1/CoX
	49eYePdtU2T+zOq8kXQTrlG013hiGFBbusHA8E0wDqM7h5nTXR2b6rZSauDGiiEXaZ2G9jEbzDx
	0R8EIVKBfI3GvhlQr9ZHJHItbI4GJwv5eiODBJl7gI9X2ckeZSTLkP2N9u/laeIkFEdTtVBEX6n
	d4AcjRepPL4gpJ5bQixV1oA/q3qV+gOm9govdnfdgAreKsyxf2e9RQX0X0fxD6/vPklp3rSB3BF
	1D3J2DQ69Ts34XJRngXi906KTJQQQGtvz+wSobe1DBYqPqzT/WxOAGYRmSBZIXycUkm94v7vD6q
	uVHL3J04=
X-Received: by 2002:a05:6512:6d3:b0:5bf:b8f1:8109 with SMTP id 2adb3069b0e04-5bfd95571d2mr1997148e87.4.1793447214848;
        Sat, 31 Oct 2026 04:46:54 -0700 (PDT)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0747766sm515667e87.69.2026.10.31.04.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 04:46:54 -0700 (PDT)
Message-ID: <55aef663-254a-4d36-b9ec-3ce7f4c4c74a@linaro.org>
Date: Sat, 31 Oct 2026 13:46:53 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 17:20, Hangxiang Ma wrote:
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
> can be enabled by board device trees.
> 
> The camera subsystem contains:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 401 ++++++++++++++++++++++++++++++++
>   1 file changed, 401 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index e48a179d0722..0c8fd7da55b7 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -20,6 +20,7 @@
>   #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -3597,6 +3598,384 @@ usb_dp_qmpphy_dp_in: endpoint {
>   			};
>   		};
>   
> +		camss: isp@900b000 {
> +			compatible = "qcom,kaanapali-camss";
> +
> +			reg = <0x0 0x0900b000 0x0 0x1000>,
> +			      <0x0 0x09253000 0x0 0x5e80>,
> +			      <0x0 0x09263000 0x0 0x5e80>,
> +			      <0x0 0x09273000 0x0 0x5e80>,
> +			      <0x0 0x092d3000 0x0 0x3880>,
> +			      <0x0 0x092e7000 0x0 0x3880>,
> +			      <0x0 0x093fd000 0x0 0x400>,
> +			      <0x0 0x093fe000 0x0 0x400>,
> +			      <0x0 0x093ff000 0x0 0x400>,
> +			      <0x0 0x09151000 0x0 0x20000>,
> +			      <0x0 0x09171000 0x0 0x20000>,
> +			      <0x0 0x09191000 0x0 0x20000>,
> +			      <0x0 0x092dc000 0x0 0x1300>,
> +			      <0x0 0x092f0000 0x0 0x1300>;
> +			reg-names = "top",
> +				    "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "csitpg2",

These I/O regions should be named "tpgX".

> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
> +				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
> +				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
> +				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
> +				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
> +			clock-names = "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "cpas_vfe2",
> +				      "cpas_vfe_lite",
> +				      "csid",
> +				      "csid_csiphy_rx",

This clock should be named "csiphy_rx" like on sa8775p and a number
of other platforms.

> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe2",
> +				      "vfe2_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid",
> +				      "qdss_debug_xo";
> +
> +			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe2",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc";
> +
> +			iommus = <&apps_smmu 0x1c00 0x00>;
> +
> +			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
> +					<&camcc CAM_CC_TFE_1_GDSC>,
> +					<&camcc CAM_CC_TFE_2_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "ife2",
> +					     "top";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				camss_csiphy0_in_port: port@0 {
> +					reg = <0>;
> +				};
> +
> +				camss_csiphy1_in_port: port@1 {
> +					reg = <1>;
> +				};
> +
> +				camss_csiphy2_in_port: port@2 {
> +					reg = <2>;
> +				};
> +
> +				camss_csiphy3_in_port: port@3 {
> +					reg = <3>;
> +				};
> +
> +				camss_csiphy4_in_port: port@4 {
> +					reg = <4>;
> +				};
> +
> +				camss_csiphy5_in_port: port@5 {
> +					reg = <5>;
> +				};
> +			};
> +		};
> +
> +		csiphy0: phy@9523000 {
> +			compatible = "qcom,kaanapali-csi2-phy";
> +			reg = <0x0 0x09523000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				csiphy0_in_port: port@0 {
> +					reg = <0>;
> +				};
> +
> +				csiphy0_out_port: port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
> +		csiphy1: phy@9525000 {
> +			compatible = "qcom,kaanapali-csi2-phy";
> +			reg = <0x0 0x09525000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				csiphy1_in_port: port@0 {
> +					reg = <0>;
> +				};
> +
> +				csiphy1_out_port: port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
> +		csiphy2: phy@9527000 {
> +			compatible = "qcom,kaanapali-csi2-phy";
> +			reg = <0x0 0x09527000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				csiphy2_in_port: port@0 {
> +					reg = <0>;
> +				};
> +
> +				csiphy2_out_port: port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
> +		csiphy3: phy@9529000 {
> +			compatible = "qcom,kaanapali-csi2-phy";
> +			reg = <0x0 0x09529000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				csiphy3_in_port: port@0 {
> +					reg = <0>;
> +				};
> +
> +				csiphy3_out_port: port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
> +		csiphy4: phy@952b000 {
> +			compatible = "qcom,kaanapali-csi2-phy";
> +			reg = <0x0 0x0952b000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				csiphy4_in_port: port@0 {
> +					reg = <0>;
> +				};
> +
> +				csiphy4_out_port: port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
> +		csiphy5: phy@952d000 {
> +			compatible = "qcom,kaanapali-csi2-phy";
> +			reg = <0x0 0x0952d000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY5_CLK>,
> +				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				csiphy5_in_port: port@0 {
> +					reg = <0>;
> +				};
> +
> +				csiphy5_out_port: port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@956d000 {
>   			compatible = "qcom,kaanapali-camcc";
>   			reg = <0x0 0x0956d000 0x0 0x80000>;
> @@ -6548,6 +6927,28 @@ pdp_tx: scp-sram-section@100 {
>   		};
>   	};
>   
> +	csiphy_mxc_opp_table: opp-table-mxc {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +	};
> +
>   	thermal-zones {
>   		cpullc-0-0-thermal {
>   			thermal-sensors = <&tsens0 0>;
> 

-- 
Best wishes,
Vladimir
