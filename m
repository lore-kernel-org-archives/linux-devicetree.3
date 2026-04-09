Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32176364946
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 02:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775701164; cv=none; b=QE63w9DGh+XFs6fVSVD2StoZv9xQE+gWKLVQUnPpFwd02DPvZ9iMlULBTOwTSkm0am6BB/3s4w9ig3+n5M4P/VzLa4rWTiVLoZpcm7SI5gOq57trIQgF6T6eWv5uniXk3YPOrjsNEZvpaNKVqpB0TyEyjv/V0Pmbr32eFd+oEhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775701164; c=relaxed/simple;
	bh=8VX9iq7PyS8lecH/XeGiZcOzA8ErpbLJWQfB2notWCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZAXYlqUTPvZiLVygM5hECdjAU4V27ntZmnNMF0oxzvI3DinZ6sY9//ot7QrIUTYJIvtEIueSDfZdJDZQqKI4eQkCBBQ9G7Qgbyj/HppQBcxbqxMqVwNvH4Z2XFsoSnykAvAVROz+KkjuYcQ7rmGI0vf1WyUhYahRH0aM5nJQWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJ15wqP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccPC9fnK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJ15wqP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccPC9fnK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638L1jTV254218
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 02:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d9sCCw8oekUugQnNyjHlCrSr
	WbxrJ3dBnUZAbEDDODM=; b=AJ15wqP+KK2zKr2ezTG8zJXVHMohhb49FogLJOj4
	JK2ibProZ8qyK0m1NTZBPPbLo6JSIe2QXSxiujo71vBnA69go/vFYaTvwHn2CyoH
	448nWoo6r7/NvOUxcBxNAiHEsm0dPnnG/6/R6BStSD8STZ4gStSwH1FJgwPfn2cQ
	Z8wviuLd4GG9fq6qpPZpF/pGjg7olaz7gaEBxfPT45kzViQu/51I/idcH5Dv4UJe
	XLUAeMdU/jN6fh/YJLjvQDhQUDLXnN2T7GLkaHl0SiSCm41xFix873t4Y24+b+xA
	VL9DaysGjt2hWSu6Rh9xDHbzQR+u8nq5OE5eHQiAzbTXFw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6y9yp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:19:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso319132eec.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 19:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775701162; x=1776305962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9sCCw8oekUugQnNyjHlCrSrWbxrJ3dBnUZAbEDDODM=;
        b=ccPC9fnKicz/hwZiOJnZTNm06pHJKzOuKZDIJj2n/sZhE3cKJY8fNc5/hqILklELL3
         sH7rH9iLYyj1EwAa3uj7SWTdvxSgWZrlm/NyeXccA+fn1D6E4P9tuuWuj+sO4pd2aOYP
         sOdDzAfA4/UWXKWw2fOdVjjf4aUHC44thAOIriQD5dj9paAmdJBOfLkraJNpLVE+0909
         9BzDglUThPyXRwqmsYRBjfDWo/dUyuE4EC2Dmbot4WNrEVHtGt5xac1+331aGuGjgcdn
         MKfT5ystJh6s2nKvNSfsWiA9y8qf/txX3xLt4SAJrw2YIuuKBBintAjdxOPxYJtlNxAu
         voow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775701162; x=1776305962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9sCCw8oekUugQnNyjHlCrSrWbxrJ3dBnUZAbEDDODM=;
        b=DPdFBaAQoz/qeifiDCQor7x66PlLgq86KpbysHiuN/wP8zBT4XNleef73TAwlfWFSf
         1qJXcjLNO8+5WhmY61mhgd1JEktrfWeJnBi8jHvpmDw6MzMQ0WiYjYkU86gPgCaCyQyB
         8Rpg8QeNcK0ExIHcjZQUemyDGSPUR2yEy887AjxWTFW3iswEDKDt1JRQTHIbo5F2haEf
         FHlIwT/aFa4fjexoGfslcmq5aMapOSJ1f/bm1b30BbKDhJ4HNY1+05EFxFH+UMChSds8
         6z9+MFOdEa2Yc8iO9UN5x068SMzvh58imKkkN5O+5a7/oN44mU714oVem5adVts9FCHT
         bFDA==
