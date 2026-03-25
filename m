Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C23CE49A
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437653; cv=none; b=dlrWovttgjmLJxjY+9qCyAEwt6Hm5UEBpRIbe8PqwNzj5dFeYFI85U7yIx3Ybf2x4oAYrNZXpELCynibJ3tUY8agBhO4RLsrMxjdQR40b0OFn6obkp91yYuBokcd0J48piwgOnmT3C7CB1VQzqMfv09ci0m0R49FLk+cVyH0hIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437653; c=relaxed/simple;
	bh=MqqPvaCpMUSdpy8bJlGFo4cZtQj3//vtqXYIJw14Cu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2jFMHMkjJ77Fp/RErHoKBnsIPDkV4AmF2/uN/XOzfJu21GZPrGogb1cmBtjRbvY8zXX+MymiNxoLtcF38woe/U+gusl6Rm66kj3yd2jQ1V8Ck8iTS5Y4ci3Ctf955Ny1JZnamHvdpSZcxUYslBER+AVrZO9XCHBg+qFh90WMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NuHgc/e0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtIbaArs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuHgc/e0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtIbaArs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGoL3244759
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bo04PPluhNxDs3dNvQUl61WfLNkmR2AQ12kwe+gKE2I=; b=NuHgc/e0oACN8Kv3
	HaamJVnrePiqyFWpPCM7S/36+EvAJ1V+MLo3P8Y6ftuaOUcKoD90YGH7aOK4m7VB
	PlW560yrTGKGmSfZia1KW4RhFlCOCOfY+mCytKYUVmLGOPQWdjpj6xi/ta6CGGAA
	Phw2ZlCVZ5srV6VngfQ9mtu3Z2MdELY9W7fx8zL+r1XQUqthusks2V23C9bvIK+k
	zkXhG98nUgVWuoLLYFkThTN8V9hXg49em9Y6gQ/7Vk1rXxu6of27JsNVaz2p+Gu4
	SVph1uJsyyU8H/hdoshAK9SpINESeog4xmgsBcTXZDrRL3n6fvkuCtTXQ/505Pdi
	CCsn1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp0fww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:20:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a04e9d4faso46150306d6.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437650; x=1775042450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bo04PPluhNxDs3dNvQUl61WfLNkmR2AQ12kwe+gKE2I=;
        b=OtIbaArsM5sak/2moIaFT7xckJXWN8057ZxWzODOGBwe2UDTouaHBwa0FCFXcqAz93
         x1QggfK5pHK1qiZUeYsscWxyM7s1zLiMks5Y7yqSA/5AXKygur26LZrRIZXTEWevvbtE
         46tbvrSydRsfuHnkt9yyKxwoA4iHcY/HSvMBFHwKSZnSEpXpyC5FJGcjB6sLbsH7oChZ
         uF3ftOCpmVZ/hpghpr+8FteMiiF90xQ4vfe09Bl4H4FsUxwnAA5hI9rSUS7XCPrrzoPL
         zbx7I7iz784LP44xVUzVD5w+u5oL155CqnCoZqmsisvV2obbGb4zE/jdR1f9wpeghI4H
         DzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437650; x=1775042450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bo04PPluhNxDs3dNvQUl61WfLNkmR2AQ12kwe+gKE2I=;
        b=AtwqSQusrj0Nr0Uh/4mv6G9NNTXSNDXpGB60fhiusoQMTz1iRAR+wPBqjv1hj5n73k
         1OLiq7C8SpRhBxpnGVqEP8vkFfgPjtpY6Y12eNmjDudtInuqwhkBKkDkppt5Vb8LL6uX
         BHEyKraxolNuYi0RxvqR/MR9P+GjVPJ46QjGnmTPH6aHRAmU2A/2xkSKhcvITbp4m+aG
         +pUkNY8egGmAMZ9lvLbDeQS8da51ZzznYN/Ad08BgvtyDipQI1imuvkEhItn/QjBJVB5
         AjN2wcnrH1YP0Xkvia66/vLmPrOEtCFJPVhWsueTcwPAxvgstkiON6VAxqnxlisxXALR
         v7rg==
