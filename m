Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021533;
	b=lgV0qli8ycuUJJD9qtvVrRrmRDQkko/6Yso9hf+E1YR1gYqsfRAH+zsjMJFgsqnr96LF
	 ijkjvSFKDmo93ff30G8xr4pawe++evuhAOSNhToFs5iw3tfN6ze5OCa3RhblxZKmxPwVI
	 vuMD3WF6wz3z2Qorz0CxVRkw3mYPAzjBNEh4uYdoPat8zAaXbvNVSjfHsYuyPm1Votgxj
	 ONmi/ODNWrojchU52rdkYeGWjf4ZYv/cowigBIxsPVpAakisOKvQpa8Ly30Ae7E5+BeIt
	 2Px6/rUwIDI4gQ3u/4PCA0vpBwAovvBs+yB0pnTD07b9weJ6bK58INDc+O8LJ07ecUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I/lMXOtz4EWJJKG0P4frA8Ehhog3XZ0EjDEz2sNipZc=;
	b=nF42V1jSKXRtYNPwHLKn4wmYwdRvO1K+yXkpkrdHzsSS7lMLclXGKJwYSPZCITf7BD6k
	 C/fhCQWAtYpSlg0Ud6zx3PIYOzneuFV25cmZ/eVRWemf/YVRLNfEwZv87J4bxuZWc0T6r
	 kQNqas6ICXC6L42CxXTU+yUlZH5YIXcmnRHftPQY9wMqsyomo/C51qAto5ai2jR8A47Y9
	 vL1odSnraPAbnSirBTP+hA65uMN74DyMvt4D7gpCVkjiBdOXb6s7oHVbdhzt0F6z2gqbS
	 wD1SleGHwiGxmCydYlb8EbkYjkJMklQpCAq7C3oFnd33XGa6H+RFyNjRmmp3duZlSAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImR8mc7u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHVWHKX2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1363606A331
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1363606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImR8mc7u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHVWHKX2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwLj43925905
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I/lMXOtz4EWJJKG0P4frA8Ehhog3XZ0EjDEz2sNipZc=; b=ImR8mc7uO2A2P6cR
	TjbIuNgUkEF4WR51XuokFFlfMYru6HZBwpUzGoYaEIbRCS8L7utLI1/1Cgr1wVl1
	/vbc5FSt1g23CbX5o1qd6Vcr+Cgx+AIsRn6w1+kdMBy3csmTbey5V2XWUVkfLP69
	U6NHmsqrYK6vcNhiIzcpZUuSnS/hMygb7dN1t9DXmtcdaEqDjKjX1GQ5wDSvrg3i
	lrAsh7K+zMPxeYvHMuMqUoi3yRd83foswWJTDPpFLjsHakX8FN41ZtOLU7rxJf33
	YFYbZtn40KEef64Pa4d9/lO+ZERp4whyy3bcYPJdYTM87+Ynm+9x/B/GO3urbEj9
	JAoa1A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg06fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:05:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so3673986c88.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021530; x=1795626330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/lMXOtz4EWJJKG0P4frA8Ehhog3XZ0EjDEz2sNipZc=;
        b=UHVWHKX2b+XLrhxsAgkyjS+Cbf20Hta3W1bznLAVs5jpMPjfFX33SQhyWCPKBjVAwN
         tdnlqSoW+0QRPLP1q8Mbx+63X5I5V6qlJwHdfPDanOEip3OHc4i+BEiK9ZIHmTYdUziz
         ZnAtQ/12p2G5veSCmuQx2IVLTpWG2Ahus47C3Ut2CRVF+oxrpqaf0lbaMxYK0fYvHm8N
         NKPMrM4jE20mFrd4yfSBiSzDEh3OEHxoA79ej8vY3jiquwnsi6nNoirnvaGf0JxgbxAW
         c3+SdpDS+wRxeFWayIrezIZky1MjYV9aO2fMeRDAJJy4pIb6HD+/JLIwwxoHyaZebJVp
         Yb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021530; x=1795626330;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/lMXOtz4EWJJKG0P4frA8Ehhog3XZ0EjDEz2sNipZc=;
        b=BjLSligXds8t8bRrqyUI2F5p31yDIxj6jeFscLYZPPxUjtRE5i7GF0RlxbLawgY4rS
         6Gv0FcuNKne0weroyLZXa2Z1Oz1jsSb3uPIVaMlDDAhEXHJRJWdwTfYKu1Co0QeqRPxr
         uAkSHp0hQ9F4K761R/VErR0RM1kvHNkVQ0craMe5ExQXFoyxNrg0IgVpsjxvErOF/DFP
         nJ0hVQCCGSyDhfCM93N3OcA7xgLnTGZ8ouzjr217eKEyohgKrlbgo+QxCJlzVOHT3yVi
         6q8ElBCgshXGQSe1fP4ENpND0fqpqpPDI3/nlUkeQa4O4rebLT/UxrslCLs1ZcqlarSL
         me1w==
