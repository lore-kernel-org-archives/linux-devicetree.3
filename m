Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4932047DFA8
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075762; cv=none; b=kyogQXKpnbhF7Z9jXViYOHUA7n2j15S0/79NbxS5MToVc+U7lg8nw+HnAOifSZHua8P0Q/NRWD3x1PWKBlqG80gpkSysk6sMinTbq1J6PVIbj0PGlP0EsiE0Ao2VdvUVeyzkWcJFEYOUg3cXcF1pk3m972XmmFqiU8nrjNL3XYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075762; c=relaxed/simple;
	bh=XcLrxU6hNruep/5Mhx3tarBzPKestSx9/PV2ZEBRHHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQNiAAPSnJ3S8ICf6rOpY1XXdKpYO3iXeA1reUCG8qKpEnDJvUsUVvr9KAesjn6ryV2e2r1ojnfhYieOPoRRM5OOaXYUh2b7sBBbio5THy1UsOVGsSmAB3e8Ak657X/EjQcAIXu3J/R9ir+Q3Mo35c4v9WSo9e5CN5zOXiJ3PPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLavsInj; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLavsInj"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8025500cc7so2744256a12.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 06:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778075761; x=1778680561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=21im18CnslCvYwXS2NJ84S3pXykaNCx3/vuExYBK0cE=;
        b=WLavsInjlhIZmPR3Ac8Zgb15aC4S/NDZrr4OP2UnPYBjUxFiz/CJ6rZmJiqksh1yhM
         qq6AUZ4GU10Y4OEQ3OM7sWtUeTNEs5o5UToriPlFTUCqMdHVQFMrnXKebLhw+yr49jpb
         8titwrXNiBEk/3XLEZWTr3NaegCuVJLgFxLtBM+amf6ZICNjtGdnL0e+PAPNkRavXivs
         LoabUPRZpYV3VFHTrMMvBVmsDD0WRIIog0l6fKRnBadrFwPB5/SCAtfWqo5Z7elqXe92
         wpeNTRXhfJs5Sf5PHx3MCxls4O9hXtcUZyXu8XXwCo010puwLa4mndyQvpO2muQHYP0U
         jQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075761; x=1778680561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21im18CnslCvYwXS2NJ84S3pXykaNCx3/vuExYBK0cE=;
        b=dAk1DyYXvRTz+AzBudx40ZPR13g5IjtMq1AvN2VRmm7drFujoosm+ZcoBprxJg1c5g
         oFMAmt2Wf2kwhujtCFEYU+8ZYBzUWzFHJTQ5r6W00w2BUd21SGEtCzwui1ZkOEXWrWFf
         rq3/WxDMZlhMbMMJG200w126IgBgDqDl7DQSZc6kXUVjaWqp2ruwxwie4aoa3FoTiEz7
         T+NSbSBeVoDjmRarFR7wk0ks//FRZucdRzYySzHJmLYtna8RaHFpOqIJD94EfO48uHac
         xNxs+0TlkwImif3PYdVnF7a+7r++vvWGT1kBbufdpIDiBnC+h55TkufrhpeC3tcFiJsJ
         w0rA==
X-Forwarded-Encrypted: i=1; AFNElJ/iNZDQ9FeT542nBrAVU3NIarYjSy/2P27Dv/ACpwo4rmn+zbdIK3nSrLT6zZ3/Bnyo4yFYB2Wr5AMO@vger.kernel.org
X-Gm-Message-State: AOJu0YzTtjuGacEYhihX4AJSA7qZI3oFwqgPDAy5+gPUwKbRKVGT+h7w
	MxNpdgnCGdZ/HPEJ4c4wdKMyeXrwHvrKryz7Rfuz7LIRL4ZMyCJWliP9
