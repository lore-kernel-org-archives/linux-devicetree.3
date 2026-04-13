Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE13750A2
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080320; cv=none; b=HsipmC6C1jaoPoEV2vGoj1O9WXdUm4yy6+qNU0tooafr5MBpEYyIQu+eDJV1Zu3lAtbg/73ZdiZ+w0G1mFKcmKq3CXcIdCbdgmXad3aBvnU0DsHkKXCPupqHrZBIOZFtc7hKEfRRWzWBEuzhrapSfkQFwKw6wmzQsLb42N+z7mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080320; c=relaxed/simple;
	bh=7W6MSgWhGfD8fh2T7+UUk80DgPmihpwqFYTbo/YqoB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCaQWf4Hihf18qxLgmZNRnwm5TLPaPrHHNdKA2oBdxslRBjCgK45ukI9Or5qrdW1bHlkWCogh1Qbpco20Awqlroc9pNt+0IPybuld+cMXaFCCm3nVXZ3h5BqwutOOx6h3Db36y+4oNKMJ2Q3luSs5dZI73gvAQu5a+1QNxuPsas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPsh2Mik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMbJOIEB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPsh2Mik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMbJOIEB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DAUvgK2230079
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FLUwNxPPV1WHcjiM2D0JqM0+q0C6n1u4Eg1Oz3/FUg=; b=hPsh2MikAnB728Nz
	1ldogOOgLuJaSLmLGUguMyn209PVBPXYIkB2HQK2WCMJuswDSCNEgw3+sc0ifdb+
	g/jzhZlqqvYLAMZRNFAi1tt9/SM8dDvCWp9dUipod3eppm9rFDLhgBVLkRaVUO5h
	u3I3YdUDf8SdY41uKNioEuVLMaIKlIPEitfw3i2ZL07rUFwpKlA262zZsdlV5BjJ
	j6qd9puv/C0zvXcdx2zK5vO4lAbgitxhw4ms4W8FtVwnp/bp7EvAHFvZ9HZB1OED
	4oZE7sMzky2eNPZCav7PMwxGvPUqUCiBZwNweRnTALMSNJlSYN4geeEidIUDjiG8
	uZKoKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt606sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:38:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso40744511cf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080317; x=1776685117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3FLUwNxPPV1WHcjiM2D0JqM0+q0C6n1u4Eg1Oz3/FUg=;
        b=HMbJOIEBfurULvrPdliDhjGy/Z1oYkXKVzdaccH4dTt/ZNQTKzEfEpKdcPpA9zi8Fz
         Ni93Gc5BnTJ8NP/NP1gnJmOS8RRPyo900lXowQuC4T/S3vuDr3TXTn12MKf8Z23NYJHW
         IHvgkJ3ibv95dn616rT9E+wXS6NB2gihcrzKHojYsmDUJDEDoyToHE7bO+9JtJhBdlif
         NIWhYz4i+9exfjk6swtJ6J3fk0P4eBdM4xKeTE++uSGVUFvrYmfnwpbvy5F3EBJDCnvP
         t/RpJJBUIrxMsEVkUkLnERpUCS886VVFjteOK74YEnP+jg7ctQOUoeeRXQKd58I3yFJH
         cGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080317; x=1776685117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FLUwNxPPV1WHcjiM2D0JqM0+q0C6n1u4Eg1Oz3/FUg=;
        b=j4Hau5aeVs9HkP5RzaEd5vj3fexIE3WgOyDN5yCzvnNWa3ZlCAE9XWczMmWZ0zCqLN
         a+QzwIxlfxeVOGZ4A9uq44qqTcEL7Mkj+BYtkbRlMCBfneqVrs7NLljwtlT/MXFHpqCR
         a46br0+hovblA7kYq6zhjUlB1ltAOMnm3AlmO7/bE+ikihKxnlDPhkl5vPfPoPZPUNxF
         VGO0YlB7F3avBu++TgfgNA7IebrdnyVWdttF9yWWMs0mY6EcKoX9jh5aOe5IhXCZMoKQ
         yZX84sBXpE9uVd1CUFOToXBv6xzI+0PHCHb4yllYe31Sd+toq3uQt9jMpXufWmaIgG9G
         teLA==
