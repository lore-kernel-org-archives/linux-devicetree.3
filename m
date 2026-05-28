Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E743F1AAC
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975891; cv=none; b=aaEhJZSosk5QPydiiuN99vjOVG3EJXNzbWPCUN55BhjDyyUkEsnUBN9q+YrCerLVOXgN2tNfmOJjV4eBS0TQU+YuqPJvY9bzKF2ccKhT+r/ngC2wWL303uWJKfgzbotno19c6AuN7KNWQdlFEfM5lqg0xnX9ZU5gXI3HJ8WOSeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975891; c=relaxed/simple;
	bh=Sy13wBJI+iwNOmJjVB58t+ogoFGFmXoUWkZJnA0Sagw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJ0XvrbwGQzo1cgRJ4wQ8G8YGzO/z0Yq8beFZyh8C6UBmBY5dMUm/wfne3WJFBhikLfcEob1Kg2gCjd+GvewsuL5tbicuiH1C8imP+mimcykKTOekqG0Eb1nVwiP/JKqg10Mzl+Wr+wKJTEXwiVCQsDlPKCJa4fzS+eOvgT92Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2vsfwyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O19iVE3W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2vsfwyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O19iVE3W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vU8j3203243
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lRMaClYbA5HtXQ6LSesoJBK
	usUYgwxDIQ+oX8XsvsY=; b=b2vsfwyEiH6+ctQ+pgljyNh/FaRzxaT+XG/cDcVC
	httP0uSeY+G0EQ8BD083G01rvAYlfcf3FZ5RZDNz5NR7gvZbAcUzEBvelXi96B+f
	dsbPxWfgcyFCuCSTZmz/BiPodR2HZih/zL4vUPMadwhIgEn7ELMjbS+oc1FIaBIu
	VGFWaYsjUOGO+C2ISqoDWQcecQypkaWXk5LuihRHp3sxqfd4jURwFcPXBNJdEI4/
	pY8aBamXEtX6DHqK0dGfnvPSibB0QuAqZSUeJT85Fdaau+E1RC7M6JrBFRqQV13F
	DVFugxxayL6ZPPmIruludn7MsgVmz58XDp7MeT7EBsASug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjxre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:44:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d58f74b0so75951591cf.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779975887; x=1780580687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lRMaClYbA5HtXQ6LSesoJBKusUYgwxDIQ+oX8XsvsY=;
        b=O19iVE3WP/ItHU9t+bHrYRaE4Qz3yes0zTTbewA9YodWLDyjXYMPVUTHIG3vhHq2mj
         0sgJveaT1CFIznmbOdJqIv5yGYSxztSiIdYJQbZ63VU8jPdyfyCm2k7og1xE0fm4hFB5
         NjvKV4yZEwIqa2YMaLZNDcQDDoJBTlUjkNdpcf33Zw9lRKYwmnAZMWkEJCM39uHPi7AH
         pboZtcfHR/rE44HChQh5hBOsrRYtq13v2rOMwGDuGypwC1Mz5TGLUMjk5u9rj3qMTA0C
         6oiEjxu2KFCYLI8r0omtWG4qPjsn/YzV5tSMks9OlmNonv/DUGINhUB23rENt0Je6qk3
         6Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975887; x=1780580687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lRMaClYbA5HtXQ6LSesoJBKusUYgwxDIQ+oX8XsvsY=;
        b=SgnKl/7Eea0FGEyBYJOuobThbMJmB8VR5fMAVfbyi12nTHJ1i6lE/kMvjD6ncdPn3O
         r1hxDi5HMuHyYDeOBVlu5fi8kYymIFjRi2QePGi/QJddPuf8yEY0ICgmqBs7HjTJihcX
         +AsE8MyErXLqbTy1mZ6rIXt8Xn9LO88mLDUfYW06jqxJgSyJkYVQSJDJq7NTFvbe3NHt
         obowuhHVtncUhWvqzI9tg7XYewdmLmnwtftBfXBtRZ+RQwe9dQqgWdgEu6xO4FsZ3sL5
         1Os308MUbEcZfZL4mfse4eKovkKd3PcMaSpk4RGZizRyGylO19eCxUqgyNpucnpAKtYd
         xxWg==
X-Forwarded-Encrypted: i=1; AFNElJ8Xy3nbrQrSH2xM8ojdI7Ez7/D5GX1YjnlSlk1soYXBJTcxNODwSmv05on7dT/TwAMw7V5xkMd3+2PX@vger.kernel.org
X-Gm-Message-State: AOJu0YyvxsSaLd7dwYUdE/BfqbHPuGPPeyUe26pte0uxUlCb93f6oTDM
	WJRqTf0QXRK7T4b7rpVJcoAT2t8bwz0u1/n/ReZkmgrmNwZgcQIl8ymiciJC0pIHm1CGQxskC3c
	tAaJFDA8y6D8c0WssmXfKhi5KCpIkUoPbzhUwzyM61J6bVn6akUw5ZAv1iGk0YHmc
X-Gm-Gg: Acq92OF3/QqcdHlEvfUwtNWfoGXdoW3e2+B6fKxjtsqwrmTPNuF1PghjiVxDgf1a+7o
	EgIbiVw0FdtaWgbBS0OAsG7jAbkJPGgjE7UGzJyoms3zSJ39ycj5UJ6/Ih0yla1CkpolRzOnB2w
	tY5MO51VNkOhJ98216P2zmhxl009RUI12Sp57UmARtLzJ5fxuuONzjA1WXsNwgwx3fiZOusSF08
	bgRnMnbcWmWK+glI1rY9Ae7faCY+eOvirtYsMcEP2xDwKdbnzPji15npgMb0nuJ0xLNXWvixSfu
	YWcpE1ElM+UFFKKYa12FzKzUiBZJ1atpV8VCumU3JiCK+JF3hzj9XOUGJ03KPebowsxjL9VV9xp
	QkGUEPuJibapre0P0N6lxswPkbWYRW6CELXOdJH14Cxvzbr4vyk4iZw+w3wb+ZmqgpSMyJwQPWt
	lREOw/g3G9hG/ZOdDXS+5Dtlz32lqACsCoYxefqR9VPaIW9w==
