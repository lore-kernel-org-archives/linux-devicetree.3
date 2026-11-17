Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926346;
	b=jMFSQaxTb3UQaJCzWxBupPK1z40MkJ2PrCKym1LOyYMwZiOS//yxOmJxjyda9RcVNsyr
	 /P+3WB0fPfAZIPBKDndgoAOeOHqD22lwQORPXvTfeaFLmSFJcGT3HbZw6qVf8Gu4zIEgb
	 kzUnkxRsmKefsUAKLGPQqVtW82OMUB3h6ESgwXpBo+n0iUzgnp9KwRz+jQuRbmNBlUY0m
	 Yd4BWDdLZHjqoYMoOUQZScEh8yphBUXhnn/lIYwKf3capWY5+ElCLuAr5Uovpk7SWSOPS
	 TAeuK1aRufZVxld6e5LKDfHgkBqEU2pcJjSxUe+3dn0kiW2w3+D6aCSmi53oWoX1ldg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J/4vLvyNqeORXrBPoXGUzzn2IETQe9KRQ40Tt84ca5g=;
	b=wSYyCfkaSlFZsANnA5KNNIMDxXfI87plLQOhuHEYH5cbzOwonQBjzMGbmrKyPplIzGRU
	 lX4Fd2aYZV8C6XHrw7jSa4EzWXNxTeQfFokkTq1uIF7s2/ibrACNyMA3Vl+sUOkdIZh7Z
	 W5xU876qL3gYp9iUbtdHSTjEwkpq1pfvMzYbnlAexUlvSxHv4V2IrIq4cINNp7MMsdYPy
	 ZznBHRJp5C/hTYb1D7n2C8j3Dqkx3Srl2Az7uHaxJP93eAfvKpjcHzRlI6H48koVQTBG2
	 2PKm3N6uNeH+Z9UjJYhlX346RjZBKFRCYo+NyImqj4eqbrPYM0Oi1uJpiJ2ZuTy9nOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaZdnNrX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I2eYdPIa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFAD606A8A1
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFAD606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaZdnNrX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I2eYdPIa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC19nZ3713901
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/4vLvyNqeORXrBPoXGUzzn2IETQe9KRQ40Tt84ca5g=; b=RaZdnNrXIXuujHIL
	b9gDY6DkKpfcXz3+RtJMNcSG2CBbjvyZvwfuE3SPA1MzNtWuWLPkv0xOk3corQGb
	9hnsSeU//oJ8Xfddv4H2/ry7020h+5yagaaVpQpSz7oxja90XPUrw1XDo/8PBigI
	CALjD9jco/hHbq+V9D9XRgpEh5T2P6iWO+x71wV/QuYtotFLUcispWkEaAg0pAqU
	7hmUtvgFJJtB/jnoLUIArmuG01TjjmN1fdT2x3Ak/n/0OvWhffI4K5jOktBNlKu8
	PPDe1XT16GpXB9ydVlfUIORhu1hKDnkSYLosgk+VlfZG4A3AUDfcz0iY11Kt/oO+
	py7HgA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve1wyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:39:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990aa76e3daso528694241.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794926344; x=1795531144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/4vLvyNqeORXrBPoXGUzzn2IETQe9KRQ40Tt84ca5g=;
        b=I2eYdPIawMDuzDv8t8nyVyMKHJBCpnsseE6P92OcAlApTbDGO86XNhM4CJib78ZQ3/
         0zxxPDDwVxubVpkREA2V/q8Ao/QicgYvYiqfNYFJalPfdhNPQHNYw4e/dvX6XiiqSdJv
         I37jEB4waTNWfvOm9n2pWgbVNgd9jsVqap+c59iizmhMpSq/ta5Jtdz4FiNX3a876ODU
         S9FyZHrmLeUZBUDlJCe3JgTXRzQyVwnTx1Ykcjcy2jdE1pwqWuNsIRCYzdgqob2UqKBM
         IEZSuPbXFX4czfGlTagrAvAbQgn/t6nNEQpSGIqTPu89+ZxXXHLfkVCijoDPu97MH3dI
         FINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926344; x=1795531144;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/4vLvyNqeORXrBPoXGUzzn2IETQe9KRQ40Tt84ca5g=;
        b=py1mMglLaWi59xBopRL9VdRJWJeVKkNyWInAreUHeG6InxobuUKRRRRXjiz5YfjtRH
         NubTlRmlzVPFKZ0cIqnw3ChE7M7tYcujxx7LiRdM1mM+1vrAfkcujE6GI2p0GPcq7GX+
         fphweYWK2kQ6+rcbYaGV8qiKcWiHrSoC5L8n+/2YpO0PXf3Md6HSW1426mBFE/Axx0ge
         E3RM7OuHTEzAkkSL4fjtFwZC+MAAkKdvRBVw05GqeoC0dDuKrjV03eXkI4/vNVVYq6MX
         NzsixCWxO6HVv0pOYRVMt5mPI5eZMLsAffZwYJg+rHgtt/nBjGg81VURD5/p6WVyO6pM
         dYzg==
