Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8435F3E2AAF
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369805; cv=none; b=R5rW6DFp1i6UTEIHOq7VY+v5/zec1chFkImNIim/1wjXlB1hCr8YQ7KbGRv5EHN47EgpXhFpbBcy6yOzwlQRXHM2v/BNcx0GCPtmmop2EMOildsejcFNeiEDwgWbGQNqIChETV2KZsx8NtQ3RNCYXALuq8I02r0TcZ45S+AnLmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369805; c=relaxed/simple;
	bh=cuuGRQ9ikVr5K2JDWNiMw8FokA6lvFe5ZtfeL7kRoKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foPh8rjDOU5wZaI6MUMW1nJRprHLslHwDexQy+LxM6wbxPNBqOvKzP56zfYiiiM+1bsH6miLBb80ZiUitNJx9n404PvwhwrW7FKrJQPkU/M3zkxE9Dpa9cnBIVbpyqobzAA+w1UPry22jlg37tyHulQPvSK7TMtrNjvJn9xoY64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJGIyTzP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJGIyTzP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b7612475so32295595e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783369802; x=1783974602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6q/pZi6Akagjc5HROiArP01SOpU9gOVMCKwxAzqUAfM=;
        b=eJGIyTzP+kAhRwtL2dHxTzMmBiNXlTHECGSUZmGjTm280+XxFxOA9JykXQ4o8xQs1L
         TEGrgs5HBCCdEv1yRBF0RarZH8fsYGCtuozKKNDRRkvpkBsssbChORPHOpDnDFBr3wit
         PMTKLTDkJwV8gFPjN7rBTiqCHHJuR7wWPi65tkD5VkussP6NjBGpuzOUhn6ws9XgCOP1
         ceCT/WT0yRZAQxxuP1hdSTgriFQWfqqd8ISR5AAmw6tv6pVFIGzE0LjafrRdgM/2vSVo
         5PL5rRW0pZHLT1A1iARx19k5IAjfuKWGczByQPYGT6QBTIvvPSYFY96Oenm1e3owWLX5
         HAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783369802; x=1783974602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6q/pZi6Akagjc5HROiArP01SOpU9gOVMCKwxAzqUAfM=;
        b=TJiCes+y+m+QidcytRcmTuYN74chUsY6JFvm/G8UZ9VHwtvE39ZlqNFm1GatUwJjXZ
         1QVP3lHQ+AVA29iAys3MrhmBqlDR1bGigTt2y+QNgsSizUUQJ5RahpTQ+N1JncoFMW+O
         uQHYapQS+0je/Sj+vRmma64dc9GwvURqg/9apcFL6oatWKMC4+MEz3dFpElHA1S1jXZH
         dHaXPgV1LSLBo8+ksDRcVPkSCO4DXPaWs6arP3CBH/F8CSZKk1o9iXKpJwHLyQsO/f3X
         PtU5M6iwO9FY0rAfgALvIMBJwD+FOMaBcXZPKLiDEDNtdtRUC9lnwYpLJg7v4cGKLgAN
         GvIA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3xjbzAPyulRQI6wESJ8vILvJptw4Kv1BKzotKSA/zDaTo6RvoGVPwXLCBVLMZIipLpzCY3fGmhrT0@vger.kernel.org
X-Gm-Message-State: AOJu0YysGfFSpypqViK5XSPfjFj1/IirbizZ7GuIGwEMECRMM1GU8iZ0
	zzQEQoPVpI8sU1XZGDAgThRkX4yh1vAx7TX9HOjRKVg2tfo18ew/fluT
