Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234C9346AD5
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774083612; cv=none; b=egDomW5CkLsZdOUWUHBjzY4lPl5/pEhoYdxLD2QfGlfV/0/2E7mJlleWA1s7OYmXA1WDSu2bOUv3S9Hp1WGS6GH0qDU6wGh3n7Q15sry0J8myySa2HofYHXv+wDXzIzTqS9li+paQM06ZdrsS7JjyfadexIKZvZn44Uaswg/s5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774083612; c=relaxed/simple;
	bh=ylu7NqMDeMx/JHQQFLZXEW4YdEUTwvdchMZ1Oz4UImo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhMfLPLWRT2iJFcHReBHd3GpFKtQ4mEucAW/vHQ9/rFkIUtZfOhmEcS9HiMeXRCbSBjl1r69FvjtCXsRZgMVgj4E9uVSbPvdHZUGmirlmkewv0qbdI5f4MTNtA5+F3iVCIMSJyiUheyxVUE+e4vM/xJSg+OGRxbiAKMmDn5oVMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUdZfbSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0QiCZYO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUdZfbSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0QiCZYO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4ej15579083
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 09:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKA5nf4m4Lv8C6dJv7c3bacMygnhmgc20n1v0daYaPg=; b=gUdZfbSL2Uw0GSWg
	6wBJzA9AJ8PjMWbqmXbmfEUVrFRp4vX/iEYDB/gc1etwyXLMcFoDDrej1H4HTHzj
	R8k3gOjs2f/NUPhiGAD484B0YINg+TXs6SbvLb+muaQMCUaOUbrXaxybzIVkZKHu
	27VMs2cZKsc4b1uwHJ0pAA2j3T7JBi0a4tq28h6W7byZw0QjebZoFR0Rfsl1Gkjp
	6f9svYMpf/zhLGvD29A4vLnTqLDRvcxYvwrvc1fKJ4Lj/MG9Eo2g2B/XCtsBHzsz
	yMZ/nefOpAxLpAhQv4g9ttuLLaHoayPxBrrsV/bn0kI6GP/KooJK1OYLm5cr5T7E
	ntRqSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mgh89n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 09:00:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso163664901cf.1
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774083609; x=1774688409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EKA5nf4m4Lv8C6dJv7c3bacMygnhmgc20n1v0daYaPg=;
        b=T0QiCZYOrCTnqblgwHw68fBCdUuOuXc7RcZpcusUJrVY1AxYFhkbKM+lTUdrHDclIz
         4Dlc9yBFByjDfWmENRDdP5x5mWeV6V95wtFiJ8MPzeFwNVmYcCzawk4Q1XlvuWboQlA1
         pi39pQw/uWQtZ9+CZS/6SJ9sTsoU/8cW8wJIXEoW2WrzTMfkR8qZGCTVM2DgOaFbsDq8
         xgu5Jn/jZJ/+OXDNyqzv19OdDvT0UGfawGHmsJ6LNcUhpptMNDvI2l1d372WZJoUzHiy
         xU7KuY5PwtRYJuy29e/gXoWOO2EJ8zRVg9okYl2su0dbwwNEyGxs9KmIIQjdmTKiCXD1
         aP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774083609; x=1774688409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKA5nf4m4Lv8C6dJv7c3bacMygnhmgc20n1v0daYaPg=;
        b=MCeHMcqPG6CbrVQ/zvSRYPD1C+QHUv59vPs4cL2+7QWw8FED53/HhZRF414nbkbF+B
         uHqrbo/oIkn1iwefwL9sNmBWZrCj4IbFA3y9Qi5mw18G9Yy2AGWP94Fz2UGQXmVidym1
         QlcdozXJda2TiRuo670GPgPYS8cICU2WTazjAvsd4aeBG7t7UeOs0O6wMZW8QRNdME5/
         rRhsnR28vFxdVKsMi9W50VdmmbzNOPBOeerpUj7funmHu36Qro2CB2gn2l92d9QZYu+/
         /2UAYBo4yrt33JsYg+s9KPj1+p2CcBZxpmESTBksrGPf3SuiZ5u6rCmZ9lBheWSfcq/A
         eJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoWC/bLBZQALEINwz4p/NL2w0ubRNsBKwW2CBLqtMAWBwDrxd4V5UdMO25UiPfK+alL5/hRRhpD7w7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw/GpzWoSgKuKZ1SfHPtKcwfQ77YXBthdHV4eQ6mq9t5n8Escd
	xNpO49Cb+pYLQdyGv5Dj1iwTB1e8rNe9DHWBA3QsFSghvPtLeo/m+qR8RVi6AuHkAmo21oErz2Z
	kwsGTnrQ80aVHJLoJrPh02YWG6AIOn8KMrdMrGnaa+TqYpNiDI5L6IAl3rbZxk1X8
