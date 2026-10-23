Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792731618;
	b=adLE8DF2MrXp6wOQjRmgUd/ve8WJ+oKPbBlj+L02zMGKieP+km6JhhEJFc6YR5GoR2Kj
	 xD0JuzktRJnDoAM2opYMF22ZlDYiscaThSbycYqaFywjvmTvg2XWj6DJqxYJj8O4w98e0
	 uS8yx2meej0fDDQ7+O6XU4vyu7ISsMV79PqPKcQM1hqkMuVnCvJJzwiVBx6obdWXupxkU
	 MiLzjDs7D5fmRs8rLUTIzzbZwgE/ov41tl9xWTS+oMBxPLUFqPdDWwqxENBBcwgb/099d
	 +/RuIgQ9iDh6rqhbAHPQ4ehyf8KA/Mdokjy9ATbmw+CVmfRx94ZI7JNe5f4b1uJsl9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792731618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=48o9pIGMif+MOoQsgOXtT6/HKvjb6VduMw+EEFpg0Ss=;
	b=Rp2/vYAcW59kZrnbUBQXZhPtjBetupZz0Le1JgbQfYFuyr4vi7o/M5KixrfB8nJWB3KS
	 /iwtAutm4Bxgwlnvg8lNZ6O3SwZFatuF7SEWMUVfCvSZyK2YtRfGcuswVrpeKWShVFXTs
	 xmyXuLU6V7uVpSR5RSQzP6MMultBxXlTFJsKMM7LRD8o/9/s6yi64Z1bo3xgjHPRk2EhW
	 5EUy8JHMRB71QZqV2j0qXAPX/ItHHGFlXIY5ONBWZd2SrYaTWreirO/wRD9lsQ9XmWHeP
	 12UaObWUP2YJ2XWGyQyjqBEBeTjFl4kluGHN/p7okKCJwCYxlvY7brNcz+9O3n0n33Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqnAFMhU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMVFyDkm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68815606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68815606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqnAFMhU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMVFyDkm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F39N2376527
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48o9pIGMif+MOoQsgOXtT6/HKvjb6VduMw+EEFpg0Ss=; b=ZqnAFMhUL639prXJ
	AFUyRo9A/qnlUDIDdc08gL49dCT8mQKZcFF4+7obha0FpLFJGxvtsWd0R4zwcar2
	fEehpoDRx72Vygo9WrOCWnmMnZc/L68MdvBYAkPE8xU0oMPMuYiez32A6LQD+6pz
	Vvrndou9C1TryOoisaQTSDz4iULwfgLZthWLLLyfhirvl4+uWrWCtlUg9RFyqshb
	MkfrouU7NjICttP/4uSKwDbUY9SL7Cl+TpFlzwiFbfHnaYqX1XXSZH+c5Weg7tGx
	vjag/yw6Yaf3dPk5KoaBvxn1vFyIzGDp6+U9YCK5P0kjkp/3i043AryiTlzWHma9
	TvhxqQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmr9xrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:00:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2208902eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 22:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792731616; x=1793336416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48o9pIGMif+MOoQsgOXtT6/HKvjb6VduMw+EEFpg0Ss=;
        b=jMVFyDkmdZmsjJ7VxhjVSInQ7ucFRihCQ5pzzt0sgppMtYfTtc/8f1ANF6iXqhiQ8n
         dABiqJn6xU9FgtrosIslv1tYngFm7/KjavlOPcBiF5lzyfSahzZOJe8ahIw4zOgpCrPR
         b/mtAJcLbz4EGAcmpcx04c16ZvFh9H4ovr30dQYUP4ivTiJmwME3MY1wyqCYw/4/TFEA
         w60dInKumaQa0MtpNPl7tYeBS1J0tbJiVL0qDhA/dFll0j3b2k7NwMN5CUO26vyrONVG
         Bu9chs3p0uj+9hGg0fs/oAXGFELrz5nEtYatgo8DYrxJMpJt5fLHzjbVDlJwMEwKJIgK
         LIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792731616; x=1793336416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48o9pIGMif+MOoQsgOXtT6/HKvjb6VduMw+EEFpg0Ss=;
        b=nxrSaWwmVIriVDWxWgNQxVdCnvEci5KEnaG6odK+onA05+R5SCIGrvKtjrGj5Lzni4
         vYvoiTjHcK9Ivvy/f2iZXacg+m23TPciiBqdVRlRXMX7XD+Nmc9uFevuvHJzs93ejWVw
         v2FgnGNeaq+hNhC0o1cZZWG4zybAqNNzU7GfUCT/EE0wMOcjFGsBmYb57IEh3Z9VdL5/
         QxwJlG7pxP+Jybm6x8pbxXXNHvk678G0eSMEYkmTG+Q89zFn/C48G0yoATJiZZdxY96G
         4v5mn4RnTmvEZ2CKXzGX/u/VHVdRGunWBMKqJj0nRiux5tjSK8pNe5rAexYf/jF7JnCz
         ODyA==
