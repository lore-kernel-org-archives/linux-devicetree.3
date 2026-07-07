Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21C2E738F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 20:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783457427; cv=none; b=LlqSeBB3ZCjZLwap2qvb9RXSFJeuxGnQay4uYp9DakBKxVp6HusdbIvmg9R0Uy5noLbn3XVP2lEiqVLJXVPrxohuS2JgGiXQE8IzjUCWo1MN8HbxQ5KkYFU4N3lNcdhi6COYDA1Kq0izoRRVHsUqLA5G1d7LLHUwy7vDAftZrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783457427; c=relaxed/simple;
	bh=2+FrNKiZHlaOosauZT36r8EtxQenC5613cF0lHnS6Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i639ofT7h+YNXToIp1pX/hoVz+K+WnR7YRv+VbKIOcSApPoUhRzCa7Pui3PZVd/E+IIs9c4JbvyOV829/96NmcVd+xMJMuleGgZQa5jDkQGXbnd3RLX4s/GWSkewEJjhBBZbCVEmle0/2SQLaXDUZD0Fk3KUs1i/1CU8XMyOo3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgKt6zAq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgKt6zAq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so30737905e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783457424; x=1784062224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zP44B3mdldx6dm5k0ofo9c87bKSYGg9SPFsLdDVShqc=;
        b=VgKt6zAqcUYAyicH9PR5iPXmJun63qdGpqLdReSf4ha0jyjz6vT6wxq9B2if4jD0i3
         uc5jEzBeZ7Qa9FIz7n9xa04H3uMpXCrIlmAObivTMyD9vnLQWvV/AZMf+cK5OS5fX9Uo
         KEc6IiNiEbPz+ep8HC3exKwoajgjZJ8HAgZNhUUMgVZfKm0eCzoLFAtLu/beU/0kV8YR
         vvD6fMy0r7sT/p+Bzr+s+D9A+WdqEvrKCEQt4TUYKqLuJiK2ZWysoKI+oaRG+0YV3Gno
         5W60MYUzM6+n6s0ckB+7LgYp8jjUWibCmZ+srHq4PXhVnAejKuvlaXoVuP8orWrzKeBf
         RiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783457424; x=1784062224;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zP44B3mdldx6dm5k0ofo9c87bKSYGg9SPFsLdDVShqc=;
        b=Sjles4CH6IucTjMet/4RI1HdgnGspWzHeUH2dGTLHVpty5BW0+QIX2yMEoOkqQ41Vo
         7UQLH4go1b0azRTYTIcM3niBy/SWkpSZQP0KlhQ2VYApGnPFVuIoCXaJNjYSqG+nu+5A
         5cXTE9QgdhCHd/ANd1tU5PSDnnHy+dvw+cVEwIGOJrmgFSdi4hpZOmUc61YhRQL3MmpQ
         HIJuOT2BCXHWRutCn0eTxiWJBR5h7TcmfDMCV6DdD306rxHB2Zt9xcCKDQCC2FR6ibrW
         0exkTZjE5dSkbB69CtOYTJxUT/+5uumKI2gQGzcN1W7Iy8FesO1xZhng/zR/mDkjaPmM
         /oqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYoX+wRXQ6+cEblMEu4NsiSYuupWJwNFYnaGd4yrKsisG4/wm2S/tRrDkzhq6JDikFWAhGJsOC0X61@vger.kernel.org
X-Gm-Message-State: AOJu0YzLG29xPdHK3Nys/rQku7E3IQRV5iFoE4nuyEJur839hboAL3zl
	83XkflCZuOHgv5xVtXpIaqkpmadGDwFzJoHx6cAK+89FOkZ9f4QE9/tP
X-Gm-Gg: AfdE7cmo8jgeGX8vqHZ9jeK7mlMmlM/QmZCP/d3UZXJYB7oJ4Kl1ProLsdnMnK49HXF
	GIQEgSTLzLGPBJUUZfKEIh3B+4KTGYbZyuuEnQl1Wwquqgck/mBuHKnSrwywfkpFpK9s1TzpVcI
	bWWMyWW4uTPZE/dKMicUP/Bw7ZerdriuE7itwqcQkeMhqb4PMGShrTBvo5z1AE9if49nnLx1+2P
	AB6K8nOQGSYgH4LrbIFVfn5MsRfPVskjF3v/AWi5c9zZOOO77Ts8Mus+GcDNle9W3qLS3cDV/Wj
	OqEy33wurzY82HCxnVhvYsjl40hvUpztSYO8rX08TT8TpJugHFBoNUnVbTRqZNsSYj63GMwjQ6I
	YxMuQ9GU3RXQ3yYCW0sF675beTtdSAvjXVKTKrr33p5SejWbjYuwoA10DILZxoA3bxkdWrPiXXS
	flDOGvXPkaAlc9ej0EafU+8ivTZWatqqSa9oJLtLZoHTtwkv2ztizF0iOvW0P5ieEsPX+FtDJnp
	7Q246vLCqkd6vc=
