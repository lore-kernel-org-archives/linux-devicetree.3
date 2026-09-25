Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF7A4A2051
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342147; cv=none; b=qAzVFIvUKCStZr7m7EjSp/gbFXHye6lOuaFGPQcBALw0UDxLIuMkz8AXa5UHtvKSlMj+L1qvbS6rFu4u1aMr8qMnJ0tDhMBKuHf4IjW6JvWRjEuBBdbvr5H2jRpdG6TgdROSM6+CPuU4yi+cmWUHy9rND7HCM4VOcyR9cWTZUV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342147; c=relaxed/simple;
	bh=IWP0yysy+y9CebMkqYVJptEONcyqLAP7y6/myAOohqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvyBXF2SzBTit60oUqM51WnICqhyFzWOTl4SR3vmfhx1HzZN2bKBN5nNWBvFb9OgwGxfDP9sz3UOWzxrHPdyKKIQGmWyfFcF6t9MPB4s+9V/lgvijpJejMXea0E6GGcO6Kf5RzvdAOGMAmRLAJrNIWFu8x3kb8KfHqLJbqQ0DxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnTsN+WW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnTsN+WW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so478949f8f.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790342138; x=1790946938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLYsvlss9yZfm3Rai6co/hO6k5fqoif67TyIhe9Xe90=;
        b=DnTsN+WWwUBKNHapKFmkRVkw0oy1AmE1T2fxaZ6ZcP3bpOcUzN781c/9Exfr6dvgr6
         f2iQB2cs3TVWFydhXtAWz7w9wrBxfJO32285TdKjazbK9k3n9H8jn8gOXL8KHckBzJn8
         bijWHB74SfQccCXvuJafpnzNAvQ1OCuuFgI4LViUB8bERGRc1bKanJBStJFMGtHs/+uz
         YaxJ7er4RTE88+fLbBq9atm8t/BsQ3Y5mw5QR7vT7WQmDK0ssEMiAlDQ8bL1iqNIAMBY
         ULF4lXJwGhnWoNw1Y5GjQGWJhfuSFA0RLnTXzjEbKa9TCL4i0NG75nL6gFTv/2hJ47HL
         mitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342138; x=1790946938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLYsvlss9yZfm3Rai6co/hO6k5fqoif67TyIhe9Xe90=;
        b=H6APOqTima1Uu691QP62M9p50SBfBYP4Vyz/SoXgg1l7RJ77x9I/omKK3jK7ma9CTF
         SxfxDlIrJZGbU+pzTQU8w6l0H4gl/VXWnOk7C2shftsY313u9C2UY4roNWD7EycBT5Vo
         UAFcDMsRaoL3fh+RDFnJb4bYAMrJ8AeFpA8d3aGJ7oH1IjKrVqNRl87tLKDWFd7Ch+x8
         XrU/OTA0hNa/dFqJlY7FU84QrVL2RImnKY2ZQPSpQ7gsJAeo336W3SkHOom1zeU9fGzv
         W9oCxylyojAiJCU3mV4rCRenfZgi6a/6H99xUKGZKalmXIKVE5DBxtqYDzkTem8dcRdh
         cQUw==
X-Forwarded-Encrypted: i=1; AKwUvBxtGIh966bOetsos6S2cvzkSccSo3a24ca+UyGcp4HefWvu2nbbNwvaLnhHL098mRZIxf0o03K5KswQ@vger.kernel.org
X-Gm-Message-State: AFuF++mPH3v5xC5upH8XHFmpHOqn3vQFXedFtUZCLIcZNbtdIhdubpJP
	U4prUaMgFa8XkaofViUXGrgxgvMgkW4ttDhhpJrFDeyV9OQBl1OjHKiU
X-Gm-Gg: AYBFou25cHzjTp6jJd7UhP9qVBwl9NPMkumOGS23oUWPGjeRkiNYBNEnhsgSF8n0yaJ
	5Bem3LK7b4VXre8MFnYOTiJQH+IJ/YqWJolSquUaz3RZdhluCjdVcuZsBFkUXHyI/h/5CSLAvwc
	m/q5Mg3taZ6ExLWjHXA1dayyWimM6XdR1FGWBn4tnV6Z3m/fbLlltmRvXYSq74NB41DpQXsWiZh
	WHBN3KF7RaB6lBF6aSVyWejbikqgDHkL/K7R6pykvPgpOaOkbXCTAq9/sfnRQMk2vNhXYgVEX0K
	Hsue3tXCd/GjjveRvL/SEVdDhiB2FT+4Nak4K1sdtFKtyWY7vT8cTyWdfUydAGgj53tZ7JP9p8d
	r7yOdTDSgS0OQ3GcgkAvfg6qnVzE2mVRDv5p9L4yQ2pQo5GUlmrnWkz3xIyGcyLWN5+cFNM5+y8
	KWwowvxiq/KANHbpNHjzuFCr9/k9u8NXVxXnKkrGRt/X1TwyC1ZFCK12OMJ65X+V1UKga+DgD7z
	zIQ5UPlBDiq4g==
X-Received: by 2002:a05:6000:430c:b0:487:1c89:f158 with SMTP id ffacd0b85a97d-48871671a05mr9519994f8f.14.1790342138218;
        Fri, 25 Sep 2026 06:15:38 -0700 (PDT)
Received: from [10.50.156.4] ([23.90.153.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm7832929f8f.29.2026.09.25.06.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 06:15:37 -0700 (PDT)
Message-ID: <a5e76452-1fa1-4675-9a16-8683702ff4d0@gmail.com>
Date: Fri, 25 Sep 2026 15:15:34 +0200
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
 <39fdddbf-0fdb-40e7-9cd5-c8f857ee8b9d@gmail.com>
 <1j8q4p8rxl.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <1j8q4p8rxl.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.09.2026 13:57, Jerome Brunet wrote:
> On jeu. 17 sept. 2026 at 19:05, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
> 
>> On 16.09.2026 15:57, Jerome Brunet wrote:
>>
>>>>>> +/* We can't enable the clock, but the Common Clock Framework calls only
>>>>>> + * enable() not is_enabled()
>>>>>> + */
>>>>>> +static int gpio_locked_clk_enable(struct clk_hw *hw)
>>>>>> +{
>>>>>> +	return gpio_locked_clk_is_enabled(hw);
>>>>>> +}
>>>
>>> You need to explain your problem a bit more because this is not OK. Your
>>> clock should really just provide .is_enabled() AFAICT
>>
>> When a peripheral driver uses devm_clk_get_enabled(), this is resolved
>> to clk_prepare() and clk_enable(). Neither of them check for
>> .is_enabled(). Is that a flaw in the CCF or expected behavior?
>>
> 
> .enable() does return an error on failure. It is up to the provider to
> return one or not. In your case, it will be probably be necessary to on
> the gpio a little.

I'm not sure I understand what you meant.
> Note that if the GPIO can sleep, interacting with the gpio must happen
> in prepare (think i2c gpio devices)

In other words, I should only provide prepare/unprepare instead? Do you 
think is_enabled can also be replaced by is_prepared in this case?

Slava
