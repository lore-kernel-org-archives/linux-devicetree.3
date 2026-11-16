Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825411;
	b=bKBYkvih2w5z3gNvDcQojzbhK3t33U2a5m9fRtzpA9GASkO5lLWD0uzJYT5NsRxUGyKv
	 64qwy54zPies0dMbqJZGmgzFfIDlqj+3YHGJxSoTrLlYt4N2pv1hqoIKOTWAt3Sl8lGOR
	 iYG6DVLyxbJ2tuvJsS3WeVS4yfemzqSeQNrAYgndY145bqHUg0rip3vI0M4K2M9SpUYw/
	 +fmNZg3KUuIIW0an9aUROhnH+GFEBJ9SYGKHB5bPpEwMTklIbE/5311uQUq6LVnTpYl+/
	 Lew/ph2xDrIrJoNXrUj9KyjnqBQikclvbr0TrCkcW1JoZm90oHSXH2nr259X1zXTcNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MftvhOyh0JpsGoC/uKwPwUiWJJ5nnSYLJzRW3U35/uE=;
	b=pTl/rJLhvuGcPCTMPz0TfzBEPZZ5E9H6Wf67bPghOA3TWVNktSFwWAN/TuEkAMQobfXs
	 tEbrXA7cDY1aamPgfhHC6WBD5n/xLwkBkQ6ODsK2UVkPXR2DxaWbF9+Pgia+Ju8BKcQoB
	 /yCrsVzrgrYIEKAN7i+hfAgUcqb4KwKIAnctFA96RgDkIGun2a9bJufoTREX5+OvAP+MU
	 aBHwBsv8TJO2bJBH01/HwIYaRt2HbfTIPX5r7Yn1/KL0CXEJzFDznKJMOScSQDvbB/XXV
	 8uqpWv9INEGluEVVNaliu0Ns+X67LFITTDga/Gbn88HzZ0T1qdeCrSIz8ddydsDHpYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0Ii6B8d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kv5UWK5g;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BA7606A882
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BA7606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0Ii6B8d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kv5UWK5g
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7er3M1894962
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MftvhOyh0JpsGoC/uKwPwUiWJJ5nnSYLJzRW3U35/uE=; b=P0Ii6B8dvzW1BWVr
	vF7QyOXiccvKYXQvu4cSlMXbJZhzPqaZml7m4cbtpoemL6floNqwNdb1T778fh/W
	1YnBzfTkItJlO5kCDcGjZ6QgRr5tzXKY0yJls/4rMcVpT2qT6kqfh6GcodW8o+np
	hFLu8yHjNwHCCtWoIe98zmlK29UsOryjtshI8VVlfPJFjXmvcRpM+RAnnVGlue94
	4eabt2dbek/AmU7omBipCsHYlQaTfT3PO94hkxHjopSb92UhxqeJKTeiaqVK/F6Q
	FjH9m9ecQjWqqNOCHE/98xi3eKdLxjd4v8veY0B+v97+KkFzjTYD1eKEqsAmpqFi
	scT6Rg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdwyvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:36:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so3273587a91.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794825410; x=1795430210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MftvhOyh0JpsGoC/uKwPwUiWJJ5nnSYLJzRW3U35/uE=;
        b=kv5UWK5gXjfQeCZc1SoNrluIDPIs55Brc41K8tbEc3bsS74sc+VCuwC/6WrNv8w5MG
         F8pYRg2fKvo4gRcuTVZ8IKhLk7Uu+HARaITLV03Rdqiuj80016wl63DjeH/odlnL5oqs
         2SIk26JgufwxG1noiVsQPEcliDQOvz8Du5FIkTaku3XKE/ATRbc51RSj4YtRf3ga+8Vp
         JqXvdpcEb/Fz666tCfAkEwOrc3mGbMprRzimElqnURElThv1qKUkcK2kEmAoKrIIGNhq
         nkQnw1ecZ8IFRJzkqSYMvZlkbpWsAVNtLR+yZTKGaD9O4UreavCY7zBDxIfgCN4RIQtu
         Vl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825410; x=1795430210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MftvhOyh0JpsGoC/uKwPwUiWJJ5nnSYLJzRW3U35/uE=;
        b=ur6eJNCs4FaaPXt9LEmSmR4JakkoqLLYMXcH/eauStTewHZ7OkGa3msU85JI1olovE
         uO0DFS/S3S6bR6Jbv76PWUR1L5mIsSHjQ2UvY/2+gz0hRTYVt29bf6t1H5I5RfisDQEq
         DcdjhoF6/utvFRtDgrEY4xNJLzfvIiOeGiPE+VnA0HCTKfkWLc098ImPY65Q0eOGKpty
         Y4ULWJJoRivOwdekFDsZrQa3gVRrk+4vpUkhzOyW9h4Fxt6adQOV28xaD4vfGPjR7Mk0
         lvBhaf1tW4D7UDuDDze947LS633BMXdguh8gkLT6mj+hFLabkf1JW2A8u3opRyaB8MR4
         Plsw==
