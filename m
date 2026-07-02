Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7574427A16
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980741; cv=none; b=qwZrkkucwMhGFYKuVmdFQ8+HFkkCbWZx4ShacRJfC4TMm9XIQnp6yOA5GbarA1tE5rgSl5sxOCp03Uvb8ViXSELWlDWbJVzssyJ+a+M43GTBvvPESaZAsbSWGTQFMfBg+0FJVlQ5X8G+iaEIdU7rnwP4apZzatjhIDdwWtPO/BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980741; c=relaxed/simple;
	bh=oyQyAaTbOb2+AdT8dOLv81agBfPvE7ELT7uNJbodmmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUbEo2hxLyj+kuzFwpqG8EIaltfk5zjGakJgwFi+n2ZvvdLGGSdPOGkJexqgfucKaSa1PySclYW9yQogAZU743/hED/LjDcEh/mMJAkMqPT9rdZjNpG+0fqqnenXtLeQPOqYjkBgyPMtryP9DQvo+2jZ6lXO97fK11QPzqe0bwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MApo3wvg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MApo3wvg"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aebae2f310so1415165e87.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782980735; x=1783585535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChabhUaCOXh5EuwzltNfOtEZfxGVEpjiK7fdw1VGpnI=;
        b=MApo3wvgaUvbXXXY6Lo131ONlpQ7ay0wSlwBKpBgQqHxRbUlLhLlu/G2aXHUfycjmu
         dQ3FBF7jj/ywmyedTVtcySq8DURMeo8KkZpuGm801YtwR3/7dOcjOGWq7NPqmnEffM9n
         i5I9hcf0cT6Av/l/czk8ZCk2JMyuVJsYVlzijMfAYVWKPR1aHMZ9q6SetSZHtY8Xo/OI
         hCbChOM6BmRDbVm82nY8IH6n615nDWH65KfUdMxyqUUgWn4b4LENO8xX8mePsUjCfc1j
         J4424qE6sjvomPXGlg6Ya7j+GtJ6ZT+e5oTNN6Svw1/BZ4H5SFC5rki3i6FrX8oqqK59
         PEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782980735; x=1783585535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChabhUaCOXh5EuwzltNfOtEZfxGVEpjiK7fdw1VGpnI=;
        b=kS6jY04OMvGfo9XdhFW/nPWI1UIz0oduehXRj8yW/309dN+YIrtfNwmaMCfYOhn2qg
         Zj5mp+M2/Hrv1zDlK5Qd0AwvcKDXOKLe4dEZNhrN6/TZ8Tl41jLbpPKulajcjirv4/9W
         Gsr6E4eJ2qgrHv/M6kjkquQr48huZYEmZTR7ckWb8InpH07J937HWK30uAmokX6sv7oH
         Dvp699wivDieBt1sIzYq82nUh45JeLPw9pHu5gUG5t0OQ8eeMfJQDkIjXOIQ2uGnkg0e
         cNG9JaGhDbqHaR0DeRoRHm5tmSNC6ZrJYpOw6dryMAQP83cox3OgHRQ7gtE6JkwxUDqN
         gTBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYftJvBJUqvPOJvz7r3uX0SzOsbXDxPTqA0oWDrKuKUuB7JwXqXMLNr2ojEMH5mXIj8WzhWDeSRwjk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OLHyLZpnSEhCHtH1UCBfsCcwA9tdEbzGtFLGkcO8WdN54gxS
	ZJgjyl6l1qx/I9ROOUPG5QoraCfewrg+SbFfIJL7q63EIb10SI65oXdP
X-Gm-Gg: AfdE7clcSJuqNat8KTnJSVamk4ZN8qTfBRX+bTAkhSCzkZPtqPlgtWYGW3YnHlLOFKf
	i1sOrKwcMW4OMkYs494HugdgyTTWNQ1+1TvVnJEfwWOURnVzVBCrawJOdbvJz9FYmyY04+fvtzS
	BSJSW7oz+dgtaUX1IhmjeMJEBiSn+ZzI4LgTR0YQyjfF32Mv22btUfogs8N9btMpg+ncPwAPBBv
	lOIonF1QOgfqLmpADlp3hJbOCtBY/aOmLG1qaxFtQEY4bxgOA1vVK1JzmTeqtE/PuekYq48j4Um
	5DZYC5irZDSt2yATN+2Sg1YctHq+83Ax5m63u8Odtb5ofNwrD1dfG7Ke1kuWZnfTIFM/JM6MXuJ
	HvQGa7mcEkaw7qeTSYg8cyZDz0YA9XKbtcxXHOBUA8bGovpyztLrQc0iHa9zIXf2gCH688qADXI
	Dql6Y++ZpUBHFgbegjEnaAr0lhwUVagxxRs6EwHplQgR3ttGiwPLhL18xCHmr5cnVrk7bo3g==
