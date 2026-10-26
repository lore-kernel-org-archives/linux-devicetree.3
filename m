Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016515;
	b=z1OI1IU1xxTv3INnQPeMYdL71+8w5JRPXfJJUQpB5mLPOKX/Q/k8XcsYnWzvEizpbMAf
	 HSXsvIqv9aXL7AU4VenSbCFn24ak8G9d8uT3XGriP1Hn849j3wo3g/B23eO48wd+eGbgO
	 prwNx0wia9+Lh81UUnCH+kj+Dl2HEPSnNyUWvqrT8BoFpvGWc9k7a6Swcdq45Gdu6L07G
	 0tU8WI4Evx4oeJzQDwIl0HMK+nnoqduQ6mjwCm7onvhfEhl/v2qV61KH8ALAVSYfiqfBd
	 GROFtCrHJ5vSSICGuJcNAEYf9j2DWkeCI1wh1i+KOTSUo6Ol9LleDktd83SFQqf5Kyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I/2wBJIeXxryjo6HX0okQ8Ro7vA8D+4gbgBbPi+WFCs=;
	b=DfoFi59bMTPlJlPuqCOGQ7JdZ//oev36yUgknvkjCogiFaoOd2XW+gIMQw1QfZifV449
	 QM+KccB/tJ0meSPlDFzEpipTGbz4InfhkLDihsBG1yrtrs3z9BYX9DoThEOGRrbe15atE
	 tjkRqzInDClVhkfNn6p5qycln0tNt7lOtQWuToVk0p7C/5LQM8EbH3hsQA1YLwytgIbYO
	 aG8Jhux2Yezr2grY2bjznRBSePJ2QdgNm8e1RsicescX5N0fO7aAQh6bq7CKhHVDXCyLN
	 +PxUUScTOhSjvlLm+UcmNtDuA1FddCCcNNtqD/V92PwIxngewGEvHHRqmOp5I+FZFOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UBDhL2/J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHwT+F5y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D1D606A320
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D1D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UBDhL2/J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHwT+F5y
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtAQw3633294
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I/2wBJIeXxryjo6HX0okQ8Ro7vA8D+4gbgBbPi+WFCs=; b=UBDhL2/J/zyEE1ES
	R2dhUXcKJ496SiaNwrqaAJUCufFyKrbi8c8zvCV8FFRwMQoKjtwvI/p4RdIzM5MU
	yGZ4KsPjvttEEpgjItGF5hplhLM56pblraZxnB2OUYTscekRqR2SURG/rNCsDKS4
	6X9U+lzzGlXlQaW4Sk9ZlezTl6qlfF2QF3r77qaUbTC48SedJIUuBuvTyDTDDiym
	rs7K6TdyZJ89X/05yIM6DSbgyiONBaIcDiqZv9LStHj7dtrghP0WlDXJqmvfWBG2
	AEjQ6F20erx4cJT1WJhD44jqbFbWWZRrETXmR41IvAGjl31mC3lquO9AppNM3fdf
	XCB3Iw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0dyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:08:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso9662178eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016512; x=1793621312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/2wBJIeXxryjo6HX0okQ8Ro7vA8D+4gbgBbPi+WFCs=;
        b=VHwT+F5yYST8MNyZTExHxJLsQ4Mpf24sIbXSrjKjiX2skjrTdny+nMYACSPM8vYDNZ
         6xeOM+xwHDy8MYP1PJJbcN0Nh13q9Q80zrDSR35MHEdylpQ3CzRimQT671wL7WqK/x6A
         hBXNsHY4vEQVbFUObLBTUTxsuGrU+0s0+2tCxs3kJtBOso6YXYgoPLAckBje3M3FvEpt
         N82pz11iMqaaYtgjKPU/UVWj91oxNmFYlsWKcxEyp5B8NNK+q/SdBOmxdH2iYWQfFV4o
         pFryz1oBwRxyrs/s+rg8F5QFCPXCaRHtDaUOeupAPQ801gZjcZN35CRlFChkY5prhmL+
         wLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016512; x=1793621312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/2wBJIeXxryjo6HX0okQ8Ro7vA8D+4gbgBbPi+WFCs=;
        b=kjwUgggLjTNiM8ELRVneglAAlE1dfIvv5zjk34jh30l3PXsKE7nmjdKi4OM2/u2DwF
         zdo/Et1LJh7qYu5JU+YV/B0DxzNE/14eRoQEIBhNNn3kx3qQ4aLM5F79giaeIklfxy2U
         tBdsENavEkzUX02YwlOjscVP8nOXRN1NGS06cHOYXdkUdAYwXX65oexvSLBaucPHI2U5
         l/13GbtnNCKUGVozjhlorSzzGVS5aFr4uuys0MNNcmiJhVyJL+8vThjRTFDpfFadOk2k
         S2sY1aSPRt/2AqFA+Mm7Uq0XhQm7/UTE/SFvNvL11K2kxUXac2A5lJ+067fgRoWIjbMi
         YobQ==
