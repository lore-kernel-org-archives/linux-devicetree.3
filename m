Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422653C3BE
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664759; cv=none; b=pB9S/59ZQj/7RB3rdPMa1EYuj/ul+GEgKvWrfO1B34tIlbQ9avU5pb152TZusNR5RP06aRYd4DG3NL8RNmlw3s/Y1vony76yoQcc3iMlr1LlwKB4VThAXZeVB9vv/TWJ2tjQZYWH5oj9neo0zvF12rXofd0wbe314ES14eIvUME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664759; c=relaxed/simple;
	bh=RoY3EB5k0t9YlxK6r86vJXHGTsBlXmMy09ib9fpZf8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=buVFtI305vGtg+LgT8KQYg38b1sU/YtAbv6STFL9hcb26b6urGToPV34EJmgUaIy9bFtkIZuux6uN6uAv+FLvxIVqt/OpJRAOK5uq7mV2VoHJLLUP2S1En5tEMIPFAnZ0ZKeZuw2ROKtJfCzWWpWQMxXzEj6cFyMsOH8/7Seu3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIpeir7G; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIpeir7G"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so183896566b.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664756; x=1790269556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nT/QhDBYyAoNvkb2DNjew9sHsXIHdx5twpGKwbTIO+4=;
        b=eIpeir7GMm5JARi/Ic/exd4EalL80vvx8iByFTJ0bHqNI0+zlQZQWiPOd8wB3p3SsH
         8pqM6F6kj/BmpRKbR6v1+0/eFI2yZxYwC/sj4OZJXfcNT8o0dbh6TPgHsE0awXBAKOcn
         LU4Rb0bcbD5S7oOCJzLc5JEdNwOU8rkK5yKifgCGDtg0wjI/YGP32t86lzQH9Zv6akM+
         Y3tZGNp45vPGb/D5xx1JRIvGpDwkOt6us3H67MhJ161RFRLLijvdJhgdQhbpcjviVz85
         CrWJsGm0t+xGgLEQH+/K0qpjCAPoGB8fDTyytQph5iBB5zOqsu6oZEtautGct3UMimY3
         85DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664756; x=1790269556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nT/QhDBYyAoNvkb2DNjew9sHsXIHdx5twpGKwbTIO+4=;
        b=WMkjZSM/emGvJzWpzUs8OJSm/M9x+qHNuSeODw5ioEiO38sRitjJ7sIQ78wU+QVwnp
         eWMonbfkF1ViB6GrrUxAg2ig/qWLfCiFux9s56VRA6q5LT0sfujWruSZfFWUkbIh6jo4
         CBZv2hQq0imFcOfZsEb/kOTCrb4qG38vfRjlExP8s7ZUVLW2NKokSZJ65nOjJ4pPrSB6
         SZuKMAXWNv8teTLSNfUmi41tHF6Ktt0UDZzzy2pZJypZX/rlo5Q5I4EEZXceqOAxzm+H
         Dwoj1KsdjTwUepgJ17pzW5Fxrqd1MwZAeN0qlIOjAOk+Ds3tlr32mwjW3khnVmUZ4acL
         IT/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRjYooHhMvMN0M56jTSBDu2heYu/d99xnVU3vrQ+yzq2xIfLJi9V6lunKv4v5gAXve38xm/ML8/ngS@vger.kernel.org
X-Gm-Message-State: AFuF++mOEYZCgwMqBC184yeAwim8BRrzOnvs+Aw9ZMcJaw39D9J8dzGe
	ZxSACsZFCAYkoXL76UaZjoGDKn/MQ3O5XKJc4EOplBLYf7tONcXT3o7l
X-Gm-Gg: AYBFou1aC2wTNeI+UylCyHWYypuBXyh/dRVhfLp+gEUM+PrBsM2Hs4ck+in4d8Pokle
	ncbfm4ExBDTXYInctUPQqZPbiKSFXG/Z/el4YBFxIOtUfaePICiBDUztXTFW4gedEdUbkb6B5Pz
	V0fZkXNzv2/GmkwRQXVGSAtxmnzQHObm+Bh501SFY3ZNqWON2niXaczqFDXg8MRbT0ojpFGPGoY
	voZMDQNkp1axn4kNFYw2jdaEcIbYuP4MgZgWfXHQx7ARSAcfc9wOfuvKNkd5vEtkum6/v/s4PqG
	8UprxywPiqNpBqUWL7Hyd2u8KQghwlOU2fqkPwv9o6/Jd7p1Pnup1AYvLXZWrQJ/4Rx/bDpArZE
	b5/+chhhlF4EeHO4/5Kek+k+5RYc33RIgMYuTu/QV2td7St3b9BW6chN17virCwkrPCPofJdXu+
	ZeuNDumc5vueVC8S4KON2t8aiB9h/5bb+vyjULjXaIAAXBJSJLIQlbaGgHFdteq10EIjXHeMROH
	FCztkcV1lDrxHVM
X-Received: by 2002:a17:906:7944:b0:c29:4d53:787f with SMTP id a640c23a62f3a-c29e532ccedmr581845366b.41.1789664755628;
        Thu, 17 Sep 2026 10:05:55 -0700 (PDT)
Received: from [10.43.58.190] ([185.94.190.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4893aasm312844766b.30.2026.09.17.10.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:05:53 -0700 (PDT)
Message-ID: <39fdddbf-0fdb-40e7-9cd5-c8f857ee8b9d@gmail.com>
Date: Thu, 17 Sep 2026 19:05:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] clk: Add gpio-locked fixed clock driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
 <1j33vaesh7.fsf@starbuckisacylon.baylibre.com>
 <e697d892-fbd2-432a-b71c-8547ead22ea0@gmail.com>
 <1jtsnpcn8l.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <1jtsnpcn8l.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.09.2026 15:57, Jerome Brunet wrote:

>>>> +/* We can't enable the clock, but the Common Clock Framework calls only
>>>> + * enable() not is_enabled()
>>>> + */
>>>> +static int gpio_locked_clk_enable(struct clk_hw *hw)
>>>> +{
>>>> +	return gpio_locked_clk_is_enabled(hw);
>>>> +}
> 
> You need to explain your problem a bit more because this is not OK. Your
> clock should really just provide .is_enabled() AFAICT

When a peripheral driver uses devm_clk_get_enabled(), this is resolved 
to clk_prepare() and clk_enable(). Neither of them check for 
.is_enabled(). Is that a flaw in the CCF or expected behavior?


>>>> +
>>>> +/* We have to implement it, but we are not going to control
>>>> + * parent clock selection
>>>> + */
>>>> +static u8 gpio_locked_clk_get_parent(struct clk_hw *hw)
>>>> +{
>>>> +	return 0;
>>>> +}
> 
> Same, I dont get why you need that. Not needed if there a single parent

This is a remnant from v4, thanks for spotting it.

Slava
