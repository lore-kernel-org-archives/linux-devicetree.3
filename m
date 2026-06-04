Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF00247B425
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577532; cv=none; b=oCvm6J/QBa6hc65Q6ri0tbFYENER5kd7Q8MQKuXNcOduo5bxBI5FyvOjMQ4eYAZ8+B99o6kHl13WqFe3YRLAlE/l/e0bPXPXS3SOnnaiRXjbBEwDyKzZtJqG8WPKZqAROVhSxqbdLlvECPoXEP+FQ77pNJYaybLnJjNh/FG3kfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577532; c=relaxed/simple;
	bh=77v9Al1lhh7IeOYvE+UjGRjE+iVb2hZ3YgJY6y3laQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfCilAhRMN1bom65ER7kiwKjTS8k6K/Fhh1hpa7y+sREqBKvXVf5ZnzpXDsLCxPs+dneXlbEagYB9RcoSiRItN4oN/tFjptaw+zcsD7e1tQEqQOLPIli0GVlCAPNge2b0yGnFdOhlP0/CfENCHQoA62p8OWP9wt1Tt9gd2qsyqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cv7szaif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYbSj6+J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cv7szaif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYbSj6+J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654CpGEk2477902
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 12:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XgEAN0/+gM+54F4VHBCxD3vD
	G/6RjDY/mUjZmgXTXkY=; b=cv7szaifabc9i/rBVu+6yJCIPhf9YS5ZWrXb0Cn2
	WIZxxHuFffeW3CqWnz6oVEgffx9RksYyxCgYtl1wi83p+8KZqsl2ajf+MGJDds6t
	Y9vH6qhtIuAauLC+PVKPktU7jFgIfO1H6tI1BBhbjy7L2mjiPbFYIrK0yR9NQ+lL
	xUZ6EnwHKMKrg/HcpMv4ENmcCc5ahfI2kXTgKTVt0a2Cvx+uFXJit3AQ2PZ0ak6O
	LPpjneRJQv4MqX7nz0nGvwQJxx2ETr/WXfaQhyThKwLufFQ6oFdYiUH155WezWZM
	8tEW0AIKTlAxcymhWO9hn6lmlcJS61WxmaVvRybeHHeL+A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvhaw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 12:52:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c152655acfso84185137.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577528; x=1781182328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgEAN0/+gM+54F4VHBCxD3vDG/6RjDY/mUjZmgXTXkY=;
        b=aYbSj6+JWYnjKvxdszzMqWAOf9udve8/rcIJjSI7QCBGzFmiTAIwPgrwYcyE3ou8Nt
         4BUxQKZXD86KO7liYhlSvrZTAH/LyrOGUxpC9gDdcndg6EbvXfm8iBH8cI8V0nPGQDVF
         t46oCFb7hP6kFqR9jAJoXVPu9eLAWPw0ekOab5agumqGiFISHLgDT3rGpZ8Ln1RduOS3
         nVnpe2Mdp17gE5Q5zk2gvm69VMVgnmvjDslyZ7IsXGchfIv3y8K4tAXuV6IKGTW9bM1i
         i6xPUYTvPEB6Xs5lIgngKLYaB2+9PXQtf/G1yEFD2y52NA66RU6agz1chf9Q38w0zGek
         2Bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577528; x=1781182328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgEAN0/+gM+54F4VHBCxD3vDG/6RjDY/mUjZmgXTXkY=;
        b=SK0HNBlqu4efFkUXsulpcjtHemiqpbx1gQQHUGFVCgrK944Y0QGPJG3Tw8k3BXdp+e
         AKR32YiG75/FbOntHVjTDHRaq8B/uDrppPLK54MUdtaPZ2D91lzRf9jdqYcxzKFNXOXp
         ZoMiRxXcLAQ8RjSVZy0l2xlkFnwT6MTcyzjUsrHK/wPNyfG2vIKUZnVtec/JHKnyZW2B
         LLyFRnjSaZ6uMA4UlRSJi/EUP8vuZH/S1Q78Eh1Nrxqc65HsSw9vSk/863QXWt18TOCG
         elye6DIAjfOvIhuUjOQq0BgaYlXbqgI2rXrtmQdh7N9B/vpV0JD8WwirJ0KcPMcbzFKI
         fSPw==
