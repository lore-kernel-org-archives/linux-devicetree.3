Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60043499F04
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942681; cv=none; b=aNx0PW9aOqoHVIcumfm6PQJZVxgAjtgUOQKOT76deqloRs0QHYWOtpnTZGQCGGWaByTegDEzZ+U2j4ULOc5P2Qz+RHBzdSrDqWG1OHi+EuWbiEwiowXKuWs1NH1OQTj5AiLuKx28M19uWDsxTe7jEJbKlM2557kWJxmOBeWasEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942681; c=relaxed/simple;
	bh=rZ8DjkKmBHedyIDcWayVpq5SOsoVmYxXX7VB04WSCkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQwCQi4CagHoOPWXozAv1VMeIgmVHHL/XSZKl+c96WTEBJGi+t0WMSZI/1iPYW0vGv/b0RqUocYxalB91L2CBBivDqfwBHujJIMKi6sA9J6JpN5tf1L0gG7NC7ufg5vF/U0r1NVMWZRoXcpoos1qO39CANFzfzhK9NcgWdHqNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pn0CP8Vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VarJKn49; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pn0CP8Vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VarJKn49"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896Y9aq045456
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 08:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bg/eHNRfWD3uscd40GV8QRig
	po/JtPPXEdYD1Se/H7Y=; b=pn0CP8Vi19ezKuIiBkVokjSghRGhDI8D4h5CtbQT
	zMkTS5BVsNjt2oyJ+PtZsMb9zJu88Lxj+KK0p6Q6uCVYmASChhOn/7Ch8n16iIoQ
	1DOw0f1C+3oh3JrZ1pYU3bud3zj+wCQO1L2/FpiP4kveuJhLuWzgh3rnp2AzEQlE
	BRNQfOVnWVkjw4eGfReXUMzdzF3jB9Z0VOgzWHu3hRtTzuI35cpjyYNi+hob4LN9
	qst7tzAkJcYtjge4E0Sr60uxgNFWY7kivi8Dd71zSCgDdwgr67xLwwIm+GYNl2Na
	XtPrB9m6kYQ+Wqfc9JdeiggBVPq/bIHPE0uIsct+sKnTCw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewk01m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:31:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so5977931a12.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942676; x=1789547476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bg/eHNRfWD3uscd40GV8QRigpo/JtPPXEdYD1Se/H7Y=;
        b=VarJKn49yLWvlpeYk5lP1QtpfsNogouhS2Dfinyj5UOyjfXZgHo/8vQLAygunuB817
         lXLlPET7x0wzkoymWHYHhrSFhK9T/GWov1Vci6IwydBXXBQPSP2lyPfeLxspBlhngjeN
         h6VIMQFhUKpt2ieXT9uuq6QX55vtNovjIEbIEB/W/P1H87Jl4BhtWDiMFr9qfH1bzAJI
         y6qSHTIvcs+fD+b1nL7jeR36nxpkiRqCtMVpzo7Fv9IpSt6SpcyZndQb8ss8zhqc86cw
         Q8PA7tj99Of04IV72gpoqGTCj8hNl8di6tu4ViQLH5+C3njW3OTuFZM0qIlIyVBQNoXW
         ZitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942676; x=1789547476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bg/eHNRfWD3uscd40GV8QRigpo/JtPPXEdYD1Se/H7Y=;
        b=fTFC+rBKpkUQ6LlUltkXQROyJXTmtvgt/7tkcQ8t2O4ArVgSJsfgSuwX2E8y68/UjT
         LsUdej/6Eo5CYhJyG1UZkFeEHjGaMXyFsjty5INSMg2FwuCYNg+HuzCBfVg2/la9+y4L
         V8cbuZuwjjg0YwrwEHbidKLCNHQz/Zekhu9pqflBDOtTClbSOW4awQQkVKFPA4zF+fPe
         chEZ4/Ap5TbGv/iANfDhdzQ55aGire0TWvGtw4/R0/++seg+BcEy6stn91SxdY1Ocv6X
         rvQMAOx0zgSKgQwL+2Vkdf9oSVWOgbksF8avwy03OJyZjZmyubjxDUApU4SYrrhyJ61B
         a9NA==
X-Forwarded-Encrypted: i=1; AKwUvBw2L3YWN5hO5yvLQenEH5th34XMfL54U3G0AepfNInzze+IfNwLSNMqAaR/G1MSKVnDR8pl2jXMSXxK@vger.kernel.org
X-Gm-Message-State: AFuF++m2Zy7ZpWTj/EMo/HXMhwE/ZJBi5+vfLzaa9tj7L0iGY9uiCu44
	ArYYBji5Rmg/BQIt8EV9ayx7fEMu+fZJQRk/MiBT08UosbI9LqLi4J5xxncOJV3cpCaXaZCsHJw
	ZhVw4WC3X8DLxJ3+uxf1adLuc2j56c90p3QjPQly7semDkasD+gkb5cK5nDF1/xl3BQTXnVPR
