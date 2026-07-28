Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C46437105
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242117; cv=none; b=kQUtwWaxXE+GK72tirXWU/uggioFO9c7gwj6B1LHPv0rcmBoAJVJrCULizLe2GQVWpxvxvMWtwUN0xsnEGgPVgRR6DdgPLyo1W+FRLmCaXmcLsM4kKCjgnytVb4HBHzSajgn0zX3kgmoGu91lNH5FQj+fymzSyv4pTEJ+FkD6oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242117; c=relaxed/simple;
	bh=BHUKyH9WBsuwaY+LJnTfZkT8vBCWqmg4xs9qf06QG9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyS5XVOEwFcdYJfZecG33dtjSR9ECR3qAJKdoybRz3l7hMyQzwOauFyGMDMEfkhyU6984osOkSciJpf10FFR0dh0bFUMwn/hoSp1Rq0HvkNq03yC2+CHKcgv1zY7XESZ+D94ZBeFcHv53nEnJZ0O2inMaIT4iuBVTqKqSS+cdc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzwvYv58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxdaEhKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzwvYv58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxdaEhKO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHAtl2940159
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kl2k6NSN4LyUORb+N3Pa475/gw+QprBIU2Vw+TgYMRs=; b=CzwvYv58gpS44mTl
	PQa3msXvQfKMNWp50xMNSFrNGYWYx6rGrhxcjjqhaiOKWVphBl9Ad11/PnhCuG8B
	cpQngE/9u8guJ4YlOK+LiyXuQB6FGAR+WnOPCNTnon5u+VaUJjPPtHb7lUlu7R3h
	BkEsKlWkeywGCcI0i7/Vgde3bIPrjV8i0XtlizKor4ZS0WZF5lCpdW2xCihsdHXG
	39CiEDH1ZIluZZ3KIx6RD7goj0uhZTKDp2JJASgE63Yg8fnVmTfslHsnUTFk2NnE
	79E8JvDURFRqP8WZ54P7mtM4Akb8mtUx6oTlCd8PBJS3xJQcPf2ovs99ebU8xueM
	yO8Ihw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy12079-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:35:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so2710812a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785242114; x=1785846914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kl2k6NSN4LyUORb+N3Pa475/gw+QprBIU2Vw+TgYMRs=;
        b=kxdaEhKOcW0rAxytHgAc82jh00wwVpaguHclmRVucOY4qoStD1DwyM7K1BvtOMud/a
         /+01q0pbo8pg+wJ9LE7nRQHqleIEYYTxvNqWRb20e1f5wiaKwEvCi/7/iZbm9z77T/hs
         t4z+ZRVopg1gsJFlS6q0mjsIjeAIR76JEK/LVMGw46IXIAhYZRrhM1M8e4zPTOb3lHnj
         M6UVJzvRjhGhM2oN8tqTtgW7O5ACiw9l51Bi5jFsZeh2g2mBLoxq+s9zuIHL//JVsNw5
         Zx7fWLG6vpE6JVJn0v8xbxphJliH11KoHwSy+mN0iNLSGzBzh7PAT0oUXT1WOlqT4qdo
         2LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242114; x=1785846914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kl2k6NSN4LyUORb+N3Pa475/gw+QprBIU2Vw+TgYMRs=;
        b=Kdp6u5CKclOuOQ8ltWAH7uhru5drQHypSW9rJZXZ+Xi1fyhBarjzxMDzacLXGuuRbm
         zADdk25gIV5b2vQeyoj6c27UEmmSB4Vs2smaQ9Bp6/nlOiNYR0FqtED4w2EomkO8egkH
         8/xe+KYQ0KkOOybi/LQIyjZfSMnCCYV8hDlwo8OQe2RNJCNtlEXM/OLdvzhE1ME6At7H
         GaKpEngjiHZ9eEacFSLv6KcPhp08FDPiIqUJ4huv2ohlNYVuWezsSRt7VWOusJZpX8Rm
         o9XzbDHezqAD1OliM88GdPEtAov8zjV4tmHrfJs5IWFvmdRxfuwlYfeFFBhl8nLjMimi
         1YlA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5g5D16yFab0fS1R3th8TFUXNZc3d7mMevYyVIUDhRRJ0ekECKgS5t/z8esfLyr1q9CK2b+Hl1H84w@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnji7TiUi2lEGeiY3V55S5YXrBHk3hrGuD595B5hXGhEc2iEiD
	b0p1rpzDiie1h6yXcHzlMgiRhVXjNhIoi4K9Avov3R+IHrjN8QABuaGkxMgTXlNWfe5PJrbAF01
	HL8Y49wN//0CjsB+b19xKzfZr+IvuzlMeu2d7pvGNsogFVu1d/mjHviwwYBs237o5
X-Gm-Gg: AR+sD11t5zQTcVeyTwI6JR5RU/6x2dbQAvc0/QBolFC77p/eZcIgnlcHO+/eyUD3XgT
	gQC7h6+MeDFcQusF0irmt9SzZIjtICKiW/vjHJNVMZ3L9K2O+LXid9HCOVUineJusQrgQjsNkUS
	6wjqDDSytnB5Wb3C27XJXP8yNwU/pYAgxWhiSUZErLV5jlyrP3DpsR4rPGxwlNANTn+y3R10UNe
	w3k+ZL9gLUOlrcpgBgqr99EJG6cNAZN9vcMcVgCRr2GBn3GqTiaALkmYo32O06iNYupZInVJ/cJ
	xDCdqiiBCGsuZHvULlTnkmewj8X/eRNN0fL/aXrPB3GkcYr0lHiADmEYHL3vIenJWq5cLqeML4U
	ETx4ZhhpA9wqFPh2teqxVDSji4uazJOzl