X-Received: by 2002:a05:600c:1908:b0:492:5855:1548 with SMTP id 5b1f17b1804b1-493df095562mr76302525e9.27.1783457423164;
        Tue, 07 Jul 2026 13:50:23 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f102:9901:f85d:9fdd:690a:6e0f? ([2001:9e8:f102:9901:f85d:9fdd:690a:6e0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm89127555e9.15.2026.07.07.13.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 13:50:22 -0700 (PDT)
Message-ID: <2afc9c9a-eacc-46ca-b965-4cabee8f7094@gmail.com>
Date: Tue, 7 Jul 2026 22:50:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/4] dt-bindings: net: pse-pd: add bindings
 for Realtek/Broadcom PSE MCU
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>
References: <20260706112425.3149226-1-jelonek.jonas@gmail.com>
 <20260706112425.3149226-2-jelonek.jonas@gmail.com>
 <20260706-player-handwash-0a3fe95cf5ec@spud>
 <c19e563a-8931-4f31-b05a-ff8def4a5161@gmail.com>
 <20260707-dove-fretful-e3c8e237f1eb@spud>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260707-dove-fretful-e3c8e237f1eb@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Conor,

On 07.07.26 19:25, Conor Dooley wrote:
> On Mon, Jul 06, 2026 at 10:30:00PM +0200, Jonas Jelonek wrote:
>> [...]
>> The protocol and firmware on the MCU, most likely the whole "solution",
>> is from Realtek. The setup is always the same on most Realtek-based
>> switches (saying most because a few counterexamples use completely
>> different setups, not even Broadcom or Realtek PSE silicon). The host
>> interface is always the same (except for I2C vs. SMBus vs. UART, which
>> is likely just a config in the MCU firmware). Therefore "realtek," is the
>> right prefix for all of these.
>>
>> Broadcom is not really involved here except for their PSE silicon being
>> used. Maybe Realtek modeled their MCU host protocol after the one that
>> Broadcom PSE silicon uses as host interface, but this is rather guessing.
>>
>> Maybe a historical view might help. Older RTL83xx-based switches with
>> PoE shipped with this setup using Broadcom PSE silicon. From what I know,
>> at this point Realtek didn't design their own PSE silicon. They used the
>> Broadcom silicon, put a MCU as a manager in front of it with their firmware
>> and a host protocol based on what Broadcom PSE itself uses. At some
>> point Realtek started to design their own PSE silicon which then was
>> used in newer switches instead of Broadcom PSE.
> Right, in that case it does make sense to use a realtek prefix, since
> the software and mcu solution is all theirs.
>
>> [...]
>> Only one at a time is used, but not combined in any way. All switches
>> I've seen so far always have a single management MCU for PoE, not
>> multiple. Thus, only a single variant is used. Which variant is used
>> likely depends on the board vendor which then tells Realtek "I want your
>> PoE solution, I can attach it via (I2C/SMBus/UART)". At least for UART vs.
>> I2C/SMBus there are sometimes valid reasons to use UART over the other.
>>
>> There is only a single switch (from Linksys) where the MCU expects raw
>> I2C messages. SMBus transaction fail actually. But I don't see the reason
>> why Linksys did it that way. The reason can't be that the MCU is attached
>> on a bit-banged I2C because another switch uses SMBus transaction on
>> a bit-banged I2C.
> Reading this, it feels like you "should" have compatibles that uniquely
> identify the protocol used. 

Ok, I hope I put this together correctly. A concrete proposal:

"realtek,pse-mcu-gen1"                        (Protocol Gen 1, UART)
"realtek,pse-mcu-gen1-smbus"            (Protocol Gen 1, SMBus)
"realtek,pse-mcu-gen2"                        (Protocol Gen 2, UART)
"realtek,pse-mcu-gen2-i2c"                  (Protocol Gen 2, raw I2C)
"realtek,pse-mcu-gen2-smbus"            (Protocol Gen 2, SMBus)

This uniquely identifies the protocol used: first generation and second
generation. As Rob mentioned before [1], this also pulls in the raw I2C
vs. SMBus framing in contrast to having it in a property. The framing
suffix appears only on I2C attachments because it doesn't apply to
UART transport, and this is given by the parent serial@ node.

Though I'm still open for suggestions regarding the protocol
identification if "-gen1"/"-gen2" is not acceptable.

> Looking at the devices below, it seems like it
> would be possible to use compatibles based on the switches themselves, e.g.
> zyxel,xs1930-pse etc. If there are other devices that use the same
> protocol, they could fall back to the ones below.
>
> It'd be good to have the net developers weigh in though, as to whether
> using compatibles based on the switches is suitable.

I'd lean against, but happy to defer to you and the net maintainers. The
node describes the MCU with its Realtek firmware — the firmware/protocol
defines the device. Everything that differs between instances on the
controller level would be captured by the compatibles proposed above, so
a board compatible would encode nothing there the gen+framing string
doesn't.

Observed variation lives on another level. For instance, some boards have
heterogeneous per-port caps (e.g. 16 ports at 60W, 8 ports at 30W). This
is clearly something that should be expressed per-pse-pi, not in a
switch-specific compatible.

It would also be an exception to the other PSE-PD bindings. They describe
controllers used across many switches too, yet none encode the
switch/enclosure. Board-specific compatibles might still be added later in
case a device really has a variation or quirk that genuinely needs its own
compatible.

> [...]

Best regards,
Jonas


[1] https://lore.kernel.org/netdev/20260615212959.GA1679454-robh@kernel.org/
