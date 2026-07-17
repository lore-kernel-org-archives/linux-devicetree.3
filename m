Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEAD27FB37
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302599; cv=none; b=MtpJN4D+6yuiKHjGIqriwdj+KQuUbub8ipyGipSAwJxwfVD75eSJGp6/ku4RT3W7JkU4H7ia8M75kkWGBQlLN38Ecz1yTRi/moFw1cVqbRjFP/Q7i/4DH3uQ494Vh3HYzZak7wkuVX4BkwYxDB3X7bQf495kYUO29ihgPvY6WuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302599; c=relaxed/simple;
	bh=OGy2pfcAN2GFKcbV/yorUJwArQd8TXfzZZ1JyYVIzRI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oSjsKjaCfjanEpJk5ewoMnU66yLaH+D9zRkWp0/J9DwDSVJNhJqxr4z6t4MaTLSwjLmpUvNyGF1iIt7kzFOoVpnbswRhYPPMBWrrLUlVc/h/gFgpkwBjq7mZnBDZjTE0274u3skkgAvTJOyC4ypMUq78CpDUa/mGsa+g/HWGuN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EAAJtoxa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EAAJtoxa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4094600f8f.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784302594; x=1784907394; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Y4rP4sEq2yVBaw8AT4wD3lMJ7BMNwwChWjDwvDDGnM=;
        b=EAAJtoxaB1wbCj6DWFQ/ISbr2P6Lu2hgHnYbCZHC+GZFzE4RAgdf7SQSYy0CFLLkqF
         2c+xWgBsfJth70krXp94XC481nCMgbmh5YMCSJg+anH0KCqPPNUvvpXFcgc1/dEp8SaE
         illB7mgYjcCH6gfMrEU1uM3WTF9tL1RQ5Jn/Q7kgD04c3/VeYCFbG/xYxa4mrmS6FyIF
         vBP6aA3LOmAltJ8Esy2qyjvUQyVsnDpwzxDIkezhHBdQolXxHBj1oEq+WCS1i9Pntr/T
         i+2CIyrhDmk4KjB5LMFT9dK28dtOdcEqxlDx0Kc7Og7SqJqgbM5/rLov0NIOOFmUS44E
         +UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302594; x=1784907394;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Y4rP4sEq2yVBaw8AT4wD3lMJ7BMNwwChWjDwvDDGnM=;
        b=UP1S63ZYhl89nq17iDEOcV4jZ1wLbqx0kMGxKhpxL7073pgpwTaoSdTMssQhyQW3vd
         MTX8w1bvFKiI7U2RQjkUY533bs/Ealo+Du7I9egF2xLYOUBQ9KvN1WRCKA00ctuBpCuy
         brIAQnNwJ7d+v9aNA/RiDby/Bg1aENJPYIac7L/J1dAcPvCN4HLWChhavDMWr4i67mIN
         XMn1Xu4DyvrFMIh3FzJmBJvV8PmjA0+IYnH7e4RItH6MJmeednM3Rj6GbZ6NVUq0cFpK
         K7mBsS6qAV1Sd+4Ax1S+pIrSFpho4sSN4Yrr2irDSkOBnrnu8Nj5SpW0t04r6RRZPmxD
         +39w==
X-Forwarded-Encrypted: i=1; AHgh+Rpl84wZbcqpg75UeExvkgKMAkPZHmExInRUKTxH8nJbIovSFTKxbpj/3BZZxVIwqZ/IkcDOpU9DowcY@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDSvGT2c71L4AKM2/+9kSXjG0sgO18F91UmzbIGzyPLSyefpX
	chEpqIZtR3CVp4RL/ovMxZ0FaM4lqsh3brBIAHzhMuD4tJvQ/BmnsY0bOed6kmeoVOc=
