Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810093C6A29
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519072; cv=none; b=IpLEn3fJurtUF4jVbat4NGibZMh5nURH1IioSkrvwqnjpow4VYjvTwqRrIs2KqXIEc4vF4PZ9iCyzJ8AU7lNflgnWHOc7cScAvOII8H1ngtaV9y9qMZJGKddcdKb7Nf8PWtmAbx5h8gkWbck8cCyU6/8y2r1JvMQCQSrUhEfxTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519072; c=relaxed/simple;
	bh=G8iFVkQIQOWoh67cWw2X2M0NwrofOnROz1waXWnqZqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScIAVKOU4LCmGt/slTntaGRJkBejbZMVULalYL3iscQST9nrN5uEoVYxMEGasCV9kRnfsCw6aYYq9nlU1uMYaV34IALqSdswmzkS9jMDSACOer5VRcYajapIpf63y/YLMrGZ1FqKP8Y/khCfcte3Bo4sttQZZekvExWGLhhAv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTlF0Y+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jH2GIaC1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTlF0Y+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jH2GIaC1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8gQI11554727
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IH2zWDhZtj2Lmu9xTpGVFHEGsRxfhKdYvqx8fhAnfU=; b=KTlF0Y+1VDqNgtCn
	NqY0DDmn5F3/wdu4TqzizvUt/F6ye3Ttq/GHE3N1oAfKKmv+rnl9BljNmK8VaN2o
	W4ayAorlHEox3lGXR5ft7ObasGj4KrqHBMfLyUAWZd9W8Jo7a4jzvVBCwTUK7XuM
	nBB77OusiXCOuR7JoqUZIsDGZBpNxwpQa5xBItDyGXwtoDBtO7y4/n2/Szk40PlB
	UelVuHz8kGXVT9Ok0TnBlGPVxN5C8RfhVXvFwijoP/M2bNGp+TSEhxR2lb9kFn10
	+/cOzG/wbyoEkwCE58wMjD4A5ehFC3ugyXCShVWfDOB8DwoxUctB7QyZORLIiWTz
	HdkSsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7bx42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:57:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b079b4a8c3so28167125ad.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774519069; x=1775123869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0IH2zWDhZtj2Lmu9xTpGVFHEGsRxfhKdYvqx8fhAnfU=;
        b=jH2GIaC134A3rw4FghdvBcr/BALmi0RGkEo2cy4bbYNOSkAplJXwnbqNXFjOISTaQO
         YicjCf7P1bFIdi8iDZh9///KCfQD9GwVcB31UbMpf90yPoli/mpA5I940RpWcmr3GaoU
         3eWrsTO/JsVrKb9++9DA0FZc4qzgu9DtUv/AX3CRybI1rtIvhWjaCKxcxRuVXiSr2Jx6
         n+ZIN5SkFcRdXt5RjGn/acLkbClxXj2vmG4uUlf0YK5O/Wpv6yT6z4MsHBlsRGi3QuOX
         oaVBLeiacN//RguVwQ6RTG35+aYOqN6NVs170yHreef8c2gd2MZcfEkM6XSU2QQUR7wE
         ADCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519069; x=1775123869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IH2zWDhZtj2Lmu9xTpGVFHEGsRxfhKdYvqx8fhAnfU=;
        b=eGGjJtbm4PzgYLr7PBw0fYPkCvynclkFTNZ4rFq6PzKwMaAn21uu2GQVrPt80sRu2o
         SyVtW0cKDn2RenMzZbQRw79IZ8RNp3fHdLjuWIyvit8FD2Lo6qYUrZCrnpkrpBUjgbpu
         7CXZ2tTfjVGR94CgP+JBtmqvqZRjmHyOJdDMxeWfxQBN64I9BnrHBt8yqKA0qCDqL+1W
         PTlyi11K+6WvCbIqvmtBWaohvQtx2Yn27/vMqNubtVBes7dZmLnUtSFEC99SAt94xV83
         RwxxFmREBPniblqr08R5zy92MvZV8ADASPDnTgjFNHpiMFJoeV0TSHGlFUfOvzSCNQlA
         y9oA==
