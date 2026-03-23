Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2B388385
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260084; cv=none; b=DgHt3dc62HD5kAwtBkA1OwQ7drMUUeNRz0dHK8Do8yYJFh+xMtckjum8TooIExBCOPEhBoY9po4yPZjVloLt0Gc1H026M58QN0BdDvht2SqclT8eOfRKxglWBvsrZcK6kyciDkZrNDN2/V5HguJ3MdjTfESMjFvMmSL5qC4zPOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260084; c=relaxed/simple;
	bh=vViOxB6Cs1Vo4vecuWH5PX63l0iMGjGRSe4dXPzXc/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeKMLAcTHEhkH6qU9164UVlYNmyYCgBLGzOmttJYkLU2wkgOc4yYJqsoff/F8rZQuGqaAgamZ83k4hTUGCdZcvymq7KVk99D0QIePsJHRDi3pLKwYnDlQW96yUrRfntyi+n5HrwbK19mN1LnjfV1BtkMqLeV0WhK4fucNY9Qhls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F661NEi/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VglmM4h4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F661NEi/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VglmM4h4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ttMH3468155
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDKtBGhEAchSzR5OWggdmnwzuStLPCYVysdJXOF8xT0=; b=F661NEi/LOsBPWf+
	OxGR/eqrodUaDt3erx8YjaeNl5TmgIX2/dTbUV5PdIORFJB9b27rWIY1unbGiCfG
	8okgxIcAwLcUYnKpe+DRPTMoXfnPiHeZlf2JZMn93I4p37OG6H/ygpGzOQi3dBJg
	E06/BI3Qa22BDBTgvFeg+82Kw4BmIOLRPizDqAG319HmUSdhoCGfmBWM3wABPGP1
	m4PSrviIi1PLqew05oa03/o+AcOoBG9P0Bd7K6myXbT7cVGjXR3QKYnWlrLu2vIQ
	/Wt/jC2x1cXq1/f7vtbfMwywMF9ClNIA6WA395zLQU7RPDAIiSwogijgYrNBl7zE
	NywOIQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggf3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:01:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56cec5cf96bso114440e0c.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260081; x=1774864881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mDKtBGhEAchSzR5OWggdmnwzuStLPCYVysdJXOF8xT0=;
        b=VglmM4h43DEpenZw/007sjZSKKPTrJSNU1usqMAfSZ8p+5+NHdp1Tgq/6Zm4hdp1yC
         8NYbIzVMwaDI9BptyJBwvg+SRIHMPD2KRtKbpwCB7X0T4AzTiPbn1oy5PU3G8iehZ5Cv
         m4MzRsNOnGSQ1cO+HSnc4JRnfdYSilX5YIF0pj/piYBXUdhcYL4C5fiEVnQXUU/Ff8/1
         5kskPpetB/y0kkWTqd2swr5Mx6V0HUacgiL6afA95UQfFZ4GKY+ryOZRFkZCI/S7yCde
         5pL5LHpkH0ycKusfpo7G+GT3lysPUroI4bRoM6X947R4ha1TzXv1I2Ey5rdWsiyMZUps
         3QOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260081; x=1774864881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDKtBGhEAchSzR5OWggdmnwzuStLPCYVysdJXOF8xT0=;
        b=SYoLKR2XVcLjLKpeVxSBZP0zCInFYNYz9y0WHtPGfIVJexCxEn66ZfBZnwoSuebiNj
         jPPBGpt2E5WBAnBwtBgbZgQnD8opcnZy2BeMe9DZ+6Xcl0YdCLHVU8EBJVDIMygG8SUZ
         HMyS9O3L3s+SXRHBER/FkZu8d1EoMzwDgsMLkqQvoVbSYELMzlx/F8sFqDVlXE/qo+1w
         p1E0xVpZOAxslr/c1UWsrAdEkJ/pcpDkHBMcgpWCWV3fcg7yYkxGqGEwzHvcKM3tGqsC
         E4RaTl0TQjoz3ieLN0ke8Qw9gKbPF4urr9SIw+APaFaljmehIEXuTht52KvPprTnHrfk
         GTww==
X-Forwarded-Encrypted: i=1; AJvYcCV1X8FgeUxa92A/y3V7nrBLg6J9BBjSxuy6Kd/VPuOBJpB5hQ6g3grgZ6AHa3tP7sVkKpoI77qd6L6s@vger.kernel.org
X-Gm-Message-State: AOJu0YxE38+a7DImlzubQPcAotwkc+ODV3WoIj+KxLwtUzs6vrYS1ZZV
	Pp6pCUNZhBJk8Y3teh/6kyxz43ZbiUytrn4OVny6UEmckO6J42PPntzBPqjaVnraTeKgWW1YE+B
	Rdz9axV7PfdFE0orUfg94YGnT7HMU5gTjtJ0m1dJOzo7EGdJG8l2Dj3Wp1OAARvca
