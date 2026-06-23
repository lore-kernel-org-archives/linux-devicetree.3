Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2362853F3
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205635; cv=none; b=ZAJsH1urBN0m/H5VhRuqQCe+Pfaf1v0l9CrKSRuWuIIOhZfLZ+1thnnnfUOOW0kL6hr9QWNK4RrLwbyWvJaVB8zYcc/Dv42v/Aj8DOHva/XkJtzKbN2TYlIll/ypTJ6HQGnqDTDImFlYbQzwgAZlqLembCzERQG3/X3b8YjDLVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205635; c=relaxed/simple;
	bh=WukhzqxNcZwMEQXcGdz89FN159EkYgGHDb4TCOJ19SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBDw2n5WEa7bQkKtOxbxdp55EoPu8E3EYYZhSSOzu8zjdePX6zyI5En/fr48ZpjJnSEpp2l8bSeaIdvP7r6tsAwug6XV2jm4COfHfl65XToPQ39QTyMQP3UApuJQRo3kLdXcftBsGP5Jg/bd7CZNnGQRq1PYZoPPIjwjBNkj0i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mgp0G0dF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jK9W367I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mgp0G0dF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jK9W367I"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7j9f51778132
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynNpB9XvAD6eSLMQywfDBUNke/Uf1A8kYmXY2NhjcL8=; b=Mgp0G0dFB8pbwVk0
	wj9ryNpuqJbsNfD0LfJuCfFhYshjeTITf8942Z2YbyqEF5QhWqpEwGzz96VTF5dr
	94Jo07mIDrkXisOOUXKwyJby7AXRU0CmqX5D9jNg3s4mC9Fp7YfqFxycjZWSfGu/
	r3NWrAyJ0z9oVnlvnOXV9mo1HabYIYRwipKYtFhASmM5A1he1pjWjsZiakVYqYi1
	R966iBcb0fUwcrWgxIRuygV+GYFFsXiankjWL+6MLton7ac+q9ag6Zc8HR80NiRZ
	ARFbUttYAfJOJNxr5Fl1LB5tjUc0sDxsNzs2gWnx3R952Dei1U4GRC57Bjq7/m/8
	n0YvCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gra76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:07:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c9d82cd57so5614014a91.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205633; x=1782810433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynNpB9XvAD6eSLMQywfDBUNke/Uf1A8kYmXY2NhjcL8=;
        b=jK9W367IT4DOi3pyzW+JYy/woyV2Wm33NodipDAnQlRd00M7DuSa0epui4mZumwKJX
         pI3DQPjcvy3iv4K4oicOiRoSEefO8JEFJbGIrGHVrlg7jMztS/xWqQ6vIAznQ77o7Lde
         rcRfSJkb+fAHLogFu1O+/E3gns/OFHhXOBYaxkfzYexlqNl6xYic27tFShT/fns59xso
         /oZCsdF72v1uVPUCYrhh//Kc2IlMsp+0Ve1AA/yGVLmYKgEHmQuA3KFYebJhIZdCS1+F
         LpSFe+l/Tzt5kigYnHWEKBxRlF2z+o/vgtofGsd/ihUjMIKgG2ANIDLf0h39/dW++RET
         j6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205633; x=1782810433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynNpB9XvAD6eSLMQywfDBUNke/Uf1A8kYmXY2NhjcL8=;
        b=AfdYZ6LFmhXUoYgbD9pRdOFqe8dWjGLA6GvEX0NarwJ/4AsN/EpKZwPIIuOcLWjqBG
         X2/Ie8ffAZ8+cz2I1XEbOtpoFUjl4DZ2q9/Acy5XR6oAQnoweRT1LJyn7GiBzjLIyXOv
         Twb/rCeVXjcqpQvUoIY5jZG646iIT1qJOoY8ZpOtqimTKhimrT4efezEG2cOPjEt/PTB
         +unQBojWdbZuOU5RSMXZYugbDXjHgZeDYmVRn4yVTmoktPQf11i+yMXmVZKKsMiwipIM
         iNS7lvSXZSRRB7/7V3vmP9F378+Asa6JJfkP7xCaasNVUoeqE1354e1F2Oo2oz6RIP8z
         6tIg==
