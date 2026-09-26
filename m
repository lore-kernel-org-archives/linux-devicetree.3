Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D2F37BE6C
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409197; cv=none; b=Oi4gvGd4TGiJXwZlI45V9CRFR23sDtzQ8JTxC9RtOxW9BXpSoIs6wCBgpzU2M8+ap3WcAbaFZO9rgCZLFRoqD/YtxCD2JU5vtIpIrlO2nsB/ndeOLr6hflzj1b5S+v1SY6Tn1swj3ysfoy+qwZkufMzlsMXNhf2hTY5HabiMIqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409197; c=relaxed/simple;
	bh=5/UqRT6LYOStu6PovJuPgMB+EryHc9ADHHCpQK27Tzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUD2UVujcox/ToiSerPtJH/gmnaCS1o2gM318Rjnzm1ddQrpCIUoZMTn8nHlD9ZZVPCvg3b3ZCzet+FJS0d45RH2WnVQdYA62GCU7aRZQfM9HVXR0XseeCsf17aJu1UMco6Pf52qXuQD0Rzu1IcPGK9wJ9eP0lPDqoXkqZzuc6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8M5RFOt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjpVQ88Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8M5RFOt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjpVQ88Q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6OVqv3899461
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 07:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7e/aY11HQgzVEE1SbOUx4gdT0DTZ6TfGjOfnrsBzMR4=; b=Q8M5RFOtDc+rcmyA
	MS0iETQciwEaKOODKRpnq0js538SrGx+qkvJQqYgHLizOrG4RqQIs19szg1Rqub5
	GZ3uoWyIPg//G0iuZ/elr36lKG2Lnsa1Cu8F1lGY8NLrzQDWkz4J0fHKQ3luVsDQ
	KymkuFOCgMdS2r1RlubbDuTMUQiHj6Q/JoHU8rW3PT7MNVWGdleFY/lF3rG8a+Nm
	IPsavzg3jNjP/TPRTDK20GfcSCZFDSzmVi4AbGXPn/U1n+C3ApmKnigIoeSUM7EV
	XdMh0Y0H2jhaQ7w2FUhlXTIdgWJWk1gOfqNGY5+qFDulmQcy4+7Y6eFYN/CJs5f4
	C47PAg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw8fum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 07:53:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3282d5302ffso2276164eec.1
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790409194; x=1791013994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e/aY11HQgzVEE1SbOUx4gdT0DTZ6TfGjOfnrsBzMR4=;
        b=WjpVQ88QdHzpIH4r111AFvJYFs1pZs8eOGuw58o/sjpNEVNAA/8o5yITLbYkoILGY3
         BZ6JOgWKooPnuGnw6PG67y0hNILGpPH/5XwASxujKnBGoR2zzoArrLzpwbQopaZk5344
         1BSRl4/PWiGt9u200yuOUvJ+KEWIqhj0jWaynFQX6aVHDQ7ijrooqAvBCoL21KzxjJN6
         ij+hZUtj/hJekZIsoXhX8T0isJGIej1Tl8J9vF8cvSriiNxBbPKxQzdcFeR2IcGxbQt2
         +aYgm9Qc6c3NOUhpp52cP0BHHoWUuH50NrB7PyNdxgVDZS7/GXAYIE4NA4rJ1A/Hj/CC
         PmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790409194; x=1791013994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7e/aY11HQgzVEE1SbOUx4gdT0DTZ6TfGjOfnrsBzMR4=;
        b=cd5qM9mN/Gjs7E0U9OC3SLJZvMmiz/V8j9wMLHjey/Q2ukc5kuYUzvKQ7oc6jQtsrQ
         fTdKWb2Hw0YBuMzH8/KRis52HS415pMii4e1L/wq+KZeEcdz9rjlg2N6qLTf27y2d36m
         /BM4YAw7z7qbDu/vaGLBfAokatBTfDoDlfEEjLVc2H3QVqFFkx80YMTqZ3xyBfFPzxkK
         zf6fepu8wCiKR2YMaVKkevBImw3YhtFaDxXPjTcUwzeLSey2tEhj20cAbId197aQFKfW
         PnbL96mdpKobW5o4dCCVtX+Qg/eHuva1ZuHmsuYq5kLSZy04ccZkWa43zotdwStiT8Wd
         jqUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWHp9hoq9Oq77e9DKLxVEmn/LQ0vTrNcIW+TOLdOlLSSQMdQsVgZH+nd8lbPna5m99bY6kAyGwiCAN@vger.kernel.org
