Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D869B2765ED
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229689; cv=none; b=CaQZrd3cYhSmZTRzAnrE46qcLRe7AZFOGm7Ru77nexqQJywssWUdSqZPj7NKlh6oODAusE9Th+RbuSAlNhnIiKOGWNr31UGx4uvKYNAauWbzPk6xQWrZFzzGA1I8ZJazJN4vetsZ2Z4RevbHvIoVQxLmGCPSuyK634YemBSAEN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229689; c=relaxed/simple;
	bh=BpThCkBXjZBhx8M8F0BUDiZsLcu4WgQQ7DXbv1cN7R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdhRpBkh9dATi/AlXTWIMFrMR1GYRFsXpLYVLszeqiH37BiQ5uOEW8awGjmyp9mGu8h+GJMtQAcWuBiqczRV3xEslVBH+sZOSKnyW6V7uby4sPjbnjiImw0dR+qC7RTkYNYLoRRUTn3dgToPVNrbn3LNQTWsHOe2ExCESPbBgLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeFNXrTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NddsDcRx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeFNXrTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NddsDcRx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZMak4017320
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 15:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRAHD2dQC71qI+sdJjmGJW9ARXziUgn1C+t8q52zArg=; b=SeFNXrTbH/MryWh8
	7ZbjwBZhpX94sgDqC6K8dVQO3Tcg4gUnhIaMAplEBMu6uttCQ1rVAZBNM3+F4n8D
	FJYGknl5lf2C3oLzNddSWAhJ46UMJAcGgFWAeZPRssd3jpsFaI1SmoGd/sb020bv
	cuwIrHeWL12AmJUrr01nSsVCYbNJoekzK25zhVBWh9KGGj3vKgqyJJchjg+Jz9KV
	H2BIlz9rSaAs8FN6Jn3h8HmzquIKYjQZaiuwPa0k6JY7zZQVkbcU1EMoRCD6xocC
	TUs4/INOc9/+1QoQnAEpqt4N0eWfOA8tZWI7A6+ps7yRSepV3onCYDevmIhJ/npH
	Ylesew==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjk4x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 15:48:05 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966caf13891so43508241.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782229685; x=1782834485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRAHD2dQC71qI+sdJjmGJW9ARXziUgn1C+t8q52zArg=;
        b=NddsDcRx4b+KWwuLTOmINm/2wjf3P7da/+gHnzncF9yfVFjbH9K/ekrmMeosxaHlX4
         Dlji0gQPERZJUwRPKj1p6ROmok8WXcqEi8p7OeHdk5ssbkqHnyzTB9KytBvdZpSchlY1
         BERNsZoYCudTxs/J9w1akJ6LJGOwY14yHxwr4lZyCRNgV2ukG4Gr54sg1xbKEO/Bqo9X
         77/0STSL0Z8uzF+l3nBeXwFPvVI35NXsOLoyf5M2QUgIvtNzb0KdrnxWHtxMMWGl0mNl
         vJshxN/9nErax/YFKVJnrO/2ABUDWVLwSmKhOlKXNsDHtyb6zt5WO3UHDn+EmraCPwFf
         ZOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229685; x=1782834485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRAHD2dQC71qI+sdJjmGJW9ARXziUgn1C+t8q52zArg=;
        b=bKgtzxneLhK4dUkm94VzAX0JkpOzn6ue9r7UI6ATUOoChxqjoOyqeDQILmz1k9AhAz
         32LWYM+Qeq/c1LpW4ltrrBqjrqf914sv/9YhZHUKWh42fAJ1583MYDGXH34AVDWPHnA6
         0GLmfdUrX8HjIIC3ifLUh/s6DAi/qvXmxPOeoj3i7IJ9nNObJmcj9axfoz2BbvyhcM94
         +b5VEJ/cw9zIBD2R43FrpxuRPNyxCrEhUg/P4pPeDcoV3nUJcS/Se+Ho6fYXFNSxnPKf
         +26EL5V44PHJ1HSA+WES8MXZwe+lUlllTFDcEXWuqwQWR283R2V1/TV1htpT8MrKYsyG
         ehNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2qjYT7TuGGCGV9hGuqv11G0nd8negFgbG5WjXbuDSoX9Ca+b/9+CuXGoCw2PKc5Sc8yT5gcBL0S36@vger.kernel.org
X-Gm-Message-State: AOJu0YzqWi4glu14pHlGJwCOVXfdW/S6Bd6SFbaKK/vz4ywk1jtZWxTO
	3MOw+wjh/+GWHAyJYOWLI12E5a7x/gdSC9JXXIxnNXS+ZAVTt8yYG1ATFhYK5efxdd3Rth8NOqo
	4qvNzitKKjmLvBZczVXqDakYq9ms/OKvdas6PE+mfIjgUKIlYsXD9SSI3BI5xI95/