X-Forwarded-Encrypted: i=1; AHgh+Rrb4He3EqwTT7WHcLyc2kvxxzDjJyAb2P3x+PsvV39rrBHSWF6r/Q0/HQddiPKdtKUvZ8FI9/FmPhLf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw29dhTsJnR0wb9Wa2J7qOS7YsLcmL/B+OsbGzUe6gsMP0G2Lyo
	d1/1RAiQYyFRcIBanOyvYfyzxwn27OwUQuFr/Na1KR8XCq1qvmI3fyaOd7LHuCDA3DCIIcRfrKB
	QUYuGozTGXicJteSc6yPNGODuQ6RGuaFIy8DOFEbRv/fVVuqvBUr371kBAJddm1lO
X-Gm-Gg: AfdE7clTSqzO7x7HySfBUMoQDblgoD1oK0fq3kFJF5r1XYfusSJy6iMc3dT6orGrprn
	Vmyl+WgAsXh9Qrk9hZzEjXgGDF8S/H5g258+61ePCf8toPQqGz7PPP7y6CAfEl+rNgVRuyAKx2G
	JrncI7MJBZOxx/pIwcdVWfrmIkdwsYwSSyNmjO4qQXpxeHK9qxAmLdYFSx4hlonoVAQgoNG3qvC
	TAzX/AAhZRnBoV5xqZl0iSvoFPKG4ezjckJhuSOxP3FpmNmfm8EIlEy04KqtiPl2hof/zdE2Q0i
	tf8QCh+7CyTlhuZcgoPMzP16tcQ41gNjzabU4ODJuTc0CbjoaT6Ny/Rn8th/1wB3lQ8vXg+0avE
	y5sBU5nlhfQANyAzv4c+hMdCt/opuB2JAoXWqEziBINS7
X-Received: by 2002:a17:903:1a68:b0:2c0:b19b:ef0d with SMTP id d9443c01a7336-2c7c99de67dmr14775745ad.19.1782205632584;
        Tue, 23 Jun 2026 02:07:12 -0700 (PDT)
X-Received: by 2002:a17:903:1a68:b0:2c0:b19b:ef0d with SMTP id d9443c01a7336-2c7c99de67dmr14775255ad.19.1782205631977;
        Tue, 23 Jun 2026 02:07:11 -0700 (PDT)