X-Forwarded-Encrypted: i=1; AFNElJ+WDvQSYibn1+p0B2YBSEruxTgcWNmnx/r31x2BPWmkpLcGlZBOIIjzi+eNGl8HyqgehUHd+pXRbgmL@vger.kernel.org
X-Gm-Message-State: AOJu0YzUKDlMgqWYhitAyz/wpoFmjs8nYQ1xSmmobQGEKlZ+cCbGWaX1
	TnYB2pBX3zF99zlCHM94W9JkrdzM4tE65ckV9X+VqGG0Fe0QOzvqPIXvcILKnTK4XwWGSFJo9ZR
	/K2b2DhmW6fAs/JL5TsY1TBJZRhn6X+nGjIp3MBNOi6ClNQZ17bB3W/6r8aol2ILU
X-Gm-Gg: Acq92OHUmIzRv41ZkcswzvcfpK3eYmdLSY2zpMFQT99Y9GrCnCYRCnaQyGn1j3wwJOL
	19+0iBeRyuwffd0w9N8lenJ9XqWjG6FJ0qkK1AEmY82deUKbObDpXgicZOrMJ28vbqUV9266G6M
	Sr0P1uizFrQkQfZ/TR0P9K+lOAL5ya4pv/bWJzmPA6X7hpmjch5aqjrxJhSkyKTuKIFkoN6RHdQ
	9uqovFHcPiLQFCJI9GncLdpMoDnnETRflIjnt2JrB/PBh4qqzUPaaiRNIfQJ1xlDjV1SWtJ6g9w
	JmV9Xk4L4OUVgfKeb0R+Kig64Ugmj0nqacuaSLka1cfTq1/OvHP9YFw4VmKjYo0Wdx1/YGKcj63
	SyVme3EOSUWtLp6KdDp9sZdXtNpoJI/LHWfq5a+peN9uetSaNExF58qcDvqDub9lilmSZhsbsrV
	SMe/WZW9OBNdPK8M/ZoS7AFYuOKlFoIvX1a8wdP3rV/G8/RQ==
X-Received: by 2002:a05:6102:8027:b0:6a2:cfe7:20b3 with SMTP id ada2fe7eead31-6ec278d65d9mr4057224137.2.1780577523184;
        Thu, 04 Jun 2026 05:52:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8027:b0:6a2:cfe7:20b3 with SMTP id ada2fe7eead31-6ec278d65d9mr4057200137.2.1780577522595;
        Thu, 04 Jun 2026 05:52:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c74esm1188940e87.81.2026.06.04.05.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:52:01 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:51:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <elb6gc36lkxdbvukretqx5widqozg4tw3wbg3o7ma3fsckjueu@sruvhflcy2sm>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
X-Proofpoint-GUID: PAPrvKAM3b3fysMBntjQCYU5EJ9NvA2U
X-Proofpoint-ORIG-GUID: PAPrvKAM3b3fysMBntjQCYU5EJ9NvA2U
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a2174f9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VFkWRHED51hAbpIxpgQA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX5fEYygmm5Y9n
 qOcTskdqtFcWSbjOAS7VjokSnZKDlmtALdFbfNkeVGSY2GWsUXaXbHDLdxAp9elVy0Wm2Bw5/wO
 6Rmms69/JvTlktggywI+aB/qPXKEEjECrAG8PzX5YRJ3iwNwrNXvsf0RK8soMClrhRx+faEkM0n
 ++l85xsEdjmwPmruK7+PvUUxzIpOhLvyQ6j2fKWjpZ0EGNP02KdaXpmYnexOpNuJ7jpGH1iA8Gl
 fpQA/eaqcYYwkDgyaw8kEywRhSWBmIga46pdFu6DV07mx4woFUpDCqTqp1kALnYlGzX6QdNObaN
 hQ63hNfbbptzyCeAxI7IQmAW/uQc/aACOjoiZVjRk7vYXLBlt7V5LTxgOudS/f68XiIhVnOMwnG
 GH9S8ByMydic/P+GFuFAGELutJdgBWsO0xhjUZl2P2iSWad2aWGn4R+5rU0uOjZtEnstQ9WF3VW
 B1Jwzadf1Z75nsAteTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124