X-Forwarded-Encrypted: i=1; AJvYcCWye5FX+ltpW3/F1lvjZKGvO3IbY6xW6/zm+al3vCPh7O/BgPU80sNXaqTvVS5pxv1V5EjppfzRWMbF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3dSYWFlvP4o5S7i2tlXJGLY810OecwGS9ZifSks4QXx4mvbPZ
	+i1livcLhQCTHbTUdWIvUS1IFjyyptxOgzPw6pXp7hjC/yTu6k6JTZ6SkwL4zfI+n0bZV9l5omt
	/+S9aVJAXoQvBqAz6IalICmC70jPs1NFOIRHBd+Mjhctx4FCWlmyiqA1ncIR3m95q
X-Gm-Gg: AeBDiet85o9/mwlIxSSvDmWP1xjk5mHGDlOp/ZwYRJo7+S3L8W277rdCTzG51XBFe1o
	7SK61XBMhw4F9QBCevWm1uH1O4smJGwHxIB0EgJ9kMBNf3NZmjz4MXAn439ZgT80UaiHyFhhyTG
	aV81+HfrYaTKR3GxKxQ8OiSyCIeGF0hRuFBGzFhMJh2jdNxzVn4pQyHrHioz090X2RguMZ81mb5
	9NpQCvd14VAfdqnqM2g8nquAU4yqwkr1CPbSkM8UYr9N9dmHQtp+y81Gxxp9w5PQYFTaz2KBXjP
	/LjaywH5jDqNGrHucdXZghDOmd7Z8alTT0Z4ln/sKRgl2qOFNzMvansJ6tdXc/T+X+oh9iU5pnd
	aJXPCqDoSF0mgv/eswQBTRZ+ImwD/t0xWX2j7RwH5BgIQAVCdPBYy6GHKoPDiDQneF4ww
X-Received: by 2002:a05:7022:68aa:b0:124:9fd8:4ba9 with SMTP id a92af1059eb24-12bfb70bb28mr12174540c88.12.1775701161491;
        Wed, 08 Apr 2026 19:19:21 -0700 (PDT)
X-Received: by 2002:a05:7022:68aa:b0:124:9fd8:4ba9 with SMTP id a92af1059eb24-12bfb70bb28mr12174515c88.12.1775701160899;
        Wed, 08 Apr 2026 19:19:20 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c07a8703esm18238907c88.8.2026.04.08.19.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 19:19:20 -0700 (PDT)
Date: Wed, 8 Apr 2026 19:19:18 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <adcMpisuyQPjAQCH@hu-qianyu-lv.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-1-ce0fc07f0e52@oss.qualcomm.com>
 <20260407161311.GA2666255-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407161311.GA2666255-robh@kernel.org>
X-Proofpoint-ORIG-GUID: ApPi8hPq2BUCjZ04veIt0BgHksC9tzJE
X-Proofpoint-GUID: ApPi8hPq2BUCjZ04veIt0BgHksC9tzJE
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d70caa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ltEoF5Qc1AA1ACRQjt8A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxOSBTYWx0ZWRfX79jsuzje3JSz
 +DLhd7pc61JBOuN1GNaAICe8bUz5XJkKjSax3igxdwPQTpnQlkbzjjx4RtrSuPRp6OKLm2V8Tvm
 t4867D8isdGifMkzIYapZe68vH/sCUUU7TiGISyMntOQcHNwpgfXpgkt4U2Qagk86JIPV5kwt9D
 NF5pKkY22JRI3Ej7nY5GmnEV2bvI2hx6pmZwhS7k25MOTHsOA7/1vc7gsYsS9N/dubDMZQOmIBH
 ylJdsXvUq4u1wrqoAvVkL3sVCsBKoTIW3uyJSrJYZnwlFwZqJLn6P4Lpgd30i/hUYa49yMI3v7O
 HWeU2YxXpTkMzqTHMKP7EdXFVaZuIq92TPg4PQB9O1s9pmhD3MqxtUK5xSlRU6HUZ9PDW5fqF2Z
 QS8bkDP4ggWWkig2sKKYBolbqWQUNuPdvUH8ca218T6oFmlmM/JhlF4n+UfvuCV3Aqw4LhOs0VG
 Ejzt7E8q/vgiEg1G5WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090019