X-Gm-Gg: ATEYQzx3bjzqHDwE5o0kV2dvn/C4fGhGukU68shshbQwqS6PTn9dmPW8J0swUcWZA9Y
	z3Ml7F1N26F9UB9TUsptCH9CfOtg2v9+IE5J7bATJLAtVvX2vkPUa76gyGGigI07QFgvvGqbqyJ
	wOUz/yalDMSfXTNJAO34vMYzx5Ygdjn/yrEK3lU1OJGcEP/eVC8VrvjJshj0+GyHJTreErI3w/3
	lYitFJwkQm1uOGYj0jfzi3hvAfHbDnz7LUxOk2c3/Zzju4ns+HzQUAz2fb9PygBhIgql2YJ0C+2
	fuIoCByX2/0S1e1qydRQjD9Z2N6GB6bAo1LmBsLbAONR7A/B4l1MjVGsMFdG9lGBngKWyfUJVii
	e2riGOPIwn3aVkfiNpmQl8NMBxwrhx+ZdfnFG0ODUIFkbvQcV3Mpk0IKomWvUUbtUnE2na5l1UX
	TeD3k24zaQ
X-Received: by 2002:ac8:5a4a:0:b0:509:2d05:6977 with SMTP id d75a77b69052e-50b374359a6mr87068031cf.16.1774083609399;
        Sat, 21 Mar 2026 02:00:09 -0700 (PDT)
X-Received: by 2002:ac8:5a4a:0:b0:509:2d05:6977 with SMTP id d75a77b69052e-50b374359a6mr87067321cf.16.1774083608907;
        Sat, 21 Mar 2026 02:00:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm12446577f8f.19.2026.03.21.02.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:00:08 -0700 (PDT)
Message-ID: <909009ab-53fe-4b20-ad2c-bc8eac9e8bc1@oss.qualcomm.com>
Date: Sat, 21 Mar 2026 10:00:07 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-3-gaurav.kohli@oss.qualcomm.com>
 <20260128-whispering-caracal-of-respect-a26638@quoll>
 <36706481-2549-4716-8e6d-0e4db42591a2@oss.qualcomm.com>
 <546faeda-d896-403c-a449-5c9b0cd7159e@kernel.org>
 <17474333-bb82-49d7-bc04-45ab21095c38@oss.qualcomm.com>
 <ae4c1f7e-8f4c-4ce0-a6b8-bab29984e693@kernel.org>
 <c6136314-5bdf-466b-b19e-43062fb11150@oss.qualcomm.com>
 <e6679f94-2648-4d35-80cf-d3f823f9dad3@kernel.org>
 <4f815a0f-a815-4b77-a4cf-a4b18e776eab@oss.qualcomm.com>
 <95142608-b5b1-43a4-b8b6-38e658275f30@kernel.org>
 <abhgxF1RcAJD-cK9@mai.linaro.org>
 <3922012f-25e6-4b75-9183-f9277ef5d040@oss.qualcomm.com>
 <74f59ef0-ead7-483f-a80e-a3da2f6ebcdb@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <74f59ef0-ead7-483f-a80e-a3da2f6ebcdb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69be5e1a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=FQBcWiJ5rebsmBwV6QgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ZQ29a6jftKk99w0kWI0nm-g-tYJEBnyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA3MiBTYWx0ZWRfXw1yG8Z6/+V3v
 vGoKhdd0G9Ju8UWQyWI9DRYbVKKhuNiLY9ePpDF9+gdROMjdOkfNxLw5f7rY1/aeS3cEAx0VfhO
 TDtmsAUw24OrNNAs3PKzb/ZZ7mTjLc79bcHvxOmggDewXcXDhLHk4UYnA5K1AyPBBWRkYdgu+os
 uNXjnJuxwxTzN+lfv7wfrh5tIBe3qDkeft+EInhQxzCnSVhfSrVqDrx1xdGncyfZ5KRrdE9irGM
 nSRYJr102bdcw/mPC0cl8qvQ9llVAJvr9HW9YynaseL9lGXUJUxE1rugNMbDhgAnLRbGyAqDhLm
 3xIhvNmZG6Ml1hIORpU1irUZ5sZ/kww+XzWy7QQmxFVNXoSL0d7gNkPAMuEUgFJAxq6pMbCBi7m
 J2I4VNyFR0J08M3vouIejd4/U7te5Qebk6MKAH8cEJOVIVRg17EZRVLiVicfKjlKIVRZfj9/68x
 v1CIL4O4nqLhcmvYmyw==
