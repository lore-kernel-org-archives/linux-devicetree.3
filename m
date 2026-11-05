Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885990;
	b=DGrhwMP8/TUu+6kxUlRPX6CLGbyzo8bw13ndxmNNMgF6HC2O1XDK355QjSTHohd+xuPE
	 3yU2KPlau/xbZjug2MtQAxRMb6PtLreiT+h0tc8VcnmFjOAYeJU7Q0QlKZmG+7SWIjeIj
	 qQI45OV+Hj17oYlVxhvk5K0pERlb6PyOCwK+K5hpuLDYmzMxW/c1iu73uW1fVmVlhi9WD
	 Slxkj+jX4dd6VQ7vU6WZrPl9eTRtPOSglMGQJyMt5FAsgIbLlTRs10fBLr7MVo613O5kh
	 A0aYKYGzMYqr5A2tiuPmIhT3KJs0OSZgoNsSVRmSYGvS1D4H646GI9IZSB4rEENscjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ca75OONoSil29mOME3yxUZukBMpNuAXeGO/o4FyBT1k=;
	b=h0j05OlLRrb1XIH+ywyU2GVQG18Ar/hUwh/ZwcctrxFBVgVUQqe4B5FBt8/xEPNTk7b9
	 MXjNnSWBLuGCov4FAO0IQSe7YG35/xOq5ofubFDtHX9eKstZyHFZMhoem54P8yWuwG1qk
	 m5nHpJr+dgbPdtp6Mw/cHbrTUvuanGqdtc4DbpMdEdnp1xFPS14HEDwLXBFXjU4FhcFo7
	 DvQTXoeOxl5wQWtps8TG+CUHxI7zNYDw6BQKUDRA2urRlHm5sS3YxZ1FTr9m4BHx5VI58
	 TDn1x229gQoaqfyxTJxAyb/evHngvuYnkZ1GkaQDq74CArU/1BOYrgiWxrnwuPf7ceQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CClOpqWi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilqt0GpI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3A4606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3A4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CClOpqWi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilqt0GpI
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tLuO1053165
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 13:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ca75OONoSil29mOME3yxUZukBMpNuAXeGO/o4FyBT1k=; b=CClOpqWiTvqkA03E
	ytnL7SM0+W+sCOnUnxqSaoBQS7OcqQR1mhJF8edLeQQtPhGLvG7IpgErn/E+4vrM
	l4HuE4tHLfdNcLfum8Gku0xiQJfBimzs/Cn+Ryam4yafeo7Ft6ly2Ub9vHiPMGvU
	O+KdHkf1LUD0sS0E4H+MbuDZ6z2uNOV3fx8MaU7Be0GlMrWnqh78rvsu1pSAN2KZ
	UEBWZBtl+uRBrivSlv6Eo9cuikEbxgdlwJ/6fazpYuprtx0gGIAsei8WL44Ya6DO
	KOC6WT5+C2hrdLZmmdyV7pqD5nqI3IEMj1X9YdzYEgMMMUacY+Vy08/oL704tM9C
	L19VWQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f8yhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:39:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd65285537aso876454a12.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885988; x=1794490788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ca75OONoSil29mOME3yxUZukBMpNuAXeGO/o4FyBT1k=;
        b=ilqt0GpIe1ZV83p8+wTj86UbD6upCgLXdSHqRFteml2pQFu7bp7tTyfCGPG9vmMxY4
         wWznLwABk2T1pgTL//NkJOF1QLKD2MSP6Nw2aXDN7YltXE/Pp2bsAHFUyCjhcOgRVDB4
         eDmvw9fmcDUMChIywklkPf/NvDb7OJK8+3fwAV9JJO6P8DgV54d4w3hn+HtjtdwMo0JX
         O9I9Z3o1Mh+vFaAxlYj14afh3rpB9NTnQtO5BPrG8usOwgXun1Hr9VFdR5U/2nLyjkGL
         iaqzDwUPA+FBrGb+G4zmWktGOph2g1MV6GiUC8080nNUq72HmrDkZcBC8Ar2oU2l7eUx
         vnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885988; x=1794490788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ca75OONoSil29mOME3yxUZukBMpNuAXeGO/o4FyBT1k=;
        b=q62m8uZXwm0h5es0vZXduNhfKngXmeBIQnAA1DvqzM+gue159liDOpLBIh6evB2bPo
         Pbs9JAy7GDm7yseXScTx7fXDP01lUUX56RLR0/Pq4a6+iVTR1I/0gsEdLkCAFAlc/Ph1
         42c2V1mmjeZlor5HAj8dIFEBQgsvj7R1AE7GdwBnobO/bMmxvEEVcTtFkMZSWlJl5O6g
         X0r+L1d2XWtwccgGablwAS+fl8iSwzP2hSvwNGdlfEsnyg5QAflB0SY3TnKlW8WdS8uc
         N206BT5lvdxCCptCGSUDvPXAOhbyULrkmABP4JnmbnOXV8TPHfMApNdfFUpU9byB5fgy
         a5wQ==