X-Gm-Gg: AeBDieu+drINc63XkCwh9KT+IKgOAq1B5R67kMP9p/8srOm2hE/3iYny822cAWSwMxq
	jAvhpDF1S3mJXDAASdOjbcyuHyqMDF3R/jdjH/e2U031Gv0pnKgBTqTFWKCc8wEr/kQFMxj/Cul
	njnj+MlD8JLH6w/xObNxfKmOBW5jdvD4LCVhN7A381A1nBnyd5CVaCIjytbx1bBzKtHe/ORb7kv
	gQJ9IGWSnGu8VQl1YcmPsF2c9XqP7h1IGltrCpSFISeZwQsDLyWSI61iZL2baNYZX+RAGac3csk
	BkWdQ+JhYsi7BfX6VW3PCPfHbs2tmJUmGZDS57HfzPkkwvyrXkVsj23hARBdoT5TO2RK121o9wO
	sxhCxbZEh6+DIO2ppFue4GRvfdlM+G8qY9XBXRKvrPCKEtBYqxceBjNT4uLLyjjgad4vRNwxkSK
	+WHkFjVPr5AckZdNlPJNIPd+ZzkdxxtIuoR7L2AcXiI+uuFc4giYTBpxAf
X-Received: by 2002:a05:6a20:2443:b0:39b:ba95:b127 with SMTP id adf61e73a8af0-3aa5a83151bmr4200206637.4.1778075760634;
        Wed, 06 May 2026 06:56:00 -0700 (PDT)
Received: from [192.168.1.3] ([60.243.224.75])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242b811a5sm2326811a12.20.2026.05.06.06.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 06:56:00 -0700 (PDT)
Message-ID: <b386707d-944f-485b-8a06-236c1242f5ee@gmail.com>
Date: Wed, 6 May 2026 19:25:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: mmc: st,sdhci: convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
 <20260503-st-mmc-v2-2-11ae3216d2ce@gmail.com>
 <20260504-rational-gleaming-clam-aeaaff@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260504-rational-gleaming-clam-aeaaff@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04-05-2026 13:13, Krzysztof Kozlowski wrote:
> On Sun, May 03, 2026 at 08:35:30AM +0000, Charan Pedumuru wrote:
>> +$id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics SDHCI-ST MMC/SD Controller
>> +
>> +description:
>> +  The STMicroelectronics SDHCI-ST MMC/SD host controller, which is
>> +  compliant with the SD Host Controller Interface (SDHCI) specification and
>> +  is used to interface with MMC, SD and SDIO cards. The ST SDHCI controller
>> +  extends the standard SDHCI capabilities with platform-specific
>> +  configurations such as additional register regions,clock inputs, and delay
>> +  control mechanisms required for signal timing adjustments which are
>> +  necessary to support high-speed modes and ensure reliable data transfer
>> +  across different ST SoCs.
>> +
>> +allOf:
>> +  - $ref: mmc-controller.yaml#
>> +
>> +maintainers:
>> +  - Peter Griffin <peter.griffin@linaro.org>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: st,sdhci
>> +      - items:
>> +          - const: st,sdhci-stih407
>> +          - const: st,sdhci
>> +
>> +  reg:
>> +    minItems: 1
>> +    items:
>> +      - description: Base address and size of the MMC controller registers
> 
> s/Base address and size of the//

Okay, I will remove these words.

> 
>> +      - description: Base address and size of the MMC delay/auxiliary registers
> 
> Here the same

Okay.

> 
>> +
>> +  reg-names:
>> +    oneOf:
>> +      - items:
>> +          - const: mmc
> 
> Drop three lines above

Sure.

> 
>> +      - items:
> 
> So this is just items like you have in "reg" part. Same syntax.
> 
>> +          - const: mmc
>> +          - const: top-mmc-delay
>> +
>> +  clocks:
> 
> Here and:

Should I add minItems and maxItems instead of items?

> 
>> +    items:
>> +      - description: Clock for the MMC controller
>> +      - description: Interconnect (ICN) clock
>> +
>> +  clock-names:
> 
> here: Old binding icn is optional. You need to explain in the commit msg
> all the changes done during conversion.

Okay, I will write this change in commit message.

> 
>> +    items:
>> +      - const: mmc
>> +      - const: icn
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-names:
>> +    const: mmcirq
>> +
>> +  resets:
>> +    maxItems: 1
> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.