X-Gm-Gg: AfdE7ckbALTtNe2d+C8drxL5TDokgC6plQtz7fWGa15fDd3pj2iDpJquv/mWxcbS6rX
	8jaO32RM2qlknUPzwFe/+/cjLzizyV5JFEq4iA6gR2jYFLDHzKzn7tGeNRHQPbocZK+DoZ23Pr3
	Xlo7+QCxLW2YYfMO+aHm/lLfQCqCH38Q+n24HaIKbgSIWT0jTZCmgqW1liv9c605yVefIOr5E+U
	hB4tNdtCQVCJ1OOUjL+pIexa02mcZzseCt/cW0NG6t8+Ma8HYBJvi+cEHX2ieec6o2I83F8aIUe
	tzvA0eBxEbO/ZiVTB9a0eybTa378c3FyliRR6bMhvKHOPk4GPKxUn2qwB5iW7nJvOFVAr0qVvLe
	bABlvuRRvLsp3c6hvMrFrczxUrYB6k4Ghp76EzLOfPeZLsoUjeBsx1OXDjkfEGrNoRhDbAWvkH+
	6q9mz+Dy1BIpEqc+IgzLFoCPfIgVMAEijoTKuj6vN7SWLq5GKX/J/jMA0sCF3qEKI8hwf88pXs2
	i4rCP2/9e1sJQE=
