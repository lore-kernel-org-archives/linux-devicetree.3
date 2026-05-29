Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731AA3B6C0C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044538; cv=none; b=tK3YuGkQP3AqeCNemfvf0lAE1Si3DC3cZxh8iG1fLO5I2yaw6YaTM+2wnC7+Ni4ZWucVDb7mZgrN/7t+YARquUz8c2sAs4iEAKOEzzdu8l/+ZLyOEYlRlj1G5F/CBLXUXPLw4Opy2Q50cxVPHEaG8KkNovCPpz9o5Rc1xL2kQFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044538; c=relaxed/simple;
	bh=0pbmQ8x+4jkjdTH1lwE4m2tQBElxZ0ixePvmyrKwvMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odZEfPdI3kXbt12k1b4xyzM9fnAub1Nn/7XQSgS8KNs/UAocT8OahmFpw9XVRCC3aoZT653MeI5BmkahTW8egWeHTd3ujAO1L8oFwQzedBicqlARfM69DIYyaRu3TWoscbwlin8B/EjMJKnFyY39fsYAHy/QcW6UHECh4opZJQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhvyXvZZ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhvyXvZZ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so7908712a91.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780044537; x=1780649337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zu4woSO4TBEOYZHa/WNQ9LLC4/vLLUP8Ms3Ns6fPdiY=;
        b=BhvyXvZZwx4iWjbDQfy8vq6Mt4wvEv0OksQHP8TeeHv/GukIM7LtdX0kZDSlFurTTH
         qTFDIiT+WDmkHVYQTnJ4np6bIbCWjhQmRHFtyyOwf/ATSTW0amMH5oVnSR67BWtP4l8G
         tg8cUw9kdRAuzQrma6wY/pSTfOWxD/UM1HKxs46WnmtSGgl0PtSs/a/pWX8okaPtvSZr
         2j/vBZqPmWha7lmO8+idC0xzc7Jy4+Oh9f6v/dF9O4obCqYMuxFDYjpUQc8/fptrChsc
         xGRKVCps6b8nDSIRghj3gcVTr+lZZcCtkohqk2iRKAYz4IWEngkJns+EZmK1qQdGU2kf
         bECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044537; x=1780649337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zu4woSO4TBEOYZHa/WNQ9LLC4/vLLUP8Ms3Ns6fPdiY=;
        b=hRuFqtnUHZARk5uBeSCj4ISmCNaBWUBykFicB68uITl657oILbHLlPBVBgQjsELWDm
         xkPVYm4hz40kIIIPDKHQhdwApTZ1+oQEs6d8BoAGVgxoXYAk5+jsnIseQDiJJ1Helx5T
         4n62M9HvZyeh34ya03IuHL7mSfBsnYTk6StGJS3+Q3r9HE9msrzvvAzagIENDBAotIWn
         NNxvvqkNcEc6WTfraKyb8vAsr6WHMJoVuLEtyQ3CYineTU6b+2cJYSuqiVkh/OKP2to0
         qxl9RoKDSWV0clmxpSYlT1thoNRrF6kWctNlQCoZTEfhFiecZyR2E9yOIfedSCWvxfNz
         0+jw==
X-Forwarded-Encrypted: i=1; AFNElJ99BHnr32CjET7GoA+euKMeWLmqMR+AbmlR6s3Q3ImNx98sOSwF+Gg/FjU2wkKt4jIJp0owNiqc/VSq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+/GMo5SMb2ZHKa1+tqn+ZSfQNRFAi44t8Na6iWgARjreZ4+sk
	m7OpL11H4uZt7b9Nj9r8sgYWZhngx7hBnSZd+WZljFs0AvpLykzSkLae
X-Gm-Gg: Acq92OE6bRea1XtjDzBH4gv8d1AiwxGs5gC5SA2zldjGDKVpa614q2tfzVAeJXAVMDv
	oRGo4WudILW+3yjOrPcYsBWAFv184oy5A9f9OT7XwBM4JqpFp+n+2ihvR/v2EfnL9U2FQyLo0Bk
	BEuitL5DM9CC3vF1BpKQkIBEQDwqD+xGyuyoWvqhponoIU981LpAyvFYsH1086DHipXdvUnZP3x
	Z6Np2A2vZb4O/0x6sKd43Q4idkPCXhMKcWrFhnuWYR5yG6G8LdZRT9dDpOJC6FK5SFi3JjbRTdJ
	cZl/ZZrbem1pNrU5unuK4uaWhnfrRX1+JxJr9fSRLd2E4UT1jjmx1BdaU1aoMh1TP0Xsf5d3iOb
	M7dqdb3ip1dW4oiinaW6fKW+aDT6S2z8TKxjGV8vTsRLz+POWFBVgJAlLcz502QwgeikkGMA2BM
	6qwmLA+sytmdUOGCg+rspEQt5646qXN26bSjuWU7n0qQlNac4CBUdzv+gbR3j38FNJRFI7
X-Received: by 2002:a17:90b:3a50:b0:36b:769c:e5bb with SMTP id 98e67ed59e1d1-36bbcc145cfmr2354489a91.5.1780044536629;
        Fri, 29 May 2026 01:48:56 -0700 (PDT)
Received: from [172.20.10.2] (42-79-54-216.emome-ip.hinet.net. [42.79.54.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0befe7asm1448578a91.11.2026.05.29.01.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:48:56 -0700 (PDT)
Message-ID: <b2e7738b-28b2-6b6c-6a7e-0649f42f5b85@gmail.com>
Date: Fri, 29 May 2026 16:46:41 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260526015826.440769-1-YLCHANG2@nuvoton.com>
 <20260526015826.440769-2-YLCHANG2@nuvoton.com>
 <20260527-pink-cockatrice-of-expression-04b6e0@quoll>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20260527-pink-cockatrice-of-expression-04b6e0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/27/26 17:15, Krzysztof Kozlowski wrote:
> On Tue, May 26, 2026 at 09:58:25AM +0800, Neo Chang wrote:
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: mclk
>> +
>> +  nuvoton,dsp-bypass:
>> +    type: boolean
>> +    description:
>> +      Forcibly disable/bypass DSP path.
> Same questions as v1. Properties are not to control your probe() in the
> driver, but to describe the hardware.
>
> You have entire description or commit msg to convince that previously
> questioned property is still reasonable in terms of DT.
>
> OTOH, isn't lack of firmware binaries enough to deduce that DSP is not
> going to be used?
Got it. I will drop this property in v4. As you mentioned, the firmware 
presence is enough.
>
>> +
>> +  nuvoton,pbtl-enable:
>> +    type: boolean
>> +    description:
>> +      NAU83G60 supports PBTL mode for mono output.
>> +
>> +  nuvoton,dac-cur-enable:
>> +    type: boolean
>> +    description:
>> +      Adjust DAC output current to match speaker impedance and prevent
>> +      hardware damage. +3.2dB when present, 0dB by default.
>> +
>> +  firmware-name:
>> +    minItems: 2
>> +    maxItems: 2
>> +    description:
>> +      Assign firmware filenames for left and right DSP cores.
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
> Please follow DTS coding style.
Thanks for the suggestion. I will follow dts-coding-style.rst in v4.
>
> Best regards,
> Krzysztof
>
