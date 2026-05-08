Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBFC3FB06E
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268173; cv=none; b=Zs90WLLKF8x9Ko+MGdn9xqaUfZxG/YvutoaWiILXVOS8mLhkMBhV1nfEv2251dLnFp4v2jQQ60qoisA+cyYtzCzwBOlJxo3x9DTuNB+uXXN+4kYz1Ta89h9nRKHH7ORUlylOsV3PBRXP6fS43OSF6k+CzAhgUUe6VuA6I5bnE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268173; c=relaxed/simple;
	bh=xnH8Gge/OSDH95hTgvFQxhSRGe0qTmVrtUjsfQUo/ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kt5gUV7advr1wdMp000zaO8rIDjb9jqQzwXth/RySLn0CCywWpq2dvivcokDFt3Wle10jBZY6DgapjWqed1AybJc/z1IRgvjaUn3bzB6maMUDyTRQs0kom66STgug5A4lwTWcHGcJn72dzbDTH0s8Ikkv6FwITIm/S9zszOFel0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO13Qsu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7kF+8Zl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO13Qsu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7kF+8Zl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GTfkF145193
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j59ngRnCm2Ud2Vm1hNDdeD/x
	CP7XzZiNLK5pSqgAqsc=; b=HO13Qsu2RGlBvxtMB8fu5jPnRgMqbHQORWr64j/I
	2yp+wrB986ibtvjF4taggP4vkjOtf/EJJkpvbFjUEKj9g5JVGf4yTaCu+/Bw6tqx
	j5rSxJropxqzA8Bm98uVzgEeY/jLpaRk/7P1KnouniPd5bCIBylZxFT0gndSMvvg
	u0RIJPVf74CPIJ+Zo7rb49hO8A79H7vd7tyxI6ikcMp6ioQwZY8AFA1saVA8V/pd
	65CQ5kJCD/kwqY4QKfw/DE5hwdizW4JQiPh3pBP51yiHB17wV6Dcb9uZtl3fraZx
	pVn7MOpNkEBbxukk/8TXP+k+jITc99COVMiJaCphO3tGdA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1kdc0k0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:22:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6312ba5c81aso1824082137.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778268170; x=1778872970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j59ngRnCm2Ud2Vm1hNDdeD/xCP7XzZiNLK5pSqgAqsc=;
        b=P7kF+8ZlhpbAdtXCcVA1rkqjGRxFEaHAQZLZePrP436K9e+1fBzFotUFDgx9X09Waz
         Tw1wEEll6W23MbCpJC22trLej/7qzheG4rH7rnfnTf+dEMwZZIFAPAm2dTWn44p8mY2J
         c1o7Xvx/gLdlHWlUBzwaz9DDDW01kZ75qfIGCIn4O4mrAzJ3hWCxflDNoWyNsKnVoVvH
         yZRtktITetaTiiV7K01SXXDhOr4heR2UL/RvXlyNm7zZMznHTKEaD1kz7jefMjgG/Gua
         Vq0y9+5mz96WwSGmP4j1ZRHaW7TqEGyza62ynlyxwQFEljj4gZSa5SHivT66DFh3WOB6
         GMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778268170; x=1778872970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j59ngRnCm2Ud2Vm1hNDdeD/xCP7XzZiNLK5pSqgAqsc=;
        b=eYANvSHPWdxJ5PQGs6vdrtOdRe7qApsztiDj+Hj8AXLV2UBQ6KOPfseCWvzt0eP3Px
         PEs6RkODNoG3bqWHctTJZf3AlaXGdAU0aLYHrA8GvyfTJCqy5LvIyglspIm4UG6IQbM3
         qab3A03m8kwChdJpAY+7Dsg+Kyz3L0nypFqNFR4alz5dXhc4O9Wr6hKJKKC0H5bTyCWu
         zqx1WOlwoeteHWKJX6KJeH+vhrZCqoocSsMec+EmlYZiGYcMjn4kaWCdU3zQYYK52Sfc
         piGiFVC9XludG9uBKcayvXEyFBg6v/EP00WKprItyskQvUL6gqKv5fakfY2x23VcPAUb
         xN3g==
X-Forwarded-Encrypted: i=1; AFNElJ9Ndrt2Ksj78UJbSprdba2wxIwzpUamGWUnUhtYZzW7Ur56stSqduD5tvRmu7MyfEhPCTZVM7UkAiEQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yztcql7vPps4BmUT0Vsk1Pl9rTMbAK3g8yFl3S0NkM1Nxkt3gL2
	DT18B240N1NqKfboBOIqrsM/Kl/75mFgC4uEzw26OTHEY6qOiglao9Q0vVrnA6pVISgaUHLL0R3
	zN5bPMvlBPeXO8t9n9kDpn33G55uy+9VqHMAegXsv2O/xBhxo9IPA8jv7IsGJeSva
