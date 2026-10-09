Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4582B4A7C8C
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542507; cv=none; b=UoAaEzVK9av9R6PMFcnF3PG4rub/tZTQDPuEB/ctXBn4Os2blFrYa+8nwJJAhs5NhYlIyAfkUd61+NXiSnmz5v8ENlVNlPohf0scHcC8/gfiyJzFtMJfWrT17j6cGtZEfjpBITzGRyR/kTk7MVBW4atukfxqJyCobGmFTuJzn+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542507; c=relaxed/simple;
	bh=o4u80REzz74dR1Ac9L0xc5dwRRgfLloRu/CR39GaXeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RN/zxMwd6Xbk1X0ZnYGrzpmLq86maRVUsicP0mcJCzx6QYNom2d99DqAYKot+nou5Q89mT5Oc4NmirAzrLvbNfGREDuPVhHuRVAuwFo6LWmipRzZjhCmRM3+cpvSIE0g+IgfYzd0SZSUMlgHPxLCv2GjiCoDzrcxQyBkesIGSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9C0z5Ym; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaHGCRE9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9C0z5Ym";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaHGCRE9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699A4jN21336330
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GJaTtqlmWuMKqarpVsRT90Dd10w/lSHTVlgtT4nt94=; b=Z9C0z5YmhSsXuK+7
	3/lyzOHqCgyElwTp2QoH2jbkvI7pzrMl7XqWmGu3to9+GFEZGpXCg6xkPxkzxwry
	mpxcWKaHNV2XUgq/6fErJVQqLZuR0YFB9GHAaOg4kif9g4hlgROUzegQ6RTYkgFb
	ugRJ68Lxcbvmcpm4sTKT6aMsL5c4w3ciShoLyxCAbgBLe8CbGBRdeJPItzhn+vKw
	yM3QXn63lJXD0Ij7uH4Fjcvm3GeuVCMSJKFrVBRXLH0XigglKsHxlW28XNfD2gtX
	z3XsgVWjWJf7oX8mIAxZp2XwVS5WW/CeCsJCxhgqTN5RsBwjNIKF8odst4XBaVjY
	uowNDg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wg3wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:41:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso12028135eec.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791542503; x=1792147303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GJaTtqlmWuMKqarpVsRT90Dd10w/lSHTVlgtT4nt94=;
        b=UaHGCRE9akErbkrTP/x1n5EtB6KIlB/Y2b8nVzOt/NATUoyWdq8YNOKfX45ZYbv2DD
         tnVqCPuYWjfUxaJeP1aVk4J2zINHCo6i+jYHGPEvYTAAJTLafqqxERIxrYjW1A1yA93c
         GDK6mLUGyUCRiKzXEOKAfo5PE6J51Bb4xFIjrNZQpHR9h7VtSnolvfq1H7/GainAuHme
         NYuQ4XxRIaJNW4j1+GMtlvAFN1pMs0vim29TzrZPj+gukz6rxvSS0xUH8LjkCK1obARZ
         7SO/aT/+lWWOsbJG/TNPZOmLpFzaMzrZB5qLf1CgHznABwPXJRVFKKA8h3yJ2beUa002
         mFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542503; x=1792147303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GJaTtqlmWuMKqarpVsRT90Dd10w/lSHTVlgtT4nt94=;
        b=kEyU303Vvp4N8/ApRtsb6LxPF/sdMZEyqZwVAE+k5G7xwz0VQVs/Io6qhJOCv6sjXb
         q+6Rdhwx7dOPR/bxR6wK8OuJjqxRsE9Lk7DDNSWoaZs6+hmYox5LkU3IC0bCxD0jzy4d
         9uaaQDI3OyMQxKxCnBwQ24iWtoe8WPlTN8nYxMvcm0FwlB/6cskFyonQ5EjoZOfE4nFB
         hqxhVwOiLP4XfDLs1rUZ+3Okk+ceVIIKGUl38616APyuQ7/aOIhQsk4aelGR3F7AacZ4
         b0DMv90HOJsIj/2Iq3bMnvtzi7HOD50IxYPffmaWt8DhCOLaZSdK1yYer5GpTxEXaE4S
         Mu7A==
X-Forwarded-Encrypted: i=1; AKwUvBzOe4aBvwaUzD4vyqbV/IGSGyYC644bMBqF34as8UEAJBimnPRANZZVc/V5oA3H1ni5ic5/3A+8aYD0@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0kWBL0h5Nhwgoae4eq7VcncDaR8v7vhiQgWwVmJMNmY3kRftI
	xB6iZ2avEqFjIGcmOWMgAlBfkVrEeMd8GRMwwW/HJwXfJyf9+h7RvqJl6G3ycqofN6FzIQWDEtc
	FyUfPYvTsc7QYN8szvbtBAhECHDaC5OTYOR6k5HkyrmrFaUhyPNiZuR6JU7ZT8jdy
X-Gm-Gg: AYBFou3D56T2+gRW6smy2SfSC9YVQrLGzUmbDRT2zbMClLD94zUPs6AcEhSUeD6wVP/
	SyoULfdeyNi47ZXa/2iz9GCtBIJxDC013UTHbJMd5LgL40jiw8XdPbk5N9zgMOPKZIKZ1sl3TeF
	lGNRZ9XnECSz3SsVsYh/4r/BpSVAX9cAS2PGv2Ij2gPZSb3ydOaEV94K7sUKfO54lkh2JkwzXpD
	ZUOUTAQUqN+1bHG0rxHYQClDRIyH7ydeE0k+RQklQC0ZeAn/cT2eZA/xCPzAv5C0Bjuy1brLf/D
	kj+y/Y7C7fjNQE54ECdYMKgBhKkIeBaqt5k5oWxo4+C8xzNNRB2tfiXnrkN4ry3g1A4AFsUOmQ+
	ERMzHV3KQF4VILVafeMsdWXGc4jisiGM=