X-Forwarded-Encrypted: i=1; AKwUvBybWhmJ0IXEu3yrQMeOt4N4xHx5ajvQFunFt8yIkutubGF1PvumCnT8w7nM6ak0DELiX0pjtdSdF4wf@vger.kernel.org
X-Gm-Message-State: AFq9FYKlyP20aSaJHVN9G98I7n35lle2Ko5GG7+hQ+FBUmaBZNg7pwDT
	neQOVuljrRSDojLXfC/pJyqa4ipx6D/8nXkZY/dXuMv6nSAcoyHk3RXtF0xo4CY+tEWOI/fKtU9
	GMgAUkinbWsx6D1R8nBlOmiPaYVGqvs1RocDaA0jMOFNT+KI4RoaAf7rR1QwMWgw9
X-Gm-Gg: AYBFou0ILpzWcHbZWZ/5OZoWAyDyZiL3M6PNASIOosl24WfsXqOs4HZDZnhRvudTwUe
	jpqDOYVS/skLKPscBjsl1idxXePYTOrxC7bJg2Dg0CWPMrI+DKJlfiq/mNBKHfiBp+/YRz3ykIO
	mdRb0Ok+C1eHPkGd2RW5PMiniWA/iiZCXljcCDAKFB4mB+Ted0sBhKhl5PmbGSlPr2VApoWWHdO
	avQVGfRhApuZ/uErfu1zqp19MXbJm3EOApe7V3JnKPJQ9rnjIxSit/Wzb9eb7YzkSntsvHlf2Sb
	bUaPdcrGN3JoPCznRJku/5SZyfdm1vcwZLpThVW4LAjN+pGxVkZUqi6miQRx2MzKU81vrCGxsxY
	PA/5jSjLnr12AA2ndMToUceN5eq7W7ArC
X-Received: by 2002:a05:701b:4281:10b0:166:862b:9bcc with SMTP id a92af1059eb24-1959f7008c1mr2088471c88.18.1792731615320;
        Thu, 22 Oct 2026 22:00:15 -0700 (PDT)
X-Received: by 2002:a05:701b:4281:10b0:166:862b:9bcc with SMTP id a92af1059eb24-1959f7008c1mr2088417c88.18.1792731614509;
        Thu, 22 Oct 2026 22:00:14 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm5490322c88.19.2026.10.22.22.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 22:00:13 -0700 (PDT)
Message-ID: <d223ee9f-b262-408a-a201-8b16d310bbe0@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:30:09 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, media-ci@linuxtv.org, conor+dt@kernel.org,
        robh@kernel.org, devicetree@vger.kernel.org
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
 <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
 <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
 <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
 <CAO9ioeX4gEA2OGokP0sDqHJZ-WpNyhpLqw_ziyrzHu3wn5Ps+Q@mail.gmail.com>
 <hwzpthdqen2uvwnw6fnrutxjovf4lah4jr3vfjyrojwfhkfv4l@f6hlhnu7a72f>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <hwzpthdqen2uvwnw6fnrutxjovf4lah4jr3vfjyrojwfhkfv4l@f6hlhnu7a72f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 380BA3O56B0FzJ46fV_3pkB2OLvKSbI9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxOSBTYWx0ZWRfXwmmNY1cwizlJ
 8iWTh3t7DHAoDWfQ+e8Gcw7ShzWmH4mfUU47SDVYvdrz3xRtHwDq4S7fsEHcDwWWFpfvAVtq0CZ
 0cRejS3oy7rjSMVhmmn98YgtUkIU7SM=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adae9e0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=H7Zjl3+OYEgA4r5vDjEDjA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NO2DZg4SmkS95zNR1TIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxOSBTYWx0ZWRfXxpP2YCmXh5Qm
 1keYL0FCOzuuhZw7MON9qXqhVHMw2u6zoglxwu9WTEaEhw+0ECSbXMJt8kry1yHDvWu9ACYsX/w
 otK+9wy7jEBNOoGTO2jb/aXfnzbkMzdwIk0jMw5Z7StnhCrfOHQb9/vdAYvjcjTheoQh1Gjub4o
 qwe8L41zq0/6T324atqnIn1sSaZqSyTpg6hoXwx83MLU+66/35EbKra5G65PinVgJYxlWKsSkQU
 a8HUtafOViTYekt4ubuxg/apBXzMZdfjC2l+XbhN6JaUtMmwneMKC0Y2FuKPBlaSO5P9Kf87JnP
 fo4Xi8SHOGCDL8WKc2cCyN5xrZ500Ue98dg+KG1aRI1rjacz9gOT5vAfZ+Roo4MAto+s2kV4xwh
 nigduZA4y3OHGz3T5hrC062yrC2pYRUQHAeyblGYfopQTSMVqNRH7WmTpaNzSpTmQ8TTe2e66dX
 gG3L8jUWAsyt+qzScxA==