X-Gm-Gg: AfdE7clPNHyvo9aZZrR2ywQVPkqkKAZ2HamlEm4B1MpY9Z5/f0Dfn3M1NZPY7iWSkKb
	4UwBCtsdcLz1RYGMmKBcJ5LYC2GMdlvwbUzZT+FiYMnOs2BNXZtveLFsY1R+gMSVnVvDbcsjruJ
	RBZ1653whF/z2MrEw/1r2osOc3gsx2OkkgZu9O6yVIzs/xgXSFpCei74F+iXZQpfxh6QAE2Ld/H
	isGwzjdKGpz+EYUiXKaxpxs3o4zxe+cdYeOFwc7aaGVSC3r9CM+hX+jWWxOt2vtwvINhoDbgV7+
	bg9QUkbyNiQRWdoPwuhOfb/NlNDPxDZT/D8ROsar7AXtxq4TLXCk8UjXYPVpRvMcHCf9aZp2F7/
	d4C1D6dQI0Sd1LsZaOg+u5AS9WF+uqs9dvJOvaYjCB34riD9T4TmGUeb6zQFDedSHqyWWZmivoq
	S3
X-Received: by 2002:a5d:64ee:0:b0:47f:5a97:2a62 with SMTP id ffacd0b85a97d-47f622feb52mr4412603f8f.26.1784302594123;
        Fri, 17 Jul 2026 08:36:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e65644sm4276043f8f.16.2026.07.17.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:36:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,  conor+dt@kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
In-Reply-To: <20260717144316.7D7371F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 17 Jul 2026 14:43:16
	+0000")
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
	<20260717-axp318-regulator-v4-1-50aff97084dd@baylibre.com>
	<20260717144316.7D7371F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 17 Jul 2026 17:36:32 +0200
Message-ID: <1jzezpeigv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 17 juil. 2026 at 14:43, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The `x-powers,axp318w` compatible string was omitted from the conditional block that exempts similar PMIC generations from strictly requiring the `interrupts` property.
> - [Medium] The regex pattern for regulator nodes allows non-existent switched output nodes (`swout3` through `swout9`) to silently pass validation.
> --
>
> --- Patch [1]: [PATCH v4 1/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W ---
> commit 08577b06937ca6f13b4a7f204e7f0abb6042c44d
> Author: Andre Przywara <andre.przywara@arm.com>
>
> dt-bindings: mfd: x-powers,axp152: Document AXP318W
>
> The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
> This patch adds the new compatible string, updates the PWM frequency 
> property list, adds input supply properties, and updates the pattern
> for matching switched outputs.
>
>> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> index 45f015d63df16..95b3984fe0f96 100644
>> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> @@ -83,6 +83,7 @@ allOf:
>>            contains:
>>              enum:
>>                - x-powers,axp313a
>> +              - x-powers,axp318w
>>                - x-powers,axp323
>
> [Severity: Medium]
> Should x-powers,axp318w also be added to the earlier conditional block that
> exempts PMICs from requiring the interrupts property?
>
> There is another allOf block in this binding that forces interrupts to be 
> required for all devices except a few specific generations:
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
> Since the AXP318W shares constraints with siblings like axp313a and axp323,
> will omitting it from that exemption block cause valid device trees without 
> an interrupts property to erroneously fail validation?

No, irq should not be omitted

>
> [ ... ]
>
>> @@ -277,7 +303,7 @@ properties:
>>            Defines the work frequency of DC-DC in kHz.
>>  
>>      patternProperties:
>> -      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
>> +      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-9]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
>
> [Severity: Medium]
> Could the swout[1-9] pattern allow invalid switched output nodes to silently 
> pass validation?
>
> The commit message notes that the PMIC features exactly two switched outputs,
> swout1 and swout2. Allowing swout[1-9] might let device trees with invalid
> nodes or typos like swout3 pass schema validation incorrectly. Would a tighter
> pattern like swout[1-2] be more appropriate here?

It is like that since v1 and has been acked.
It has been loose since forever so if it is an issue, it is defenitely
nothing introduced by this change. Making it strict would require a
different (crazy) regex for each chip.

-- 
Jerome
