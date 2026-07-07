Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922933FB7F6
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432034; cv=none; b=a8LJACNS31t1nBDKx52ykdLNLf9yNWIZvoIyi11+FtwzIpUHiVZngkOG4gz9PJzxkj4nCkszBKhYOhJ5dk28KdSFZzhHe7QwGsEKgACAAyg43DKO3eNYNh1sAnMSc0KHB+HkkuPOi78dxZVMTGUjAABW1UyLgpA++7ooH4fBWaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432034; c=relaxed/simple;
	bh=bENWIoUDmb+p3ApVBhAj+ipAHOlaLeCOdg1Ywad5Xuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruDs+bqPAVE4d+ikGoBE9lo2XqqAdPWIeUkgmTGl/QQOUQ8OaQQXxRmH98XeH748SXVgBVABerfoDUPoUN3IRY3jl+42sT7Zzl1tppOnHXLs7LfkAqArW9en5C9kRJA7xHLZ3GLv7VIyjQ0yZrG8PvWmMdgPLdhUxShbLaT8ccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/BS5pSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2hlP6X3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/BS5pSA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2hlP6X3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8fhT3616564
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyqAei8u+t7l/e/rvtU8ZVllDYwd5+yugM7bTcE/irY=; b=N/BS5pSAK22IBIPR
	C7q8d4MPC6CupunpWede6AWAyvgf3jJfvxsuLdOoqZuhTw7ITo0iveWUP7L5U0S2
	TMQ3sTEwFtG+Tt7oNXCKnhszvPMY8orddr/sMLvSCrCC5cvbVMihZJSBJD/NhaPM
	px1VLvSP36vpimk3cG9J5y57XFI7WDeCm6DFS29gURmNw1Gm6izCYFQdBVDbNyCm
	vX5i497hU+zCAzIKG9HGuU6oKc9YoFBptFDU3cATN81vhOJUjv1J0gDSa8rDfI0t
	k94NwFNi2Pw1CRJ7y6EjFbnNvAIHNBcL8xIIUcV/Km3bRJ8zIzn/orwX1/wfuyy4
	33sV8w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun1ht2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:47:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07f25de2so29366141cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783432032; x=1784036832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PyqAei8u+t7l/e/rvtU8ZVllDYwd5+yugM7bTcE/irY=;
        b=Y2hlP6X3cmx0N1aOfoGs6SZS2GgS9ghA/DCowKa6a5bGxdvJ0t+2oCq4bI+FL68Hz4
         VPf3FRISudZb5wJLid3/tIOnEBBd2VupcCqUhSp5xOqBzNhMXjvRWWxawIld5lmFHoyC
         fFCVXPzX36V2e0hEazOrfxW9BDfsBbiUf9j75PDZniqFMJhwJ7i0Ucx8gDPq/iEGZYHN
         Z1jr1BizVGvWKA4/UpMbygC2UiFlzxmJ7f5R4v7f09RirqvMC5Ro5KYy1qBBrK/BuCZt
         pSpSIgiKlPisJIwLWBhjgWwcxN8PYPE8LaSK77bRLLMglR3iKMhlz0trcrjxdps+AegT
         VtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432032; x=1784036832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyqAei8u+t7l/e/rvtU8ZVllDYwd5+yugM7bTcE/irY=;
        b=sksIYPNi8V1TKZ/HEQUo8Ow4rY6Wp7JdcHIXmUSjk58/bWPhAySo2UvcDNqET3sIn4
         4eLGohoN9N4RbQKs/ZOZk3RiU6XvnwymI/1af/o8JWg/Fcbhc6rvSg0C+l26f3PhHHIh
         VLzWy1FECztJN+6315KqqZevOu+fwOUQGal8IHLHP5os+cH1g1nbJ7XXJxxFt+3fBxZO
         NOUetltlySRdBA60WESMFtVh02HvB+CIuH3K9DpK4ahnUP9PokSGqE8s3niaG5qXRsDF
         pECw8HqUO9phZfmDpuTSfdL/Nn/TbKYlwQFgGoyzZolPDc/+N0cCZoGVj+rgM6XnwwJU
         axtw==
X-Forwarded-Encrypted: i=1; AHgh+RppmFyvcNoNdS1WuPgebC0Zn7mLXmG5XEUdm1VGcBwhQdr87aBqsHtU/FurqOHm2gQ7pClMEXtVEv+n@vger.kernel.org
X-Gm-Message-State: AOJu0YwAxI8SjmnzbOmEvvN7AI3L+pIZsxfYWn54WhIV4WHLLGOVNLk/
	2zaOmluE+QjjUSSqZEX8ta0AMZwrOaz+zEya2jFdPjb9DPicLrjDoh1i8w1b9GjChnE0WEZ+ZaE
	LN2q+YGwNN57tJd6o/NO58NRxHPwfIM6tSNz7JvtYpRUI6GAc6trmoi+6xM9XSl6V
