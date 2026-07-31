Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA90433BAC
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512529; cv=none; b=Muxa5Cwp4MDdFHDnwSinHyj7sR7D1Bpq5Y1kwRM7XhZ1btNida9ViMmMP+t9lN/pnKcmkBoLmQ2kuBdy3hqKApyN3/FX1vmKI4ooya10gCQdc4yc5zt09ljmvXiQS/H6kGjKdiH1JFxxgBwS2mYxq6lP10UcosF8A4dMxc4+BLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512529; c=relaxed/simple;
	bh=LYlvOTib2FM4S0QhMRDhnJ6ost4UL+qbapvJXXj2/8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XYyokxh65gXiAHFB7/mIKFN7xQD7t7vzVyDswMDI3+bNa4OIP7rlglRQWXYKYCnGeY5bKGz7bPrdL/zhC0lw+3CGjKBPcb3UyUheMpylsM/FZwtpEOiqSMdfJs61cxgoNJ4bNLMkpLZpUF65CwtkV0iA7SSE1SEcJ81YfXA/YxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kJocTLp8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kJocTLp8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1212273f8f.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785512524; x=1786117324; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cJARTRpeUTDwH7ZSQm/DfErRwTHcsGyw7SKG2JJKGsw=;
        b=kJocTLp86Vp/AAdekDgu8WS6pY7O8R9FzLwMBVcGbziq112Aijvy97cphzuJUtC5mA
         ekgDS5ibbuzyz4mgl3rKmnzFQUatwVrJ3+ZvrUUf/0oyhNrgysLC4XR7H6lBiaTVodW5
         g/U82Oy1ctzHmO/Puz40OuH9GJqH2UmGfnsteiS7lltYbLsmXrblb/ptNDksqP9UWyUR
         McDbByJvhC7wFZ4O+sy4dnfutwwxFHPcx5YGTyMHRERkyxRkh1qohR0j5S+OuVGxEAOK
         kxZ9tXjB46MV2k6iRIPfx3t+R/fjrQw4l9qyTi8Bv3iP0rjZhHkgNSdLwATnsfcDsUtO
         KPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512524; x=1786117324;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cJARTRpeUTDwH7ZSQm/DfErRwTHcsGyw7SKG2JJKGsw=;
        b=az3qY+A3lGbI1K7swwLsy3cea/qN/vEj1PsK2JGCHlIbmlnt8ykLpZ97PlYpTU7Q4b
         k96RdcMuAhDS+yCQ8f0yznjrkFP390Ty/TphyqGKR7Z5T5a5/40VNwZYGPoodPfuFnUd
         2vnFz2AvK5Uv6ZyruBjYqJ5p1Bb2yyq5QEBRBmeChCeGWGAdHtyjIRych7Eif6e3BCvj
         udNJ86SvdqrYTcBpF5vICTTiq0P1D6zjD8fFK0x9MS4AiBUMXM+olmSlAOLzBm4zbHOn
         4L8ZfmskW/ugadB+x5wv/9HoOyAi9JP/JALYUckErr20bNW/tREJLyahrY9zLLenlxB2
         jRyg==
X-Forwarded-Encrypted: i=1; AHgh+RqxWjg1AaDmi0hNLqcINy6LxzgUU6n4Msm8QEQgIkfIuE7xanESGx9w/o5v2uH1gcqCP1PujnlmK6fy@vger.kernel.org
X-Gm-Message-State: AOJu0YyDiADFSO8fyrCqPAWOSGnYAJ6z7CPMlby7uevzP0e0tongdmtX
	tdqZET/lCwf+JUEu3fUkQ4lm7ssSQi9o6nEn+7mY2MdrAKBdmsWAvmQqzms+OVqjL3A=
X-Gm-Gg: AR+sD13EqZ+dgKsFxEVwHWvX5071HPwsGZHG8Dz8vkiWUQGVZGtJYYKyGI5oexGwo3X
	WWTQubNa7tdxQyKGMeTufzz02WqNEkrygdaZUYUp9jIHMKWfCytCP/cg7ZKRE0niCU0RuFgaJ6T
	Nz/y34uuLxec++ndUPuK+YEO+nk8cdkgFb4ruMrvgxEVWpkjpF+AUxsElXbNtyYCFIQk6lcJeCt
	PVkuJUGVD9P5O9BsQKMG8K3h/3fZSJ0sZvMICPCD3oqTq55VmYNvdws+EIvSnq8HbS/wUqzQOiV
	+iHXPtJ7yOXKQSea+kD300Q+/jA9gFDU39vEwcWe3w6r25Ie5fSmbGrOkSrPU7WO8bo6VueWh3Q
	shYKd7maOa7M9dIuVMFqdCB5gat9TNm6SMeeLjeCRrB2Bngq34SEWrHQw8XQnH7/pVZy8sxGyRO
	oYn+gKtgdECNf6z6zSwpMetxAX+72JByeWhd2Hnf0vKq9u9gwrfilfGXepJQ==
X-Received: by 2002:adf:e309:0:b0:47f:7c4d:c9a7 with SMTP id ffacd0b85a97d-47fd72f1f7emr138197f8f.47.1785512524233;
        Fri, 31 Jul 2026 08:42:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd456262bsm5488966f8f.17.2026.07.31.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:42:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
In-Reply-To: <20260731145338.4479A1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 31 Jul 2026 14:53:37
	+0000")
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
	<20260731-axp318-regulator-v6-3-b4e745552a35@baylibre.com>
	<20260731145338.4479A1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Jul 2026 17:42:02 +0200
Message-ID: <1jh5lfxj1x.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 31 juil. 2026 at 14:53, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The compatible string `x-powers,axp318w` is omitted from the
> conditional block that makes the `interrupts` property optional.
> --
>
> --- Patch [3]: [PATCH v6 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W ---
> commit 0a2fd6c8b0d8fd1a45bf4a464bf3e71df8fa62f6
> Author: Andre Przywara <andre.przywara@arm.com>
>
> dt-bindings: mfd: x-powers,axp152: Document AXP318W
>
> This commit documents the AXP318W PMIC in the x-powers,axp152 bindings.
> It adds the new compatible string to the lists of PMICs that lack PWM
> frequency properties, and adds new input supply properties.
>
>> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> index 45f015d63df16..38556c32417b3 100644
>> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> @@ -83,6 +83,7 @@ allOf:
>
> [Severity: Medium]
> Was the x-powers,axp318w compatible string intentionally omitted from the
> interrupt requirement conditional block earlier in this file?
>
> Looking at the block just above this hunk:
>
>   - if:
>       not:
>         properties:
>           compatible:
>             contains:
>               enum:
>                 - x-powers,axp15060
>                 - x-powers,axp305
>                 - x-powers,axp313a
>                 - x-powers,axp323
>     then:
>       required:
>         - interrupts
>
> Since x-powers,axp318w is missing from this exclusion list, the interrupts
> property will be strictly enforced during schema validation. Does
> this match the expected configuration for this PMIC?

In the case of the cubie a7a it is wired to the NMI controller but NO,
it is not strictly required. A platform may not wire the IRQ and it
would be fine

>
>>            contains:
>>              enum:
>>                - x-powers,axp313a
>> +              - x-powers,axp318w
>>                - x-powers,axp323
>>                - x-powers,axp15060
>>                - x-powers,axp717

-- 
Jerome