X-Forwarded-Encrypted: i=1; AKwUvByubPInUtNpnrKS/JsXLND3TdHUlkSxn5iHMMu5g6jKFWSoHGcDUKk2rRceoCDegmz5PB+WqaVk7ta6@vger.kernel.org
X-Gm-Message-State: APuU4Z9SK2kGxp5m7y4SX/HFHdN+CvoeXAL7cDqw3cZwmiqgahpUeTAx
	W713ABON1y6imRwg54xFguxVT6ZwwrH465aidRFeH9KaYjcZl9xzjoiBu6hR/+DJ6yFSehH1heY
	5M7JnCuV9b5tgpiwclwjjj2kZ33xlG1iinyfRm0WCSWR5piG2gTmfgZLMZZBTLTWt
X-Gm-Gg: AYBFou3JRJVH/3FPG+GGQm+FQHX5H0sZfb7DiYkFzNnMNafkv1sa0sMeIkGt07ZXVv7
	XnuGPtBbjcTbsduUf45z451Cw9FGHvOm0egh7f1SOweS/nVssOQtUinWOU1YmoDNIEKxD1oYflR
	/VSccqygscR8d3nVp6+g+EWmz4TFNDyvZzYyDQtiq1yajKfkdTlssxpJ+WVzpn1V7JbuJiAjiLW
	90zav51b7esS20NQOhmgucO5UluUqXnpme9coj4f9Wf/GabJMiTN4VFNIpA275SsQE3wb90b36A
	2BHyARpTmncVr49LyRTt7E+W2oMmZ5jpInbivGpF3tzCa8N8SI7UBKiZRn1d3VUA4kCBPB34dlH
	lfSVMv+pR3E4WFofpg0UFsJyy9ep/+MEed/VlxXbaCkNLw69Rd6VdWrakqcU0bZR/ay8GU1XPUX
	U+3g==
X-Received: by 2002:a17:90a:da86:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3ae897f61aamr16476334a91.24.1793885987701;
        Thu, 05 Nov 2026 05:39:47 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3ae897f61aamr16476312a91.24.1793885987137;
        Thu, 05 Nov 2026 05:39:47 -0800 (PST)
Received: from [10.206.97.48] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4691d431sm2208325a12.11.2026.11.05.05.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:39:46 -0800 (PST)
Message-ID: <e7d81da2-c083-4aca-8fe9-38a068613ddd@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 19:09:38 +0530
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
Subject: Re: [PATCH v6 2/2] of: Add support for "iommu-ranges" on a device
 node
