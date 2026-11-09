Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219387;
	b=x7vHDwBGCUsDffwdBjCbPdWCodeR8sYwssjewh6IrD9s0LgOEYCH+FAYXkXwCpha5vvE
	 9yxF5Fb/TGekJmCSGQh8uyAJIW8mveBRnNTm7JVf9dgGXp4W8a6V9KfhLSOIgf8LVIB84
	 bhxuPBchaOs+Fb/dvkTUGKZcHU77jLrrn7XiQVjFBJBcdj4BNIzQz+5JObLHlZOCpN/c+
	 c6fRe6dJyxf7HGJzlYQzGBBxzFAp7NMhbtWClepKu8/bNxOx49irIdmNWQ54d272z5EGy
	 kAIo8B4h2Tqb9I3y3d99Lu97L83h0FWl25P6GGb/Ueqcyi60esiia4ZtFDfJJl4iVbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sU6Tteo7EgsZGvRvlD7HYXLZDGynQ8f3jIkOaXQPzOg=;
	b=bKoUfslUGXVB8FCIBzohMV92U1J2JQAMnAaeKARm9uKBrGJ3dCkB/KfmFbyDttizAQXD
	 Nxlh7YnYb3RME311z51F+GBd+FC/+Yrk+RnYygr1Cv/KLsO2hSv0YbnGnmy0If+hDCZa4
	 ieLhu9vQwYKG03llcI3BHBK0Bb/L+ZAztB8McqRgXcZIkyB+d/yvbSHtCe5iwtWP470g0
	 ziGBWjsviGR1vPjLiD0uldNW9SKBqUY5fBgvW4W3vSzX2OqdD1uXPnFtHz/s93VobfovG
	 GDGlu+Kz1G6FXXvwInCMaBng4aAxwP/E7DjhM1Gy+XYLwTyijqfK0Af+sbnJNtNlOIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXlxouF5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1m8ZRbf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82189606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82189606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXlxouF5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1m8ZRbf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99unvx4077649
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 10:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sU6Tteo7EgsZGvRvlD7HYXLZDGynQ8f3jIkOaXQPzOg=; b=NXlxouF5IGxXoiTH
	50V/SYfTdmP9WAzj9hMz/9CSK4E4ap82vuPHkP9piINQ4H3a1nqz+CbsHHDFLzLT
	Vj6Ssz8yD3PBfHyxlsZ6h8vph/HcfeyShlFjCHe/zkhot77Egxv+s+vFx9Y9krhA
	zAYG+PlDmvRbcLIU2pV1IE6r6/BJdzQsc5kMc1fj5Ruz8OtUum6Rp3Gqr1/bzGZD
	0AeDJH6dDUXcY4u/t6arryEtou0wcn0JRlt+CHSYyw1Oj/RVvvK6LHMq17nrWFUb
	6q0EYpzwtv4D3fmS0bms7doswiGzPJLTKj0swbyIRxJpgSx2TyMTI51kqHW1bvbU
	wS0TBA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735t65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 10:16:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so814636a12.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794219386; x=1794824186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sU6Tteo7EgsZGvRvlD7HYXLZDGynQ8f3jIkOaXQPzOg=;
        b=J1m8ZRbfvfSSahFH2t4M3sxy9YWFA163L+/xH0nRqpkc/Ssr526pM1RhhivVqgS0Wy
         weJMTIVV7InfAiz/0egezSDy0okirWYzide7qOT85dfm/Z/zui2iteptL9HN3YfcMfIm
         QX9G8p+MsjzS1M67nH9sG2JgsuAIqFOveOmdjOCuvnRr1DRn95mExLAUnvkpV37qFbVR
         Y1fy7QKgT4d3U3DBEW8I9u/+MnCBrsQPXi/VX1LntR0RG3vzPaRntocW60jnQVxM+T8j
         o1puRrYHESitub9pXlJP76YBUB91d6FxWFZUrYk90KACUEJgO/QtlWJn3qDBN4p7BBWO
         uj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219386; x=1794824186;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU6Tteo7EgsZGvRvlD7HYXLZDGynQ8f3jIkOaXQPzOg=;
        b=tDyMVFMt377ZawSP5CZKwhl3uAoXXzAdPxsSigBnXHTvq57E3ibgkNSZrolDidR7Ji
         zV6cMXTAsctQuIc/19a3ou/FP1QrW+lIEYFQaxVVWgTDhlWucwlcFw6IWCZOoPX6Va+c
         AqABgjIxdOcQpQErtGb/TIE1ajP4wIS1t80iPXzc4+waNtGmb+ezs0NERhtYGXSPnyNE
         x8UW3gnY9pQKdzBcGouobwIiQANPnv+C3JY1CQjhkS+zWS4bwYpobTVIUMdMCb8yK92x
         EJ/DLyrTC8TmyvTKbZzbWBM03SG1YmCLVZKdy0sG+/DwzLqP+J2SdIIbthQlXP1sOwND
         Za3g==
