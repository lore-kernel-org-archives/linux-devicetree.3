Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F71A321F5F
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035675; cv=none; b=P5S8FO6S/9DKp8vTF7Sw3XDnCB9IoSqhPWKT2tfibSDoCiyM0v53ovJY6b7I19vnPH6Kf5sauRPjBdHLpTH2HPfWEZZEt3DwyX8Vq/JJaYcj6Uv1x56zecX7Oaw5yjBLqhnuJQU+8OWrRHjnRzNDYYKMe8oZIDdmC3iFMJdC+zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035675; c=relaxed/simple;
	bh=I2R8ytEugiAGPrNt7U62aL8z9WdGGmhQf4Or51QTpvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+lJubNYOlzVqGrMj7EKVMfDo07AWCn9xJGZrMxtcSE8VtTWAV/6ZzvQk5B7m7AH6negsHWE9fQMtk3Dy9QY08sHWtTXNI7ROxSy7Fn9R1t18eKpLVQTLFq94ehDoBwz67FjC0xBJMZGZro6n7HV2Q0swfe2OAgnL/Ltj1C1APc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKPf/YY5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKVFjsNC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKPf/YY5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKVFjsNC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7ZAlg4167708
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 13:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVxua6OhniN2pNp7NNf6eMLPe0Dqnx/jPe7KCBX+eEU=; b=GKPf/YY54uCJOcEH
	UK7MVwl8orxzMcn99ix8lwLcX6ttfFjUgJKdRImNh3y72eDRKc3COWNT4FmfSedS
	1g6KMZbNd1VLvvRSlnoepxv8/yAEM2Tm6MjuAfSFKyBNy/P6kXUezwbJw4dd2GJ4
	GwgAxC9Nd5WdBmzqiskal6jrelMht+StXQoV6leBuabi7JJsJVzsCg8srfpeaJlt
	gEZIsZIzBxXYC4XEr6XxlTN9N26ei8BIvRYlfM4XTo4vv1wPHL6g3LHPBGfwd/Om
	TYZ50I0JoOugjsPKHMy4AusLVVP5wo7z9gGOLFiJg3Jo2gD6mpzQP5ucmscCU9oV
	Vr08kQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n1g7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 13:01:08 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6961cacdd3aso1767013eaf.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777035667; x=1777640467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVxua6OhniN2pNp7NNf6eMLPe0Dqnx/jPe7KCBX+eEU=;
        b=XKVFjsNCLb8SfvzPSrOTfedFf9tufnZCbjLfsurrY+qHN9lIEHGvMVUMQlu2y+ftJ8
         hnOYs2LyJ0mRaZUqNZxFFRe6ETjkPBYk/9+vRSREQ7NiCSOzU0UCI3Wxzx5q+dA7Rjvs
         GMoCKjAEr3uDPoDN/uDBVbGuNea2lxpjJgZAAEZdI0HnP7ZGI4NlyGdSFdiexPSUczGp
         M1xp7lXmKr4XTh/Il9cIhcgHdX7+diqH1uqyB7bQdfK0lrm+lGP8X0fQToleCC9OOL7J
         Jn7O2KUeylH5PZUd4NRfXYYDWR9FPfHT13TNnJXYSk2bkCnUW4AmSqZ11TQjyCA0TSVb
         rL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035667; x=1777640467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVxua6OhniN2pNp7NNf6eMLPe0Dqnx/jPe7KCBX+eEU=;
        b=Km4tmApxPX0OmamrBH7D2RPauCZRfz1hx3G9ipSlR+j8j4YTXgbtIX0EtofzkzdqSJ
         NByccupv3XF3stTi/LY2OjCeGyXFJEo6u0k+tst1RklRr2pizMZ/+3VoViPl5VILWLWX
         iLyjvvBppuNB+TTxnEGKDYitEIhUy7EdLO93b6JrEhGv2gzpFGhAzJEHwBoZOZ2sj5gm
         b+0CRdihk1eeibHnaTJPRE1EK8FbFYEPhZRg4nsDIkgqrdfxPII0YDwPGcjqrJL8vQsH
         g6rxCbz/uL8QjsJxPsr3uFIU+YiORb8nJHJPO4gZ/o1lMLKkQTtOK0I8v+dZI1IluQ/F
         oVCA==
X-Forwarded-Encrypted: i=1; AFNElJ9Cx6n04d+GXJNICo+HKKTd09Phj9UWyCwl3IF9kSQ2m68v9TgzDDYfyjuTjm31+SyktAeh6M7CcKKO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw08JzSH3TiZHdXqrP3Z+sOVKD29lEanVHONgyuK912geEIxmiV
	gE/jx0lbZQ1DQo6ymls6/ntsEfr0sD+T/+tbK1M0HZqyxPtJZDSXb3s02EefK7fF/rpBE1w29xL
	nW6rVFZ9oM/vsLN8+SjFkFTTHjzd+wg6egRGwGOc/RgF7pKZ/2bmu/uYIt+DL9af3