X-Forwarded-Encrypted: i=1; AJvYcCW4mwAy5xPs063Dn9xGdOVXeoGmbjSd/CdTmEgtC4ntVu7YjgOVS3EGNkW9f+x9paJJ9hhm59VOcltb@vger.kernel.org
X-Gm-Message-State: AOJu0YzLuEed+voIWZuVHvEVyz2Pq9o8K86o2hFizTBCRm0roBYQRi0Z
	/NvSDTNt5llFYzReq3NABxJivxA95anDnCxMHAB7OzogQNNJZ2SdZ3m00+u7SIAL5+5oLo2L0SY
	NPm6PjBEq4q9ZBcvOD1yZJh+rof7yWsbLgGnAfIOVxeJmqPJPrJf8P0GLNRNMT45Z
X-Gm-Gg: ATEYQzzBwKkKzyOKy3b6ZTMhaOIJImaWuNaQDtMvxjjN+ZhFlwjZJ5XoJH3wPjZYPEc
	j7t43zYrkP1hDG4q3H7GSkUHmEh+Pru2/zKdR/LmpDfvu6sOtwvkS4Dk4mZe+TN/rl0U4ir7iCB
	IDA6dCtIX3vgX/+uKlHWyYOMAzaL7gKTtvWMsnBKzNGMTsNTgh3JGEtOAGa0dEH1bD27W1IBrK3
	4R5hitP7yhVo8lYBylMHPF5JRDCYz0HcdVOjFp+HjTRxCCc62KeKTbWHbCgFR1p3jnl4cwD+N1f
	fPSH5V2OHTtlKcHt36k0Qr9YVwCbpoCBYwL3s4cQYksaZ7SMf4t+Y6S9FnpIbA2Vyepd+tffDBz
	8dopC1XzyhIsmbR9vVJmMDM7iH1uXqYKA/WAobKy3chb5fM6gH+Q0a4kVc8ZR
X-Received: by 2002:a17:902:d581:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b0b3257b59mr69142305ad.22.1774519069069;
        Thu, 26 Mar 2026 02:57:49 -0700 (PDT)
X-Received: by 2002:a17:902:d581:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b0b3257b59mr69142055ad.22.1774519068585;
        Thu, 26 Mar 2026 02:57:48 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc87e4e4sm23399665ad.38.2026.03.26.02.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:57:48 -0700 (PDT)
Message-ID: <138dee9e-56e7-43a0-bcbd-0e4db4d5b5af@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:27:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260310-crazy-screeching-angelfish-297bab@quoll>
 <a7e7f32e-e365-4504-8ce9-1aada01bc52c@oss.qualcomm.com>
 <fc9e0399-dc24-48c4-99db-f9e39a79cda7@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <fc9e0399-dc24-48c4-99db-f9e39a79cda7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c5031d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qPg06tCIB400QNJGJh4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OSBTYWx0ZWRfX61HxpLj0yGdR
 iXASZg897QZIzhzrNRM3MDqm6Ls3Pa3sdD6rZ2DSAy3Q9HwzsAmo0kTF64WkDj1nQwSumVLUF4C
 tO8lvNa82jFt4JerSpS0uHH7gLfjLJhGXuaz91Y47345eS3zmF4VAjrphKY8HuZbA0HAwQauWGw
 wQqFhtg6YRADuTEfkSUXJzpBSJpUWawqRAr1+1JG+doQxWaKLzU2gD0OYjucVuofRaw7FiXXXdu
 opBTItgUck0Ji2gcMYgNL2LmZWaxqKNewvarGnRuvKfhEtkbDqwl+jvcqdLcV//auhjGgf6HbKu
 1wmvaJ/D/0Drmo7Q3pd5fWOyQgDnSiBNSEouEB9zA5q4cu44r9SgRixfpWVhIkhC21+b3DLDVuF
 Rqz7ahlXqLjeDx0pcgHxChGsLc+lcQ6cQoJqgMnT5TklYQKroNR+kZ5o1dwAgbUMjV5jWhhopbu
 rv88l/jUjsrzHePYgaA==
X-Proofpoint-GUID: ubtAhHNflnREyVWlm22Hoq8u30auj-A3
X-Proofpoint-ORIG-GUID: ubtAhHNflnREyVWlm22Hoq8u30auj-A3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260069



