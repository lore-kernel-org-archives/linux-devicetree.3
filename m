Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7569352C3F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749769; cv=none; b=to4iHMUS+z0gzO+5ZO87UuPhVSWtxPdyg+9ph02NgPoNCUeJhAL/rOlCsTRCYugzFa5bKtY1sUJOzKFSW4zQ1t1pPGoUggRHr5FWUY4qYCc6rEqxXL3LSIxe4aKUbTMPxQ2xumhqZgngrEXR0AbvYhPR6VpqayH7L3VH9DneHWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749769; c=relaxed/simple;
	bh=DIypUq1aJTPaT29le8aCgDPQ3iCMvwD2dB3kusCe9rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAHbrwD1VF6Ri+aAIa5IeTxMv5bOek+HKRR00tz7UciAFpPXvRHjOzfY5kMnBYV7uvZvGwTQ7JRkos6Jbw1Tb9n3l7G5VNJkO4XI+N4uFctZhABcnfopMDc+uf58fbQcfZ4ibcDf8CkvhEZwLBj7OFPMvO2xTJnm3t84Tt4c6xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elwoGOhJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elwoGOhJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so94742535e9.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784749766; x=1785354566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jxGkMmrfkSCmCjSyz4Fz4f0WolkDFwEimPgOqfycITM=;
        b=elwoGOhJmTy7zCjxXnKHVj+k3Ey0M+VMBNSZRSsRqlh5s0Sspj4e9KDlXzbobtWwfr
         A/Tq6JpFU4LQnqdnfoptoFO7LP0syEslbLJAFx2/rxpo4N9TAbEMp0CTLevIx6k9hiwQ
         /e3OukE/OO3Q8+JJpB9xZu0ASnJzmQYYCckcdYdq7IP+ZX2y54+h16vZ7Q3kQMMhww1t
         GQmcE9USUxS/zyAUO4f2V5/A8FEKwcJT6LcyNNssIYI3XeO8bq1rkpIe/6OOQT4W76ZB
         ZLFNpPrxjZCusVj2E8mOR5sHfiBW28RFeJghuffObCnWlGLL23dzOwIcNw46iVrZUf0S
         dSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749766; x=1785354566;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxGkMmrfkSCmCjSyz4Fz4f0WolkDFwEimPgOqfycITM=;
        b=I2toSrVbkeCzuDfYPvG7RN9znWpvFdkL/ltXdEz/RFGbtZNkA6/G2Kz/KNkXqeaUXG
         TviUdo9LSKo9VfU2hJelsje66pWFIxTMwQJ6vKi2kcVZWvqGKc2HTzFZaK16vAovJrJI
         TXuWFtjZ13AdYiCq97Z3iSJZ/cQ1jdd+o6xWzwE/vI6RYHG8peglvlBbGM/+mLY3oEvp
         A7uFtDXMDl2auLk0dpT9FcLG4ZdXaqhtQZ3lI5thIaziWhHFayYBQcsfirhB0OoqtEfg
         Oy5JQ+K3moSEyFpijz5l9bqypYZrHJR5n4kZ8VSki9zfG1s7zuYYvzm0FfUB2cn1pVvU
         ZCbw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8SS+JsI+gOmKmfP7xhpIj/e6q1bObkyoxLkqxae7ETXQE6udjX+lhdmnSLeSoTpEFaMnCeKyVY4zh@vger.kernel.org
X-Gm-Message-State: AOJu0YwmgvOgOPcgmdZ+xr6xAFd6L7ECISMudoFibosoZSeCOfeYo9pk
	w1suz9dAfXf4wlDwsaIXb14vbag8RqmaUx9FskB6JW2x0DK1HwUsK2SS