X-Proofpoint-ORIG-GUID: 380BA3O56B0FzJ46fV_3pkB2OLvKSbI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230019


On 10/22/2026 3:37 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 09, 2026 at 09:40:31PM +0200, Dmitry Baryshkov wrote:
>> On Fri, 9 Oct 2026 at 12:41, Vishnu Reddy
>> <busanna.reddy@oss.qualcomm.com> wrote:
>>>
>>>
>>> On 10/8/2026 3:30 PM, Dmitry Baryshkov wrote:
>>>> On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
>>>>>
>>>>> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
>>>>>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>>>>>> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
>>>>>> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
>>>>>> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
>>>>>> --
>>>>>>
>>>>>> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
>>>>>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>>
>>>>>> iommu: of_iommu: Add support for "iommu-ranges" on a device node
>>>>>>
>>>>>> Add support for "iommu-ranges" on device nodes to specify usable IOVA
>>>>>> ranges directly when there is no backing "reg". Introduce logic to derive
>>>>>> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
>>>>>> to be paired with a "reg" property.
>>>>>>
>>>>>> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>>>>>>
>>>>>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>>>>>>> index a18bb60f6f3df..9766a6944d0e1 100644
>>>>>>> --- a/drivers/iommu/of_iommu.c
>>>>>>> +++ b/drivers/iommu/of_iommu.c
>>>>>> [ ... ]
>>>>>>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
>>>>>>> +{
>>>>>> [ ... ]
>>>>>>> +  maps = of_get_property(dev->of_node, "iommu-ranges", &size);
>>>>>>> +  if (!maps)
>>>>>>> +          return;
>>>>>>> +
>>>>>>> +  end = maps + size / sizeof(__be32);
>>>>>>> +
>>>>>>> +  while (maps < end) {
>>>>>>> +          phys_addr_t iova, iova_end;
>>>>>>> +          size_t length;
>>>>>>> +
>>>>>>> +          maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
>>>>>> [Severity: Medium]
>>>>>> Could this result in an out-of-bounds read if the "iommu-ranges" property is
>>>>>> malformed?
>>>>>>
>>>>>> The loop condition checks `maps < end`, but of_translate_dma_region()
>>>>>> implicitly reads `na + ns` cells from the maps array.
>>>>>>
>>>>>> Does this loop need to ensure there are at least `na + ns` cells remaining
>>>>>> before calling the translation function to prevent reading past the buffer?
>>>>>>
>>>>> This function intention is not to validate the address and size cells here and
>>>>> it's not valid to read those properties here. If the out of bound ranges are
>>>>> there, then it's part of dtc checks that dt node contains invalid ranges.
>>>>>
>>>>>> [ ... ]
>>>>>>> +  list_for_each_entry_safe(pos, next_range, &ranges, node) {
>>>>>>> +          if (pos->start > next) {
>>>>>>> +                  region = iommu_alloc_resv_region(next, pos->start - next, prot,
>>>>>>> +                                                   IOMMU_RESV_RESERVED, GFP_KERNEL);
>>>>>> [Severity: High]
>>>>>> Can the length argument overflow on 32-bit systems?
>>>>>>
>>>>>> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
>>>>>> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
>>>>>> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
>>>>>>
>>>>>> Will this truncation result in a reservation of at most 4GB, leaving the
>>>>>> IOVA address space above that unprotected?
>>>>>>
>>>>>> [ ... ]
>>>>>>> +  region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
>>>>>>> +                                   prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
>>>>>> [Severity: High]
>>>>>> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
>>>>>> to its lower 32 bits on 32-bit systems?
>>>>>>
>>>>>> If the remaining address space exceeds 4GB, this truncation could leave high
>>>>>> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
>>>>>> IOVAs.
>>>>>>
>>>>> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
>>>>> set the dma_limit max range in that case.
>>>> As this is generic code, could you please adapt the code to work
>>>> correctly on LPAE systems?
>>>
>>> This is no different than the existing logic where client tries to reserve
>>> greater than 32bit length on the 32bit LPAE platforms.
>>>
>>> I'm not convinced why sashiko claims this is introduced in this patch.
>>
>> Because you are adding the line.
> 
> So, is there anything to be addressed? If there is an issue in the
> current code, please fix it too instead of just pointing to it.
> 

Yes, its an issue with the existing api "iommu_alloc_resv_region", so 
moving it, does not make it a new issue. Nevertheless, i plan to fix it.

I was looking for review comments from maintainer of this module, it 
would have been nice to get their comment/suggestion to move forward in 
this patch.

Regards,
Vikash

