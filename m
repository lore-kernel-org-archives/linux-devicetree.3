Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550067;
	b=GN/G3CCrU9f9dHy34IfeA9RyOENP8WU36pLbd7ynELWzJxJkcI81jZA+PTu1JNdU0ajd
	 mh0uvL9vlPnv1wYwmsgtKClVSaSX5P1yd1KBL8nnrmjpcvSANfAH9wbsM5RMnVrmr56h5
	 SodBCXCebGoOlEgoOS2sj2wrDz+w7RHh6kFCvY/G5k7Kjpo0raF9GhIuGK4LjxFXX1Gh+
	 93pNg6yRpfvEQ0k64yYFa2OEUtLY1LOXrd3AC9XruVeFDC+wyLshW40xgJZu2bhrFq3wD
	 OjsVjjvioxsT9Goo49BWXbmpooxODcS0yA249z0FB69MSqMhF7pQItqVOTzITpWXHJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2x3TZ8F862pBhusm32BXj5hqGQYk+ST7Iak5ml3obX8=;
	b=es6n521CcdtOMiZWIObUGabNfJGLBN3hOQ8hNyBIBeaLfoZ0GGkIxS4md9F/rv5hu4GI
	 7FzuvIZBRnxWF9tNmPpYIWFbftTclSKivZUvaKDjRQWqcX+9WIP7szUJaMk/DZeFSZArK
	 aXLrlh1BVih+cpPlfHZFTl0owC9J29FpOUijXQukYWtqbgfz25Qk8aLWTZUEOfvCnk/7E
	 2CUwkQiVWI+oYVAla+67L+2S8bbQWCPTB7kZaKuagE68dOavMNoHBPnrugyKuhUwccyiR
	 au5gxqgtqzLb/7ZbBaOl6Sg2mwFT3IGLbbnmvxTSAlZAQ39hp8OF0pMcrDPOru3VUdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PAUfoIgz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cKIAHH/b";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BC6606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03BC6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PAUfoIgz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKIAHH/b
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576lZ073405
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2x3TZ8F862pBhusm32BXj5hqGQYk+ST7Iak5ml3obX8=; b=PAUfoIgzarksVUyl
	XPv5Nz6jj6f6eOfdd5efZeeQ1WX0Wqouy4s+/S26eRVFePc/y5chl6XV2F8Cq0QO
	nycNEvoanWAmNGiGl4/DZRvDpovjX7qG2B7dB/mQwNBJcp7n4tHxO9naVXH0Cq1Q
	j/7WHvYlmvdJy1uhlvaFYmnIys3MC5Mb8Kol9GShiPdwL5nKgTktrBniAuBQSDFP
	+0hzvV1f+URgDecKHpq/HTJDmvo58cvEPPMcib7ZJplq/oC7/dvThzh+O8LVk8on
	TFAwF5n8N1ronC9TW+xJbrYD5Whesc09QXzKyWREFj23SRQ5WHK8+2EgxX+w5DTB
	/4L9xA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs03r81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:07:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso11230495ad.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794550065; x=1795154865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2x3TZ8F862pBhusm32BXj5hqGQYk+ST7Iak5ml3obX8=;
        b=cKIAHH/bM0rlusBdomHaNqJ0zmDxd/ka4RJ/VfZUpvy2LUgwXePJI6beHJ/K6Z1rtu
         /XHlz3gnGACjlmZkepQMHP44HaVBx2v7VJIw2U/26fRRQIfR/h5uCBFCXizz96bQZgN/
         OSt7lltDQmvKTRedTu57Ao6tdCNYJaa90BJfC2BBuIC9CbgnXPfNIk/Dy9ZLrTgh1DEy
         TzMjruBR0rrlI3RMzyYQAK3tsWnDAyx7Zgw7EmMB8AW7EuvUFcSX/4jIA3CsueOj8AcF
         q+HAslgHwwrwgOt2qE9whHvTL2ggCSpZ2AL671pBRxCktG5Cyjhi7TrVw622qEGk+AyD
         sezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550065; x=1795154865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2x3TZ8F862pBhusm32BXj5hqGQYk+ST7Iak5ml3obX8=;
        b=eEF9eVuwIHYGRY/zz7on2iLBocPJ+O7NKJFil8PknHLr+eksGq0978e3JtM6tUESn2
         rYObGwy2P4yYmp0DyQgGcjUMgVCXzzgtuc4acB7fPBx+u+I+sDR2iS6KL+Ao8setrsf/
         Jnya7CnRHSbE8NjXQLsu0AEL9DTSGZ+/gR+h1TtCAseS4gS6oxcvza//ld4hwmu0iaWQ
         e/b8oKeyY9zuSu0ib8N0nLhnDVR5mxW5UyFAEr6gSk3frKURXwn4Q5OGj8yYp7GGuI4b
         Rgi2MEptLVYt8so7wRvPfr+QUu2merTlI1m1Z3jzVufBaTopyHshJdpzQnyOD3pnkyuU
         Ni1A==