On Thu, Jun 04, 2026 at 06:00:47PM +0530, Nabige Aala wrote:
> Shikra SoC uses the same MDSS/DPU/DSI hardware as QCM2290 (DPU 6.5),
> sharing the same register layout, DSI controller and 14nm DSI PHY.
> Add qcom,shikra-mdss to the qcm2290-mdss binding compatible enum
> rather than introducing a separate binding file.
> 
> Register qcom,shikra-dsi-ctrl in dsi-controller-main.yaml alongside
> qcom,qcm2290-dsi-ctrl, and update the qcm2290-mdss patternProperties
> to accept both SoC-specific DPU and DSI controller compatibles.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 ++--
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 38 ++++++++++++++++++----
>  3 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index dbc0613e427e..a2f3e91104af 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sdm660-dsi-ctrl
>                - qcom,sdm670-dsi-ctrl
>                - qcom,sdm845-dsi-ctrl
> +              - qcom,shikra-dsi-ctrl

It is the same as QCM2290. Why didn't you follow the pattern and add it
using qcm2290 one as a fallback?

>                - qcom,sm6115-dsi-ctrl
>                - qcom,sm6125-dsi-ctrl
>                - qcom,sm6150-dsi-ctrl
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> index be6cd8adb3b6..e166a73651df 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> @@ -13,8 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-dpu
> -
> +    oneOf:
> +      - const: qcom,qcm2290-dpu
> +      - items:
> +          - const: qcom,shikra-dpu
> +          - const: qcom,qcm2290-dpu
>    reg:
>      items:
>        - description: Address offset and size for mdp register set
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> index bb09ecd1a5b4..7184b09a8774 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -4,21 +4,36 @@
>  $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm QCM220 Display MDSS
> +title: Qualcomm QCM2290 and Shikra Display MDSS
>  
>  maintainers:
>    - Loic Poulain <loic.poulain@linaro.org>
> +  - Nabige Aala <nabige.aala@oss.qualcomm.com>

Nope.

>  
>  description:
>    Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>    sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
> -  are mentioned for QCM2290 target.
> +  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
> +  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
>  
>  $ref: /schemas/display/msm/mdss-common.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,qcm2290-mdss
> +  required:
> +    - compatible

Why do you need this?

> +
>  properties:
>    compatible:
> -    const: qcom,qcm2290-mdss
> +    oneOf:
> +      - const: qcom,qcm2290-mdss
> +      - items:
> +          - const: qcom,shikra-mdss
> +          - const: qcom,qcm2290-mdss
>  
>    clocks:
>      items:
> @@ -52,7 +67,11 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        const: qcom,qcm2290-dpu
> +        oneOf:
> +          - const: qcom,qcm2290-dpu
> +          - items:
> +              - const: qcom,shikra-dpu
> +              - const: qcom,qcm2290-dpu
>  
>    "^dsi@[0-9a-f]+$":
>      type: object
> @@ -60,9 +79,14 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        items:
> -          - const: qcom,qcm2290-dsi-ctrl
> -          - const: qcom,mdss-dsi-ctrl
> +        oneOf:
> +          - items:
> +              - const: qcom,qcm2290-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl
> +          - items:
> +              - const: qcom,shikra-dsi-ctrl
> +              - const: qcom,qcm2290-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl

Change this to contains:qcom,qcm2290-dsi-ctrl

>  
>    "^phy@[0-9a-f]+$":
>      type: object
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