X-Gm-Gg: ATEYQzx6LQFvY11Oz8AjWwi6lBJQV/udwiLeyl30XJwyAKH+2nmXejlwgmDDgMThU/n
	OFg+uILmHOYjDOIY4eYOVwM1AygwfWT7boSvN1JeTLxHW8DaPnDXAMSeTNmbg6ZFwkLMTDlGkzj
	AqZMKcpIm2Cdde8LftTQu384InMzUjO6TbpF+VBNvk/vEGukjEMUOIFnOv3zScyAFyrX+DmNCth
	kE2CwvtuVksOSybcEAYT1R7VrbKHL90xqZsYWg1nsrVzohLgIeUMYhT8O66NZjAM1CnsHDIKiuO
	FAWsm/suV9a+Y0FYIQn6OQAOXzvZ/B2m+Gw2zyQY796g++Q5HrIzUVm+8Q4Yab8SmwbAF8TH9+k
	ffpSF82hQlw8XRc7he3VNtpm4urz2ZSahI0pGm1N3y+JPXgl93ulwD/YHN6D/ij5mW57zagAEDm
	bgF/g=
X-Received: by 2002:ac5:cd92:0:b0:56b:7252:f7e9 with SMTP id 71dfb90a1353d-56cde327a4emr2180265e0c.1.1774260079432;
        Mon, 23 Mar 2026 03:01:19 -0700 (PDT)
X-Received: by 2002:ac5:cd92:0:b0:56b:7252:f7e9 with SMTP id 71dfb90a1353d-56cde327a4emr2180225e0c.1.1774260078861;
        Mon, 23 Mar 2026 03:01:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983388070csm464744566b.60.2026.03.23.03.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:01:18 -0700 (PDT)
Message-ID: <d866cefe-817d-4b65-8948-4e3533ed7709@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:01:15 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur-crd: Enable keyboard,
 trackpad and touchscreen
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260319-glymur-dts-crd-enable-kbd-tp-ts-v5-1-4a440594348b@oss.qualcomm.com>
 <funq3yjordebprhusdkkapw5m4fuqpavhyeguoo7tdffv2ebub@ozh5c7a3py6f>
 <pnd7eeijf5cmo7nmydsd7bvuxhhqbkup6xv2fgpb5gfwqyfnf3@dfr44uwneph7>
 <jpnjqvaezrqv7l24dotzbyz2s7scyltlhn7xhwtb4akkrggkyk@5epol7lyk6wm>
 <ophmftetelsmelaasdddans34xzvy5htxpphvsowasp2eatt75@gy7q7pv4swjr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ophmftetelsmelaasdddans34xzvy5htxpphvsowasp2eatt75@gy7q7pv4swjr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ye3NyZpE4hALzylgmRIQzWBUWK_UJaX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfXypQAQqRkRiaJ
 ejz1poULovOoETNn8l7M5WkNx8X89LkA6IzKDidGDG1DVbrmfwXdWIoczJz7yRV0YacONhf2MKu
 S0QE3EKaTL9QxH4cTFEJ3f5xM4zFnm7mND8WNsaNlbU3pff1gd8emTbOJP+tMhCyihYFdNBAK2z
 ZIMEFtMJyMmJCHteOIa+k8UTUf5f2fKpesdBb8cP5zqOG9OtaWan3SehRT4qXjQ+AAJ3Pwv1ZkA
 MYxBSlj2LyeV/+FqGAQ1cnC1O7M1YPNMIOnx7g1u6i/JDCw0+K+kvBP8tLIOcvr2ZeGa0IN/nGT
 GVtr/pwgJSvQiRb/EVJ5cSv88PQZ7uptWn9259HmBTKcpzqSMtS2R3SDOpqES/Jcbf+zo8awD42
 yEQEHFamXDqcBSzBdHWSDMDrJQ6PgukWaSSH25VbD+xp2QAAphckFlIdFwAZrthCh7d13+1f20d
 kHsCtuHOjkcq1ffjaJA==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c10f71 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EXM5FdCO88UtrUJ2BzMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: Ye3NyZpE4hALzylgmRIQzWBUWK_UJaX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076

On 3/20/26 9:57 AM, Abel Vesa wrote:
> On 26-03-20 01:52:06, Dmitry Baryshkov wrote:
>> On Thu, Mar 19, 2026 at 11:11:18PM +0200, Abel Vesa wrote:
>>> On 26-03-19 21:49:07, Dmitry Baryshkov wrote:
>>>> On Thu, Mar 19, 2026 at 05:30:48PM +0200, Abel Vesa wrote:
>>>>> On CRD, the keyboard, trackpad and touchscreen are connected over I2C
>>>>> and all share a 3.3V regulator.
>>>>>
>>>>> So describe the regulator and each input device along with their
>>>>> pinctrl states.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>> ---
>>>>> Changes in v5:
>>>>> - Since this depends on Displat DT patchset and since that one
>>>>>   had to be respun in order to drop the non-merging phy patch
>>>>>   dependency, this one had to be respun as well so that the dependency
>>>>>   tree is correct.

[...]

>>>>> +	ts0_default: ts0-default-state {
>>>>> +		int-n-pins {
>>>>> +			pins = "gpio51";
>>>>
>>>> What was the sorting order here? I assume you had one.
>>>
>>> The way I see it, it should be based on state subnode name.
>>> Which currently it is.
>>>
>>> Do you suggest some other sorting order though ?
>>>
>>> Thanks for reviewing!
>>
>> Then ts0-default-state > pcie0
> 
> Oh, right. Will fix that.

+Krzysztof dts-coding-style should clarify this

(pin state subnode sorting, IMO it would make sense to have
both top-level and the child nodes sorted by the pinidx but I don't
really care that much)

Konrad
