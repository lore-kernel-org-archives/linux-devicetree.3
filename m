Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133662EA480
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926517; cv=none; b=o4D7Ol3AXcuALfGoW7gxKhj7JG3Nwn/uhh1r+H8Q1vhaQlHEcewnUPlyKMNGb6WAC2UWd7qclsyTWhRGKNBnp+tDEfx15dYaqn3B62NYvkVogtxZjv0sCLqh/MHUkI8Cf0lFElZK/uqvZLdt2sl69pcoHVr/zwAGR4f5Rz77imQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926517; c=relaxed/simple;
	bh=PZ4B3OBIBssvfzWxhVQD2t650FvBAlhF+2EGFB6vkDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cl51vBJRzlZV3Qpdqybd0ItxUVZApIi3rFQZpC7kUxLPzpnJLHaqmdtmqDmS68p/g/BeWERylEN2Gt1OUERjtIpjKdYTYVUrodJlXEG+UQuZYU3p8ovKdjRNAtFRrK7BA2DSVkGKU9p7HNDJAbLHHXCfZ4lu+HCIPHJtmeKBUL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TpUEp5hF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2BUoylr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TpUEp5hF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2BUoylr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR5iG3783014
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gZMjcfL56nfEqXpkbtHqbJ4I
	XYaeM4YQuE8a5EedgTw=; b=TpUEp5hF4OSr2snKAVhZ3CwqrUqUi1H+2q5h0/ku
	QUktKmkVWdMq5/iXyGRRgBAJbDKI0cKuY1MQ/ZKjdzpHcyvO6TFdbqhWhxI1/GxW
	qPbzg7uDMuPIHIcnN3o++rsPeS31eFrB+e3vk60HLVbIBeGzVI0or8tXmE90Vdn8
	U9sEOPXSrw4WZoqoRYZoSlcpif8sQeSyk2uLMQot82LMjulxribpFT3Wo1fjT9uE
	YdkmAyw0R6dwe1ZaHtaxvhNdv02A/0dxFwCIhTBsZDVTQ4KGuQrmfGgB1hz+Edng
	sUK/zzkBBdxKMIzLjwbYlzY56pQe1md3KZ6W+mMnCsHkmw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee0637-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:48:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6751db2792dso2129255137.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926513; x=1781531313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZMjcfL56nfEqXpkbtHqbJ4IXYaeM4YQuE8a5EedgTw=;
        b=G2BUoylrOLBQKcNvjm+GPoredjDRJnuQ1BW2OBydAVod7ugRBufYHTxRmErW8uE8iy
         5kdttjdLuNfl1Ot5PzfHbITW6TVJQ1oRFmnM1wl0ZAAgjfSiExFAwfSwGlTW8mIimL7R
         PFN7F6xpTeiLAKr6yS/QVQFDNJPSrrvi9N3aAqzd7xbemeKg4ZlzZaDYsETfw9bUxoLO
         V3/EW+0tgt68CUeHjk8zpsJMy2OGmAoo3rc2F9W5KmMwpWNEZr9tovA1Jo9jplA0Q2El
         SDBE6Tv2lZz56TjjVpqz1lbQMLEgPPwXyYx2V8zBPqUmSFSuoL4k2rtaJN0YKePujIDo
         p4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926513; x=1781531313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZMjcfL56nfEqXpkbtHqbJ4IXYaeM4YQuE8a5EedgTw=;
        b=PTSGPC6qJTq5XR7GCuZn42H74WeG70FrEukNUv50hmcdwP6wteVjrxU01qaOMmnlB5
         5hZL45E029QbW0oOrlG5N9PZfyjSYWzgfna5QGLR4OJkABGo3MzI9D9UwLucDLxgGQI0
         1cFcacwEoYIG/c5UWLDqRmmRojHZB2TX+jhTO94PDiAypsuSc6n4nmoeA0GV+a7/W60e
         5Lq5mhyEFoQHspnTC8UwoRAL988GZZ/r2VxrZ03l2tSmS42G5E1qrsnoZx8+80bjfRkb
         t4G1c6PUxFtd2c1rK3/ylyanMsfaFx79TklLaVvohbhVHgu7a8nYuUn+gZuPAZlggW/a
         BwfA==
X-Forwarded-Encrypted: i=1; AFNElJ/5ADr1KrPu8Coutpzvh0pmx82+CFH6+55gePwr0mn+YpunDdB4nPaCqnnumNMa9B2iZvy3UC7fd/mz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ugOxCiIDhURIEV5yoWwLlCfHYXbgG1zEhvPKsOuY1UYxS3qd
	VAzcqd8g9hPLImh4OYlXxQhsCLuTtUXnjLbuyIYczf1HzLxVmkDwKy+EBePLpR0k4sftAcIbYxN
	iltIJnllwLF5cDfj9XCuv0rSLMeAUc1gHbJ9D5r+EhCxiRJ2k3KOrzQks+N2LUZ90
