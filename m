Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DBF3955FA
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783845965; cv=none; b=WyOheD/a9Cv8HHRmf4PEzhWp1E8vmCYqzMNel7NUiMa0SBW1kubnxWpJa2AYs/XgEajymI3m3cpRuGlX5Jyycv2zlBPOSUdMhThMaCh6b31m6j2ZShC7lNuINn+y3E3KZnt0XDCR9PsJJaMmnboqk6KVl0qJ7iftcU89e6sUm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783845965; c=relaxed/simple;
	bh=zWHY5hZ/8Ox8s31q8zApgayyvinHfRJ82OuShKdkkZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwKAl+f9G5gUH4eB6cFJ/kjoVJpQnKIloJ2nWh+6MQ7dNdafg0eroceH8rr13XBl0uBXHbgTk6jRTxYUYw06oBaHWG2rH9rXIdQipN00g7FSmCST1oLUxiCwLjO4jjgb/RHOUO9WsFI37Go4seUQAAykNWT2rKLPBVMrKt+EaV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJWBwY/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uww/Zk8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJWBwY/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uww/Zk8T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7SIV61808243
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 08:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xf+qvVGz/Rsik4m6OuGXL2+Wevl0zm2bIBnoam/yT74=; b=ZJWBwY/2zF1me725
	90VJ/QBNnyioXyxDHWnp7KXHE8WW2sN1f62N6wjE+8iPYpJi4NO+L28xvXpJ3IkD
	fYeds8VnVfdRTrVpSCVONzu0tNLvCYajb/+Me6YLuZzicbZWIujftU7ik+iwHg2U
	/AOJl/tge6f8XQOdpVv+4AYQ4ziVgyScAWfgww6anajW0gl4D4F9kw42QfsFWCd9
	+h+xdO747XHVL7jnvtCxdciMKGSn9kd9f4j27SHtjRoM35E9+Yb//rpph7dRV4GD
	2x6aQK30vBaTegOiSp24/PWHTRQDbLypejsefj5XywdOmaB0rNf++rZUIPcJ9O6j
	DshVsA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9jha0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 08:45:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88fc985a65so940539a12.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783845950; x=1784450750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf+qvVGz/Rsik4m6OuGXL2+Wevl0zm2bIBnoam/yT74=;
        b=Uww/Zk8TwLuNsUXVN8zW2gX7XxAiKH9aLyTJgVQ2tLRYfMp5XOUYWJyWltrGnvAFi+
         ey9cyHJ/kHoLXKW/diWNqHewoTVXmsMsuAQY6o+neQgG7MMN1VA31IJsfSgBzs/JmfKF
         Zi9STE/kxcOQJ/IdrqYBAsz4gh9+MlU6I32bj5Yl59uugMAlSRgkOHHn8MO6msDMOj39
         fjHJj+KXc+mJv8tj7rHVcqKg8M/VWkc6GcOLBkXSfre1Az/myXY6LFcdqiRPLxNF+7Uk
         BfB8ogstne5WqKCSmXkxRpiKU8rkh9JVKu+E2BQxFlLWuUuuAGJ5MCtLqcSZXT8nQn3A
         lz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783845950; x=1784450750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf+qvVGz/Rsik4m6OuGXL2+Wevl0zm2bIBnoam/yT74=;
        b=LoM05AM6CBYKHk3/rwwUw4fJWEKFXvwauiCunB6YA1PwSrsEUSTc+p9DEr8nUM8oqY
         fzkndFMDULANYg+p9MJhRqqlRLVcdocNa9OaomnkY1wYYGMqWWpBUWowZpnn94MyYZWb
         AxONmzjMtoXtAwOdKzM6aMaN+gmm9KmPx/gl7v77WX6UQDtZbzhKwmixt9nTY3cVJWLi
         UI2qFBQu8DC2FL8NjrHCMu5y9bW7P0IKUMpOA6yDqrcA/iySQrzl/ZbloxUak+Zc4CKi
         zNV2ukqJaYTvswbF3gmmTdIkUzz4oCEStXt1+LLQ5L0EC3o8K9YugUt1j2HhIyTAmsLW
         e2Fg==
X-Forwarded-Encrypted: i=1; AHgh+RplM3bUZpA+7Oh+HFIxtyHMXJOxucE6t46e034WmL+HYGqekvtIoG0j7TxyUNRRtxQdMQxDljtY8wkg@vger.kernel.org
X-Gm-Message-State: AOJu0YzsuBbDoZFzSF5OSWwV+mO+XuukXleJc5vs/12yyYdaYoC1jnhC
	c3GwhcIdQoef9F+eoAuEVXHQhyzz/Ia8wrfLrbYwGTtPNUboLthcgDkQ6NYyucDqeIui/K27icn
	QI1zuIr046MFvOGscCgQ0iouvhfHIVJRmbfbRafe19zwSHSmAggTn2ItVVJ8XxjpT
X-Gm-Gg: AfdE7ckS9i7LwjGMZVkTSll7mRYZefL22D99RNghLcfzIDoApP/upb5I3qA6u/EsH1x
	nTanQjdfv57oEd6mqClB0P3ZggCkYuEYBbVIKGXFuYO5Yecbs0xEUK5NNSTzT3u7bxJgIrxgIph
	phiyraWBH4mNrp0CXKmEOGJXx1jLQsJtq8KnMN6XVMNGRf9FZ4GWY2s9oZz9PUVqLod84g/qA4Q
	LBwmh4ikOcVKFpIBH1y0u2rdzt7qv+rjPZ+USv3pKMv0Sm+76BvB7wAEFju9SEfHFbm7PK3v/A3
	i7d8LKd6y5y70+ezD1ECtRsENWUvc17+psFdl9l8ZqTGd+WXlRgEFyVs/nVHCcGnYThLKyWMT2e
	JQqOvcxC/9o78/cVoTQyJJWVpoJWWM8o3MSGFXFZQ9I7yTp+E6w==
