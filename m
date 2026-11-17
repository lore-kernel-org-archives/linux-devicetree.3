Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935100;
	b=uS0iGoZQaYxSjxfjUsyzBxt5duodfNF3L9TczJrnfQpIFNOwHe386qXEJpmqbLp9g5em
	 JP9a88AO+eB4oFlqo34Lj3N1p/GrhKwmjZhEQwo2hXYfj17lWpNLSUltFW7JrvEOpsDqM
	 TvMuxrIUkU/a5hXbGXHhMG8greVD+JsYLEBLc7nYmDfb3ylQjYRdJ6iqxSjlnYJ4h43ka
	 P2IYcWq4hDBlaagDOQuUahbpgAV+vmNf+aYVxDinBg4ryiUSasrr/y/IxA1nnCLPtDT2Q
	 xp679w3gY4WA4KpCUrxGMBE6qudp+UzAqqpm/8pJvwPeHHLPTMSlkefjng0i+/um7Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=;
	b=E9Y1hEMUggK4wtW1uvP1Ng2cVSNqB9iol4xn9GTFllZWjycKgi/xMHrErw9qgK2B65Kk
	 v6ZhVMZjXDYF3vMeO2gkFnfuEvwS3UtdXOSN3Lz9FUS2Aa95GYqwf012izM/athmE6haF
	 SWAVXHMxfZCg2MZzkpsFZwao1xCC9l1v8BNzzO2MZ/SuCQQuoimbfwzWSHipiUX9YUF7w
	 UEBSLrQdPOUiwFHAxe7cZJEn3vf0lWbKIh3JlGp4KKz9N5WnOUHpLCCH08fSAAyuqpUQ/
	 AwcyFE8OFWMdOPg17NnMwqk99Tm3Gbj26aiqmvYpeB0RstD/ntGTvzregBpRd7Lmtog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyuVXcGA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaDkS1PN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BADA606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BADA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyuVXcGA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaDkS1PN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQMhO1141613
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=; b=nyuVXcGAiDP4aVXO
	z1RgkoxOVW7+/sVv5pcO9u1QXiaM0TfbPBGuOpoBiYf/HVdKfdb26XyWX3wIsoIl
	jlKFzPn1P21p3H3Ste7ejwZg8h6TKBK7LfcvV+NJLv30w8x+cMMYSkjTahDXbz6x
	gU7epuiMJ68FJnLn2hbbxugCiULB4JFuwMn1CJhG/eExTI+pzcZthmS9yPuQ3/zQ
	I1Lh8605U5WXZ4Sge+fSxACNh4MJ+owCNwhegcJfgMUVo/l0FIhaMSsde2OFz/lm
	xN9I/Ja54llIy2W2q6HzDeD49C6h++iFl9iRp/0VyBLDBMJC9RRdoaC18ojsO7F/
	0WFJjw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t0j4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:04:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso132440eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794935098; x=1795539898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=;
        b=YaDkS1PNAfOO9tQ0ds7P9BjTcceoqIrc5Zx3VZo8zfzpR7yHO1X2NuDae18MNq+aO7
         MdByodqPsMvGISbmn3qNjJIpJI/BBSw/PtvaBSQ64TLSVH72JmOcgAW7U9NpnRvXlcza
         pbR5HDs+20lc/ypMsML1NHjM+fJgxIkJd0BPHwNE/OzajCzLilg8dRoJ17Vw3McJnutr
         HeCZjEH8a3ZKKzAJjcAmLU++oIeMKEP1DCidTElKcdr/8s88T66n8vBDrNJXoxale878
         sztx7IpNKc1QM7QyT2bpKvtCmsfp1lylEoDspZNw/a/2upB86DjHo5kfsDUJyzGfS+Qs
         t7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935098; x=1795539898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=;
        b=u9xBcEh9+ODmRmHL3LH2cYy7YLccRlTUF+v6JU/fJaPfQT5xbTvBC+bMBtngzpQQLM
         WDRy3UykFO/PrkbBW+apxgo9O6Qg180zVF5HeoNCvGK7LfS+eBCkBVYbgmbZNc7z24ZL
         ddLjE2BeICc26MhEcF4zGHoAIUTShpHff9Phn2NymfEDbWAm89KReBisSb4chzehoyYh
         fCnVB62El1mh8vVBkB0kxIRkVBnPCOpNZgrVkPrOURo1OX9MrcY4toYADtxhE/ZaUHPz
         jamCt1OGEu+XuUue1aE2lpazkbmvjQY3D6tcCmFjuYfWNpgrrCaVHkum6A5VNNm+GHK5
         K20g==