X-Received: by 2002:a05:6a00:929c:b0:847:9c06:2bef with SMTP id d2e1a72fcca58-84e9331088fmr2319015b3a.29.1785242114146;
        Tue, 28 Jul 2026 05:35:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:929c:b0:847:9c06:2bef with SMTP id d2e1a72fcca58-84e9331088fmr2318996b3a.29.1785242113665;
        Tue, 28 Jul 2026 05:35:13 -0700 (PDT)
Received: from [10.217.217.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1637sm4347310b3a.33.2026.07.28.05.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:35:13 -0700 (PDT)
Message-ID: <2fee191f-056b-4d25-a927-d66d80a7303f@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:05:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sachin <ssachin@qti.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-3-mchunara@oss.qualcomm.com>
 <20260708-purring-infallible-bullmastiff-8f6dea@quoll>
 <afb0862a-04d0-4171-887b-7f32ee64163f@oss.qualcomm.com>
 <c714e746-8b58-42d8-8c37-160f8c5b5a59@kernel.org>
 <147593cd-fc4e-41b9-83cf-2e42988c5e74@oss.qualcomm.com>
 <1d648ff6-1936-4002-bd2a-f521e99bc71c@kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <1d648ff6-1936-4002-bd2a-f521e99bc71c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HtvaVyPEWPllYj4hbeQFv6mnH1GIZScY
X-Proofpoint-ORIG-GUID: HtvaVyPEWPllYj4hbeQFv6mnH1GIZScY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExMSBTYWx0ZWRfX0+v/yPu+KLj1
 kyJpMx7JGMbUXwK6DkUXXw+wFETL4e24yYPHcUZsLooG9TZG1mz0F8MPcHHzOPFmcLVxD8j30+X
 vDxaVc8jowhvqF2GhT5lRAIfcZ+7yPstwYV+knJzm9WDsJ+3q9FNLMxljE9KqhEIOslrcVm8j4j
 srODbWcSh3HYJzxA+SdPIhK8QxcMJyvAI9nNptJIaPZhAu+GzJ2ZMcMCO4NZythW7x3t+k6iVJ1
 zdyNm9MeMesMI2YFFvN8mnAi8wD13bDfqBEPkDFLsn184+ZHnwwVgVcEuzB8L0UH2THEZ3G3Nfr
 kBCDi3ou6xisP15TNbEXmULGtmN5eRKX8iz/NZ+8Pi4O0Baako7GGMcASW7zwBFDQ7IMmEA2n4Y
 jyuc47WRuePhz+K+xb/3HTOjzzTOIwN7k45iOqGI9exGyoZGANH+A+hgWpjsRgc1XoymnEhhaet
 vZYZ1bujFLbvNy793Mg==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a68a202 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zHE5WwY9fMrrbYckYIQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExMSBTYWx0ZWRfX9YIBbLhXJnLp
 z30/rVKCOLtR29rryIrgyQk9yy7Bi/2BPU6ck1sJ6lSHULZREAdyKakzwg3fVodRbXvNJzVQC41
 wT/vxibCK72F8bNbdrUs6TweDplhov8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280111



On 7/28/2026 5:59 PM, Krzysztof Kozlowski wrote:
> On 28/07/2026 14:25, Monish Chunara wrote:
>>
>>
>> On 7/28/2026 5:52 PM, Krzysztof Kozlowski wrote:
>>> On 21/07/2026 16:30, Monish Chunara wrote:
>>>>
>>>>
>>>> On 7/8/2026 12:18 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Jul 06, 2026 at 07:43:44PM +0530, Monish Chunara wrote:
>>>>>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>>>>
>>>>>> Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
>>>>>> 'qcom,glymur-sdhci' compatible as required by binding convention to
>>>>>> identify the hardware and reserve the namespace for future SoC-specific
>>>>>> quirks, with 'qcom,sdhci-msm-v5' as the fallback.
>>>>>
>>>>> Drop half of above sentence.
>>>>>
>>>>> "Document the SDHCI controller on Qualcomm Glymur soC, fully compatible
>>>>> with existing MSM SDHCI v5."
>>>>>
>>>>> You do not need to say anything about some conventions or reserving
>>>>> namespaces. We do not reserve namespaces...
>>>>>
>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>
>>>> Sure, thanks. will update in v4. 
>>>>
>>>> Just for my understanding, though: how does the suggested wording capture the 
>>>> why behind the change? Per previous comments and understanding, the rationale 
>>>> for introducing the SoC-specific compatible is the reason we are making this 
>>>> change. For future submissions, this would help to avoid similar back-and-forth.
>>>>
>>>
>>> Why do you think you need to document the "why" if it is 100% obvious
>>> (and I did state it many times)?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> This was asked because it was suggested on first-post to add a why. 
>>
>> "Same questions as always... why? Don't explain what you did. Explain why
>> ou did that way."
>>
>> https://lore.kernel.org/all/9bb28a60-2c01-449d-9456-bcf2d780b68c@kernel.org/
>>
>> Pardon, if this was a misunderstanding.
> 
> Yes, so you need to explain why you did that way. Not why you are
> sending this patch. We all know why you are sending this patch.
> 
> Best regards,
> Krzysztof

Understood and ACK, would make sure to follow this in any further post sent.

Regards,
Monish
