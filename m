Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA2385D78
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346313; cv=none; b=QBlmob1A3Tke0IhePUFqsIShHNlep+T/MwVJ196Koq4H+4+nhZR96KXJCQPEIKVbPM8ZP71cYmgaHBC4e6K8C42vt9gpTfqkJ3hal7JVNuENQsPEeDJori8+8vVW4fwrZILLsjqzquyvDCU/stGn2EOsrbub4uu3hQyJwWKTkd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346313; c=relaxed/simple;
	bh=OzXvlTwqyg/LORhSSsvxHKnz+VzK+OsN50SGeyyrFmo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AHvJUwOKIgEfjbKbwVyC8J1nioDnGTSRPPR3vPS6ip+XbPfty6OSlVIK4ssZdXS2YKszWRi63U595ZkLYvDhut/muBpM+ywYXk2ttfW9KKM1Xg9kpxyAdD+RYZUL1nZVhDdqxq6X8HFiBoO3HaeTboFikx1oN3BIEl5iZlK/2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1vg3W/e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iizJBzm7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1vg3W/e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iizJBzm7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L1x5bd266975
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipaFgG3ogON0geuVOtzTG/KiPSvXW3QMvF4djvkApMQ=; b=B1vg3W/euwWpmXT0
	mzK/ivX/06i+rfYeWpY4Q3W0jG7eYYXGdcOb/6CtlDz2zAtjyAC76ywiKXwQ2qGP
	G/FwwUPBgqXK4PMmDABwSM/Sa3l85HjCfxz7GMhau5d9oubwkrLSh+meSJV4yk+V
	btNs5mLaK9MwW/pJiKawRCMYxytvUy2+gDVCXG7Q8j+Jv0FrHqpBjNrUgZLlYp02
	ex7sRnqXkCmwpHaMe13QVtppYiW2fASuriagul9HYgHOCXH351shb3fu0Vr4fC8x
	ggnd0nZp3NRv8z88HNpz4Sn3CRz73zpPTek9G9BfX1t7/0USEF4b8/SnK/k4BjNa
	cYEfgw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxvcbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:51:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so6354322a12.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779346310; x=1779951110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipaFgG3ogON0geuVOtzTG/KiPSvXW3QMvF4djvkApMQ=;
        b=iizJBzm7b9BwaKNTRzDes63EmIbETTVNpbBdhD0Bl7y1dL0LAMRRrlKgCNTH7ZXiwq
         txE3rrlLQrA0Y92OQZ9BMOZfFsSyIdt5unF5vnX4mr1QsZvzLK+hHaiZdUgl7iF//k9o
         tcczvbVbd4X5bwk0oPQyMeJ6HXK27VE7pkcdlUuz2JEXk27y+S+bnZxAMU08UoDfDvQR
         JZtB5YnQgR4v9QnLytnfRj0ElZZO7poRsOFemqfkKkMbZfD9BiwwQMSUSFDt3YD6z0mH
         NtxHajgOn59bK/dIZ/iAvaLA6+DJAKjygxSCaK1diuyg4C1tY2rMoznyiGB1J5c7okb9
         aeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779346310; x=1779951110;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipaFgG3ogON0geuVOtzTG/KiPSvXW3QMvF4djvkApMQ=;
        b=SRtf5k28FbKi4fJFy9reBihRv6pmCIfd6GLoJdnXrbnBjsTLi8s41qCI1NhSzXxiij
         lHvUocf7H+QYOYYLCZ9z53k3OTyPGAL/qGH4UTA54X7VvhnMv/BW0BEBcex191xpLc9x
         GuhzURh/Vv9/tCyFdmbSfjIXWwzF2MLcYpsI6djAfDA/wFqYUqQ3LEOVgqjeem79b7mW
         xXOEEFEXgwJI+fZWvBvwLYF/5QH5HKn56UwIXFVS0A98hxloVtuM8d/OYq6rTSBu5DNB
         TIGRtZTSY5DzTRXEQOxVBreCS9TFEIEqLrFYGDRMcROLchPecoRvnbctW3fEYkCoCT/I
         2E9g==
X-Forwarded-Encrypted: i=1; AFNElJ9+VCHcvIAgjbJ810SM9KmxJc7yHBQ1jaye4pL2Nj74EFKVdqY6q1wgLRvEJ97ZU0/J1DI+PYSyw1I8@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1G8wSVyuVlGatucoYoAfKdCRdpSO46DPBVUrasM2qsypVrGS
	+6NqYaBZt4Bn39AxYUr/U+GNgPLey16z2TdixOPpsTWPo5FDOpT6X2CJj+XeCI70VRxrTwf4pc3
	ghFbZzAvProeOJNP4ht956pqRr+D02blJn7mqdb542nvnoMhT5d5opvDW3HG5LwQx