X-Gm-Message-State: APuU4Z+yUGLfM6Enmb4EA100/PQDXYzsOQ3881FiOwx0eO98/raz4fvs
	aSWt9djm02dPlsnNADu4iM0baSoVxBqxFue2ItoIa2o2Abs6iruX7F3Bn2k0tUvz9o1V7WzBBDh
	V6cxjVQlquXvmCQSxZMFtGo5JJCC8PzP3kaeXej4OIDqEf7drAAQ/NnMM3cN4zc2E
X-Gm-Gg: AYBFou22l0X82i3AHlOkJ083WQOuVI1gV8rMLqzzOhH5CP/XW6eTjeIGx4YRe4FQbdp
	ijAU7KCo3mt7MWhewN1QBVUNzu+v3kkle3KpCMbBd6rTwqM+rJUXNbr574WwCg7bT/wnKW5yfR4
	hEKpx+w9ArtONDtfkyqFjfbgDNCKJ59L7oXK4+vwFw1cefxlkYVAak2d8q64st9RA+rE/WCxwoy
	ZD7tBKk8giZU71GbUBTIC6oxFZ25cvIgOPpBsNJ1v3GSGNfgZPQN9salHU+0tKHLtn7Eig7+Cth
	j0TQ8MDoELxjkfll+LKa1o7FJrHZA1laMnz7Yz7KNlAEQ2YA5UcrDI3u3/pi8SA7r23XPrk8k22
	E/6EZApFBIs0SY0e1XUA6HsrflHis+9b1mh0wxHHfF/hK2X+OeUrtOb0tO+p+wVgzQ1k2/wDwmD
	IS7sE=
X-Received: by 2002:a17:90a:c2ce:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b1b0d3b75fmr1260189a91.58.1794550064835;
        Thu, 12 Nov 2026 22:07:44 -0800 (PST)
X-Received: by 2002:a17:90a:c2ce:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b1b0d3b75fmr1260169a91.58.1794550064369;
        Thu, 12 Nov 2026 22:07:44 -0800 (PST)