X-Gm-Gg: AYBFou2aWDkVPRCh+u9TEy9Fc6Fi5D+rHAI7taORBNBDhbANnKkFZFzUvMiqnnJzT/f
	8rMWbProlrQAMTYoA3lzT35+Uj08yO/QuBDGcAvGHHSutus07kM8sdNee58jTvgMCBF9KIA+W7U
	4cD6Ig7ssZzw4UyWY6Smx15N1+r8yqU81WhHS3mbP+ip+M2IY3ovy7qf6IrtCs6Enpuv08ZBP7k
	CEpL88kaZF5KsK4YMFPxGPnOSDZUGBLGaSDd7fJ01RjxZ7yG35sKD2RxdGlfjayzWhwF6+1kSHa
	+jW0Cm/2mQrFHION6k6YEAdwEcW3DHdbHGslESGAglyQRYRDjoo0WiDKyMdME0RxSIQ07Ab5FJP
	1tHj1tjkjKS5Ok5iHMU82eCQjj7JBc2xeLGb5AvDqA0M=
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr50788796a91.16.1788942675525;
        Wed, 09 Sep 2026 01:31:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr50788731a91.16.1788942675042;
        Wed, 09 Sep 2026 01:31:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm39776875eec.18.2026.09.09.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:14 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:31:08 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Message-ID: <aqEZTDMtVaGR8F6o@QCOM-aGQu4IUr3Y>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa11954 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=FJ8gEVljA5m4mNThiM4A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: rY5XaJ1xduOWTrQIcp-Rljcozw52wuMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX/q9VN+OTSnn5
 rX9bBIBxYve9sEtCON6UgSCGjVTRHU+nqKdJqEKdJeRxyRJVKZYUqXhPQLsuA1VOyt4CFNTUt4Z
 IRQS6OYY6/i8bc8VBQ4nQz2MgYEzRkayFAqbKEYuefG7ffuFb6Z+ZTI4uvrJ+34U656ejYZJKp/
 ZQNewzi18S1Q93lRgw7Y6SZv4oY6FM0JC1/IwLelz4gS4+sqCX+HJM3MjFi2lygm+fXgrYTRqox
 xn7OCyw/3cF0JHDO9IkAh9RdkafBf7BsnBcVoOfPxvXDyGQzPlV0+pkNZSaxb/Mum7vdn7x43JC
 RHe+z0yiLY+v0Nb3R6rAdfVoJjVlzkSLSP4S7x3c/XrhjF6vxHGQmtsnufqJ6GlXhHXOD9eqdUc
 KIZnKvw8W4u/AFvirqXmEYqxmtbQsWDO5VyBpzvLYq5AHt2p+oatB3LGolvrz4WCfE/Emi15F4+
 m1U9qwKpM+8dhKWOdQA==
X-Proofpoint-ORIG-GUID: rY5XaJ1xduOWTrQIcp-Rljcozw52wuMu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX86CQikP8pgRB
 uSvbkhq/425ybtNn9/UQD2FEjyIQQ/6ePPkMVzOUaRtayi19SNGkOAJXTer5LluAhOLfqyad9j3
 bcsqM1IuGNJbx64RIfxp7lh/31CWr/k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

On Mon, Sep 07, 2026 at 01:56:14PM +0530, Taniya Das wrote:
> Add bindings documentation for the Nord DisplayPort Receiver (DPRX) Clock Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fbaaad1f3db3ff67589d6201ed0e25710c044614
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm DPRX Clock & Reset Controller on Nord
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |

" |" can be dropped?

> +  Qualcomm dprx clock control module provides the clocks, resets and power
> +  domains on Nord.

I'm not sure it provides power domains, as the driver registers no GDSCs
and the binding has no #power-domain-cells.

Shawn

> +
> +  See also:
> +    include/dt-bindings/clock/qcom,nord-dprxcc.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,nord-dprxcc0
> +      - qcom,nord-dprxcc1
> +
> +  clocks:
> +    items:
> +      - description: XO clock source
> +      - description: DPRX CFG AHB clock from NWGCC
> +      - description: Sleep clock source
> +
> +  power-domains:
> +    description:
> +      MMCX power domain.
> +    maxItems: 1
> +
> +  required-opps:
> +    description:
> +      MMCX performance point.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - power-domains
> +  - required-opps
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    clock-controller@a940000 {
> +      compatible = "qcom,nord-dprxcc0";
> +      reg = <0x0a940000 0xc000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
> +               <&sleep_clk>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
> +#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
> +
> +/* DPRX_CC clocks */
> +#define DPRX_CC_AHB_CLK					0
> +#define DPRX_CC_AUD_CLK					1
> +#define DPRX_CC_AUDIO_CLK_SRC				2
> +#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
> +#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
> +#define DPRX_CC_CORE_RCG0_CLK_SRC			5
> +#define DPRX_CC_CORE_RCG2_CLK_SRC			6
> +#define DPRX_CC_CORE_RCG3_CLK_SRC			7
> +#define DPRX_CC_MDP_MEM_CLK				8
> +#define DPRX_CC_MMCX_XO_CLK				9
> +#define DPRX_CC_PLL0					10
> +#define DPRX_CC_PLL1					11
> +#define DPRX_CC_VID_MEM_CLK				12
> +
> +/* DPRX_CC resets */
> +#define DPRX_CC_DPRX_BLK_BCR				0
> +
> +#endif
> 
> -- 
> 2.34.1
> 
> 
