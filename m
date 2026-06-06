Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C12B2D0625
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748593; cv=none; b=p4vHXBnBa8tu8O/VrN8LcLijV+uyFRiF1sqMt7ByNhVdPUFWSjD2qXPOo/X7APDTw6eCyua4/5hkI0GbhEU4Uir4bbbAOPA8mhrcfb/3folQrNLj/xtUQ5r8T/L0T5IJEKfJvg5IHpRKSCM0vDbmDz1rMkPEo6h0U2pWl7SyJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748593; c=relaxed/simple;
	bh=IEDW3y4y/S1Dxq+eQ+GqKXMRpq4vjTkLsXm7j9tPZJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKFPE9tLsu/cozLUiB7REcRj+cK26MUv9x4H9xltwCFqc9O0QnPbcOQaOIcmXc7gTKXEGos/eVC7eVfP2JBjYkJa3HXuxIAPF4gyOB6MxQIiQS3fLmQWOnlgC9BX+cuxC/VfuhbeyYuPsF08n0S2FkypJDIa6QuQ3iwvQaVkDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBmeTuPI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEgWHmFb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBmeTuPI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEgWHmFb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDsa31327473
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CACWQZmD4R6XLQ6GUpqLrmsN
	jTowQtAT8WsqwDHWPdg=; b=WBmeTuPIOwbj+d1qhz3dLCw/DxKcDzYN36fVQCa7
	MzqzyPGZ5yNuJvDk5V7qEnXnGW0mtIM33IIH6w0A80MLFDoP2KoMDxG/l07B6D6n
	NH10gHN7+BCOTTtMiI/B85/yLHwOeAKr68Q4KZF4NmrZD0wS2fI/5uP01yVK6l/x
	xm+ijz0lWyd0LYGdJHgtH9sMH6KVCa04fgsRQeWGOsor9btSqR4eLuP8qYVA4opQ
	iMj7pKTJIeyS+LW9wR3Tn2awb6DgOJ7+I0/POtGuYVOQ9QNoMujVAUB3zV/rEn7F
	9WcInIola8DuFHFAuMWEQlDy5jt1WYnSwrJICXSxLS7wKA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8rt0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:23:09 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963907b1ddeso3117088241.2
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748589; x=1781353389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CACWQZmD4R6XLQ6GUpqLrmsNjTowQtAT8WsqwDHWPdg=;
        b=YEgWHmFbsiYvmcaVblW0nLNoiPAap/c+AhLNFMxNKipzD13GwbEaKjRgPxKVso5gdO
         IERlC3xeWoZMv/u0i/DGraq4+GXMRQJfHSwfmXMDxD+5QRDnJ50riMXeuQIphZWNcSOh
         N5d8fK9DuuZK9Omlxqz5wESoQcU0NhViNqL57UVbF50j2oQI+0Cq7OKhlyVvt6iUYlSR
         lWcSFiKqD62pmiTuig8ouFySDc9HifSQbWbEdvSRPC6Nk4AHcHPNZVg7IWFY5BaobXgO
         NPkkrWL/nCJUU7aoke2oQTx8Zcv9gw6sRHUDwsE+aYm52f+i8aN2XauPzXOtl+stvvAA
         DPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748589; x=1781353389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CACWQZmD4R6XLQ6GUpqLrmsNjTowQtAT8WsqwDHWPdg=;
        b=UJgxqUJ90X0QwUGXVF/qKBrIn7osPeOglaAFj9dRn7d4t2LeAVHpryJbeJU0XEqQn0
         WUtHilR+NMJbvDVoTwu/EM4TVPxXWQ0hZgfyqPjBfOKajG5z1ZN2201bjXtFCfRwaBgE
         df2I1WjECqBTchNm9eWQahcR4wHqC5yr9/omMARbNtkfVGaHQLp9s10rwDwgbyRk5YgF
         tak16AQGOfvjVaJ6P9oZB30849J/6D62F9Sq3Ws0KCDFnSaeI0gAaQFIYaQYqw09Jk34
         e7d9pnMkQJOPRo9ZkYKH4zNpul7Q7mSTZM8nMAft/JXja+mSa9WCQRp5S4q43EQtpuys
         YE7A==
X-Forwarded-Encrypted: i=1; AFNElJ8DjbupWb7sLAQ37CH/7Pn2XNvbX1MEEzUrp8e/jPLZ2nMd6GzR6FGEh7qQaLQB/HSDx2wt3Kjv7J0E@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6CTY8GCv8B2+g2l5qTGl127s5/OcTo+XkIar52TApFNi5RNmR
	Un7LegXxoU6HheQcmp+RTa5faeZu6bng7q1vneB/PKMei0RzeiJt/LPR3bIGjWUZDisjlWP+DhR
	GiAQDfuLFCm38K1ktSlEVwSMLm60hlTGvlUG5ihRuXHVLh2YaNEiH7LET6NONHhA5