On Tue, Apr 07, 2026 at 11:13:11AM -0500, Rob Herring wrote:
> On Mon, Mar 23, 2026 at 12:15:28AM -0700, Qiang Yu wrote:
> > The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> > 
> > 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
> >    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> > 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
> >    follower to form a single 8-lane PCIe Gen5 interface
> > 
> > In bifurcation mode, the hardware design requires controlling additional
> > resources beyond the standard pcie3a PHY configuration:
> > 
> > - pcie3b's aux_clk (phy_b_aux)
> > - pcie3b's phy_gdsc power domain
> > - pcie3b's bcr/nocsr reset
> > 
> > Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> > 8-lane bifurcation configuration.
> > 
> > The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> > requiring the clock-names enum to be extended to support both
> > [phy_b_aux, pipediv2] options at index 5. This follows the existing
> > pattern used for [rchng, refgen] clocks at index 3.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 45 ++++++++++++++++++----
> >  1 file changed, 37 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..25717bc9be98824e38f3c27c3299fbd1f2e7e299 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      enum:
> >        - qcom,glymur-qmp-gen4x2-pcie-phy
> >        - qcom,glymur-qmp-gen5x4-pcie-phy
> > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> >        - qcom,kaanapali-qmp-gen3x2-pcie-phy
> >        - qcom,qcs615-qmp-gen3x1-pcie-phy
> >        - qcom,qcs8300-qmp-gen4x2-pcie-phy
> > @@ -68,20 +69,23 @@ properties:
> >        - const: ref
> >        - enum: [rchng, refgen]
> >        - const: pipe
> > -      - const: pipediv2
> > +      - enum: [phy_b_aux, pipediv2]
> >  
> >    power-domains:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> 
> Once there is more than 1, you have to define the order and what each 
> one is for.
>

Okay, will add - description for each power-domains.

> >  
> >    resets:
> >      minItems: 1
> > -    maxItems: 2
> > +    maxItems: 4
> >  
> >    reset-names:
> >      minItems: 1
> >      items:
> >        - const: phy
> >        - const: phy_nocsr
> > +      - const: phy_b
> > +      - const: phy_b_nocsr
> >  
> >    vdda-phy-supply: true
> >  
> > @@ -183,6 +187,7 @@ allOf:
> >              enum:
> >                - qcom,glymur-qmp-gen4x2-pcie-phy
> >                - qcom,glymur-qmp-gen5x4-pcie-phy
> > +              - qcom,glymur-qmp-gen5x8-pcie-phy
> >                - qcom,qcs8300-qmp-gen4x2-pcie-phy
> >                - qcom,sa8775p-qmp-gen4x2-pcie-phy
> >                - qcom,sa8775p-qmp-gen4x4-pcie-phy
> > @@ -201,6 +206,17 @@ allOf:
> >          clock-names:
> >            minItems: 6
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,glymur-qmp-gen5x8-pcie-phy
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          minItems: 2
> 
> else:
>   maxItems: 1
>

Will add this.

- Qiang Yu
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -223,11 +239,24 @@ allOf:
> >          reset-names:
> >            minItems: 2
> >      else:
> > -      properties:
> > -        resets:
> > -          maxItems: 1
> > -        reset-names:
> > -          maxItems: 1
> > +      if:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum:
> > +                - qcom,glymur-qmp-gen5x8-pcie-phy
> > +      then:
> > +        properties:
> > +          resets:
> > +            minItems: 4
> > +          reset-names:
> > +            minItems: 4
> > +      else:
> > +        properties:
> > +          resets:
> > +            maxItems: 1
> > +          reset-names:
> > +            maxItems: 1
> >  
> >    - if:
> >        properties:
> > 
> > -- 
> > 2.34.1
> > 
