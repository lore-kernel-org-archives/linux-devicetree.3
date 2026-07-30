Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8241B3D954C
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401182; cv=none; b=mSqJLNJabJsL7xZ47aCRIzzBmIoXfPRHyaGQs/Nfq9tMSec0eSXH5K2NH9nb5IE1EcguAEo5kJhFBgRkB9zgJOicI/OfcSR5atZvopXOoOE834PSDo0c/ChwkQd01IC42HC+eqM3HBfYcfWs7+rXH2PDuG1MbmI1z9/cN1v7u3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401182; c=relaxed/simple;
	bh=u/3Gho46m+IKsLGDs1Odd9EXyYYA4N3c+swlMMYhuLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxNKqVnazMQGGCPFoZNQkMCLP9AF32s+2mn39R3zkqUsUexq4lQgIE6w49KYrHfj1WuJCKVpEMcq9Nyu9GCWs2AZE/5eIilkhMAHtXGin0WCvVJrslWKJImrrw+nRKNFqolqv1oImzILXFiwi45LgeV0G1YApGbwRIrWI3y+4n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ8K2ym9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KM0GJPyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ8K2ym9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KM0GJPyM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8buqZ090200
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKH6sZ6qLExth2yi+RD8M8xlUwBXb9XX9ejIrfjRgoU=; b=DZ8K2ym91W0CX9dS
	B68QNMuqDHLM55CQH9//XbRMerBlvcNrKLhDthojZThZ6qtVGIv565dl17WGNgVk
	tRqXxe8AaIptIZrCMKAGyLTRfuBFXFAKjwW9uqlzS9hbbt0Ybnnv41xYuUtWxlXw
	vdeikl3cn31oyek5RLirGNn6W19NuWBoKV1WGoTsLng4enc3XgmF/u41J6J1zPLA
	RhTYHQamRRq6gS2dlv3KLazk+UOQ31nfUK1Qb2JH+z/+y6ge5aReEpoDmnet/T+4
	p59QKVGRLdmX2Cac0qREKJOrDNhR1TJXaxMr53U4c69pFRkSrkjiFql0ZAkH7Kc/
	s8M4gw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr398012t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:46:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so41967305ad.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401179; x=1786005979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKH6sZ6qLExth2yi+RD8M8xlUwBXb9XX9ejIrfjRgoU=;
        b=KM0GJPyM0PV8QfE5vplxjIBoInPul1w145093T1T8vPowUiEo/mFx23sdMZydL7ICA
         jMbk6VsHwmqYeNQEgR79aZK7r/pYezyCgwkzrgyFnnDBF99+pm4zB38pUc2hgS/bGVFv
         EeByas5171j46ohc6lhPfV2d9qtj3WGEzOGZxmL2pRFdUpIDtpIdAS9tAriYrghA6jnq
         CuZoqoFSdg/kgMOwTmCrjRdQN9gT5ViE7MYFbdfLnzTQ8yduPMYWqSh52w27Dhk/ANgg
         OtKUc6MgwQJwzzHIn5hdGE71lALnktmvhqC12K2VAIYarGSFsPEuUsloY+9wGrBjrl9u
         vcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401179; x=1786005979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKH6sZ6qLExth2yi+RD8M8xlUwBXb9XX9ejIrfjRgoU=;
        b=cTja6c7f9oRkAv/HPNl2sdlRMgZbPufD+ieUD0l327cz7GEBoRAG1QcFG3v5S/uiJv
         /ief0z5/6d//3xBy+MgR5XJeEPE5LfFJFh9CJsqf9y15K21gLWNr4B9D0YV0DOtlNHXX
         1FYaJ04jF0y3lGBWshnOeCSKJxcst2dD0wGejLndAnOLc5hDfAVxMCQu22Bsy9cGtWc4
         YivoBBrV0w8Vem9Lvav40rlRWv3LzErcUg3pyHt82PkNDOi5l41rvQ5/npeOR9m8kkZ7
         3bHgisUM0bpcLg5x6xJFYAO8bsERpt2/sF80l/QObVaWJ0GAKrF3XN3HM1ZIMT81dwcf
         dxhQ==
