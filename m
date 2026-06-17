Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54834ADD9D
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 16:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713955; cv=none; b=OW4NDhW4zLU8quaxbHXfbYgGIJJuz3ZdTVMXdMGFXx9kBqgCxzT3Gk994PSXcQmUFRL5cAs8LMlWczLtt0tvHgBfiPvyPgSISLZqRrYOYyA6+Mzz+4rTuCcZfC86+zl6jnHSDGdVd6yJC3PwqBarT8Fr26E9fd5fceEvZ0tO5Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713955; c=relaxed/simple;
	bh=jz8icgNkivpi3ZbOutI3ya4laMkl7WzQNxajxvR72zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFKZeubUccnLM3FUiFXr77/ktirhXT7/puKYKhytB/fn0r+vF7eORBHL5z8f26Pjq92aMuhdulW9kqa0JEvBrqoSxOaasRoIW9pDA8sAgN27e6INAWoaRO91x8Am/mDc55joMCiWMquPtyZl2n6bCbY8pWZssPEwSloh9DGtJtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVpm4RLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnLmbcOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVpm4RLh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnLmbcOd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFohqO2731411
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 16:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=; b=FVpm4RLhwTJ5UyC7
	B6ZGjcXa2vAgMJ+e8iK7oJvmAAqYMj/eZMOaamwFRLMl12N5FkOXZvFP4Mlp1Ajy
	x6bwywCR6e810IfnJeqOF/JG4xSZErFagttXbb78rHgDxQQIag9OmUmlk1YrlXYP
	kvPzr17u2GI0bNWkxo/Sd+lSoyF5Wy0f4QmLN7kXlraJ8weXLfKW0ZG4dbTi5QCw
	Khy2/MkzufgcxzYGeE/fkpjvVsoexrFnwKkauDqwx1sOJLiOL2jtXApBr08HgoL6
	Lysw52Cz5XlOJ8GxYoaLIvslQKM+HmuRqp/nviqEEHzfcIgyxJ4BTvNZBbJS0f7F
	QZ2D+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2c8cyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 16:32:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2b64850easo279005ad.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781713948; x=1782318748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=;
        b=jnLmbcOd6xg+FONfUf56m9L0Y+3N0hVZmXhbJzYgzcgi5dyAs4C5Y69uEScDJyknCO
         qRCfmij6qIu8t7Wui+iWDJfe/A3VOqjRgOEIMy4kecaeBDjmvphGvp3EwAEYuPkdriEX
         TgCWUC72f5Q4NS9Q/VfRdziQqdWEoK8dZZk0MRHwn0FJ9sUWyIEkmanPFsxRSAGZ2jzm
         uGZqHb04BV38bBpibPajeMvKJQhcGs1mlB3UeqieHPQ+19VNzhkbp5f3fBpju8EvT3G6
         uXZ0jkwzYbH7siw4SQz7HdZpBOXQMWRWz18DybBTxhxf4aRZ/g9RzC/tFaUswDy6vLDs
         utdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713948; x=1782318748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=;
        b=jCrqqghh19MNobBMEUJgJgqrW2XnoD4btYFUQkKOADr099UIrC3KJzJJMgk37o5AXN
         f8VVqewur4EpB/iNfgGLD0MdhX0k9QgyeeSlb+TK6AhcdxuZVPGki2T96z4MNmpuvPIb
         I5VpYlNcW7xk7A8z3xuTBbxSJMsJGAW3wWTfAE7xHVm51FNsb89QcOyYkjq8R7JZF9eH
         TS5WPrI/l910fU+uh/BJesvKw4UtQ7rR507yg67jjThPTOEUj5l4pmkBt4/1zdhJY+/x
         2tdAgoFzDrqFwHxjonybsSO5EUKB8rQvQfY4xEu/mIWVHCJ9sWTdA6bM27nTdMiMZKVo
         1idA==
X-Forwarded-Encrypted: i=1; AFNElJ+HN+JHivaZsKsqcQIkq8SoQQQA656qaXlqlU17qswL1Ib+VFS3lbM6tvdYUggUVXV/DWsgP6IWiYBi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6AthQKqS9COH+qZ0bKinyxIkdHw7Un7nYugKKG/tOmr5ySun1
	6hj1Um9UTkkQ+q/P93p+57+GGHyRumJOllzENmdnhEkZyJJhfZKDLvxhIgVt7a12MFhPE+B81/o
	JG8RQYGjPsD3hXI78Q7cKVVYsmp0VDE+vAa8rK3NJWWJDF7siBsN5LKh7/4/aV5YN
X-Gm-Gg: AfdE7cmpsLO/jcb39GTUZsad6tnA9dIMrk6QHjgZjAx7WPgQHGjZ/1o8vDW9+Ijet3m
	nsOglTLkJdSLtpizGwic8O8cDG7mKnNt0Nr79Kjql8t5S3SIssiunKIV3MHL+zRjypSpFiF9BT9
	brsmVz+DwoH48kwIXbIVKoLzVD90bwLiRgd2qH3ZxBgN6LKMBoFZPDeW/dtu+JlnfXjrdH6wUGO
	OGfTnsVOKCsoHFICCQe+sIG6JpZv/m7pBpQKVoSKDvqEAIzn2fRm9EfRiS1DOngq3KMfKnYITRT
	Tz8bMliW+/9eMWPPoZbQ+GbWBx6wrIwamX/sGaKRj6hGt6gMApSngzG8llVZAU0radqQ6z5cu5+
	OAUPOpiDcRSalVVQvh6/XL0OLmjEHlnLmZgNEGec=