X-Forwarded-Encrypted: i=1; AKwUvBx70DVxz7KnBIDS9HthzlKhTjvwNZYKQgxsp5imprOmOqzg3cd1Xrvn1yov9AfZTKXsE1KZQbQsEFts@vger.kernel.org
X-Gm-Message-State: AFq9FYJG561HRKLGO1JDvT8dSczhlCWJ7oMttaifnbSperTPIgSsuK0c
	18dxbqlwL4ZScBqXShz7OOJ5QphdwsDPmM1dGmB8TTlsdkeuIJ6eDrZZvS3A4VvhxCRrAlxbVP6
	8C6yo6XWxb6Y9/EympTBv0gR3pWYxJvTgdwh50tFzbaLbNO5qhA8AkKPWpTSFLckL
X-Gm-Gg: AYBFou0R4ctkmE+0SGUyo0J9OLLsq7VFnwprpgc35uC08ockTaQb6hAaQpOt1/xU8lm
	NMcOfQ2PT5Z/eeHscaS1V3Qmj3ZKPFvlTuk7RiFLlnor/thGI7c/CMhkQar9mhGgcp4pvO0/w1d
	atBj6kiDAv/UBsS3kLiEAvMF+ZRznfalvLvLj2JQPMOqpU3Lp6oSLw1KWOcOYCoE2/f/9RLCcI7
	mXDCYl+Hd/o+x/HQ7Kt+4uU36v/f0Plt1siHFoZLU+ESrLw1bDM9EPLx7b1fNoYjW/ULXCd+NJo
	KG3Mkcl7opI9v/2LmAwGQOmizFJsYiY8OO6AMZBBXezPYBgFBUayKj0XSgWiT9vLgDZZbgqOsVv
	B9s9cfG59bOrIGwDScgoS9WaPeSKE/QlM
X-Received: by 2002:a05:7301:7308:b0:368:74ca:1c5 with SMTP id 5a478bee46e88-369e861d8abmr9880674eec.37.1793016510977;
        Mon, 26 Oct 2026 05:08:30 -0700 (PDT)
X-Received: by 2002:a05:7301:7308:b0:368:74ca:1c5 with SMTP id 5a478bee46e88-369e861d8abmr9880620eec.37.1793016510298;
        Mon, 26 Oct 2026 05:08:30 -0700 (PDT)
Received: from [10.204.101.25] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm19980167eec.21.2026.10.26.05.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:08:29 -0700 (PDT)
Message-ID: <a0ed3cf6-a58d-4a74-939d-62c9e6643b79@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:38:20 +0530
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <99a419c3-81a8-4b37-b9c7-2dd56978162d@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <99a419c3-81a8-4b37-b9c7-2dd56978162d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX90zOgNeVJPgi
 tmNMCpXnZtYw6yzKN7FaacD7/zijWhy/Yw4zmoNZnrf9in8iq/Eyd8GSJ0LAAcyPHw2/UP2OsNM
 clOTEeJqGJtHArOSuF4LT3rrCwTa1wU=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf42c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=394QqUzTKF8zEEn8ObkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: S5fhX1gPOUTVgp-rBn9TbyxERbXUUmDl
X-Proofpoint-ORIG-GUID: S5fhX1gPOUTVgp-rBn9TbyxERbXUUmDl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX6lYiaRaUCWy6
 0RG+p/gq2zPED5HHEj/NYVz4bfWJX+uTs/woBKLZuPH8LPQk/wVrF6F8h+gPJUs4xgqVfXaNNi7
 z1dHEhnq/+ay+ZjH9Jni10GVh74A3KoCTHMtjFmZX3RJKeYjhRolSB/n9cwTBY2cZKPBkpUAHcc
 tH+rzltp+Vr70F9U2W/pLgb/+8PIADdLnhX5K+S+WR0fWTr5YpGeUDozypXwvzuAooZKjxpbUD1
 6/Lg4gJIdTmjr08xf3iL8Tphw6bOUSVT2ZjcWElhhPaFd/y9Zmxsewn+/H99WjJDSRNcgAL8od+
 8ZFy8YBJ+oHZNQNw8cnDjUKpoQ53XPsMXPMGvTYZBpbhbiZSg1Mwip+cnyqtS0YA63gZjFMqxov
 7kWOpmKlrdn9VLcOckjr11RoIrAadT1Uw83d+uMKZ2O9I997quYuIOwGOuE7d5+IhjGVWFd3kUR
 /l7dGZBmiwVBEiCnXNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260048


