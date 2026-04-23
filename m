Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B138F92F
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776926314; cv=none; b=I+4IvHd3I8f6KonyFLt3GusTgltZVm0CrwSGNnc817p6oqjlhN/76/vNC6x/T7BRg9cklUan2g+gXHAL1YICS1YqY3aW8cFgPJghqZvFW36jnuAbPP3+mNnkcSAtgHCOfrRdB9K/yJLgE96pZHnZx3iFP9hXu6ir09X+jJk5hXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776926314; c=relaxed/simple;
	bh=f9bB+QCzyO4SPrZm1hCl+G5k5J3z0zeRKWEBzruI15s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvSODwrQW7K17uN7+l7tweZUQ58E4b7Vd7gPzTwtZvwVHSvl2PBAoTgorfr0VL86YqVv6niKX3Wvw4VXzJvc9ULllPpYmjdUBTjpZ2Webc5ZRQZRCxUi3nZlhsUMlJ2sEGbL2M0kTGQ/lzf7JHC+iwZfe6Q+W1G8qRddE8jx2tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elGp1avN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qr5B5uc1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elGp1avN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qr5B5uc1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N31bkW2012019
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLGgXgdKNsiXpJ40Bw+Wx6qYrT09N0IAHqV9io35Jzo=; b=elGp1avNJTiNsW3s
	3fcfgJO9t4TwXaPXAcwz558CRkOUbF/p6+V05UE6/QrmEuqXddNB/jWCO0EwIODE
	uwZhWC4tfw9xRWWKbpGgKYarqfvR0n28STK6KdojyEQ4wtyA4+cZgpI6Zi/WYSN2
	U/msFi/Wy0ylYfI+okkTpun5qvbxP/8GC52BcwuLScthnD46oFUYIvVqBncHXIXq
	b4u6o+9zPmW9M2GeLVArhO91Hk4h5quqHGlQ3wTa0p/FDvM4llSqsewZLSDAKC1b
	J/D1ZY5k6c0LBzgMLzOswQl8A/B1fBUZ4F/nkazazWZu8lhGgxa9W6N9L5AGudnc
	r0toOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h7ahrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:38:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35449510446so6937654a91.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776926307; x=1777531107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLGgXgdKNsiXpJ40Bw+Wx6qYrT09N0IAHqV9io35Jzo=;
        b=Qr5B5uc1U1BNhzRQhbGjkaFzBy1qOLiwYaeceriH6dLXB3LTTsKZ2/Jmq06yKS5w1l
         RzZWJJppTyBBHSBzB1BURqtKlyOJbqUbudS+Yd68YOs8GXtuEcZhjfLxOZRztdj9uugz
         1RtXx0Ud27KLSBVdytpoCvzyKwqLe6K05lKCR7CDtY6d/O0huZp5w4C+hev7u4DynD6S
         /LdbHRvmBWBtdtwI29AKxbENl60r5mQU0YpLt4DWeP16srcyXS1xfXDermYYn0udV/fY
         yKgQp6Ux9S86pZYX5NMV2BJaZqXbQz54b4caBxcb+z5mM2kCFShtQAAj626M8D70dNT0
         +5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776926307; x=1777531107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLGgXgdKNsiXpJ40Bw+Wx6qYrT09N0IAHqV9io35Jzo=;
        b=HqQ6/LLxO+WAHYG76YLAWMMWu+fMvv2a1iixjSYYWZhAtwywDFPJ12ERND/RKqbtYa
         40nwl14GNGQwFjX59w7kcipHy6ch12BJkBAb140SPcAUQZnFo4pu0BVgkO0d1qplUlQO
         RxRfAHXQtPUB3/au5mnh4IfQHbTamMZ85jXpSPRSQ9GrNHA40NnH6NX4MlHBjOtOnfNL
         GViV3ag3O3+y3CXfp68wcdtJgW9K0kaToMi2JSjTUgdWNGmk7R6KMr2+7ShZtL8PrD/m
         JSatOAz+5sb6lRpRviB/5yJEqFELu3jV5+E8ah0ReYz6ho7y64aMgtqCDxF+UHtBl5Hh
         vSxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bWqj50i4o0WZ2rT0r0J4vf+SBkYjKlypqZB1h6lk/rGeijm610JJZvvZIPMNfUcz5Lc5pJoBov3y1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05jr6+2SdFawhR8PxEQNGlyVDBWbUNxFThPbGUNfro02x7euS
	Kf0i5G3gj4FhD65VEKge8MWMrfk+Wpn/QxK+0lHUAaIPOVpUn4JKQyS32kwj7xP8HZQTSrtC4yX
	cEJ09zzVXYh/XZYO6luEIss3OBYSPhKvKv0/KGLKIA7EjHpm4i+KCwzWEplU0E0e8
