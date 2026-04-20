Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE07C2EB5A6
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706747; cv=none; b=fMiISUYOCTiJFGiN5KXkGvnCENU10cIhpDC8TGHnBwHDf7M7seeKpu9q2Vo99ZJR7g9QIrHKshWu1qixzYbIZObIjG7QYLgfBOssc7bUftA1L8MMYDNZ7bMUZDj/VWd3E/FAJqX+JYE0R6oEMDgYORXKmyiJElAuwqdtt4djFXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706747; c=relaxed/simple;
	bh=DCz4xikQi7sloDAct+dFldHP+8xWbQUqhVb6qb0hy+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfPoI5cLeaEf7Dgk5Dy0+aU9DyDri7WtPcYywzJms7hlebsP/gkUMhms7CcFB2PxRMWXdu85Ycuwv0B3yw4GIhfYSQh1f/3lbpgjFHDH270qdyvokjkNOODIMoKUWzH0WjmXswNWAXU2s/m/D+CFTB8zLOLpqtCTmne5Ak1Zwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVy4wGqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UY3G/cTR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVy4wGqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UY3G/cTR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KEggBV2281683
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4rd/H6ZkqpeTiBEVqAYI5X0D
	pzNL4iIOzFJzHqgyAcc=; b=GVy4wGqT2aIyMIM+yuWNTRGp2A3GxdJdfQyRC1Ms
	ZaxGKvJrmu3O2DfiJ8RRxV50YvmHnvaOcfOe9O/ZyuIMp1//feYftZyP6TKDFMzJ
	Atr3QPygCQe3TBCyKGqbj/sh/MGs9zS2ioBYSGKrGbQtMToS5+Zws008xX4/kMvZ
	RbNMfH1bXd/rFwqIY2jPn9/qNS1lwh67M0s3n9b1wsJX2voRS8Sgl9oiDVN/xrHK
	c7Rjtcn50bK+AMprYxvjdCfZtDx7dAxpOJ1hJ2kD5oIFH3L0LgLNgk8Di88j9zfu
	YO8ILaG8oZ8g6jA3wAW8gyUacvFtTbTGsp4rNS8EAe6QRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599x4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:39:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faf575af4so8349211cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776706744; x=1777311544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rd/H6ZkqpeTiBEVqAYI5X0DpzNL4iIOzFJzHqgyAcc=;
        b=UY3G/cTRLf4xgw4qcrJLUNTuwilh1etudath/vAQarU6JFIlKWvYgvUNbygdsG7q50
         H7WLdbbLJ+dgU+zjNExgMWamMlgKSHUHiartdBIuaekDEdkMijCBcZ2dDMtAS4nmFs8L
         qfrOEle0+bDjIIWZVTCapky0s/IoDAkHkzlIK0oQ4bwXVE+U9MQf6iA/ZTM7pHGfAjnu
         nF0OtcnMYOdkHC0y8YDX47ktKACa4Vyw4G25n7LOlxd131aC4snOE4P7Ww1OZmicQufe
         jtW2QYXAlp4sCxOKD8O0YVSB3qSlLxKsBEIDNq9or2Qg5XT0RiSir8H9Fc3vzoEZ7kiu
         0QCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706744; x=1777311544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rd/H6ZkqpeTiBEVqAYI5X0DpzNL4iIOzFJzHqgyAcc=;
        b=fzawGMKJc88TWqSbeLSbqHFZ/YD1qKSlKvFvWTSHvXVYQsU5g8EiRS5X9+LN8BABG+
         brSKCj5sw3o5Rij3XhZvgDSMvzP8VOZ8d4hpWIdsCbnhE7QevlsupgGPbBX7yQzUTz2S
         FcxPKTcRMUvGdIleI50V8NjefARNo0W3ZDy5J6lgk4NuArAS5OdAl+ucYo58Z3pP6FOb
         6eupRlSd8pivEliMTPHd1/5NmqgONIGiw7neG6LYIFoO//wba8YoKh0XQhHUeprBduK/
         mT/778tOoqYSmvYQ9+qDU/iwPUNK1Im/tm0V9bRN+JtRNvYxDjqjU1PcnwTo4EHB2fbh
         U+dQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qbpNgURaNEoA6/EP93ZO7AvjxvsDLeuw3UWiFThXtyZOBIuPv28cYuKBvWeFq31GC6ewaYQfb0/VP@vger.kernel.org
X-Gm-Message-State: AOJu0YxLRlY7yZj+0gyB0o/7h2In9D+KzR4m1b7ambTV54J+xRVbJmU3
	c3eEh0f8gIUpfLmld+obwNb/fNDQPFLIeJV+mTWa/rBGG91upZXxfSZqaiPy63hGp71Abbh3ZeW
	oEoFs1U3oz3a5+c8ByzWUUFzyvbxllGSobg6MakZWDMN4/1VsIQJA14SH6/HXqbN8