X-Gm-Message-State: AFuF++lWn79NLvkeXANKGHONG+oWwQ1iRIjjw41Sort5HYY31i26Emc8
	qJePQ0ATNQ/wz//OQHRmT2BUjUq/3C1cOadgqhoDEWkJooopY4kXGBMmpUUvmEfyINlOYQYtBYW
	BPxrmjGWk7F2U79EiPcoQBj3XXSZsTIRDkk/IDiBiQ0FEhhfjFYKFODooDamvlgb5
X-Gm-Gg: AYBFou2nyxWa+YHpADxKBp6LVnwlHHrza6Hf5L4M7kRmlRkJb42XzqLJ4cBIcY7dS1X
	GeEBbqzj3YfgJfZD7/gCQvYC9zuGHkw3vWpGzfnIeET4u26KOV+GnM4lcw54gObwO5cvCM6lefV
	XV9dB/M++HwKt5iZdncjBJ5+uOPf++0mH+382ESFbwVkBnvB7BQsJOpf85xbGsG+NpYk1bNqnK1
	tZWCit1blYhfJCIivsfK0CSolT9aChwarJaHbHS2Gs+1jzTJTtN3tFXbX7zXALtwic6oZWBikNo
	MjAeobxLy5LFwqSDWrZ2YAidAcGosBMERadywJ8VUI5OUUIQgWrXdr6UKacRWRzI+Jprhec+5hu
	NMijQn8ESYa/zpqJF7ojxXfAQQSa67rE=
X-Received: by 2002:a05:7022:418c:b0:141:9d33:f1b8 with SMTP id a92af1059eb24-146cea5df96mr3264251c88.12.1790409192682;
        Sat, 26 Sep 2026 00:53:12 -0700 (PDT)
X-Received: by 2002:a05:7022:418c:b0:141:9d33:f1b8 with SMTP id a92af1059eb24-146cea5df96mr3264137c88.12.1790409191102;
        Sat, 26 Sep 2026 00:53:11 -0700 (PDT)