X-Gm-Gg: Acq92OGICNu5ZG1g4cL69ZZtFwMc11uB8t9VUsJ5FJpbN/vRG2Ag/NEt7hh5t4bN2oO
	rZIxpEoiRVZv07mGEbmujX3jIeEhSk9IYSOjGySmXjj68NR/AcARhLU9duf85+4fyMNm8YELhI+
	PPtvQcP1L+gzGBkkWKmEOMtpGFdMzUuJqVLNbF6qShJ/iVeiDGf5qWR1mqcUJF3CdKv+0ZRJNMZ
	k+ki0Na8n9gQkxHoVfNkRAAy3WI59uw871xRlnTRWhfdhJTg2Y3wZWUAFI1vxNXomSu8Ed6BK4T
	gsxYcpwe5CfqlBlZX2V5z6kybr/8gZ2hvKOXcLaCZcMBYomucYfzbK3mHyYTXVWlrb6ZROHEvKt
	hFVfvtxHSk9k5I81yf7sxFJLJMK43FJFKEJIEwiXVYVnrYu3eiQE+qLdVyXcr6CzC0y3CFLNce6
	AwmLtwjRzY1ZZtRhgwaehvGmIhlNNpb6CCLUO2ZqxgT2xwZA==
X-Received: by 2002:a05:6102:f14:b0:631:4c79:b1e8 with SMTP id ada2fe7eead31-6ff0afefe3dmr3974191137.22.1780748588663;
        Sat, 06 Jun 2026 05:23:08 -0700 (PDT)
X-Received: by 2002:a05:6102:f14:b0:631:4c79:b1e8 with SMTP id ada2fe7eead31-6ff0afefe3dmr3974174137.22.1780748588296;
        Sat, 06 Jun 2026 05:23:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac34sm2444082e87.39.2026.06.06.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:23:07 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:23:05 +0300
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
Subject: Re: [PATCH v3 1/3] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <fphua2bsw36libxqkrfubnaybvdtwncplddhexx26dtbjir7ov@jvmu4avug54z>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
 <20260605-shikra-display-v3-1-9846ba5fe635@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-display-v3-1-9846ba5fe635@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: seAW8O6JjdOBUVjtseIfcxwPGLDBO7AI
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a24112d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jtPkKwLRCkpF2dlEjY4A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNCBTYWx0ZWRfX5oJvivGq7DRB
 ZrBYEyt6/lfzN8DxCNZXTHq2iV/jeqESAWKVB1ZN0+OjbErhBYTtDDuQXDwoNgXYT3qAW9fAa4P
 VvDBiYRAFtuwWZ3SS2UxLoOZQSDbtaXpjb0b1MTJvO5lnP98KPh/lGwh98HMlWH/Neb86ZFVPBk
 FsmmLLh7kmrxaY7p80MgjSnhQaPYAl8s/ssmjp4S9BjWdtPvJjuHQFPtaeObuBsRHP6XVt92uHJ
 rwguGjVc11RgeQkrBJfm1Hsoxfi7S58m4utH/M14ILAHes2BPHbTqQ0zZYKaMwiS+4c71IjvHUR
 7mID9FeeZoe1HS/glXCMc5/Hr1rGo283ZuepSIRfVScj+Bd6SmIlhv6vpKs2KWh3Jx6RNC6dqPf
 cwQpvDioPVigf3GN8BpKSMfynWWD5696NKLuoz1Mx2PpFCiSy2EammEecdzhWGB3rRo3zPevlUD
 2gaeAaGXaXomD1kvabw==
X-Proofpoint-GUID: seAW8O6JjdOBUVjtseIfcxwPGLDBO7AI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060124

On Fri, Jun 05, 2026 at 03:48:51PM +0530, Nabige Aala wrote:
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  |  4 ++++
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 +++++--
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 22 +++++++++++++++-------
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index dbc0613e427e..ab2cfd6d6e3e 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -57,6 +57,10 @@ properties:
>            - const: qcom,eliza-dsi-ctrl
>            - const: qcom,sm8750-dsi-ctrl
>            - const: qcom,mdss-dsi-ctrl
> +      - items:
> +          - const: qcom,shikra-dsi-ctrl
> +          - const: qcom,qcm2290-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

Wrong sort order, qcm2290 < sm8750

>        - enum:
>            - qcom,dsi-ctrl-6g-qcm2290
>            - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
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
> index bb09ecd1a5b4..ef21b2c263f2 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm QCM220 Display MDSS
> +title: Qualcomm QCM2290 and Shikra Display MDSS
>  
>  maintainers:
>    - Loic Poulain <loic.poulain@linaro.org>
> @@ -12,13 +12,18 @@ maintainers:
>  description:
>    Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>    sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
> -  are mentioned for QCM2290 target.
> +  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
> +  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
>  
>  $ref: /schemas/display/msm/mdss-common.yaml#
>  
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
> @@ -52,7 +57,11 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        const: qcom,qcm2290-dpu
> +        oneOf:
> +          - const: qcom,qcm2290-dpu
> +          - items:
> +              - const: qcom,shikra-dpu
> +              - const: qcom,qcm2290-dpu

Use contains:

>  
>    "^dsi@[0-9a-f]+$":
>      type: object
> @@ -60,9 +69,8 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        items:
> -          - const: qcom,qcm2290-dsi-ctrl
> -          - const: qcom,mdss-dsi-ctrl
> +        contains:
> +          const: qcom,qcm2290-dsi-ctrl
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
