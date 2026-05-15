Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ADA47278A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842806; cv=none; b=ogPXm8AWlXwX82/8YelZGG6BJ7ns1fhesrnLGB5SLbEvRQHiLqGC96Wcffg2OqW/nunMbN9vgEYZMx9J/Tr5Ne9DeJKt5IXTx5mQVnJ9UhASGUL+T+qt/viU8p/DTYIm9WBp7IaCqWfSz3Xo8OQ0fMYlJ6OdQENoxZjYnbbZl74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842806; c=relaxed/simple;
	bh=d9svSVoC/0gprbIsZjbMSKlYwm8aJHtknx9JJuoaBvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dc4sU4ZpKbGpty84frcxEcIeKj3YVllZqTusD5XO6OzVaTNcmGmFmLnAh8lxDYJxzSbKVjceZHt3PmNeT+T+61T52f6pGHUs9Udn49dK2xQ3NSljTRCODsboQcGD7eBuXmj7Ghn+ElI0P7IhYkXQu/A4SBHXh69+kEfoiDQRIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNGw18Dc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxMwWH99; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNGw18Dc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxMwWH99"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5A9fP3671116
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwNED0X7bSPnXywU7V8jXrxjWzkV7IGyIrfFiq5v23Q=; b=iNGw18DcdHVN353m
	smOCqTh1rnRO5lSLkR+Jx+ypQMSh6IGS486rufTU/fmcjKDWFOLeb/qlRCRfhE+H
	lWMSYOelSVyPNQQSSFPXSVTL3x4P0Zh/mw3sTp3a2jS6j5fLyli70WuKADVhC+k5
	g3QVunX6/nfu/PWXaIGznoL5aP7Q9kuIjGP39cQNeOLpPgZasC9+AMkKoRF9fk8D
	juOMjpogTFVWXMk1ub0+axeuk2OYZu0/s9RrSTo2Wz8oaWKnhxBufxD8XpGb+1et
	BcpCvkb7fNWnvHuemdN/ev8T4Q5d74QxMZHSmi3tFUaxroaTNXsSYxQumdhc64/W
	xYzGUA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s30aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:00:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63126f42441so635881137.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842804; x=1779447604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwNED0X7bSPnXywU7V8jXrxjWzkV7IGyIrfFiq5v23Q=;
        b=ZxMwWH995lSORndW3M2AYe160ovA1XCVNwg3VKQyAprouzpPtonGcr3kCOtSamCDUE
         uCXZPFFInxlE1j8mr7g//EiZZ73Cqbnf71LaZYnOm0a6ejXeena3fbVNa1j6kmEN8vHW
         oHmOQ4nWb06ncLXqtXXVDfu3P9lKxXRsJ0+W9FRx0xZfld44VdqVNAlem5J8Li3X2+7z
         0L2gFTtgngKjNUMJ8jNhv+5lNDBbGoM7y7iKUHa4e3mswpe+M6blVGnE5zWbqqcx78FP
         wbq0GvWxyvX4LOu+/K7963lA1yU4ROnUrHUep1Eok1WEcvnGWMtjbmoyONwRnZcx3w83
         pFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842804; x=1779447604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwNED0X7bSPnXywU7V8jXrxjWzkV7IGyIrfFiq5v23Q=;
        b=YkGrQvbzZS6zq6t34rpt+mZplvvPcHaDBpX8JVNR8ZrMPGSpvNY2W4FfsL7ydsFRsZ
         aIjBuqPHc6QUYS4eqqmy22ZZaDac00CIGGUWF41bwKOy1RactOQwTNQUL4daEa2jrNO7
         cb9LLLkZareww524OWGlFoPa1VRRCMLlw8VYhWwyfx0pmHXnShbJLxKpqsiXkNZwHWkM
         Yk+vAdXipujNMdYbzukvQpf2JQwfZjcX6iQ+3vwFwnV/bcEUZovsQakSc/7YWEOjr3mD
         7CvSfvDzi7bnxLG3FMEakwtjwxFk1Yd2pIoLIwesPmtvitR45TnwjwLEj/73j6Xu5pGl
         EVeA==