X-Received: by 2002:a7b:c5cb:0:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-493df09c294mr16563235e9.36.1783369801698;
        Mon, 06 Jul 2026 13:30:01 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f13c:d501:a53d:1108:c6d3:af16? ([2001:9e8:f13c:d501:a53d:1108:c6d3:af16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm27931062f8f.5.2026.07.06.13.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 13:30:01 -0700 (PDT)
Message-ID: <c19e563a-8931-4f31-b05a-ff8def4a5161@gmail.com>
Date: Mon, 6 Jul 2026 22:30:00 +0200
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
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260706-player-handwash-0a3fe95cf5ec@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Conor,

On 06.07.26 19:35, Conor Dooley wrote:
> On Mon, Jul 06, 2026 at 11:24:21AM +0000, Jonas Jelonek wrote:
>> [...]
>> +
>> +description: |
>> +  Microcontroller (MCU) that fronts the PSE hardware on switches using
>> +  Realtek (RTL8238B, RTL8239, RTL8239C) or Broadcom (BCM59111, BCM59121)
>> +  PSE chips. The MCU exposes a small message-based protocol over either
>> +  I2C/SMBus or UART; the actual PSE silicon is not accessed directly. The
>> +  Realtek and Broadcom variants share this device tree contract but use
>> +  different protocol opcodes, selected by the compatible.
>> +
>> +  The compatible identifies the PSE-MCU protocol dialect, not a specific
>> +  part. The device here is the MCU: it presents a stable message protocol
>> +  documented by Realtek, with the PSE silicon behind it - Broadcom on
>> +  older boards, Realtek on newer - detected at runtime and not described
>> +  here. The MCU's own silicon is general-purpose and varies across
>> +  boards, so the 'realtek' vendor prefix names the protocol front-end
>> +  (following the google,cros-ec pattern); the '-rtk'/'-brcm' suffix
>> +  selects the Realtek or Broadcom dialect.
>> +
>> +  A single compatible per dialect covers both the I2C/SMBus and UART
>> +  attachments: the wire protocol is identical across them and the
>> +  transport is already expressed by the node's parent bus, so it is not
>> +  encoded in the compatible. Transport-specific properties differ
>> +  accordingly - the I2C attachment carries 'reg' (and, for Realtek,
>> +  'realtek,i2c-protocol'), while the UART attachment carries the serial
>> +  peripheral properties such as 'current-speed'.
> I'm not really convinced by the arguments here.
>
> If the switch vendors are running different software on their MCUs to
> the point that they behave differently, then yes it makes sense to have
> different compatibles.
>
> The first thing I don't understand is why realtek is considered the
> main vendor here? Is it their MCU that broadcom are re-using with some
> protocol tweaks?

The protocol and firmware on the MCU, most likely the whole "solution",
is from Realtek. The setup is always the same on most Realtek-based
switches (saying most because a few counterexamples use completely
different setups, not even Broadcom or Realtek PSE silicon). The host
interface is always the same (except for I2C vs. SMBus vs. UART, which
is likely just a config in the MCU firmware). Therefore "realtek," is the
right prefix for all of these.

Broadcom is not really involved here except for their PSE silicon being
used. Maybe Realtek modeled their MCU host protocol after the one that
Broadcom PSE silicon uses as host interface, but this is rather guessing.

Maybe a historical view might help. Older RTL83xx-based switches with
PoE shipped with this setup using Broadcom PSE silicon. From what I know,
at this point Realtek didn't design their own PSE silicon. They used the
Broadcom silicon, put a MCU as a manager in front of it with their firmware
and a host protocol based on what Broadcom PSE itself uses. At some
point Realtek started to design their own PSE silicon which then was
used in newer switches instead of Broadcom PSE.

> If it is, then having the vendor as a suffix like wheel reinvention to
> me, and if the MCU and/or protocol aren't something that broadcom
> borrowed from realtek then having a realtek vendor prefix is strange
> altogether. The mention of old boards being broadcom while the protocol
> is documented by realtek is confusing me.
>
> Either way, encoding the vendor without using the vendor prefix seems
> very odd me to.

I'm open for suggestions here. This has been the hardest issue in this
whole series, to be honest. It basically boils down to differentiating
these two protocol generations. I cannot say why Realtek did that on
the transition to their own PSE silicon but vendors doing weird stuff
shouldn't be surprising and this is the reality now.

Is something like "-gen1" and "-gen2" better, with a clear description
somewhere in the bindings how that maps to actual device setups
(gen1 = older/MCU fronts Broadcom PSE, gen2 = newer/MCU fronts
Realtek PSE)? This would drop Broadcom and the confusion around it
here. I admit, using a vendor suffix isn't great and still attributes
Broadcom too much in this context here.

> Secondly, the compatibles you do provide seem too generic. Is it really
> possible for a given board to use smbus AND i2c, or do specific boards
> only ever use i2c OR smbus (or uart for that matter).
> I find it more believable that a board would support i2c and uart than
> supporting both i2c and smbus fwiw.

Only one at a time is used, but not combined in any way. All switches
I've seen so far always have a single management MCU for PoE, not
multiple. Thus, only a single variant is used. Which variant is used
likely depends on the board vendor which then tells Realtek "I want your
PoE solution, I can attach it via (I2C/SMBus/UART)". At least for UART vs.
I2C/SMBus there are sometimes valid reasons to use UART over the other.

There is only a single switch (from Linksys) where the MCU expects raw
I2C messages. SMBus transaction fail actually. But I don't see the reason
why Linksys did it that way. The reason can't be that the MCU is attached
on a bit-banged I2C because another switch uses SMBus transaction on
a bit-banged I2C.

> Can you provide a link to the actual devices somewhere? It is
> completely non-obvious to me what the binding actually represents.

I hope I get your request correctly. Find some links to devices and/or
to my commits wiring that up in actual DTS (WIP, hashes may change).

Zyxel XMG1915-10EP (UART with Realtek PSE silicon):
https://svanheule.net/switches/xmg1915-10ep
https://github.com/jonasjelonek/openwrt/commit/d173e64730a511e04b68271289be23ae4e98a02f

Zyxel XS1930-12HP (SMBus with Realtek PSE silicon):
https://www.zyxel.com/de/de/products/switch/10-12-port-10g-multi-gigabit-lite-l3-smart-managed-switch-xs1930-series
https://github.com/jonasjelonek/openwrt/commit/74339c9a002032fc204b6b1fe07af259d8f51787

Zyxel GS1900-10HPv1 (UART with Broadcom PSE silicon):
https://svanheule.net/switches/gs1900-10hp

Linksys LGS328MPC (I2C raw, not SMBus, with Realtek PSE silicon):
https://support.linksys.com/kb/article/5133-en/

(mostly Zyxel devices but that's just the main devices I work with)

> Cheers,
> Conor.
>
>
>> [...]
>>

Best regards,
Jonas
