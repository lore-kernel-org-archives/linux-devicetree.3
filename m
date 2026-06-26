Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA13B6370
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473150; cv=none; b=dctIjQuiepWEf26WvnfVIAb6YmT17xo1UYO9iE5hubr0THVnVx9PpEVmQDoeDODJTazkeHjllQXVDv32lZHF76rDuOAOn3ovWdACylW0h2ygCyWee173o6ycCsm4F3h8bwtU7qga3c1XDpkuJekWfRu7/cHuu5RAX95C9PUGr9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473150; c=relaxed/simple;
	bh=ht/Pf4XLV9dCsPC42qhVTYRywrk/rJ1Q+lPS/ZazSqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmzc3yk4Ur97S9yJUZ1NFKzGGXl0rZZ4KCzBs8zWduCPK5rsScw4a5/Z3gnvRzT7Ww7G5U+rzJodbvoqWg9P4xTvrzOhwGvalWABN2LCvv/CycOHIcTu48oViVamZbYHOwbsuojDner6TvANKrWjkEu9RfVDo9CbQfqKjJOgYQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxse7MpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBqH89t5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxse7MpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBqH89t5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcomJ3384293
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=; b=nxse7MpIWKwRS9Kq
	PzD23s235gtdv3TG4eC6YWz3k2Ihyta9XyWxIpJx0isDek4tTXfSirVc8FPCDjcB
	jX6CLqpCq3/OD/riyHZxJTUhQRDQ4sP5bC1lFI8zSjM3jhhxXBMFgq1rh4gdITVK
	j9KncVe/esV8QZcP679zaL3TW5K8JtvDPLTdY77yHkkhmWaKEbEnCeSJMoD6xpV4
	Xoon2A/LR+Vl1J4usG6/b7oyWWkAXb5rRTaCrzaI96OMu5cv6ureohlVfE88jZUa
	tBw2AERzFTOTifvxtrmbSZCoiGqnXtqcsdAIIZGasRE8Xx9zFzJg+Ips8o+76E8B
	jdZcaw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f19m3uf4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:25:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ca3374c6aso888417eec.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473148; x=1783077948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=;
        b=PBqH89t5mAaJnSG12AgCHS/vz+RSmSZ8GIHE+2KJfdUxfrpz/OEDAs7GR93cguubbx
         R0llbcbqisPd3XPblyyr8gv+gHM9c0hjIXiqzpXkS38aOnQzTPSO7WP4o02xqyNsYRQd
         looZ67L/HDRoh1pdVhdz9xNfxaT0anovj3JSKaE/hjkD1G7hqRREH14wYlb0JAXcdqaB
         cbhh2iQks9LsQjwOzaUHquziNelIXGi7kLax8/3K8TQSTE2k5UJyX9CHIlNbZiyRWVLa
         xsmpMQJOSAjaie4FdKBGG+OpMHJtYb4ImKIN8OgjmXAaZSm8s/FI4hz6KtUAoedSOswS
         oSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473148; x=1783077948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=;
        b=Z4x+uPNEfRBTb/LAt8Q6+nV1uIUrhuZR4eTHN815kY4+TMLC0nbqwNZQ7Cs+VWxe8m
         CSutmKPLReRGLo7eiE2OQKo8X6/5DXXjQaEqXifp7AuAHdhy0Gc85EKVf7nafuGdBQfL
         60jrO2ZdMv/lCIsMvdr3L7fGiJMBFSbbLYbT2wQP4PIRfZ6yuKU5r4sTkdBD7yKA9vIl
         YnJKQfeJaeKia1+M+eXdby6BDxT6KptkKKoFOkBut2K9ICBa9px692nk2gHVxbBbOedO
         7Rg1/y/Qy/7+T6+TDCfPXHTIHuM5z1UX1vZ5dwLXGSeZhao7bw1ycr/yLKtZwEkiha0o
         iJvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtTdazJ7HW3xmr3mUJSQWIFZmPTrln7FW5g7eXgZdyS+ZStrq3tr52IVCJdFplHvYn7PCoxiWb/51K@vger.kernel.org
X-Gm-Message-State: AOJu0YwvnVzlwG3CST6n6zS8eC34tubeSfbmbXkvqbhx9CRTtwhX6X17
	zX9HWsMNjNA1T1rHx85zERvS/HPz/1OU7f+r/DgQMKs73sQPM8yh3h3/6bDObZr1WQf8driBsYr
	F38IVDptn0M5Oo92017J4JWBDNNhLmvoPgbSaZ3zCPMf/JB0h5MMGUro+F3anMwZy
X-Gm-Gg: AfdE7ckN7eYqmeRpub1dyUZuZFCOHyR464bsyQKamPA84oAkKmlgQ1hAlwtdOWz4kON
	5Ytd/yq2b6iluMyCoqOIvfwwKvo/hVr6531RaQPIKfn1eIV+tEWHP3Yb8VqgLnno+u1XYHTjNjR
	kx9H+ds/sKj/HMMB2Wy3JeG/a4DlYhYLmPYdjX8mJ0HHaqwB+0nuYET683u/HqFhe0IApaLf563
	RlvBmCtBNfQFENmRupfnMYsFrYG2on5VArOWM6y7gvuNctjNIsiEDo4CSXndGKYJdk51MlgIKxk
	qmzcWku15jWW5GMW+uLVZRGo/19c0WPStM8pWO08yY7NfZLB8VxVrq9e6XG9u/MtmJYHD5jJdAp
	Ks13KkOgszjUN7UZ+LUt+5t7M1bbL72ScuMts4g==