X-Forwarded-Encrypted: i=1; AL+hErFQJhPzrapz5c7yPkTEtgJlLxtgEAF9wi0zbLxJ16RBmEfNQBCWXFOyLvsLTJLLm0DL/U4oExFpFoe6@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q4Fct1HV5VBmk+Uk73ElA+sgIwobnKotEJfPSrzrDdefWAFo1
	TqOj+AR9KgQz7mwS3QGaIQRNkHMHho2q4hpupZ2LKl0gRYJW/7QUf/SqJZt/G2qqbWOrUbuJnQY
	utRuwJtsQfoMDm0wSGHUi1avNDQfhMixTzOe8yTWdqncJAvFWVsIUoDr82r6gpPTkQtcvldIQ
X-Gm-Gg: AZFdTZfST4uJPUiudh2gQwvTbULEH221fNjYxNKwNuY7rTSwGFAwXBVHAwPzzKAzmdk
	pJxP/6RxXtqLYMQYCaMrbokqQoq8zyG0Gt4KVacbwO0bWdiVr+IqxXEddqdOUXmH5BQjwLkT7In
	cOZfbKVeGN8CH9jdhVRaNR/knPbfjNrhzwBUmS7DEJy95nbT6yKU08KJ93UH4CiDsh1QeZz3z5V
	TnIZeDaf+agNzqpCozBxQ8OZyEJ29ugZtYzYZSuglJAnToqQts3eJVHtWu3MjIGYwVrfgY6zgg2
	YJs3jLzn+0ZxW4pa/i3LI/smeu35JLq0KKDFSdSQMjEADI1kDvlhOmFaaQ07RMfknJ95qsJcZzF
	H7poUy3dF96NTeHIG11isyK7l6+w+xkZOlLcwrJNwrK6M8VGoqzUYmdIflXZipjZOZtpMlPCC0o
	as5PDqNLo6QFOcsmu9
X-Received: by 2002:a05:693c:6011:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3828190b173mr37201eec.32.1794935098076;
        Tue, 17 Nov 2026 09:04:58 -0800 (PST)
X-Received: by 2002:a05:693c:6011:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3828190b173mr37163eec.32.1794935097390;
        Tue, 17 Nov 2026 09:04:57 -0800 (PST)