X-Forwarded-Encrypted: i=1; AL+hErE5pUPGR25XO0LbHB6SA4dK/rDJiMYwYDgxmLDwWcn0BS+s0E+yEQq2Q/nCO5NpdGisBPSoakgTN+s0@vger.kernel.org
X-Gm-Message-State: APuU4Z8bX1diDd3U7k1LxKSvfN1mB1JphGodAw2+VxCBIUvsbn0L0fft
	TxCSRy4I5JvKTxfqZ8wkjSefTrB/zhFtRj4gzx3wSjRr4WqK20FtBYPH6xl912PTdX2yqpX+lde
	zD05VR1a35iBBR3b5rbMBfJ2vuoD0KS+kcU52n6kEMe59krXhsw5cDDn3Qsu8zLSO
X-Gm-Gg: AYBFou09JEs2LYgbf/m3TqbRocAGjKbIhfCJqx+LnPwg0IFqD4ZfHs7Jjuc1nmJ0GFi
	oO1+iJrO8sMO6SmzvJgc6l0Y2kOAnuI4U2FX5WC3KXJTxUFRbrj6VoiKXWebkcY8VRXrxtp0pqA
	gJuGNIJ7MZaIW1rrcO9GC5nQYa3tta2G9TiOxfuyeluryXu9o136GJ2fgKU4saAWxWXzj2p9CeP
	FUZNlBISqAw9lf8XDpv+IUxL8OgLDdv9nnD4Dx6BnymrCRZBJYlqiOPkdAMuISQ58FVqPdS/JA6
	2S4Bc025PC+FJerx8A3bqfeFp/H1ZiLBtUogKtp5kxbtVHh3LR/K5vrRUb9mzEe+k+HH5kly3S0
	nBxG1VIpXzlNKjSQk61uhePc4nHSyF1YnIBvPiXo3xQzoGnKzCyD2RG2+CztdjE+Ody0aTRJm7+
	9whsrZ
X-Received: by 2002:a05:6102:6050:b0:7d6:48c4:ed56 with SMTP id ada2fe7eead31-7d64d69dbf2mr3523242137.6.1794926343507;
        Tue, 17 Nov 2026 06:39:03 -0800 (PST)
X-Received: by 2002:a05:6102:6050:b0:7d6:48c4:ed56 with SMTP id ada2fe7eead31-7d64d69dbf2mr3523224137.6.1794926342900;
        Tue, 17 Nov 2026 06:39:02 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e02d340sm2636416137.8.2026.11.17.06.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:39:02 -0800 (PST)
Message-ID: <d55bbf0a-3556-420f-852d-7a15ed8d5aac@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 20:08:54 +0530
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
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <4c3bf92c-2434-46e8-8a3a-ab34cc50c72d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1OCBTYWx0ZWRfX9i0cjQFAjbNA
 v8Iv4qZ2gPqw2omw92zCoqxRBo24aAMXqMa2sWXBbfANaDYZXVq4aEeYp2AN3qKPEnsaTs5gJoU
 m3rBxiR4DRupI5EbI9RlHosrO0U+Srw=