X-Forwarded-Encrypted: i=1; AL+hErE1mCTX24/As+RmiUnwsQBlRUAHWlx4+uCcHp7yvhjuwBcW1YkCcLqJNOnC8DnBKyfc2bfiJHQrM40X@vger.kernel.org
X-Gm-Message-State: APuU4Z91LOxWt3Wx2I6/Fbh0m7Rsx0WV1cO9L4DoOm8t+bs5T7r1gFNf
	7TcsdjWhYQaiuOVSzk1BweRD7szK0u5qaxPZgy7oERqELjO9S+X3NPViuAZaZivlVO1mtrahgst
	XZB4ev02BhFqhH+e+7v9FzHOjkp/LQ+1wzxHlAFWUQLEZXdRX4MpB0rMCMwnDabXe
X-Gm-Gg: AYBFou26wSTrhFVKHk2299q9+s/s6DH71997C1/sSq+6C1jVqgCzikbzh4qFFct36gm
	0giYVkOMH2qEqfBca5XSt8bN/bVEhBvwjoxAuGD0kpSKsjTdbcjoUa3m7UulI7OaI2y+rzHj9dL
	DgD7+mtObDFqvC2xjOqauzZ2SBJT8EhwUc/2mKDPypA8jAgScuTa75zKKyJXHTFQO9WyOryTJf/
	FnomOwLqCGfUs6d0DXZZfPWTmW/S/s0Ox1dv1Pd6xOMdWu1gA+EQ7bxzfGIrTfS9836pyIYHtf2
	GqrnYIAl7tc+PPM86G5Ar0Qby2WtS39n0cln6mF6WvKcUD6jFEuhutvKQ2RdvuXYZRXQxdic/mf
	NK8pVajgRrXyc2bXT2ruRf3olBcZUoKBzeUEYK1BP/bB1/QT2cvrDV6gZ/kghwi07evYv5f8j/D
	rVUkjiefQ7YFvRjXTuD9clOPgaYAN+aE+iAApJNneEIT8=
X-Received: by 2002:a17:90b:55cf:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3b12d582e7cmr3322429a91.57.1794219385862;
        Mon, 09 Nov 2026 02:16:25 -0800 (PST)
X-Received: by 2002:a17:90b:55cf:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3b12d582e7cmr3322403a91.57.1794219385318;
        Mon, 09 Nov 2026 02:16:25 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105904951sm10442480a91.16.2026.11.09.02.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:16:24 -0800 (PST)
Message-ID: <093f7cda-c6ef-43ab-bf79-8200a40bbc7f@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 18:16:15 +0800
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
Subject: Re: [PATCH v16 3/7] qcom-tgu: Add signal priority support
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
 <9d450f18-2300-4ead-981b-94bd9eea9126@arm.com>
 <f1e4f462-2aba-470d-84e4-87a12c2a13d3@arm.com>
 <75364e56-62d3-4d3f-bf79-03ddeaee1121@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <75364e56-62d3-4d3f-bf79-03ddeaee1121@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX2x7RcntJnmcD
 oNWLx77FDq2vj+4SPng7nSMuk7juWANGNgGzN4ueFALl7yhjYh308ZC9V7Y6Ax80xl+4xmRPzzG
 T1fr2Bq2ak+Ov2hoU1U63xOnycB5ZNHidDKIU46ktxZusemehCfXSlb6bmvprTvrWPEuH/2bgwh
 qsKVTALEPDcJ/tUN1eYb58QuvFTwSzzHnjNmYyzzhWQDSqH4r0UAI9+9PbeNwNsxIJBub9ESBtu
 6paWCsJuGGcHMDwedN+/Sj0S2ZQDa1DEdh5j5MOlJwTg1CiE9KfBBM73Nny+CtMzUYe2rzM5cdA
 dR1g/IvIoJ40FgoE98xhG++8Wy++5rAkaU6pUhKcL6yojhkILih4zS71TGIxwisnBgmntCxKFfQ
 M84c04AqjHBy0ipC1E6R6w6QcWi//Mtzw6+WD0tgFH+BRtHV71ww0HaFHYEMzHgVjFj6hCOUU/D
 K44CRhnVS6c9yDs91pw==
X-Proofpoint-ORIG-GUID: 8JDgfJIt_S5Xzko8l5qBhrkH06FyZthr
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af19d7a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=600ImXwT8V8y3K12yXwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX1nHmZHL+vwVL
 7DtfLR0VMVBlktt2rCorCJcENadRoU15Ma9jj7SoNd+KZDT4BhlrkuwdjSHwo+NkRIA4wmM536E
 p6BvDJ/qYd5t9xVdOdQq0K15L5PzkKg=
