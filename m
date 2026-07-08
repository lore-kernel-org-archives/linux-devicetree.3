Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE76D3148D9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503146; cv=none; b=I+nraGCdLECnTuH5gcN7eK4ZG2JHPC1P/B9arvO/K6hq2tGqnDa8/YjsdERunBfHs2fXF7gYLm7JbymlGfSDPhwDTc4zSjeisGjsDlU74xoFwaJm/zL/Chg2d+e6rHejVCzwWhvRZlf24g5tjGoUOqw1U4rccQStEhGoqukddMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503146; c=relaxed/simple;
	bh=HpvpQU54Un1Qaf41SoPs991kafvyRNbO+FyHycN/Xcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPocAMO6hF7vmGPYI0k/nyU0Cnw0KsBrXaXFeufly3iU98M+OORlLRVaZuEeGBUF+IoUlWZuFklTo3GRfXL/t2pxgsLQTskl0TeGUQ9J0OVzC4W012LbcIKE8VHoBzZxXvM7onXzE1KLl2wNFLhW06beP5XTNQJ+872hIDhZlhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2hn9CrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IftStQ3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2hn9CrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IftStQ3+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888v4U2205068
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 09:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50cC+lOjwWBBzURdhgiGe83iDGJQETCnagLzadfseh4=; b=K2hn9CrKuH4OIFYN
	Pw2po+0uWxDCmtVqJ6dRlKCw00jCXJKDE9Dhl7X4sAO0jXOf7xYAm7RBkNKp5pYJ
	tltOANfZcoccFJN06FbE8AwEtiEzao3LrV7l5a/Rqn7b4XjgNyqz6zAfse+IZV3C
	nqWyDygB3bJxdAp5J7xHX3LiXINDa1PKy67WE3cNyFgqXmzVCiFRiOnsFiIHKGHf
	yIT7QLvISSINSYnKo6o137426tvANHwNoyJOBq7TLMk+iDCaBcmExkuujBPdjwpZ
	6U8KkPniPm/TKDcMDSFbSscaNOOpsFypFSuJVinoYsieFYq85WdqPKHVYWSXoGJi
	4VXxDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv0n2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:32:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0408254aso18382221cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783503141; x=1784107941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50cC+lOjwWBBzURdhgiGe83iDGJQETCnagLzadfseh4=;
        b=IftStQ3+yoD+rlRMn598ZDbe8qaNTs2npF2C+yV4tOt1S9ipaHqASOVhj1SF0sHM37
         QF8xUy5QuxsMqzaw+a9Q/xBC/6qrJYg7E8cNL8njcZstTg8s7iQEadS94V3LXtDFsg22
         UONN0hTV5xS+nAa2zqYopPeYXO8j+sOSOi12wHcuNoyEu/57fDr99cR6Vbwx0VhsuxM/
         DGqjvqqAbjCTuG+Ll7JbdEIKfs7n7hSU/zVFiEjw4/kLTwRA19UYWKomxKYN7gLgfhRP
         GVPpfc+s/sO+7aSUiSEPxmO8xfhfcOJzRQG4Z6U/11I6K05m2TsUQ/h+5sMxnhw4ZtEj
         xvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783503141; x=1784107941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50cC+lOjwWBBzURdhgiGe83iDGJQETCnagLzadfseh4=;
        b=Qi8J9VVm+E5yVfaDmPiJf6Ht5gCJL+Wq9VN9cJOI0e3suUwCfKl3yIAzH/l+UkCrG8
         I6DV3pkPkOTSAbqvzuFmzWO9lPrcPxHhKsciZCK2uCqWo4EI/4GrWl5/MaziiFX3Dn5I
         yIOOuEaykX6QxRmOoG4Vbc/5k4nJrnSYH1thcQLsbQE6Q3n7mztyXjCVSa85ahxLmgSQ
         REifF/flwqRPlbUHhWpZsIYBcNFunZ6rU/LFMhKcCPIvGzINvYFHNldz6v2pmn/cXO+i
         l9FFJt4S2s4gxPsblTeTCQXX6vmqikyV2gDUSGbBVPAAkkx3Mv1VAA/pm4AKswUi300O
         8f7g==
X-Forwarded-Encrypted: i=1; AHgh+Rq9awNic65yW4PUhQK023FgnDo2GYmLYfJw8yR0om4ygLTg2Sf0gm6Jfh0A2z6qUPtw8Q0avLBT1XLn@vger.kernel.org
X-Gm-Message-State: AOJu0Yydw1lRDxudsRq+PtWnuoSr9sCk298ZkyOr0PkcvLNA+qpnz+OR
	NyvWafD5rC54UTvhN+cvRgCLprNK3KaV8H95nSBBCwxClj/F9gIG+7uBV9gnKnu+eXxYtCzAaS4
	asm4CNFUBm104QGpClP7x9pWfS8zoIqXfDF0P9Zw9GSvKTxiO60m2rJCJHKCDStkU
X-Gm-Gg: AfdE7cm7OD/IUN9kvJFXbJO9o6/dsXBfvTBEv5w15HgWTdtCYuX/vlg4aOunRGgBkRF
	atxXwQDj6kzbuubsv4mgxvAF5AWQNOqKh7NfGmsFAsCZJttPapeX0VNR4NNe7IFYwetp7SW0+U4
	/JLC4x45afxoWTZdDRDPZxozfKIGwOtQ4gLdK9anqFr3+9tzjQst62NeIFeM/jkfDFAfRS+TV9r
	yZ02SQ/7QHwT4DFoi5ZNMQGvzuEFzhijH19pzbwVRLmDQbII3Iu31zKGGmiG4UNK8MbVPmaKU+n
	mr7Z6XVa1HIuzwUk5ETDTu69P6MZ6sffw84klBn7ffDdBexGps10s3RtPg7ql/7LD8SHlCZqRPB
	vvZR3SJ2EFs5ggDJXGTuZlMWDrB6M8CaFZaV11eNpseX+eAs0elWrx9+vcx/oZnH8X6aNVo6Kfk
	t6MKCyKf3r
