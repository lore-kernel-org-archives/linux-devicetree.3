Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795437912;
	b=YFIko9b9CC+FGHo3IlAc6Wa2zBL1iwjJyTxH6KdT6ab3vaiP0hWsezEcUju1oA9Q3aPF
	 lVQGtAEDdMz8mI3w4izoQ0OLZ4B9qDXnAJ4ji9Y62Rdu44Pqwz2FfHUBeTk3RjfQVPH+c
	 7oM3whjMdT9R7+Q7Fjh5yHNBOZpWIFW3fcMsWCsB1gjQTpBbrW3YRH/hnD0XDYID1dR9Z
	 pjnLa3CFb8yQ1WVRjEf/svjWaegqYBp+zoNAK3/P3gHXSvoFtOXXpEm92Z4GZRyKQ5vTJ
	 I27zApEQsJFvYAdUSSvQ2mR99y/Cw1tKVv7TayfJsiIEjlEBEapSX+KXNq5nxpHLUyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
	b=KrdiAeJl+wnY9ObnjkU8QVHw2HBWROSzyEckrMIMJAIVECaMWLPY3nlheK6kjTikvS51
	 kIL5lb+z1fPRk7O52fk32hb/AOW5MslwuA4v3/JTVU2H7YGCULp+Xqbw9gOqZAjelTiS9
	 D4eXbTLaasJXbyRfEyZ7Qz7w68LjH02n848YM+91ZHVrZnBs+MXtlfcncxFOSk0BEZZxE
	 RZU2to1Judb48cFmEo5FB6h8R3jVHdeI2ZCbnvc0yes4qeDDv6qNYEnnKMgenrAGkKQnc
	 6wrbGvWobRYgpeQkq31poKONwb69OTwPOA9eBchcf6ANMKRyXhhTkLsES49qaFlyrog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P/OWlvIw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858ED606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858ED606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P/OWlvIw
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c1f548f87so48407326d6.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795437911; cv=none;
        d=google.com; s=arc-20260327;
        b=k4MqJHqm2FsiTYkpxrztzulL2Hn9R0/YqJPjt+ArpvJrJ1ADY1tKfaHIYMsh32tG2N
         niF1hQiVv6VMsWNZztWBG5VCR1vNAJLWdM0jRDzwJ/d7WNIR4rG87LHKSQm888vloW6W
         QZjp6uHeqdG6JU/k7LARjBp0JyTWjNoqdj9hkHi51xEar2TtBZkK1xoqQhNff7EIDvd/
         ZT3Hun+QeRDDCacFRPwIoqfu6vRc76i09PADgXSsdT9XxwVxHqJb3am6CCbehiQ8S9x7
         RwXIQrJYRb9thFjYnNo6UKLeotBdShRD+SUVZAUQeOVotCP+MBzu1yuOzMl009IwJDBB
         /yUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
        fh=xjZpVCFKEjcfxIw6EgO4F4yCIOd6q/pc5mSsHP69uCo=;
        b=sWlTLLBjmyJxQt7lt9BItBBW+SU0VKTqCj5sU0oR2AoyO5tNEoctrXQypTwN8UC0C8
         C47lR+5MJNH/LKl4yFxOT9wDeSiY3sRXYDzdBwn+xNPImY/e0Caq+yyHUWLlaoodFpVB
         +7fBv3+1i9tgMrIlGsHcZXuAZadFC1bFqQIVlKY4aIxU5YsFWGLLupdunqExyAvW3Rxw
         hdcC7l6T4KhP7lWVgYKqQHDfzeZXLHPo+cSRc2oe69lGKdtJ1LEZa8RmE/TLlwtqpcMh
         Fjpg0LbKPuCT5FGF0PcV+QIfGKSoBq5NzaMOdoJQHb7Z2nyOMzS2k058AVgIyrNI9Xc2
         XsnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437911; x=1796042711; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
        b=P/OWlvIwki7NIRipOUdk6t/vKOD1Jxhz8y/qb7dnEE4ruyiUIcDfinAGJmeuHLcTH2
         KXr1mqY6thscQxlC++Cqye6tsCFsEvOtslxbfYPWiHHse0ucW0B1x1NOgMCRaaSfjcu3
         Y0HinV2jM/CbqpPuBWCXee2JcovPumtZka1KC6VQrsPJkdrLX1eNlzGdz5RypenKlSpq
         MXHS7Jg5OrHpj1NjuQnuRjKm0bgcrL7gRSEBwxX8Wo+fvwiLmq94aYzfNKwD4hPlEWlY
         ofDYSA71bl4O2iWnUS5BYTnQTodEtJxNWVF31XbgOd3hZWTHgwWLfBkKP1/OSeAE243x
         TCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437911; x=1796042711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
        b=2MZ8htWuhBfQPqSFq07adVagY+X0jv673xc5e3wQSU01/F5GZFlqb93bgX8eEkW9Hs
         FfUclWGuR9L+72E9zaAdb6r62GJmhl2mDaQ1KOSxo8WEdWgu2w3Ouh8RFAdejJ5GUTPn
         Onl1FJfNkAxGn1mCWX6wizpVfY3EVLMU9NZ9sDPyp6EmiPZp6o71NJC60Sxt1HielIEI
         Gx3A+Ov7b7DuJzHoEkTOils/QMBAA3K1CmuVpfgk0gtTVEGlWItJCl0ubXsKSMf5MyTT
         1a/1YjSj4hygiII3dux3VLC4q/4FhrdPdA9hMj4K84hmbehtmAy8B/T8N17+USZ5MBiY
         hEMw==
