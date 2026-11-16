Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825429;
	b=Hu1OORFt2Un5nZTPYNFBJ69vWAVVyTydswv4hB8Vl6SyVr3ss1Eo8OhhTMd4xVcyyTMO
	 fYdR/hasVEtbe37Hjt+shL8mk7+QK9mpndaWQOLUElqVxAXIkJfzq+5+iDtgdxLfvVbAS
	 e4eqb2dG/Q2UNbKYqQkHhovaQGTJyT05iKnIlVFUoxdMI+ZTkRXlHfTOqnXfiimHk8DxJ
	 h0/eNmdynrAtrffnl3AeEhYa4v/uGlfJfaajf5hut0rWKyv6a6syAcr+GoBZSQxyaMg26
	 /WurfcwitNSTt7VM3D1kG5sCVhoptmV+xuSUeWBirUwIX4ppfFdSXABRv6Zg73BWcnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OKzx0WFamDGxi1lhlFcpXjjwrC6ez8FTZm7ETCzF7RI=;
	b=iD5Iv97dXfzsMs5/4wftgYBN+Y9W6QMHag9mcNg6YCGv6geo4g5ytMIfr/jqU4Qo175k
	 8qZGcRt0a1pgZw53dLv3P/7UYHRazzKtQi5Sbsc5ZBCbHRYFQzzxVNH/jJbgGVlEVhvyU
	 U4i9Q8D9kxuAntoJ1peWgGWY+nGSkM23sw+ebfw0wiexadZ//3TT7Sk3CKzq10cibhFDM
	 wF+caGpxVZfOofbZmnmwGG7azQT07kHmb3TVrHCQffCUC6oOrAOcrAA+MYzMAyMS/5EIv
	 d96hAhLM1NT/Gv5XgruqGicFKUoqyc1AfV0rrkC5ptL0TgU85t5cqMek0DBqtqTNXNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ii3LY256;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DZtfeLiw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0266606A332
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0266606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ii3LY256;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DZtfeLiw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG9POUO3427960
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKzx0WFamDGxi1lhlFcpXjjwrC6ez8FTZm7ETCzF7RI=; b=Ii3LY256aW5XqhcZ
	W//p8pPdYPjkQ9PQfjeYCNCNWY/y0zC4kYV1I1N67IIN99o02io/Y848tjsrnCEV
	nwoRyZgBN9JtLJns3QbejJcpJVtD/D5lnmuWJxxeOfFaYf5rimOCmOk3bGPluQ5u
	TwzT9wkHByCEkSO9se4AMH5jfaHV6FGjk5HSO3/P3YhV9EYBL1v+T5TyrieTBOaH
	ukUY4qEiz3wawR3zbwFiZXyse5/eMmU7kpFvsbGJC4k/dPAGX/MOMbw4d/kOb/p+
	W0rkEIjsjNp9aFMKlCQzBWSlyQDVUdagtI/AVKrj0gfqbj+Ayl2y6HCj7OPG+4Br
	rWt/BQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6gg8bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:37:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso3090659a91.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794825427; x=1795430227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKzx0WFamDGxi1lhlFcpXjjwrC6ez8FTZm7ETCzF7RI=;
        b=DZtfeLiwdExmU1TbpIxZAy5XYLxuRG18zdCAW9OzECgFIQZVgC6DREz3PNPWA22KCJ
         GaBNb1t7/ZUGq8CxlJnJbOfYdM997uZc31OvRPISAqhPuKfK3FkgT6AZ8O+WmAIVzyDx
         7PnrPdRmdHrEFhH1KJfBNiqhmZFD9X5Tj0Z+ysDaK/0cjUZRLFLFLA4oxmx3Vwcl8ADf
         SwM8ei2yck9YJZy1VDKhXfYnLbMj4kmDvUxncU43Yun6lWz6VuvTW9eQ4hV68hH76Dly
         6gXEIoK4Iy4DmG3hPTGiMhvl9E8iWHZ3i02rokdD2KPtlE8hfYvTzVO9l7NdE5cuepRf
         YvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825427; x=1795430227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKzx0WFamDGxi1lhlFcpXjjwrC6ez8FTZm7ETCzF7RI=;
        b=SO7W0KckkLZajRpIvZU+GUh4rzsdtEIaJ9c9juMaXrVae9HZaoUjt3PR0ZNxH0P1Fs
         FtCQwGMd+PL7apAVtJ0X+l0c+wk7e50Z6uSnCo16+IChqm6xlXyz87hJdqTvJ16i6nvH
         2Zs7NKxcLx9k2G7jsG49S5bZtD+cMe7fdbI7BkP4ygCo8jhx6yP8AZg6uvHvEOugb4J2
         e3pmAKGrK6ynNwgmc0/tcE6bgq/uFWjPywyKWEO4XLjb1UlbR+1ji4cdt00GI/RGcRun
         UXsOfUQLFIcBruDmL0CNscW8YCEHKNt4PNrNid8nDJnO+gddOAuCaQ2oHsE4OvICXlu/
         oXEw==