X-Forwarded-Encrypted: i=1; AFNElJ/fJ9WXoj1a10hrPhnRJW/VX/asDvWYJOGV/WVXLH3g03Jo//mRPOWTtlxUsYzrNFQP4GVmtmCJR2dS@vger.kernel.org
X-Gm-Message-State: AOJu0YyoPAwhxlDD+S4/lFWTSaxetSthXm/6At65vLVB6S7d6vJ5BomP
	emuozD8Nnh1gO+fsf6B1axgYBbkEPW+HOqLecdgAFEw5uw5FB1Sf1IKnWLQyN5Fu9bCGrXigXZ0
	/GZ2bhyRS3e8MdEoRjX7Dpfmonq0jj2PJqjHToBV/E06lTUkSZnx0qAyp2RWLs6BZ
X-Gm-Gg: AeBDietOaot7YQvX6g5e/9s2DFtXzxrnetEYQLmnyn6f9Nfx+sTRtLYrpB1d1npLA9E
	t9PX0Thhn0UQdFcuP9iqMqlHSmPB3Sjfn9GWCnyz6tDwHWanuSVqN0OBUygiprBSri6mMPkHZ1k
	r46iwInMp9wAaAwJ7DTjLMgSsnSSSWq0a/mFTpWnPBpvCRLGAGNNL72EfJim8V9L3uquF9bTIQL
	Iqgv7HM7B7GB+Vu90FMUCoZdm4RURmgMpB2wuLcxaMXdyNchFjrUbJxfIeUnNkD9lKalNwXbxW6
	F4q1iFOOt2mgEUtqaq0YIyEP5W24y9N6K8HmclwZqMg7WNjnX0x5AVL8EtiiJegVwaDojHkWOAY
	6zibJiaVRpjWgV8feQ2FhyPf9o3oxtvjM69tidYxYEFYW0iB6MQpAnY8hhSV9tjF5W3g5mDQ5KQ
	MQJjE=
X-Received: by 2002:a05:622a:1393:b0:509:2b5a:808 with SMTP id d75a77b69052e-50dd5a9128bmr144385291cf.2.1776080317456;
        Mon, 13 Apr 2026 04:38:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1393:b0:509:2b5a:808 with SMTP id d75a77b69052e-50dd5a9128bmr144384911cf.2.1776080316816;
        Mon, 13 Apr 2026 04:38:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de9b414sm313460166b.6.2026.04.13.04.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:38:36 -0700 (PDT)
Message-ID: <3f084f3b-861f-4444-805c-ca8b431f6cca@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:38:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
 <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
 <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
 <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
 <cm7cowdic42qziuwpe22b2yuakg2k5lqcdnfs3mspvbvprnbto@6kxucxrbnsc6>
 <e321f7dc-4053-4a4d-a0e3-40c3a8fc0fd8@oss.qualcomm.com>
 <3498c03b-beb4-4235-91c1-c2867ad8c956@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3498c03b-beb4-4235-91c1-c2867ad8c956@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNCBTYWx0ZWRfX4kzTKtkNm5m7
 T7WyMW7bR81ACiHlmJtIsavq+u33N9yDiFKgsxmnqV+cQHAZCQ9vN7hqntZAGu/8yzHwpbqW/hW
 VCl3kDVrrvBBHPKqB4g1Z9+zJS7dSMhc3IacSJUIZ1OoSKqXQ5o3tJInPKTE5qcvdLa3KLnIWx4
 +PPHPRHjEfl/bemjG4UGm6Ikouj+qOCYJ/21UA5i5qYhQBHAc01OzSwdq7sBuPYZs1RZ5ofP6RE
 0q+aTLwsXobbXGxErXSzf7q2S+pG8erPqsf4gE6cw1Dp70itjK1ZJqQBZLyo8tsFYU00dgWd8bO
 OgvExY5o+JgmAJumo9t+X2SF9do2d/nvoCLOr84UIzRTBrXzvKDaAH8sV3aq1Vggseovg3PhxDK
 AEtK/15tD0P+5wGYdu3/xxhjLWJLjIvtpNBijBE+zWdnDdnGgkgLzG+oAWyIU1u2RABjLu/AB4u
 1xsMKuCs6wu2CL8AGqg==
