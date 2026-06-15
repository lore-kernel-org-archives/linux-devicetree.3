Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F533F39FB
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527082; cv=none; b=XPKW5Ffvm7kauDHvenE3E4HuhK7UYOzivxtBjZOI5uZkTFNF5IynSx8Za30mrTu3zomv5/lnsl1ADnvK+2Be7SURIfbdpwQ849OU+TzWVVXA2KVDkvFhGmDp+5UuBTL+JeA7XXRgv6qc119umq2j9igxnKwoQM/7XJeTiVRNUN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527082; c=relaxed/simple;
	bh=shm6+/batjeGGoSvU/eroLSTAR66/jZMHoh9s93je3E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RhxSXQdiribSQNGJfZExGJ8U5JfsHqa2olzi8eiI/rqHe7Z6+uRjIFO4Q0kqX46o6yctKjDTr8KoozvMCKOjwdhMGaihnP4ZJXO2BitwfR2I5ATP7ZCSQyMHlQ5fRj1fJygQyc0q3WHEU+cQwAH4lMS1UVZ5/pTzgIxGxWoyBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puuLkSRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+IiuNUW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puuLkSRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+IiuNUW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZE264116367
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qS3qUEtztPgmxfbaeaqpV7S1LQRALWWl/ZUML3/0rk=; b=puuLkSRZv3e9ztMB
	BH+vmD6//mTiQRCJMltHoLzFNdxUk7qDL73GclbN/ffeQ1U+BdqPBi2fEkuvv6/n
	OTwOhvdBgh9s2slP63SVvYmnDvzLwoHpQ3w6iMJqNv+jrDg77Rbd8LQPetRuGmPy
	672ePlTEiAbC3ndyOzvOxLhSwthelpQZCPiC+3u2v9l1rcDPuQI1lU4TmulDsGjS
	CPK3/in5yDusw3HFK4AahQSBC6lFI9zDlixQlV5vqjssBVb4QphWuGBt0RE/xZMq
	EQQSiamyTgVLeKW6ZfBcQ6nUB1S+gcPh8U7s9/wpV0TJ51fzqIONtjbRw1le1/Pc
	fLi7KQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjrpgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:38:00 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7e9dbc4039bso58403907b3.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781527079; x=1782131879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qS3qUEtztPgmxfbaeaqpV7S1LQRALWWl/ZUML3/0rk=;
        b=O+IiuNUWK1G72jMU/6ZCDWVozkeT+ScqSjLdqAuT1pdylsSwswVZsZoJJBtI18/qrm
         qESftYud74BmJWYSJ/0Mmt49ffK68aza9OPC3dme6i0TSR8do8L0T0c9S1vOaSEf2a3b
         effnYJq970ih2a9y4DEUfPv8o6s5tobshkNFvZD5LIgnwhD2+Pgc9xhNpNsd1OLv4P93
         pru+BhgagbGsuZou2gsi36k/tQbUDhV7vaWJ9pfC4LPHWAhpEyX0+WHlMCQKWJC8191e
         LYSXeUlaDKJmc1vjalsG9EPr2MWzm+zP6ipojSGdhfd+0fmfkjh99Ah/XuAb3tTgTQ1M
         AeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527079; x=1782131879;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7qS3qUEtztPgmxfbaeaqpV7S1LQRALWWl/ZUML3/0rk=;
        b=ZXHKqYHfXPTlwcFk/aDWrIv/1yZKwMN2vgd7RDp5vbi1Rq9A2+OgKWC/Nq/eFdpZXy
         rwTc4nhJ0MVVxc4iIhlVEueMWrc4q3B2FUa5UllK/s3yE48kwDVUDCc0A/GElDa7eoCS
         67nH88+IfgmsubgtadJwdw0bO0hMSjAoQenM/pxUElC1K5mhcQs90bZ/qjsP4ZnDH5qS
         2dsN3dXaMyx754mf0A+c7Y3lPZ0narUWFAEggAe3VfYRGm9xKtE2h+YOqyGXs9z8K+wI
         r4rPcwl1ZVKxR78kbFJlcbynVYgxlLQIyPustrouEwI+A73iL/2CHG6dIbSakOKz9FWS
         j1BQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vV0wqos6rJJXWD0Lt9SDJaWyb4LlaMfQuD1yb9RGDdINFSevliXI13gMCg7qoM5E+PxxeTOGThHID@vger.kernel.org
X-Gm-Message-State: AOJu0YwUuS7pVcr8deHbhn2v4VwY1yI+VrLYl6vJFtE+6t1Hp6AoRce5
	QVqQCz/ERmFJ6CMrrDbxhsHc4FCYUtxbDWfBBpIZGULqhKrWKizy0kgeoX9loNMScEJTx08wxgp
	6lz9ZTZoT1NKW1z4GFJuQ8CC7fNn9Sxgz7RfmCAqo3YsCZTlmXH9N20lVFSF17Awg
