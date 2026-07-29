Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1444B39658D
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322312; cv=none; b=gqPNyekgkk5qalTzP/GAylZuXL/q04IqXkDo3qHXIkA3v03bbyCvB7V24iYKolHSqG5EFRp4+rKG6+0GgL30pSRpFYc4FiHrd/JBppK1qhqGuPh6/itzyxxOqCYgGN425QOp1kjEmeLmJZQjn/yMQs0DsyD+8HYTfrZfjfV0MXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322312; c=relaxed/simple;
	bh=4JPrL1boeP0zkJkJ6n1n+sxuwrxfu+vFwO3zzo8geME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYIPACMbUzSxV208xfmY3Hc4WvXpItep/Enr1CzHhHTMEDZmjQXtkMzjk3DN25ywLJqw1KID5uE8IaXoRi9b1mQnjXQMvWxmP3/RGsI3fWl1U9LAoAjjJEdr2ZRwtoAnbP8ahresUXVJEZoyOtU8OvJQZvug85C+dWicswk70DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvbLkTSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ct222NTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvbLkTSM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ct222NTC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f80S683437
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4VD1fGnOXstdgV6tE+n0grMbMG2QfBdfgX8jxY7iFQ=; b=mvbLkTSMvhH6rH+K
	qf7I9UU+VM4teGLw6652DeNREAADp6eQAIyRbnS66W9Xxc6TO8jYdZTsSGxOBUjx
	jMUNCnlblom5znP1NWOtPMfURWC9fJAjDkE0TGf41BOmub1oyqNlkW6VAWfFD1cW
	ibocvoKfYrwNbHpaS07J76BfPAQaXV3qwF3GF4/UP5mG6Cyw07DWK7qOjYI3Aiyj
	w+8wic3mIbGzRUPfo+nRDyDzeJIITwiXyAV7jJAzzpZ5Htlax9tAQc3h/3/ohgLp
	qmHcWh33kBqHSC9UU9sgdACD7/FcaQ34+bSQS/4mV0JiIf1heVKfVoB0n+q3v1eb
	8I9mKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbn1s8hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:51:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so10438261cf.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322309; x=1785927109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4VD1fGnOXstdgV6tE+n0grMbMG2QfBdfgX8jxY7iFQ=;
        b=Ct222NTCji9dlQbt9Qs4sgLa1ePEq9ndcb/nsaeEvnxfYNC7erP1C1RSNj86FgXxsC
         6PkixXAMQ5ac73GD8o9j8T5Vjdn/fpwcxX15Hd5WNqwcVX02uEXk0eejwNpuao9bzHif
         0TSJKHW9F0l9MFZsxI7yiuC42dRUpjzhKP5PZ69zXm9al73KUCCxYt8w6h71rPF4nCIM
         HUyn/kz/elxmju/+ajg3fFKf8+fcHafvaCV0k1k3WI+XW0e0tNFAcnMVYl3R7qYp/SVm
         Ata3hq5RejwZvC4zb6i/4rn4KsQEEc/QNNynhp5tTQqXUoE1aJqe5j8yodehnoWsLZr8
         7heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322309; x=1785927109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4VD1fGnOXstdgV6tE+n0grMbMG2QfBdfgX8jxY7iFQ=;
        b=DFHUS9AZRMHS519dYqQyE55TSertX6ij+6F/XsMmqt2v5Grv2DomxUQF1okruASjU0
         g0nyW+Xh4iLtiSaj7taZ1tsxmeI7QqBO8RKnLp9uDAdO45gZe1U+f1i4MY+L9IYWP1wp
         0tFF0iIIPOght2NTehfaKbiV0H+cTfVqUOpIek+z4F8yyVmAHZl5Fbt9baj3IogQHydT
         cvs/8nu7u1COgWEkJKoW7vJcWDINwaxDTijgytHyWQAVErSGBtFzoqZtGTN+XB6gno5V
         Y3lUdsAQghomrhQg9cbgRCP7OWxhvI2x5mD6hOCuw1aT6rbofbXEvhKJpfNEqrPmYDQF
         KtKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoC7i99TFmnu6vaEjWEXrfmlrWXgM+TN+/s5hkV3mIvurSJSZzz9IL1mFv6Lg/HsPV92P48S+ymbUC3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5bS/+hEDh9D1CRz1Skb/gjHgCtVw81hzw6XsYBzpz/7robXXx
	U+BgaesWOZ7WeExdLiFH4OxuH0o/wzvw+dVPIIhV414aWVBekYw/ye6d1uIvvlU4KBkwJaKMI5m
	XcSuMYVdzP2c4N9rn2nHSGc3kdpyVV2GR9XDwUPyDt53v8Lh8xrV4to/vjLJsAwsH