X-Received: by 2002:a05:7300:fd07:b0:30b:d31f:1577 with SMTP id 5a478bee46e88-30c84e596bemr7352330eec.34.1782473147712;
        Fri, 26 Jun 2026 04:25:47 -0700 (PDT)
X-Received: by 2002:a05:7300:fd07:b0:30b:d31f:1577 with SMTP id 5a478bee46e88-30c84e596bemr7352290eec.34.1782473147186;
        Fri, 26 Jun 2026 04:25:47 -0700 (PDT)
Received: from [10.219.56.41] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6d2e4sm17343537c88.7.2026.06.26.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:25:46 -0700 (PDT)
Message-ID: <abfc0099-be71-4e4c-abe4-e8341a06f15a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 16:55:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
 <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
 <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
 <aaf4daee-4886-4214-a761-80545d2565ee@oss.qualcomm.com>
 <4f0878a0-2ab1-490d-b251-c6d68c4ee241@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <4f0878a0-2ab1-490d-b251-c6d68c4ee241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfXwCeu6R0K2T2T
 wW5emf8yuR+CsYVtubOn9qtA6o7NHC10gZh5KEy+3Tey7CU/xCM/8D0FlYAf8SX7sZvxNGrddRi
 ojeTbz3DejFAkC7QD/b6EAN7H1XU0G4=
X-Proofpoint-GUID: Cc9w5Dr4HxROCK_17QOOIz4bFV6O1zJX
X-Proofpoint-ORIG-GUID: Cc9w5Dr4HxROCK_17QOOIz4bFV6O1zJX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX3Yp5V4sH96Bi
 g6B0ld+RCEDe0nHuOg3Ol1qr+lJ8cewIAPjhKh/zFIvj96BtfhQEfcJRvKKy6k+RMbw/HqLVvGb
 qcbRFHxZwrpZlSC/Vx5aV6Wu+piIxBSqJMyRGc98zTrStDdWg8mn1zdj1LdMlUC1CfYezptePgw
 s3JUBhb9RBGgfKppwoX7C7ImyCB1mifwu/QI91WhNx86biwgWdDubsdRwmm0tLHZIYZryuxZuY3
 gpMqFuhFkygesGRiib+7G6UiSy/BadFnZwFOgvwF+gUjvkUz+UU5JImStC12nQVvlspTR1hn9Yb
 V8WtvdIQIUZiQyUlg8jAOowjgh7YP9o+P+gZKccAn+oj3fBeKT8c5addrzDmfIgJfuj8Qp4NbYF
 8WUvS81SdH+ohRkdyC9VzMs0JMR94UYqBKQy9QwdKt0GQ2Ai1kZ809XRjlh4Oyr/43eP3gAMOLA
 bW50uQC6NNtndXo1mgw==
X-Authority-Analysis: v=2.4 cv=Vv0Txe2n c=1 sm=1 tr=0 ts=6a3e61bc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j3I-O8hsx3pVybSV4xQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260092



On 6/25/2026 2:17 PM, Konrad Dybcio wrote:
> On 6/19/26 12:54 PM, Bibek Kumar Patro wrote:
>>
>>
>> On 6/18/2026 2:58 PM, Konrad Dybcio wrote:
>>> On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>>>>
>>>>>>
>>>>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>>>>> bandwidth vote to be accessible. While other clients typically
>>>>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>>>>> vote, causing intermittent register access failures.
>>>>>>>>
>>>>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>>>>> is acquired from DT if present and ignored otherwise.
>>>>>>>>
>>>>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>>>>> during probe and runtime resume, and released during runtime
>>>>>>>> suspend and on error paths.
>>>>>>>>
>>>>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>>>>
>>>>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>>>>> consistently.
>>>>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>>>>
>>>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>>>>      2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>>> @@ -53,6 +53,11 @@
>>>>>>>>      #define MSI_IOVA_BASE            0x8000000
>>>>>>>>      #define MSI_IOVA_LENGTH            0x100000
>>>>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>>>>
>>>>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>>>>
>>>>>>
>>>>>> Ideally, any non-zero value would be enough to keep the path active.
>>>>>
>>>>> This is true for Qualcomm devices. However, you are adding this to a
>>>>> generic code.
>>>>>
>>>>>> Here 1 Would be enough to keep the path active, but might be too small to
>>>>>> reliably keep the bus active.
>>>>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>>>>> power penalty.
>>>>>>
>>>>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>>>>
>>>>>> seems to be suitable here to reliably keep the bus active by BCM
>>>>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>>>>
>>>>>> LMK, if you feel otherwise.
>>>>>
>>>>> Shift it to the qcom instance or provide platform-specific values? (My
>>>>> preference would be towards the first solution).
>>>>>
>>>>
>>>>
>>>> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
>>>>
>>>> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
>>>
>>> (you used decimal 1000)
>>>
>>
>> It's my bad, i meant 1000 only
>> (I'll check on the icc_bw calculation to get clarity on the values)
>>
>>>> can evaluate if this could be moved to a Qualcomm-specific
>>>> implementation.
>>>
>>> Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
>>> the QC driver
>>>
>>
>> Just curious, wouldn't this apply for all the arm-smmu users in addition to Qualcomm devices as i mentioned here [1].
>> Vendor hook would make it Qualcomm specific.
> 
> You're proposing to use a Qualcomm-specific bandwidth value so that
> fits
> 

Got it, It seems valid. Will be sharing the new implementation post
testing in next revision.

Thanks & regards,
Bibek

> Konrad
> 
>>
>> [1]: https://lore.kernel.org/all/984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com/
>>
>> Thanks & regards,
>> Bibek
>>
>>> Konrad
>>