Received: from [10.239.133.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec63b9bsm2850307a91.12.2026.11.12.22.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:07:44 -0800 (PST)
Message-ID: <ea103c7b-217c-461c-b5e7-401b78ade7df@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:07:41 +0800
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
Subject: Re: [PATCH v17 09/10] qcom-tgu: Add timer/counter functionality for
 TGU
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-10-songwei.chai@oss.qualcomm.com>
 <sashiko-outbox-212117@kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-212117@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX8AQfrgghegIN
 /hyxBEDKOLiqAgRKiOvT0EIVOF71AUu3AlHO2/bAVA2emJUi/z5sbfp6E05+gOicfUUemCRwVLb
 mnS8CHsP6FAxjKL8q/dS9czYV7jGRWmbTNXM2qsI6nbe13DKRXcAVWkIhCgy5/zfD8RRf5JODcV
 tXxTr6M2zhz0zE58Axn/2UCAGb+VB+mh5b1V0GDTYHNP20GH7CVFPusSOlJs0YsMxKkWt/7XAZg
 1ZADtFiqMmMhK08HW2bGE1T6E78OuJvAA8RV2ZhTTvRF1PtFZaLZIgQUtW65F8Edk6bSR1qXpYa
 rR0+TB9LsiWKB0AOKIYr7KhfRmAEt+Xouh11GMQXoXFmi0Ka/6UoqJaq1rTOdHW9X7I8dIwa2C5
 JStDbcE1DicYsSA0684Jk3cJKFXc7tHqPaPMkBEDe/edtIzUjyOnIlHZJ/mRK2keotGcgSMWngf
 s2tOdcXuYaaxolUADig==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6a931 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=znVQ-4POmxq_k8OWJtUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfXynla+0zJSzet
 OcDYOQhy5t3n+MLFHhRuGOHy7T9OTanEMw/3H/NV5/UGTWsK6JMwOJxIx3/t6PHRLYgq1n/jhQa
 hs+TnMPPCaglHbpklTrSQDK0xu9+fWk=
X-Proofpoint-GUID: l6Z0AUNRgjnOm7koeYA8x8NiXjKhyfNQ
X-Proofpoint-ORIG-GUID: l6Z0AUNRgjnOm7koeYA8x8NiXjKhyfNQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130024


On 11/13/2026 11:01 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] qcom-tgu: swapped step_index and operation_index in
>    tgu_dataset_rw()
> --
>
> commit 55838204d9ea620c8df4d9d4233a3561aeb9ea39
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add timer/counter functionality for TGU
>
> This commit adds per-step timer and counter sysfs attributes and hardware
> register programming for the Qualcomm Trigger Generation Unit (TGU).
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 6e66752a7b8dd..1cb131a3c5213 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
> [ ... ]
>
>> @@ -496,6 +566,38 @@ static const struct attribute_group tgu_common_grp = {
>>   		.name = "step" #step "_condition_select" \
>>   	})
>>   
>> +#define STEP_TIMER(step_index, reg_num) \
>> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
>> +
>> +#define STEP_TIMER_LIST(step_index) \
>> +	{STEP_TIMER(step_index, 0), \
>> +	 STEP_TIMER(step_index, 1), \
>> +	 NULL                       \
>> +	}
>> +
>> +#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
>> +	(&(const struct attribute_group){\
>> +		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
>> +		.is_visible = tgu_node_visible,\
>> +		.name = "step" #step "_timer" \
>> +	})
>> +
>> +#define STEP_COUNTER(step_index, reg_num) \
>> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
> [Severity: High]
> Do STEP_TIMER() and STEP_COUNTER() initialize operation_index and
> step_index in the wrong order via tgu_dataset_rw()?
>
> drivers/hwtracing/qcom/tgu.c:
>      struct tgu_attribute {
>      	struct device_attribute attr;
>      	enum operation_index operation_index;
>      	u8 step_index;
>      	u8 reg_num;
>      };
>      ...
>      #define tgu_dataset_rw(name, step_index, priority, reg_num)              \
>      	(&((struct tgu_attribute[]){ {                                   \
>      		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>      		step_index,                                              \
>      		priority,                                                \
>      		reg_num,                                                 \
>      	} })[0].attr.attr)
>
> Because tgu_dataset_rw() initializes struct tgu_attribute positionally,
> every timer and counter attribute gets tgu_attr->operation_index set to
> step_index (0..7) and tgu_attr->step_index set to TGU_TIMER (6) or
> TGU_COUNTER (7).
>
> In tgu_node_visible(), tgu_attr->step_index >= drvdata->num_step hides all
> timer groups when num_step <= 6 and all counter groups when num_step <= 7.
> When visible, tgu_dataset_show() and tgu_dataset_store() switch on
> operation_index and read or write priority, condition_decode, and
> condition_select for steps 6 and 7 instead of drvdata->timer and
> drvdata->counter.  Conversely, adding TGU_TIMER (6) and TGU_COUNTER (7) to
> enum operation_index causes the existing step 6 and step 7 priority,
> condition_decode, and condition_select attributes (which also use
> tgu_dataset_rw()) to be dispatched as TGU_TIMER and TGU_COUNTER.
Same issue as patch 6
>
