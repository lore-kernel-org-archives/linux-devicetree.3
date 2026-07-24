Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34801F5834
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869546; cv=none; b=cG41Tb+Nd9ed9QXckJW/d5IUXjWk55kCkRwywPy5PgWkcWHO53STIQMT/tAcJNVql7zIDSkPi8TTdTEVtkiDRvrhwxa6FhB3PRvilURaAlcWMOEQbm36GKuI45magB8+wiD6DsbtrL7np3+JfxBt/VwygOs0ns7Z6bak9Glm5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869546; c=relaxed/simple;
	bh=LWEfEdLDOds3XR8QIc5Z9en6jOOTZVUMW4iiBnbRcGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCQhFt6wvRkIThNLX6wITOV1aNTZfvwy2uyvFO5QBXjQu9SQnojqwxe5mZiYYR8B2rWC/qMK9hdJElt77oqMCaLeG+OJoCFrUU+lZp1pFbvqIsFeq6HFx7/nfYjzVM7POgqOFnkIbalwmFa+ijMOWSYYeLTlVlUG9B3kWdiVJ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxBNhm3K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dR1aJjI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BxBNhm3K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dR1aJjI9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDs62275977
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWEfEdLDOds3XR8QIc5Z9en6jOOTZVUMW4iiBnbRcGM=; b=BxBNhm3KtRxdwJKt
	xBOkWM1kbvmbt3ZV90CMT8a9TkjWxG9plB/206Cb7CiULnsEswYcFWhMI7qCp9o0
	pgAh/My9cMV3aJ3ujvbaoWQe8VCBNlPrh0pFua0n50r0R40dNqxCbiR+QtGxiFL6
	//BC/05CQpTjM0OVUnBhtXkpCU7Lt0WtHB03SUzC7Z7wfmN73eZxMNlCZ9P/hW4H
	ThlFxvnSyyiJnFa5bGcaN4ruuc9d38xYNjvWSDLhDf/OBEWmIxGvkPLMFzuEP/Nb
	esoM78m5gGyU2vEHTRgdyzQBkmvi29YIx7Y97M155XPBCC+/2THbOZoe/eSpHGor
	zCYfsw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0a3pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:05:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so151343a91.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 22:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784869543; x=1785474343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWEfEdLDOds3XR8QIc5Z9en6jOOTZVUMW4iiBnbRcGM=;
        b=dR1aJjI993YxVIrH7IjfZTGMPW6XwSFrilg4+UWXGCl4qqJbSgWCluTLFowWiEQfOG
         vEqMcMhc50D+zXNQIoiqIm8bg8ioulrTQvTSz6y2mhBVsDUz94TSdKGitlZDDH8AtGRc
         E+hz93zwHiohA4Doqu+Qgu86QXhImCZxNlrFQ7z/bfPNB4Xmq0OtSrmF0yBMKvus8yzn
         q1NjqvJrV3u9lhT8dr2vmQX87R/5WHvasgMGJMhb/J6x+ORFwjdstlsK+AIS9mozIx5b
         ENKrowK5/d5xVyLf7R/6/p/+tty4T+gmpAkcdjGMB1rzPVjIgqpV6mSdymnVUZnWk9oR
         va5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784869543; x=1785474343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWEfEdLDOds3XR8QIc5Z9en6jOOTZVUMW4iiBnbRcGM=;
        b=Bfbrg5Zm1H/jGsVOIcr8pZM4p/ZfklsDaGotD1RBG7ZdA5xpXbFVvwhgT2GFCW4rk5
         ltszJVY5/F92cwDOTqPbBR4i9OJHNzKndTj7xO5Kb96Y4OZfQYvBaiGu91tjz/Wc6UsE
         4qu+Pg4x/ETlCIvFNdgtf5MxzYYgHgSnWC7MhTn0Vk8VQZCElM6fJsNRxluvnXHIWQS8
         Aj3SWG0O3AR8DgBL387pU32C+hCFRsN3Qtq+itmepdCyGczxkiOojb6xKw+KJZ43ha5/
         AuOyv18opCpLBOXWED2a96Nl+zJHXZdOtVXvhC//jefOAa8YwVBX71LFe4EPZ4IEx/j2
         x1CA==
X-Forwarded-Encrypted: i=1; AHgh+Rr42n3KW7rav8eZXGWHLV9hmFzzlPzg0tVJxh1Fyz+FvnO9VKHVKUlstB1MXUi6ePRv2G7fenOqP4Ba@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9y/pwQ5d4q2xX7ug5y2ZSPX8lHAx+mDpf3Qt33dwqzg9RjnA
	ChXwi5Q54gXSJcu2sGFbK0PIkwwNjepkCci9eQX+P7/EkMA6L80aIW3ycTRA9R9BnyX9l69jc1o
	dIeruBtOiKFXl7R+MAo5TlBQ5BOQrCT5PZZNCCXMKmKA29GevMaCbzcWLb9D/zN/A
X-Gm-Gg: AR+sD11tikKbnWAMB2KEuta7adI9Ipy3OWg+scojeChtnki1MQPAbkf3U3p1YuTgU+d
	sXJH2mO0WBtvV0FZbDnwzzvQPILqHysh3idbJ4DuX4z63ytsOPajcBnacrnSJQc4oBxfzcFbQCN
	wZtHp6zQT0pXiYqQ3A5okMa8LxI+bNna8h629FK16cfgxHh0dOK5Avr7asdSs9eg4AZcwdjxF2N
	AgVmiwuRMLlE/e+tees00A9b0izo5WXopDve+A7dipfwauLbfhn4FPdsiwpaIgrgI8aev4LN2EZ
	D5+VxTmXJ+QdOyNx9W58Ob/vV14GfTbQyJ1bFmLzDPXyyuB4i92koIn0TkXBTgax+CiXEIWbNBU
	uu8EfJg473HTJkTDiI8LdCljVdjihmIyPWg==