X-Proofpoint-GUID: AlvE6ULmsgRdZ0LEfRy9rUSFBU8raCqF
X-Proofpoint-ORIG-GUID: AlvE6ULmsgRdZ0LEfRy9rUSFBU8raCqF
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc6708 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=fQRhRBuJyxsiCmdI730A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1OCBTYWx0ZWRfX3Vt2XAIm1sPv
 Z0WhZzieSxPjQgoOnIKXlv1WnKomI8Zi2eyZtELTmPgdxpOrdQIofZSRIUmVkSNw0CmyvB9oYQw
 J59Ki6/oxcy4d+KUUcbatPjvGXacKHEnWg67koBek8DQxrWPNwBBrT5BDZKbSghWCf/RLiABWVa
 y2TJdm/llROs2hfof6lhnTQIQIrb4lxodDrLCAxxZYxglRbkJb8ydC+HAo2ytr9Pkdzw0sIVGWh
 aC1Od8XAthqZhNnkHVjKebVdeohttwfZNffBpfYPscTFjbJ2TaGkdGdlrdL55pc+XG3JVJaQAIj
 cCODtPmhv1BV42bjMOhwXiqmKB10bbLvGpMnaAjaSXeHczCXPE0yWf8SX4pVna9GLIwdWSoK1P/
 Aj0lhLDnLtzXzl0PYOeNgT0Spcs77Sqqpoesf3o0Eb7CEHYpc9aFaMFee9nsVt7sLGN1lUr24tA
 UayKsEEeGmBJFCKn84A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170058



On 11/16/2026 6:56 PM, Krzysztof Kozlowski wrote:
> On 16/11/2026 11:36, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/12/2026 7:27 PM, Krzysztof Kozlowski wrote:
>>> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>>>
>>>>
>>>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>
>>>>>>
>>>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>>>> protocol ID for QSPI.
>>>>>>>
>>>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>>>> we add bindings for it?
>>>>>>
>>>>>> Hi Krzysztof,
>>>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>>>> submits transfers to it.
>>>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>>>> I will clarify this in the commit description in V2.
>>>>>
>>>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>>>> Linux.
>>>>>
>>>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
>>>
>>> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.
>>>
>>>>
>>>> The third argument of the DMA specifier in the dmas property selects
>>>> the peripheral protocol. The GPI driver programs this value into the
>>>
>>> Yes, so the third argument can be value of 6 because it has no meaning
>>> for the firmware.
>>>
>>> Again, follow standard DT bindings ABI rules, you don't get an exception.
>>
>> The existing GPI DMA driver and binding uses its third cell to identify
>> the client protocol. The driver takes that value from DT and programs it
>> directly into the channel's SCRATCH_0 protocol field.
> 
> So register value? Not a binding...
> 
>> Its mandatory to maintain protocol ID-9 for QSPI.
> 
> How can it be mandatory if we did not define in the bindings so far...
> 
Hi Krzysztof,

Existing SPI, UART and I2C use the same number for the DT identifier
and hardware encoding. gpi_of_dma_xlate() stores the third DMA
argument in gchan->protocol, and gpi_alloc_chan() writes it directly
into SCRATCH_0 without translation.

Neither 6 nor 9 has been defined in the upstream binding yet.
Would it be acceptable to follow the existing SPI, UART and I2C
approach and use 9 for both the DT identifier and hardware encoding?
Or should I use 6 for QCOM_GPI_QSPI and explicitly translate it to
hardware protocol ID 9 when programming SCRATCH_0?

Regards,
JyothiKumar

>>
>> Other protocol IDs which are not part of upstream are for AFC (6), SPMI
>> (7), HID_QSPI (8).
> 
> 
> 
> Best regards,
> Krzysztof