On 3/17/2026 12:41 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 06:27, Mohammad Rafi Shaik wrote:
>>
>>
>> On 3/10/2026 3:25 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
>>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>>> describe Digital Audio Interface (DAI) child nodes.
>>>>
>>>> Add #address-cells and #size-cells to allow representation of multiple
>>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>>> per-DAI properties such as the interface ID and associated clocks.
>>>>
>>>> Qualcomm platforms like talos integrate third-party audio codecs or use
>>>> different external audio paths. These designs often require additional
>>>> configuration such as explicit MI2S MCLK settings for audio to work.
>>>>
>>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>>>>    1 file changed, 40 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> index 2fb95544d..1d770cbcb 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> @@ -21,6 +21,34 @@ properties:
>>>>      '#sound-dai-cells':
>>>>        const: 1
>>>>    
>>>> +  '#address-cells':
>>>> +    const: 1
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 0
>>>> +
>>>> +# Digital Audio Interfaces
>>>> +patternProperties:
>>>> +  '^dai@[0-9]+$':
>>>> +    type: object
>>>> +    description:
>>>> +      Q6DSP Digital Audio Interfaces.
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        description:
>>>> +          Digital Audio Interface ID
>>>> +
>>>> +      clocks:
>>>> +        minItems: 1
>>>> +        maxItems: 3
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 1
>>>> +        maxItems: 3
>>>
>>> No, this is just way too generic. There is no such syntax in the kernel
>>> and this should stop you right there. You are not allowed to add your
>>> own style.
>>>
>>> I don't think DAI is here a separate device needing its own resources
>>> expressed in DT. This is still part of ADSP so you just described in DT
>>> internal routing between two services on ADSP.
>>>
>>
>> Thanks for reviewing.
>>
>> I’d like to clarify that this is not intended to model the DAI as a
>> separate physical device or to describe internal ADSP routing.
> 
> If you do not want to represent the physical device, then I don't think
> it should be represented at all.
> 
>>
>> Requirement is to allow the kernel to send clock‑voting requests to the
>> ADSP. LPASS MCLK routing is not enabled by default on the ADSP, so the
>> kernel must explicitly request the ADSP to enable the relevant LPASS
>> MCLKs, which is a real hardware control requirement.
>>
>> These clocks are LPASS‑owned, and driving them via a third‑party codec
>> is not appropriate. The intent of adding clock capabilities at the DAI
>> level is to allow the kernel to associate LPASS clock votes with a
>> specific DAI instance during stream activity.
>>
>> While the DAI itself is not a physical device, some DT representation is
>> required to describe per‑DAI LPASS clock requirements.
> 
> DT's purpose is not to describe software constructs, thus DT is not the
> answer to your requirement of mapping clocks to specific DAI needs.
> Every person adding software properties made "some DT representation is
> required" claim.
> 
>>
>> I’m open to considering alternative representations, but removing this
>> entirely would leave no generic way for the kernel to handle correct
>> LPASS MCLK voting.
> 
> I imagine that, since this is software construct, the software knows
> which DAI needs which clock. Clocks are strictly defined, thus driver
> should handle all this.
> 

No, the MCLK connection is not fixed to a specific DAI.

The LPASS MCLKs
LPASS_CLK_ID_MCLK_1 … LPASS_CLK_ID_MCLK_5

are hard‑wired connection, each physically routed to an external codec 
on the board.

Because of this, the clock that must be voted depends purely on the 
hardware wiring, not on which DAI (Primary/Secondary/Tertiary/Quaternary 
MI2S) is used.

In other words, DAI ↔ MCLK is not a fixed mapping.

Examples:
On Talos‑EVK, the speaker is connected via Primary MI2S, but the 
corresponding MCLK line wired to the codec is LPASS_CLK_ID_MCLK_2.

On Kodiak, the customer connected an SGTL5000 codec via Quaternary MI2S, 
yet the required MCLK is still LPASS_CLK_ID_MCLK_2.

Instead, the kernel must vote for the MCLK that is physically connected 
to the external codec on that specific board.


Thanks & Regards,
Rafi.

> 
> Best regards,
> Krzysztof