X-Forwarded-Encrypted: i=1; AL+hErH8axKzro7zo2D13CLgtDlA5K43H98W/nl3VkSQXAL/HDqu0x2442W7leR560eemNty4c2/FCs5Gc9l@vger.kernel.org
X-Gm-Message-State: APuU4Z/7azLOs5Q7rFcEY2d7gO/Er9NZUHqG9PeSkmNbasctgcCYt5dB
	u88M+6vbp0Wz+zsH58F/9aICCKKmwAI/R1HuTlNgIUwiq81DXO39t4ZaQ9KNoUIw9JUer0DUCk4
	oOhQL2hTCo7xmpC3voctR3WCZoF71gc3wqFkV7UKq48TrsNr9RpCoNtZoHsyPlk+n
X-Gm-Gg: AZFdTZd8lRmR2bU40SWIwOJ1b/yyqI7Uy/+IfSNDPl8FjQ6WcApSua/PoXQ/NV2Gvv2
	9odjR5ZjXx2LOspy5Q7jo/Y78vBj9sj++zkZ8u8vYc7lS9/bvimoWDVea2KpwMpbiaErzUwDC4o
	1WGwGc2A661N8C78p6ivvyd8WNKyRTWvt7wVc7Ms/RLQVLNmbQ81d1iQqAssFhnYpjL4kM8DkRX
	TeGfsVGzsdbgQAOe72BZOAQE71OcCiad4J3j7eXw2dPUJpTafP94MdG+OrbGj+QW1Er0Xg3uvdP
	ASHL0n+K75yq4c8bjNyYDE5Oca2T15BBRYR9q0qWujvkcg12S97zunIpsXVyod01IC/5SK1LpMF
	pxzRP4Yoya27fuSAwWL0qbKCmyHniYmPo3nwGMt034ZGleAQPq3+v01rU444+hvZOjdojPU0vuZ
	x+Lhk=
X-Received: by 2002:a17:90b:4ec5:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b1b0b8f9cfmr5958543a91.16.1794825409891;
        Mon, 16 Nov 2026 02:36:49 -0800 (PST)
X-Received: by 2002:a17:90b:4ec5:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b1b0b8f9cfmr5958521a91.16.1794825409384;
        Mon, 16 Nov 2026 02:36:49 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4adcdesm36374645ad.10.2026.11.16.02.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:36:48 -0800 (PST)
Message-ID: <0d4fa5af-e406-4761-aa58-534c3c6a043a@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:06:42 +0530
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
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <5b6e4031-4c52-4b67-82c2-0033d13b15d6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afadcc2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=y5txsNG1kXPmV2KDPIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX+YdLVhOfZNkU
 7EwVXh81V7aLGgS3FDEeNH5f+ohPUUPZ3e7cstr/wwcRlJb5jFmwoVyNd52uiJmwvkqjtfQ96HE
 XLpox/C6WCJgOxWAkRt2ecSOMyKzozg=
X-Proofpoint-ORIG-GUID: BpPtPpS-h_5Dd6sLO5tAfTAZNbqH45lA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX1FiCYMTZ4R+P
 cLMvaNbPIHqyrwLhwrpKrB0Yfp4rgtOf/zKUHC83TOuwfNgNP7hMK5gd7ov0UcB64crky5UI2eZ
 iRsNx0XG84363lJZiqHRKYOP+fBlRdpzst1Q2/7eybAlyZNZ4c0ypFRhJU0JSNMuQAqDe6QX0V9
 ZafvYpWojLSp03TV5xzGSGp1HxV50j1EU4uer8mWGwCBXFJnI40zQfp2b2T5efvkK+N8zjXnZfu
 P48vzki2FylAAm3w/tzMS0twrPZcn3pdyjTS7lZy9PMysnmnIORkGllhzE6uathgcEv9kxDWyzD
 lQcg7ov0LKbXgNwa+aWpI3MLcnIFrR0BdcV6bTXA1LtGuEkXnPFMwxrjPTYWKrRyduOaBJOnpZB
 8m8Gipr9uSGG6T1E46cvFh1aZCXAw1Dyth4wYE6uIk8Mtj1uohxjMjq/u8PEGcdJZ6IrQuET8Gu
 LbUI4FAsDcJmiK4r96Q==
X-Proofpoint-GUID: BpPtPpS-h_5Dd6sLO5tAfTAZNbqH45lA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160042



On 11/12/2026 7:27 PM, Krzysztof Kozlowski wrote:
> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>
>>>>
>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>> protocol ID for QSPI.
>>>>>
>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>> we add bindings for it?
>>>>
>>>> Hi Krzysztof,
>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>> submits transfers to it.
>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>> I will clarify this in the commit description in V2.
>>>
>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>> Linux.
>>>
>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
> 
> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.
> 
>>
>> The third argument of the DMA specifier in the dmas property selects
>> the peripheral protocol. The GPI driver programs this value into the
> 
> Yes, so the third argument can be value of 6 because it has no meaning
> for the firmware.
> 
> Again, follow standard DT bindings ABI rules, you don't get an exception.

The existing GPI DMA driver and binding uses its third cell to identify 
the client protocol. The driver takes that value from DT and programs it 
directly into the channel's SCRATCH_0 protocol field.
Its mandatory to maintain protocol ID-9 for QSPI.

Other protocol IDs which are not part of upstream are for AFC (6), SPMI 
(7), HID_QSPI (8).

> 
> Best regards,
> Krzysztof