X-Gm-Gg: Acq92OF/Y/fyFq6OI4s1CBaiIYqHCNV+CCAMg7foFDRmlhM+9y2UHVXZMycM0aV/0IY
	7tsK4sU7AXYKcQOnHmpKvg0N9CikHcst0I/MNr+JhSeYNKM54ACTjqy1bkU6/gDCicQ17fmEF5h
	rwuwiKrRYA8PNcZazsuS1AS6Bg32hBJqM12FTvISnJhQI+k+1fSu6qjxuIGzSiVX/cPIay0zsDk
	toQASk64KmCy0ZXgnVKqSxI4/JUf/0uuGCYmmcmZv+KhFXbEyPNE8gJTGMW8L7Ck1YYi6F6ZrZd
	wRvbs7gedQhXiHNgn7Aaf2Z3L+La+xAkFghpQ8564X4LhLFKcY3R3S+OVuBAUHdm+YQS3+rAY2/
	9OvGfzAIljLzPuaqqYqKnTVAZXDgSxiqziHJHE9hMCmCJIsPCpuqEiaoOHin9qy8TBPultDCo/y
	ejnt+HkR6yJlEhLSO9ah5dMtwBjNMmWF5DgJ0=
X-Received: by 2002:a05:6102:80a2:b0:62f:357a:329d with SMTP id ada2fe7eead31-630f8e6b496mr8393849137.5.1778268169840;
        Fri, 08 May 2026 12:22:49 -0700 (PDT)
X-Received: by 2002:a05:6102:80a2:b0:62f:357a:329d with SMTP id ada2fe7eead31-630f8e6b496mr8393834137.5.1778268169345;
        Fri, 08 May 2026 12:22:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9565401sm738807e87.57.2026.05.08.12.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:22:46 -0700 (PDT)
Date: Fri, 8 May 2026 22:22:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Message-ID: <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MyBTYWx0ZWRfX6uzklNQqY0bU
 qpnzudPwBu/vyKY0sf9dkDL1qJslcg7x4KkfqA5cDOMZ74C16veIOizLWaRbng9ZKiZY6EWSQ6+
 eY7Am/9VjQR60IYYse6DyPgIxAnGtoqDG4Kf5If9xPpoXDW201JWCm1iQVAGeZdBje+bKKcC60u
 6i0GynnKCyLAfkk+YfqVFHKSpl0VTzQTSK5kGMVQOinOgviiZDVpJs5V0lyZ2ZpqcYns4DNhcur
 Av9+6LllnPA5FGBdqS3tIXcFUA++tieMRh4Zs+ly0wBGf8hB5G8L9xCgVZvrWrWdAWPV8ym1Al7
 p44MbbBeqo8dAEN21gg5LIPyT10miDF10xrHP33d/0QIk+S3twbSUGgTpYitiaoyNG6ncmGRzWK
 jpRZ+jyqUTBjUqwaUW9+U1owvBhC+0RshDHT7h9zSx3x/Os+8FnZLltfaVe8kuQt471ZVkOHMFT
 6Q3Hl02MJSPFZuTuhgA==
X-Authority-Analysis: v=2.4 cv=RZOgzVtv c=1 sm=1 tr=0 ts=69fe380a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2eyD6Qf5n_vS7hZkQ0MA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: suS2Xe2qWEuMi44UtcYyorgnoWPKvAmT
X-Proofpoint-ORIG-GUID: suS2Xe2qWEuMi44UtcYyorgnoWPKvAmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080193

On Sat, May 09, 2026 at 12:29:53AM +0530, Vishnu Reddy wrote:
> The common schema defines minItems and maxItems for clocks, power-domains,
> and iommus. This suggests that the number of these resources can vary,
> while in reality they are fixed constraints per platform.

It really doesn't. It provides common definitions, while individual
platform schemas tighten those.

> 
> Remove these constraints from the common schema. Each platform specific
> schema already defines its own exact fixed constraints for these
> properties. Additionally, remove these from the required list and update
> all schemas that reference this common schema.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,msm8916-venus.yaml         |  3 +++
>  .../bindings/media/qcom,msm8996-venus.yaml         |  3 +++
>  .../bindings/media/qcom,qcm2290-venus.yaml         |  3 +++
>  .../bindings/media/qcom,sc7180-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sc7280-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sdm660-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sdm845-venus-v2.yaml       |  3 +++
>  .../bindings/media/qcom,sdm845-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sm8250-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sm8750-iris.yaml           |  3 +++
>  .../bindings/media/qcom,venus-common.yaml          | 23 ----------------------
>  11 files changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> index da140c2e3d3f..b1046a112e17 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> @@ -62,8 +62,11 @@ properties:
>      additionalProperties: false
>  
>  required:
> +  - clocks
> +  - clock-names
>    - compatible
>    - iommus
> +  - power-domains
>  
>  unevaluatedProperties: false
>  

[...]

> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> index 3153d91f9d18..060be67574c7 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> @@ -18,35 +18,15 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  clocks:
> -    minItems: 3
> -    maxItems: 7
> -
> -  clock-names:
> -    minItems: 3
> -    maxItems: 7
> -
>    firmware-name:
>      maxItems: 1
>  
>    interrupts:
>      maxItems: 1
>  
> -  iommus:
> -    minItems: 1
> -    maxItems: 20
> -
>    memory-region:
>      maxItems: 1
>  
> -  power-domains:
> -    minItems: 1
> -    maxItems: 4
> -
> -  power-domain-names:
> -    minItems: 1
> -    maxItems: 4
> -
>    video-firmware:
>      type: object
>      additionalProperties: false
> @@ -64,10 +44,7 @@ properties:
>  
>  required:
>    - reg
> -  - clocks
> -  - clock-names
>    - interrupts
>    - memory-region
> -  - power-domains

Do we expect the platforms with Venus / Iris not having either clocks or
power domains.

>  
>  additionalProperties: true
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