X-Gm-Gg: AeBDieu3jwvyfFJZzaVLtXIPEJrbqvm0D+SV87RpkQoLKsGRvvRkiPq5TMmjY6aKoyi
	x58YPTuQdQBzDXaFmaOVgLNS64I2rTxLObE2yXh0z9BTrgolvzs8+hdBwAXaPcle0y0iHKf7GRH
	6VZ0ZeUDaz910h8x8qWwTJeUoYxINT9f1MCDZfIP0DD/7WnWxRhGhwUrzbcwgQihN5vahMBhElE
	g3ashZnL99JaNkViqOAiaKtmPIP+7AwOwhVyYOiC7AicHslS30q/h+GxwCpiA4vCsvRbsngEr70
	6RcM4CJPqe8Mw/1ahKmH6mz8mpNSSK0VW8yyUrvRJ16Vru/AscN/kv9z31ShjvjQBrPUHbIuyrt
	ZxPpxPp0ge7x+YTtt4uq+XrHOcPFbTwQ3Z7OTgMLNP12vnPXxAokb3askDdnpnkDdyoJrYyFPmJ
	1OCA46/QHIcfejsafb+flSc75kGNYF6iZcKi+A+UD+Za4MRA==
X-Received: by 2002:ac8:7c56:0:b0:50d:9b07:9c2b with SMTP id d75a77b69052e-50e36c8da62mr221698381cf.56.1776706744144;
        Mon, 20 Apr 2026 10:39:04 -0700 (PDT)
X-Received: by 2002:ac8:7c56:0:b0:50d:9b07:9c2b with SMTP id d75a77b69052e-50e36c8da62mr221697721cf.56.1776706743586;
        Mon, 20 Apr 2026 10:39:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm3116028e87.7.2026.04.20.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:39:02 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:39:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 01/13] dt-bindings: soc: Introduce device bindings for
 CESTA Resource Manager
Message-ID: <kylte3ehrzsp3egp2y73jygjvqpsjym4sl54377ouv3nqxp5u5@cyd4nwfvwirj>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-1-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-1-eb27d845df9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GD3kbbCZ8VsVrGkBahr93NZNTygBr9D8
X-Proofpoint-GUID: GD3kbbCZ8VsVrGkBahr93NZNTygBr9D8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3MCBTYWx0ZWRfX78g4mJsNaVZn
 mbvXFcVlxQkzb0by5Jid15LmTlEt6rdDDdNeS/5ihCXRlNIfkajEFeWfAVqoosdfegg3/F1Lu6H
 hwjgJ5me7aU+y4fBVKq+eDKEh5WC0q4V4cyUZXBA8GTpSsmGpf6X+fuH7q6wzxDmhuqczC/QNpa
 7E3cdDK13d8X7F/nkBGbyPi1Ur94wpTD5xpfRvkuIED1rZIAoZP43VkFVZ/iDuNJyZMfsIlGZbK
 LPcLLqS7eIxASaT620L9oYTcSV+IlsGKT7gjqQfIoOWOVqHKj5V1hqoEc0b12yfR2ZarwqGWOl3
 GorLmgNg0fq1LjMS1X5pDFvGMdrYASWKSLRJFu6tIAthk5lKHPo+5QPoeSJXeU5ETk3lVhfFkGX
 Eaz2UT1dBEeOmBF+eSfmYWx5f1peic/j5sUXxfeml+F62QqXWNO2ql7wmdXp0qJLGiPnNglRkmQ
 uHRDs/jGAUWpuDAlCuw==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e664b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=X-DtfH6_GkF8GqkYvjkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200170

On Mon, Apr 20, 2026 at 09:58:54PM +0530, Jagadeesh Kona wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> CESTA (Client State Aggregation) Resource Manager which is responsible
> for client side management and aggregation of local resources.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,crm.yaml     | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a1485db8b7476b0cb0b4e8a41adc8fb4092b731f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,crm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. (QTI) CESTA Resource Manager (CRM)
> +
> +maintainers:
> +  - Maulik Shah <maulik.shah@oss.qualcomm.com>
> +
> +description:
> +  Support for communication with the hardened-CRM blocks. A set of SW
> +  client Direct Resource Voters (DRVs) in CRM provides interface to vote
> +  desired power state of resources local to a subsystem.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8750-disp-crm

Is it specific to the display? Are there any other CRM blocks?

> +
> +  label:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    oneOf:
> +      - description: Specifies the name of the CRM.
> +        items:
> +          - enum:
> +              - disp_crm

What for?

> +
> +  reg:
> +    minItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 6
> +    description:
> +      One interrupt for each DRV. The interrupt trips when a message complete/response is
> +      received from the accelerators for the desired power state. Number of interrupts must
> +      match number of DRV blocks.
> +
> +  qcom,sw-drv-ids:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 6
> +    items:
> +      minimum: 0
> +      maximum: 5
> +    description:
> +      List of SW DRV IDs used within kernel. May contain holes as some DRVs can
> +      be allocated to DSPs / can be spare.

is this list defined by the kernel? Or by the fact that it's a display
CRM on SM8750? Why do we need it in the DT?

> +
> +required:
> +  - compatible
> +  - label
> +  - reg
> +  - interrupts
> +  - qcom,sw-drv-ids
> +
> +additionalProperties: false
> +
> +examples:
> +  # Example of Display CRM device with SW DRVs
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    disp_crm: crm@af21000 {
> +      compatible = "qcom,sm8750-disp-crm";
> +      label = "disp_crm";
> +      reg = <0x0af21000 0x6000>,
> +            <0x0af29f00 0x100>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      interrupts = <GIC_SPI 703 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 714 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>;
> +      qcom,sw-drv-ids = <0 1 2 3 4 5>;
> +    };
> +...
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