X-Forwarded-Encrypted: i=1; AJvYcCWQNJmwq/uYmcF708kDqNLaG0m9Ul5n3T2/T4UggbebDGayAhrP8ejJjJOYe1d0FSmXeLa1PdDUg5vl@vger.kernel.org
X-Gm-Message-State: AOJu0Yymj6Vmi7PsI/U930j1HQ8NxT/AQfKrI6+LvjUyIKfZUGbyQUDC
	aQKIITURyjWdxv/F8phK4jV3FDYBCrYWkfewCUUO9HISbNLRMwmBj14Oa1799eQhhm4fQno4gIo
	WZPxak44ay59AmVnFL5FgtGUqORFV3DNylBoCAl0kPjVvmDqwB8A9VhKHxcycBNvp
X-Gm-Gg: ATEYQzxlH0HVaBLccdeOFK4JN5bv8I4DUqZ808gY0+92XuMCWFQ/eFunWR6Jyj4E0SV
	jFNxXF52nxgPmIk6K4lgo0FLGrOwof6wEZytUI5/1lcJ72bxfdOdwjFD0iTy5qFPVQ5xEqOSdap
	7bpS7uJ2Gsoqjtla1HARN6s7U5gb64fOVR+kc9TH3lXDFuan9C3WxEuGRL+qeUmN/0MdC/d8cEq
	wwLT1gcrpOJfBm5qKsETH2t3woE6slXyX6YU7bkMqsFPolozG2xgoSUsoC0PTtQDaZ6n10wYLqo
	mEYNUVonwnhbz9Hfd9tj1RtKDBjoCsGmfA0z3ojYRs8YWdEF77ELweTB+wOQBO3Q1oWwGTDqYdb
	eOuB7cxRldIH6igY/1JcZsUjHEK6/PKEHsId3szp6ANdgkHQjL877/9PgxUT5nnLq8ZBgKiQ21m
	SNeDg=
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr30820801cf.3.1774437650209;
        Wed, 25 Mar 2026 04:20:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr30820571cf.3.1774437649651;
        Wed, 25 Mar 2026 04:20:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de177sm773644666b.29.2026.03.25.04.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:20:47 -0700 (PDT)
Message-ID: <a0da2236-27b3-4491-862a-457a03cb4c5e@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:20:45 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: David Heidelberg <david@ixit.cz>, Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        oe-linux-nfc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
 <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
 <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1zc-ttOoXnJQVp6zjqzA3G1K1UEW_zsJ
X-Proofpoint-GUID: 1zc-ttOoXnJQVp6zjqzA3G1K1UEW_zsJ
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c3c513 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=uWvuUna9Uad_Tg1iXS4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MCBTYWx0ZWRfXzfyZX+Yd0ibI
 Mg2cjQ4V48Us4Otkm6i5kuMWViQE8579whPztHorCoqP2D98dJtZKT8/K8H4T9/jjRJy6vyUoYD
 uwmL05MzrtVc90OGOuEOtPmfS/5k6tPg8EhUjnMdDXLQoPbbEOZim5d8wWcatEncxXgPHcAwi/j
 nG8ruiiWyDySbJja0w94e/hPm0Sbf4bLgydT5j5kiOMS3u6J6nNFMTgwEMPBF0etkUE+uC9xNjz
 jBPqWtRV2gY9EDswwGxCZHHfqjix7pG6G+BDOz3o3mHyvCtEqF0tQy3MA1aoaSbxrimKaQREA8B
 WZ3UigMXc1N64ppAeGNdBCA4Ru1g6ZFu6lSKUX2o8IW0iQqximjg8Mi3IvjKYmlI4a2T47YjnXc
 yAXBMys+qZKzc/XeU70kpSggycoVpl7WXYM1479o7mQpfBFPsAcsvRO79xRt2Z6s/EMTNjkdi2F
 xXfWNXcYOMjVcjKO0Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250080

On 3/24/26 7:08 PM, David Heidelberg wrote:
> 
> 
> On 24/03/2026 14:12, Konrad Dybcio wrote:
>> On 3/24/26 12:20 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Definition of the NFC.
>>
>> "meh" commit message
>>
>> [...]
>>
>>> +    nfc_enable_default: nfc-enable-default-state {
>>> +        pins = "gpio12", "gpio62";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-up;
>>
>> Are you sure about pulling up an active-high pin?
> 
> I'm not sure, but downstream does it (and "works for me"). Maybe Alexander would know more details here.

Would changing it to bias-disable also "work for you"?

> 
> David
> 
>>
>> FWIW TLMM subnodes are best sorted by pin index (although the file
>> currently doesn't really do that) as per dts coding style
> 
> I assume when I group the -pins into -state it doesn't apply anymore? As I don't feel having pins relevant to one device / subsystem all over the place is extra clean.

Krzysztof?

Konrad