X-Received: by 2002:a05:6a21:e083:b0:3bf:7fa5:8922 with SMTP id adf61e73a8af0-3c1100092dfmr5538561637.2.1783845950574;
        Sun, 12 Jul 2026 01:45:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:e083:b0:3bf:7fa5:8922 with SMTP id adf61e73a8af0-3c1100092dfmr5538544637.2.1783845950089;
        Sun, 12 Jul 2026 01:45:50 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.92.133])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm62094370c88.12.2026.07.12.01.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 01:45:49 -0700 (PDT)
Message-ID: <b1b896a6-aae1-484b-ae1a-5a08efb82c4d@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 14:15:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260711125740.3083236-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260711-mauve-skunk-of-contentment-f51be0@quoll>
 <6438237f-ccb4-4143-9ac7-43f5dcca955b@oss.qualcomm.com>
 <2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDA4OSBTYWx0ZWRfX0SM2NKS+pekA
 i+hybWYGVE8cqZLmg+cpAXy6GAYiMG/mhdaJIijIRuwvsFMUAA5aT5mQp2jHqRv+qNT0ArXxE6J
 7iJyrVVIOTxI1XE/K8QGYZ9979rE4Ds=
X-Proofpoint-GUID: XMozTXp2kg_NLNnPgz8XLz5V9OB2A_kf
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a535444 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=tlK9sNgGSfv7srgBb5RqhA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XwPME6NCRsOL8v_XlRkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDA4OSBTYWx0ZWRfX07yT2fInwtQK
 Zkpiq6xE8GL16I6qqUC1fxhqrpUSSvCF8CRxn7962SOSFHhNChcV0t4Wq+ySFuWUZTmqv7iX6Nx
 K+ie62IwP/ZoEuhSN3/Z5tO7tuSuU4+r15unewQm3xN9T/SbduK+n3ZsjMjqQDkSwbBkZ/uIHmF
 jRFK0VY50Dd2dHU3vdRCbn7VQ8GNGRH4FqvaAdSriAWAm4aifDRelQXdxXPs2SMcCaE+2iW7Dot
 rKx2j/CdPOKqm6pwdCFgMmAhuuX3X7cye7/8/bZMYkn98Ws74mJW7AFKrbnMew2n6I1kHe2BubX
 cZZwLPNovszX7yycs0z1lqx+d2ea2V0pgpAXCpkJywMvojwAcaC2OeHBEqby1bTAaFh4ytW5ETI
 62/t5NBMD5eHO/COHufej7iQfPMFYp7ZfgHkuXCLo3kGWmWW8dQY5OR05IfnWOSAFemFKZT0ULg
 9G/vDlEg+1SsJo9I/Uw==
X-Proofpoint-ORIG-GUID: XMozTXp2kg_NLNnPgz8XLz5V9OB2A_kf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120089



On 7/12/2026 1:41 PM, Krzysztof Kozlowski wrote:
> On 12/07/2026 08:44, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/11/2026 8:41 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Jul 11, 2026 at 06:27:38PM +0530, Mohammad Rafi Shaik wrote:
>>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>>> describe Digital Audio Interface (DAI) child nodes.
>>>>
>>>> Add #address-cells and #size-cells to allow representation of multiple
>>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>>> per-DAI properties such as the interface ID and associated clocks.
>>>>
>>>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>>>> wired to the SoC and do not always have an in-tree codec driver to manage
>>>> their clocks. For these designs, clock line enablement must be driven
>>>> from the platform side, and this series provides the necessary support
>>>> for that.
>>>>
>>>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>>>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>>>> introduces the required device tree binding support to represent and
>>>> vote for these clocks from the kernel.
>>>>
>>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> Drop my tag, you made a important change to ABI.
>>>
>>
>> Ack
>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> Drop, you cannot test a binding (in the meaning of Tested-by tag).
>>
>> Ack, will drop Tested-by tag.
>>
>>>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 58 +++++++++++++++++++
>>>>    1 file changed, 58 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> index 2fb95544db8b..f3a8b12d7fc8 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> @@ -21,6 +21,49 @@ properties:
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
>>>> +  '^dai@[0-9a-f]+$':
>>>> +    type: object
>>>> +    description:
>>>> +      Q6DSP Digital Audio Interfaces.
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +        description:
>>>> +          Digital Audio Interface ID
>>>> +
>>>> +      clocks:
>>>> +        minItems: 1
>>>> +        items:
>>>> +          - description: MI2S master clock
>>>> +          - description: MI2S bit clock
>>>> +          - description: MI2S external bit clock
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 1
>>>> +        maxItems: 3
>>>> +        items:
>>>> +          enum:
>>>
>>> That wasn't here and that's also not correct, usually. Especially that
>>> it does not fit your clocks property.
>>>
>>
>> The reason for changing this to enum was that some hardware may expose
>> only a single clock, which can be bclk or eclk instead of mclk. With the
>> previous positional const definition, such configurations fail schema
>> validation because the first entry is always expected to be mclk.
>>
> 
> master clock feels like something should be present there always, but if
> that is the case, then you need:
> minItems: 1
> items:
>   - enum: [ bclk, eclk ]
>   - const: eclk
>   - const: mclk
> 

Thanks for the example.

I will follow the same approach and update the binding accordingly.

Thanks & Regards,
Rafi

> Best regards,
> Krzysztof

