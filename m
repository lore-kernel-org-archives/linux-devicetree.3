Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A4432E98
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431469; cv=none; b=OxqFrqgoZXVjdUa3paXl60kvTpfxb4TOR1bbmhRnLDqQoG2OW9ELzHXN6hMniKhRsfUM03d8/z50Dhhhfmz/BI+xBenEEKx2/JSsaDzIzCS3ckxKKu+kRwyy/TYAxWDpJqyXUmV4cConn7ZUKGcWc8/2v9OVp2gHn+cJ2HF9IkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431469; c=relaxed/simple;
	bh=kPktCVfGSgaJPZ7kLJjrZO2ZEHofop+Fsrv/RsVNmrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtYRnLwQxMioGdHpVggE6TP4E3tdcnC+AyatQZBXO+n0dtCADNBBl5fWAPJpkD6IEHb431109UankDBC/DIB9QUahwjWrPmV/STru4bIvKgZXJdJdn9tNQSZSJJbBOaawuJ2Y9o7VEBwIEyHXvg4EB+Evfgcyd/4mMqA+7QpALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnXIfORp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OP/5Cn+M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnXIfORp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OP/5Cn+M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWQT81179762
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gPhQOOU18qroC0E1Q14tMzdx9r/lWFjKmTrH6UjN/Y=; b=MnXIfORpqIF5xwVt
	sBUspfTYuCpKLWMMASA8/zdHcMR+hOt6ePC2Hq//4eyVprs5jxvuozhfBewtnVpZ
	DFFingb9f2mYN5cpcyLQWG2SBUBLDqMpKWnOjcyI1tOnq1sF7fhBJ5s01A0NfzFW
	6GvmhagI8wLoNZY4G0uGJ/5SUMuCcpadnL4OdUXVCD2WFOkMC+6ODA321NPj6Ubi
	Z4kcdNB4/6CvN+AkEp8ws43CbMGzrs11mWskDv+VO3M3pMVJkuzRNQPVDyoet28W
	ol87zaHQEX8GypOsmDVUF+Ua0deaGg4R6CDgUQbq0Rh7Ah25zaZ1gPVLG8/P4/Fs
	toEKdw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n80vf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:11:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so4371911cf.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785431466; x=1786036266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gPhQOOU18qroC0E1Q14tMzdx9r/lWFjKmTrH6UjN/Y=;
        b=OP/5Cn+M1FD4DgnXqwqc3E9r0eaGzf3j0pWMNeBp6lNNzWuXeyzPYxM9pCzu1uXYB3
         Oz1egTOIChQNBmLY/LoNEl3+/B+bn0IKavnEOAdkHnTHhB5gXxlRfwPlFabDsiMMlqK2
         Vk+Cs8F33skBuPcJalk5f4pS4ZuA0moBWSTKnq9C7hRa0TstSRaQrI+CnhCjD/VVXAaP
         skvkg95i7qAikpiIsw63eG8+K5ZsygiA4WOaeYEqkMyKHzKb1jSqo2F7CxbaiyKJ+3ZE
         L0RusUQQ1iUgkHR++oEbGRn1oFd6k7KWi3NknyxFlxMaQIS8YyFMvOIdtjn5Q+Ptskqq
         5TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785431466; x=1786036266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gPhQOOU18qroC0E1Q14tMzdx9r/lWFjKmTrH6UjN/Y=;
        b=OtzrOfTX3R9ZLG8jgSdKgEl1mry+GUdfDlqhDYtRMeuUWDYNzlTqTZcmlF+UVUKnGy
         SIhEhUDTzXBt8fkty8yFYJkqNLZrki1JESJJy09WWQy6U/9stqP6u1hmmY2kVNHr9Oqa
         EcX1Ka7DzWnilWMt67yPTJfLzSZ0Q1n9nA6AyPuZb2lCDKEdFW0KoHE491n3UCS6XwY9
         8B1hqcd/ZzqKFR3wesjRbIoEmoDkuNMCcifEOb2k1M2d+Zy0NZbXGDe67CxKl4BiLEKt
         8IjTRoB2aRdtaeG7je5e3p1qRToraMDJRdwcjpuWSIukfAK1SmaEyCZ3CAY9aAFXMSpf
         f38A==
X-Forwarded-Encrypted: i=1; AHgh+RrBfnTjmlxWdbTLWEGhSVCBCrRUTVtA0j7aS8FM0vB/8Rf9HacWNxtIPsGoabbAoIJ22sHjlxQt1mmu@vger.kernel.org
X-Gm-Message-State: AOJu0YwI6mIbPdWiDwzg3HODglC/VvWQtMJ94fI9+UqezwxkN3JMZYqi
	rB0GQk6ugBCnGoHRuXIephFcEQ6kNY4JINBI8FZDsvDUuBLy3ylzxkcLrt85xRhZJhTmF1CkCZj
	1zWhHeKJ+BNzgBpqxsATOM6RgM2AWxElWuMAxoGodbkn/68zIcspW8o93p0hczm0K
