Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306BF44D68D
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604716; cv=none; b=HE2tBG60JWLe9JmMMgKPkN6fdGpTlG0Sz6VtDc6q9W3yzQJs0m+C9mHd6usxMjgoF4RWmK8tv0uZD64TI++UPh/o6qfEoRHI/mDA6cx3Cm9PcS87yU/Jo00g2UB4kT2ZpmFD//nw9DE++orqFa5Y8ormdYz6z2dqQMB9Sydxu6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604716; c=relaxed/simple;
	bh=9BhDKFen4UB2k0VkRwii2e0UCqQ/jgw8fvKnLpNl7JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVanllrlf/x2mwvzZkhW8aWqTdOSpFkXtYfJDOSOMLByieH/NOguPqES67M1zoMteJWX0ORnoCDiXNyoCRa78/odn3oFoxUpaA4jLDBSuWExNDJfYLAoJQjRiGS26F1WqEbO1txZfJQQ5vhv1om32cJsHXDmQnP0w5bcJqEIme4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTsZ6kQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkNQRkqE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTsZ6kQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkNQRkqE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9MHd1414441
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iwZNVXHWqPMz1uVs69/fK/f+2golXCQXQiDFg0fw9s=; b=kTsZ6kQj08fHE0ul
	LlxnYjyMqS/ujDBrdmcr0urk5UJFmj3z67MjP2+fcQmGMwa6GW/exD1f2Qiryg1Y
	rKXsnf5RLGs9EL1cjfO/zL260dQu7pPZZZ+LgYtU5A5/NiCX9vHfxWMek8eIzy4L
	JH5z+xekbnl1crRNxGKu6gOMDxMtZNjXkQTnP4sY0rFq3OKaFQqn28clJil7wUCJ
	AvYC3HiEXaPzqffFCyhxiBSs+T8niyb9SKaw4ljJ4dIM1omrQSp0Vk4hFLCtiooQ
	jY7chWI3anVCtBzde4rabEwemwGxOnCRDmytOntgoYVY/eXEvdOcuAlMUbobDGS6
	VlniFg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct09ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:11:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8d37bc61dc2so12695596d6.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604713; x=1782209513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/iwZNVXHWqPMz1uVs69/fK/f+2golXCQXQiDFg0fw9s=;
        b=WkNQRkqErx4icB4Tf63wdDCJ63DtQGi6Lry1ED+HOza397Mq295SXQCJt/dQdq56sg
         yMnD28K7ld7E4soS2iEp6cEhMXFBXfdbdkscLKsTEKxVY7h6KBTh/2nPmVbjNHwKEYHg
         9qvc985XcuDchQ/ib5Gc9EYers3q6OcY4PyeLiGGkn3bSzovDqW5dldqfu1eE0/AocJM
         myoQUbPqxq4zenpzq3RXjOxFKXOeqab4G5Xn0uEqB9rGE7LXPtHjll7hMrvejg3PWSO6
         EkBjYC+0yL+md8WQIyCuEFspNSqt0KzjYcLYqN0qTY+i0pFyYXuwLcTy2fMfJslgB0AC
         UT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604713; x=1782209513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iwZNVXHWqPMz1uVs69/fK/f+2golXCQXQiDFg0fw9s=;
        b=XLx+0l290HHmCGk9t5pMcVD1PoPiS/GbJpEHUYLpHVjhWsiFYMdD+rfec9pOQ7NlcY
         lTi8VCR3k5r0CcGH5N1Adqfia0qMfWCRd0X9GiSdCIczLkHwT1tA+C/N/C7dz71yu9sj
         401OtxMUkmcgaYPj9mPPXATb+kLbzv0Gv/YhXUCzMGgTkLyWxroeBXGvIPmfPuV5W/kW
         G55WIIed+QojLJ8HnJGkXb+g46ukC/YMeUw0Zl7Gjw84uDLjJTrIMDUySIcaWDHAcPvo
         xs+lreJYdAilM+nqHLkT6kQm1HqfF2rwpSXy4WmEch8qju/8wNB9tsoWW7kspfWJOKrg
         V7Pw==
X-Forwarded-Encrypted: i=1; AFNElJ9MUtIWeNms2CEWLRGUMljEV94hmkGyblGQJ+KtGqbpaLGbsS6dDm9CauknA3Yh/9mQO4JgiYraR7lg@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxmUIwgUTB0lqzo4143EB/jThvZ8y/QlCngYlgF9gyB/w5BVm
	6jzM4HsYkdL8a6HsWw5lODYzECkd6tAEpl/xmd5SkCcjdfOHuVbiz4wWvDMnDMvoh+JkUlxk5cf
	eWQtKrTRozSkA2jW9ksR7Yowr28R8RFcQE8+TTGG/lklq7+Px5VtHFB8l5Gz0Jeda
