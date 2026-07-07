Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9244E414A33
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429239; cv=none; b=NL5vX3/unyhfyMDmahn2l1STsVVGU+y6/bMfAavGuBZO8CfqpwlmI3sknknD3MQ1aJ1p6oDw1WMA4WYcJgHIkGyFQNJu3fuwh/lsIlvVSQwoAwfc8rJ8llPwlJZ8C5B8AQnQUYxaF+Mud5YhcWv2QFiA8hfPM26qy4r9vnHtBcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429239; c=relaxed/simple;
	bh=Uf5wdHbvLT8glBukS87Z5XtjDjsk3W7uGIPm/Abkx0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtz7Pcgzunizxq8taU+MmBbwqwzRoL0qNQ2+1EmHEbz9yY5f8IwhV76X6ueRQKK0WV197HryFb4f1iaBFoJtbMIlfhWSqG2C+b9peEJgo4l3B+gcQdzWMvz9CTqMJc4FgZs2Fe9ktZ6iJdbPaMMBoL84UxLd4nnarkZUggIXoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGUU9pe7; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGUU9pe7"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8478a25f268so3196362b3a.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783429238; x=1784034038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjSN27vhCfpwDogooT1C63qE/61HtdzQ904BFc54Umw=;
        b=JGUU9pe7tqmFu4bKpDaWEkgiuI0RaTjOWtHk/Ssufm38R3INQd40UrzrA9EhX9DL9w
         QPrqm6/Ghqt5tb88+mCXgpD+EjPoitLBeWnZT4XMaNblrSyL5cmDB2PtjzMRzqFzK9cS
         uj+1SfZIOOBXmsk4g1q6ebHW83FmCSsh8Zq/5Hz0OShYP8GnW6WSWkS7tuNrzn87+82H
         H67NZoSR97DI+A8JgX8HhYvdmRNJxAwkcNaJMSmWtotT9Wh3gknSlY2D9b3cN9AoaVCG
         zdURVkHYKNS9PhJrfM0ze82Si50/ZCUeRCByOHSsWH0tOxzptZolmTP672fKP4i3UTfo
         DOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429238; x=1784034038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjSN27vhCfpwDogooT1C63qE/61HtdzQ904BFc54Umw=;
        b=quVzV9DP847iQ2B9jjlm6aopWetV3FJZpt4a4fq/g67NlRyz3Fsg4PPVBJRAFClFtm
         s13xFGKVEbOj07ePbVi/+R57D7KMpRFYiNdBkEB8HM0TECTxz15uxq0Ommpno+wcVWcZ
         PkBnB3UHKPuDOrzOD4cmiQCP8anQAhko4LsxqR7DH6xlvKQy+COTQf5WsQoqRKkhcSQc
         bMo7/hmgN+yFnbgi4PLKwoIh/kPiPHV2hgPTyG6VKlbUiGxPN+qJboqgLrIfAimGy3O6
         iLTkRgFfFW50vUzmeMAEy1s1AzI3MHvzu3jKIfrl3l5fxfHvFIBJH9kK/UBosFo5+2j+
         8xVg==
X-Forwarded-Encrypted: i=1; AHgh+RqSgZIrBcxeol0senKp1lplTEzo3QmkjYOnkJqzWiv/wG3O/dyahIoDMOUwT7ugFt96HetiOvXtsjpM@vger.kernel.org
X-Gm-Message-State: AOJu0YwvAmwZiK9hHYK5Zb4TcF2L56shoPREaY0vxgHOHqTtSQ7A6jud
	i1DWQlpi17d1VEO2tkFwf6C/nhKN6Z3YhErMb8NfJzY6mYpB854WmT6y
X-Gm-Gg: AfdE7cmHs+sR8HMNhZy3stCZWrXlaj3fHCTw230JaaoxCvjuT/LzFOLY0LIbKGEPtd+
	4zUgR05obCEAydn4mAWASJxbttvNipzHXf6cciEgtSGBQJnvTr3ED/pbu7kqMI/kij5tCQFPRen
	0oZLD1eyfMa1SzdsIUjHefkTakcdaImwsaAXfwVQgxFo7FVljwcqxbIgBqccsI9jRtvSpz1dC4R
	RUCiYS/a6mYd0wNZOYEtUgep/1vx4Dfr37nS3nc4cw/szb6EBOg9P9Qo09YyTwDCtDe0hOYa2Fk
	mjd/Bv8fHsKs1O8Wf9UyZCVNOVCm+/JBWPFlRk471jXBKKPwV2F52+FXrzGrkt1uUxmss8UNtmH
	7A/sNgFshIIYnuoN9E0w96Msi7Ew05BQSS48LMnNG4+rEaqzqFQTgF+ZZkm5D/BWHC4B0QavMi3
	elO+bJPrWUZW1qV2pYXVjolmzTInQvxsPQDLVUqYmAH66BIiy9ffcmud94mhBg5Tz/jymAHlDn7
	nhD4hwaFlgFk0ZgJZEo+Hk=
X-Received: by 2002:a05:6a00:2195:b0:848:2f74:d8d3 with SMTP id d2e1a72fcca58-8482f74dc06mr2504483b3a.68.1783429237597;
        Tue, 07 Jul 2026 06:00:37 -0700 (PDT)
Received: from [192.168.0.101] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5b95sm1010719a12.3.2026.07.07.06.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:00:37 -0700 (PDT)
Message-ID: <1b5ff53e-53fd-4600-97d8-7ba34d139e5e@gmail.com>
Date: Tue, 7 Jul 2026 18:30:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: leds: bcm6358: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jonas.gorski@gmail.com, noltari@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20260609181731.1379846-1-ninadnaik07@gmail.com>
 <20260610-gifted-zebra-of-reward-2ab6c7@quoll>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260610-gifted-zebra-of-reward-2ab6c7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/06/26 2:09 pm, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 11:47:01PM +0530, Ninad Naik wrote:
>> +maintainers:
>> +  - Álvaro Fernández Rojas <noltari@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: brcm,bcm6358-leds
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  brcm,clk-div:
>> +    description: SCK signal divider.
>> +    default: 1
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 4, 8]
>> +
>> +  brcm,clk-dat-low:
>> +    description: Makes clock and data signals active low.
>> +    type: boolean
>> +
>> +patternProperties:
>> +  "^led@(0|1?[0-9a-f])$":
> "0" is already in "[0-9a-f]".
Thanks for pointing out. I will remove the redundant 0.
>
>> +    type: object
>> +    $ref: common.yaml#
>> +    description: Each LED is represented as a sub-node of
>> +      this device.
>> +
>> +    properties:
>> +      reg:
>> +        description: LED pin number (0 to 31).
>> +        maxItems: 1
>> +
>> +      label: true
>> +
>> +      default-state: true
>> +
>> +      linux,default-trigger: true
>> +
>> +      active-low: true
> Drop all four above and switch to unevaluatedProperties: false.
> unevaluatedProperties should be also placed after $ref: common.yaml for
> example.

I explicitly listed those properties and used additionalProperties: 
false based on Conor's feedback in v1, but now I agree that relying on 
common.yaml with unevaluatedProperties: false is a cleaner and more 
modern approach. I will drop the explicit properties in v3.


Thanks,

Ninad Naik