X-Gm-Gg: AeBDietsk5474UITQVi02bP4Gsw1582IQB52HQ6vcrQy4S7uJoRcQklQo0vYxwmXLwP
	DLjS669ne6Murvvsd5GkPpcFTEC7oIrC+NOLJ3VM+e+RsFK/2fs8yhRHPtL6/qetJ6ODnVbTL5l
	WDkNZ+uknZQWnJum5204gHIc5rXVcmsGe6RC7Sl60oNTOeXX46K2y91kOywjO+zxoy77EETwmwW
	Ts6xolQaNP2E1BKwNDr1CcJ/LxUOFzJK+BRHW4pFUJaV/PNNs1cm9XZG0Z6aTZtfW8Lyu7I1SnM
	d43Mlep2y3p6itZESVXcEqd//HwnCGfxBPJ3eKlOTERtmCwV84QzEBea5SPvhiGMNaA2xq9YYbp
	53DgyAX5lWJWubwVNRXJQGejvYDcxlnmKGZaU7ssS/UpTVmNZ8fgf3MxYFtzaRZD09dQ9KZHHhR
	n59is/MDCCHsUmVq5ibAg=
X-Received: by 2002:a05:6820:81cb:b0:695:818c:e552 with SMTP id 006d021491bc7-695818ce65bmr6590846eaf.55.1777035667267;
        Fri, 24 Apr 2026 06:01:07 -0700 (PDT)
X-Received: by 2002:a05:6820:81cb:b0:695:818c:e552 with SMTP id 006d021491bc7-695818ce65bmr6590794eaf.55.1777035666580;
        Fri, 24 Apr 2026 06:01:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd? ([2a05:6e02:1041:c10:1ab3:98b0:9e96:47bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm57154801f8f.31.2026.04.24.06.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:01:05 -0700 (PDT)
Message-ID: <91219d5a-793c-4145-854d-5a1f8db45daa@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 15:01:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
 <a4f6b7f5-6566-4c73-9c4f-e43c3cafa75a@oss.qualcomm.com>
 <68723e33-53ca-4a66-8777-945cdcfce6fa@oss.qualcomm.com>
 <aetoLNvH5jeK3Cmo@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aetoLNvH5jeK3Cmo@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Q1MBVWJGmQTRGPJNOSYngVUn6_IECq4
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb6994 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SgGMxA1ftVfEYTiVe-wA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: 3Q1MBVWJGmQTRGPJNOSYngVUn6_IECq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEyNSBTYWx0ZWRfXz9wmFf1ApH9r
 OO8+xPEleRUl2MPThfvwBBJuYCvoyFCkDRdpsCgZZGxIVHxUMDTynWrThGGQF+qLhGA3yjJ3LjL
 mhNED4UKo02DAGK+r+S4uAK2b0HdZr0fm0GlooOwc4ht+AO70bDhFmDjXRt+7j3+J8ZcoUfFRyV
 i3cb6SCNqQ/7BpgIDkfhDxDOlOxOEPxe8rcz2Jt9aNYPxXyxt/Tu/InkRESL/CB33StUJ0AsO7N
 lTuK+qKdBye2OnZRAxbZXvX1zcovBqRUlpVMmQFpQ+TK7TW38/44PNNrfILev495h4Q95VmcmTF
 RYXjkZM8NnHNOcdl7Z6bOtQ6dkWpjp6Gd8LmQsEkGJ4iP7vWIoBPP3AhBaDygmob5Q6ebyBtsn5
 6pf6UO/Qlj/afLL6DBdMk/cg2LiEeWnHucvXDO6asUau3aevK+TalhOFVqbaUrM+rG+7o2z0AU1
 WOehn0H1/fRrkrjrfVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240125

On 4/24/26 14:55, Shawn Guo wrote:
> On Fri, Apr 24, 2026 at 02:12:44PM +0200, Daniel Lezcano wrote:
>> On 4/20/26 11:19, Pankaj Patil wrote:
>>> On 4/20/2026 12:24 PM, Shawn Guo wrote:
>>>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>>>
>>>> Add compatible for Temperature Sensor (TSENS) of Nord SoC with
>>>> a fallback on qcom,tsens-v2.
>>>>
>>>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>>
>>> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>
>>>> ---
>>
>> Krzystof,
>>
>> are you ok with this change ?
> 
> Hi Daniel,
> 
> I plan to improve the commit log per Krzystof's comment on another Nord
> binding patch.  Hopefully he will ack the new version.

Ok, thanks
