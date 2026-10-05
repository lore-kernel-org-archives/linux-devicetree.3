Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBC8221FB4
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 01:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791162187; cv=none; b=uChyunDG8GEHrbdWgFIbb2Mau5g9HL8tkHf/rJsT33glKSRkbQ2/mPaUp/00+MNBDEOt9RU1H34AuNv0FgYig5PvG7G48ADvDFlNlgLLNL9dwYNBUuD1BYCeCMmmQYCNSOVPK9FQIf50frJBQX6osK7/gLtraJEGlDQDIDMlpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791162187; c=relaxed/simple;
	bh=UGsddXDvUokZZrW0oS93xrsee+klcMXeMzKLJKFSwxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqlST4GBbL7WArdLAXQHkCt4qlvZZwY3IVwaLPtE1A3BZ4SoQ8kjgWjhRrJWC8ZlaZlBgrUoUMMvI0IKB1ksJp7XGxCi4YBaaMhNibZW3klGqx4TKUitTyPlbyyIzB2lAvMne1UlPU3WdN9OVoEEYKBGxOcJMeb8PAs7fkKlWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oki2Tj26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrUhoiGV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oki2Tj26";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GrUhoiGV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103Dx3688113
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 01:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cIN/FPCHWQX2ilgcPPtHpxp8
	Rklr/RFaTYrm5ESNHt8=; b=oki2Tj26wJN1J38t/A+k064edb6R/VljheOsbHek
	TVywuGJ2xhCNWb7l8Nmme7UP4PKbHqjiDBwvAM3KwGYFb2f4JN6tAkUj5FDVG51l
	9b7PHLo77fnDmayjaK7ohR93sSdmvpIkbOpfPm9xMmRqWqdVqn9lM3XZdx3ML+8I
	hn+xP3E3/ylvPIR2EZL81oTRFCpL6PpKsT916uN6DVCggoS+tCBFaxwBBAJsaZca
	6YcoiRt77G3HehrH3VNJwBi27s6d6x3rxSDn5LK5fFHby3/NqyGylHk55iMHsXvj
	gmAAfHGVcsyBULfvEdTSWgL7QfUhhOB63KgH7te4Tmu9ag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfhyu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 01:03:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so124265785a.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 18:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791162185; x=1791766985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIN/FPCHWQX2ilgcPPtHpxp8Rklr/RFaTYrm5ESNHt8=;
        b=GrUhoiGVd27uJPbqr+RZ95zmuTpQyjvKTcDy0aHgm+da+7B6v+XtElst2fF4NPWUR5
         iUjK+bysXNw3ZKt5tjrc+9B4xCZPlu/qvuhVFhGLlstdOf1UkrJ2uVoecWm6kPI3B0vS
         zuE69ShCXnYDhI19zd9DzSqCr7G4ImH7twpqfI2SlO1iMUtxV0uUWtIFDJXqDbWXiHSe
         Vj+6T1keshcAu0JavTv7gTLTU5pB9qFWo03gLwxS5BFtq2tUbWNw2cEqBjFu3tKH0ke/
         vnM7gssECJdPZ7P3TfkueNle2GIe3kxSmN/jE1jS5eEuIucAZ4yYfPw8UNmIIzs/727M
         1rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791162185; x=1791766985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIN/FPCHWQX2ilgcPPtHpxp8Rklr/RFaTYrm5ESNHt8=;
        b=uc12Rq0O17i5/ydOVev2iESbaR7vY/18dz5I7XAbAlSwxDv2Gb8hY0vK8HH6or4JC4
         gr+U4o0S6P5c3xtWa++E7/citdOfwMZOCWGRhhPPKIb+zLM8ljoZxVUBj+2S3/ZKWCvN
         so+xHf5Bx29493DWsNBDsfLyBHUrX44yYs/sLC2W8S9MRiX+0Xt/bUCMT9iEJbeBVvb7
         TZW04mvTiAw1z8tu89RMrcAUhVdIdZfjRHAOavZJav7cHVmnnefohus1QwJk8ODU26IC
         3o5yqtigkufXibbCZ9uOyZOHqSEuo7HcJ+6smHmklHw6w1vKS0ffkBHXC/e8hKDbsKNO
         G/Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxtGZqlR4EdOUJ/dgyUxEa03mf/UiHWsfIyIU6dHJ5pln/QRzVMcZJr+261KA7Mk+UlVd/BU37og5TX@vger.kernel.org
X-Gm-Message-State: AFuF++mDw/moHvxzxC/tYxSREKGVEagit3vWLGyRn8An4l5+HP2jI8+y
	0G01+APUjrAHfi0q6AmdYLjVKgyugPLptu4yqyS4FlHyYfPJEiW8x731gF/bKE9/tBMqY1Xhuy2
	CAEJMChF1CKmahdc7yNtfV77okfMyiOVOPSWBoJ/Xh1I9pfHZL2NoPL35B6XrBbj8