X-Forwarded-Encrypted: i=1; AL+hErGFJRJqHd8lzXk4D06gqeZF/DB03+xGGTI3J2bD5UG3cM3lgTLr2BXLtvvDo7UHPq5qkigEWQpA51as@vger.kernel.org
X-Gm-Message-State: APuU4Z9u3wQMkNowlXWT4suUGLiqXP1f8kqBhCp/NCx2ritRUjOLw+tw
	fiK6osr9rDQQcQgI9eM6JTC3yeHavc6DAfrpNRXTBht1VbO6pIFh4L9HfbO4uc2UzZn8rZFQLhe
	tBQ2pXgtO8x/lIAP+h+3b7yXHHtrBjN03D3MNzt8/iHKQyZUWa3Ac/xF7jQEfT5oj
X-Gm-Gg: AYBFou1TCWx6zp74ZeiBiLqpSOe+hPxanUsS4+0ozNqyu0QTzpkWKoLQYK825qKKOne
	KO5Zratk1nERNfDXhpS4Q/QMdJN53GP0+wS1FsW5BVdQ6uIzHDSBN+ShBeR53L2IaukRI8MS2td
	xpNXi2FuHMFzsFQc2Kq+bp8iKrEzXe5Str6KF6AJ3qPod80AZDr68KFYNv1U6MkMqsLBTuD77Pg
	ueN9KcVGvhu8xAOcBI0ntnI+lk12dyuXI4tmb/1meqOOpwXLq+20UmRzG9eIKS73oDejLIYZqP7
	Y2TUyDycW9Y979O0VHOODxQ3xIrPhKeSKbSD5KSh0++AOdDNFQOtueSJp2WEaWKyrDd7XpkMDO/
	szzncPpe9xUdQL6NWH1peBRIsI1bVA3WJbu3XCk+hoMojviayYt5eWjdBELq8EIoeujwntduFrG
	hRnA==
X-Received: by 2002:a05:701b:290a:b0:1b5:2de3:bcfb with SMTP id a92af1059eb24-1b543c13186mr2735366c88.25.1795021530415;
        Wed, 18 Nov 2026 09:05:30 -0800 (PST)
X-Received: by 2002:a05:701b:290a:b0:1b5:2de3:bcfb with SMTP id a92af1059eb24-1b543c13186mr2735304c88.25.1795021529708;
        Wed, 18 Nov 2026 09:05:29 -0800 (PST)