X-Gm-Gg: Acq92OG2GBAUOF7KXTje5v50g+1hlAj8CarsBpRn3Qn2Cp50FH1OfBcDnI8kBYsAWXr
	ckjla0OgLWhPu/9GUgKrhhx+8qSsZdqUCSnS1Y5Q1scHK3c806MrZopd8nnqjP18ao7Jtn9s0Im
	EqGhIeVN0c0u7AaWS8reTfPF2vCSDxB6IkKsit12zE+44gvy9gpVw1PEVRLXgZgYgU6LklLDVHv
	yaUCTQueVp4mxe+xlW+B6LyBplA1JQJ29bna6inJ0fs49M2pJDJ50twPe8w+h5VqNMBTFJYVY+5
	euyiizNtn935J0uuMo7tNT9zS+Q3igUfmoZ0hbW0DxFWU7RofNKoruEBMxQ98UKFihd9UuNIjba
	f8yxE1uJIATlXm6hpbATdnW+iEe/HQSDbp00lsYeFU9n2MWBdHDmtsCzxJfTP
X-Received: by 2002:a05:690c:3a0:b0:7db:d527:b8c5 with SMTP id 00721157ae682-7f797da207amr127680327b3.16.1781527079240;
        Mon, 15 Jun 2026 05:37:59 -0700 (PDT)
X-Received: by 2002:a05:690c:3a0:b0:7db:d527:b8c5 with SMTP id 00721157ae682-7f797da207amr127680107b3.16.1781527078865;
        Mon, 15 Jun 2026 05:37:58 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7f76e2b5564sm46351087b3.6.2026.06.15.05.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:37:58 -0700 (PDT)
Message-ID: <dde8920a-40a1-498e-a7f7-a6e3b225d725@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:07:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add
 qcom,swr-master-ee-val property
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <66c097e8-8b5f-4b78-910d-799bc0a488b0@kernel.org>
Content-Language: en-US
In-Reply-To: <66c097e8-8b5f-4b78-910d-799bc0a488b0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMyBTYWx0ZWRfX6KhmgrlHurQE
 StzViDhEuAiyqpjO1TAhmc21dwzY+kXCdlK8wxtuqjJ3UMrRoI2kRXBPNK5dhUz4QhFy6ShHQsf
 0vmGYSKs0hKEAUZxaUiiVrs0UROGje6Raouz7nm5vcs3PwTcaiB4ax/AqDUERXXLWa4+5VBbK29
 oWmhLB9XQIn8UyLd/Ycf+McmHtAk7EQf9u1D+ZrZxWLCYdYd44QspS7RcX38gr354e3sLxhhKro
 cD4F4k/ksfkTlSC5HWtbJgbwZcEI48O6uYW0W2FE76KjCI7F6k8dNtTXuKp/cEZ6SwRYC7ppHr6
 WNTBwrNTBmW57cp7UGP7UCiUoMvrAKdklwC7mIz7HAJwD7SDxMdII9htkPGjT7pSBeC1cSsVT43
 dqLJgqLMdBRJ5NzskCsr00HDlZUer9x/Pg+3hKTk0U5B3pdm9M92nrrrhX3s5nKVnSbhaHZJUC4
 wLOiFkzY4G/1RyjLSEQ==
X-Proofpoint-ORIG-GUID: 6LGtpIC9Vytv1GOZYdiQzTTvyD5b6XQ6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMyBTYWx0ZWRfX8dK0s6KvQmws
 7CzR7FIU2xJ25MZkffjgX90A+EERCkMd/fl2A50jKo8+jZ6XEzUSIuDSpz2KDqgvGPFtPStTJBG
 DOf3Y6XQejhXHlPtlzhNZ8CmQEwKRog=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a2ff228 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7Kj_pnbzCi8ss0lAJesA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: 6LGtpIC9Vytv1GOZYdiQzTTvyD5b6XQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150133



On 6/9/2026 1:16 AM, Krzysztof Kozlowski wrote:
> On 08/06/2026 19:53, Mohammad Rafi Shaik wrote:
>> Add documentation for the qcom,swr-master-ee-val Device Tree property
>> used by Qualcomm SoundWire masters to describe the execution-environment
>> value for interrupt routing.
>>
>> This property allows platform DTs to specify the EE value used to direct
> 
> Please describe more what this EE value is for.
> 

sure, will add more description what this EE value and why we need this.

>> SoundWire master interrupts to the appropriate CPU target.
> 
> Interrupt affinity defines where the interrupts are routed. Not custom
> properties.
> 

Yes, I noticed a recent change in the SoC Device Tree where a fourth 
cell (Interrupt Affinity / Target CPU Mask) has been added.

interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>;

I will try using the same configuration and verify the behavior.


>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/soundwire/qcom,soundwire.yaml       | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index 9447a2f37..5b06cc1a5 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -215,6 +215,12 @@ properties:
>>             maximum: 4
>>           - const: 0xff
>>   
>> +  qcom,swr-master-ee-val:
> 
> Aren't there existing properties for execution context? I think Qualcomm
> has something, so you should not come with a new property. Assuming this
> stays in the first place...
> 

Thanks for pointing out.

i see "qcom,ee" already exist in qcom,spmi-pmic-arb-common.yaml.

will use same.

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> 
> Missing constraints.
> 

Ack, will fix in next version.

Thanks & regards,
Rafi.

>> +    description:
>> +      Execution-environment value used to route SoundWire master
>> +      interrupts to CPU0 or CPU1.
>> +
>>     label:
>>       maxItems: 1
>>   
> 
> 
> Best regards,
> Krzysztof