X-Gm-Message-State: AOJu0YxfYT2tTVI1BM5UdID6VkZzAGW4St0LAoBnAOcQQIhToWefoIzg
	EjZS7S52tPeUcl9hfSyH40aX0r3XDCWiQpH8HnUWGa7282U5N99/UmIHTegi27OtcFgO3xiMgrP
	6QcoNEAFfQJEoCvyEzWbKv0zMyfyGVEfxk/Z0Sk4in0g2eImEF8Kfzq0XCe7Znd17
X-Gm-Gg: AR+sD1288BmKpSL10sjjTdJp6LfV6Dp86MOzbcWSZ/BjBSdwDuPpFC7MbKLdWpZMj9o
	Lxd0PI209swbo8YBLudNI4OCFQbxCbmEdefuw/Bdy3v3u7fozbcwF8xR9hNEgMdqsxBXsnO7wJA
	s9SmoV7Ns0q+4ACV3MCFEfPPTWATaa0I8GVnNQQ7gJ+bajihvevvwDvy0eC3WvZmKKFnyG8MJAe
	ViRlEwZ2Ej/jatB+FCE11Is9SF4xSAndy3rASgKlZqHVG5/sCS6u4v+bfV4uxRao1z3uTK90N1f
	aFSw5BFo7DgqnDxHdXuobkq3WrZKpWGy/5V/FASC+qpfBjQUw0hTx4iRN+WfzonEaO7SZL73QmL
	1W8myflWpboZYzf6pCBvmXXNg8F+/Zp8JG18M1xdXMKO75QMFvSE+WI4tSVwKXxEBxGgfqDx2
X-Received: by 2002:a17:903:2f81:b0:2cc:5f48:5764 with SMTP id d9443c01a7336-2d035d0b929mr16894285ad.44.1785401178780;
        Thu, 30 Jul 2026 01:46:18 -0700 (PDT)
X-Received: by 2002:a17:903:2f81:b0:2cc:5f48:5764 with SMTP id d9443c01a7336-2d035d0b929mr16894045ad.44.1785401178322;
        Thu, 30 Jul 2026 01:46:18 -0700 (PDT)
Received: from [10.133.33.210] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a7e333sm23267925ad.36.2026.07.30.01.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 01:46:17 -0700 (PDT)
Message-ID: <bb8ce65f-755f-4f47-9f0e-5421d6856b76@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:46:11 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-7-songwei.chai@oss.qualcomm.com>
 <20260730081830.43D6F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <20260730081830.43D6F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WOtPmHsR c=1 sm=1 tr=0 ts=6a6b0f5b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=spI2WGiqmeZJrFT2-h0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2MiBTYWx0ZWRfX4OC6Z6zw9ijz
 taWjw2nFG8OkG/e7Wmq1PMCiDc0uaLgrwb+caeGlZzjn2Zr4zBJ4z10/1ttmXQO8E/ScUKYpjfi
 dP8zUXBfT5rkOIf2h/IpmFrbPMQyiNyN9btbxN5xFnGE18YzDQhB80xbFncNz/SAzGP4zQN9y5x
 cJx+nXpWtt2uPjQc/jRCt9O+XnLQL7rjVXeKkuY6SGDGav2l3rWpZCkwSEm0asGfOLqpWXit/b/
 7EpQ4p/O6IQ8kDCK+Z8UfSNGd0fvDlvwfrNsJ93bcs7sqk/DSLs8KckuDm9swAQdBBatbyD3DiH
 cL3eV7ATQoLTEkOZX8nX1OZOz0aFT2K9NeHouWqnHlFzmxHhwqTGnhXdbdyi7hVYugEP78OfLFm
 mUYNiXoM3oGDUUqUwm5c08gkGd8eZWhnePpVLP3diwJNC5dYLMRrDa/kRmWQPr6AoWGIxmDkMyE
 GTLY5vSsFhM0hp2EzxQ==
X-Proofpoint-ORIG-GUID: oEVy7cl5NgyeaazHVRN6Hk3nmMhghpNg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2MiBTYWx0ZWRfX7IUsHD09nMr0
 uG9q5P6zSG12KW9frrPH2EZH/27cot0i9Q8jjKtf8bF9EPC2Wr+iankejzKKa9yguCDv31Fsybk
 MgfiyjZzd8WE1QXfDuS2verncd4Uj+g=