Received: from [192.168.0.4] ([183.83.140.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm9641856eec.26.2026.11.18.09.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:05:28 -0800 (PST)
Message-ID: <59ab240d-57bb-c00c-5409-c22d0eda69bd@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 22:35:16 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel
 <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
 <3e4b6491-2b58-4b9c-90ad-0912f47cb217@kernel.org>
 <ce05d74a-58d1-f605-44c1-ceb9b9d8b9d4@oss.qualcomm.com>
 <2a282370-025b-4c0e-8a87-4d05aa1d87a0@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <2a282370-025b-4c0e-8a87-4d05aa1d87a0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OdjYatuiI6ZvgIvE8AYYKE5H62D0Xgjg
X-Proofpoint-ORIG-GUID: OdjYatuiI6ZvgIvE8AYYKE5H62D0Xgjg
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afddadb cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=jbSCbZcLpKDW+DqD08IedQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yUPLNtyCCiW4yRupJn0A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX/tegGdo3KfZx
 3n5wQEd1PAZV+BZF7ET9ALp61H7MSLS0cVR+ujt0251BFbvxoe0kFv/sIiGEMkK2THpL2R/G5+W
 PXi35ks/vEWmTUzUvDLYiXEU95eIM0U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX+a4fbcK9COum
 QR8h93d1C/OCf75QDU03Tg0Qim6Sh8e6YY7gMOuBpkEOVnkv1zpKVjE5BSRjrAEQ4mCtGyBX3/m
 bW1I/Bnixq0AMrF8JVWNlzPXxzy1G2DHFVzoPfJC8q7bMc+wZvvFxKyPF4KMCRKaSDVKm+kGyKE
 149OqywMvUcZVWd/ycltHOlhQvbF/Ix056JsxxZBL96Gx6jwsz/FqOXUj8vsDHHHjpM3lT7OiJ3
 xZDY2xFaeHu7/SfsMRHNoHpY1tAVWg8Y/WTIFNPfy3buhmoo6knh7cAi4SkcfLSD9HpkZztVyEk
 3EZF+p8HG9wyF9mtUcubupAXxRtQziDAw3SjBNEFEuzcqXFiOnFIbZre+p36U47l8rwSH0gmlLv
 40iiG1PJq4EQM6NyiGTcsHMnrtiyujy3gmAFA35yoR3GgavFhp2zqaCftjZPuKg7BzcsA0YIvKd
 MjbN8A5dyqaetzwxXUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067


On 11/18/2026 5:57 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 17:24, Vishnu Reddy wrote:
>> Hi Krzysztof,
>>
>> Thanks for review.
>>
>> On 11/13/2026 6:41 PM, Krzysztof Kozlowski wrote:
>>> On 06/11/2026 18:14, Vikash Garodia wrote:
>>>> The "iommu-addresses" property describes an identity 1:1 mapping between
>>>> an IOVA range and the physical memory specified by "reg" in the same
>>>> reserved-memory node. Without "reg", there is no physical memory to map.
>>> This looks like ABI break.
>> The original discussion was to avoid keeping iommu-addresses in the
>> reserved-memory, if not backed by reg. In such cases, it is more meaningful
>> to move that entry to corresponding device node.
>> Given this direction, the schema was defined accordingly and the code is now
>> updated to match the dt-schema. At least on Linux, I do not see any client
>> using iommu-addresses without reg.
> Yeah, but ABI is for all users, not only in-tree.

To avoid an ABI break, it would be better to preserve the existing
iommu-addresses behavior and avoid this change.

>
>
>>>> The DT schema now requires "reg" whenever "iommu-addresses" is present.
>>>> Align the kernel implementation with this requirement.
>>>> https://github.com/devicetree-org/dt-schema/pull/207
>>>>
>>>> An identity mapping requires matching IOVA and "reg" ranges. Reject
>>>> mismatched ranges and report an error.
>>>>
>>>> Suggested-by: Rob Herring <robh@kernel.org>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>  drivers/iommu/of_iommu.c | 32 +++++++++++++++-----------------
>>>>  1 file changed, 15 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>>>> index 6675fc900e6c2d55b34c61dc9effaeb48e24f18f..00b02c19f27e195fc36c4bc1d91253255147c9ab 100644
>>>> --- a/drivers/iommu/of_iommu.c
>>>> +++ b/drivers/iommu/of_iommu.c
>>>> @@ -174,19 +174,12 @@ iommu_resv_region_get_type(struct device *dev,
>>>>  {
>>>>  	phys_addr_t end = start + length - 1;
>>>>  
>>>> -	/*
>>>> -	 * IOMMU regions without an associated physical region cannot be
>>>> -	 * mapped and are simply reservations.
>>>> -	 */
>>>> -	if (phys->start >= phys->end)
>>>> -		return IOMMU_RESV_RESERVED;
>>>> -
>>>>  	/* may be IOMMU_RESV_DIRECT_RELAXABLE for certain cases */
>>>>  	if (start == phys->start && end == phys->end)
>>>>  		return IOMMU_RESV_DIRECT;
>>>>  
>>>> -	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
>>>> -		 &start, &end);
>>>> +	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
>>>> +		&start, &end);
>>>>  	return IOMMU_RESV_RESERVED;
>>>>  }
>>>>  
>>>> @@ -211,12 +204,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>>>>  		struct resource phys;
>>>>  		int size;
>>>>  
>>>> -		memset(&phys, 0, sizeof(phys));
>>>> +		maps = of_get_property(it.node, "iommu-addresses", &size);
>>>> +		if (!maps)
>>>> +			continue;
>>>>  
>>>>  		/*
>>>> -		 * The "reg" property is optional and can be omitted by reserved-memory regions
>>>> -		 * that represent reservations in the IOVA space, which are regions that should
>>>> -		 * not be mapped.
>>>> +		 * "iommu-addresses" must be used in combination with a "reg" that provides
>>>> +		 * the physical address and size of this memory region, for an identity 1:1
>>>> +		 * IOVA mapping to that physical memory.
>>>>  		 */
>>>>  		if (of_property_present(it.node, "reg")) {
>>>>  			err = of_address_to_resource(it.node, 0, &phys);
>>>> @@ -225,11 +220,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>>>>  					it.node, err);
>>>>  				continue;
>>>>  			}
>>>> -		}
>>>> -
>>>> -		maps = of_get_property(it.node, "iommu-addresses", &size);
>>>> -		if (!maps)
>>> I miss the point why you are moving this part. Irrespective to actual
>>> ABI break, why do you nee to check for iommu-addresses before?
>> It is more optimal to check for iommu-addresses and then read the reg. On the
>> contrary, earlier reg is read irrespective of iommu-addresses is present or
>> not. So in a way reading iommu-addresses first would ensure that reg is read
>> only if iommu-addresses is present.
> Sorry, I don't follow. What is here on the contrary? To what part?

The intention was only to avoid parsing reg for nodes that do not use
iommu-addresses. Given the ABI concerns, we can keep the existing behavior.

>
> Best regards,
> Krzysztof
