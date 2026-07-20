Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4193E63AE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556726; cv=none; b=StCG+DT2V0WZ0h7sR3r2JxEffWwPDfk1iUquJE/qpat9OzHOJ/yRTu9HExkh7+Ob86SVIglOQ/jlUjM9caq0C3q7oBiEduWTyvaWiXcPJEvQNcKYTrxR+mc6vLYtpCxZYW1SR6BQhf8+YpCUbkDQ9qXgtRPnbiWYzGIYp2idAc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556726; c=relaxed/simple;
	bh=CrusvQrBASBFhooN+pfdEkfPmD79gBrBLgltXL1IqQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0kr24kTVLnJ5weXCBvdI0ig7lmZIajSyRC56JObfJ6zlF8Ve9Ivqu5wEWS30wngSS8UfZTrfC58++K7VHVmUtfBbVywiCEfH9aHjlDSVpqSCBRUWbEEFuSOgZczipBjTx34M9e53XWjR594pB/AXmNXFUSJYDdlxURRABSXoPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgerdfAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e192sQQD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgerdfAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e192sQQD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqe3H2604308
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFbXZVYlpWFB+86AR3x1jH6JDJM2yKuesn95gcq6Bt8=; b=MgerdfAGT8P4AsIY
	Bb7+lF6ar+WGa3Xv8UPRLAtbfgAI/6Ay7vu4wY8upS/JK5Sa4OIcHGWZO/LmPp0k
	PADPqEm1K7t+R5eprqmKKggHeDeSa53LKG2MLyxAs0/FUqGMOCsuYtxn4FkbrXzI
	zmiICvyIcNsfmP6ZlurHvwAOL4qtRJobKmZRaS1f9yLlpu3CrZpcasDVXaIiCTfK
	6EfQNPZFVKokSQ7lcV9W5Ok46nfJaXR7ADHgw4qM5OmhoYwIx6FuzhrK1raFem3J
	TzKdTl6gu/FyBHhh2CR6PO9dZ+0Rf9UkFaBg3yU2yHJLFjoNkvwdwYnB2VZlm/3Z
	R3ul/Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg9g6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:12:03 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a441e90050so5470516b6e.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556723; x=1785161523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFbXZVYlpWFB+86AR3x1jH6JDJM2yKuesn95gcq6Bt8=;
        b=e192sQQDN6GSnhBCh/cPWbDoy1Ff0dYKyqHIFubOlrVbxxpdOMLBC0aoPQ2KuMp8NH
         G3S0iHxdZUw8ewrR49JWfB4Za1XgZyTHqfpxCc3K4PYeYroBdIFagajbq2UJLIWHHXgh
         A1wxPhkHr3iuOZ0vSQe8k/uIXz7PQOWL/qK0pGOH8znk4O6tYBMDr+rRS9O8ekVEKX9x
         BygJQQZZgHqVZtYy3vcUWmM1kcK0/Tx3ieBG9Fuv5+TiKmeMD7QTq8BaaazoFNi7Tyoa
         EZges0kJKozN7px3+BYlFtTA3tig5Jvi1UDTMbPyO27dOC+l7Ve+k+3Rz5jPOaIF/qlc
         PWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556723; x=1785161523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFbXZVYlpWFB+86AR3x1jH6JDJM2yKuesn95gcq6Bt8=;
        b=nED1zIwRhzKHyknij/+IauxoU2f3VC+FpdggynUcgBlhRfkp5mSK6yYigBmqCPUIT1
         yg8JvTWnbUQnoxjWy/foa9D89UueCrgt3TDF5Vc5HbFRL3n40jPwyOOkkuQufzUgGSrw
         fhceotaIcoBJO/mEeN4ljvvrV2ZjQ9C4eISrpt8suKT/9XOIQAFr6zYK3i/AnUndGAj1
         mB9y3q5Zyykd3P/SY0ngI1kky7V060sYrkGt9h4Na7OVMwVVJQESdnvjjDMUrD4xq4C9
         q3HdWhc9Gk90EW9Ao4/o7kvoTf0yf2Jd7I5F7iywB6MuHc0NmpE1Jf38HOFjZVQJeo3O
         5uzg==
X-Forwarded-Encrypted: i=1; AHgh+RqIkQMgcpLLajj2vFPiXMIjpWKYV+Meq3uWNpUMaUBQrESLPsK0i7HQcj+0J7+SIRb0v3E3hrqI6Vg3@vger.kernel.org
X-Gm-Message-State: AOJu0YxDoGQfui/6yYCb7zlJqkSpkp4TMi6ly9N9I42Q7frm/kYDmabx
	EJbLsaGWZMS96w0ZX1eXdITiy2w7vgXA3fXU5g9/USWGFPC+SasRzJkcYjV58uEzVKnJIm3VGpm
	OzzhE2fVDGPN2bQYn4W/INhd1kzV6HNQQOFOxDIBDku9h1Rw/Krv1d0fpe8R82gnK
X-Gm-Gg: AfdE7cmhuv4WgQhBN5ZU9Q/OlByljKiIcRUYroFuliyaxXi2M0crb+aCa1I16obTeWz
	SD1RF7ctOhIvOe3E4uctV152N46FB9KG7afrhXxOrrVOYVvW4cKRXQC3BhLVrvu+yOT49fZxjIU
	r0kPpr770dJBEtbaegX2x5l1OjmODNtAysoXDXwOYlhY/7DILv0w5aR7eBtQ82o9yhWyQi6fy7x
	h1gG7WvPYMXOzc5QABR/gTxMxK48Qf//ssfN/szNEba7vuiw2ysCGU2EK9xPIzUOS6rt7O4RIo/
	BovMhMOhSakEwjxrlVVHlCpLuEEw49ZUk2MjQHvm9oEVdfdvI9/gfv9i16VvuWMWKYjkaM2ZS0d
	aDIYGq5O7yS9/dqH8M4inYj1AeOf3