X-Received: by 2002:a05:6512:b9b:b0:5ae:bcdd:acef with SMTP id 2adb3069b0e04-5aec6794c01mr1090989e87.22.1782980735136;
        Thu, 02 Jul 2026 01:25:35 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec8991691sm547763e87.2.2026.07.02.01.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:25:34 -0700 (PDT)
Message-ID: <b4c3af3b-a7ca-445c-8da6-7003cd780efa@gmail.com>
Date: Thu, 2 Jul 2026 11:25:32 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: mfd: ROHM BD73800 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <3e700a3fa7872a96257ff25a77670ec05cfd239c.1782909323.git.mazziesaccount@gmail.com>
 <20260702-refreshing-terrific-tarsier-f56ada@quoll>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260702-refreshing-terrific-tarsier-f56ada@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi dee Ho Krzysztof!

Thanks for the review (again)!

On 02/07/2026 11:05, Krzysztof Kozlowski wrote:
> On Wed, Jul 01, 2026 at 03:41:34PM +0300, Matti Vaittinen wrote:
>> +description:
>> +  BD73800GW is a single-chip power management IC for battery-powered
>> +  portable devices. It integrates 8 buck converters, 4 LDOs and a current
>> +  sense amplifier with ADC. Also included is a Real Time Clock (RTC) and a
>> +  32.768 kHz clock gate. Depending on the OTP configuration the BD73800
>> +  may also have interrupt controller and GPIOs.
>> +
>> +  There are also different variants called BD71851 and BD71885 which are
>> +  almost identical from the software point of view.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: rohm,bd73800
>> +
>> +      - items:
>> +          - const: rohm,bd71851
>> +          - const: rohm,bd73800
>> +
>> +      - items:
>> +          - const: rohm,bd71885
> 
> items:
>    - enum:
>        -
>        -
>    - const: rohm,bd73800

I suppose this will mean compatible is one of the enum values AND 
rohm,bd73800 as a fallback, while accepting also the rohm,bd73800 alone. 
(No need to reply, I will test it out). If so, then I'll do this for the 
next version (which is probably out only at August).

> 
>> +          - const: rohm,bd73800
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  # The GPIO1, CLKOUT (GPIO2), FAULT_B and EXTEN_OUT pins can be
>> +  # configured to interrupt pins by OTP.
>> +  interrupt-controller: true
>> +
>> +  "#interrupt-cells":
>> +    const: 1
>> +    description:
>> +      The IRQ number. 0 is GPIO1, 1 CLKOUT (GPIO2), 2 FAULT_B and 3 EXTEN_OUT.
>> +      NOTE, A pin can operate as IRQ source only when the OTP
>> +      configuration for it has been set to GPI.
>> +
>> +  gpio-controller: true
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +# The GPIO1, CLKOUT, FAULT_B and EXTEN_OUT pins may be configured for a
> 
> Missing two spaces (indent) before the comment, although this should be
> put into description. I understand it applies to each description - it
> is fine to add to the first one. Descriptions might be used to generate
> user-friendly representation of bindings (PDF). Comments won't, so
> comments are only to explain the binding/schema syntax choices.

This comment sounds like someone is crafting a tool which can convert 
the bindings to human-readable spec? For someone as yaml-illiterate as 
me, this really brings some hope :) Although, I would hope we saw some 
"comment-key" which could be used to mark the comment to be included in 
said human-readable format. Stuffing it in the 1.st description is Ok, 
but still somewhat sub-optimal. Oh well, "Ok" will do - I'll add this to 
the description when re-spinning.

I do appreciate your help and feedback (as always!).

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