To: Rob Herring <robh@kernel.org>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
 <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
 <20261104160346.GD3951195-robh@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261104160346.GD3951195-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX3RDPvHOhwon8
 ptcFMh8OOghG+4AZ9FtQrC2TNrdnV8vFh60oNKN+S8Ht9jbAAmkCO0gqXn2PfOjJjwhoO5BNkfe
 D6P+b0eoHpHE+XDDvux/y1GSzglRwG00VOdF8WEGxHV8qiJHA/rdJAuYdsh8Ep3hfVTarJ3CEs3
 fXR03EFef7LkMnpeETwuENVhut9Hqk+YxS+9UyYi6VPo49kt8eSxQBnIJ4e49ak5lk1ZBq51sWN
 vGTR6+zO1vSYrr8nGanuD8l2x0RQp2JqfLbkBugP4vk53Ty7qTUEMTzBAftPu6AI8ZcKB4alxw4
 XnbhQg6WqUjoUdVMQRxxDNNiUd/bQTfQOw12zJ0JsNiaIFH7SXBhTfuTxT6mpXHCRjxQrFrhMVY
 UMPL7IFacuclHHVJcHpYqw5a01IsTVsMv7//mjTqW+wYD80dGiyrm1qZskR+ZsWBCV0uNIsCMEf
 L+tQl3I2uAWWu2n4/MQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX30tASJY4rYf2
 8x7FTNISpMWuZ8yHp9y4I89TRPyXbly5gHV0jdN4ewLgrSaoXBxTIBvbq6UAd+sHT79xmO6qgZH
 G9KufxnbC5JmZEWyc6ZA4HJhsRQ3f40=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec8724 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e-HLqTR_PI6rTb-hZFoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: DXAxLmDwC-r-YRSKHdPlI6LcgRZ2Zfqj
X-Proofpoint-GUID: DXAxLmDwC-r-YRSKHdPlI6LcgRZ2Zfqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050054

Hi Rob,

Appreciate your reviews/suggestions on this patch.

On 11/4/2026 9:33 PM, Rob Herring wrote:
> On Tue, Nov 03, 2026 at 08:59:33PM +0530, Vikash Garodia wrote:
>> Reserving an IOVA address using "iommu-addresses" requires it to be
>> placed in the reserved-memory node. But when "iommu-addresses" is the
>> only property being described and there is no backing "reg" (i.e. no
>> actual reserved system memory), it does not really belong under
>> /reserved-memory. A device IOVA range is specific to its own address
>> space, and does not describe the system physical memory to make it
>> qualify under reserved-memory. Given this, place "iommu-addresses"
>> inside reserved-memory only when it is paired with a "reg", otherwise,
>> define it within the device own node. It was discussed here:
>> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>>
>> Existing "iommu-addresses" property expects a phandle, which does
>> not make sense when the property is defined within the device node.
>> "iommu-ranges" was introduced to specify the device specific IOVA ranges
>> when there is no backing "reg".
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/of_iommu.c | 134 +++++++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 125 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 5c266511db78910d6fd221af5437cecff4931c22..0428ceb50dec58f11872b4fb64e283fa8d9046a3 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -185,11 +185,118 @@ iommu_resv_region_get_type(struct device *dev,
>>   	if (start == phys->start && end == phys->end)
>>   		return IOMMU_RESV_DIRECT;
>>   
>> -	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
>> -		 &start, &end);
>> +	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
>> +		&start, &end);
>>   	return IOMMU_RESV_RESERVED;
>>   }
>>   
>> +/**
>> + * of_iommu_derive_resv_regions - derive reserved regions which
>> + *                                are outside of iommu-ranges
>> + * @dev: device for which to get reserved regions
>> + * @list: reserved region list
>> + *
>> + * A device can describe its own usable IOVA ranges directly on its node
>> + * via "iommu-ranges". Everything not under those ranges is derived
>> + * as a reserved region so the IOMMU allocator won't use it. Entries may
>> + * appear in any order in the property.
>> + */
>> +#if IS_ENABLED(CONFIG_OF_ADDRESS)
> 
> Is this really needed? Assuming CONFIG_OF is enabled, this is only false
> on Sparc. I don't think Sparc needs anything in this file. There
> aren't any IOMMU drivers for Sparc unless COMPILE_TEST is enabled. So
> maybe building of_iommu.c as a whole should depend on CONFIG_OF_ADDRESS?

Agree, that's much better than adding the check, will drop from other 
places too and make it conditional compilation.

Regards,
Vikash

> 
> Rob