X-Gm-Gg: AfdE7cmuCZH7w1SmF71PX8FTx2wrbJy7po6QV/JUVc9J8adBhmZMhqCfZlcr8JsUfX9
	K8v/dsMw9nAd5STvr231GyqqCphEcyGFRawgHpOyfbqw6uAw2z0B+AsP6dtII6St2k2ou8T2cbT
	DsGQP9sRvhj8+WkjnE4K0Fs3F6xKced9GAkD3r3haLu8C7NR7YAVlAuQ2+0H48Y55QmRia5eDyW
	b391aBakWWRmyiB1PV9rFclvDGbGkn2qYodjk9AxirQcJ0pD2Op5E9AArJCfJHEqNHXPWdgmlHH
	2iRaTKqHhNcY0LHvbUEtyW/I4K5+0juV7nW8TTh8ZenWTBxBFydTZyL3YdfQWhk9PQOl0GRtuWK
	4rNQfdhpACWFz2HHHZyLEQRJhYQFktoWJI6c=
X-Received: by 2002:a05:6102:5246:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-72b161702acmr3691514137.4.1782229685153;
        Tue, 23 Jun 2026 08:48:05 -0700 (PDT)
X-Received: by 2002:a05:6102:5246:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-72b161702acmr3691503137.4.1782229684724;
        Tue, 23 Jun 2026 08:48:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be32083sm5011680a12.14.2026.06.23.08.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 08:48:03 -0700 (PDT)
Message-ID: <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:48:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
 <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
 <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyOCBTYWx0ZWRfXwfMTAz3p5LHb
 fc6R//VWkmqvrqTMgWxVXZd3h/DP+5a197xWh9GPGEkT4XYZ+Bog5h7lLxe6ppC07GD+Y1kbZNF
 kDzTy2VMGanwfEqmx2HO1DwoLJppOgvtLwEPc0dzfOq6nquiAaIt6akf/wst0MKZ+f0vkQTtwca
 0kCTen1IxEnYr/mTzjK9Evdfo+N8Ph9DdOEajMxJD49O03C5gW9q6MOaV4mwNIXdpAAdzT+f/zg
 ewi52IY9MoVWPxU4H2VogZAWpestOzTvl6i3liarbRCqCgEGgsMsuw9NEyRphA3YvRW9/Q8LJxS
 /9ZQWue/GWkwTsG4qg2ZvbcuVgIwEOi+TfdeNpxYFVH0bNmkjAKZCZOnlKxwpz4Er2w7wuxpBjW
 ajmTxW5M5KMBH1DODppzXIzkIqKj0QJvsf2zI0cD0YR5lk9Pa5wqWsIoKJb+bxk49dg3e1/pa4s
 DIuoA9lNsVN1D2ReqZw==
X-Proofpoint-GUID: 90uSAukgbgYKY7MZmw5Q2c9XETtOWwt9
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3aaab5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=J2pCh71u1A4b4KVnFjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyOCBTYWx0ZWRfX/2fUQbsfdw5E
 sLTwUgx06MQhDEDgijfmq2Z99nIMe0ioFI2Gl9dBGJshV4JJeV+Y6tOgKRajaouIAO1UexXz/AA
 AcWSLPAt2XQTbtJpblY1nazbROm16+I=
X-Proofpoint-ORIG-GUID: 90uSAukgbgYKY7MZmw5Q2c9XETtOWwt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230128

On 6/23/26 2:26 PM, Harendra Gautam wrote:
> On Tue, Jun 9, 2026 at 3:27 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/5/26 12:37 PM, Harendra Gautam wrote:
>>> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
>>> controller used on the Shikra audio platform.
>>>
>>> QAIF moves PCM data between system memory and external serial audio
>>> interfaces through the AIF path, and between memory and the internal Bolero
>>> digital codec through the CIF path. The controller needs a binding so
>>> platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
>>> clocks, interrupt, DAI cells and per-interface AIF configuration.
>>>
>>> Describe the single register region, one EE interrupt, the required GCC
>>> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
>>> child nodes used for static PCM, TDM or MI2S configuration.
>>>
>>> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +  clock-names:
>>> +    items:
>>> +      - const: lpass_config_clk
>>> +      - const: lpass_core_axim_clk
>>> +      - const: aud_dma_clk
>>> +      - const: aud_dma_mem_clk
>>> +      - const: bus_clk
>>> +      - const: aif_if0_ebit_clk
>>> +      - const: aif_if0_ibit_clk
>>> +      - const: aif_if1_ebit_clk
>>> +      - const: aif_if1_ibit_clk
>>> +      - const: aif_if2_ebit_clk
>>> +      - const: aif_if2_ibit_clk
>>> +      - const: aif_if3_ebit_clk
>>> +      - const: aif_if3_ibit_clk
>>> +      - const: ext_mclka_clk
>>> +      - const: ext_mclkb_clk
>>
>> Drop the _clk suffix, we already know they are clocks, as they are
>> listed under the clocks property
> Okay, will correct.
>>
>> [...]
>>
>>> +      qcom,qaif-aif-sync-mode:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        description:
>>> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse)
>>> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
>>> +      qcom,qaif-aif-sync-src:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        description:
>>> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
>>> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
>>
>> Should these be boolean flags then?
> It should not be, the intention is to define explicitly, for better
> readability I can rename these flags as EXTERNAL/INTERNAL, Please
> suggest.

Are all 4 combinations of them being present/absent valid on shikra?

Konrad