X-Proofpoint-ORIG-GUID: 4YuhIs9ml9USw5-tx-MMe5_W2lNG9RSL
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dcd5be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=Ng2_SAvxuEZwIUAnxNUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-GUID: 4YuhIs9ml9USw5-tx-MMe5_W2lNG9RSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130114

On 4/13/26 12:50 PM, David Heidelberg wrote:
> On 13/04/2026 12:28, Konrad Dybcio wrote:
>> On 4/12/26 2:41 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 10:55:53AM +0200, Konrad Dybcio wrote:
>>>> On 4/9/26 11:24 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Apr 09, 2026 at 10:38:15PM +0200, David Heidelberg wrote:
>>>>>> On 18/02/2026 16:59, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
>>>>>>>>> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
>>>>>>>>>> On 2/18/26 12:18 PM, David Heidelberg wrote:
>>>>>>>>>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
>>>>>>>>>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>>>>>>>>>
>>>>>>>>>>>>> If the OS does not support recovering the state left by the
>>>>>>>>>>>>> bootloader it needs a way to reset display hardware, so that it can
>>>>>>>>>>>>> start from a clean state. Add a reference to the relevant reset.
>>>>>>>>>>>>
>>>>>>>>>>>> This is not the relevant reset
>>>>>>>>>>>>
>>>>>>>>>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
>>>>>>>>>>>
>>>>>>>>>>> Thanks, I prepared the fixes [1].
>>>>>>>>>>>
>>>>>>>>>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
>>>>>>>>>>>
>>>>>>>>>>> David
>>>>>>>>>>>
>>>>>>>>>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
>>>>>>>>>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
>>>>>>>>>>
>>>>>>>>>> Please don't alter the contents of dt-bindings, it really doesn't matter
>>>>>>>>>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
>>>>>>>>>> place
>>>>>>>>>
>>>>>>>>> I dpn't think that will pass. Current reset is defined as RSCC, we can't
>>>>>>>>> change that to CORE behind the scene. I'd prefer David's approach.
>>>>>>>>
>>>>>>>> Back when I replied, David had a patch that removed the current RSCC
>>>>>>>> reset definition in dt-bindings (at index 0) and re-used that index
>>>>>>>> for CORE, putting RSCC at index 1. Perhaps it's better to link to
>>>>>>>> specific commits when making comments, note to self :P
>>>>>>>
>>>>>>> Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
>>>>>>> work.
>>>>>>
>>>>>> So, finally I spent "so much effort" (read throwing it at LLM) looking at:
>>>>>>
>>>>>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>>>>>> iova=0x9d4bb500, fsynr=0x170021, cbfrsynra=0xc88, cb=11
>>>>>> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
>>>>>> arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
>>>>>
>>>>> [...]
>>>>>
>>>>>>
>>>>>> These (or very similar warnings) are around sdm845 definitely 6.19+ /
>>>>>> linux-next kernels for some time, but pretty harmless.
>>>>>>
>>>>>> LLM suggested multiple fixes, but when presenting possibility of
>>>>>> implementing mdss reset it found it as most preferable [1].
>>>>>>
>>>>>> Adding MDSS reset would most likely solve it. It's not critical, but not
>>>>>> nice to see many red lines in the dmesg.
>>>>>>
>>>>>> Is there something I could experiment with to get closer to have proper MDSS reset?
>>>>>
>>>>> I don't have a sensible solution at this point. We tried using the MDSS
>>>>> reset on several SDM845 devices, but they just reset. So... I don't have
>>>>> any possible solution.
>>>>
>>>> The older context talks about altering the existing dt-bindings values
>>>> and now we're at hardware (mis)behaving? What is the issue here?
>>>
>>> The HDK and DB845c reset if I try touching MDSS core reset.
>>
>> And David, does that also happen on your other boards?
> 
> yes, I recall OnePlus 6 or 6T going to crashdump and Pixel 3 crashing too.

I found some older version of the docs for 845.

It says that to pull the BCR, all clocks to MDSS must be off while
the reset is in progress. Maybe that could be a hint (or maybe it's
just broken on 845).

If either of you would be able to catch an actual crashdump and get the
data out of it (via qdl(rs) ramdump tools), we could see what the TZ
says the crash reason is

Konrad