X-Forwarded-Encrypted: i=1; AL+hErHXU7vyuVdsmfQv5/ujAIRN2O3m0y813qwzjSsqw66xoE5tBVPlT1RkKkwAs1BwspQmxslFMrDej/nB@vger.kernel.org
X-Gm-Message-State: APuU4Z+rYxsnZPthNK1vRMWmIG2PoYEQ23f3lV3803/C8v23lCvQQpw3
	P76cEBNmwwSqvy413AOsUmtHbPzZsnztcCr9vO9qGodvvYrt49N/gUXZxNxjhuhqDBRBsksnx6p
	j65EzML5hwiQTngDG/kIEH1Foo6INKV4=
X-Gm-Gg: AZFdTZcjxTcVKsSXCXrLdAYJ7UqAhNpJdT0ZuVmmilriKpiEmGRNhmhNnkzUsOHX16N
	As1IY15jc2hVWn5HEMA4kdmLw5Y5BcEEQD9/z4LL7d03foXx2eRmRpCK9/J4iFLk0MR5nQK+uID
	jFKJsUcd1ovpGLHSdgBK3YR/a+KvJqS+oQAYVApf1LIADNhHmOBS6iQrSpUPxPcvh4LboXSHk2E
	EDyexUYXzT+3PeoQJOkBih9/ihsVCjxeibbQYR8W20Bh9hGV4cpx2i2S+5gj5CdMNevTppLVtRU
	5vmh3T0WpnXQHYd9L3LrybhMK2AaAokT1fPYGxuWJs2tI0bQeNZSluF1009RI8Aeyfii5jh9rlG
	Bp7z0AeY6NVxskNznB7SKMocuVlUTw3Fa85vZSYczAWHk2R7asxr6E16mfhltMHyA+C0jSVRtaw
	27f379mkyPaHyCPtWqdYNek/JI1w==
X-Received: by 2002:a05:6214:440d:b0:921:1ac1:34e2 with SMTP id
 6a1803df08f44-92134aee700mr213563336d6.24.1795437911221; Mon, 23 Nov 2026
 04:45:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117084748.2387647-1-jonas@jonasjelonek.de>
 <df35e0d4-9f1f-4882-bc6b-257add4e9fb1@lunn.ch> <6fecc631-e493-4e05-aa3c-61a8b0d2d1cc@jonasjelonek.de>