X-Received: by 2002:a05:6808:c3cb:b0:495:fa67:7496 with SMTP id 5614622812f47-4a4cf26bb93mr7248848b6e.14.1784556722666;
        Mon, 20 Jul 2026 07:12:02 -0700 (PDT)
X-Received: by 2002:a05:6808:c3cb:b0:495:fa67:7496 with SMTP id 5614622812f47-4a4cf26bb93mr7248832b6e.14.1784556722182;
        Mon, 20 Jul 2026 07:12:02 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3d36340sm7497247b6e.16.2026.07.20.07.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:12:01 -0700 (PDT)
Message-ID: <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 19:41:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
 <ak5pC_meP8KRc3wJ@baldur>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <ak5pC_meP8KRc3wJ@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kbMhK1Eu622yDpBZzO5aWVnTV7mtgQic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1OCBTYWx0ZWRfX6Wjf1V5a1iwL
 2j5zRwSIUSwF/VnYIa0i432I5JqYLEK60hPwDL2hoxMlq4HUYvSGSxi/qH2wSSBA/9Vjoa8aCUC
 DPRowmixvwS6X755kfN2uUEG8RpboqTM4TLtCMPoKvGDkfKqKPHtSl9NoyHBqKPatVXlJczxdYt
 LKT/axQ2RyTNoYz8lW7Wmw94MWxz4KPHyFbN1dZ9sqWXOh7CIeqKu9kS8KbCgRfWlv99p7umSs4
 Te/2lJwBzLlR5jb1pRemyzFiFb7M7yQl1ITmGMJWHzdtyjBxaoLaP1HvCg95o8/CQ8Mr3XfA07R
 uPzy8/JLHhz0dbRDrPRrhklPD+JoS9qaIbx00QqCVz+jtdvRZt65/8QSqteajwOH8j/DuddIa4o
 JTYyBRUPsKytUyBKKSZdyHdmWWrzb1lRcWOoeqkyyQCyQaCmOYkzeGFq03d+7NkQQPuMB5kzhE0
 Aj0RtS2oTBLgfVMbYLQ==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e2cb3 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fPhLyPd3YuFPpQYp6doA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: kbMhK1Eu622yDpBZzO5aWVnTV7mtgQic
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1OCBTYWx0ZWRfX6XmTDI6+4HG7
 BiYbWfafk5emuilFRqNeOvV9jK/umW+SA355GCYBZhLxVH05fmO4gqV8MJ6Nu+JdHeFLtIUPmNe
 jbdy/wB7ucWDOymHWMm7rMFtw++zAsI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200158



On 7/8/2026 8:48 PM, Bjorn Andersson wrote:
> On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
>>>>>> Some SoC implementations require a bandwidth vote on an interconnect
>>>>>> path before the SMMU register space is accessible. Add the optional
>>>>>
>>>>> Why is it limited only to those SoCs? Is it also applicable to other
>>>>> Qualcomm SoCs?
>>>>>
>>>>
>>>> I was hoping to keep this series focused on the core infrastructure
>>>> changes: the bindings, base ICC bandwidth-voting support, and DT
>>>> interconnect properties for the platforms currently supported on
>>>> Qualcomm Linux and have been validated so far.
>>>>
>>>> The additional targets have not been tested yet, so I'd prefer
>>>> to add their support in a separate follow-up series once validation
>>>> is complete, rather than growing this series further. WDYT?
>>>
>>> Then it should be a part of the commit message. All SoCs since SDM12345
>>> need to vote on the interconnect (and then, in the cover letter mention
>>> that you convert only a few of the SoCs). We possibly can help with
>>> testing on other platforms.
>>>
>>
>> Ack, sounds reasonable.
>> I'll add the first platform onwards which interconnect voting is required in
>> commit description.
> 
> But to what degree is this related to a specific set of platforms? If we
> look ahead, aren't we expecting the list to grow to include all
> platforms in the end - resulting in a lot of noise and churn.
> 

We have seen this issue consistently on SM8750 and later platforms, 
along with at least one customer-reported instance on SM8550. As a 
result, downstream Android implementations already vote for the required 
interconnect bandwidth explicitly on these platforms.

On Qualcomm Linux targets, we have observed similar issues on Kodiak, 
with a few occurrences on Talos as well.

My understanding is that the interconnects property remains optional, 
but in practice it is needed for Adreno SMMU operation on these platforms.

> Can you give an example of a platform where there is no interconnect
> path to vote for here or where it would be harmful to do so?
> 

I do not anticipate any functional issues or side effects from
explicitly voting for the interconnect on Qualcomm platforms where the 
path exists.


>> And update the cover letter to clarify that this series adds
>> support for the Qualcomm Linux-supported targets available today, and
>> the list will be expanded in follow-up series as additional platforms
>> are enabled.
>>
> 
> The binding should not reflect what has been implemented and verified in
> Linux, it defines the contract between DeviceTree and the OS.
> 

Since the property is optional, would it be necessary to add in AllOf
the list of compatible for which the property hasn't been added yet, or 
for the compatibles where it is added?

Thanks & regards,
Bibek

> Regards,
> Bjorn
> 
>> Thanks & regards,
>> Bibek
>>
>>>>>> 'interconnects' property to the binding to allow platform DT nodes
>>>>>> to describe this path.
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>> ---
>>>>>>     .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>>>>>     1 file changed, 27 insertions(+)
>>>>>>
>>>
>>