X-Forwarded-Encrypted: i=1; AL+hErEyE5UvNQqE+IO80UppLIEjeq+F1G5iJzxaF/ezwVEzjaq0nQspom+7WJbXgcPjCXZzm4EFmoA5bm5s@vger.kernel.org
X-Gm-Message-State: APuU4Z8tnXcWE7kyHIIZjOW4vxgDCrtxge4CfUh5/0qRR7eY5dmOnljf
	+zJdVwp5opOqleVvshTZH+jMCaR67veb9/GwemU9UBi5SgYicsg6yZUjJA/ZCQHhZK+C86FbPjH
	+TULoR+15keSN1X59FfcBt4uf2dHYBvdTLA9MQdpvqBCHq/d0rasdGUvLmy59q59r
X-Gm-Gg: AZFdTZcDeCZ71bbTDJ8ud8L3CmQhYwyss/XImWx8D1m7xbszAj7ZInRHbHznW7QO8ID
	KcT+MNgKlS7lFSGUwdgmxdC1nbHhSOm7W8CxUF/aebLVVYISkWUeEgwUB15h29BgMZd944hGtYr
	buoHhLM5s2RRHOFDvNIHmPJNnJQjMSMnBt1Rmy0fJUD6QXGaVCygKXnZhnYwWKtdELfPsAhqxRr
	JhgX8AtTp/rkNjtKQsf8mSDndNh0I5blXodcJvZQsTeV768ikn+S1eVFvBnu3Q6FGogO8aS0QFy
	3BZNaaW4Y1l/tBV3VR3Q9jOcIQ5fRPyvGnRFua5giUfBJuKPidmysGWSsLWO93Ws0N+yjep/jd9
	jvgtyWNK2VjHpKnaz6bD4GmLN+AU4xR+GzLHK29mxvW3qCCub5Jr59d23Udz+5WaN45AE5S5WuV
	84fGw=
X-Received: by 2002:a17:90b:3d87:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b1b0a3956bmr9673714a91.40.1794825426518;
        Mon, 16 Nov 2026 02:37:06 -0800 (PST)
X-Received: by 2002:a17:90b:3d87:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b1b0a3956bmr9673681a91.40.1794825426012;
        Mon, 16 Nov 2026 02:37:06 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3d279d8sm8190788a91.2.2026.11.16.02.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:37:05 -0800 (PST)