In-Reply-To: <6fecc631-e493-4e05-aa3c-61a8b0d2d1cc@jonasjelonek.de>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 23 Nov 2026 13:44:59 +0100
X-Gm-Features: Aa3M54oKzn5UdFFwG51i21B9Z58VromwpMQTF5kRSx2z_fy0ELZVeYW8tGG_qX0
Message-ID: <CA+_ehUy2UYqELMFhh7Gf0JZ2uwVHFg4kGFbz03DosfgQC5buJA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next 0/2] Add Realtek XSGMII interface mode
To: Jonas Jelonek <jonas@jonasjelonek.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 23 nov 2026 alle ore 13:36 Jonas Jelonek
<jonas@jonasjelonek.de> ha scritto:
>
> Hi Andrew,
>
> On 22.11.26 22:24, Andrew Lunn wrote:
> > On Tue, Nov 17, 2026 at 08:47:46AM +0000, Jonas Jelonek wrote:
> >> Hi,
> >>
> >> This RFC adds an explicit PHY interface mode for Realtek's proprietary
> >> XSGMII transport. It carries eight 10/100/1000 Mbps ports over one
> >> 10.3125 Gbaud SerDes lane. Each logical port remains limited to 1 Gbps;
> >> the aggregate serial rate is not a per-port Ethernet speed.
> > We should be careful with naming. We have already have QSGMII and
> > PSGMII, for Quad and Pent. X is too vague. So we should somehow
> > indicate 8, Oct.
>
> In principal I agree, the naming doesn't really fit the others. I just used
> Realtek's naming for now, they use XSGMII everywhere for this.
>
> > But...
> >
> >> Protocol identity and naming
> >> ----------------------------
> >>
> >> XSGMII is the name Realtek uses for this interface. Calling it simply
> >> "octal SGMII" would describe its capacity without identifying its
> >> protocol. Existing modes such as QSGMII and PSGMII already distinguish
> >> multiplexed MAC-PHY transports; the PSGMII introduction is an example of
> >> adding the generic mode definitions separately from a driver user [1].
> >>
> >> Cisco USGMII is a relevant comparison, but equivalent port capacity does
> >> not establish interoperability. Cisco defines Q-USGMII for four ports
> >> over 5.0 Gb/s and O-USGMII for eight ports over 10.0 Gb/s, using 8b/10b
> >> coding and a packet-control header [2]. Linux already represents the
> >> quad variant as "qusgmii", with its own control-word decoding [3].
> >>
> >> Realtek documents XSGMII and O-USGMII as separate RTL8218E interfaces:
> >> XSGMII runs at 10.3125 Gb/s and O-USGMII at 10.0 Gb/s, with different
> >> hardware strap selections [4]. The SDK also distinguishes them in
> >> phy_8218e_macIntfSerdesMode_get() and applies separate initialization
> >> tables. Realtek's O-USGMII is therefore the candidate for comparison
> >> with Cisco's octal USGMII; it is not evidence that XSGMII can be renamed
> >> to USGMII. Compatibility of those O-USGMII implementations would need
> >> separate confirmation.
> >>
> >> This proposal retains the vendor's XSGMII name rather than assigning an
> >> existing protocol name to a distinct hardware configuration. It does
> >> not assume a particular XSGMII line encoding merely from the line rate.
> > https://deepwiki.com/lotusmomo/airoha_sdk/3.1-sgmiixsgmii-drivers-and-apis
> >
> > Airoha also seems to have an XSGMII. Is it the same, or different?
>
> Looking at the referenced code it seems to me that this is rather used
> like 'xSGMII' - an umbrella term for SGMII, HSGMII and USXGMII in the
> SDK code. Probably the deepwiki side summarized that incorrectly.
>
> Overall I found no other usage or naming of a real XSGMII mode apart
> from Realtek switch SoCs and PHYs. Those PHYs (mostly RTL8218D
> and RTL8218E) apparently are exclusively used with Realtek switches.
> The RTL8218E might be used elsewhere too but in contrast, it explicitly
> also support O-USGMII as a separate interface next to XSGMII.
>
> > Adding Christian.
> >
> > I hope we are not going to have vendors introducing there own
> > variants, and we need
> >
> > PHY_INTERFACE_MODE_REALTEK_OSGMII & PHY_INTERFACE_MODE_AIROHA_OSGMII,
> > etc.
>
> Doing some more research on this, as already mentioned in the patch,
> there is O-USGMII: described by Cisco, being compatible to SGMII and
> QSGMII, using 8b/10b coding, 10Gbaud rate. Though, this should be
> totally separate from the proposed mode because it uses 10Gbaud
> instead of 10.3125Gbaud like XSGMII does.
>
> Apart from that I occasionally saw some vague information about an
> extension to USXGMII, allowing 8 ports and reusing the USXGMII spec
> control word and format.
>
> There is no detailed documentation about XSGMII, so assuming it uses
> any standardized frame format would be risky and very likely doesn't
> apply. The naming of the mode - given it'll be accepted somehow -
> should reflect that and not conflict with variants like 10G-QXGMII.
>

Hi Jonas and Andrew,

yes I agree with Jonas here... It seems to me any vendor after the 2.5g
""apocalypse"" (2500base-x vs HSGMII) just decided to use random
naming as xSGMII with anything that transports 10g traffic.

Also from what I can see in the datasheet, they don't really declare
a specific standard they follow aside from saying that the xSGMII port
can be paired with USXGMII and 10g base-t (following the fiber spec)

Honestly speaking from what I notice, xSGMII is more the 10.3125 fiber
spec than the ethernet one...

When configuring the the PCS with all the register, clocks and rate
they all gets set to 10.3125.

Maybe someone from marvell can also join the discussion searching
for pattern?