X-Proofpoint-GUID: oEVy7cl5NgyeaazHVRN6Hk3nmMhghpNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300062


On 7/30/2026 4:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incorrect mapping of missing hardware timer and counter registers causes out-of-order register writes.
> --
>
> --- Patch [6]: [PATCH v16 6/7] qcom-tgu: Add timer/counter functionality for TGU ---
> commit db9df0865ab2140ab0eb7823166108ce956f637e
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add timer/counter functionality for TGU
>
> This commit adds timer and counter functionality for each step in the TGU
> driver. It determines the number of timers and counters by reading the DEVID2
> register, allocates necessary memory, and exposes sysfs attributes for user
> configuration.
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 7f0a74514e40f..ea83273a628c5 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
> [ ... ]
>> @@ -236,6 +266,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>>   				drvdata->base + CONDITION_SELECT_STEP(i, j));
>>   		}
>>   	}
>> +
>> +	for (i = 0; i < drvdata->num_step; i++) {
>> +		for (j = 0; j < drvdata->num_timer; j++) {
>> +			index = check_array_location(drvdata, i, TGU_TIMER, j);
>> +
>> +			if (index == -EINVAL)
>> +				goto exit;
>> +
>> +			writel(drvdata->value_table->timer[index],
>> +				drvdata->base + TIMER_COMPARE_STEP(i, j));
> [Severity: High]
> Does this code handle sparse timers correctly? If the hardware implements a
> non-contiguous set of timers (e.g. TIMER1 is present but TIMER0 is absent),
> tgu_set_timer_counter() will set num_timers to 1.
>
> Since num_timers is 1, j will be 0 here. This writes to TIMER_COMPARE_STEP(i, 0)
> instead of TIMER_COMPARE_STEP(i, 1). Could writing to an unimplemented
> or unclocked register cause an asynchronous external abort?


Clarification：
All three comments point to the same underlying concern: that sparse 
timer/counter allocation (e.g. TIMER1 present but TIMER0 absent) could 
cause the count-based index to map to the wrong hardware register.
However, according to the hardware specification, timers and counters 
are allocated contiguously — TIMER1 cannot be present without TIMER0.
The same applies to counters. Therefore the sparse case cannot occur, 
and the count-based approach is correct.
>
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < drvdata->num_step; i++) {
>> +		for (j = 0; j < drvdata->num_counter; j++) {
>> +			index = check_array_location(drvdata, i, TGU_COUNTER, j);
>> +
>> +			if (index == -EINVAL)
>> +				goto exit;
>> +
>> +			writel(drvdata->value_table->counter[index],
>> +				drvdata->base + COUNTER_COMPARE_STEP(i, j));
> [Severity: High]
> Can the same issue happen for sparse counters, where we map to the wrong
> hardware register if COUNTER1 is present but COUNTER0 is absent?
>
>> +		}
>> +	}
>>   	/* Enable TGU to program the triggers */
>>   	writel(1, drvdata->base + TGU_CONTROL);
>>   exit:
> [ ... ]
>> @@ -316,6 +370,27 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>>   		drvdata->num_condition_select = TGU_MAX_CONDITION_SELECT;
>>   }
>>   
>> +static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
>> +{
>> +	int num_timers = 0, num_counters = 0;
>> +	u32 devid2;
>> +
>> +	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
>> +
>> +	if (TGU_DEVID2_TIMER0(devid2))
>> +		num_timers++;
>> +	if (TGU_DEVID2_TIMER1(devid2))
>> +		num_timers++;
> [Severity: High]
> If TIMER0 is absent but TIMER1 is present, this collapses the presence bits
> into a single count of 1, losing the index mapping used when writing to the
> hardware registers above.
>
>> +
>> +	if (TGU_DEVID2_COUNTER0(devid2))
>> +		num_counters++;
>> +	if (TGU_DEVID2_COUNTER1(devid2))
>> +		num_counters++;
>> +
>> +	drvdata->num_timer = num_timers;
>> +	drvdata->num_counter = num_counters;
>> +}