X-Gm-Gg: AeBDieuNg9gdtYuC3fkLa4P3/UI4ySFvycjlqS0omZ+YLl+1/jWnXjPBOgzySATZ6pA
	BTYzw9ut4atiAK1H0wpQH1B4oJj2GzmrUBRSNa3l/KlIeyMn9zQ3WSyS+3Mbtzlm93kOh5lZgLx
	rDtPv/kb4jxR4cH9rZGwp4nKI7NV+KwUhEMtTO98OkzymoFNCyhNVWgGw7+ZUBVuR/+UjK5CKbW
	lI/hdi46qWY7gb5Cefbr1/kf0qz3gbAKDz4+pARu/HCdzEmrstCLk3q8n6uKlz6rDkBr1E+h2s1
	yoJhGaz/fZjoAFZ2iQQ8MWFu7BVfayFqbE8/UQMaai1xiiOZw8+60NgDah1pG2yYLe5yej5YuNQ
	s94BGYvctwt/LcSKZYEtDZBp9aQg7QSeMCxQxtu5QqHUIy3g4rL6fA1SKdqr+rRvBQQQ=
X-Received: by 2002:a05:6a20:258c:b0:3a2:f75f:73ef with SMTP id adf61e73a8af0-3a2f75f7de6mr9430746637.37.1776926306596;
        Wed, 22 Apr 2026 23:38:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:258c:b0:3a2:f75f:73ef with SMTP id adf61e73a8af0-3a2f75f7de6mr9430713637.37.1776926306134;
        Wed, 22 Apr 2026 23:38:26 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f0811fsm14309121a12.0.2026.04.22.23.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 23:38:25 -0700 (PDT)
Message-ID: <8b2c1131-c05e-4c6d-bb80-55b812b0d132@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:08:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] soc: qcom: geni-se: Keep pinctrl active for
 multi-owner controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, Frank.Li@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        linmq006@gmail.com, quic_jseerapu@quicinc.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: krzysztof.kozlowski@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260331114742.2896317-1-mukesh.savaliya@oss.qualcomm.com>
 <20260331114742.2896317-4-mukesh.savaliya@oss.qualcomm.com>
 <ce5eb817-ce13-49c3-81f8-8e28c40632a1@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <ce5eb817-ce13-49c3-81f8-8e28c40632a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xViVvD_FfgdaMVLMInKSsgpEMi1drvvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2MCBTYWx0ZWRfXyRE9Z690wEbA
 j4c6Fhry+DAbbNKSfhHPsZ69i/k199XQHoixFV3atiIl73us/jfSTmfO90olE/n4r1aj4QjFyM2
 g+nTnh5L3ZItoPuQwdw3lNhtLqV1dh+qB+fNafGtt+SbULiLtBYwRXrQCtCJ42XPN0syxmwvEQ8
 gDUr7W/Rr/IQuBBu5VQqx20lKupjNX5DdkVTDNKsNXN2f0eXD6YOA2FwbMR6KgVw9h9lYA17bAs
 C16p7meMrEDY9PGyMwDXp0ewIzuHg1470DyLxjqE96aLNTP77EoUTfESJtIf8tfOLilnHwDKL5K
 4z9DDUroiiw8S7a3jg8ji71tQ5kbWM0/yfnzPx0OPjTwZevy+J+K8wtKGp96TfGAWQ/abHHDIRw
 Q3Mqcdx7o1DD8TSNC5rVp0ossB/wE/fZC4FpevUEPWf2a+xfmjH77W0uHIRTmzpPLBsNDsqiMCB
 Ifr6Sy5v3f1QQ6o80pQ==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e9be63 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NEtnsU5enKSBwt4-RL0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: xViVvD_FfgdaMVLMInKSsgpEMi1drvvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230060

Thanks Konrad for the review !

On 4/1/2026 3:49 PM, Konrad Dybcio wrote:
> On 3/31/26 1:47 PM, Mukesh Kumar Savaliya wrote:
>> On platforms where a GENI Serial Engine is shared with another system
>> processor, selecting the "sleep" pinctrl state can disrupt ongoing
>> transfers initiated by the other processor.
>>
>> Teach geni_se_resources_off() to skip selecting the pinctrl sleep state
>> when the Serial Engine is marked as shared, while still allowing the
>> rest of the resource shutdown sequence to proceed.
>>
>> This is required for multi-owner configurations (described via DeviceTree
>> with qcom,qup-multi-owner on the protocol controller node).
>>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> + * @multi_owner:	True if SE is shared between multiprocessors.
> 
> 'between multiple owners'?
> 

yes, will update for next patch along with keeping below RB tag.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