Received: from [192.168.1.66] ([103.172.4.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm68957328eec.8.2026.11.17.09.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:04:56 -0800 (PST)
Message-ID: <427ecaf2-9a09-4829-a598-11298e507614@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 22:34:50 +0530
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
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
 <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
 <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
 <c9427a03-8b45-4e35-a29d-7ebe30f07ed7@oss.qualcomm.com>
 <5b6e4031-4c52-4b67-82c2-0033d13b15d6@kernel.org>
 <0d4fa5af-e406-4761-aa58-534c3c6a043a@oss.qualcomm.com>
 <4c3bf92c-2434-46e8-8a3a-ab34cc50c72d@kernel.org>
 <d55bbf0a-3556-420f-852d-7a15ed8d5aac@oss.qualcomm.com>
 <276f1579-6a5f-4093-a0f9-53c6808df32e@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <276f1579-6a5f-4093-a0f9-53c6808df32e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uGjNC-dHJ0_HeX2HeFhNkykQEKz-XHBA
X-Proofpoint-GUID: uGjNC-dHJ0_HeX2HeFhNkykQEKz-XHBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2NyBTYWx0ZWRfX9Ol4EDUy0eLQ
 p4SWCdSVo2rizVAKCrLYGHPJXYke/wJGBvlyfEhz7KV/SXw3ZgKaqcv6KZv3BPb3B0lJkXow648
 1FDk5n8mPV/89Lh3ZDJS4UsnXu5ilSi2mfNerfdcELsBhwpnTprLRpR5zYJvbkcL8naYk2zwyme
 kvs6ud8py4m002HJiRC609Q2SzcQmeMyEn6KpUJ8YUx8Ra2heuY+ORwIgHTYdNIgE5Skwk4NVqS
 T9qxZvxXrky2RQucwi25njmhuNhWV9ciKzKSCDJ7Rv1QF8JOmYbkJzztjgN31sgUOidAhCntCKd
 Koo0iAc2M75A6bgy+SU/yr2wt/T/xaAEXVEMw6tQNs4C7XTUhx+BBquK8F8PZci7kgNheRtuw+V
 E94vARg9QreDJAIgue1IP/sx66qKfdJvs5Yz8keWscpJYBSXd472cCSHpUW1nBYdg9TsuygSIra
 BNxhXqFElSNHljg8wuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2NyBTYWx0ZWRfX96s5hbT63x7I
 iGtYexP3Pfgdwf15j74xTMiiD5nKrgXuNhc0KYF7I0XpTI6QhEmv6lP0V1wxGYWN9fcOKoWMMbc
 qaEOHOAoiPdPcqf5z8SkwQ/RXJ1ZNWQ=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afc893a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kYVgg70FI5gtGbgwxQSixA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=9IG9TpRuJpbhppyfOHcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170067



On 11/17/2026 8:34 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 15:38, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/16/2026 6:56 PM, Krzysztof Kozlowski wrote:
>>> On 16/11/2026 11:36, Jyothi Kumar Seerapu wrote:
>>>>
>>>>
>>>> On 11/12/2026 7:27 PM, Krzysztof Kozlowski wrote:
>>>>> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>>>>>
>>>>>>
>>>>>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>>>>>> protocol ID for QSPI.
>>>>>>>>>
>>>>>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>>>>>> we add bindings for it?
>>>>>>>>
>>>>>>>> Hi Krzysztof,
>>>>>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>>>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>>>>>> submits transfers to it.
>>>>>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>>>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>>>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>>>>>> I will clarify this in the commit description in V2.
>>>>>>>
>>>>>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>>>>>> Linux.
>>>>>>>
>>>>>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
>>>>>
>>>>> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.
>>>>>
>>>>>>
>>>>>> The third argument of the DMA specifier in the dmas property selects
>>>>>> the peripheral protocol. The GPI driver programs this value into the
>>>>>
>>>>> Yes, so the third argument can be value of 6 because it has no meaning
>>>>> for the firmware.
>>>>>
>>>>> Again, follow standard DT bindings ABI rules, you don't get an exception.
>>>>
>>>> The existing GPI DMA driver and binding uses its third cell to identify
>>>> the client protocol. The driver takes that value from DT and programs it
>>>> directly into the channel's SCRATCH_0 protocol field.
>>>
>>> So register value? Not a binding...
>>>
>>>> Its mandatory to maintain protocol ID-9 for QSPI.
>>>
>>> How can it be mandatory if we did not define in the bindings so far...
>>>
>> Hi Krzysztof,
>>
>> Existing SPI, UART and I2C use the same number for the DT identifier
>> and hardware encoding. gpi_of_dma_xlate() stores the third DMA
>> argument in gchan->protocol, and gpi_alloc_chan() writes it directly
>> into SCRATCH_0 without translation.
>>
>> Neither 6 nor 9 has been defined in the upstream binding yet.
>> Would it be acceptable to follow the existing SPI, UART and I2C
>> approach and use 9 for both the DT identifier and hardware encoding?
> 
> Not 9. The next identifier for new constant used in ABI, as expressed
> many times on the lists, is the next free number. "Next" means
> incremented by 1. That would be probably 6.
> 
>> Or should I use 6 for QCOM_GPI_QSPI and explicitly translate it to
>> hardware protocol ID 9 when programming SCRATCH_0?
> 
> The ABI is between drivers and DTS. Whatever your hardware needs, it
> needs to be programmed by the driver.
> 
Sure, i will update the changes in V2 patch.
> Best regards,
> Krzysztof