X-Received: by 2002:a17:90b:5743:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38ec85007f4mr5888986a91.12.1784869543021;
        Thu, 23 Jul 2026 22:05:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5743:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38ec85007f4mr5888947a91.12.1784869542507;
        Thu, 23 Jul 2026 22:05:42 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm35745856c88.2.2026.07.23.22.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 22:05:42 -0700 (PDT)
Message-ID: <3b055904-5a38-4b61-8451-ca51edb3f7cc@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:35:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,bam-dmux: Add
 qcom,shikra-bam-dmux compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-1-3f29da7cca76@oss.qualcomm.com>
 <alXhHH0mGvFeUMd7@linaro.org>
 <3a32a44d-4044-4270-beec-565171ad4bff@oss.qualcomm.com>
 <4fc9743d-3d9e-4130-9ffb-b64318a8373a@oss.qualcomm.com>
 <al9goVA6eLtxymbz@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <al9goVA6eLtxymbz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r8FmEEacvI8_SJFH-4bY0XiShtiyGRP3
X-Proofpoint-GUID: r8FmEEacvI8_SJFH-4bY0XiShtiyGRP3
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a62f2a7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rPyWtegBkAECZ4v8HtsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA0MyBTYWx0ZWRfX9NI9CoEgnFFm
 znUDQEPO4EHff7jBxVdZvy7LUyVrEL+vLZ5e+2jS1uWUJeJEQYgfOhWrUE2drb2ENBROcf68znh
 dbF1WXJvKDh7MQLEvtAkRZzRS/RTATm+fdwl2bn4nkYIa7dQ//gn71g9P4ghyoXC42FgJzbjaie
 DIxHFpZRWmI5ydMM0sUW/t43xiCH9lW9Om5XSrY6PJ8WTljACaJL4/owsUgfryQcoXUD/vP/ebu
 oEfpmOHD+w5ohlBg5Z4ntu0c/U3wsz9oNzZ56lPb6FAVNjKhlluXOhrBDVWSP4l9f9F2sB7NasJ
 gSR55eWn0KtMCPBmdZZ2JDwBY9IGsjBFFGRWxJ1ohtP5WJMbFyEZb+GY7G18FhFJsp3Er3XxLJ7
 988/BpUnNfqROc4zmXbBg6h3BiWnY11aLQ88ZSM0OQeYV3kT8gCKRfhFFZTCjf117tBYtD274Dv
 0dkVv0ku9OrNBMW+3Ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA0MyBTYWx0ZWRfXx3Kr2blm7wa5
 W2yBSH9UH13xia3BsRf5MphR6eBdGOo63gnpn+h/nDZ13zQLvGaNGxffynWRhfRB3WkJqgPOsr0
 HO5+r4VEiMoWNURV+nYKKIlkt0tDcP0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240043


On 21-07-2026 05:35 pm, Stephan Gerhold wrote:
> On Tue, Jul 21, 2026 at 01:57:16PM +0200, Konrad Dybcio wrote:
>> On 7/14/26 4:03 PM, Vishnu Santhosh wrote:
>>> On 14-07-2026 12:41 pm, Stephan Gerhold wrote:
>>>> On Tue, Jul 14, 2026 at 11:02:31AM +0530, Vishnu Santhosh wrote:
>>>>> On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
>>>>> the XPU enforces per-region access control, each individually
>>>>> DMA-mapped RX buffer consumes an XPU resource group. With only ~16
>>>>> groups available, the per-buffer mappings exhaust the table and inbound
>>>>> transfers fault.
>>>>>
>>>>> Add qcom,shikra-bam-dmux as an additional compatible for the Shikra SoC,
>>>>> paired with the generic qcom,bam-dmux fallback, so the driver can match
>>>>> on it via its of_device_id table.
>>>>>
>>>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>>> IMHO (the DT maintainers might disagree) this is not a different
>>>> BAM DMUX hardware block on Shikra, just a different firmware
>>>> configuration. I'm sure the existing SoCs also have those XPU blocks,
>>>> they just don't make use of it.
>>>>
>>>> Personally, I would rather describe this with an optional "qcom,vmid"
>>>> property similar to your bam-dma patch, allowed for all SoCs.
>>>>
>>>> Thanks,
>>>> Stephan
>>> Thanks Stephan. Adding Konrad (Cc), since this compatible-string /
>>> match-data approach was his suggestion on an earlier revision of this
>>> series send for internal review, specifically because BAM-DMUX is a
>>> singleton per SoC.
>>>
>>> Konrad, given Stephan's point, would you still prefer the
>>> compatible-string / match-data approach, or does the optional
>>> qcom,vmid property (matching the bam-dma series) make more sense here?
>>>
>>> Happy to go either way once you've both aligned.
>> This all depends on whether the DT maintainers grant you the right to
>> introduce a new property and in this case I very much doubt that
>>
> We have the qcom,vmid(s) property in multiple other bindings (rmtfs,
> fastrpc, ...), so I don't see an issue with that, personally...
>
> IMHO I don't think a new compatible is warranted, because the BAM DMUX
> protocol still works exactly the same (at least as described so far).
> It's just the firmware security configuration around it that enforces
> additional constraints. You could have this on any other SoC as well if
> you configure the xPU stuff like that. It's not really specific to
> Shikra.
>
> Thanks,
> Stephan

Understood, makes sense. I will raise v2 defining the qcom,vmid(s) property
like we have in other bindings.

Thanks,
Vishnu

