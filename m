Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BCD1DD0D4
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431835; cv=none; b=SupSSiTc3bpeuygW7N5dXZdS4ysQ8Ec4r0XurBFqIuDWLcX5FOLgQmCeJu8IyOCJGTXSGqIaaFaeIfHdhF0Y+J/idutloaGOIDW5mqX/MZtAEIA8/iKxFPuvaF8Nw5Df/9BBPoc9fpt3/kLle1VF1Y+UOApfd0s1bTDD0qHojVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431835; c=relaxed/simple;
	bh=w71dxo57Zrri0BmXfwEUcuG0+jv+nEEnhsJ7Ls9Yk0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPYT23K3Ji6fl72DZpxXnZfpeug82vOUCiyuJ9u0/yQXh5pj/q0wuygjxmvFSKpToPCkjDWVoBXlD2SnlR7VJMkJpKpqulvaqiNkrWOhhZIl0HQXn3gNljxc2fE32kRmbkrlUaQdxKBwFrvmDrKPESwjsQ3oFwC+LvPz1JVtay4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWLRNdFC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWLRNdFC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad617d5b80so73815505ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777431834; x=1778036634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8iaJ/54PXSumlBHm/F5PZT9zPYaknG4mMWl6w5wLw/w=;
        b=IWLRNdFCSyjvX+qgdQS7n9AohEgcDhLtB8ff3jwFE0Njxbs8gnpgSLBga3jcK5h1AH
         NzS34h5sS/bV+tdnzD5aW0E7SQ7homcoOF06923EeT9XVysOzOUvxqGYRaK2woL4M+9m
         y2wDei/+he1VwI++2mLqQBMWlUy4X2FYRXBx6ICurQ58Xdwek4tIUqZ7/6wsUJTCaPrA
         xubVIBuUPMdYYvAFsqWbQTdCOvw1tjg7p8kfuSw9uNlHJ+V3LBqCdl1hvFTp11ksYMxc
         CHTIesWkNEsjMg0X99voU7cY61IiKH1hZd8GzTSg7OxUd3EC2NEJsEl6nfQ3IQu+tJDz
         2M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777431834; x=1778036634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iaJ/54PXSumlBHm/F5PZT9zPYaknG4mMWl6w5wLw/w=;
        b=eyywyua5+7OSCw+lopDZfL4/KzUASn92oqm/IYL/QImsrzUhENU/IxSYvbHB4R4o71
         73af1B4AiQ0J9iomoOrRgD5sSAyY1hc7vsEKu0mTjqG8eJrtpdFcJpnzwkEGSbcFJ0kZ
         LINcp5Ycc6ycZrV2A3EPCbSQn8q5mnSU4tuNksQmSwbACJPEwyETL7XIdkUuWyaK5PX0
         rG0TNPHINtiUebk9MXG8pm4046Ye+wCTmPUvMZjlMN4/L5HPQv59y14fxEmvXN46QA7U
         S+qtg3y+JQGyCNX23O+i9Yt1EtU94QIPjiVniza0+p8UkwNx3tXaRClxjTMDyMOYBER3
         swyA==
X-Forwarded-Encrypted: i=1; AFNElJ9D7aug5yqKQb1bmVpiKetbzvF89Hr4Dd4AQ3qZ2+MOfFwvizvfB7dw78YcM98H1wV0OwRVO/0Bcfpd@vger.kernel.org
X-Gm-Message-State: AOJu0YyEVwXnU6S9Hbti7jDIwV2mtS0kMqhAfMLk7LMkM4Lo7m6+A1oo
	e+ZJ90DcBDKvtIlSjo+gOjW6kt7hDd1I48t4EaJYduJYTDqtsyWs8bmz
X-Gm-Gg: AeBDietC1ij+j1ivw9pdaa679zzpOxf2qiyFAhGr4YnQj2jMAQW7lNHEQDUdzZ/cOs9
	55cprAYLnO9knXkykGeFRIFjdGmYqDJBXIqDGSMd2nqB4eBJI0keAGCSoWwaYlANtIU2DvzEAr/
	IlJuBiA6a9ORJG7475UbvTZeGm7tOcbUfZ0U3ZQsv8H5lV6MMcHJYRaPxI7ZjXtNVdCSvoa6Igf
	6iQ7fzv0xu0LqSjnwnrNUe5GF9V3s+ikG/Lja6z7L4Ou8KVW3vc/eA3G1jyCAu8UcUA2Im19pU1
	zv3cgBUuPMw0qIdFcutSkhbuqShqPdglgs4xYv8AKfvnEm+CiUJEiR+wDZxtxO3rv6VIuuJH0es
	FWalVLWop0VBDURrAq7x00c0Imr0o6Q5LGFrUN/CEiTmIVxoAjKMyrV6vBp0Mn1+2KTS+c7UPAj
	jkVZXIqgrEbXqmxrmYiZNeiiELAt1K78gYa8LhFkYaPPZAVnsd1v+AfnOS+NSqbetHqx9S
X-Received: by 2002:a17:903:2b0d:b0:2b0:5ec1:97c1 with SMTP id d9443c01a7336-2b97c3d6b08mr55442745ad.7.1777431833794;
        Tue, 28 Apr 2026 20:03:53 -0700 (PDT)