X-Gm-Gg: Acq92OH8pwK9xGa0yoBbxMwDb5RPcHcn2B0lFaNlv1FbvvzDCgpnjKfXHmiZGAlH9kq
	jIKR/+/7Gr0/kLdwn7OCiVigKPY+S+R5flCt4dNyOwttNszH6HqGHoIcAeENfBXh+zvf1yrXHYU
	jCdE64yXqGRN6q8lPdm3Ft0yNN3i1bus9WH6zZ3+kFJgnCCFPXxp/uqcbnRf/6YfT/fAhf6lF94
	OIFySl7JpWH1rGGfMl9ryGWySOYb7X8i2AoifDjKIWFQ68Z5fOKNQO4e4AtXvG2ghhxwLF8676p
	51ZRjcZyBaxhW0uZmcpfDubGGxz/e10ZIMC000+LCUG0Hrxbw63cipk6Cm2wgqaHL05w602XrN2
	tIu43+aVNz6RH7ovFSSyVJYDha8SF+NmYbaJ0YYC4MleDj4IX4YHgrp2f9kApNQ==
X-Received: by 2002:a05:6a00:845:b0:835:6d99:3f94 with SMTP id d2e1a72fcca58-8414adf542bmr1746474b3a.25.1779346309582;
        Wed, 20 May 2026 23:51:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:845:b0:835:6d99:3f94 with SMTP id d2e1a72fcca58-8414adf542bmr1746442b3a.25.1779346309052;
        Wed, 20 May 2026 23:51:49 -0700 (PDT)
Received: from [10.92.163.96] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e59ea9sm232016b3a.61.2026.05.20.23.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 23:51:48 -0700 (PDT)
Message-ID: <d4d35e17-84fa-4c95-9bfb-abfd25ea7f4a@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:21:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
To: Eric Biggers <ebiggers@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260514194735.GA1939213@google.com>
Content-Language: en-US
In-Reply-To: <20260514194735.GA1939213@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jjFyBgOGXfbZ7QC6l501NM-nHolTD22O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2NSBTYWx0ZWRfX++nuUsABM8hE
 9l3yYyMurU0xYbd3QPUMepd6KHWrsBy1gSuC78rIV8HNHITRctn2I3Jbmtm9q3ddMtcU/AZShNZ
 f6726MIV0YlAmHkB4ROq+S0H0Pbv4+yVrVcMdM7OcMHrsOz4LtMhrHge6YIFAI+LAo2UsqNiXdk
 6VU/FWOd9aOMN/RICGqfo0BdHBTQOvp9B1eALLuLultEo+fk+u1XtXfht3m1LjFXv2AngpnmHqd
 La7kalnPkDAL7oLa24Su6eN2l+zDFUtrwSJY+AXVF/V+iPNXHHlesL3aCuambEifSOtsxMS+GoP
 EjP7O2wUVOeGpIPoP4iQIAFbKpvHyUFwCdBsuoYjWQbEd2qRnSYzg3NEbu4UhoPVsNKUToVcyTC
 F23/sOyGJHfvZp/Ef43sPjeaUqXxOLdH0t9wSlVx2EUut+h82Cwo+t+zv7HXIkckrsLl7cXFBJH
 4XAjmPWeS+nf4YignhA==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0eab86 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1cRb9DtoxWFOFH21OVAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: jjFyBgOGXfbZ7QC6l501NM-nHolTD22O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210065

On 15-05-2026 01:17, Eric Biggers wrote:
> On Fri, May 15, 2026 at 12:53:35AM +0530, Kuldeep Singh wrote:
>> Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
>> Shikra bam dma supports 7 iommus so update dt-bindings accordingly.
>>
>> The patchset depends on below. There's recursive dependency so referred
>> to base DT patch here.
>> - https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
>>
>> Validations:
>> - make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
>> - make ARCH=arm64 qcom/shikra-cqs-evk.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>> - cryptobam and crypto driver probe
>> - kcapi test
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> 
> What specific kernel features would this be useful for, and what
> specific performance improvements are you seeing with those features?

I hope you mean 7 iommu entries.

Please note, shikra is an old platform and differs with latest platforms
like kaanapali in terms of iommus#.
Kaanapali is optimised(in terms of iommus#) as same pipe index/sid i.e
4/5 can be used for general purpose or for any other usecase like
DRM/HDCP etc.
Whereas for shikra, there's dedicated iommu entry for each usecase and
same pipe index/sid cannot be used for other usecases.

The performance will be be effectively similar.

-- 
Regards
Kuldeep