On 10/23/2026 9:11 PM, Bryan O'Donoghue wrote:
> On 26/09/2026 07:34, Vikash Garodia wrote:
>> Reserving an IOVA address using "iommu-addresses" requires it to be
>> placed in the reserved-memory node. But when "iommu-addresses" is the
>> only property being described and there is no backing "reg" (i.e. no
>> actual reserved system memory), it does not really belong under
>> /reserved-memory. A device IOVA range is specific to its own address
>> space, and does not describe the system physical memory to make it
>> qualify under reserved-memory. Given this, place "iommu-addresses"
>> inside reserved-memory only when it is paired with a "reg", otherwise,
>> define it within the device own node. It was discussed here:
>> https://lore.kernel.org/all/662f7093- 
>> fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>>
>> Existing "iommu-addresses" property expects a phandle, which does
>> not make sense when the property is defined within the device node.
>> Introduce a new property, "iommu-ranges", to specify the device
>> specific IOVA ranges when there is no backing "reg".
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/of_iommu.c | 128 +++++++++++++++++++++++++++++++++++++ 
>> +++++++---
>>   1 file changed, 121 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 
>> a18bb60f6f3dfdba853b6e16dd2a8616f6a731c7..9766a6944d0e11a6cd8b74b1b89428acffe3dfdf 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -190,6 +190,111 @@ iommu_resv_region_get_type(struct device *dev,
>>       return IOMMU_RESV_RESERVED;
>>   }
>> +/**
>> + * of_iommu_derive_resv_regions - derive reserved regions which
>> + *                                are outside of iommu-ranges
>> + * @dev: device for which to get reserved regions
>> + * @list: reserved region list
>> + *
>> + * A device can describe its own usable IOVA ranges directly on its node
>> + * via "iommu-ranges". Everything not under those ranges is derived
>> + * as a reserved region so the IOMMU allocator won't use it. Entries may
>> + * appear in any order in the property.
>> + */
>> +static void of_iommu_derive_resv_regions(struct device *dev, struct 
>> list_head *list)
>> +{
>> +    struct of_iommu_range {
>> +        struct list_head node;
>> +        phys_addr_t start;
>> +        phys_addr_t end;
>> +    } *pos, *new, *next_range;
>> +    int size, prot = IOMMU_READ | IOMMU_WRITE;
>> +    struct iommu_resv_region *region;
>> +    const __be32 *maps, *end;
>> +    struct list_head *prev;
>> +    phys_addr_t next = 0;
>> +    LIST_HEAD(ranges);
>> +
>> +    maps = of_get_property(dev->of_node, "iommu-ranges", &size);
>> +    if (!maps)
>> +        return;
>> +
>> +    end = maps + size / sizeof(__be32);
>> +
>> +    while (maps < end) {
>> +        phys_addr_t iova, iova_end;
>> +        size_t length;
>> +
>> +        maps = of_translate_dma_region(dev->of_node, maps, &iova, 
>> &length);
>> +        if (!maps) {
>> +            dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
>> +                dev->of_node);
>> +            break;
>> +        }
>> +
>> +        if (!length)
>> +            continue;
>> +
>> +        iova_end = iova + length - 1;
>> +
>> +        if (iova_end < iova) {
>> +            dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
>> +                dev->of_node);
>> +            continue;
>> +        }
>> +
>> +        prev = &ranges;
>> +        list_for_each_entry(pos, &ranges, node) {
>> +            if (pos->start > iova)
>> +                break;
>> +            prev = &pos->node;
>> +        }
>> +
>> +        new = kmalloc_obj(*new);
>> +        if (!new)
>> +            continue;
>> +
>> +        new->start = iova;
>> +        new->end = iova_end;
>> +        list_add(&new->node, prev);
>> +    }
>> +
>> +    if (list_empty(&ranges))
>> +        return;
>> +
>> +    if (of_dma_is_coherent(dev->of_node))
>> +        prot |= IOMMU_CACHE;
>> +
>> +    list_for_each_entry_safe(pos, next_range, &ranges, node) {
>> +        if (pos->start > next) {
>> +            region = iommu_alloc_resv_region(next, pos->start - next, 
>> prot,
>> +                             IOMMU_RESV_RESERVED, GFP_KERNEL);
>> +            if (region)
>> +                list_add_tail(&region->list, list);
>> +        }
>> +
>> +        if (pos->end == PHYS_ADDR_MAX)
>> +            goto exit;
>> +
>> +        if (pos->end >= next)
>> +            next = pos->end + 1;
>> +
>> +        list_del(&pos->node);
>> +        kfree(pos);
>> +    }
>> +
>> +    region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
>> +                     prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
>> +    if (region)
>> +        list_add_tail(&region->list, list);
>> +
>> +exit:
>> +    list_for_each_entry_safe(pos, next_range, &ranges, node) {
>> +        list_del(&pos->node);
>> +        kfree(pos);
>> +    }
>> +}
>> +
>>   /**
>>    * of_iommu_get_resv_regions - reserved region driver helper for 
>> device tree
>>    * @dev: device for which to get reserved regions
>> @@ -214,10 +319,14 @@ void of_iommu_get_resv_regions(struct device 
>> *dev, struct list_head *list)
>>           memset(&phys, 0, sizeof(phys));
>> +        maps = of_get_property(it.node, "iommu-addresses", &size);
>> +        if (!maps)
>> +            continue;
>> +
>>           /*
>> -         * The "reg" property is optional and can be omitted by 
>> reserved-memory regions
>> -         * that represent reservations in the IOVA space, which are 
>> regions that should
>> -         * not be mapped.
>> +         * "iommu-addresses" must be used in combination with a "reg" 
>> that provides
>> +         * the physical address and size of this memory region, for 
>> an identity 1:1
>> +         * IOVA mapping to that physical memory.
>>            */
>>           if (of_property_present(it.node, "reg")) {
>>               err = of_address_to_resource(it.node, 0, &phys);
>> @@ -226,11 +335,11 @@ void of_iommu_get_resv_regions(struct device 
>> *dev, struct list_head *list)
>>                       it.node, err);
>>                   continue;
>>               }
>> -        }
>> -
>> -        maps = of_get_property(it.node, "iommu-addresses", &size);
>> -        if (!maps)
>> +        } else {
>> +            dev_err(dev, "%pOF: iommu-addresses requires a reg 
>> property\n",
>> +                it.node);
>>               continue;
>> +        }
> 
> The if/else doesn't belong in a path entitled 'Add support for "iommu- 
> ranges"' as this changes he behaviour of iommu-addresses independently 
> of whatever iommu-ranges does.
> 
> The reg update part basically has nothing to do with this series at all 
> i.e. the code you depend on later in this series doesn't declare iommu- 
> addresses so... this is an update to align with a DT schema change.
> 
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> Perhaps splitting this into two patches as an iommu-series would be best.