X-Proofpoint-GUID: ZQ29a6jftKk99w0kWI0nm-g-tYJEBnyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210072


Hi Konrad,

On 3/19/26 10:51, Konrad Dybcio wrote:
> On 3/18/26 11:17 AM, Gaurav Kohli wrote:
>>
>>
>> On 3/17/2026 1:27 AM, Daniel Lezcano wrote:
>>> On Tue, Feb 24, 2026 at 01:17:22PM +0100, Krzysztof Kozlowski wrote:
>>>> On 24/02/2026 13:09, Gaurav Kohli wrote:
>>>
>>> [ ... ]
>>>
>>>>>>> As a result, each core requires its own cooling device, which must be
>>>>>>> linked to its TSENS thermal zone. Because of this, we introduced
>>>>>>> multiple child nodes—one for each cooling device.
>>>>>>
>>>>>> So you have one device with cooling cells=1+2, no?
>>>>>>
>>>>>
>>>>> This will be a bigger framework change which is not supported, i can see
>>>>
>>>> I don't think that changing open source frameworks is "not supported". I
>>>> am pretty sure that changing is not only supported, but actually desired.
>>>
>>> Yes, IMO it could make sense. There are the thermal zones with phandle
>>> to a sensor and a sensor id. We can have the same with a phandle to a
>>> cooling device and a cooling device id.
>>>
>>> (... or several ids because the thermal sensor can also have multiple
>>> ids ?)
>>>
>>> May be an array of names corresponding to the TMD names at the 'id'
>>> position ?
>>>
>>
>> I am using dt node like below to use with cooling-cells = <3> approach, will post new patches with that.
>>
>> cdsp_tmd: cdsp-tmd {
>>      compatible = "qcom,qmi-cooling-cdsp";
>>      tmd-names = "cdsp_sw", "cdsp_hw";
>>      #cooling-cells = <3>;
>> };
>>
>> please let me know, if you are expecting something like this only.
> 
> My question about the need of a separate node still remains, i.e.
> why can't this be:
> 
> remoteproc_cdsp: remoteproc@cafebabe {
> 	compatible = "qcom,foo-cdsp"
> 
> 	...
> 
> 	tmd-names = "abc", "xyz";
> 	#cooling-cells = <3>;
> };
> 
> 
> 
> foo-thermal {
> 	cooling-maps {
> 		map0 {
> 			cooling-device = <&remoteproc_cdsp CDSP_COOLING_XYZ
> 					  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> 		};
> 	};
> };
> 
> where you'd presumably call something like qmi_cooling_register(...) from
> the remoteproc driver, making your added code essentially a library, not a
> separate platform device

I'm not sure to get your question. My understanding of the 3 
cooling-cells is exactly what you described. The second argument of the 
cooling-device map is an index corresponding to the id of the TMD. BTW I 
prefer also the compatible name like 'qcom,foo-cdsp'