X-Received: by 2002:a17:903:3806:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c6bc09a06dmr48129555ad.2.1781713947975;
        Wed, 17 Jun 2026 09:32:27 -0700 (PDT)
X-Received: by 2002:a17:903:3806:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c6bc09a06dmr48129125ad.2.1781713947448;
        Wed, 17 Jun 2026 09:32:27 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6d637caccsm7991475ad.20.2026.06.17.09.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:32:27 -0700 (PDT)
Message-ID: <984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 22:02:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
 <2i6yzwu2yk5bngq723g75yeqzeg4ihvtbuydzunceltl526tjp@vnt6nmxxkfut>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <2i6yzwu2yk5bngq723g75yeqzeg4ihvtbuydzunceltl526tjp@vnt6nmxxkfut>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1OCBTYWx0ZWRfX3vEY5uRPdgmH
 un8aq1gTKZlr2krnsvVkeXpGyLvT2AxwdWmcDPKmuBvjNXyvBsIV/ADoX9ipa92/znyxUg8tA1K
 SDWc27SMuDKnBYpBjYia3Ym+yLUvuFE6f0T4OY6fp7ugiquFvLSr69/FcDP9zbPIIYdEiUUWPda
 r1Pw+q7Uejr0nfOb5UoxTJy2ygRFEJ79GwMLCfzBEXvz6xnUNK0WwLzTxORSU5wTiH2wfummljG
 1CRJTy1PeR61Jc+ZTaGNAA563afrdTNgje4vDQOAdJ86rthk8bRJVvARV8Jl8PVl0ac3mvXwqKZ
 keBKUhg/o5m1F0bs6ppsvFDk6Ygg7/7yyARHMfF1SxZK4KjR8hs7vh/HNeZr/nMnC5dBR04lrIW
 Hf+ZTU5DADqyQpXkZqPyS8nYWfGo2oCFM9TWQk+q8f9ZqMrO3IxIyvQF0Gt0Xy0QlV+07qrFVq1
 RRDrxev6Ez+jhyAiZxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1OCBTYWx0ZWRfXwvZLGSD05sJ2
 K8Yafe80EF8rw1OycJI9jx1+WgIbBUV4bkOsE5cBelnsCx8/OBe32ZNDpKWyf2vQI7omcuK1YEU
 2z0SINecCzlxMs1tHjITRxgDYlXKISE=
X-Proofpoint-GUID: 6m32H19MsHzwoqwVFbv8lqdL_E7LezzA
X-Proofpoint-ORIG-GUID: 6m32H19MsHzwoqwVFbv8lqdL_E7LezzA
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a32cc1c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XunzQJBhBzqSrgwI8wIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170158



On 6/16/2026 5:52 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 06:55:45PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>> On some SoCs the SMMU registers require an active interconnect
>>>> bandwidth vote to be accessible. While other clients typically
>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>> vote, causing intermittent register access failures.
>>>>
>>>> Add support for an optional interconnect path to the arm-smmu
>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>> is acquired from DT if present and ignored otherwise.
>>>>
>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>> during probe and runtime resume, and released during runtime
>>>> suspend and on error paths.
>>>>
>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>> expected to have an active vote whenever the adreno_smmu block is
>>>> powered on. In most common use cases, this requirement is implicitly
>>>> satisfied because other GPU-related clients (for example, the GMU
>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>
>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>> vote is missing, it can lead to the observed failures. Because of the
>>>> precise ordering involved, this scenario is difficult to reproduce
>>>> consistently.
>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> @@ -53,6 +53,11 @@
>>>>    #define MSI_IOVA_BASE			0x8000000
>>>>    #define MSI_IOVA_LENGTH			0x100000
>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>> +#define ARM_SMMU_ICC_AVG_BW		0
>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
>>>
>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>
>>>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>>>> +
>>>>    static int force_stage;
>>>>    module_param(force_stage, int, S_IRUGO);
>>>>    MODULE_PARM_DESC(force_stage,
>>>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>>>    	}
>>>>    }
>>>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>>>> +{
>>>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>>>
>>> Is there always only one bus / path in question?
>>>
>>
>> <Apologies, missed to respond to this query>
>> Yes for TCU, it needs to only have a vote on GEM_NOC interconnect
>> while accessing the DDR in downstream path (client->TCU->DDR), which we are
>> addressing here.
>> Hence it's only one icc path in question here.
> 
> Again, you are describing Qualcomm platform, while the code part is
> generic.
> 

ah yes, single icc path is specific to Qualcomm platforms as of now.

As per my assumption, it's possible for other vendors/ARM-SMMU users to
have one or more than one icc path to reach DDR in downstream flow
(similar to clocks).

I will revisit the logic for icc_voting to check for possibility on
additional icc path as well, so the generic code can cater to other arm-
smmu users.

Thanks & regards,
Bibek

> 