X-Gm-Gg: AR+sD10AfW7S8+vFaex+jrv/MBcUEt7xUn1PfoWJu/5bgGeoEtxe0dRya5rDp2IDZal
	40qblrCr4P+O4xwGlXjWkVne+3HCRTVGqCfUqwjvCMfTdBkoMiShcTLkqyvMXFmoe0Z+IrsQdaA
	G+uErk4Y4s44VQ650MXsmksZug0KT/73j7ErE2kIGL4r/0boJhruvlrgUPI0nNh/vRPNVFiNfB5
	R0bS8Pp382LV0NI882XRaR2P/qRwlajlhq5UDVHB/xlPx4v948nJ0GFkMyAFHUEGRH0DZpDpxWC
	c011wdoQA+sPzsC7RBbS1aFuU4YOPAuTs/Vv/LW7f34O297fSDCAPygSOxNm9Og8d0vhNaEkWBl
	00zAZvNkdevbO4FqHElbZm6YBeTR80e41G9jSI20lccujOYrRaWlnEQf+0zcyOW1mGZ6J0Uhg
X-Received: by 2002:a05:622a:1e17:b0:51c:7b12:1207 with SMTP id d75a77b69052e-529d728801emr49858131cf.85.1785322308962;
        Wed, 29 Jul 2026 03:51:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1e17:b0:51c:7b12:1207 with SMTP id d75a77b69052e-529d728801emr49857991cf.85.1785322308550;
        Wed, 29 Jul 2026 03:51:48 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050ae95ffsm697272a12.0.2026.07.29.03.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:51:47 -0700 (PDT)
Message-ID: <013e1e65-b9dd-4662-a273-68748271220a@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:51:45 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org
Cc: mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
 <9ac3c44f-2227-44fd-abad-fc85ee57ea13@linaro.org>
 <22caf78c-4855-41c6-8a36-4dde85e3d102@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <22caf78c-4855-41c6-8a36-4dde85e3d102@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX0WXx61uB8oiG
 VVWqjcoApf4W7MU4RGt3WQSyRmDsrOgsJZkTrZewinUdNi5Sm7YjD2DFaTQJVVgnNsDrYGuUlDv
 zSvnVppNdvintnqiYBVJ+Z4H+9VYqRY=
X-Proofpoint-ORIG-GUID: PUiXbdz8i_zNkm9-Ot_bE7wmGdrUUHVF
X-Authority-Analysis: v=2.4 cv=csCrVV4i c=1 sm=1 tr=0 ts=6a69db46 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3SnrRBytGKCmZdh1xI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX7ewBNo+KSU67
 qxoBBkMZXaZ0BL4uWLrPgxzk1EdgdorLClc+CouM7CaKeI1NfdmH/0xoaVW19g/tjB434UzoPos
 gnTjCFpxDn9oN7MPU3XFlIgahQz2EjmjmOucvkQB+NromWSBfrK2jzQQGSMhuNveteQHct+yuGK
 xrgT4Uy8piGF4lTOlTmp+S7YMER6UC+SAl7PFAMBGiQHmuZjr0J76rPDgTij//sDqu5DIc746wB
 1cKtW6Po7RlOQh/nsFkJXJcrHR/xuHrHJ9SmYM/sfWh0CDJHHHlPLsfftaCH769HDByOAVrF/6q
 YvZL7uR1fGhSvVrsFOQysadTvBLJN0Cm0bWhIti/2jxz5+RLosqMOAf3kmuQ6S5S5HLUA6nIQTD
 ZVkoOmS6UEHfVlQTge0x0MOl20KHHotyH7jbAx1+HA9bGAlUBaffSGxveX0D0TOUp2EcvTNePmr
 bQKnz3i00kt/o7G7Gdw==
X-Proofpoint-GUID: PUiXbdz8i_zNkm9-Ot_bE7wmGdrUUHVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290089

Hi Atanas,

On 7/28/2026 12:28 PM, Atanas Filipov wrote:
> On 7/28/2026 12:12 PM, Bryan O'Donoghue wrote:
>> On 28/07/2026 09:25, Atanas Filipov wrote:
>>> +
>>> +        power-domains = <&camcc TITAN_TOP_GDSC>;
>>> +
>>
>> I'd expect to see MMCX and MXC in this list.
>>
>> ---
>> bod
> 
> The MMCX vote is already covered at the clock controller level.
> The camcc node in sm8250.dtsi declares:
> 
>     power-domains = <&rpmhpd RPMHPD_MMCX>;
> 
> TITAN_TOP_GDSC is a child power domain of camcc, so when the JPEG
> encoder enables it the framework walks the parent chain and votes
> for MMCX through camcc automatically.
> 
> This is consistent with cci0, cci1, and camss in sm8250.dtsi --
> all use only TITAN_TOP_GDSC with no direct MMCX/MX entry.

This was commented in v4. Bryan asks JPEG node to explicitly list its full power-domain dependencies.
Please add MMCX and MXC to the power domain list. I hope that will be enough.

Regards,
~Gjorgji