X-Received: by 2002:a05:693c:808c:b0:34b:68eb:fc04 with SMTP id 5a478bee46e88-3537e042973mr2148536eec.11.1791542502890;
        Fri, 09 Oct 2026 03:41:42 -0700 (PDT)
X-Received: by 2002:a05:693c:808c:b0:34b:68eb:fc04 with SMTP id 5a478bee46e88-3537e042973mr2148504eec.11.1791542502241;
        Fri, 09 Oct 2026 03:41:42 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm6031045eec.28.2026.10.09.03.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:41:41 -0700 (PDT)
Message-ID: <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:11:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
 <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
 <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX/gV10tU3UIIr
 YEIMskO45YfyZHRACE6sorvINbOAOZWoorwdKQZVg3ZTnxfw8jLed7TJnvv0rcJCikT6cu7OtgT
 zzew2Okz/DdjuM8hQq6bDP+a7TCyErg=
X-Proofpoint-ORIG-GUID: zlOIXmTXczpq_Fjn_hl-T4W3PrDyr1V4
X-Proofpoint-GUID: zlOIXmTXczpq_Fjn_hl-T4W3PrDyr1V4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfXyPdt4N/HUiB8
 dyc90FkPuiHWdJcKPRx58dQQAAgPUObvs8vvIvJd8k8csH6vmN4GNeHB9Le/t7Rt1gCz6V++qxC
 1KXdBGb/5oqamEs+gAzVjXgEr4/gzviq3lV1VRHX/dxzjGAD6fYSBxr+F4Lgkp+JogE+L4xl4Lk
 KOrIZ0vj4Ujn9du846/TomHRITPe3T69i4WZ2Nco1jzLU+J910rmgG8rWeS5MFY2/n6PGppcFcq
 qgOiU1/SNbo6cbk0jCEdXml6pvrhJIfp2rxoO0gzwiH/ASEYXvsUcXc57e2G6n4+gETKUQC6GJU
 CpOBUDtIEu0ERUWA6d/ClBmdIeE60TM8aBz7Y/hb6hMzZ74htPV7xITUdQxXtYDFdtSFQXstNzy
 i92JZL0Vrmmp0PDfGLSTOoCaiuw2T1ODSzEnxBfJPJWeKm2PyrfbWRX6qTV6ZFRblSwrKnO7rA7
 N4HJ4FnpLm6cSXlPofQ==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8c4e7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YL5nfsDHeRSAjqAumtsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090042


On 10/8/2026 3:30 PM, Dmitry Baryshkov wrote:
> On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
>>
>> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>>> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
>>> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
>>> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
>>> --
>>>
>>> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
>>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>
>>> iommu: of_iommu: Add support for "iommu-ranges" on a device node
>>>
>>> Add support for "iommu-ranges" on device nodes to specify usable IOVA
>>> ranges directly when there is no backing "reg". Introduce logic to derive
>>> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
>>> to be paired with a "reg" property.
>>>
>>> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>>>
>>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>>>> index a18bb60f6f3df..9766a6944d0e1 100644
>>>> --- a/drivers/iommu/of_iommu.c
>>>> +++ b/drivers/iommu/of_iommu.c
>>> [ ... ]
>>>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
>>>> +{
>>> [ ... ]
>>>> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
>>>> +	if (!maps)
>>>> +		return;
>>>> +
>>>> +	end = maps + size / sizeof(__be32);
>>>> +
>>>> +	while (maps < end) {
>>>> +		phys_addr_t iova, iova_end;
>>>> +		size_t length;
>>>> +
>>>> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
>>> [Severity: Medium]
>>> Could this result in an out-of-bounds read if the "iommu-ranges" property is
>>> malformed?
>>>
>>> The loop condition checks `maps < end`, but of_translate_dma_region()
>>> implicitly reads `na + ns` cells from the maps array.
>>>
>>> Does this loop need to ensure there are at least `na + ns` cells remaining
>>> before calling the translation function to prevent reading past the buffer?
>>>
>> This function intention is not to validate the address and size cells here and
>> it's not valid to read those properties here. If the out of bound ranges are
>> there, then it's part of dtc checks that dt node contains invalid ranges.
>>
>>> [ ... ]
>>>> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
>>>> +		if (pos->start > next) {
>>>> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
>>>> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
>>> [Severity: High]
>>> Can the length argument overflow on 32-bit systems?
>>>
>>> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
>>> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
>>> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
>>>
>>> Will this truncation result in a reservation of at most 4GB, leaving the
>>> IOVA address space above that unprotected?
>>>
>>> [ ... ]
>>>> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
>>>> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
>>> [Severity: High]
>>> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
>>> to its lower 32 bits on 32-bit systems?
>>>
>>> If the remaining address space exceeds 4GB, this truncation could leave high
>>> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
>>> IOVAs.
>>>
>> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
>> set the dma_limit max range in that case.
> As this is generic code, could you please adapt the code to work
> correctly on LPAE systems?

This is no different than the existing logic where client tries to reserve
greater than 32bit length on the 32bit LPAE platforms.

I'm not convinced why sashiko claims this is introduced in this patch.

>