X-Received: by 2002:a05:622a:5599:b0:51c:291:82eb with SMTP id d75a77b69052e-51c7a4a9933mr65537731cf.14.1783503140786;
        Wed, 08 Jul 2026 02:32:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5599:b0:51c:291:82eb with SMTP id d75a77b69052e-51c7a4a9933mr65537311cf.14.1783503140245;
        Wed, 08 Jul 2026 02:32:20 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ce1b374asm82248066b.60.2026.07.08.02.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 02:32:19 -0700 (PDT)
Message-ID: <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 12:32:17 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e1925 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=WedJO_QhFF0jeLZjxQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5MSBTYWx0ZWRfX8Ey158QP7gTv
 PCRsUMLUYz/pycYsUAXHrC070g2Lx0J+wQipjtu04+ZA4qIon0N723M2PcOCbRCLo1pmqXfvrcC
 HG7Kl2uNjs5dtwGhYXW0ESTeRqaYYJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5MSBTYWx0ZWRfX65L9veG1ha92
 1A478liiBTZmjnq8TrxhQYbMUBSop0Z0GaJXgg+OT3WtQxF2HSo3FL7YtTgpihZbX9zepK/GGfu
 6kjXwxMMUpCP2pBzxRP/C4XaI8lwPY4/Co608g6gTCa2qM2cbCIXgZWDpnKYMMhgx7mQ6V3h1GR
 vvBm2mo9B2APk1lMG6Q9keHzXsB6V7RUfckmW8v6n9Qc4kdWSXO8sDfSR2n0qXkjPhwuy+/+h4a
 Kv2OdDNENNU8QwmBukSi874EyCmn5pHHEI1b25pvHqorM46mGO4/e/NeT9l2x/fWH/sVyKlpCF2
 iRumEQqPgoonuY6aLfSrq1UY/UJLwbrp4vD25PuvVq0o6PX+yrNaFmH4kPBsznb+rtIx1nXt0rL
 fZd0A5Ooe3qImz5ev/Ugp7kSRQXtwqpm4sGZvPHfVi1eb/3htqsvUkJjkdQ6aYID1uvc8XsM7BB
 ozJBWkSt3rSwsdINb+w==
X-Proofpoint-ORIG-GUID: VbcR_eHUksNR52dinrEiQqGG6peJXVEq
X-Proofpoint-GUID: VbcR_eHUksNR52dinrEiQqGG6peJXVEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080091

Hi Vlad,

On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
> Hi Gjorgji.
> 
> On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
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
>> Yes the best will be to have camss interconnect, so jpeg and other hw's
>> to vote
>>
>> on that (actually it is possible in icc framework) but what is the
>> benefit of moving
>>
>> those to camss? Is it not better to create camss icc. I understand
>> you want them to be on parent side. But how to vote on bw? Most of the
>> time it
> 
> Let's concentrate on hardware bindings description, no APIs, votes etc.
> at this point of discussion.
I agree but there should be an API for icc voting which Jpeg need to use,
currently it is fixed to some values, but voting need to become dynamic
at some point of time, because it depends on runtime parameters, resolution
format etc.> 
> There is SM8250 CAMSS device, which serves as a hierarchical parent (or
> could be considered as a "bus" device) to this new JPEG encoder device
> and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
> get hardware descriptions as children device tree nodes of CAMSS parent
> device tree node naturally.
I agree the device tree is best to represent real hw topology. > 
> Copying of the same identical information about clocks, interconnects
> and power domains from the hierarchical parent device to children devices
> is not needed, and practically it only lowers signal-to-noise ratio.
Here also i tend to agree.> 
> Since information about the actual defect in hardware description is
> reported, the problem can and should be avoided, the handling of a better
> hardware description and dealing with any kind of complexity will be done
> in the CAMSS and/or CAMSS children drivers.
> 
> If you need to get a bit more formal point of view on the matter, I'd
> prefer to see descriptions of hardware properties organised in a tree
> topology rather than in the originally proposed star topology. By doing
> it the system complexity is reduced from N to 1.

Maybe I'm missing the whole picture of your proposal, but I want to add my
point of view on this matter.

The JPEG encoder HW block has no dependency on the other processing HW
blocks in the camera subsystem

It shares resources like camnoc, clocks, GDSC, etc.,
but does not share anything with the other HW processing blocks. For me, 
the JPEG driver should not have SW architectural dependencies on CAMSS.

The shared resources within the camera subsystem are reference-counted,
the only exception is clock rates, which are set based on the last set_rate
call — but I think that could be handled by migrating the clocks to be
represented as an icc-clk provider, to keep the higher clock and maintain
the needed policy.

What I think would be best (just a proposal) is to introduce a new camera-icc
provider that handles all these resources — camera operates on bandwidth
anyway, and rate calculations should be done in icc, since the  infrastructure
for that already exists in the icc framework. But I think this has already been
discussed with Atanas, so maybe there's no need to go over it again.

I'm not sure how to move forward with the JPEG encoder changes.

I see two different proposals:
1. Independent sub-nodes (Bryan's direction) — I honestly like this one more.
2. CAMSS handling the resources currently managed by the other frameworks.
There are good arguments for this too.

Bryan, as maintainer, can you say which direction to post next? :-)

Apart from t


Regards,
~Gjorgji