Received: from [192.168.0.14] ([183.83.142.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343025a591csm3792326eec.12.2026.09.26.00.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 00:53:10 -0700 (PDT)
Message-ID: <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 13:23:06 +0530
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
To: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260926064755.4AC931F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dnTdAOdArGTwuifKIzKrbp0yl_S8sIr_
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab779ea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=BUSZCRnG/G6/Li3ahCSwQA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EhbyzWJOQatpsXQnGIAA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: dnTdAOdArGTwuifKIzKrbp0yl_S8sIr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAzMSBTYWx0ZWRfXxe5HVkQ00MZP
 hoEjjmu5KUmAWGmy1EbbeTp8WtJ381+orRk48erKTi1VqTfTXmy7eaApK3fMnhBq9/iVooyWruw
 HBfkP8bSzhfKnF6bXMMl/GMnmD/yxGRAH4QgvmfDgmQlAhXgy591d97hj3+A2ZRaOyE6OEhikbz
 dOUJHm+OnYy6y0rmexRmy+GCzeDLG26ql8CEsWKMxyiYlGrP0JUcZ99mjSQbZ8zA6NOlQXK/UzR
 BTt1/bL9XEg9KT5faTxiMV/J4r2Vdtv2h/Rr+V7wY+P8C2sSRlbEabWMBZhVB2cPGpsvORbBp1T
 +zch+ko7lpRQnKHrv7zlFQbpRlG8lAQnRdipcg/8qcEK13HvWgs+4nGZv1o5apxecEd37rliRSo
 fgcUak3Y7oXc0V+4CchszCvb9H/irasatgqib36hgKxT2/C2cpd2oFTLFuvWgHTKlYtD6TwcXnG
 mJAlHOfn77+x6fwGbOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAzMSBTYWx0ZWRfX+4a60a/E8M+C
 qXSGHsaxg+SFnX3Dh5S1r1qWrXT9pAiDNgtlqPmwHAQQW9+jRJ1E3ga0NgoQ1RSQ9u0BWdwDZ7T
 7IcdKMV6SnSIh4kLyjcWloNfWuLY/g0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260031



On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
> --
> 
> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> iommu: of_iommu: Add support for "iommu-ranges" on a device node
> 
> Add support for "iommu-ranges" on device nodes to specify usable IOVA
> ranges directly when there is no backing "reg". Introduce logic to derive
> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
> to be paired with a "reg" property.
> 
> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index a18bb60f6f3df..9766a6944d0e1 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
> [ ... ]
>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
>> +{
> [ ... ]
>> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
>> +	if (!maps)
>> +		return;
>> +
>> +	end = maps + size / sizeof(__be32);
>> +
>> +	while (maps < end) {
>> +		phys_addr_t iova, iova_end;
>> +		size_t length;
>> +
>> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> 
> [Severity: Medium]
> Could this result in an out-of-bounds read if the "iommu-ranges" property is
> malformed?
> 
> The loop condition checks `maps < end`, but of_translate_dma_region()
> implicitly reads `na + ns` cells from the maps array.
> 
> Does this loop need to ensure there are at least `na + ns` cells remaining
> before calling the translation function to prevent reading past the buffer?
> 

This function intention is not to validate the address and size cells here and
it's not valid to read those properties here. If the out of bound ranges are
there, then it's part of dtc checks that dt node contains invalid ranges.

> [ ... ]
>> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
>> +		if (pos->start > next) {
>> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
>> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
> 
> [Severity: High]
> Can the length argument overflow on 32-bit systems?
> 
> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
> 
> Will this truncation result in a reservation of at most 4GB, leaving the
> IOVA address space above that unprotected?
> 
> [ ... ]
>> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
>> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> 
> [Severity: High]
> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
> to its lower 32 bits on 32-bit systems?
> 
> If the remaining address space exceeds 4GB, this truncation could leave high
> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
> IOVAs.
> 

size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
set the dma_limit max range in that case.

> [ ... ]
>> @@ -214,10 +319,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
> [ ... ]
>> -		 * The "reg" property is optional and can be omitted by reserved-memory regions
>> -		 * that represent reservations in the IOVA space, which are regions that should
>> -		 * not be mapped.
>> +		 * "iommu-addresses" must be used in combination with a "reg" that provides
>> +		 * the physical address and size of this memory region, for an identity 1:1
>> +		 * IOVA mapping to that physical memory.
>>  		 */
>>  		if (of_property_present(it.node, "reg")) {
>>  			err = of_address_to_resource(it.node, 0, &phys);
> [ ... ]
>> -		}
>> -
>> -		maps = of_get_property(it.node, "iommu-addresses", &size);
>> -		if (!maps)
>> +		} else {
>> +			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
>> +				it.node);
>>  			continue;
>> +		}
> 
> [Severity: Medium]
> Will this break existing device trees?
> 
> This explicitly rejects the previously valid 'no reg' device tree
> configurations. Existing device trees that validly relied on
> "iommu-addresses" without a "reg" property to create IOVA reservations will
> now have their reservations silently ignored.
> 
> Could this lead to the IOMMU allocating IOVAs in reserved spaces, causing
> DMA faults?
> 

This change is intentional and clearly mentioned in commit description.
dt_schema is updated accordingly. It was discussed here:
https://lore.kernel.org/all/CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com/

> [ ... ]
>> @@ -258,6 +367,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>>  				}
>>  				type = iommu_resv_region_get_type(dev, &phys, iova, length);
>>  
>> +				if (type != IOMMU_RESV_DIRECT)
>> +					continue;
>> +
>>  				region = iommu_alloc_resv_region(iova, length, prot, type,
>>  								 GFP_KERNEL);
> 
> [Severity: Medium]
> Does this newly added check actively block pure reservations?
> 
> By enforcing that only identity mappings are honored, does this violate
> backward compatibility for device trees that used pure reservations?
> 

If the pure reservation is carveouts region without reg, it is not allowed,
which is aligned as per the discussion. This logic now handles the case where
reg indicates the iova reserve range for direct mapping.

Thanks,
Vishnu Reddy