Message-ID: <21346a70-3ca6-4b9e-9a15-294004a1ef01@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:06:59 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
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
 <58b64727-4b36-4328-9abd-116b984eb7af@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <58b64727-4b36-4328-9abd-116b984eb7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX0LC0YgHMAISd
 wMcVnP6swDcwSBB6Y8xkm7bMVTK3921bRsKRZYGhTK6QMsd1Zzw6bycof0lxx7TcHsXUMCaWDA1
 262HjE5oJUOJjslZ2nQpRSKLGHHBdNgqe23Q0OYlMxNnDjr7t43wX+Or76ji/S8NTHQfJpKaH6q
 lNNRdXnsDapfq2lcQxyc8XUsVd0Bmt3jzoBCwem0NeK+rik94VxyBaTWZSS1uczGvyCRpbjTBjp
 q49d5iXQimOigHlEXs2zN1PSZhdPewXYpNbtT9Z7JACcHefXTTL25M83m099YufeuTVjzmv9iie
 h7UARDgGK6qPOaqBGNscDcpZFPUZalsPJgTUPMDSZUz8l2WDGiEgq4fIOKsNH+9sn2UXLaOr43Y
 x6ClfHsbdlh8MPcYhI2OgaUlfqVM2BkgkWNFra8rsBVIYqnbKPtV1qaG+VWskRiEYCZXEWmyRX1
 5MqEYxXNiItGhDqZ7JA==
X-Proofpoint-GUID: nJG_aNQK9a2RimiIbf6dLCcR4RLUNqlp
X-Proofpoint-ORIG-GUID: nJG_aNQK9a2RimiIbf6dLCcR4RLUNqlp
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afadcd3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=89fLKjHVl8os-4pLqkoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX9Csr66FlV5vl
 08RwBNQ9Qwut34+umZ5jsHRJbkXadUGHH14j2yPO2HV4RPrsrgqAPN3odLbyU+H17KmvroAGoUO
 eMi0vlfD6l2NaKBKHOWhqlmoS2Vwc+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160042



On 11/13/2026 3:44 PM, Konrad Dybcio wrote:
> On 11/12/26 2:57 PM, Krzysztof Kozlowski wrote:
>> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>>
>>>
>>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>
>>>>>
>>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>>> protocol ID for QSPI.
>>>>>>
>>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>>> we add bindings for it?
>>>>>
>>>>> Hi Krzysztof,
>>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>>> submits transfers to it.
>>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>>> I will clarify this in the commit description in V2.
>>>>
>>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>>> Linux.
>>>>
>>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
>>
>> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.
> 
> It is a firmware ABI, the various protocols each have their own magic
> number and the firmware needs to know the right one. The GPI DMA driver
> uses exactly that information and programs it into the core:
> 
> gpi_of_dma_xlate():
>    gchan->protocol = args->args[2];
> 
> gpi_alloc_chan():
>    gpi_write_reg(gpii, gpii->regs + GPII_n_CH_k_SCRATCH_0_OFFS(id, chid),
>                  GPII_n_CH_k_SCRATCH_0(pair_chid, chan->protocol, chan->seid));
> 							^^
> 
> It doesn't necessarily _have to_ be the DT ABI, but since it's
> bijective, an identity mapping seems like the sanest choice. The
> holes are a result of some of the other protocols not being
> supported upstream (yet?).

Hi Konrad,
Thanks for clarifying.
The existing GPI DMA binding uses its third cell to identify the client
protocol. The driver takes that value from DT and programs it directly
into the channel's SCRATCH_0 protocol field.
Its mandatory to maintain protocol ID-9 for QSPI.

The holes are for other protocols: AFC - 6, SPMI - 7, HID_QSPI - 8 and 
yes those are not part of upstream yet.

> 
> 
> 
> But we already know this value in most cases (if the firmware is
> present). Once upon a time I tried to de-multiplex the GENI nodes:
> 
> https://github.com/quic-kdybcio/linux/commits/topic/single_node_genise/
> 
> particularly:
> 
> https://github.com/quic-kdybcio/linux/commit/02e4671d8f9c3743a8e1a520cae75a455912eca7
> 
> which (for x1e80100.dtsi) only keeps a single node per QUP instance
> (and not NUM_PROTOCOLS nodes for each one)
> 
> But I think for removing this completely we'd need to move this
> information into a new property (qcom,protocol?) which would encode
> exactly the same value to convey that to the fw loader.
> 
> FWIW I can pick up that work again if we agree on the bindings.
> 
> Konrad