X-Proofpoint-GUID: 8JDgfJIt_S5Xzko8l5qBhrkH06FyZthr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040


On 11/5/2026 10:32 PM, Suzuki K Poulose wrote:
>
>
> On 05/11/2026 14:14, Suzuki K Poulose wrote:
>>
>> On 05/11/2026 13:01, Suzuki K Poulose wrote:
>>> On 30/07/2026 09:07, Songwei Chai wrote:
>>>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>>>> configured in each step and the trigger will be created once the
>>>> requirements are met. Add priority functionality here to sort the
>>>> signals into different priorities. The signal which is wanted could
>>>> be configured in each step's priority node, the larger number means
>>>> the higher priority and the signal with higher priority will be sensed
>>>> more preferentially.
>>>>
>>>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>>> ---
>>>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>>>   drivers/hwtracing/qcom/tgu.c                  | 189 
>>>> +++++++++++++++++-
>>>>   drivers/hwtracing/qcom/tgu.h                  | 133 ++++++++++++
>>>>   3 files changed, 328 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>>>> b/ Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>>> index 36ab64f1e301..7dd24314592d 100644
>>>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>>> @@ -7,3 +7,10 @@ Description:
>>>>           Accepts only one of the 2 values -  0 or 1.
>>>>           0 : disable TGU.
>>>>           1 : enable TGU.
>>>> +
>>>> +What:        /sys/bus/amba/devices/<tgu-name>/ 
>>>> step[0:7]_priority[0:3]/reg[0:17]
>>>> +Date:        August 2026
>>>> +KernelVersion:    7.2
>>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei 
>>>> Chai <songwei.chai@oss.qualcomm.com>
>>>> +Description:
>>>> +        (RW) Set/Get the sensed signal with specific step and 
>>>> priority for TGU.
>>>> diff --git a/drivers/hwtracing/qcom/tgu.c 
>>>> b/drivers/hwtracing/qcom/tgu.c
>>>> index 9c7dd4a09f02..0e88b437f191 100644
>>>> --- a/drivers/hwtracing/qcom/tgu.c
>>>> +++ b/drivers/hwtracing/qcom/tgu.c
>>>> @@ -15,14 +15,144 @@
>>>>   #include "tgu.h"
>>>> +static int calculate_array_location(struct tgu_drvdata *drvdata,
>>>> +                    int step_index, int operation_index,
>>>> +                    int reg_index)
>>>> +{
>
>>>> +    return operation_index * (drvdata->num_step) * 
>>>> (drvdata->num_reg) +
>>>> +        step_index * (drvdata->num_reg) + reg_index;
>
> I am confused by this, probably amplified by the bad naming of num_step,
> num_reg ?
>
> I perceive num_step => numbe of steps in the hardware
>
> num_reg => number of registers (or controls) in a given priority field ?

yes, correct.


> If that is the case, shouldn't the index be :
>
> step_index *  (drvdata->num_step) * (drvdata->num_reg) +
> op_index * (drvdata->num_reg) + reg_index ?

It can be thought of as a flattened three-dimensional array, with the 
three dimensions representing which priority, which step, and which 
register, respectively.

Hope this helps clarify the layout and the indexing logic.

>
> ...
>
>>>> +
>>>> +struct value_table {
>>>> +    unsigned int *priority;
>>>> +};
>>>>   static inline void TGU_LOCK(void __iomem *addr)
>>>>   {
>>>> @@ -36,6 +163,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>>>    * @lock: Mutex serialising enable/disable and the associated PM 
>>>> runtime
>>>>    *        reference counting against concurrent sysfs access
>>>>    * @enabled: Flag indicating whether the TGU device is enabled
>>>> + * @value_table: Store given value based on relevant parameters
>>>> + * @num_reg: Maximum number of registers
>
> Where ? in a priority ? in a step ? Why is this maximum ? Isn't it the
> number of "registers implemented on this hardware"
In a priority,

The comment will be updated to clarify this.

>
>>>> + * @num_step: Maximum step size
>
> Number of steps ? not step size ?
It should be "Number of steps implemented", will correct it.
>
> Suzuki
>>>>    *
>>>>    * This structure defines the data associated with a TGU device,
>>>>    * including its base address, device pointer, the lock serialising
>>>> @@ -46,6 +176,9 @@ struct tgu_drvdata {
>>>>       struct device *dev;
>>>>       struct mutex lock;
>>>>       bool enabled;
>>>> +    struct value_table *value_table;
>>>
>>> Why this ? why not
>>>
>>>      struct value_table value_table ?
>>>
>>> Surely, we seem to be dynamically allocating the priorities etc from 
>>> there. But do we need dynamic allocation for value_table field as
>>> such ?
>>>
>>> Suzuki
>>>
>>>> +    int num_reg;
>>>> +    int num_step;
>>>>   };
>>>>   #endif
>>>
>>
>