X-Gm-Gg: Acq92OF1S1oQ4j5jwe01kcyYiaXuEvvI/rJAYV5Rdn82oVJeODNibQobniy/aEV01M7
	sGTReNF4kw+xlUVyoHrK2ts89Rcm+AWIxbrdSGFtIlVT3ATEqrQIAgEi8o837u2Zq3Ikgh+NN98
	mvJ7Id1qL99Zi31+NtsEv/R58epY7aZC1c9qbIDYO9vFTZhUwx7qFXPWcQAhajiclv+/8ujCjzq
	Tsp70PSgxQ+gLdNMgZYR8uZHWlcXlZHyRd/T0zWtedo+B/Ms+zjNPOS/XcrliA3BNxk59SWHSV0
	+nQwjHvCRimMKEZ649A6ZlyUbyELbLf7L9o4Pd5tQ5RxMWJncOGGgqdcMm9S0H20OV4ApR+r0bu
	mp0SHKWMR3yfeQ0E/U1Dk1aBQo8GWcb6SOl4YzvEkm40o5c1fpcJE+t+uvp0UW2EA7jprBBZ5iD
	BbzGRhpdm/zV+C9V89CwcCMdelhG+b2DIA1Fshd2+xjCsX6Q==
X-Received: by 2002:a05:6102:808f:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6fef26cd8b4mr7121147137.12.1780926513418;
        Mon, 08 Jun 2026 06:48:33 -0700 (PDT)
X-Received: by 2002:a05:6102:808f:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6fef26cd8b4mr7121083137.12.1780926512933;
        Mon, 08 Jun 2026 06:48:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed77esm3885124e87.17.2026.06.08.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:48:30 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:48:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <naa4rebf2mpn2uybjgmaidtni5fckbc66t2fx3tv3cfklfsnb5@op3qmkovxz7o>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMSBTYWx0ZWRfX6EfTVKRNplXS
 yOpRNyasW1QIi5BgT9ic82G+G6oJoh+pGCNEn/4Ku3jqEosYrHTLqzbi8USuarFbrf4AJ+VXP3v
 sjpjYnhO36is0YQDxWzpJWkVxUhn/cMbu0pTlJ3MnLy07SeZQ82lX2Ye5I2aju9MArkXg4nQ1Mm
 a0i61ioPU6iXiCTZ3hMlMywR/YOFbmm5EL1g8IwHUM3YKubNIC4g5oz+PdMZoxos+mOCrmu80BX
 FD/wYL9PlAC21JmSS48rFCo7nmb/fouiVXAhnpXsmqXAo/FVffNn+Es3DD+mDJLsl5MEoj5q/pH
 GFFImoXXGlqg8qsKeHF+NEBKNKCgS/q091mbkL7Blb1WHpjEzuHlsUSeWXh9WKU8FHX2xZmflQU
 02YuHZoc1oSJoSbOqN5VPqf6pjqyz76+QmHLeLoORbgCrsE1VxwebV/fBwsDwtHtQoDF3wn9L1/
 G/JftPu1F7UU9rKlsMg==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a26c832 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3fmthTPW8Nr5gDDPHxsA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: RXibpzYa5zjBxdSbkzfVVxDX_85Lz65o
X-Proofpoint-ORIG-GUID: RXibpzYa5zjBxdSbkzfVVxDX_85Lz65o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080131

On Tue, May 26, 2026 at 08:12:02PM +0530, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect
> path before the SMMU register space is accessible. Add the optional
> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -243,6 +243,13 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      Interconnect path to the SMMU register space. Required on SoCs
> +      where the SMMU registers are only accessible after a bandwidth
> +      vote has been placed on the interconnect fabric.
> +
>    nvidia,memory-controller:
>      description: |
>        A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> @@ -602,6 +609,26 @@ allOf:
>          clock-names: false
>          clocks: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - enum:
> +                - qcom,qcs615-smmu-500
> +                - qcom,qcs8300-smmu-500
> +                - qcom,sa8775p-smmu-500
> +                - qcom,sc7280-smmu-500

Only these platforms have the interconnect which needs to be voted
upon?

> +            - const: qcom,adreno-smmu
> +            - const: qcom,smmu-500
> +            - const: arm,mmu-500
> +    then:
> +      properties:
> +        interconnects:
> +          maxItems: 1
> +    else:
> +      properties:
> +        interconnects: false
> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