X-Received: by 2002:a05:622a:4207:b0:516:c8d8:9a27 with SMTP id d75a77b69052e-516d429354emr407633821cf.8.1779975886923;
        Thu, 28 May 2026 06:44:46 -0700 (PDT)
X-Received: by 2002:a05:622a:4207:b0:516:c8d8:9a27 with SMTP id d75a77b69052e-516d429354emr407633141cf.8.1779975886418;
        Thu, 28 May 2026 06:44:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa46322331sm1923204e87.42.2026.05.28.06.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:44:45 -0700 (PDT)
Date: Thu, 28 May 2026 16:44:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Message-ID: <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX7ksf3E+lKyRV
 3uG9TcowXwuZIzQ2UgcML7bvrBNwjMb9aR/5lqTk1HuK5NB+bqqhpX6KAlmmTIb4t67lQP4vWqt
 ZXevYDQ9g79G5HJWrMec/Hs4AsJ45dMTvxvGfeuksRfEPrnNZmZ1gq4dVy9UKVzFOOMuzwrx/jt
 VnsqouVyR9whftlYJ3e3H5xjq3wvlEx5TXoI/9Ehg4l972ql8G1LeNfpR7V3al4atDXZnVcAz9E
 8ii3Di6lAMgo4Swvb976GpEiCn7nykYwT5Ne6XAKCp7QrlHTZ9g48zh0e1+RGUSkGD4vIC/mvHx
 3WcRONq0uEWY4y6N8IS3gSLTv1RqiTQzw4Th/fwNkUIUpXn/Ev9LLcGp3KLjq9EQ+tfaBpbtHuS
 fzMwclATBB7m4J5qTkJpSIiZo7Mh41GWWP1H3aq1aUqHNuHT/WuTzRIrSUgAL2TTz0SG3e7/IAf
 0K6zgnibH69j2z62AgQ==
X-Proofpoint-ORIG-GUID: ni1uIUJfDTBXwM22buvhTB9TtP6-bsZt
X-Proofpoint-GUID: ni1uIUJfDTBXwM22buvhTB9TtP6-bsZt
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a1846d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1tq0Uks3jRvWVWNWfJsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138

On Thu, May 28, 2026 at 03:37:03PM +0530, Imran Shaik wrote:
> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
> but has minor differences with the number of input clocks. Update the
> existing QCM2290 DISPCC bindings using conditional schema so that the
> QCM2290 requirements remain unchanged while accommodating the additional
> clocks required for Shikra.

According to the IPcat, display clock controller also has (unused)
inputs for the DSI1. Please extend the ABI for Agatti, then extend add
Shikra.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 75 +++++++++++++++++-----
>  1 file changed, 60 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..b24095814d9e67a355321d9013e144f245077322 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> @@ -17,25 +17,21 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-dispcc
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,shikra-dispcc
> +          - const: qcom,qcm2290-dispcc
> +      - enum:
> +          - qcom,qcm2290-dispcc
>  
>    clocks:
> -    items:
> -      - description: Board XO source
> -      - description: Board active-only XO source
> -      - description: GPLL0 source from GCC
> -      - description: GPLL0 div source from GCC
> -      - description: Byte clock from DSI PHY
> -      - description: Pixel clock from DSI PHY
> +    minItems: 6
> +    maxItems: 9
>  
>    clock-names:
> -    items:
> -      - const: bi_tcxo
> -      - const: bi_tcxo_ao
> -      - const: gcc_disp_gpll0_clk_src
> -      - const: gcc_disp_gpll0_div_clk_src
> -      - const: dsi0_phy_pll_out_byteclk
> -      - const: dsi0_phy_pll_out_dsiclk
> +    minItems: 6
> +    maxItems: 9
>  
>  required:
>    - compatible
> @@ -45,6 +41,55 @@ required:
>  
>  allOf:
>    - $ref: qcom,gcc.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-dispcc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: Board active-only XO source
> +            - description: GPLL0 source from GCC
> +            - description: GPLL0 div source from GCC
> +            - description: Byte clock from DSI PHY0
> +            - description: Pixel clock from DSI PHY0
> +            - description: Byte clock from DSI PHY1
> +            - description: Pixel clock from DSI PHY1
> +            - description: Board sleep clock
> +
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +            - const: bi_tcxo_ao
> +            - const: gcc_disp_gpll0_clk_src
> +            - const: gcc_disp_gpll0_div_clk_src
> +            - const: dsi0_phy_pll_out_byteclk
> +            - const: dsi0_phy_pll_out_dsiclk
> +            - const: dsi1_phy_pll_out_byteclk
> +            - const: dsi1_phy_pll_out_dsiclk
> +            - const: sleep_clk
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: Board active-only XO source
> +            - description: GPLL0 source from GCC
> +            - description: GPLL0 div source from GCC
> +            - description: Byte clock from DSI PHY
> +            - description: Pixel clock from DSI PHY
> +
> +        clock-names:
> +          items:
> +            - const: bi_tcxo
> +            - const: bi_tcxo_ao
> +            - const: gcc_disp_gpll0_clk_src
> +            - const: gcc_disp_gpll0_div_clk_src
> +            - const: dsi0_phy_pll_out_byteclk
> +            - const: dsi0_phy_pll_out_dsiclk
>  
>  unevaluatedProperties: false
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