Intention was to keep the patch to add iommu-ranges property as part of 
iris driver patches to show the usage of this new property.

I am fine either ways, whatever it takes for the maintainers of this 
file to review.

Regards,
Vikash

>>           end = maps + size / sizeof(__be32);
>> @@ -258,6 +367,9 @@ void of_iommu_get_resv_regions(struct device *dev, 
>> struct list_head *list)
>>                   }
>>                   type = iommu_resv_region_get_type(dev, &phys, iova, 
>> length);
>> +                if (type != IOMMU_RESV_DIRECT)
>> +                    continue;
>> +
> 
> If you look in iommu_resv_region_get_type() you can emit
> 
>          dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] 
> as reservation\n", phys,
>                   &start, &end);
>          return IOMMU_RESV_RESERVED;
> 
> on a mismatch - which is not what the code will do now. Mismatch will 
> warn and then not map.
> 
> So maybe dev_err() saying you won't map - in the new patch for reg. 
> Either way this isn't a change specific to iommu-ranges.
> 
>>                   region = iommu_alloc_resv_region(iova, length, prot, 
>> type,
>>                                    GFP_KERNEL);
>>                   if (region)
>> @@ -265,6 +377,8 @@ void of_iommu_get_resv_regions(struct device *dev, 
>> struct list_head *list)
>>               }
>>           }
>>       }
>> +
>> +    of_iommu_derive_resv_regions(dev, list);
>>   #endif
>>   }
>>   EXPORT_SYMBOL(of_iommu_get_resv_regions);
>>
> 