X-Gm-Gg: Acq92OHQlGrnUeflxKdsVIhr2ZXkMFUfGwztyUB9NcMh/hEGUcc6scanFPdT3tsOOmk
	MSOe2BYNNvVcIctENTBzT+22Eshs2I9LVw+3KY6pnq42Ks7w8MEWS/1zyFKjqhlToFKCHS/TpbT
	B/WNyvpiVt2r8/BdG+sOd6P1WNoeBh0SSC8gdA+ArTlPNtTmcdeyqsmciBdtDarXOjr57XdF9WA
	aIP0X/Cuvf/GtjapaC3vAI0WBOlAeFEBqoWr/XIQZ7vTvmnlPCtiVr/XJ9h4wklaJUESyoMNhX3
	fHwNOuIx51yBoAp5q53KSwEjOSZLoqHDSE1ZkkmC1gHTJROuuVsUL7ger3qkBfAExn29N8zEEsb
	/paLIoRzaizQmVkAvTkaf//miItZwrFy03il4120h5DK+0w==
X-Received: by 2002:a05:620a:394b:b0:915:54b2:582d with SMTP id af79cd13be357-9161bd659b1mr1681029785a.8.1781604713452;
        Tue, 16 Jun 2026 03:11:53 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:915:54b2:582d with SMTP id af79cd13be357-9161bd659b1mr1681027185a.8.1781604713054;
        Tue, 16 Jun 2026 03:11:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d8c2sm597958066b.38.2026.06.16.03.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:11:52 -0700 (PDT)
Message-ID: <a07832c3-09f2-4bb8-a4ee-84576a30564a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:11:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: input: Add binding for Qualcomm SPMI
 PMIC haptics
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-1-d24e422de6b4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-1-d24e422de6b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a31216a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qXVGAw26KTG5FGYqbW0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: X10_4QwGRm6JVgJ4aOCqlYbHwamwU7rV
X-Proofpoint-ORIG-GUID: X10_4QwGRm6JVgJ4aOCqlYbHwamwU7rV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMiBTYWx0ZWRfX5J3+11Zzn0/O
 JyLQh29HD+O428EF8s2J3GanH2qGuLs4Emj+xPl025hmPlJc3kpimbUxwqhfzf75cOCBiKlBaxs
 GcvdWUIQUSRV26Ueg2sGloimCydvqBEweKsbuF6E2kkGix3X3HRKNEA24JOLD7ZFVzVr08mDqif
 5+QQ2Oq1gBA6pA8BfIp9bW3LbWVKeJS4xdxgUz4e3zGDZg93TcK5S0CZOQvM8yJtrWaZkEV7W0R
 oCvH0egpZq+LzYjC6tDu4nvrU0l5yIz23qpPTZ7z5F0iTMqoGWRK/ei7lqgJH20e+omYn/wUEwP
 azxIytbFloI2fNysMQwlOC3eLpKEhzyGjQA7H+fmJx5fTMAEy7f6GmEgAb69az1bbFGHdt+6yIy
 oLXH1HuVPFvQNBsg3dHB9uBy/sUDr2os2ak2ZOcFYvTBCX+ycqcWudOXnS90XPAIfmvLrI9bzyr
 v1W8r96/f2rDqj/OGgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMiBTYWx0ZWRfX2xR89iRHUX8S
 8vKqjlRfmHzbjknS/3Tv41LQL9R3ulPft/1m1EM7ArRkxnoJfFgcawcIIctblD8nrVokQbrA2WV
 renLrbwaQPgeypl9aZTv1Xxvkyqt5ac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160102

On 6/16/26 12:08 PM, Fenglin Wu wrote:
> Add binding document for the haptics module inside Qualcomm PMIH010X.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

[...]

> +  qcom,vmax-mv:
> +    description:
> +      Maximum allowed output driving voltage in millivolts, rounded to the
> +      nearest 50 mV step. This is the peak driving voltage in DIRECT_PLAY mode
> +      which outputs sinusoidal waveforms. The value should be equal to the square
> +      root of 2 times the Vrms voltage of the LRA.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 50
> +    maximum: 10000

multipleOf: 50?

Konrad