Received: from [172.20.10.2] (42-79-67-210.emome-ip.hinet.net. [42.79.67.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f132sm5877035ad.49.2026.04.28.20.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:03:53 -0700 (PDT)
Message-ID: <909885cd-286e-3fbe-9e06-26334c1bb96e@gmail.com>
Date: Wed, 29 Apr 2026 11:03:48 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add bindings for
 NAU83G60
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kchsu0@nuvoton.com,
 sjlin0@nuvoton.com
References: <20260424033953.280520-1-YLCHANG2@nuvoton.com>
 <20260424033953.280520-2-YLCHANG2@nuvoton.com>
 <20260425-independent-puzzling-pigeon-a3fd84@quoll>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20260425-independent-puzzling-pigeon-a3fd84@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/25/26 18:13, Krzysztof Kozlowski wrote:
> On Fri, Apr 24, 2026 at 11:39:52AM +0800, Neo Chang wrote:
>> Add device tree bindings documentation for the Nuvoton NAU83G60
>> audio amplifier.
>>
>> Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Got it. I will fix the commit subject in v2.
>
>> ---
>>   .../bindings/sound/nuvoton,nau8360.yaml       | 115 ++++++++++++++++++
>>   1 file changed, 115 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
>> new file mode 100644
>> index 000000000000..29b10155c4f9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
>> @@ -0,0 +1,115 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8360.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton NAU83G60 Stereo Class-D Amplifier with DSP
>> +
>> +description: |
>> +  Stereo Class-D Amplifier with DSP and I/V-sense driver.
> If "driver" as in "Linux driver" then please drop the word.
Got it. I will drop the word 'driver' in v2.
>
>> +  This device supports I2C.
>> +
>> +maintainers:
>> +  - Neo Chang <YLCHANG2@nuvoton.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,nau8360
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: |
>> +      The I2C address of the device. The address is determined by the external
>> +      hardware configuration of GPIO1 and GPIO2 pins:
>> +       - 0x1a (GPIO2=Low, GPIO1=Low)
>> +       - 0x1b (GPIO2=Low, GPIO1=High)
>> +       - 0x4a (GPIO2=High, GPIO1=Low)
>> +       - 0x4b (GPIO2=High, GPIO1=High)
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: mclk
>> +
>> +  nuvoton,dsp-bypass:
>> +    type: boolean
>> +    description: |
> Do not need '|' unless you need to preserve formatting.
Got it. I will drop the '|' in v2."
>
>> +      Forcibly disable/bypass DSP path.
> Why would that be hard-coded for given board?
Our intention was to use this property only to set the initial DSP 
enable/disable state during probe,
while still exposing an ALSA kcontrol so userspace can change it 
dynamically later.
>
>> +
>> +  nuvoton,low-latency:
>> +    type: boolean
>> +    description: |
>> +      Enable low latency mode.
>> +      Please note the feature helps sensing performance
>> +      but worsens power consumption.
> I could imagine that low-latency needed for certain use-cases, like
> realtime audio, thus not really board-level DT configuration, but
> runtime.
I will drop these properties from the v2 DT bindings.
>
>> +
>> +  nuvoton,anc-enable:
>> +    type: boolean
>> +    description: |
>> +      Enable ANC (Active Noise Cancellation) feature.
> This as well.
I will drop these properties from the v2 DT bindings and expose them as 
ALSA kcontrols instead.
>
>> +      NAU83G60 provides configurable low latency ANC path to Advanced DSP through TDM-RX.
>> +      To reduce latency, the ANC path only supports 48 kHz sample rates.
>> +
>> +  nuvoton,aec-enable:
>> +    type: boolean
>> +    description: |
>> +      Enable AEC (Acoustic Echo Cancellation) feature.
> As well.
I will drop these properties from the v2 DT bindings and expose them as 
ALSA kcontrols instead.
>
>> +      NAU83G60 provides Advanced DSP processed audio data as AEC reference through TDM-TX.
>> +      The AEC path only supports 48 kHz sample rates.
>> +
>> +  nuvoton,pbtl-enable:
>> +    type: boolean
>> +    description: |
>> +      NAU83G60 supports PBTL mode for mono output.
>> +
>> +  nuvoton,vbat-microvolt:
>> +    minimum: 8000000 # 8V
>> +    maximum: 24000000 # 24V
>> +    description: |
>> +      VBAT supply voltage in microvolts.
> This device does not have any supply, so how could you set its voltage?
> Plus, regulator bindings define it, not per-device propeties. Drop the property.
>
> Also, add missing supply.
Sorry, I misunderstood the standard regulator framework.
I will drop the nuvoton,vbat-microvolt custom property in v2.
Instead, I will add the standard vbat-supply property to the binding.
>
>> +      This is the analog power supply, provided by an external power source
>> +      or battery, and must be between 8V and 24V.
>> +
>> +  nuvoton,tdm-channel-length:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [16, 24, 32]
>> +    description: |
>> +      Assign TDM channel length.
>> +      The length must be 16, 24, or 32.
>> +
>> +  nuvoton,dsp-fw-names:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    minItems: 2
>> +    maxItems: 2
>> +    description: |
>> +      Assign firmware filenames for left and right DSP cores.
> Please use standard properties. This is the second one you re-implement.
> If there is one single thing which upstream kernel hates is the
> reimplementation of standard things by each vendor.
>
> firmware-name:
> (and see other examples how to write it - items: with descriptions)
Got it. I will use the standard firmware-name and dai-tdm-slot-width 
property instead and drop the vendor-specific one.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        codec@1a {
>> +            #sound-dai-cells = <0>;
>> +            compatible = "nuvoton,nau8360";
>> +            reg = <0x1a>;
>> +            nuvoton,dsp-bypass;
>> +            nuvoton,vbat-microvolt = <12000000>;
> Add the rest of properties o make this complete.
Got it. I will complete the rest in v2
>
> Best regards,
> Krzysztof
>