X-Gm-Gg: AR+sD11hHiCrcPMi0j52G1A8p4buJZo6bhVO0UWD8wMu1hzRpdhTdZPkKFgW16txUFD
	R7M9fNH+mJjeEjULwJ14aBb9ohx8Utbu43+Iw7m2un5/cEHklRbixIaasLcJJ4DeM4fidEMx41n
	/r0Wa5JaTyZOBBHj49XkyKemtJ5iR9tZR7p3YMNCZJswbRgOnjL07D5BDRNMKDlCcIspRQ5rRXV
	KBnqmPYoB1dt9cPTDbctBvYcHEcpnJiQdx/dcJz5oFP0M0eik57TALzcqvnDqaLeMT50pkpzbOU
	lF6dG+M1JuclAFyH/iRC3l/PdYf/o4CJ+chBb9oNQRXNadFcyS/7x0PmwRzystNjziD9vzCafrM
	Gp/hBExrMLAHUm0nRhkYIrQ3815XX3Dd1W2JZi/P+DHv8uJC0opYiD9vczZfKGy/4LdwfBYCgbs
	+CHu8ikUn+RJjFKWXAbkiAsUD9oupTXk9DeIF9IVRDj+UUUiqpG5HxwQa5TWfI8OiH21R5HLf2z
	Iql
X-Received: by 2002:a05:600c:2211:b0:495:6b78:6f4 with SMTP id 5b1f17b1804b1-49573cc2102mr920475e9.8.1784749765825;
        Wed, 22 Jul 2026 12:49:25 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f117:4301:646f:5fa9:4c84:901e? ([2001:9e8:f117:4301:646f:5fa9:4c84:901e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm9204964f8f.1.2026.07.22.12.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 12:49:25 -0700 (PDT)
Message-ID: <3f71640b-9f22-4d0b-9c4d-dc64c397d286@gmail.com>
Date: Wed, 22 Jul 2026 21:49:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 1/4] dt-bindings: net: pse-pd: add bindings
 for Realtek PSE MCU
Content-Language: en-US
To: Sander Vanheule <sander@svanheule.net>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260715075530.2491534-1-jelonek.jonas@gmail.com>
 <20260715075530.2491534-2-jelonek.jonas@gmail.com>
 <b3456b41152613ed45bcfde92aff89d0c33fa243.camel@svanheule.net>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <b3456b41152613ed45bcfde92aff89d0c33fa243.camel@svanheule.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 22.07.26 19:49, Sander Vanheule wrote:
> [...]
>
>> +  power-supply:
>> +    description: Regulator supplying the PoE power rail.
> As I reported to Jonas earlier [1], I used this property to define a power
> supply for the 54V rail. While everything was working nicely, I still got this
> warning for the missing vpwr-supply property on the PSE-PI nodes:
>
> regulator regulator.2: supply vpwr not found, using dummy regulator
> Of course I don't like seeing warnings when everything is seemingly working
> fine, but I was also wondering if this duplicated way of providing the PoE power
> rail is a good way to go forward and if the generic pse-pi@n/vpwr-supply
> shouldn't just be used instead. The latter is admittedly more verbose, with a
> property on every node, but going forward offers a few advantages IMHO:
>  * Being able to reserve "power-supply" on the main node for the MCU's actual
>    3.3V regulator (not needed anywhere at the moment AFAIK)

I would probably rename this, mirroring the PD692x0 naming. "power" is actually
too blurry, leaving too much room for interpretation. Still keeping its purpose
to reference the supply that serves the PoE rail for this MCU with its downstream
PSE. Reasoning below.

>  * Being able to take advantage of the generic pse-pi framework evolving to take
>    into account more properties of the parent regulator, such as requesting more
>    power, or ensuring the parent supply is not overdrawn by the combined PSE-PI
>    outputs.

Correct me if I'm wrong but from what I see, most of that budgeting machinery
isn't used in dynamic budget evaluation strategy, which is used here because the
MCU does budgeting on it's own. Using vpwr-supply on each PI still buys that the
supply is enabled and ref-counted by PSE-PD core, and keeps potential for what
might come. But no requesting, allocation or deallocation of power.

Given that, I had a closer look at PD692x0 and it seems, this has a similar setup.
The difference here being just that there's no multi-manager concept. There is
also a manager-level supply reference "vmain-supply" which the driver reads
and applies to the hardware, which does budgeting also in hardware.

Based on that, I would just adjust the binding to more suitable name for the
supply. Implementing the power budget application to the MCU is fine for a
follow-up. All boards I've worked with so far already have a pre-set safe budget
in their default configuration, avoiding any potential issues or physical damage
due to overload.

> [1] https://github.com/openwrt/openwrt/pull/23222#issuecomment-5032841546
>
> Best,
> Sander

Best,
Jonas