Received: from [172.20.10.7] ([106.192.20.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d3505sm102101125ad.19.2026.06.23.02.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:07:11 -0700 (PDT)
Message-ID: <89dad28f-c691-488c-bfc2-6ca3bd2068a8@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:37:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add qcom,wsa885x-i2c
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
 <20260611-debonair-barnacle-of-action-ee9d22@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260611-debonair-barnacle-of-action-ee9d22@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f0cRf4-GZ2N_4pfmnFvStDZOKKyrelCw
X-Proofpoint-GUID: f0cRf4-GZ2N_4pfmnFvStDZOKKyrelCw
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a4cc1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=GtHFPjVsJ1z6j8OeKiQY1g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1GWs3Cmanii3QIT9qZoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfXzluPfWwmzEwY
 jUsDRfoSKYJzQASkpw3usNYOdDDT0En9Tn+/CBZXGL7/3QdIkPXUWj6MxujYPFP/UhSeRpgAuMk
 ZuDVxsVjSmkFwNhG14acvhdpTQlZwcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfXxApEeAgSbm+e
 c4QfDGZD6eNg+m5E+LfIyudDhzVWBhKFeD3UjmPW8SWE83Z3GeWgwzFI5fYraMpF/I5qxE/t+Fh
 JFaQQr+vmSZ3aWqBY3C2qg57FMBCvDLm6tb4M3PUHyPely4vsD1XIbNjJf8p0EFNT3EpPkcHiFT
 vPSA2iptKVbMLMq+uNMqmkv+qFMV+za+gtFJG//xbO2DCEHlmrk+VBgfxzcaLgA2YwDkko4B1fX
 3TjLj/w3rEq97AKsBDQvRcXlPEenITWo/GJSX9iMW+4AR+kE5jDJ0O77AAlsKQVBJdEIVWOp1Nn
 mxZ4Phy1AK2DN0k9KYaTk6t2Pw7lBLX66kEaJlpF64GLuNpAO1zcbBSKoLRklMuKXKxyQkjNV4P
 +OQEyj72mBzHoFybpUPZPoDnlKUlOvYa6JhtpfbR0mnAzR/PHwzkRwJXDA1OfLI8oIfbln7z+cY
 830xsepJ7pEDrcpaz8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230072


On 6/11/2026 3:04 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 10, 2026 at 09:27:07PM +0530, Prasad Kumpatla wrote:
>> Document the Qualcomm WSA885X I2C smart amplifier binding.
>>
>> Describe the required supplies, powerdown and interrupt GPIOs, the
>> optional battery configuration, and the optional init-table property
>> used to program the device during codec initialization.
>>
>> This matches the driver programming model and documents the DT data
> Binding matches hardware, not driver. Please describe the hardware.

Hi Krzysztof,

Thanks for reviewing the patch and for the feedback.

Ack, Will add more HW details in next version.

>
>> needed to use the codec on platforms with Audio IF playback.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   .../bindings/sound/qcom,wsa885x-i2c.yaml      | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
>> new file mode 100644
>> index 000000000..1069f470d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
> There is no I2C in device name.

Ack, Will remove.

>
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wsa885x-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WSA885x I2C smart speaker amplifier
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> +
>> +description: |
> Do not need '|' unless you need to preserve formatting.
Ack, Will Update.
>
>> +  WSA885x is a Qualcomm Aqstic smart speaker amplifier with an I2C control
>> +  interface and a digital audio interface exposed through ASoC DAI callbacks.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,wsa885x-i2c
> Same here
>
> Also, incorrect usage of wildcard. Look at other bindings how this is
> written, so you will not repeat the same comments:
> https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/
>
> Read writing bindings before posting next version.
>
> I also cannot find traces of internal review of this. Did it happen? Did
> you receive toolset comments?

Ack, Thanks for the reference link, will cross check and update the 
bindings.

No, there is o internal review done for this patch due to timelines.

>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 0
>> +
>> +  powerdown-gpios:
>> +    description: GPIO controlling the SD_N powerdown pin.
>> +    maxItems: 1
>> +
>> +  interrupt-gpios:
> No, interrupts are never written as GPIOs.
>
> Where is this binding coming from?


Agree, Will remove this and come up standard interrupt bindings in next 
version.

>
>> +    description: GPIO used for the codec interrupt output.
>> +    maxItems: 1
>> +
>> +  vdd-1p8-supply: true
>> +
>> +  vdd-io-supply: true
>> +
>> +  qcom,battery-config:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Speaker battery configuration, 1 for 1S and 2 for 2S.
> Use string
Ack.
>
>> +    default: 1
>> +    enum: [1, 2]
>> +
>> +  qcom,wsa885x-init-table:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 256
>> +    description: |
>> +      Sequence of register/value pairs applied during codec hardware
> No, we don't store register values usually.


Ack,I'll move them into the driver as a register table,

making them easier to maintain and avoiding opaque DT data.

>> +      initialization. Entries are encoded as alternating register address and
>> +      register value cells. The number of entries must be even (register/value
>> +      pairs); maxItems is 256 (128 pairs).
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#sound-dai-cells'
>> +  - powerdown-gpios
>> +  - interrupt-gpios
>> +  - vdd-1p8-supply
>> +  - vdd-io-supply
>> +
>> +additionalProperties: false
> unevaluated instead. Again, OPEN other existing bindings. Why doing
> something completely different? Is there any WSA88xx binding with
> additionalProperties? No.

Thanks for pointing this out. I'll align the schema with the existing 
WSA88xx

bindings and replace additionalProperties: false with 
unevaluatedProperties: false

in the next revision.

Thanks,

Prasad

>
> Best regards,
> Krzysztof
>