X-Forwarded-Encrypted: i=1; AFNElJ/htPk9H3eH+GhMnJYAguXqFk37JkF7w4HrYOcQf+/lT7zlezjATYrP+W0NFuz0CgTrG8AuFVHX8hEC@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnN4Jy0x0zwyUf9d4KknCYesMZKrCCeRP0v3JHR+FZHwrJ1tO
	iTyf3/s7YR+hVlnNV6GsqgPz4M3Fd3FphKi6TnpIIinsoP4Z96MDQSyA+zRqc2Ts+rpXhmUaAlL
	Z0MXOTdHzRLRZqMEa2Msps/+z3V82f0ExYUEx63GASh+MKhvdbPYNxycVA5CG03Ec
X-Gm-Gg: Acq92OH88yrZrivbt+qTqQ5BxPCL5JvQUNCrzyo2mw8NzcpOonJju9As2nhHPsi7E94
	uFfugHclwkssHEBgfsANZYZ9sCCd5wyoOlOnrobpFu/RoNUOHd93p1iTk0nzyI5YIgFia/rxea/
	K0fb9Hv6UFyU5SqLCeqr039pyebUQHlz5ETzJECIDv6tTPst/LPtj+qqHQxw8ivwhLtnySmamjE
	XRr48J/DEl2pwUL1RW3rjJ7w1OogjNY6LHf90AltS8u8Tb6NiQxUZKDZa8GhwBsUuDM7miNoH9e
	eDUZN9AQUsV37A0vRrXnQ3yZ8Ptoo8uX4rTT2A/kZ81UvYNl1gjl9p1VZ1f4WqIJRixbEJbHQ/j
	koOHUFFBTkLJbAesHRdvn0MX1CFD5Wo8MZL66lgoGH5hb1oLRhVZhHUep2pE8Lsp0n9HCaJfCa+
	oxcfk=
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr411881137.3.1778842803537;
        Fri, 15 May 2026 04:00:03 -0700 (PDT)
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr411874137.3.1778842803119;
        Fri, 15 May 2026 04:00:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd0a40sm207292666b.12.2026.05.15.04.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:00:02 -0700 (PDT)
Message-ID: <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:00:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX3dWLXwqxE670
 yRUO0a6h4oJ2d/nZ08BRC2JM60eYTwfxnAzAd4eWnB/6Rhlxs7JnnBF+Aigo1VcwNbe7FrJ+LI1
 TLDeV0qRk3nom54lvuyqr+nV500VAhSBDj1NMMk2HBwNJepqVQlPuMSsU84FXByZF2x1ik+FT6i
 u5rFDuGJwbveg5Cci/4nJaslhcER4Yt9RR54uiqHhZm++n4bTN4XV7NZNWTkb9QUy9r6bZYZOzU
 WBvnAbfYBF88PoZF5I5YwedGntAHqNM4zdczgUnV/wElGlcNZ09/5vZyv30y4fR0UeKqSLvNlyg
 ov8gLkfsbwLxC+BwVtLglLn83VdaNEZ+/w3/lukBmsdWFJsC17UGuGI01ciPthDWiG0weIrLUIe
 jpouzDYSuoGQHF+HSWZSboAbsJi7P67jik6NkbAAaVAM5i3fF6k1FcEXO04y/aQwNdu6h76BXG3
 A1BBZl1zOITLib84Iiw==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06fcb4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9Tg3tFWD4DZn8JD1CIcA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: XHRO5K8gLY8BucKFHSKuy3y6JYkSqxQ5
X-Proofpoint-ORIG-GUID: XHRO5K8gLY8BucKFHSKuy3y6JYkSqxQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150110

On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
> With the default PSCI suspend value for cluster idle state Lenovo Yoga
> C630 isn't stable enough. For example it might reset if display device
> isn't probed early enough. Drop one of the bits from the PSCI suspend
> value to make C630 work in stable way.
> 
> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index e41200839dbe..e6c67016552a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -347,6 +347,10 @@ &cdsp_pas {
>  	status = "okay";
>  };
>  
> +&cluster_sleep_0 {
> +	arm,psci-suspend-param = <0x41003244>;
> +};

Is it better if you do hack in a

qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");

somewhere?

Konrad