X-Gm-Gg: AR+sD107PVCDMLfpuy8RW0Z6Bjl0yAnqpe/EFGCFMzNfIcX0f0seKgbpfBp3Es3hP3u
	fvetdvD196nSdwuvWNdV3xmeXVLQqq1KZQBiVaDXnV8mVGRzG9U5T5viAYzQaHG41oFlMmXvxNN
	ZSMz0MTy35zY1IdSyqGofR1rJHsjQVqa4s+0W1FEntyVrwEwwFlbhJH/0YOGRmrAQv1yHyTkwPj
	I/1cV/+tkx284MvmSp2u0OqeVIVuMSew25fgmoO6jl8BIm3CS/NkKsj0yplquU0SrGWAyiAr8s4
	oB0ApUNg5CxYmbQ2gyWvlyGokLMNGKtEmmoaPxUnn99GOY73haHy6Gchnb2Q2YQOCArv0rK+1e3
	NqkeL44NzPnviMwIWqZkJcJJH
X-Received: by 2002:a05:622a:4ca:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b42b78208mr16495341cf.2.1785431465873;
        Thu, 30 Jul 2026 10:11:05 -0700 (PDT)
X-Received: by 2002:a05:622a:4ca:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b42b78208mr16494481cf.2.1785431465176;
        Thu, 30 Jul 2026 10:11:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8b760f5sm90599766b.32.2026.07.30.10.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:11:04 -0700 (PDT)
Message-ID: <01a90313-8cab-4502-92ed-761834763f8b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:11:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <a46f1394-f006-4a13-b251-e5e2a0494b89@oss.qualcomm.com>
 <f079642f-87c5-4b85-bba7-f4d25e2be2a4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f079642f-87c5-4b85-bba7-f4d25e2be2a4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfX45rTCjUBTY4o
 UrFZTML2HRQ8/PXBIm958/4huAvgj1GMRL6Uqx9b7LF2vYyj1VkJ+ywAWBUHu7QvT4NjJofrkpt
 LANrcjHaZ7UuPqi//s1beDbZGremSh9pnyaqT7Pr/4Nk6mRLwdSlxci7D1Ebebe6dcwenYeVfEd
 zMjDrFkxMpcp+jI1OgVYLMstQPaagUFlQ7oxmImOe1oZbB7NUB9SoZHKFJCJbO37oP7ESQmEC13
 XwW9DPg6ivb8X3qj7Ruvv2xQGQcjK2thQf9S9j3AYT4RuJESDp7cPqZ3nk5K5f6vTfknXUUt7be
 Ysn30VgNuD74X4HBeSmWXmGmsAwnKSvOrRlTFfAenfQpPLxM+a4XoPt+x0KPvnh6q0lEIabcFEk
 Elt0XmG43pAMGLjJhdwlMg7opXVnqletWA7oDSyhZ838M4mASoXdsim8LGg0irNfyZlqVb7zAUM
 HnXbMGLvJc3qed3UfWw==
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a6b85ab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=5TKC7vhQAi-i42DR7gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _u7oU42liEV06diUO7j_zkMWibcPHHs_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfX9aobC4JMhzIp
 OGTrflLXtRXZdwIGzAR5r4Fr7yjI390cEvNdreQ79D2Jkv+pP+Fr7uLg+V5eW5Ed63LNr+3eWwD
 M9l4tXw5YWA4tC0G+HGyRU5MUMXkcvM=
X-Proofpoint-GUID: _u7oU42liEV06diUO7j_zkMWibcPHHs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300128

On 7/29/26 2:13 PM, Anvesh Jain P wrote:
> 
> 
> On 7/29/2026 4:43 PM, Konrad Dybcio wrote:
>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>>> providers, and how many leading sensor IDs on each, whose readings the
>>> driver averages to compute the SoC junction temperature reported to
>>> the EC for fan control.

[...]

>>> +  qcom,tsens:
>>> +    description:
>>> +      List of tsens providers and, for each, the number of leading sensor
>>> +      IDs on that provider whose readings are averaged to compute the SoC
>>> +      junction temperature reported to the EC for fan control. Only
>>> +      applicable for Hamoa based devices.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +    items:
>>> +      items:
>>> +        - description: phandle to a tsens thermal-sensor provider
>>> +        - description: number of leading sensor IDs on that provider to average
>>
>> Why don't we want to look at all of the TSENS sensors?
>>
>> Konrad
> 
> Each tsens provider has more physical sensors (16) than the count used
> here. The leading N we take exactly matches the number of sensors
> already wired to board thermal-zones for other purposes (CPU clusters,
> GPU, camera, etc.) on that provider — e.g. on hamoa, tsens2 has 11 such
> zones and tsens3 has 15, matching qcom,tsens = <&tsens2 11>, <&tsens3
> 15>;. The remaining sensor IDs aren't referenced by any thermal-zone on
> this platform, so there's no per-purpose reading to include in the SoC
> Tj average.

What you said is true

It also doesn't answer the question why that isn't the case

Konrad