X-Gm-Gg: AYBFou0clNEElQIcRVilxhE18Ikb3UgiEseLyZ6Xlq+cZutSxQFVEh/0GLcmMynjvF4
	RqX9BGm775qRTMZWh2oPrnpNJp0WmkJMjKuJKTPzefPsHCXtpt1TPGfVirIzFr315XREE5KmkUW
	IkLdJUwkVccilEYKWu55N61BtnfBBLFd05mddGPw732WdgWWYAPfp2NakL+RndQonmCRtrUiVLd
	nCeaiKT1H+mOYI9B+Xb31U9DukOfiiRGQC7cxsvq9o6cygHaShFHkpq2Pg76deOvk+HC9K4Pwsf
	HWSDGTa1pDQq1yLibVtXQ0tUj3CDJg4OxPwDAL8jJHbyRNdYhi9nrmaHTuIBrZSCrz3VfxpTkFs
	ptDFGmpEcaZpvz4v4h4BDZdoJxmrkVZrMg/KFsJalxDa0tTFwusaFYGJAFNkysL27JpzeMmZWlP
	G6AA+XreMVx/vj
X-Received: by 2002:a05:620a:4086:b0:93d:f7ac:4706 with SMTP id af79cd13be357-93e50e4a9dcmr954045585a.9.1791162184297;
        Sun, 04 Oct 2026 18:03:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:93d:f7ac:4706 with SMTP id af79cd13be357-93e50e4a9dcmr954041685a.9.1791162183793;
        Sun, 04 Oct 2026 18:03:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79632fsm2749164e87.40.2026.10.04.18.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 18:03:02 -0700 (PDT)
Date: Mon, 5 Oct 2026 04:02:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
Message-ID: <f3qs4wcascfodjufisl4qtpycfb3lunff2fv4u3olybjius5kp@vahhjfjfh6wv>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NUj1jdr6nxUXfc2f4hJAYENlf-x1jNSK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAwMyBTYWx0ZWRfX3cVJ8HAP3/Rm
 IZw8ktREP2Qfg3htru5fzHU/6WaS7Tpinvm2vRTLo3n5kmuhbmnjM0N9UbqGXFvGxPR/2Kgr65j
 q3lexW9bkqsAFtzqSwQrCkCvBOM/seU=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac2f749 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6FRr1iax-wq3EJIYYUIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NUj1jdr6nxUXfc2f4hJAYENlf-x1jNSK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAwMyBTYWx0ZWRfXyvq8Ta2PtWgH
 UDbfM1Dt5PZGBYjAMzvM1YQ7aaRdWackp9JT1IRpWnfogVWI0y6qETKliaZvXA+EbBYK9mEIeEz
 LaIWzZ4isYKjVUHrxt1SQpD4IFojKwprOKvUjiIGsvVTIi24mtu+9t6T1CwodaPBxY3TcUoOflS
 q/DB2GdV/dSEujfnOcGtiz08aL2wI9SUThQTtFWiRoVxjpJ5GkUPr9j1sFtocSgblAlfzG/R9c+
 K0O28qvzS62Q9iidUSXV6hE88Pe3j3UELaJGQIfsUCW1DLDAYvwVPZG9Fviv0ZY3c3w+c9cMTWP
 MKTVySIE1STQ61LeEdZ6WHg3BIb03p07Nj2PzlCtXEQ1/foh4WZaBLJgnwwJq2XHBkIuZ5LnrgS
 LIhWuzJojHoHQAUwFOAC+loM3wkoU+e6DSLTzcGwdRohhJR8oawPcTajk/DbShU/vmdaOabTwqO
 lzqckYRI+hWpXGpJSNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050003

On Tue, Sep 15, 2026 at 05:27:48PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8850) has an additional INT2 GDSC that powers a subset
> of the DPU source pipes (VIG2/VIG3/DMA5), on top of the CORE_GDSC
> that powers the rest of the MDSS hardware.
> 
> Describe INT2 GDSC as an additional power domain of the DPU device
> rather than of the whole MDSS, since it only supplies DPU-local
> source pipes. Restrict the schema change to the Kaanapali DPU
> compatible via an if/then, so other platforms sharing
> qcom,sm8650-dpu.yaml (which don't have an INT2 GDSC) keep the
> existing single power-domain constraint.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dpu-common.yaml           | 19 ++++++++++++++++--
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> index 3f953aa5e694..19b791a857b5 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -25,8 +25,7 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  power-domains:
> -    maxItems: 1
> +  power-domains: true
>  
>    operating-points-v2: true
>    opp-table:
> @@ -53,4 +52,20 @@ required:
>    - operating-points-v2
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,kaanapali-dpu
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2
> +          maxItems: 2
> +    else:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +
>  additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> index aa0cf0ec5b93..88aa71d2b912 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> @@ -61,6 +61,29 @@ required:
>    - clocks
>    - clock-names
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,kaanapali-dpu
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: MMCX power domain
> +            - description: INT2 GDSC power domain
> +
> +        power-domain-names:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - const: mmcx
> +            - const: int2

Nit: I'd suggest more generic names here. If the next platform switches
from "mmcx" to some other domain, while keeping the split architecture,
the name becomes unapplicable (in the past we have seen platforms using
CX instead of MMCX). What about using names like "core", "int2"?

> +
> +      required:
> +        - power-domain-names
> +
>  unevaluatedProperties: false
>  
>  examples:
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