X-Gm-Gg: AfdE7clRqjW49QU/rUfE57MZK30QcdTZ0xn6o8KW0wUS7jZkwDHDhQ73V8aLNkH5o9g
	Lb3qbUGP7zqOzq0laN+VPZ8WSCl+pVgtlaQ7SzN0qouWgzqOTbbCUYP+fdCgo92muNAydBrwa2x
	ShibGbjmaZoxR5mBSl5GUSDYKaDcQRZcStE9BwfUYO0EIHgMROd6Nf8e3AY8XtH5O62AcW8UvLd
	WuWqeGsWXGi8U86peJpKN3QcH7TCHcaTw1/mdEaE+7DlFO8zFuyglrzmMXsLMXuqUccclcRgdmU
	9nnS6UNKpddWmMzlxNzoX/f244TB0YdKiV5iIqreljbVoOp4V45Qq46K8+wVWG6LNeYN4J2sTBr
	JOWkb/JlSNHPyOig+fMevSPR+JzGnOsVhcrBAnxMMRMzWOL3ykFknP+w2sRoZ+52VR6quDRrfVT
	b5y7soG5s=
X-Received: by 2002:a05:622a:2516:b0:51c:c37:df31 with SMTP id d75a77b69052e-51c747780eemr58798631cf.7.1783432031379;
        Tue, 07 Jul 2026 06:47:11 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:51c:c37:df31 with SMTP id d75a77b69052e-51c747780eemr58798071cf.7.1783432030794;
        Tue, 07 Jul 2026 06:47:10 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daafe2sm5659651a12.25.2026.07.07.06.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:47:09 -0700 (PDT)
Message-ID: <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:47:07 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNCBTYWx0ZWRfX9qwUe53vOFs5
 zf6aC2Y/s560PO8pmiBdcvGeF8C2gwNiCjcpn89Ov5+CcqQPSNXK181RADiMn04AteaMyAXcV1w
 oL4FIJABrGt0RHFpNvRcKNZI9Fa6W4M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNCBTYWx0ZWRfX9AaHXiyow4i/
 Vj8KEtlp7qXadM7youhlezDDkEzOFnNAZKspMlyQFsCxN6wA3CqyLSbz1dqudu5A8WecOLw8ojt
 x4oiHI5FSIl1stpVCPEzPU9GAIOVP7JXTHKy1DaNywIbFRC7kcAV0Ik/awGxagp7lzyQQdqRC1d
 NYNCaNQjscAAEHYev95htSX5sDMJIfY/pI9dykVnFMzazRN4gX6cM6UzB8Gfhpot/CKeXt7YpmN
 s/YRyjFfiujf3Xcwj2CLMP1PkChFYWbKi9hXNVpXalCO8letmKWLcNBpVVSYOn5il73M+qL2FKT
 ze8InQ49SZkg9X6IK3IVxIaSDWEcK/nDj5asH3VI4zcAmZgkzKjlZSpjFzcEvK1dLYr5dZhOe94
 HSANjDgtFIYCtdq7JtFXwamibPF/dEt6F5mfSr1X7P++y3DsqauqV4E5KPvNbM4ETIYyJrm0RhN
 upyBYQn2c7KiuZ0+QRQ==
X-Proofpoint-GUID: XReaDpxn82aKcn0B4dQcdsHV4bcx2u7X
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d0360 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=FYVyraQ01RCAgbHwNcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: XReaDpxn82aKcn0B4dQcdsHV4bcx2u7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070134

Hi Dmitry,

On 7/7/2026 4:32 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Vlad,
>>
>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>> <snip>
>>>>
>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>> QCOM_ICC_TAG_ALWAYS
>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>> QCOM_ICC_TAG_ALWAYS>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>> QCOM_ICC_TAG_ALWAYS
>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>> QCOM_ICC_TAG_ALWAYS>;
>>>> +            interconnect-names = "cpu-cfg",
>>>> +                                 "hf-mnoc",
>>>> +                                 "sf-mnoc";
>>>
>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>> position about the need to remove all "CAMSS bus" specific resources from
>>> the device node, they are found and should be allocated on parent's side.
>>
>> The interconnect has functionality to handle bw requests from different
>> clients.
>>
>> Yes the best will be to have camss interconnect, so jpeg and other hw's to
>> vote
>>
>> on that (actually it is possible in icc framework) but what is the benefit
>> of moving
>>
>> those to camss? Is it not better to create camss icc. I understand
> 
> Please fix your email client and stop inserting extra empty lines.
Apologies for that. Some Thunderbird settings were missing on my side, i hope now is fine...> 
>>
>> you want them to be on parent side. But how to vote on bw? Most of the time
>> it
> 
> If the driver actually votes on those, I think, it should be fine. This
> patchset seemed to add bandwidth voting, but then it dropped all the
> votes in the last commit.
> 
>>
>> depends on the jpeg encoder configuration based on resolution format etc. to
>> set properly average bw.
>>
>> So i dont see how that can be done with not explicit dependency on jpeg with
>> camss and some exported
>>
>> API's which we discussed with Bryan they are preferable.
> 
> Interconnects should be fine to be referenced here. Especially, if JPEG
> has its own port to those busses (hint, commit message).
> 
> As I wrote, I see a bigger issue with the clocks. You need to have some
> API to vote on them (and then let camss driver aggregate those votes in
> a platform-specific manner).
Can we use icc-clk framework to vote on them. I think even today there may be some issues in camss
for the clock voting.

Regards,
~Gjorgji

